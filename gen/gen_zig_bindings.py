import yaml, pprint, re, inflect

def underscore_to_type(name):
    words = name.split("_")

    for i in range(len(words)):
        words[i] = words[i].title()

    return "".join(words)

def underscore_to_function(name):
    words = name.split("_")

    for i in range(1, len(words)):
        words[i] = words[i].title()

    return "".join(words)

def sanitize_name(name):
    substitutions = {
        "undefined": "undef",
        "error": "err",
        "opaque": "opaq",
        "null": "nil"
    }

    if name in substitutions.keys():
        return substitutions[name]

    return name

def translate_typename(name):
    primitive_types = {
        "bool": "bool",
        "c_void": "anyopaque",
        "float32": "f32",
        "float64": "f64",
        "int32": "i32",
        "uint16": "u16",
        "uint32": "u32",
        "uint64": "u64",
        "usize": "usize",
        "string": "[*:0]u8"
    }

    if name in primitive_types.keys():
        return primitive_types[name]

    m = re.search("(bitflag|enum|function_type|object|struct).(.*)", name)
    if m != None:
        return underscore_to_type(m.group(2))

    raise Exception(f"Unknown type {name}")

def translate_typename_struct(name):
    primitive_types = {
        "bool": "u32",
        "c_void": "anyopaque",
        "float32": "f32",
        "float64": "f64",
        "int32": "i32",
        "uint16": "u16",
        "uint32": "u32",
        "uint64": "u64",
        "usize": "usize",
        "string": "[*:0]u8"
    }

    if name in primitive_types.keys():
        return primitive_types[name]

    m = re.search("(bitflag|enum|function_type|object|struct).(.*)", name)
    if m != None:
        return underscore_to_type(m.group(2))

    raise Exception(f"Unknown type {name}")

def translate_arg(arg):
    m = re.search("array<(.*)>", arg['type'])
    if m != None:
        match arg.get("pointer", ""):
            case "immutable":
                return f"{arg['name']}: []const {translate_typename(m.group(1))}"
            case "mutable":
                return f"{arg['name']}: []{translate_typename(m.group(1))}"
            case _:
                raise Exception(f"No pointer in array argument: {arg}")

    type_prefix = ""

    if arg.get("optional", False):
        type_prefix += "?"

    if "pointer" in arg.keys() and arg["type"] != "String":
        if arg["pointer"] == "immutable":
            type_prefix += "*const "
        else:
            type_prefix += "*"

    return f"{arg['name']}: {type_prefix}{translate_typename(arg['type'])}"


inflect_engine = inflect.engine()

with open("gen/webgpu.yml") as stream:
    webgpu_cfg = yaml.safe_load(stream)

structs = {}
for struct in webgpu_cfg["structs"]:
    structs[struct["name"]] = struct

with open("gen/webgpu.zig", "w") as stream:
    stream.write("""const std = @import("std");
const c = @cImport({
    @cInclude("webgpu.h");
    @cInclude("wgpu.h");
});

""")

    for constant in webgpu_cfg["constants"]:
        constant_name = constant["name"]

        if constant["value"] == "uint32_max":
            stream.write(f"pub const {constant_name} = std.math.maxInt(u32);\n")
        elif constant["value"] == "uint64_max":
            stream.write(f"pub const {constant_name} = std.math.maxInt(u64);\n")
        elif constant["value"] == "usize_max":
            stream.write(f"pub const {constant_name} = std.math.maxInt(usize);\n")
        else:
            raise Exception(f"Unknow constant value {constant['value']}")

    stream.write("\n")

    for enum in webgpu_cfg["enums"]:
        enum_name = underscore_to_type(enum["name"])

        stream.write(f"pub const {enum_name} = enum(u32) {{\n")

        for entry in enum["entries"]:
            if entry['name'][0].isnumeric():
                stream.write(f"    _{sanitize_name(entry['name'])},\n")
            else:
                stream.write(f"    {sanitize_name(entry['name'])},\n")

        stream.write("};\n\n")

    for bitflag in webgpu_cfg["bitflags"]:
        bitflag_name = underscore_to_type(bitflag["name"])

        stream.write(f"pub const {bitflag_name} = packed struct {{\n")

        for i, entry in enumerate(bitflag["entries"][1:]):
            stream.write(f"    {sanitize_name(entry['name'])}: u1 = 0,\n")

        stream.write(f"    _padding: u{32 - len(bitflag['entries'][1:])} = 0,\n")

        stream.write("};\n\n")

    for function_type in webgpu_cfg["function_types"]:
        function_type_name = underscore_to_type(function_type["name"])

        args_string = []
        for arg in function_type["args"]:
            args_string.append(translate_arg(arg))

        stream.write(f"const {function_type_name} = *const fn ({', '.join(args_string)}) callconv(.C) void;\n\n")

    stream.write("""pub const ChainedStruct = extern struct {
    next: ?*const ChainedStruct = null,
    s_type: SType,
};

pub const ChainedStructOut = extern struct {
    next: ?*ChainedStructOut = null,
    s_type: SType,
};

""")

    for struct in webgpu_cfg["structs"]:
        struct_name = underscore_to_type(struct["name"])

        stream.write(f"pub const {struct_name} = extern struct {{\n")

        match struct["type"]:
            case "base_in":
                stream.write("    next_in_chain: ?*const ChainedStruct = null,\n")
            case "extension_in":
                stream.write("    chain: ChainedStruct,\n")
            case "base_out":
                stream.write("    next_in_chain: ?*ChainedStructOut = null,\n")
            case "extension_out":
                stream.write("    chain: ChainedStructOut,\n")
            case "standalone":
                pass
            case _:
                raise Exception(F"Unknown struct type {struct['type']}")

        for member in struct.get("members", []):
            m = re.search("array<(.*)>", member["type"])

            if m != None:
                words = member['name'].split("_")
                words[-1] = inflect_engine.singular_noun(words[-1])
                words.append("count")

                stream.write(f"    {'_'.join(words)}: usize = 0,\n")
                stream.write(f"    {member['name']}: ?*const {translate_typename_struct(m.group(1))} = null,\n")
            elif member["type"] == "string":
                stream.write(f"    {member['name']}: [*:0]const u8 = \"\",\n")
            else:
                type_prefix = ""

                if member.get("optional", False):
                    type_prefix += "?"

                if "pointer" in member.keys() and arg["type"] != "String":
                        if member["pointer"] == "immutable":
                            type_prefix += "*const "
                        else:
                            type_prefix += "*"

                if member.get("optional", False):
                    stream.write(f"    {member['name']}: {type_prefix}{translate_typename_struct(member['type'])} = null,\n")
                else:
                    stream.write(f"    {member['name']}: {type_prefix}{translate_typename_struct(member['type'])},\n")

        stream.write("};\n\n")

    for obj in webgpu_cfg["objects"]:
        obj_name = underscore_to_type(obj["name"])

        stream.write(f"pub const {obj_name} = *{obj_name}Handle;\n")
        stream.write(f"pub const {obj_name}Handle = opaque {{\n")

        for method in obj["methods"]:
            c_function_name = underscore_to_function("wgpu_" + obj["name"] + '_' + method["name"])
            method_lines = []

            if "returns_async" in method.keys():
                ret_type = [translate_typename(ret["type"]) for ret in method["returns_async"]]

                args_string = ["self: *@This()"]
                for arg in method.get("args", []):
                    args_string.append(translate_arg(arg))

                stream.write(f"\n    const {underscore_to_type(method['name'] + '_callback')} = fn ({', '.join(ret_type + ['?*anyopaque'])}) callconv(.C) void;\n")
                args_string.append(f"callback: {underscore_to_type(method['name'] + '_callback')}")
                args_string.append(f"user_data: ?*anyopaque")

                c_exprs = ["@ptrCast(self)"]
                for arg in method.get("args", []):
                    if arg['type'].startswith("object"):
                        c_exprs.append(f"@ptrCast({arg['name']})")
                    elif arg['type'].startswith("function"):
                        c_exprs.append(f"@ptrCast(&{arg['name']})")
                    elif arg['type'].startswith("array"):
                        c_exprs.append(f"{arg['name']}.len")
                        c_exprs.append(f"{arg['name']}.ptr")
                    elif "pointer" in arg.keys():
                        c_exprs.append(f"@ptrCast({arg['name']})")
                    elif arg['type'].startswith("bitflag") or arg['type'].startswith("enum"):
                        c_exprs.append(f"@bitCast({arg['name']})")
                    elif arg['type'] in ["usize", "uint64", "uint32", "int32", "float32"]:
                        c_exprs.append(f"@bitCast({arg['name']})")
                    elif arg['type'] == "string":
                        c_exprs.append(f"{arg['name']}")
                    else:
                        raise Exception(f"Unexpected arg type: {arg}")

                c_exprs += ["@ptrCast(&callback)", "@ptrCast(user_data)"]

                method_name = underscore_to_function(method['name'])
                stream.write(f"    pub inline fn {method_name}({', '.join(args_string)}) void {{\n")
                stream.write(f"        c.{c_function_name}({', '.join(c_exprs)});\n")
                stream.write(f"    }}\n")
            else:
                args_string = ["self: *@This()"]
                for arg in method.get("args", []):
                    args_string.append(translate_arg(arg))

                c_exprs = ["@ptrCast(self)"]
                for arg in method.get("args", []):
                    if arg['type'].startswith("object"):
                        c_exprs.append(f"@ptrCast({arg['name']})")
                    elif arg['type'].startswith("function"):
                        c_exprs.append(f"@ptrCast(&{arg['name']})")
                    elif arg['type'].startswith("array"):
                        c_exprs.append(f"{arg['name']}.len")
                        c_exprs.append(f"@ptrCast({arg['name']}.ptr)")
                    elif "pointer" in arg.keys():
                        c_exprs.append(f"@ptrCast({arg['name']})")
                    elif arg['type'].startswith("bitflag") or arg['type'].startswith("enum"):
                        c_exprs.append(f"@bitCast({arg['name']})")
                    elif arg['type'] in ["usize", "uint64", "uint32", "int32", "float32"]:
                        c_exprs.append(f"{arg['name']}")
                    elif arg['type'] == "string":
                        c_exprs.append(f"{arg['name']}")
                    else:
                        raise Exception(f"Unexpected arg type: {arg}")

                if "returns" in method.keys():
                    match method["returns"].get("pointer", ""):
                        case "":
                            ret_type = translate_typename(method["returns"]["type"])
                        case "immutable":
                            if method["returns"]["type"].startswith("array"):
                                ret_type = f"[]const {translate_typename(method['returns']['type'])}"
                            else:
                                ret_type = f"*const {translate_typename(method['returns']['type'])}"
                        case "mutable":
                            if method["returns"]["type"].startswith("array"):
                                ret_type = f"[]{translate_typename(method['returns']['type'])}"
                            else:
                                ret_type = f"*{translate_typename(method['returns']['type'])}"

                    stream.write(f"\n    pub inline fn {underscore_to_function(method['name'])}({', '.join(args_string)}) {ret_type} {{\n")

                    for line in method_lines:
                        stream.write(line)

                    ret_expr = f"c.{c_function_name}({', '.join(c_exprs)})"

                    if method["returns"]["type"].startswith("object"):
                        stream.write(f"        return @ptrCast({ret_expr});\n")
                    elif method["returns"]["type"].startswith("bitflag") or method["returns"]["type"].startswith("enum"):
                        stream.write(f"        return @bitCast({ret_expr});\n")
                    elif method["returns"]["type"] in ["usize", "uint64", "uint32"]:
                        stream.write(f"        return @bitCast({ret_expr});\n")
                    elif method["returns"]["type"] == "bool":
                        stream.write(f"        return {ret_expr} != 0;\n")
                    elif method["returns"]["type"] == "c_void":
                        stream.write(f"        return @ptrCast({ret_expr});\n")
                    else:
                        pprint.pprint(method)
                        raise Exception(f"Unexpected ret type: {method['returns']}")
                else:
                    ret_type = "void"
                    method_name = underscore_to_function(method['name'])
                    stream.write(f"\n    pub inline fn {method_name}({', '.join(args_string)}) {ret_type} {{\n")

                    for line in method_lines:
                        stream.write(line)

                    stream.write(f"        c.{c_function_name}({', '.join(c_exprs)});\n")
                stream.write("    }\n")

        stream.write("\n    pub inline fn release(this: *@This()) void {\n")
        stream.write(f"        c.wgpu{obj_name}Release(@ptrCast(this));\n")
        stream.write("    }\n")

        stream.write("};\n\n")

    for function in webgpu_cfg["functions"]:
        function_name = underscore_to_function(function["name"])
        c_function_name = underscore_to_function("wgpu_" + function["name"])
        ret_type = translate_typename(function["returns"]["type"])

        args_string = []
        for arg in function["args"]:
            args_string.append(translate_arg(arg))

        stream.write(f"pub fn {function_name}({', '.join(args_string)}) {ret_type} {{\n")

        c_exprs = []
        for arg in function["args"]:
            if arg['type'].startswith("object"):
                c_exprs.append(f"@ptrCast({arg['name']})")
            elif "pointer" in arg.keys():
                c_exprs.append(f"@ptrCast({arg['name']})")
            else:
                raise Exception(f"Unexpected arg type: {arg}")

        ret_expr = f"c.{c_function_name}({', '.join(c_exprs)})"
        if function["returns"]["type"].startswith("object"):
            stream.write(f"    return @ptrCast({ret_expr});\n")
        else:
            raise Exception(f"Unexpected ret type: {function['returns']}")

        stream.write("}\n")
