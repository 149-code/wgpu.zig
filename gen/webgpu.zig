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
    success,
    unavailable,
    err,
    unknown,
};

pub const AdapterType = enum(u32) {
    discrete_GPU,
    integrated_GPU,
    CPU,
    unknown,
};

pub const AddressMode = enum(u32) {
    repeat,
    mirror_repeat,
    clamp_to_edge,
};

pub const BackendType = enum(u32) {
    undef,
    nil,
    WebGPU,
    D3D11,
    D3D12,
    metal,
    vulkan,
    openGL,
    openGLES,
};

pub const BufferBindingType = enum(u32) {
    undef,
    uniform,
    storage,
    read_only_storage,
};

pub const SamplerBindingType = enum(u32) {
    undef,
    filtering,
    non_filtering,
    comparison,
};

pub const TextureSampleType = enum(u32) {
    undef,
    float,
    unfilterable_float,
    depth,
    sint,
    uint,
};

pub const StorageTextureAccess = enum(u32) {
    undef,
    write_only,
    read_only,
    read_write,
};

pub const BlendFactor = enum(u32) {
    zero,
    one,
    src,
    one_minus_src,
    src_alpha,
    one_minus_src_alpha,
    dst,
    one_minus_dst,
    dst_alpha,
    one_minus_dst_alpha,
    src_alpha_saturated,
    constant,
    one_minus_constant,
};

pub const BlendOperation = enum(u32) {
    add,
    subtract,
    reverse_subtract,
    min,
    max,
};

pub const BufferMapAsyncStatus = enum(u32) {
    success,
    validation_error,
    unknown,
    device_lost,
    destroyed_before_callback,
    unmapped_before_callback,
    mapping_already_pending,
    offset_out_of_range,
    size_out_of_range,
};

pub const BufferMapState = enum(u32) {
    unmapped,
    pending,
    mapped,
};

pub const CompareFunction = enum(u32) {
    undef,
    never,
    less,
    less_equal,
    greater,
    greater_equal,
    equal,
    not_equal,
    always,
};

pub const CompilationInfoRequestStatus = enum(u32) {
    success,
    err,
    device_lost,
    unknown,
};

pub const CompilationMessageType = enum(u32) {
    err,
    warning,
    info,
};

pub const CompositeAlphaMode = enum(u32) {
    auto,
    opaq,
    premultiplied,
    unpremultiplied,
    inherit,
};

pub const CreatePipelineAsyncStatus = enum(u32) {
    success,
    validation_error,
    internal_error,
    device_lost,
    device_destroyed,
    unknown,
};

pub const CullMode = enum(u32) {
    none,
    front,
    back,
};

pub const DeviceLostReason = enum(u32) {
    undef,
    destroyed,
};

pub const ErrorFilter = enum(u32) {
    validation,
    out_of_memory,
    internal,
};

pub const ErrorType = enum(u32) {
    no_error,
    validation,
    out_of_memory,
    internal,
    unknown,
    device_lost,
};

pub const FeatureName = enum(u32) {
    undef,
    depth_clip_control,
    depth32_float_stencil8,
    timestamp_query,
    texture_compression_BC,
    texture_compression_ETC2,
    texture_compression_ASTC,
    indirect_first_instance,
    shader_f16,
    RG11B10_ufloat_renderable,
    BGRA8_unorm_storage,
    float32_filterable,
};

pub const FilterMode = enum(u32) {
    nearest,
    linear,
};

pub const FrontFace = enum(u32) {
    CCW,
    CW,
};

pub const IndexFormat = enum(u32) {
    undef,
    uint16,
    uint32,
};

pub const VertexStepMode = enum(u32) {
    vertex,
    instance,
    vertex_buffer_not_used,
};

pub const LoadOp = enum(u32) {
    undef,
    clear,
    load,
};

pub const MipmapFilterMode = enum(u32) {
    nearest,
    linear,
};

pub const StoreOp = enum(u32) {
    undef,
    store,
    discard,
};

pub const PowerPreference = enum(u32) {
    undef,
    low_power,
    high_performance,
};

pub const PresentMode = enum(u32) {
    fifo,
    fifo_relaxed,
    immediate,
    mailbox,
};

pub const PrimitiveTopology = enum(u32) {
    point_list,
    line_list,
    line_strip,
    triangle_list,
    triangle_strip,
};

pub const QueryType = enum(u32) {
    occlusion,
    timestamp,
};

pub const QueueWorkDoneStatus = enum(u32) {
    success,
    err,
    unknown,
    device_lost,
};

pub const RequestDeviceStatus = enum(u32) {
    success,
    err,
    unknown,
};

pub const StencilOperation = enum(u32) {
    keep,
    zero,
    replace,
    invert,
    increment_clamp,
    decrement_clamp,
    increment_wrap,
    decrement_wrap,
};

pub const SType = enum(u32) {
    invalid,
    surface_descriptor_from_metal_layer,
    surface_descriptor_from_windows_HWND,
    surface_descriptor_from_xlib_window,
    surface_descriptor_from_canvas_HTML_selector,
    shader_module_SPIRV_descriptor,
    shader_module_WGSL_descriptor,
    primitive_depth_clip_control,
    surface_descriptor_from_wayland_surface,
    surface_descriptor_from_android_native_window,
    surface_descriptor_from_xcb_window,
    render_pass_descriptor_max_draw_count,
};

pub const SurfaceGetCurrentTextureStatus = enum(u32) {
    success,
    timeout,
    outdated,
    lost,
    out_of_memory,
    device_lost,
};

pub const TextureAspect = enum(u32) {
    all,
    stencil_only,
    depth_only,
};

pub const TextureDimension = enum(u32) {
    _1D,
    _2D,
    _3D,
};

pub const TextureFormat = enum(u32) {
    undef,
    R8_unorm,
    R8_snorm,
    R8_uint,
    R8_sint,
    R16_uint,
    R16_sint,
    R16_float,
    RG8_unorm,
    RG8_snorm,
    RG8_uint,
    RG8_sint,
    R32_float,
    R32_uint,
    R32_sint,
    RG16_uint,
    RG16_sint,
    RG16_float,
    RGBA8_unorm,
    RGBA8_unorm_srgb,
    RGBA8_snorm,
    RGBA8_uint,
    RGBA8_sint,
    BGRA8_unorm,
    BGRA8_unorm_srgb,
    RGB10_A2_uint,
    RGB10_A2_unorm,
    RG11_B10_ufloat,
    RGB9_E5_ufloat,
    RG32_float,
    RG32_uint,
    RG32_sint,
    RGBA16_uint,
    RGBA16_sint,
    RGBA16_float,
    RGBA32_float,
    RGBA32_uint,
    RGBA32_sint,
    stencil8,
    depth16_unorm,
    depth24_plus,
    depth24_plus_stencil8,
    depth32_float,
    depth32_float_stencil8,
    BC1_RGBA_unorm,
    BC1_RGBA_unorm_srgb,
    BC2_RGBA_unorm,
    BC2_RGBA_unorm_srgb,
    BC3_RGBA_unorm,
    BC3_RGBA_unorm_srgb,
    BC4_R_unorm,
    BC4_R_snorm,
    BC5_RG_unorm,
    BC5_RG_snorm,
    BC6H_RGB_ufloat,
    BC6H_RGB_float,
    BC7_RGBA_unorm,
    BC7_RGBA_unorm_srgb,
    ETC2_RGB8_unorm,
    ETC2_RGB8_unorm_srgb,
    ETC2_RGB8A1_unorm,
    ETC2_RGB8A1_unorm_srgb,
    ETC2_RGBA8_unorm,
    ETC2_RGBA8_unorm_srgb,
    EAC_R11_unorm,
    EAC_R11_snorm,
    EAC_RG11_unorm,
    EAC_RG11_snorm,
    ASTC_4x4_unorm,
    ASTC_4x4_unorm_srgb,
    ASTC_5x4_unorm,
    ASTC_5x4_unorm_srgb,
    ASTC_5x5_unorm,
    ASTC_5x5_unorm_srgb,
    ASTC_6x5_unorm,
    ASTC_6x5_unorm_srgb,
    ASTC_6x6_unorm,
    ASTC_6x6_unorm_srgb,
    ASTC_8x5_unorm,
    ASTC_8x5_unorm_srgb,
    ASTC_8x6_unorm,
    ASTC_8x6_unorm_srgb,
    ASTC_8x8_unorm,
    ASTC_8x8_unorm_srgb,
    ASTC_10x5_unorm,
    ASTC_10x5_unorm_srgb,
    ASTC_10x6_unorm,
    ASTC_10x6_unorm_srgb,
    ASTC_10x8_unorm,
    ASTC_10x8_unorm_srgb,
    ASTC_10x10_unorm,
    ASTC_10x10_unorm_srgb,
    ASTC_12x10_unorm,
    ASTC_12x10_unorm_srgb,
    ASTC_12x12_unorm,
    ASTC_12x12_unorm_srgb,
};

pub const TextureViewDimension = enum(u32) {
    undef,
    _1D,
    _2D,
    _2D_array,
    cube,
    cube_array,
    _3D,
};

pub const VertexFormat = enum(u32) {
    undef,
    uint8x2,
    uint8x4,
    sint8x2,
    sint8x4,
    unorm8x2,
    unorm8x4,
    snorm8x2,
    snorm8x4,
    uint16x2,
    uint16x4,
    sint16x2,
    sint16x4,
    unorm16x2,
    unorm16x4,
    snorm16x2,
    snorm16x4,
    float16x2,
    float16x4,
    float32,
    float32x2,
    float32x3,
    float32x4,
    uint32,
    uint32x2,
    uint32x3,
    uint32x4,
    sint32,
    sint32x2,
    sint32x3,
    sint32x4,
};

pub const WgslFeatureName = enum(u32) {
    undef,
    readonly_and_readwrite_storage_textures,
    packed4x8_integer_dot_product,
    unrestricted_pointer_parameters,
    pointer_composite_access,
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
        return @bitCast(c.wgpuBufferGetMapState(@ptrCast(self)));
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
        return @bitCast(c.wgpuQuerySetGetType(@ptrCast(self)));
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
        return @bitCast(c.wgpuSurfaceGetPreferredFormat(@ptrCast(self), @ptrCast(adapter)));
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
        return @bitCast(c.wgpuTextureGetDimension(@ptrCast(self)));
    }

    pub inline fn getFormat(self: *@This()) TextureFormat {
        return @bitCast(c.wgpuTextureGetFormat(@ptrCast(self)));
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
