const c = @cImport({
    @cInclude("wgpu.h");
});

pub const NativeSType = enum(u32) {
    device_extras = 0x0003001,
    required_limits_extras = 0x0003002,
    pipeline_layout_extras = 0x0003003,
    shader_module_glsl_descriptor = 0x0003004,
    supported_limits_extras = 0x0003005,
    instance_extras = 0x0003006,
    bind_group_entry_extras = 0x0003007,
    bind_group_layout_entry_extras = 0x0003008,
    query_set_description_extras = 0x0003009,
    surface_configuration_extras = 0x000300A,
};

pub const NativeFeature = enum(u32) {
    push_constants = 0x00030001,
    texture_adapter_specific_format_features = 0x00030002,
    multi_draw_indirect = 0x00030003,
    multi_draw_indirect_count = 0x00030004,
    vertex_writable_storage = 0x00030005,
    texture_binding_array = 0x00030006,
    sampled_texture_and_storage_buffer_array_non_uniform_indexing = 0x00030007,
    pipeline_statistics_query = 0x00030008,
    storage_resource_binding_array = 0x00030009,
    partially_bound_binding_array = 0x0003000A,
    texture_format16bit_norm = 0x0003000B,
    texture_compression_astc_hdr = 0x0003000C,
    mappable_primary_buffers = 0x0003000E,
    buffer_binding_array = 0x0003000F,
    uniform_buffer_and_storage_texture_array_non_uniform_indexing = 0x00030010,
    vertex_attribute64bit = 0x00030019,
    shader_unused_vertex_output = 0x0003001A,
    texture_format_nv12 = 0x0003001B,
    ray_tracing_acceleration_structure = 0x0003001C,
    ray_query = 0x0003001D,
    shader_f64 = 0x0003001E,
    shader_i16 = 0x0003001F,
    shader_primitive_index = 0x00030020,
    shader_early_depth_test = 0x00030021,
};

pub const LogLevel = enum(u32) {
    off = 0x00000000,
    err = 0x00000001,
    warn = 0x00000002,
    info = 0x00000003,
    debug = 0x00000004,
    trace = 0x00000005,
};

pub const InstanceBackend = packed struct {
    vulkan: u1,
    gl: u1,
    metal: u1,
    dx11: u1,
    dx12: u1,
    browser_web_gpu: u1,
    padding: u26,
};

pub const InstanceFlag = packed struct {
    debug: u1,
    validation: u1,
    discard_hal_labels: u1,
    padding: u29,
};

pub const Dx12Compiler = enum(u32) {
    undef = 0x00000000,
    fxc = 0x00000001,
    dxc = 0x00000002,
};

pub const Gles3MinorVersion = enum(u32) {
    automatic = 0x00000000,
    version0 = 0x00000001,
    version1 = 0x00000002,
    version2 = 0x00000003,
};

pub const PipelineStatisticName = enum(u32) {
    vertex_shader_invocations = 0x00000000,
    clipper_invocations = 0x00000001,
    clipper_primitives_out = 0x00000002,
    fragment_shader_invocations = 0x00000003,
    compute_shader_invocations = 0x00000004,
};

pub const WGPUNativeQueryType = enum(u32) {
    pipeline_statistics = 0x00030000,
};

pub const InstanceExtras = extern struct {
    chain: ChainedStruct,
    backends: InstanceBackendFlags,
    flags: InstanceFlags,
    dx12_shader_compiler: Dx12Compiler,
    gles3_minor_version: Gles3MinorVersion,
    dxil_path: [*:0]const u8,
    dxc_path: [*:0]const u8,
};

pub const DeviceExtras = extern struct {
    chain: ChainedStruct,
    trace_path: [*:0]const u8,
};

pub const NativeLimits = extern struct {
    max_push_constant_size: u32,
    max_non_sampler_bindings: u32,
};

pub const RequiredLimitsExtras = extern struct {
    chain: ChainedStruct,
    limits: NativeLimits,
};

pub const SupportedLimitsExtras = extern struct {
    chain: ChainedStructOut,
    limits: NativeLiimts,
};

pub const PushConstantRange = extern struct {
    stages: ShaderStageFlags,
    start: u32,
    end: u32,
};

pub const PipelineLayoutExtras = extern struct {
    chain: ChainedStruct,
    push_constant_range_count: u32,
    push_constant_ranges: [*]const PushConstantRange,
};

pub const WrappedSubmissionIndex = extern struct {
    queue: Queue,
    submissionIndex: SubmissionIndex,
};

pub const ShaderDefine = extern struct {
    name: [*:0]const u8,
    value: [*:0]const u8,
};

pub const ShaderModuleGLSLDescriptor = extern struct {
    chain: ChainedStruct,
    stage: ShaderStage,
    code: [*:0]const u8,
    defineCount: u32,
    defines: *ShaderDefine,
};

pub const RegistryReport = extern struct {
    numAllocated: usize,
    numKeptFromUser: usize,
    numReleasedFromUser: usize,
    numError: usize,
    elementSize: usize,
};

pub const HubReport = extern struct {
    adapters: RegistryReport,
    devices: RegistryReport,
    queues: RegistryReport,
    pipelineLayouts: RegistryReport,
    shaderModules: RegistryReport,
    bindGroupLayouts: RegistryReport,
    bindGroups: RegistryReport,
    commandBuffers: RegistryReport,
    renderBundles: RegistryReport,
    renderPipelines: RegistryReport,
    computePipelines: RegistryReport,
    querySets: RegistryReport,
    buffers: RegistryReport,
    textures: RegistryReport,
    textureViews: RegistryReport,
    samplers: RegistryReport,
};

pub const GlobalReport = extern struct {
    surfaces: RegistryReport,
    backendType: BackendType,
    vulkan: HubReport,
    metal: HubReport,
    dx12: HubReport,
    gl: HubReport,
};

pub const InstanceEnumerateAdapterOptions = extern struct {
    nextInChain: *const ChainedStruct,
    backends: InstanceBackendFlags,
};

pub const BindGroupEntryExtras = extern struct {
    chain: ChainedStruct,
    buffers: *const Buffer,
    bufferCount: usize,
    samplers: *const Sampler,
    samplerCount: usize,
    textureViews: *const TextureView,
    textureViewCount: usize,
};

pub const BindGroupLayoutEntryExtras = extern struct {
    chain: ChainedStruct,
    count: u32,
};

pub const QuerySetDescriptorExtras = extern struct {
    chain: ChainedStruct,
    pipelineStatistics: *const PipelineStatisticName,
    pipelineStatisticCount: usize,
};

pub const SurfaceConfigurationExtras = extern struct {
    chain: ChainedStruct,
    desiredMaximumFrameLatency: u32,
};

pub const LogCallback = fn (LogLevel, [*:0]const u8, ?*anyopaque) callconv(.C) void;

// Global
pub inline fn generateReport(instance: Instance, report: *GlobalReport) void {
    c.wgpuGenerateReport(@ptrCast(instance), @ptrCast(report));
}

// Instance
pub inline fn enumerateAdapters(self: *@This(), options: ?[*]const InstanceEnumerateAdapterOptions, adapters: *Adapter) usize {
    return c.wgpuInstanceEnumerateAdapters(@ptrCast(self), @ptrCast(options), @ptrCast(adapters));
}

// Queue
pub inline fn submitForIndex(self: *@This(), commands: []CommandBuffer) u64 {
    return c.wgpuQueueSubmitForIndex(@ptrCast(self), commands.len, @ptrCast(commands.ptr));
}

// Device
pub inline fn poll(self: *@This(), wait: bool, wrapped_submission_index: ?*const WrappedSubmissionIndex) bool {
    return c.wgpuDevicePoll(@ptrCast(self), @boolToInt(wait), @ptrCast(wrapped_submission_index)) != 0;
}

// Global
pub inline fn setLogCallback(callback: LogCallback, userdata: ?*anyopaque) void {
    c.wgpuSetLogCallback(@ptrCast(&callback), @ptrCast(userdata));
}

// Global
pub inline fn setLogLevel(level: LogLevel) void {
    return c.wgpuSetLogLevel(@bitCast(level));
}

// Global
pub inline fn getVersion() u32 {
    return c.wgpuGetVersion();
}

// RenderPassEncoder
pub inline fn setPushConstants(self: *@This(), stages: ShaderStageFlags, offset: u32, size_bytes: u32, datat: *const anyopaque) void {
    c.wgpuRenderPassEncoderSetPushConstants(@ptrCast(self), @bitCast(stages), offset, size_bytes, @ptrCast(data));
}

// RenderPassEncoder
pub inline fn multiDrawIndirect(self: *@This(), buffer: Buffer, offset: u64, count: u32) void {
    c.wgpuRenderPassEncoderMultiDrawIndirect(@ptrCast(self), @ptrCast(buffer), offset, count);
}

// RenderPassEncoder
pub inline fn multiDrawIndexedIndirect(self: *@This(), buffer: Buffer, offset: u64, count: u32) void {
    c.wgpuRenderPassEncoderMultiDrawIndexedIndirect(@ptrCast(self), @ptrCast(buffer), offset, count);
}

// RenderPassEncoder
pub inline fn multiDrawIndirectCount(self: *@This(), buffer: Buffer, offset: u64, count_buffer: Buffer, count_buffer_offset: u64, max_count: u32) void {
    c.wgpuRenderPassEncoderMultiDrawIndirectCount(@ptrCast(this), @ptrCast(buffer), offset, @otrCast(count_buffer), count_buffer_offset, max_count);
}

// RenderPassEncoder
pub inline fn multiDrawIndirectIndexedCount(self: *@This(), buffer: Buffer, offset: u64, count_buffer: Buffer, count_buffer_offset: u64, max_count: u32) void {
    c.wgpuRenderPassEncoderMultiDrawIndirectCount(@ptrCast(this), @ptrCast(buffer), offset, @otrCast(count_buffer), count_buffer_offset, max_count);
}

// ComputePassEncoder
pub inline fn beginPipelineStatisticsQuery(self: *@This(), query_set: QuerySet, query_index: u32) void {
    c.wgpuComputePassEncoderBeginPipelineStatisticsQuery(@ptrCast(self), @ptrCast(query_set), query_index);
}

// ComputePassEncoder
pub inline fn endPipelineStatisticsQuery(self: *@This()) void {
    c.wgpuComputePassEncoderEndPipelineStatisticsQuery(@ptrCast(self));
}

// RenderPassEncoder
pub inline fn beginPipelineStatisticsQuery(self: *@This(), query_set: QuerySet, query_index: u32) void {
    c.wgpuComputePassEncoderBeginPipelineStatisticsQuery(@ptrCast(self), @ptrCast(query_set), query_index);
}

// RenderPassEncoder
pub inline fn endPipelineStatisticsQuery(self: *@This()) void {
    c.wgpuComputePassEncoderEndPipelineStatisticsQuery(@ptrCast(self));
}
