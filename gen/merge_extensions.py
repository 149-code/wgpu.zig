from pprint import pprint

with open("gen/webgpu.zig", "r") as f:
    webgpu_file = f.read()

with open("gen/wgpu_extentions.zig", "r") as f:
    extension_file = f.read()

webgpu_lines = webgpu_file.split("\n")
extension_chunks = extension_file.split("\n\n")

for chunk in extension_chunks:
    if chunk.startswith("pub const"):
        webgpu_lines.append("")
        for line in chunk.split("\n"):
            webgpu_lines.append(line)

    elif chunk.startswith("//"):
        lines = chunk.split("\n")
        object_name = lines[0][3:]

        if object_name == "Global":
            webgpu_lines.append("")
            for line in chunk.split("\n")[1:]:
                webgpu_lines.append(line)
        else:
            object_index = -1
            for index, val in enumerate(webgpu_lines):
                if val.startswith(f"pub const {object_name}Impl "):
                    object_index = index

            if object_index == -1:
                raise Exception(f"Unknown object {object_name}")

            for index, line in enumerate(chunk.split("\n")[1:] + [""]):
                webgpu_lines.insert(object_index + index + 1, "    " + line)

with open("webgpu.zig", "w") as f:
    f.write("\n".join(webgpu_lines))
