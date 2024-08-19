const std = @import("std");
const c = @cImport({
    @cInclude("webgpu.h");
    @cInclude("wgpu.h");
});

pub const array_layer_count_undefined = std.math.maxInt(u32);
pub const copy_stride_undefined = std.math.maxInt(u32);
pub const depth_slice_undefined = std.math.maxInt(u32);
pub const limit_u32_undefined = std.math.maxInt(u32);
pub const limit_u64_undefined = std.math.maxInt(u64);
pub const mip_level_count_undefined = std.math.maxInt(u32);
pub const query_set_index_undefined = std.math.maxInt(u32);
pub const whole_map_size = std.math.maxInt(usize);
pub const whole_size = std.math.maxInt(u64);

pub const RequestAdapterStatus = enum(u32) {
    success = 0,
    unavailable = 1,
    err = 2,
    unknown = 3,
};

pub const AdapterType = enum(u32) {
    discrete_GPU = 0,
    integrated_GPU = 1,
    CPU = 2,
    unknown = 3,
};

pub const AddressMode = enum(u32) {
    repeat = 0,
    mirror_repeat = 1,
    clamp_to_edge = 2,
};

pub const BackendType = enum(u32) {
    undef = 0,
    nil = 1,
    WebGPU = 2,
    D3D11 = 3,
    D3D12 = 4,
    metal = 5,
    vulkan = 6,
    openGL = 7,
    openGLES = 8,
};

pub const BufferBindingType = enum(u32) {
    undef = 0,
    uniform = 1,
    storage = 2,
    read_only_storage = 3,
};

pub const SamplerBindingType = enum(u32) {
    undef = 0,
    filtering = 1,
    non_filtering = 2,
    comparison = 3,
};

pub const TextureSampleType = enum(u32) {
    undef = 0,
    float = 1,
    unfilterable_float = 2,
    depth = 3,
    sint = 4,
    uint = 5,
};

pub const StorageTextureAccess = enum(u32) {
    undef = 0,
    write_only = 1,
    read_only = 2,
    read_write = 3,
};

pub const BlendFactor = enum(u32) {
    zero = 0,
    one = 1,
    src = 2,
    one_minus_src = 3,
    src_alpha = 4,
    one_minus_src_alpha = 5,
    dst = 6,
    one_minus_dst = 7,
    dst_alpha = 8,
    one_minus_dst_alpha = 9,
    src_alpha_saturated = 10,
    constant = 11,
    one_minus_constant = 12,
};

pub const BlendOperation = enum(u32) {
    add = 0,
    subtract = 1,
    reverse_subtract = 2,
    min = 3,
    max = 4,
};

pub const BufferMapAsyncStatus = enum(u32) {
    success = 0,
    validation_error = 1,
    unknown = 2,
    device_lost = 3,
    destroyed_before_callback = 4,
    unmapped_before_callback = 5,
    mapping_already_pending = 6,
    offset_out_of_range = 7,
    size_out_of_range = 8,
};

pub const BufferMapState = enum(u32) {
    unmapped = 0,
    pending = 1,
    mapped = 2,
};

pub const CompareFunction = enum(u32) {
    undef = 0,
    never = 1,
    less = 2,
    less_equal = 3,
    greater = 4,
    greater_equal = 5,
    equal = 6,
    not_equal = 7,
    always = 8,
};

pub const CompilationInfoRequestStatus = enum(u32) {
    success = 0,
    err = 1,
    device_lost = 2,
    unknown = 3,
};

pub const CompilationMessageType = enum(u32) {
    err = 0,
    warning = 1,
    info = 2,
};

pub const CompositeAlphaMode = enum(u32) {
    auto = 0,
    opaq = 1,
    premultiplied = 2,
    unpremultiplied = 3,
    inherit = 4,
};

pub const CreatePipelineAsyncStatus = enum(u32) {
    success = 0,
    validation_error = 1,
    internal_error = 2,
    device_lost = 3,
    device_destroyed = 4,
    unknown = 5,
};

pub const CullMode = enum(u32) {
    none = 0,
    front = 1,
    back = 2,
};

pub const DeviceLostReason = enum(u32) {
    undef = 0,
    destroyed = 1,
};

pub const ErrorFilter = enum(u32) {
    validation = 0,
    out_of_memory = 1,
    internal = 2,
};

pub const ErrorType = enum(u32) {
    no_error = 0,
    validation = 1,
    out_of_memory = 2,
    internal = 3,
    unknown = 4,
    device_lost = 5,
};

pub const FeatureName = enum(u32) {
    undef = 0,
    depth_clip_control = 1,
    depth32_float_stencil8 = 2,
    timestamp_query = 3,
    texture_compression_BC = 4,
    texture_compression_ETC2 = 5,
    texture_compression_ASTC = 6,
    indirect_first_instance = 7,
    shader_f16 = 8,
    RG11B10_ufloat_renderable = 9,
    BGRA8_unorm_storage = 10,
    float32_filterable = 11,
};

pub const FilterMode = enum(u32) {
    nearest = 0,
    linear = 1,
};

pub const FrontFace = enum(u32) {
    CCW = 0,
    CW = 1,
};

pub const IndexFormat = enum(u32) {
    undef = 0,
    uint16 = 1,
    uint32 = 2,
};

pub const VertexStepMode = enum(u32) {
    vertex = 0,
    instance = 1,
    vertex_buffer_not_used = 2,
};

pub const LoadOp = enum(u32) {
    undef = 0,
    clear = 1,
    load = 2,
};

pub const MipmapFilterMode = enum(u32) {
    nearest = 0,
    linear = 1,
};

pub const StoreOp = enum(u32) {
    undef = 0,
    store = 1,
    discard = 2,
};

pub const PowerPreference = enum(u32) {
    undef = 0,
    low_power = 1,
    high_performance = 2,
};

pub const PresentMode = enum(u32) {
    fifo = 0,
    fifo_relaxed = 1,
    immediate = 2,
    mailbox = 3,
};

pub const PrimitiveTopology = enum(u32) {
    point_list = 0,
    line_list = 1,
    line_strip = 2,
    triangle_list = 3,
    triangle_strip = 4,
};

pub const QueryType = enum(u32) {
    occlusion = 0,
    timestamp = 1,
};

pub const QueueWorkDoneStatus = enum(u32) {
    success = 0,
    err = 1,
    unknown = 2,
    device_lost = 3,
};

pub const RequestDeviceStatus = enum(u32) {
    success = 0,
    err = 1,
    unknown = 2,
};

pub const StencilOperation = enum(u32) {
    keep = 0,
    zero = 1,
    replace = 2,
    invert = 3,
    increment_clamp = 4,
    decrement_clamp = 5,
    increment_wrap = 6,
    decrement_wrap = 7,
};

pub const SType = enum(u32) {
    invalid = 0,
    surface_descriptor_from_metal_layer = 1,
    surface_descriptor_from_windows_HWND = 2,
    surface_descriptor_from_xlib_window = 3,
    surface_descriptor_from_canvas_HTML_selector = 4,
    shader_module_SPIRV_descriptor = 5,
    shader_module_WGSL_descriptor = 6,
    primitive_depth_clip_control = 7,
    surface_descriptor_from_wayland_surface = 8,
    surface_descriptor_from_android_native_window = 9,
    surface_descriptor_from_xcb_window = 10,
    render_pass_descriptor_max_draw_count = 11,
};

pub const SurfaceGetCurrentTextureStatus = enum(u32) {
    success = 0,
    timeout = 1,
    outdated = 2,
    lost = 3,
    out_of_memory = 4,
    device_lost = 5,
};

pub const TextureAspect = enum(u32) {
    all = 0,
    stencil_only = 1,
    depth_only = 2,
};

pub const TextureDimension = enum(u32) {
    _1D = 0,
    _2D = 1,
    _3D = 2,
};

pub const TextureFormat = enum(u32) {
    undef = 0,
    R8_unorm = 1,
    R8_snorm = 2,
    R8_uint = 3,
    R8_sint = 4,
    R16_uint = 5,
    R16_sint = 6,
    R16_float = 7,
    RG8_unorm = 8,
    RG8_snorm = 9,
    RG8_uint = 10,
    RG8_sint = 11,
    R32_float = 12,
    R32_uint = 13,
    R32_sint = 14,
    RG16_uint = 15,
    RG16_sint = 16,
    RG16_float = 17,
    RGBA8_unorm = 18,
    RGBA8_unorm_srgb = 19,
    RGBA8_snorm = 20,
    RGBA8_uint = 21,
    RGBA8_sint = 22,
    BGRA8_unorm = 23,
    BGRA8_unorm_srgb = 24,
    RGB10_A2_uint = 25,
    RGB10_A2_unorm = 26,
    RG11_B10_ufloat = 27,
    RGB9_E5_ufloat = 28,
    RG32_float = 29,
    RG32_uint = 30,
    RG32_sint = 31,
    RGBA16_uint = 32,
    RGBA16_sint = 33,
    RGBA16_float = 34,
    RGBA32_float = 35,
    RGBA32_uint = 36,
    RGBA32_sint = 37,
    stencil8 = 38,
    depth16_unorm = 39,
    depth24_plus = 40,
    depth24_plus_stencil8 = 41,
    depth32_float = 42,
    depth32_float_stencil8 = 43,
    BC1_RGBA_unorm = 44,
    BC1_RGBA_unorm_srgb = 45,
    BC2_RGBA_unorm = 46,
    BC2_RGBA_unorm_srgb = 47,
    BC3_RGBA_unorm = 48,
    BC3_RGBA_unorm_srgb = 49,
    BC4_R_unorm = 50,
    BC4_R_snorm = 51,
    BC5_RG_unorm = 52,
    BC5_RG_snorm = 53,
    BC6H_RGB_ufloat = 54,
    BC6H_RGB_float = 55,
    BC7_RGBA_unorm = 56,
    BC7_RGBA_unorm_srgb = 57,
    ETC2_RGB8_unorm = 58,
    ETC2_RGB8_unorm_srgb = 59,
    ETC2_RGB8A1_unorm = 60,
    ETC2_RGB8A1_unorm_srgb = 61,
    ETC2_RGBA8_unorm = 62,
    ETC2_RGBA8_unorm_srgb = 63,
    EAC_R11_unorm = 64,
    EAC_R11_snorm = 65,
    EAC_RG11_unorm = 66,
    EAC_RG11_snorm = 67,
    ASTC_4x4_unorm = 68,
    ASTC_4x4_unorm_srgb = 69,
    ASTC_5x4_unorm = 70,
    ASTC_5x4_unorm_srgb = 71,
    ASTC_5x5_unorm = 72,
    ASTC_5x5_unorm_srgb = 73,
    ASTC_6x5_unorm = 74,
    ASTC_6x5_unorm_srgb = 75,
    ASTC_6x6_unorm = 76,
    ASTC_6x6_unorm_srgb = 77,
    ASTC_8x5_unorm = 78,
    ASTC_8x5_unorm_srgb = 79,
    ASTC_8x6_unorm = 80,
    ASTC_8x6_unorm_srgb = 81,
    ASTC_8x8_unorm = 82,
    ASTC_8x8_unorm_srgb = 83,
    ASTC_10x5_unorm = 84,
    ASTC_10x5_unorm_srgb = 85,
    ASTC_10x6_unorm = 86,
    ASTC_10x6_unorm_srgb = 87,
    ASTC_10x8_unorm = 88,
    ASTC_10x8_unorm_srgb = 89,
    ASTC_10x10_unorm = 90,
    ASTC_10x10_unorm_srgb = 91,
    ASTC_12x10_unorm = 92,
    ASTC_12x10_unorm_srgb = 93,
    ASTC_12x12_unorm = 94,
    ASTC_12x12_unorm_srgb = 95,
};

pub const TextureViewDimension = enum(u32) {
    undef = 0,
    _1D = 1,
    _2D = 2,
    _2D_array = 3,
    cube = 4,
    cube_array = 5,
    _3D = 6,
};

pub const VertexFormat = enum(u32) {
    undef = 0,
    uint8x2 = 1,
    uint8x4 = 2,
    sint8x2 = 3,
    sint8x4 = 4,
    unorm8x2 = 5,
    unorm8x4 = 6,
    snorm8x2 = 7,
    snorm8x4 = 8,
    uint16x2 = 9,
    uint16x4 = 10,
    sint16x2 = 11,
    sint16x4 = 12,
    unorm16x2 = 13,
    unorm16x4 = 14,
    snorm16x2 = 15,
    snorm16x4 = 16,
    float16x2 = 17,
    float16x4 = 18,
    float32 = 19,
    float32x2 = 20,
    float32x3 = 21,
    float32x4 = 22,
    uint32 = 23,
    uint32x2 = 24,
    uint32x3 = 25,
    uint32x4 = 26,
    sint32 = 27,
    sint32x2 = 28,
    sint32x3 = 29,
    sint32x4 = 30,
};

pub const WgslFeatureName = enum(u32) {
    undef = 0,
    readonly_and_readwrite_storage_textures = 1,
    packed4x8_integer_dot_product = 2,
    unrestricted_pointer_parameters = 3,
    pointer_composite_access = 4,
};

pub const BufferUsage = packed struct {
    map_read: u1 = 0,
    map_write: u1 = 0,
    copy_src: u1 = 0,
    copy_dst: u1 = 0,
    index: u1 = 0,
    vertex: u1 = 0,
    uniform: u1 = 0,
    storage: u1 = 0,
    indirect: u1 = 0,
    query_resolve: u1 = 0,
    _padding: u22 = 0,
};

pub const ColorWriteMask = packed struct {
    red: u1 = 0,
    green: u1 = 0,
    blue: u1 = 0,
    alpha: u1 = 0,
    _padding: u28 = 0,
};

pub const MapMode = packed struct {
    read: u1 = 0,
    write: u1 = 0,
    _padding: u30 = 0,
};

pub const ShaderStage = packed struct {
    vertex: u1 = 0,
    fragment: u1 = 0,
    compute: u1 = 0,
    _padding: u29 = 0,
};

pub const TextureUsage = packed struct {
    copy_src: u1 = 0,
    copy_dst: u1 = 0,
    texture_binding: u1 = 0,
    storage_binding: u1 = 0,
    render_attachment: u1 = 0,
    _padding: u27 = 0,
};

const DeviceLostCallback = *const fn (reason: DeviceLostReason, message: [*:0]u8, userdata: *anyopaque) callconv(.C) void;

const ErrorCallback = *const fn (type: ErrorType, message: [*:0]u8, userdata: *anyopaque) callconv(.C) void;

pub const ChainedStruct = extern struct {
    next: ?*const ChainedStruct = null,
    s_type: SType,
};

pub const ChainedStructOut = extern struct {
    next: ?*ChainedStructOut = null,
    s_type: SType,
};

pub const RequestAdapterOptions = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    compatible_surface: ?Surface = null,
    power_preference: PowerPreference,
    backend_type: BackendType,
    force_fallback_adapter: u32,
};

pub const AdapterInfo = extern struct {
    vendor: [*:0]const u8 = "",
    architecture: [*:0]const u8 = "",
    device: [*:0]const u8 = "",
    description: [*:0]const u8 = "",
};

pub const AdapterProperties = extern struct {
    next_in_chain: ?*ChainedStructOut = null,
    vendor_ID: u32,
    vendor_name: [*:0]const u8 = "",
    architecture: [*:0]const u8 = "",
    device_ID: u32,
    name: [*:0]const u8 = "",
    driver_description: [*:0]const u8 = "",
    adapter_type: AdapterType,
    backend_type: BackendType,
};

pub const DeviceDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    required_feature_count: usize = 0,
    required_features: ?[*]const FeatureName = null,
    required_limits: ?*const RequiredLimits = null,
    default_queue: QueueDescriptor,
    device_lost_callback: DeviceLostCallback,
    device_lost_userdata: *anyopaque,
};

pub const BindGroupEntry = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    binding: u32,
    buffer: ?Buffer = null,
    offset: u64,
    size: u64,
    sampler: ?Sampler = null,
    texture_view: ?TextureView = null,
};

pub const BindGroupDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    layout: BindGroupLayout,
    entry_count: usize = 0,
    entries: ?[*]const BindGroupEntry = null,
};

pub const BufferBindingLayout = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    type: BufferBindingType,
    has_dynamic_offset: u32,
    min_binding_size: u64,
};

pub const SamplerBindingLayout = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    type: SamplerBindingType,
};

pub const TextureBindingLayout = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    sample_type: TextureSampleType,
    view_dimension: TextureViewDimension,
    multisampled: u32,
};

pub const SurfaceCapabilities = extern struct {
    next_in_chain: ?*ChainedStructOut = null,
    format_count: usize = 0,
    formats: ?[*]const TextureFormat = null,
    present_mode_count: usize = 0,
    present_modes: ?[*]const PresentMode = null,
    alpha_mode_count: usize = 0,
    alpha_modes: ?[*]const CompositeAlphaMode = null,
};

pub const SurfaceConfiguration = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    device: Device,
    format: TextureFormat,
    usage: TextureUsage,
    view_format_count: usize = 0,
    view_formats: ?[*]const TextureFormat = null,
    alpha_mode: CompositeAlphaMode,
    width: u32,
    height: u32,
    present_mode: PresentMode,
};

pub const StorageTextureBindingLayout = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    access: StorageTextureAccess,
    format: TextureFormat,
    view_dimension: TextureViewDimension,
};

pub const BindGroupLayoutEntry = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    binding: u32,
    visibility: ShaderStage,
    buffer: BufferBindingLayout,
    sampler: SamplerBindingLayout,
    texture: TextureBindingLayout,
    storage_texture: StorageTextureBindingLayout,
};

pub const BindGroupLayoutDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    entry_count: usize = 0,
    entries: ?[*]const BindGroupLayoutEntry = null,
};

pub const BlendComponent = extern struct {
    operation: BlendOperation,
    src_factor: BlendFactor,
    dst_factor: BlendFactor,
};

pub const BufferDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    usage: BufferUsage,
    size: u64,
    mapped_at_creation: u32,
};

pub const Color = extern struct {
    r: f64,
    g: f64,
    b: f64,
    a: f64,
};

pub const ConstantEntry = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    key: [*:0]const u8 = "",
    value: f64,
};

pub const CommandBufferDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
};

pub const CommandEncoderDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
};

pub const CompilationInfo = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    message_count: usize = 0,
    messages: ?[*]const CompilationMessage = null,
};

pub const CompilationMessage = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    message: [*:0]const u8 = "",
    type: CompilationMessageType,
    line_num: u64,
    line_pos: u64,
    offset: u64,
    length: u64,
    utf16_line_pos: u64,
    utf16_offset: u64,
    utf16_length: u64,
};

pub const ComputePassDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    timestamp_writes: ?*const ComputePassTimestampWrites = null,
};

pub const ComputePassTimestampWrites = extern struct {
    query_set: QuerySet,
    beginning_of_pass_write_index: u32,
    end_of_pass_write_index: u32,
};

pub const ComputePipelineDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    layout: ?PipelineLayout = null,
    compute: ProgrammableStageDescriptor,
};

pub const Limits = extern struct {
    max_texture_dimension_1D: u32,
    max_texture_dimension_2D: u32,
    max_texture_dimension_3D: u32,
    max_texture_array_layers: u32,
    max_bind_groups: u32,
    max_bind_groups_plus_vertex_buffers: u32,
    max_bindings_per_bind_group: u32,
    max_dynamic_uniform_buffers_per_pipeline_layout: u32,
    max_dynamic_storage_buffers_per_pipeline_layout: u32,
    max_sampled_textures_per_shader_stage: u32,
    max_samplers_per_shader_stage: u32,
    max_storage_buffers_per_shader_stage: u32,
    max_storage_textures_per_shader_stage: u32,
    max_uniform_buffers_per_shader_stage: u32,
    max_uniform_buffer_binding_size: u64,
    max_storage_buffer_binding_size: u64,
    min_uniform_buffer_offset_alignment: u32,
    min_storage_buffer_offset_alignment: u32,
    max_vertex_buffers: u32,
    max_buffer_size: u64,
    max_vertex_attributes: u32,
    max_vertex_buffer_array_stride: u32,
    max_inter_stage_shader_components: u32,
    max_inter_stage_shader_variables: u32,
    max_color_attachments: u32,
    max_color_attachment_bytes_per_sample: u32,
    max_compute_workgroup_storage_size: u32,
    max_compute_invocations_per_workgroup: u32,
    max_compute_workgroup_size_x: u32,
    max_compute_workgroup_size_y: u32,
    max_compute_workgroup_size_z: u32,
    max_compute_workgroups_per_dimension: u32,
};

pub const RequiredLimits = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    limits: Limits,
};

pub const SupportedLimits = extern struct {
    next_in_chain: ?*ChainedStructOut = null,
    limits: Limits,
};

pub const Extent3D = extern struct {
    width: u32,
    height: u32,
    depth_or_array_layers: u32,
};

pub const ImageCopyBuffer = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    layout: TextureDataLayout,
    buffer: Buffer,
};

pub const ImageCopyTexture = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    texture: Texture,
    mip_level: u32,
    origin: Origin3D,
    aspect: TextureAspect,
};

pub const InstanceDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
};

pub const VertexAttribute = extern struct {
    format: VertexFormat,
    offset: u64,
    shader_location: u32,
};

pub const VertexBufferLayout = extern struct {
    array_stride: u64,
    step_mode: VertexStepMode,
    attribute_count: usize = 0,
    attributes: ?[*]const VertexAttribute = null,
};

pub const Origin3D = extern struct {
    x: u32,
    y: u32,
    z: u32,
};

pub const PipelineLayoutDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    bind_group_layout_count: usize = 0,
    bind_group_layouts: ?[*]const BindGroupLayout = null,
};

pub const ProgrammableStageDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    module: ShaderModule,
    entry_point: [*:0]const u8 = "",
    constant_count: usize = 0,
    constants: ?[*]const ConstantEntry = null,
};

pub const QuerySetDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    type: QueryType,
    count: u32,
};

pub const QueueDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
};

pub const RenderBundleDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
};

pub const RenderBundleEncoderDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    color_format_count: usize = 0,
    color_formats: ?[*]const TextureFormat = null,
    depth_stencil_format: TextureFormat,
    sample_count: u32,
    depth_read_only: u32,
    stencil_read_only: u32,
};

pub const RenderPassColorAttachment = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    view: ?TextureView = null,
    depth_slice: u32,
    resolve_target: ?TextureView = null,
    load_op: LoadOp,
    store_op: StoreOp,
    clear_value: Color,
};

pub const RenderPassDepthStencilAttachment = extern struct {
    view: TextureView,
    depth_load_op: LoadOp,
    depth_store_op: StoreOp,
    depth_clear_value: f32,
    depth_read_only: u32,
    stencil_load_op: LoadOp,
    stencil_store_op: StoreOp,
    stencil_clear_value: u32,
    stencil_read_only: u32,
};

pub const RenderPassDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    color_attachment_count: usize = 0,
    color_attachments: ?[*]const RenderPassColorAttachment = null,
    depth_stencil_attachment: ?*const RenderPassDepthStencilAttachment = null,
    occlusion_query_set: ?QuerySet = null,
    timestamp_writes: ?*const RenderPassTimestampWrites = null,
};

pub const RenderPassDescriptorMaxDrawCount = extern struct {
    chain: ChainedStruct,
    max_draw_count: u64,
};

pub const RenderPassTimestampWrites = extern struct {
    query_set: QuerySet,
    beginning_of_pass_write_index: u32,
    end_of_pass_write_index: u32,
};

pub const VertexState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    module: ShaderModule,
    entry_point: [*:0]const u8 = "",
    constant_count: usize = 0,
    constants: ?[*]const ConstantEntry = null,
    buffer_count: usize = 0,
    buffers: ?[*]const VertexBufferLayout = null,
};

pub const PrimitiveState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    topology: PrimitiveTopology,
    strip_index_format: IndexFormat,
    front_face: FrontFace,
    cull_mode: CullMode,
};

pub const PrimitiveDepthClipControl = extern struct {
    chain: ChainedStruct,
    unclipped_depth: u32,
};

pub const DepthStencilState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    format: TextureFormat,
    depth_write_enabled: u32,
    depth_compare: CompareFunction,
    stencil_front: StencilFaceState,
    stencil_back: StencilFaceState,
    stencil_read_mask: u32,
    stencil_write_mask: u32,
    depth_bias: i32,
    depth_bias_slope_scale: f32,
    depth_bias_clamp: f32,
};

pub const MultisampleState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    count: u32,
    mask: u32,
    alpha_to_coverage_enabled: u32,
};

pub const FragmentState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    module: ShaderModule,
    entry_point: [*:0]const u8 = "",
    constant_count: usize = 0,
    constants: ?[*]const ConstantEntry = null,
    target_count: usize = 0,
    targets: ?[*]const ColorTargetState = null,
};

pub const ColorTargetState = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    format: TextureFormat,
    blend: ?*const BlendState = null,
    write_mask: ColorWriteMask,
};

pub const BlendState = extern struct {
    color: BlendComponent,
    alpha: BlendComponent,
};

pub const RenderPipelineDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    layout: ?PipelineLayout = null,
    vertex: VertexState,
    primitive: PrimitiveState,
    depth_stencil: ?*const DepthStencilState = null,
    multisample: MultisampleState,
    fragment: ?*const FragmentState = null,
};

pub const SamplerDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    address_mode_u: AddressMode,
    address_mode_v: AddressMode,
    address_mode_w: AddressMode,
    mag_filter: FilterMode,
    min_filter: FilterMode,
    mipmap_filter: MipmapFilterMode,
    lod_min_clamp: f32,
    lod_max_clamp: f32,
    compare: CompareFunction,
    max_anisotropy: u16,
};

pub const ShaderModuleDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    hint_count: usize = 0,
    hints: ?[*]const ShaderModuleCompilationHint = null,
};

pub const ShaderModuleCompilationHint = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    entry_point: [*:0]const u8 = "",
    layout: PipelineLayout,
};

pub const ShaderModuleSpirvDescriptor = extern struct {
    chain: ChainedStruct,
    code_size: u32,
    code: *const u32,
};

pub const ShaderModuleWgslDescriptor = extern struct {
    chain: ChainedStruct,
    code: [*:0]const u8 = "",
};

pub const StencilFaceState = extern struct {
    compare: CompareFunction,
    fail_op: StencilOperation,
    depth_fail_op: StencilOperation,
    pass_op: StencilOperation,
};

pub const SurfaceDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
};

pub const SurfaceDescriptorFromAndroidNativeWindow = extern struct {
    chain: ChainedStruct,
    window: *anyopaque,
};

pub const SurfaceDescriptorFromCanvasHtmlSelector = extern struct {
    chain: ChainedStruct,
    selector: [*:0]const u8 = "",
};

pub const SurfaceDescriptorFromMetalLayer = extern struct {
    chain: ChainedStruct,
    layer: *anyopaque,
};

pub const SurfaceDescriptorFromWindowsHwnd = extern struct {
    chain: ChainedStruct,
    hinstance: *anyopaque,
    hwnd: *anyopaque,
};

pub const SurfaceDescriptorFromXcbWindow = extern struct {
    chain: ChainedStruct,
    connection: *anyopaque,
    window: u32,
};

pub const SurfaceDescriptorFromXlibWindow = extern struct {
    chain: ChainedStruct,
    display: *anyopaque,
    window: u64,
};

pub const SurfaceDescriptorFromWaylandSurface = extern struct {
    chain: ChainedStruct,
    display: *anyopaque,
    surface: *anyopaque,
};

pub const SurfaceTexture = extern struct {
    texture: Texture,
    suboptimal: u32,
    status: SurfaceGetCurrentTextureStatus,
};

pub const TextureDataLayout = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    offset: u64,
    bytes_per_row: u32,
    rows_per_image: u32,
};

pub const TextureDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    usage: TextureUsage,
    dimension: TextureDimension,
    size: Extent3D,
    format: TextureFormat,
    mip_level_count: u32,
    sample_count: u32,
    view_format_count: usize = 0,
    view_formats: ?[*]const TextureFormat = null,
};

pub const TextureViewDescriptor = extern struct {
    next_in_chain: ?*const ChainedStruct = null,
    label: [*:0]const u8 = "",
    format: TextureFormat,
    dimension: TextureViewDimension,
    base_mip_level: u32,
    mip_level_count: u32,
    base_array_layer: u32,
    array_layer_count: u32,
    aspect: TextureAspect,
};

pub const Adapter = *AdapterImpl;
pub const AdapterImpl = opaque {

    pub inline fn getLimits(self: *@This(), limits: *SupportedLimits) bool {
        return c.wgpuAdapterGetLimits(@ptrCast(self), @ptrCast(limits)) != 0;
    }

    pub inline fn getProperties(self: *@This(), properties: *AdapterProperties) void {
        c.wgpuAdapterGetProperties(@ptrCast(self), @ptrCast(properties));
    }

    pub inline fn hasFeature(self: *@This(), feature: FeatureName) bool {
        return c.wgpuAdapterHasFeature(@ptrCast(self), @bitCast(feature)) != 0;
    }

    pub inline fn enumerateFeatures(self: *@This(), features: *FeatureName) usize {
        return @bitCast(c.wgpuAdapterEnumerateFeatures(@ptrCast(self), @ptrCast(features)));
    }

    const RequestAdapterInfoCallback = fn (AdapterInfo, ?*anyopaque) callconv(.C) void;
    pub inline fn requestAdapterInfo(self: *@This(), callback: RequestAdapterInfoCallback, user_data: ?*anyopaque) void {
        c.wgpuAdapterRequestAdapterInfo(@ptrCast(self), @ptrCast(&callback), @ptrCast(user_data));
    }

    const RequestDeviceCallback = fn (RequestDeviceStatus, Device, [*:0]u8, ?*anyopaque) callconv(.C) void;
    pub inline fn requestDevice(self: *@This(), descriptor: ?*const DeviceDescriptor, callback: RequestDeviceCallback, user_data: ?*anyopaque) void {
        c.wgpuAdapterRequestDevice(@ptrCast(self), @ptrCast(descriptor), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuAdapterRelease(@ptrCast(this));
    }
};

pub const BindGroup = *BindGroupImpl;
pub const BindGroupImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuBindGroupSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuBindGroupRelease(@ptrCast(this));
    }
};

pub const BindGroupLayout = *BindGroupLayoutImpl;
pub const BindGroupLayoutImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuBindGroupLayoutSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuBindGroupLayoutRelease(@ptrCast(this));
    }
};

pub const Buffer = *BufferImpl;
pub const BufferImpl = opaque {

    const MapAsyncCallback = fn (BufferMapAsyncStatus, ?*anyopaque) callconv(.C) void;
    pub inline fn mapAsync(self: *@This(), mode: MapMode, offset: usize, size: usize, callback: MapAsyncCallback, user_data: ?*anyopaque) void {
        c.wgpuBufferMapAsync(@ptrCast(self), @bitCast(mode), @bitCast(offset), @bitCast(size), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn getMappedRange(self: *@This(), offset: usize, size: usize) *anyopaque {
        return @ptrCast(c.wgpuBufferGetMappedRange(@ptrCast(self), offset, size));
    }

    pub inline fn getConstMappedRange(self: *@This(), offset: usize, size: usize) *const anyopaque {
        return @ptrCast(c.wgpuBufferGetConstMappedRange(@ptrCast(self), offset, size));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuBufferSetLabel(@ptrCast(self), label);
    }

    pub inline fn getUsage(self: *@This()) BufferUsage {
        return @bitCast(c.wgpuBufferGetUsage(@ptrCast(self)));
    }

    pub inline fn getSize(self: *@This()) u64 {
        return @bitCast(c.wgpuBufferGetSize(@ptrCast(self)));
    }

    pub inline fn getMapState(self: *@This()) BufferMapState {
        return @enumFromInt(c.wgpuBufferGetMapState(@ptrCast(self)));
    }

    pub inline fn unmap(self: *@This()) void {
        c.wgpuBufferUnmap(@ptrCast(self));
    }

    pub inline fn destroy(self: *@This()) void {
        c.wgpuBufferDestroy(@ptrCast(self));
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuBufferRelease(@ptrCast(this));
    }
};

pub const CommandBuffer = *CommandBufferImpl;
pub const CommandBufferImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuCommandBufferSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuCommandBufferRelease(@ptrCast(this));
    }
};

pub const CommandEncoder = *CommandEncoderImpl;
pub const CommandEncoderImpl = opaque {

    pub inline fn finish(self: *@This(), descriptor: ?*const CommandBufferDescriptor) CommandBuffer {
        return @ptrCast(c.wgpuCommandEncoderFinish(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn beginComputePass(self: *@This(), descriptor: ?*const ComputePassDescriptor) ComputePassEncoder {
        return @ptrCast(c.wgpuCommandEncoderBeginComputePass(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn beginRenderPass(self: *@This(), descriptor: *const RenderPassDescriptor) RenderPassEncoder {
        return @ptrCast(c.wgpuCommandEncoderBeginRenderPass(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn copyBufferToBuffer(self: *@This(), source: Buffer, source_offset: u64, destination: Buffer, destination_offset: u64, size: u64) void {
        c.wgpuCommandEncoderCopyBufferToBuffer(@ptrCast(self), @ptrCast(source), source_offset, @ptrCast(destination), destination_offset, size);
    }

    pub inline fn copyBufferToTexture(self: *@This(), source: *const ImageCopyBuffer, destination: *const ImageCopyTexture, copy_size: *const Extent3D) void {
        c.wgpuCommandEncoderCopyBufferToTexture(@ptrCast(self), @ptrCast(source), @ptrCast(destination), @ptrCast(copy_size));
    }

    pub inline fn copyTextureToBuffer(self: *@This(), source: *const ImageCopyTexture, destination: *const ImageCopyBuffer, copy_size: *const Extent3D) void {
        c.wgpuCommandEncoderCopyTextureToBuffer(@ptrCast(self), @ptrCast(source), @ptrCast(destination), @ptrCast(copy_size));
    }

    pub inline fn copyTextureToTexture(self: *@This(), source: *const ImageCopyTexture, destination: *const ImageCopyTexture, copy_size: *const Extent3D) void {
        c.wgpuCommandEncoderCopyTextureToTexture(@ptrCast(self), @ptrCast(source), @ptrCast(destination), @ptrCast(copy_size));
    }

    pub inline fn clearBuffer(self: *@This(), buffer: Buffer, offset: u64, size: u64) void {
        c.wgpuCommandEncoderClearBuffer(@ptrCast(self), @ptrCast(buffer), offset, size);
    }

    pub inline fn insertDebugMarker(self: *@This(), marker_label: [*:0]u8) void {
        c.wgpuCommandEncoderInsertDebugMarker(@ptrCast(self), marker_label);
    }

    pub inline fn popDebugGroup(self: *@This()) void {
        c.wgpuCommandEncoderPopDebugGroup(@ptrCast(self));
    }

    pub inline fn pushDebugGroup(self: *@This(), group_label: [*:0]u8) void {
        c.wgpuCommandEncoderPushDebugGroup(@ptrCast(self), group_label);
    }

    pub inline fn resolveQuerySet(self: *@This(), query_set: QuerySet, first_query: u32, query_count: u32, destination: Buffer, destination_offset: u64) void {
        c.wgpuCommandEncoderResolveQuerySet(@ptrCast(self), @ptrCast(query_set), first_query, query_count, @ptrCast(destination), destination_offset);
    }

    pub inline fn writeTimestamp(self: *@This(), query_set: QuerySet, query_index: u32) void {
        c.wgpuCommandEncoderWriteTimestamp(@ptrCast(self), @ptrCast(query_set), query_index);
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuCommandEncoderSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuCommandEncoderRelease(@ptrCast(this));
    }
};

pub const ComputePassEncoder = *ComputePassEncoderImpl;
pub const ComputePassEncoderImpl = opaque {

    pub inline fn insertDebugMarker(self: *@This(), marker_label: [*:0]u8) void {
        c.wgpuComputePassEncoderInsertDebugMarker(@ptrCast(self), marker_label);
    }

    pub inline fn popDebugGroup(self: *@This()) void {
        c.wgpuComputePassEncoderPopDebugGroup(@ptrCast(self));
    }

    pub inline fn pushDebugGroup(self: *@This(), group_label: [*:0]u8) void {
        c.wgpuComputePassEncoderPushDebugGroup(@ptrCast(self), group_label);
    }

    pub inline fn setPipeline(self: *@This(), pipeline: ComputePipeline) void {
        c.wgpuComputePassEncoderSetPipeline(@ptrCast(self), @ptrCast(pipeline));
    }

    pub inline fn setBindGroup(self: *@This(), group_index: u32, group: ?BindGroup, dynamic_offsets: []const u32) void {
        c.wgpuComputePassEncoderSetBindGroup(@ptrCast(self), group_index, @ptrCast(group), dynamic_offsets.len, @ptrCast(dynamic_offsets.ptr));
    }

    pub inline fn dispatchWorkgroups(self: *@This(), workgroupCountX: u32, workgroupCountY: u32, workgroupCountZ: u32) void {
        c.wgpuComputePassEncoderDispatchWorkgroups(@ptrCast(self), workgroupCountX, workgroupCountY, workgroupCountZ);
    }

    pub inline fn dispatchWorkgroupsIndirect(self: *@This(), indirect_buffer: Buffer, indirect_offset: u64) void {
        c.wgpuComputePassEncoderDispatchWorkgroupsIndirect(@ptrCast(self), @ptrCast(indirect_buffer), indirect_offset);
    }

    pub inline fn end(self: *@This()) void {
        c.wgpuComputePassEncoderEnd(@ptrCast(self));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuComputePassEncoderSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuComputePassEncoderRelease(@ptrCast(this));
    }
};

pub const ComputePipeline = *ComputePipelineImpl;
pub const ComputePipelineImpl = opaque {

    pub inline fn getBindGroupLayout(self: *@This(), group_index: u32) BindGroupLayout {
        return @ptrCast(c.wgpuComputePipelineGetBindGroupLayout(@ptrCast(self), group_index));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuComputePipelineSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuComputePipelineRelease(@ptrCast(this));
    }
};

pub const Device = *DeviceImpl;
pub const DeviceImpl = opaque {

    pub inline fn createBindGroup(self: *@This(), descriptor: *const BindGroupDescriptor) BindGroup {
        return @ptrCast(c.wgpuDeviceCreateBindGroup(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createBindGroupLayout(self: *@This(), descriptor: *const BindGroupLayoutDescriptor) BindGroupLayout {
        return @ptrCast(c.wgpuDeviceCreateBindGroupLayout(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createBuffer(self: *@This(), descriptor: *const BufferDescriptor) Buffer {
        return @ptrCast(c.wgpuDeviceCreateBuffer(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createCommandEncoder(self: *@This(), descriptor: ?*const CommandEncoderDescriptor) CommandEncoder {
        return @ptrCast(c.wgpuDeviceCreateCommandEncoder(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createComputePipeline(self: *@This(), descriptor: *const ComputePipelineDescriptor) ComputePipeline {
        return @ptrCast(c.wgpuDeviceCreateComputePipeline(@ptrCast(self), @ptrCast(descriptor)));
    }

    const CreateComputePipelineAsyncCallback = fn (CreatePipelineAsyncStatus, ComputePipeline, [*:0]u8, ?*anyopaque) callconv(.C) void;
    pub inline fn createComputePipelineAsync(self: *@This(), descriptor: *const ComputePipelineDescriptor, callback: CreateComputePipelineAsyncCallback, user_data: ?*anyopaque) void {
        c.wgpuDeviceCreateComputePipelineAsync(@ptrCast(self), @ptrCast(descriptor), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn createPipelineLayout(self: *@This(), descriptor: *const PipelineLayoutDescriptor) PipelineLayout {
        return @ptrCast(c.wgpuDeviceCreatePipelineLayout(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createQuerySet(self: *@This(), descriptor: *const QuerySetDescriptor) QuerySet {
        return @ptrCast(c.wgpuDeviceCreateQuerySet(@ptrCast(self), @ptrCast(descriptor)));
    }

    const CreateRenderPipelineAsyncCallback = fn (CreatePipelineAsyncStatus, RenderPipeline, [*:0]u8, ?*anyopaque) callconv(.C) void;
    pub inline fn createRenderPipelineAsync(self: *@This(), descriptor: *const RenderPipelineDescriptor, callback: CreateRenderPipelineAsyncCallback, user_data: ?*anyopaque) void {
        c.wgpuDeviceCreateRenderPipelineAsync(@ptrCast(self), @ptrCast(descriptor), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn createRenderBundleEncoder(self: *@This(), descriptor: *const RenderBundleEncoderDescriptor) RenderBundleEncoder {
        return @ptrCast(c.wgpuDeviceCreateRenderBundleEncoder(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createRenderPipeline(self: *@This(), descriptor: *const RenderPipelineDescriptor) RenderPipeline {
        return @ptrCast(c.wgpuDeviceCreateRenderPipeline(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createSampler(self: *@This(), descriptor: ?*const SamplerDescriptor) Sampler {
        return @ptrCast(c.wgpuDeviceCreateSampler(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createShaderModule(self: *@This(), descriptor: *const ShaderModuleDescriptor) ShaderModule {
        return @ptrCast(c.wgpuDeviceCreateShaderModule(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn createTexture(self: *@This(), descriptor: *const TextureDescriptor) Texture {
        return @ptrCast(c.wgpuDeviceCreateTexture(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn destroy(self: *@This()) void {
        c.wgpuDeviceDestroy(@ptrCast(self));
    }

    pub inline fn getLimits(self: *@This(), limits: *SupportedLimits) bool {
        return c.wgpuDeviceGetLimits(@ptrCast(self), @ptrCast(limits)) != 0;
    }

    pub inline fn hasFeature(self: *@This(), feature: FeatureName) bool {
        return c.wgpuDeviceHasFeature(@ptrCast(self), @bitCast(feature)) != 0;
    }

    pub inline fn enumerateFeatures(self: *@This(), features: *FeatureName) usize {
        return @bitCast(c.wgpuDeviceEnumerateFeatures(@ptrCast(self), @ptrCast(features)));
    }

    pub inline fn getQueue(self: *@This()) Queue {
        return @ptrCast(c.wgpuDeviceGetQueue(@ptrCast(self)));
    }

    pub inline fn setUncapturedErrorCallback(self: *@This(), callback: ErrorCallback, userdata: *anyopaque) void {
        c.wgpuDeviceSetUncapturedErrorCallback(@ptrCast(self), @ptrCast(&callback), @ptrCast(userdata));
    }

    pub inline fn pushErrorScope(self: *@This(), filter: ErrorFilter) void {
        c.wgpuDevicePushErrorScope(@ptrCast(self), @bitCast(filter));
    }

    pub inline fn popErrorScope(self: *@This(), callback: ErrorCallback, userdata: *anyopaque) void {
        c.wgpuDevicePopErrorScope(@ptrCast(self), @ptrCast(&callback), @ptrCast(userdata));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuDeviceSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuDeviceRelease(@ptrCast(this));
    }
};

pub const Instance = *InstanceImpl;
pub const InstanceImpl = opaque {

    pub inline fn createSurface(self: *@This(), descriptor: *const SurfaceDescriptor) Surface {
        return @ptrCast(c.wgpuInstanceCreateSurface(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn hasWgslLanguageFeature(self: *@This(), feature: WgslFeatureName) bool {
        return c.wgpuInstanceHasWgslLanguageFeature(@ptrCast(self), @bitCast(feature)) != 0;
    }

    pub inline fn processEvents(self: *@This()) void {
        c.wgpuInstanceProcessEvents(@ptrCast(self));
    }

    const RequestAdapterCallback = fn (RequestAdapterStatus, Adapter, [*:0]u8, ?*anyopaque) callconv(.C) void;
    pub inline fn requestAdapter(self: *@This(), options: ?*const RequestAdapterOptions, callback: RequestAdapterCallback, user_data: ?*anyopaque) void {
        c.wgpuInstanceRequestAdapter(@ptrCast(self), @ptrCast(options), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuInstanceRelease(@ptrCast(this));
    }
};

pub const PipelineLayout = *PipelineLayoutImpl;
pub const PipelineLayoutImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuPipelineLayoutSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuPipelineLayoutRelease(@ptrCast(this));
    }
};

pub const QuerySet = *QuerySetImpl;
pub const QuerySetImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuQuerySetSetLabel(@ptrCast(self), label);
    }

    pub inline fn getType(self: *@This()) QueryType {
        return @enumFromInt(c.wgpuQuerySetGetType(@ptrCast(self)));
    }

    pub inline fn getCount(self: *@This()) u32 {
        return @bitCast(c.wgpuQuerySetGetCount(@ptrCast(self)));
    }

    pub inline fn destroy(self: *@This()) void {
        c.wgpuQuerySetDestroy(@ptrCast(self));
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuQuerySetRelease(@ptrCast(this));
    }
};

pub const Queue = *QueueImpl;
pub const QueueImpl = opaque {

    pub inline fn submit(self: *@This(), commands: []const CommandBuffer) void {
        c.wgpuQueueSubmit(@ptrCast(self), commands.len, @ptrCast(commands.ptr));
    }

    const OnSubmittedWorkDoneCallback = fn (QueueWorkDoneStatus, ?*anyopaque) callconv(.C) void;
    pub inline fn onSubmittedWorkDone(self: *@This(), callback: OnSubmittedWorkDoneCallback, user_data: ?*anyopaque) void {
        c.wgpuQueueOnSubmittedWorkDone(@ptrCast(self), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn writeBuffer(self: *@This(), buffer: Buffer, buffer_offset: u64, data: *const anyopaque, size: usize) void {
        c.wgpuQueueWriteBuffer(@ptrCast(self), @ptrCast(buffer), buffer_offset, @ptrCast(data), size);
    }

    pub inline fn writeTexture(self: *@This(), destination: *const ImageCopyTexture, data: *const anyopaque, data_size: usize, data_layout: *const TextureDataLayout, write_size: *const Extent3D) void {
        c.wgpuQueueWriteTexture(@ptrCast(self), @ptrCast(destination), @ptrCast(data), data_size, @ptrCast(data_layout), @ptrCast(write_size));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuQueueSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuQueueRelease(@ptrCast(this));
    }
};

pub const RenderBundle = *RenderBundleImpl;
pub const RenderBundleImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuRenderBundleSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuRenderBundleRelease(@ptrCast(this));
    }
};

pub const RenderBundleEncoder = *RenderBundleEncoderImpl;
pub const RenderBundleEncoderImpl = opaque {

    pub inline fn setPipeline(self: *@This(), pipeline: RenderPipeline) void {
        c.wgpuRenderBundleEncoderSetPipeline(@ptrCast(self), @ptrCast(pipeline));
    }

    pub inline fn setBindGroup(self: *@This(), group_index: u32, group: ?BindGroup, dynamic_offsets: []const u32) void {
        c.wgpuRenderBundleEncoderSetBindGroup(@ptrCast(self), group_index, @ptrCast(group), dynamic_offsets.len, @ptrCast(dynamic_offsets.ptr));
    }

    pub inline fn draw(self: *@This(), vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void {
        c.wgpuRenderBundleEncoderDraw(@ptrCast(self), vertex_count, instance_count, first_vertex, first_instance);
    }

    pub inline fn drawIndexed(self: *@This(), index_count: u32, instance_count: u32, first_index: u32, base_vertex: i32, first_instance: u32) void {
        c.wgpuRenderBundleEncoderDrawIndexed(@ptrCast(self), index_count, instance_count, first_index, base_vertex, first_instance);
    }

    pub inline fn drawIndirect(self: *@This(), indirect_buffer: Buffer, indirect_offset: u64) void {
        c.wgpuRenderBundleEncoderDrawIndirect(@ptrCast(self), @ptrCast(indirect_buffer), indirect_offset);
    }

    pub inline fn drawIndexedIndirect(self: *@This(), indirect_buffer: Buffer, indirect_offset: u64) void {
        c.wgpuRenderBundleEncoderDrawIndexedIndirect(@ptrCast(self), @ptrCast(indirect_buffer), indirect_offset);
    }

    pub inline fn insertDebugMarker(self: *@This(), marker_label: [*:0]u8) void {
        c.wgpuRenderBundleEncoderInsertDebugMarker(@ptrCast(self), marker_label);
    }

    pub inline fn popDebugGroup(self: *@This()) void {
        c.wgpuRenderBundleEncoderPopDebugGroup(@ptrCast(self));
    }

    pub inline fn pushDebugGroup(self: *@This(), group_label: [*:0]u8) void {
        c.wgpuRenderBundleEncoderPushDebugGroup(@ptrCast(self), group_label);
    }

    pub inline fn setVertexBuffer(self: *@This(), slot: u32, buffer: ?Buffer, offset: u64, size: u64) void {
        c.wgpuRenderBundleEncoderSetVertexBuffer(@ptrCast(self), slot, @ptrCast(buffer), offset, size);
    }

    pub inline fn setIndexBuffer(self: *@This(), buffer: Buffer, format: IndexFormat, offset: u64, size: u64) void {
        c.wgpuRenderBundleEncoderSetIndexBuffer(@ptrCast(self), @ptrCast(buffer), @bitCast(format), offset, size);
    }

    pub inline fn finish(self: *@This(), descriptor: ?*const RenderBundleDescriptor) RenderBundle {
        return @ptrCast(c.wgpuRenderBundleEncoderFinish(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuRenderBundleEncoderSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuRenderBundleEncoderRelease(@ptrCast(this));
    }
};

pub const RenderPassEncoder = *RenderPassEncoderImpl;
pub const RenderPassEncoderImpl = opaque {

    pub inline fn setPipeline(self: *@This(), pipeline: RenderPipeline) void {
        c.wgpuRenderPassEncoderSetPipeline(@ptrCast(self), @ptrCast(pipeline));
    }

    pub inline fn setBindGroup(self: *@This(), group_index: u32, group: ?BindGroup, dynamic_offsets: []const u32) void {
        c.wgpuRenderPassEncoderSetBindGroup(@ptrCast(self), group_index, @ptrCast(group), dynamic_offsets.len, @ptrCast(dynamic_offsets.ptr));
    }

    pub inline fn draw(self: *@This(), vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void {
        c.wgpuRenderPassEncoderDraw(@ptrCast(self), vertex_count, instance_count, first_vertex, first_instance);
    }

    pub inline fn drawIndexed(self: *@This(), index_count: u32, instance_count: u32, first_index: u32, base_vertex: i32, first_instance: u32) void {
        c.wgpuRenderPassEncoderDrawIndexed(@ptrCast(self), index_count, instance_count, first_index, base_vertex, first_instance);
    }

    pub inline fn drawIndirect(self: *@This(), indirect_buffer: Buffer, indirect_offset: u64) void {
        c.wgpuRenderPassEncoderDrawIndirect(@ptrCast(self), @ptrCast(indirect_buffer), indirect_offset);
    }

    pub inline fn drawIndexedIndirect(self: *@This(), indirect_buffer: Buffer, indirect_offset: u64) void {
        c.wgpuRenderPassEncoderDrawIndexedIndirect(@ptrCast(self), @ptrCast(indirect_buffer), indirect_offset);
    }

    pub inline fn executeBundles(self: *@This(), bundles: []const RenderBundle) void {
        c.wgpuRenderPassEncoderExecuteBundles(@ptrCast(self), bundles.len, @ptrCast(bundles.ptr));
    }

    pub inline fn insertDebugMarker(self: *@This(), marker_label: [*:0]u8) void {
        c.wgpuRenderPassEncoderInsertDebugMarker(@ptrCast(self), marker_label);
    }

    pub inline fn popDebugGroup(self: *@This()) void {
        c.wgpuRenderPassEncoderPopDebugGroup(@ptrCast(self));
    }

    pub inline fn pushDebugGroup(self: *@This(), group_label: [*:0]u8) void {
        c.wgpuRenderPassEncoderPushDebugGroup(@ptrCast(self), group_label);
    }

    pub inline fn setStencilReference(self: *@This(), reference: u32) void {
        c.wgpuRenderPassEncoderSetStencilReference(@ptrCast(self), reference);
    }

    pub inline fn setBlendConstant(self: *@This(), color: *const Color) void {
        c.wgpuRenderPassEncoderSetBlendConstant(@ptrCast(self), @ptrCast(color));
    }

    pub inline fn setViewport(self: *@This(), x: f32, y: f32, width: f32, height: f32, min_depth: f32, max_depth: f32) void {
        c.wgpuRenderPassEncoderSetViewport(@ptrCast(self), x, y, width, height, min_depth, max_depth);
    }

    pub inline fn setScissorRect(self: *@This(), x: u32, y: u32, width: u32, height: u32) void {
        c.wgpuRenderPassEncoderSetScissorRect(@ptrCast(self), x, y, width, height);
    }

    pub inline fn setVertexBuffer(self: *@This(), slot: u32, buffer: ?Buffer, offset: u64, size: u64) void {
        c.wgpuRenderPassEncoderSetVertexBuffer(@ptrCast(self), slot, @ptrCast(buffer), offset, size);
    }

    pub inline fn setIndexBuffer(self: *@This(), buffer: Buffer, format: IndexFormat, offset: u64, size: u64) void {
        c.wgpuRenderPassEncoderSetIndexBuffer(@ptrCast(self), @ptrCast(buffer), @bitCast(format), offset, size);
    }

    pub inline fn beginOcclusionQuery(self: *@This(), query_index: u32) void {
        c.wgpuRenderPassEncoderBeginOcclusionQuery(@ptrCast(self), query_index);
    }

    pub inline fn endOcclusionQuery(self: *@This()) void {
        c.wgpuRenderPassEncoderEndOcclusionQuery(@ptrCast(self));
    }

    pub inline fn end(self: *@This()) void {
        c.wgpuRenderPassEncoderEnd(@ptrCast(self));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuRenderPassEncoderSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuRenderPassEncoderRelease(@ptrCast(this));
    }
};

pub const RenderPipeline = *RenderPipelineImpl;
pub const RenderPipelineImpl = opaque {

    pub inline fn getBindGroupLayout(self: *@This(), group_index: u32) BindGroupLayout {
        return @ptrCast(c.wgpuRenderPipelineGetBindGroupLayout(@ptrCast(self), group_index));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuRenderPipelineSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuRenderPipelineRelease(@ptrCast(this));
    }
};

pub const Sampler = *SamplerImpl;
pub const SamplerImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuSamplerSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuSamplerRelease(@ptrCast(this));
    }
};

pub const ShaderModule = *ShaderModuleImpl;
pub const ShaderModuleImpl = opaque {

    const GetCompilationInfoCallback = fn (CompilationInfoRequestStatus, CompilationInfo, ?*anyopaque) callconv(.C) void;
    pub inline fn getCompilationInfo(self: *@This(), callback: GetCompilationInfoCallback, user_data: ?*anyopaque) void {
        c.wgpuShaderModuleGetCompilationInfo(@ptrCast(self), @ptrCast(&callback), @ptrCast(user_data));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuShaderModuleSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuShaderModuleRelease(@ptrCast(this));
    }
};

pub const Surface = *SurfaceImpl;
pub const SurfaceImpl = opaque {

    pub inline fn configure(self: *@This(), config: *const SurfaceConfiguration) void {
        c.wgpuSurfaceConfigure(@ptrCast(self), @ptrCast(config));
    }

    pub inline fn getCapabilities(self: *@This(), adapter: Adapter, capabilities: *SurfaceCapabilities) void {
        c.wgpuSurfaceGetCapabilities(@ptrCast(self), @ptrCast(adapter), @ptrCast(capabilities));
    }

    pub inline fn getCurrentTexture(self: *@This(), surface_texture: *SurfaceTexture) void {
        c.wgpuSurfaceGetCurrentTexture(@ptrCast(self), @ptrCast(surface_texture));
    }

    pub inline fn getPreferredFormat(self: *@This(), adapter: Adapter) TextureFormat {
        return @enumFromInt(c.wgpuSurfaceGetPreferredFormat(@ptrCast(self), @ptrCast(adapter)));
    }

    pub inline fn present(self: *@This()) void {
        c.wgpuSurfacePresent(@ptrCast(self));
    }

    pub inline fn unconfigure(self: *@This()) void {
        c.wgpuSurfaceUnconfigure(@ptrCast(self));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuSurfaceSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuSurfaceRelease(@ptrCast(this));
    }
};

pub const Texture = *TextureImpl;
pub const TextureImpl = opaque {

    pub inline fn createView(self: *@This(), descriptor: ?*const TextureViewDescriptor) TextureView {
        return @ptrCast(c.wgpuTextureCreateView(@ptrCast(self), @ptrCast(descriptor)));
    }

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuTextureSetLabel(@ptrCast(self), label);
    }

    pub inline fn getWidth(self: *@This()) u32 {
        return @bitCast(c.wgpuTextureGetWidth(@ptrCast(self)));
    }

    pub inline fn getHeight(self: *@This()) u32 {
        return @bitCast(c.wgpuTextureGetHeight(@ptrCast(self)));
    }

    pub inline fn getDepthOrArrayLayers(self: *@This()) u32 {
        return @bitCast(c.wgpuTextureGetDepthOrArrayLayers(@ptrCast(self)));
    }

    pub inline fn getMipLevelCount(self: *@This()) u32 {
        return @bitCast(c.wgpuTextureGetMipLevelCount(@ptrCast(self)));
    }

    pub inline fn getSampleCount(self: *@This()) u32 {
        return @bitCast(c.wgpuTextureGetSampleCount(@ptrCast(self)));
    }

    pub inline fn getDimension(self: *@This()) TextureDimension {
        return @enumFromInt(c.wgpuTextureGetDimension(@ptrCast(self)));
    }

    pub inline fn getFormat(self: *@This()) TextureFormat {
        return @enumFromInt(c.wgpuTextureGetFormat(@ptrCast(self)));
    }

    pub inline fn getUsage(self: *@This()) TextureUsage {
        return @bitCast(c.wgpuTextureGetUsage(@ptrCast(self)));
    }

    pub inline fn destroy(self: *@This()) void {
        c.wgpuTextureDestroy(@ptrCast(self));
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuTextureRelease(@ptrCast(this));
    }
};

pub const TextureView = *TextureViewImpl;
pub const TextureViewImpl = opaque {

    pub inline fn setLabel(self: *@This(), label: [*:0]u8) void {
        c.wgpuTextureViewSetLabel(@ptrCast(self), label);
    }

    pub inline fn release(this: *@This()) void {
        c.wgpuTextureViewRelease(@ptrCast(this));
    }
};

pub fn createInstance(descriptor: ?*const InstanceDescriptor) Instance {
    return @ptrCast(c.wgpuCreateInstance(@ptrCast(descriptor)));
}
