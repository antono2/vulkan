module vulkan

/*
** Creator antono2@github.com.
**
** License: Public Domain
*/

/*
** This module is generated from the Khronos Vulkan XML API Registry.
**
*/

#include "vk_platform.h"

pub fn make_api_version(variant u32, major u32, minor u32, patch u32) u32 {
	return variant << 29 | major << 22 | minor << 12 | patch
}

pub const api_version_1_0 = make_api_version(0, 1, 0, 0) // Patch version should always be set to 0
pub const header_version = 302
pub const header_version_complete = make_api_version(0, 1, 3, header_version)

pub fn version_variant(version u32) u32 {
	return version >> 29
}

pub fn api_version_major(version u32) u32 {
	return version >> 22 & u32(0x7F)
}

pub fn api_version_minor(version u32) u32 {
	return version >> 12 & u32(0x3FF)
}

pub fn api_version_patch(version u32) u32 {
	return version & u32(0xFFF)
}

pub type Bool32 = u32
pub type DeviceAddress = u64
pub type DeviceSize = u64
pub type Flags = u32
pub type SampleMask = u32
pub type C.Buffer = voidptr
pub type C.Image = voidptr
pub type C.Instance = voidptr
pub type C.PhysicalDevice = voidptr
pub type C.Device = voidptr
pub type C.Queue = voidptr
pub type C.Semaphore = voidptr
pub type C.CommandBuffer = voidptr
pub type C.Fence = voidptr
pub type C.DeviceMemory = voidptr
pub type C.Event = voidptr
pub type C.QueryPool = voidptr
pub type C.BufferView = voidptr
pub type C.ImageView = voidptr
pub type C.ShaderModule = voidptr
pub type C.PipelineCache = voidptr
pub type C.PipelineLayout = voidptr
pub type C.Pipeline = voidptr
pub type C.RenderPass = voidptr
pub type C.DescriptorSetLayout = voidptr
pub type C.Sampler = voidptr
pub type C.DescriptorSet = voidptr
pub type C.DescriptorPool = voidptr
pub type C.Framebuffer = voidptr
pub type C.CommandPool = voidptr

pub const attachment_unused = ~u32(0)
pub const vk_false = u32(0)
pub const lod_clamp_none = f32(1000.0)
pub const queue_family_ignored = ~u32(0)
pub const remaining_array_layers = ~u32(0)
pub const remaining_mip_levels = ~u32(0)
pub const subpass_external = ~u32(0)
pub const vk_true = u32(1)
pub const whole_size = ~u64(0)
pub const max_memory_types = u32(32)
pub const max_physical_device_name_size = u32(256)
pub const uuid_size = u32(16)
pub const max_extension_name_size = u32(256)
pub const max_description_size = u32(256)
pub const max_memory_heaps = u32(16)

pub enum Result {
	success                                            = int(0)
	not_ready                                          = int(1)
	timeout                                            = int(2)
	event_set                                          = int(3)
	event_reset                                        = int(4)
	incomplete                                         = int(5)
	error_out_of_host_memory                           = int(-1)
	error_out_of_device_memory                         = int(-2)
	error_initialization_failed                        = int(-3)
	error_device_lost                                  = int(-4)
	error_memory_map_failed                            = int(-5)
	error_layer_not_present                            = int(-6)
	error_extension_not_present                        = int(-7)
	error_feature_not_present                          = int(-8)
	error_incompatible_driver                          = int(-9)
	error_too_many_objects                             = int(-10)
	error_format_not_supported                         = int(-11)
	error_fragmented_pool                              = int(-12)
	error_unknown                                      = int(-13)
	error_out_of_pool_memory                           = int(-1000069000)
	error_invalid_external_handle                      = int(-1000072003)
	error_fragmentation                                = int(-1000161000)
	error_invalid_opaque_capture_address               = int(-1000257000)
	pipeline_compile_required                          = int(1000297000)
	error_surface_lost_khr                             = int(-1000000000)
	error_native_window_in_use_khr                     = int(-1000000001)
	suboptimal_khr                                     = int(1000001003)
	error_out_of_date_khr                              = int(-1000001004)
	error_incompatible_display_khr                     = int(-1000003001)
	error_validation_failed_ext                        = int(-1000011001)
	error_invalid_shader_nv                            = int(-1000012000)
	error_image_usage_not_supported_khr                = int(-1000023000)
	error_video_picture_layout_not_supported_khr       = int(-1000023001)
	error_video_profile_operation_not_supported_khr    = int(-1000023002)
	error_video_profile_format_not_supported_khr       = int(-1000023003)
	error_video_profile_codec_not_supported_khr        = int(-1000023004)
	error_video_std_version_not_supported_khr          = int(-1000023005)
	error_invalid_drm_format_modifier_plane_layout_ext = int(-1000158000)
	error_not_permitted_khr                            = int(-1000174001)
	error_full_screen_exclusive_mode_lost_ext          = int(-1000255000)
	thread_idle_khr                                    = int(1000268000)
	thread_done_khr                                    = int(1000268001)
	operation_deferred_khr                             = int(1000268002)
	operation_not_deferred_khr                         = int(1000268003)
	error_invalid_video_std_parameters_khr             = int(-1000299000)
	error_compression_exhausted_ext                    = int(-1000338000)
	incompatible_shader_binary_ext                     = int(1000482000)
	pipeline_binary_missing_khr                        = int(1000483000)
	error_not_enough_space_khr                         = int(-1000483000)
	result_max_enum                                    = int(0x7FFFFFFF)
}

pub enum StructureType {
	structure_type_application_info                                                    = int(0)
	structure_type_instance_create_info                                                = int(1)
	structure_type_device_queue_create_info                                            = int(2)
	structure_type_device_create_info                                                  = int(3)
	structure_type_submit_info                                                         = int(4)
	structure_type_memory_allocate_info                                                = int(5)
	structure_type_mapped_memory_range                                                 = int(6)
	structure_type_bind_sparse_info                                                    = int(7)
	structure_type_fence_create_info                                                   = int(8)
	structure_type_semaphore_create_info                                               = int(9)
	structure_type_event_create_info                                                   = int(10)
	structure_type_query_pool_create_info                                              = int(11)
	structure_type_buffer_create_info                                                  = int(12)
	structure_type_buffer_view_create_info                                             = int(13)
	structure_type_image_create_info                                                   = int(14)
	structure_type_image_view_create_info                                              = int(15)
	structure_type_shader_module_create_info                                           = int(16)
	structure_type_pipeline_cache_create_info                                          = int(17)
	structure_type_pipeline_shader_stage_create_info                                   = int(18)
	structure_type_pipeline_vertex_input_state_create_info                             = int(19)
	structure_type_pipeline_input_assembly_state_create_info                           = int(20)
	structure_type_pipeline_tessellation_state_create_info                             = int(21)
	structure_type_pipeline_viewport_state_create_info                                 = int(22)
	structure_type_pipeline_rasterization_state_create_info                            = int(23)
	structure_type_pipeline_multisample_state_create_info                              = int(24)
	structure_type_pipeline_depth_stencil_state_create_info                            = int(25)
	structure_type_pipeline_color_blend_state_create_info                              = int(26)
	structure_type_pipeline_dynamic_state_create_info                                  = int(27)
	structure_type_graphics_pipeline_create_info                                       = int(28)
	structure_type_compute_pipeline_create_info                                        = int(29)
	structure_type_pipeline_layout_create_info                                         = int(30)
	structure_type_sampler_create_info                                                 = int(31)
	structure_type_descriptor_set_layout_create_info                                   = int(32)
	structure_type_descriptor_pool_create_info                                         = int(33)
	structure_type_descriptor_set_allocate_info                                        = int(34)
	structure_type_write_descriptor_set                                                = int(35)
	structure_type_copy_descriptor_set                                                 = int(36)
	structure_type_framebuffer_create_info                                             = int(37)
	structure_type_render_pass_create_info                                             = int(38)
	structure_type_command_pool_create_info                                            = int(39)
	structure_type_command_buffer_allocate_info                                        = int(40)
	structure_type_command_buffer_inheritance_info                                     = int(41)
	structure_type_command_buffer_begin_info                                           = int(42)
	structure_type_render_pass_begin_info                                              = int(43)
	structure_type_buffer_memory_barrier                                               = int(44)
	structure_type_image_memory_barrier                                                = int(45)
	structure_type_memory_barrier                                                      = int(46)
	structure_type_loader_instance_create_info                                         = int(47)
	structure_type_loader_device_create_info                                           = int(48)
	structure_type_physical_device_subgroup_properties                                 = int(1000094000)
	structure_type_bind_buffer_memory_info                                             = int(1000157000)
	structure_type_bind_image_memory_info                                              = int(1000157001)
	structure_type_physical_device16bit_storage_features                               = int(1000083000)
	structure_type_memory_dedicated_requirements                                       = int(1000127000)
	structure_type_memory_dedicated_allocate_info                                      = int(1000127001)
	structure_type_memory_allocate_flags_info                                          = int(1000060000)
	structure_type_device_group_render_pass_begin_info                                 = int(1000060003)
	structure_type_device_group_command_buffer_begin_info                              = int(1000060004)
	structure_type_device_group_submit_info                                            = int(1000060005)
	structure_type_device_group_bind_sparse_info                                       = int(1000060006)
	structure_type_bind_buffer_memory_device_group_info                                = int(1000060013)
	structure_type_bind_image_memory_device_group_info                                 = int(1000060014)
	structure_type_physical_device_group_properties                                    = int(1000070000)
	structure_type_device_group_device_create_info                                     = int(1000070001)
	structure_type_buffer_memory_requirements_info2                                    = int(1000146000)
	structure_type_image_memory_requirements_info2                                     = int(1000146001)
	structure_type_image_sparse_memory_requirements_info2                              = int(1000146002)
	structure_type_memory_requirements2                                                = int(1000146003)
	structure_type_sparse_image_memory_requirements2                                   = int(1000146004)
	structure_type_physical_device_features2                                           = int(1000059000)
	structure_type_physical_device_properties2                                         = int(1000059001)
	structure_type_format_properties2                                                  = int(1000059002)
	structure_type_image_format_properties2                                            = int(1000059003)
	structure_type_physical_device_image_format_info2                                  = int(1000059004)
	structure_type_queue_family_properties2                                            = int(1000059005)
	structure_type_physical_device_memory_properties2                                  = int(1000059006)
	structure_type_sparse_image_format_properties2                                     = int(1000059007)
	structure_type_physical_device_sparse_image_format_info2                           = int(1000059008)
	structure_type_physical_device_point_clipping_properties                           = int(1000117000)
	structure_type_render_pass_input_attachment_aspect_create_info                     = int(1000117001)
	structure_type_image_view_usage_create_info                                        = int(1000117002)
	structure_type_pipeline_tessellation_domain_origin_state_create_info               = int(1000117003)
	structure_type_render_pass_multiview_create_info                                   = int(1000053000)
	structure_type_physical_device_multiview_features                                  = int(1000053001)
	structure_type_physical_device_multiview_properties                                = int(1000053002)
	structure_type_physical_device_variable_pointers_features                          = int(1000120000)
	structure_type_protected_submit_info                                               = int(1000145000)
	structure_type_physical_device_protected_memory_features                           = int(1000145001)
	structure_type_physical_device_protected_memory_properties                         = int(1000145002)
	structure_type_device_queue_info2                                                  = int(1000145003)
	structure_type_sampler_ycbcr_conversion_create_info                                = int(1000156000)
	structure_type_sampler_ycbcr_conversion_info                                       = int(1000156001)
	structure_type_bind_image_plane_memory_info                                        = int(1000156002)
	structure_type_image_plane_memory_requirements_info                                = int(1000156003)
	structure_type_physical_device_sampler_ycbcr_conversion_features                   = int(1000156004)
	structure_type_sampler_ycbcr_conversion_image_format_properties                    = int(1000156005)
	structure_type_descriptor_update_template_create_info                              = int(1000085000)
	structure_type_physical_device_external_image_format_info                          = int(1000071000)
	structure_type_external_image_format_properties                                    = int(1000071001)
	structure_type_physical_device_external_buffer_info                                = int(1000071002)
	structure_type_external_buffer_properties                                          = int(1000071003)
	structure_type_physical_device_id_properties                                       = int(1000071004)
	structure_type_external_memory_buffer_create_info                                  = int(1000072000)
	structure_type_external_memory_image_create_info                                   = int(1000072001)
	structure_type_export_memory_allocate_info                                         = int(1000072002)
	structure_type_physical_device_external_fence_info                                 = int(1000112000)
	structure_type_external_fence_properties                                           = int(1000112001)
	structure_type_export_fence_create_info                                            = int(1000113000)
	structure_type_export_semaphore_create_info                                        = int(1000077000)
	structure_type_physical_device_external_semaphore_info                             = int(1000076000)
	structure_type_external_semaphore_properties                                       = int(1000076001)
	structure_type_physical_device_maintenance3_properties                             = int(1000168000)
	structure_type_descriptor_set_layout_support                                       = int(1000168001)
	structure_type_physical_device_shader_draw_parameters_features                     = int(1000063000)
	structure_type_physical_device_vulkan1_1_features                                  = int(49)
	structure_type_physical_device_vulkan1_1_properties                                = int(50)
	structure_type_physical_device_vulkan1_2_features                                  = int(51)
	structure_type_physical_device_vulkan1_2_properties                                = int(52)
	structure_type_image_format_list_create_info                                       = int(1000147000)
	structure_type_attachment_description2                                             = int(1000109000)
	structure_type_attachment_reference2                                               = int(1000109001)
	structure_type_subpass_description2                                                = int(1000109002)
	structure_type_subpass_dependency2                                                 = int(1000109003)
	structure_type_render_pass_create_info2                                            = int(1000109004)
	structure_type_subpass_begin_info                                                  = int(1000109005)
	structure_type_subpass_end_info                                                    = int(1000109006)
	structure_type_physical_device8bit_storage_features                                = int(1000177000)
	structure_type_physical_device_driver_properties                                   = int(1000196000)
	structure_type_physical_device_shader_atomic_int64_features                        = int(1000180000)
	structure_type_physical_device_shader_float16_int8_features                        = int(1000082000)
	structure_type_physical_device_float_controls_properties                           = int(1000197000)
	structure_type_descriptor_set_layout_binding_flags_create_info                     = int(1000161000)
	structure_type_physical_device_descriptor_indexing_features                        = int(1000161001)
	structure_type_physical_device_descriptor_indexing_properties                      = int(1000161002)
	structure_type_descriptor_set_variable_descriptor_count_allocate_info              = int(1000161003)
	structure_type_descriptor_set_variable_descriptor_count_layout_support             = int(1000161004)
	structure_type_physical_device_depth_stencil_resolve_properties                    = int(1000199000)
	structure_type_subpass_description_depth_stencil_resolve                           = int(1000199001)
	structure_type_physical_device_scalar_block_layout_features                        = int(1000221000)
	structure_type_image_stencil_usage_create_info                                     = int(1000246000)
	structure_type_physical_device_sampler_filter_minmax_properties                    = int(1000130000)
	structure_type_sampler_reduction_mode_create_info                                  = int(1000130001)
	structure_type_physical_device_vulkan_memory_model_features                        = int(1000211000)
	structure_type_physical_device_imageless_framebuffer_features                      = int(1000108000)
	structure_type_framebuffer_attachments_create_info                                 = int(1000108001)
	structure_type_framebuffer_attachment_image_info                                   = int(1000108002)
	structure_type_render_pass_attachment_begin_info                                   = int(1000108003)
	structure_type_physical_device_uniform_buffer_standard_layout_features             = int(1000253000)
	structure_type_physical_device_shader_subgroup_extended_types_features             = int(1000175000)
	structure_type_physical_device_separate_depth_stencil_layouts_features             = int(1000241000)
	structure_type_attachment_reference_stencil_layout                                 = int(1000241001)
	structure_type_attachment_description_stencil_layout                               = int(1000241002)
	structure_type_physical_device_host_query_reset_features                           = int(1000261000)
	structure_type_physical_device_timeline_semaphore_features                         = int(1000207000)
	structure_type_physical_device_timeline_semaphore_properties                       = int(1000207001)
	structure_type_semaphore_type_create_info                                          = int(1000207002)
	structure_type_timeline_semaphore_submit_info                                      = int(1000207003)
	structure_type_semaphore_wait_info                                                 = int(1000207004)
	structure_type_semaphore_signal_info                                               = int(1000207005)
	structure_type_physical_device_buffer_device_address_features                      = int(1000257000)
	structure_type_buffer_device_address_info                                          = int(1000244001)
	structure_type_buffer_opaque_capture_address_create_info                           = int(1000257002)
	structure_type_memory_opaque_capture_address_allocate_info                         = int(1000257003)
	structure_type_device_memory_opaque_capture_address_info                           = int(1000257004)
	structure_type_physical_device_vulkan1_3_features                                  = int(53)
	structure_type_physical_device_vulkan1_3_properties                                = int(54)
	structure_type_pipeline_creation_feedback_create_info                              = int(1000192000)
	structure_type_physical_device_shader_terminate_invocation_features                = int(1000215000)
	structure_type_physical_device_tool_properties                                     = int(1000245000)
	structure_type_physical_device_shader_demote_to_helper_invocation_features         = int(1000276000)
	structure_type_physical_device_private_data_features                               = int(1000295000)
	structure_type_device_private_data_create_info                                     = int(1000295001)
	structure_type_private_data_slot_create_info                                       = int(1000295002)
	structure_type_physical_device_pipeline_creation_cache_control_features            = int(1000297000)
	structure_type_memory_barrier2                                                     = int(1000314000)
	structure_type_buffer_memory_barrier2                                              = int(1000314001)
	structure_type_image_memory_barrier2                                               = int(1000314002)
	structure_type_dependency_info                                                     = int(1000314003)
	structure_type_submit_info2                                                        = int(1000314004)
	structure_type_semaphore_submit_info                                               = int(1000314005)
	structure_type_command_buffer_submit_info                                          = int(1000314006)
	structure_type_physical_device_synchronization2_features                           = int(1000314007)
	structure_type_physical_device_zero_initialize_workgroup_memory_features           = int(1000325000)
	structure_type_physical_device_image_robustness_features                           = int(1000335000)
	structure_type_copy_buffer_info2                                                   = int(1000337000)
	structure_type_copy_image_info2                                                    = int(1000337001)
	structure_type_copy_buffer_to_image_info2                                          = int(1000337002)
	structure_type_copy_image_to_buffer_info2                                          = int(1000337003)
	structure_type_blit_image_info2                                                    = int(1000337004)
	structure_type_resolve_image_info2                                                 = int(1000337005)
	structure_type_buffer_copy2                                                        = int(1000337006)
	structure_type_image_copy2                                                         = int(1000337007)
	structure_type_image_blit2                                                         = int(1000337008)
	structure_type_buffer_image_copy2                                                  = int(1000337009)
	structure_type_image_resolve2                                                      = int(1000337010)
	structure_type_physical_device_subgroup_size_control_properties                    = int(1000225000)
	structure_type_pipeline_shader_stage_required_subgroup_size_create_info            = int(1000225001)
	structure_type_physical_device_subgroup_size_control_features                      = int(1000225002)
	structure_type_physical_device_inline_uniform_block_features                       = int(1000138000)
	structure_type_physical_device_inline_uniform_block_properties                     = int(1000138001)
	structure_type_write_descriptor_set_inline_uniform_block                           = int(1000138002)
	structure_type_descriptor_pool_inline_uniform_block_create_info                    = int(1000138003)
	structure_type_physical_device_texture_compression_astc_hdr_features               = int(1000066000)
	structure_type_rendering_info                                                      = int(1000044000)
	structure_type_rendering_attachment_info                                           = int(1000044001)
	structure_type_pipeline_rendering_create_info                                      = int(1000044002)
	structure_type_physical_device_dynamic_rendering_features                          = int(1000044003)
	structure_type_command_buffer_inheritance_rendering_info                           = int(1000044004)
	structure_type_physical_device_shader_integer_dot_product_features                 = int(1000280000)
	structure_type_physical_device_shader_integer_dot_product_properties               = int(1000280001)
	structure_type_physical_device_texel_buffer_alignment_properties                   = int(1000281001)
	structure_type_format_properties3                                                  = int(1000360000)
	structure_type_physical_device_maintenance4_features                               = int(1000413000)
	structure_type_physical_device_maintenance4_properties                             = int(1000413001)
	structure_type_device_buffer_memory_requirements                                   = int(1000413002)
	structure_type_device_image_memory_requirements                                    = int(1000413003)
	structure_type_swapchain_create_info_khr                                           = int(1000001000)
	structure_type_present_info_khr                                                    = int(1000001001)
	structure_type_device_group_present_capabilities_khr                               = int(1000060007)
	structure_type_image_swapchain_create_info_khr                                     = int(1000060008)
	structure_type_bind_image_memory_swapchain_info_khr                                = int(1000060009)
	structure_type_acquire_next_image_info_khr                                         = int(1000060010)
	structure_type_device_group_present_info_khr                                       = int(1000060011)
	structure_type_device_group_swapchain_create_info_khr                              = int(1000060012)
	structure_type_display_mode_create_info_khr                                        = int(1000002000)
	structure_type_display_surface_create_info_khr                                     = int(1000002001)
	structure_type_display_present_info_khr                                            = int(1000003000)
	structure_type_xlib_surface_create_info_khr                                        = int(1000004000)
	structure_type_xcb_surface_create_info_khr                                         = int(1000005000)
	structure_type_wayland_surface_create_info_khr                                     = int(1000006000)
	structure_type_android_surface_create_info_khr                                     = int(1000008000)
	structure_type_win32_surface_create_info_khr                                       = int(1000009000)
	structure_type_debug_report_callback_create_info_ext                               = int(1000011000)
	structure_type_pipeline_rasterization_state_rasterization_order_amd                = int(1000018000)
	structure_type_debug_marker_object_name_info_ext                                   = int(1000022000)
	structure_type_debug_marker_object_tag_info_ext                                    = int(1000022001)
	structure_type_debug_marker_marker_info_ext                                        = int(1000022002)
	structure_type_video_profile_info_khr                                              = int(1000023000)
	structure_type_video_capabilities_khr                                              = int(1000023001)
	structure_type_video_picture_resource_info_khr                                     = int(1000023002)
	structure_type_video_session_memory_requirements_khr                               = int(1000023003)
	structure_type_bind_video_session_memory_info_khr                                  = int(1000023004)
	structure_type_video_session_create_info_khr                                       = int(1000023005)
	structure_type_video_session_parameters_create_info_khr                            = int(1000023006)
	structure_type_video_session_parameters_update_info_khr                            = int(1000023007)
	structure_type_video_begin_coding_info_khr                                         = int(1000023008)
	structure_type_video_end_coding_info_khr                                           = int(1000023009)
	structure_type_video_coding_control_info_khr                                       = int(1000023010)
	structure_type_video_reference_slot_info_khr                                       = int(1000023011)
	structure_type_queue_family_video_properties_khr                                   = int(1000023012)
	structure_type_video_profile_list_info_khr                                         = int(1000023013)
	structure_type_physical_device_video_format_info_khr                               = int(1000023014)
	structure_type_video_format_properties_khr                                         = int(1000023015)
	structure_type_queue_family_query_result_status_properties_khr                     = int(1000023016)
	structure_type_video_decode_info_khr                                               = int(1000024000)
	structure_type_video_decode_capabilities_khr                                       = int(1000024001)
	structure_type_video_decode_usage_info_khr                                         = int(1000024002)
	structure_type_dedicated_allocation_image_create_info_nv                           = int(1000026000)
	structure_type_dedicated_allocation_buffer_create_info_nv                          = int(1000026001)
	structure_type_dedicated_allocation_memory_allocate_info_nv                        = int(1000026002)
	structure_type_physical_device_transform_feedback_features_ext                     = int(1000028000)
	structure_type_physical_device_transform_feedback_properties_ext                   = int(1000028001)
	structure_type_pipeline_rasterization_state_stream_create_info_ext                 = int(1000028002)
	structure_type_cu_module_create_info_nvx                                           = int(1000029000)
	structure_type_cu_function_create_info_nvx                                         = int(1000029001)
	structure_type_cu_launch_info_nvx                                                  = int(1000029002)
	structure_type_cu_module_texturing_mode_create_info_nvx                            = int(1000029004)
	structure_type_image_view_handle_info_nvx                                          = int(1000030000)
	structure_type_image_view_address_properties_nvx                                   = int(1000030001)
	structure_type_video_encode_h264_capabilities_khr                                  = int(1000038000)
	structure_type_video_encode_h264_session_parameters_create_info_khr                = int(1000038001)
	structure_type_video_encode_h264_session_parameters_add_info_khr                   = int(1000038002)
	structure_type_video_encode_h264_picture_info_khr                                  = int(1000038003)
	structure_type_video_encode_h264_dpb_slot_info_khr                                 = int(1000038004)
	structure_type_video_encode_h264_nalu_slice_info_khr                               = int(1000038005)
	structure_type_video_encode_h264_gop_remaining_frame_info_khr                      = int(1000038006)
	structure_type_video_encode_h264_profile_info_khr                                  = int(1000038007)
	structure_type_video_encode_h264_rate_control_info_khr                             = int(1000038008)
	structure_type_video_encode_h264_rate_control_layer_info_khr                       = int(1000038009)
	structure_type_video_encode_h264_session_create_info_khr                           = int(1000038010)
	structure_type_video_encode_h264_quality_level_properties_khr                      = int(1000038011)
	structure_type_video_encode_h264_session_parameters_get_info_khr                   = int(1000038012)
	structure_type_video_encode_h264_session_parameters_feedback_info_khr              = int(1000038013)
	structure_type_video_encode_h265_capabilities_khr                                  = int(1000039000)
	structure_type_video_encode_h265_session_parameters_create_info_khr                = int(1000039001)
	structure_type_video_encode_h265_session_parameters_add_info_khr                   = int(1000039002)
	structure_type_video_encode_h265_picture_info_khr                                  = int(1000039003)
	structure_type_video_encode_h265_dpb_slot_info_khr                                 = int(1000039004)
	structure_type_video_encode_h265_nalu_slice_segment_info_khr                       = int(1000039005)
	structure_type_video_encode_h265_gop_remaining_frame_info_khr                      = int(1000039006)
	structure_type_video_encode_h265_profile_info_khr                                  = int(1000039007)
	structure_type_video_encode_h265_rate_control_info_khr                             = int(1000039009)
	structure_type_video_encode_h265_rate_control_layer_info_khr                       = int(1000039010)
	structure_type_video_encode_h265_session_create_info_khr                           = int(1000039011)
	structure_type_video_encode_h265_quality_level_properties_khr                      = int(1000039012)
	structure_type_video_encode_h265_session_parameters_get_info_khr                   = int(1000039013)
	structure_type_video_encode_h265_session_parameters_feedback_info_khr              = int(1000039014)
	structure_type_video_decode_h264_capabilities_khr                                  = int(1000040000)
	structure_type_video_decode_h264_picture_info_khr                                  = int(1000040001)
	structure_type_video_decode_h264_profile_info_khr                                  = int(1000040003)
	structure_type_video_decode_h264_session_parameters_create_info_khr                = int(1000040004)
	structure_type_video_decode_h264_session_parameters_add_info_khr                   = int(1000040005)
	structure_type_video_decode_h264_dpb_slot_info_khr                                 = int(1000040006)
	structure_type_texture_lod_gather_format_properties_amd                            = int(1000041000)
	structure_type_stream_descriptor_surface_create_info_ggp                           = int(1000049000)
	structure_type_physical_device_corner_sampled_image_features_nv                    = int(1000050000)
	structure_type_external_memory_image_create_info_nv                                = int(1000056000)
	structure_type_export_memory_allocate_info_nv                                      = int(1000056001)
	structure_type_import_memory_win32_handle_info_nv                                  = int(1000057000)
	structure_type_export_memory_win32_handle_info_nv                                  = int(1000057001)
	structure_type_win32_keyed_mutex_acquire_release_info_nv                           = int(1000058000)
	structure_type_validation_flags_ext                                                = int(1000061000)
	structure_type_vi_surface_create_info_nn                                           = int(1000062000)
	structure_type_image_view_astc_decode_mode_ext                                     = int(1000067000)
	structure_type_physical_device_astc_decode_features_ext                            = int(1000067001)
	structure_type_pipeline_robustness_create_info_ext                                 = int(1000068000)
	structure_type_physical_device_pipeline_robustness_features_ext                    = int(1000068001)
	structure_type_physical_device_pipeline_robustness_properties_ext                  = int(1000068002)
	structure_type_import_memory_win32_handle_info_khr                                 = int(1000073000)
	structure_type_export_memory_win32_handle_info_khr                                 = int(1000073001)
	structure_type_memory_win32_handle_properties_khr                                  = int(1000073002)
	structure_type_memory_get_win32_handle_info_khr                                    = int(1000073003)
	structure_type_import_memory_fd_info_khr                                           = int(1000074000)
	structure_type_memory_fd_properties_khr                                            = int(1000074001)
	structure_type_memory_get_fd_info_khr                                              = int(1000074002)
	structure_type_win32_keyed_mutex_acquire_release_info_khr                          = int(1000075000)
	structure_type_import_semaphore_win32_handle_info_khr                              = int(1000078000)
	structure_type_export_semaphore_win32_handle_info_khr                              = int(1000078001)
	structure_type_d3d12_fence_submit_info_khr                                         = int(1000078002)
	structure_type_semaphore_get_win32_handle_info_khr                                 = int(1000078003)
	structure_type_import_semaphore_fd_info_khr                                        = int(1000079000)
	structure_type_semaphore_get_fd_info_khr                                           = int(1000079001)
	structure_type_physical_device_push_descriptor_properties_khr                      = int(1000080000)
	structure_type_command_buffer_inheritance_conditional_rendering_info_ext           = int(1000081000)
	structure_type_physical_device_conditional_rendering_features_ext                  = int(1000081001)
	structure_type_conditional_rendering_begin_info_ext                                = int(1000081002)
	structure_type_present_regions_khr                                                 = int(1000084000)
	structure_type_pipeline_viewport_w_scaling_state_create_info_nv                    = int(1000087000)
	structure_type_surface_capabilities2_ext                                           = int(1000090000)
	structure_type_display_power_info_ext                                              = int(1000091000)
	structure_type_device_event_info_ext                                               = int(1000091001)
	structure_type_display_event_info_ext                                              = int(1000091002)
	structure_type_swapchain_counter_create_info_ext                                   = int(1000091003)
	structure_type_present_times_info_google                                           = int(1000092000)
	structure_type_physical_device_multiview_per_view_attributes_properties_nvx        = int(1000097000)
	structure_type_multiview_per_view_attributes_info_nvx                              = int(1000044009)
	structure_type_pipeline_viewport_swizzle_state_create_info_nv                      = int(1000098000)
	structure_type_physical_device_discard_rectangle_properties_ext                    = int(1000099000)
	structure_type_pipeline_discard_rectangle_state_create_info_ext                    = int(1000099001)
	structure_type_physical_device_conservative_rasterization_properties_ext           = int(1000101000)
	structure_type_pipeline_rasterization_conservative_state_create_info_ext           = int(1000101001)
	structure_type_physical_device_depth_clip_enable_features_ext                      = int(1000102000)
	structure_type_pipeline_rasterization_depth_clip_state_create_info_ext             = int(1000102001)
	structure_type_hdr_metadata_ext                                                    = int(1000105000)
	structure_type_physical_device_relaxed_line_rasterization_features_img             = int(1000110000)
	structure_type_shared_present_surface_capabilities_khr                             = int(1000111000)
	structure_type_import_fence_win32_handle_info_khr                                  = int(1000114000)
	structure_type_export_fence_win32_handle_info_khr                                  = int(1000114001)
	structure_type_fence_get_win32_handle_info_khr                                     = int(1000114002)
	structure_type_import_fence_fd_info_khr                                            = int(1000115000)
	structure_type_fence_get_fd_info_khr                                               = int(1000115001)
	structure_type_physical_device_performance_query_features_khr                      = int(1000116000)
	structure_type_physical_device_performance_query_properties_khr                    = int(1000116001)
	structure_type_query_pool_performance_create_info_khr                              = int(1000116002)
	structure_type_performance_query_submit_info_khr                                   = int(1000116003)
	structure_type_acquire_profiling_lock_info_khr                                     = int(1000116004)
	structure_type_performance_counter_khr                                             = int(1000116005)
	structure_type_performance_counter_description_khr                                 = int(1000116006)
	structure_type_physical_device_surface_info2_khr                                   = int(1000119000)
	structure_type_surface_capabilities2_khr                                           = int(1000119001)
	structure_type_surface_format2_khr                                                 = int(1000119002)
	structure_type_display_properties2_khr                                             = int(1000121000)
	structure_type_display_plane_properties2_khr                                       = int(1000121001)
	structure_type_display_mode_properties2_khr                                        = int(1000121002)
	structure_type_display_plane_info2_khr                                             = int(1000121003)
	structure_type_display_plane_capabilities2_khr                                     = int(1000121004)
	structure_type_ios_surface_create_info_mvk                                         = int(1000122000)
	structure_type_macos_surface_create_info_mvk                                       = int(1000123000)
	structure_type_debug_utils_object_name_info_ext                                    = int(1000128000)
	structure_type_debug_utils_object_tag_info_ext                                     = int(1000128001)
	structure_type_debug_utils_label_ext                                               = int(1000128002)
	structure_type_debug_utils_messenger_callback_data_ext                             = int(1000128003)
	structure_type_debug_utils_messenger_create_info_ext                               = int(1000128004)
	structure_type_android_hardware_buffer_usage_android                               = int(1000129000)
	structure_type_android_hardware_buffer_properties_android                          = int(1000129001)
	structure_type_android_hardware_buffer_format_properties_android                   = int(1000129002)
	structure_type_import_android_hardware_buffer_info_android                         = int(1000129003)
	structure_type_memory_get_android_hardware_buffer_info_android                     = int(1000129004)
	structure_type_external_format_android                                             = int(1000129005)
	structure_type_android_hardware_buffer_format_properties2_android                  = int(1000129006)
	structure_type_attachment_sample_count_info_amd                                    = int(1000044008)
	structure_type_sample_locations_info_ext                                           = int(1000143000)
	structure_type_render_pass_sample_locations_begin_info_ext                         = int(1000143001)
	structure_type_pipeline_sample_locations_state_create_info_ext                     = int(1000143002)
	structure_type_physical_device_sample_locations_properties_ext                     = int(1000143003)
	structure_type_multisample_properties_ext                                          = int(1000143004)
	structure_type_physical_device_blend_operation_advanced_features_ext               = int(1000148000)
	structure_type_physical_device_blend_operation_advanced_properties_ext             = int(1000148001)
	structure_type_pipeline_color_blend_advanced_state_create_info_ext                 = int(1000148002)
	structure_type_pipeline_coverage_to_color_state_create_info_nv                     = int(1000149000)
	structure_type_write_descriptor_set_acceleration_structure_khr                     = int(1000150007)
	structure_type_acceleration_structure_build_geometry_info_khr                      = int(1000150000)
	structure_type_acceleration_structure_device_address_info_khr                      = int(1000150002)
	structure_type_acceleration_structure_geometry_aabbs_data_khr                      = int(1000150003)
	structure_type_acceleration_structure_geometry_instances_data_khr                  = int(1000150004)
	structure_type_acceleration_structure_geometry_triangles_data_khr                  = int(1000150005)
	structure_type_acceleration_structure_geometry_khr                                 = int(1000150006)
	structure_type_acceleration_structure_version_info_khr                             = int(1000150009)
	structure_type_copy_acceleration_structure_info_khr                                = int(1000150010)
	structure_type_copy_acceleration_structure_to_memory_info_khr                      = int(1000150011)
	structure_type_copy_memory_to_acceleration_structure_info_khr                      = int(1000150012)
	structure_type_physical_device_acceleration_structure_features_khr                 = int(1000150013)
	structure_type_physical_device_acceleration_structure_properties_khr               = int(1000150014)
	structure_type_acceleration_structure_create_info_khr                              = int(1000150017)
	structure_type_acceleration_structure_build_sizes_info_khr                         = int(1000150020)
	structure_type_physical_device_ray_tracing_pipeline_features_khr                   = int(1000347000)
	structure_type_physical_device_ray_tracing_pipeline_properties_khr                 = int(1000347001)
	structure_type_ray_tracing_pipeline_create_info_khr                                = int(1000150015)
	structure_type_ray_tracing_shader_group_create_info_khr                            = int(1000150016)
	structure_type_ray_tracing_pipeline_interface_create_info_khr                      = int(1000150018)
	structure_type_physical_device_ray_query_features_khr                              = int(1000348013)
	structure_type_pipeline_coverage_modulation_state_create_info_nv                   = int(1000152000)
	structure_type_physical_device_shader_sm_builtins_features_nv                      = int(1000154000)
	structure_type_physical_device_shader_sm_builtins_properties_nv                    = int(1000154001)
	structure_type_drm_format_modifier_properties_list_ext                             = int(1000158000)
	structure_type_physical_device_image_drm_format_modifier_info_ext                  = int(1000158002)
	structure_type_image_drm_format_modifier_list_create_info_ext                      = int(1000158003)
	structure_type_image_drm_format_modifier_explicit_create_info_ext                  = int(1000158004)
	structure_type_image_drm_format_modifier_properties_ext                            = int(1000158005)
	structure_type_drm_format_modifier_properties_list2_ext                            = int(1000158006)
	structure_type_validation_cache_create_info_ext                                    = int(1000160000)
	structure_type_shader_module_validation_cache_create_info_ext                      = int(1000160001)
	structure_type_pipeline_viewport_shading_rate_image_state_create_info_nv           = int(1000164000)
	structure_type_physical_device_shading_rate_image_features_nv                      = int(1000164001)
	structure_type_physical_device_shading_rate_image_properties_nv                    = int(1000164002)
	structure_type_pipeline_viewport_coarse_sample_order_state_create_info_nv          = int(1000164005)
	structure_type_ray_tracing_pipeline_create_info_nv                                 = int(1000165000)
	structure_type_acceleration_structure_create_info_nv                               = int(1000165001)
	structure_type_geometry_nv                                                         = int(1000165003)
	structure_type_geometry_triangles_nv                                               = int(1000165004)
	structure_type_geometry_aabb_nv                                                    = int(1000165005)
	structure_type_bind_acceleration_structure_memory_info_nv                          = int(1000165006)
	structure_type_write_descriptor_set_acceleration_structure_nv                      = int(1000165007)
	structure_type_acceleration_structure_memory_requirements_info_nv                  = int(1000165008)
	structure_type_physical_device_ray_tracing_properties_nv                           = int(1000165009)
	structure_type_ray_tracing_shader_group_create_info_nv                             = int(1000165011)
	structure_type_acceleration_structure_info_nv                                      = int(1000165012)
	structure_type_physical_device_representative_fragment_test_features_nv            = int(1000166000)
	structure_type_pipeline_representative_fragment_test_state_create_info_nv          = int(1000166001)
	structure_type_physical_device_image_view_image_format_info_ext                    = int(1000170000)
	structure_type_filter_cubic_image_view_image_format_properties_ext                 = int(1000170001)
	structure_type_import_memory_host_pointer_info_ext                                 = int(1000178000)
	structure_type_memory_host_pointer_properties_ext                                  = int(1000178001)
	structure_type_physical_device_external_memory_host_properties_ext                 = int(1000178002)
	structure_type_physical_device_shader_clock_features_khr                           = int(1000181000)
	structure_type_pipeline_compiler_control_create_info_amd                           = int(1000183000)
	structure_type_physical_device_shader_core_properties_amd                          = int(1000185000)
	structure_type_video_decode_h265_capabilities_khr                                  = int(1000187000)
	structure_type_video_decode_h265_session_parameters_create_info_khr                = int(1000187001)
	structure_type_video_decode_h265_session_parameters_add_info_khr                   = int(1000187002)
	structure_type_video_decode_h265_profile_info_khr                                  = int(1000187003)
	structure_type_video_decode_h265_picture_info_khr                                  = int(1000187004)
	structure_type_video_decode_h265_dpb_slot_info_khr                                 = int(1000187005)
	structure_type_device_queue_global_priority_create_info_khr                        = int(1000174000)
	structure_type_physical_device_global_priority_query_features_khr                  = int(1000388000)
	structure_type_queue_family_global_priority_properties_khr                         = int(1000388001)
	structure_type_device_memory_overallocation_create_info_amd                        = int(1000189000)
	structure_type_physical_device_vertex_attribute_divisor_properties_ext             = int(1000190000)
	structure_type_present_frame_token_ggp                                             = int(1000191000)
	structure_type_physical_device_mesh_shader_features_nv                             = int(1000202000)
	structure_type_physical_device_mesh_shader_properties_nv                           = int(1000202001)
	structure_type_physical_device_shader_image_footprint_features_nv                  = int(1000204000)
	structure_type_pipeline_viewport_exclusive_scissor_state_create_info_nv            = int(1000205000)
	structure_type_physical_device_exclusive_scissor_features_nv                       = int(1000205002)
	structure_type_checkpoint_data_nv                                                  = int(1000206000)
	structure_type_queue_family_checkpoint_properties_nv                               = int(1000206001)
	structure_type_queue_family_checkpoint_properties2_nv                              = int(1000314008)
	structure_type_checkpoint_data2_nv                                                 = int(1000314009)
	structure_type_physical_device_shader_integer_functions2_features_intel            = int(1000209000)
	structure_type_query_pool_performance_query_create_info_intel                      = int(1000210000)
	structure_type_initialize_performance_api_info_intel                               = int(1000210001)
	structure_type_performance_marker_info_intel                                       = int(1000210002)
	structure_type_performance_stream_marker_info_intel                                = int(1000210003)
	structure_type_performance_override_info_intel                                     = int(1000210004)
	structure_type_performance_configuration_acquire_info_intel                        = int(1000210005)
	structure_type_physical_device_pci_bus_info_properties_ext                         = int(1000212000)
	structure_type_display_native_hdr_surface_capabilities_amd                         = int(1000213000)
	structure_type_swapchain_display_native_hdr_create_info_amd                        = int(1000213001)
	structure_type_imagepipe_surface_create_info_fuchsia                               = int(1000214000)
	structure_type_metal_surface_create_info_ext                                       = int(1000217000)
	structure_type_physical_device_fragment_density_map_features_ext                   = int(1000218000)
	structure_type_physical_device_fragment_density_map_properties_ext                 = int(1000218001)
	structure_type_render_pass_fragment_density_map_create_info_ext                    = int(1000218002)
	structure_type_rendering_fragment_density_map_attachment_info_ext                  = int(1000044007)
	structure_type_fragment_shading_rate_attachment_info_khr                           = int(1000226000)
	structure_type_pipeline_fragment_shading_rate_state_create_info_khr                = int(1000226001)
	structure_type_physical_device_fragment_shading_rate_properties_khr                = int(1000226002)
	structure_type_physical_device_fragment_shading_rate_features_khr                  = int(1000226003)
	structure_type_physical_device_fragment_shading_rate_khr                           = int(1000226004)
	structure_type_rendering_fragment_shading_rate_attachment_info_khr                 = int(1000044006)
	structure_type_physical_device_shader_core_properties2_amd                         = int(1000227000)
	structure_type_physical_device_coherent_memory_features_amd                        = int(1000229000)
	structure_type_physical_device_dynamic_rendering_local_read_features_khr           = int(1000232000)
	structure_type_rendering_attachment_location_info_khr                              = int(1000232001)
	structure_type_rendering_input_attachment_index_info_khr                           = int(1000232002)
	structure_type_physical_device_shader_image_atomic_int64_features_ext              = int(1000234000)
	structure_type_physical_device_shader_quad_control_features_khr                    = int(1000235000)
	structure_type_physical_device_memory_budget_properties_ext                        = int(1000237000)
	structure_type_physical_device_memory_priority_features_ext                        = int(1000238000)
	structure_type_memory_priority_allocate_info_ext                                   = int(1000238001)
	structure_type_surface_protected_capabilities_khr                                  = int(1000239000)
	structure_type_physical_device_dedicated_allocation_image_aliasing_features_nv     = int(1000240000)
	structure_type_physical_device_buffer_device_address_features_ext                  = int(1000244000)
	structure_type_buffer_device_address_create_info_ext                               = int(1000244002)
	structure_type_validation_features_ext                                             = int(1000247000)
	structure_type_physical_device_present_wait_features_khr                           = int(1000248000)
	structure_type_physical_device_cooperative_matrix_features_nv                      = int(1000249000)
	structure_type_cooperative_matrix_properties_nv                                    = int(1000249001)
	structure_type_physical_device_cooperative_matrix_properties_nv                    = int(1000249002)
	structure_type_physical_device_coverage_reduction_mode_features_nv                 = int(1000250000)
	structure_type_pipeline_coverage_reduction_state_create_info_nv                    = int(1000250001)
	structure_type_framebuffer_mixed_samples_combination_nv                            = int(1000250002)
	structure_type_physical_device_fragment_shader_interlock_features_ext              = int(1000251000)
	structure_type_physical_device_ycbcr_image_arrays_features_ext                     = int(1000252000)
	structure_type_physical_device_provoking_vertex_features_ext                       = int(1000254000)
	structure_type_pipeline_rasterization_provoking_vertex_state_create_info_ext       = int(1000254001)
	structure_type_physical_device_provoking_vertex_properties_ext                     = int(1000254002)
	structure_type_surface_full_screen_exclusive_info_ext                              = int(1000255000)
	structure_type_surface_capabilities_full_screen_exclusive_ext                      = int(1000255002)
	structure_type_surface_full_screen_exclusive_win32_info_ext                        = int(1000255001)
	structure_type_headless_surface_create_info_ext                                    = int(1000256000)
	structure_type_physical_device_shader_atomic_float_features_ext                    = int(1000260000)
	structure_type_physical_device_extended_dynamic_state_features_ext                 = int(1000267000)
	structure_type_physical_device_pipeline_executable_properties_features_khr         = int(1000269000)
	structure_type_pipeline_info_khr                                                   = int(1000269001)
	structure_type_pipeline_executable_properties_khr                                  = int(1000269002)
	structure_type_pipeline_executable_info_khr                                        = int(1000269003)
	structure_type_pipeline_executable_statistic_khr                                   = int(1000269004)
	structure_type_pipeline_executable_internal_representation_khr                     = int(1000269005)
	structure_type_physical_device_host_image_copy_features_ext                        = int(1000270000)
	structure_type_physical_device_host_image_copy_properties_ext                      = int(1000270001)
	structure_type_memory_to_image_copy_ext                                            = int(1000270002)
	structure_type_image_to_memory_copy_ext                                            = int(1000270003)
	structure_type_copy_image_to_memory_info_ext                                       = int(1000270004)
	structure_type_copy_memory_to_image_info_ext                                       = int(1000270005)
	structure_type_host_image_layout_transition_info_ext                               = int(1000270006)
	structure_type_copy_image_to_image_info_ext                                        = int(1000270007)
	structure_type_subresource_host_memcpy_size_ext                                    = int(1000270008)
	structure_type_host_image_copy_device_performance_query_ext                        = int(1000270009)
	structure_type_memory_map_info_khr                                                 = int(1000271000)
	structure_type_memory_unmap_info_khr                                               = int(1000271001)
	structure_type_physical_device_map_memory_placed_features_ext                      = int(1000272000)
	structure_type_physical_device_map_memory_placed_properties_ext                    = int(1000272001)
	structure_type_memory_map_placed_info_ext                                          = int(1000272002)
	structure_type_physical_device_shader_atomic_float2_features_ext                   = int(1000273000)
	structure_type_surface_present_mode_ext                                            = int(1000274000)
	structure_type_surface_present_scaling_capabilities_ext                            = int(1000274001)
	structure_type_surface_present_mode_compatibility_ext                              = int(1000274002)
	structure_type_physical_device_swapchain_maintenance1_features_ext                 = int(1000275000)
	structure_type_swapchain_present_fence_info_ext                                    = int(1000275001)
	structure_type_swapchain_present_modes_create_info_ext                             = int(1000275002)
	structure_type_swapchain_present_mode_info_ext                                     = int(1000275003)
	structure_type_swapchain_present_scaling_create_info_ext                           = int(1000275004)
	structure_type_release_swapchain_images_info_ext                                   = int(1000275005)
	structure_type_physical_device_device_generated_commands_properties_nv             = int(1000277000)
	structure_type_graphics_shader_group_create_info_nv                                = int(1000277001)
	structure_type_graphics_pipeline_shader_groups_create_info_nv                      = int(1000277002)
	structure_type_indirect_commands_layout_token_nv                                   = int(1000277003)
	structure_type_indirect_commands_layout_create_info_nv                             = int(1000277004)
	structure_type_generated_commands_info_nv                                          = int(1000277005)
	structure_type_generated_commands_memory_requirements_info_nv                      = int(1000277006)
	structure_type_physical_device_device_generated_commands_features_nv               = int(1000277007)
	structure_type_physical_device_inherited_viewport_scissor_features_nv              = int(1000278000)
	structure_type_command_buffer_inheritance_viewport_scissor_info_nv                 = int(1000278001)
	structure_type_physical_device_texel_buffer_alignment_features_ext                 = int(1000281000)
	structure_type_command_buffer_inheritance_render_pass_transform_info_qcom          = int(1000282000)
	structure_type_render_pass_transform_begin_info_qcom                               = int(1000282001)
	structure_type_physical_device_depth_bias_control_features_ext                     = int(1000283000)
	structure_type_depth_bias_info_ext                                                 = int(1000283001)
	structure_type_depth_bias_representation_info_ext                                  = int(1000283002)
	structure_type_physical_device_device_memory_report_features_ext                   = int(1000284000)
	structure_type_device_device_memory_report_create_info_ext                         = int(1000284001)
	structure_type_device_memory_report_callback_data_ext                              = int(1000284002)
	structure_type_physical_device_robustness2_features_ext                            = int(1000286000)
	structure_type_physical_device_robustness2_properties_ext                          = int(1000286001)
	structure_type_sampler_custom_border_color_create_info_ext                         = int(1000287000)
	structure_type_physical_device_custom_border_color_properties_ext                  = int(1000287001)
	structure_type_physical_device_custom_border_color_features_ext                    = int(1000287002)
	structure_type_pipeline_library_create_info_khr                                    = int(1000290000)
	structure_type_physical_device_present_barrier_features_nv                         = int(1000292000)
	structure_type_surface_capabilities_present_barrier_nv                             = int(1000292001)
	structure_type_swapchain_present_barrier_create_info_nv                            = int(1000292002)
	structure_type_present_id_khr                                                      = int(1000294000)
	structure_type_physical_device_present_id_features_khr                             = int(1000294001)
	structure_type_video_encode_info_khr                                               = int(1000299000)
	structure_type_video_encode_rate_control_info_khr                                  = int(1000299001)
	structure_type_video_encode_rate_control_layer_info_khr                            = int(1000299002)
	structure_type_video_encode_capabilities_khr                                       = int(1000299003)
	structure_type_video_encode_usage_info_khr                                         = int(1000299004)
	structure_type_query_pool_video_encode_feedback_create_info_khr                    = int(1000299005)
	structure_type_physical_device_video_encode_quality_level_info_khr                 = int(1000299006)
	structure_type_video_encode_quality_level_properties_khr                           = int(1000299007)
	structure_type_video_encode_quality_level_info_khr                                 = int(1000299008)
	structure_type_video_encode_session_parameters_get_info_khr                        = int(1000299009)
	structure_type_video_encode_session_parameters_feedback_info_khr                   = int(1000299010)
	structure_type_physical_device_diagnostics_config_features_nv                      = int(1000300000)
	structure_type_device_diagnostics_config_create_info_nv                            = int(1000300001)
	structure_type_cuda_module_create_info_nv                                          = int(1000307000)
	structure_type_cuda_function_create_info_nv                                        = int(1000307001)
	structure_type_cuda_launch_info_nv                                                 = int(1000307002)
	structure_type_physical_device_cuda_kernel_launch_features_nv                      = int(1000307003)
	structure_type_physical_device_cuda_kernel_launch_properties_nv                    = int(1000307004)
	structure_type_query_low_latency_support_nv                                        = int(1000310000)
	structure_type_export_metal_object_create_info_ext                                 = int(1000311000)
	structure_type_export_metal_objects_info_ext                                       = int(1000311001)
	structure_type_export_metal_device_info_ext                                        = int(1000311002)
	structure_type_export_metal_command_queue_info_ext                                 = int(1000311003)
	structure_type_export_metal_buffer_info_ext                                        = int(1000311004)
	structure_type_import_metal_buffer_info_ext                                        = int(1000311005)
	structure_type_export_metal_texture_info_ext                                       = int(1000311006)
	structure_type_import_metal_texture_info_ext                                       = int(1000311007)
	structure_type_export_metal_io_surface_info_ext                                    = int(1000311008)
	structure_type_import_metal_io_surface_info_ext                                    = int(1000311009)
	structure_type_export_metal_shared_event_info_ext                                  = int(1000311010)
	structure_type_import_metal_shared_event_info_ext                                  = int(1000311011)
	structure_type_physical_device_descriptor_buffer_properties_ext                    = int(1000316000)
	structure_type_physical_device_descriptor_buffer_density_map_properties_ext        = int(1000316001)
	structure_type_physical_device_descriptor_buffer_features_ext                      = int(1000316002)
	structure_type_descriptor_address_info_ext                                         = int(1000316003)
	structure_type_descriptor_get_info_ext                                             = int(1000316004)
	structure_type_buffer_capture_descriptor_data_info_ext                             = int(1000316005)
	structure_type_image_capture_descriptor_data_info_ext                              = int(1000316006)
	structure_type_image_view_capture_descriptor_data_info_ext                         = int(1000316007)
	structure_type_sampler_capture_descriptor_data_info_ext                            = int(1000316008)
	structure_type_opaque_capture_descriptor_data_create_info_ext                      = int(1000316010)
	structure_type_descriptor_buffer_binding_info_ext                                  = int(1000316011)
	structure_type_descriptor_buffer_binding_push_descriptor_buffer_handle_ext         = int(1000316012)
	structure_type_acceleration_structure_capture_descriptor_data_info_ext             = int(1000316009)
	structure_type_physical_device_graphics_pipeline_library_features_ext              = int(1000320000)
	structure_type_physical_device_graphics_pipeline_library_properties_ext            = int(1000320001)
	structure_type_graphics_pipeline_library_create_info_ext                           = int(1000320002)
	structure_type_physical_device_shader_early_and_late_fragment_tests_features_amd   = int(1000321000)
	structure_type_physical_device_fragment_shader_barycentric_features_khr            = int(1000203000)
	structure_type_physical_device_fragment_shader_barycentric_properties_khr          = int(1000322000)
	structure_type_physical_device_shader_subgroup_uniform_control_flow_features_khr   = int(1000323000)
	structure_type_physical_device_fragment_shading_rate_enums_properties_nv           = int(1000326000)
	structure_type_physical_device_fragment_shading_rate_enums_features_nv             = int(1000326001)
	structure_type_pipeline_fragment_shading_rate_enum_state_create_info_nv            = int(1000326002)
	structure_type_acceleration_structure_geometry_motion_triangles_data_nv            = int(1000327000)
	structure_type_physical_device_ray_tracing_motion_blur_features_nv                 = int(1000327001)
	structure_type_acceleration_structure_motion_info_nv                               = int(1000327002)
	structure_type_physical_device_mesh_shader_features_ext                            = int(1000328000)
	structure_type_physical_device_mesh_shader_properties_ext                          = int(1000328001)
	structure_type_physical_device_ycbcr2_plane444_formats_features_ext                = int(1000330000)
	structure_type_physical_device_fragment_density_map2_features_ext                  = int(1000332000)
	structure_type_physical_device_fragment_density_map2_properties_ext                = int(1000332001)
	structure_type_copy_command_transform_info_qcom                                    = int(1000333000)
	structure_type_physical_device_workgroup_memory_explicit_layout_features_khr       = int(1000336000)
	structure_type_physical_device_image_compression_control_features_ext              = int(1000338000)
	structure_type_image_compression_control_ext                                       = int(1000338001)
	structure_type_image_compression_properties_ext                                    = int(1000338004)
	structure_type_physical_device_attachment_feedback_loop_layout_features_ext        = int(1000339000)
	structure_type_physical_device4444_formats_features_ext                            = int(1000340000)
	structure_type_physical_device_fault_features_ext                                  = int(1000341000)
	structure_type_device_fault_counts_ext                                             = int(1000341001)
	structure_type_device_fault_info_ext                                               = int(1000341002)
	structure_type_physical_device_rgba10x6_formats_features_ext                       = int(1000344000)
	structure_type_directfb_surface_create_info_ext                                    = int(1000346000)
	structure_type_physical_device_vertex_input_dynamic_state_features_ext             = int(1000352000)
	structure_type_vertex_input_binding_description2_ext                               = int(1000352001)
	structure_type_vertex_input_attribute_description2_ext                             = int(1000352002)
	structure_type_physical_device_drm_properties_ext                                  = int(1000353000)
	structure_type_physical_device_address_binding_report_features_ext                 = int(1000354000)
	structure_type_device_address_binding_callback_data_ext                            = int(1000354001)
	structure_type_physical_device_depth_clip_control_features_ext                     = int(1000355000)
	structure_type_pipeline_viewport_depth_clip_control_create_info_ext                = int(1000355001)
	structure_type_physical_device_primitive_topology_list_restart_features_ext        = int(1000356000)
	structure_type_physical_device_present_mode_fifo_latest_ready_features_ext         = int(1000361000)
	structure_type_import_memory_zircon_handle_info_fuchsia                            = int(1000364000)
	structure_type_memory_zircon_handle_properties_fuchsia                             = int(1000364001)
	structure_type_memory_get_zircon_handle_info_fuchsia                               = int(1000364002)
	structure_type_import_semaphore_zircon_handle_info_fuchsia                         = int(1000365000)
	structure_type_semaphore_get_zircon_handle_info_fuchsia                            = int(1000365001)
	structure_type_buffer_collection_create_info_fuchsia                               = int(1000366000)
	structure_type_import_memory_buffer_collection_fuchsia                             = int(1000366001)
	structure_type_buffer_collection_image_create_info_fuchsia                         = int(1000366002)
	structure_type_buffer_collection_properties_fuchsia                                = int(1000366003)
	structure_type_buffer_constraints_info_fuchsia                                     = int(1000366004)
	structure_type_buffer_collection_buffer_create_info_fuchsia                        = int(1000366005)
	structure_type_image_constraints_info_fuchsia                                      = int(1000366006)
	structure_type_image_format_constraints_info_fuchsia                               = int(1000366007)
	structure_type_sysmem_color_space_fuchsia                                          = int(1000366008)
	structure_type_buffer_collection_constraints_info_fuchsia                          = int(1000366009)
	structure_type_subpass_shading_pipeline_create_info_huawei                         = int(1000369000)
	structure_type_physical_device_subpass_shading_features_huawei                     = int(1000369001)
	structure_type_physical_device_subpass_shading_properties_huawei                   = int(1000369002)
	structure_type_physical_device_invocation_mask_features_huawei                     = int(1000370000)
	structure_type_memory_get_remote_address_info_nv                                   = int(1000371000)
	structure_type_physical_device_external_memory_rdma_features_nv                    = int(1000371001)
	structure_type_pipeline_properties_identifier_ext                                  = int(1000372000)
	structure_type_physical_device_pipeline_properties_features_ext                    = int(1000372001)
	structure_type_physical_device_frame_boundary_features_ext                         = int(1000375000)
	structure_type_frame_boundary_ext                                                  = int(1000375001)
	structure_type_physical_device_multisampled_render_to_single_sampled_features_ext  = int(1000376000)
	structure_type_subpass_resolve_performance_query_ext                               = int(1000376001)
	structure_type_multisampled_render_to_single_sampled_info_ext                      = int(1000376002)
	structure_type_physical_device_extended_dynamic_state2_features_ext                = int(1000377000)
	structure_type_screen_surface_create_info_qnx                                      = int(1000378000)
	structure_type_physical_device_color_write_enable_features_ext                     = int(1000381000)
	structure_type_pipeline_color_write_create_info_ext                                = int(1000381001)
	structure_type_physical_device_primitives_generated_query_features_ext             = int(1000382000)
	structure_type_physical_device_ray_tracing_maintenance1_features_khr               = int(1000386000)
	structure_type_physical_device_image_view_min_lod_features_ext                     = int(1000391000)
	structure_type_image_view_min_lod_create_info_ext                                  = int(1000391001)
	structure_type_physical_device_multi_draw_features_ext                             = int(1000392000)
	structure_type_physical_device_multi_draw_properties_ext                           = int(1000392001)
	structure_type_physical_device_image2d_view_of3d_features_ext                      = int(1000393000)
	structure_type_physical_device_shader_tile_image_features_ext                      = int(1000395000)
	structure_type_physical_device_shader_tile_image_properties_ext                    = int(1000395001)
	structure_type_micromap_build_info_ext                                             = int(1000396000)
	structure_type_micromap_version_info_ext                                           = int(1000396001)
	structure_type_copy_micromap_info_ext                                              = int(1000396002)
	structure_type_copy_micromap_to_memory_info_ext                                    = int(1000396003)
	structure_type_copy_memory_to_micromap_info_ext                                    = int(1000396004)
	structure_type_physical_device_opacity_micromap_features_ext                       = int(1000396005)
	structure_type_physical_device_opacity_micromap_properties_ext                     = int(1000396006)
	structure_type_micromap_create_info_ext                                            = int(1000396007)
	structure_type_micromap_build_sizes_info_ext                                       = int(1000396008)
	structure_type_acceleration_structure_triangles_opacity_micromap_ext               = int(1000396009)
	structure_type_physical_device_cluster_culling_shader_features_huawei              = int(1000404000)
	structure_type_physical_device_cluster_culling_shader_properties_huawei            = int(1000404001)
	structure_type_physical_device_cluster_culling_shader_vrs_features_huawei          = int(1000404002)
	structure_type_physical_device_border_color_swizzle_features_ext                   = int(1000411000)
	structure_type_sampler_border_color_component_mapping_create_info_ext              = int(1000411001)
	structure_type_physical_device_pageable_device_local_memory_features_ext           = int(1000412000)
	structure_type_physical_device_shader_core_properties_arm                          = int(1000415000)
	structure_type_physical_device_shader_subgroup_rotate_features_khr                 = int(1000416000)
	structure_type_device_queue_shader_core_control_create_info_arm                    = int(1000417000)
	structure_type_physical_device_scheduling_controls_features_arm                    = int(1000417001)
	structure_type_physical_device_scheduling_controls_properties_arm                  = int(1000417002)
	structure_type_physical_device_image_sliced_view_of3d_features_ext                 = int(1000418000)
	structure_type_image_view_sliced_create_info_ext                                   = int(1000418001)
	structure_type_physical_device_descriptor_set_host_mapping_features_valve          = int(1000420000)
	structure_type_descriptor_set_binding_reference_valve                              = int(1000420001)
	structure_type_descriptor_set_layout_host_mapping_info_valve                       = int(1000420002)
	structure_type_physical_device_depth_clamp_zero_one_features_ext                   = int(1000421000)
	structure_type_physical_device_non_seamless_cube_map_features_ext                  = int(1000422000)
	structure_type_physical_device_render_pass_striped_features_arm                    = int(1000424000)
	structure_type_physical_device_render_pass_striped_properties_arm                  = int(1000424001)
	structure_type_render_pass_stripe_begin_info_arm                                   = int(1000424002)
	structure_type_render_pass_stripe_info_arm                                         = int(1000424003)
	structure_type_render_pass_stripe_submit_info_arm                                  = int(1000424004)
	structure_type_physical_device_fragment_density_map_offset_features_qcom           = int(1000425000)
	structure_type_physical_device_fragment_density_map_offset_properties_qcom         = int(1000425001)
	structure_type_subpass_fragment_density_map_offset_end_info_qcom                   = int(1000425002)
	structure_type_physical_device_copy_memory_indirect_features_nv                    = int(1000426000)
	structure_type_physical_device_copy_memory_indirect_properties_nv                  = int(1000426001)
	structure_type_physical_device_memory_decompression_features_nv                    = int(1000427000)
	structure_type_physical_device_memory_decompression_properties_nv                  = int(1000427001)
	structure_type_physical_device_device_generated_commands_compute_features_nv       = int(1000428000)
	structure_type_compute_pipeline_indirect_buffer_info_nv                            = int(1000428001)
	structure_type_pipeline_indirect_device_address_info_nv                            = int(1000428002)
	structure_type_physical_device_linear_color_attachment_features_nv                 = int(1000430000)
	structure_type_physical_device_shader_maximal_reconvergence_features_khr           = int(1000434000)
	structure_type_physical_device_image_compression_control_swapchain_features_ext    = int(1000437000)
	structure_type_physical_device_image_processing_features_qcom                      = int(1000440000)
	structure_type_physical_device_image_processing_properties_qcom                    = int(1000440001)
	structure_type_image_view_sample_weight_create_info_qcom                           = int(1000440002)
	structure_type_physical_device_nested_command_buffer_features_ext                  = int(1000451000)
	structure_type_physical_device_nested_command_buffer_properties_ext                = int(1000451001)
	structure_type_external_memory_acquire_unmodified_ext                              = int(1000453000)
	structure_type_physical_device_extended_dynamic_state3_features_ext                = int(1000455000)
	structure_type_physical_device_extended_dynamic_state3_properties_ext              = int(1000455001)
	structure_type_physical_device_subpass_merge_feedback_features_ext                 = int(1000458000)
	structure_type_render_pass_creation_control_ext                                    = int(1000458001)
	structure_type_render_pass_creation_feedback_create_info_ext                       = int(1000458002)
	structure_type_render_pass_subpass_feedback_create_info_ext                        = int(1000458003)
	structure_type_direct_driver_loading_info_lunarg                                   = int(1000459000)
	structure_type_direct_driver_loading_list_lunarg                                   = int(1000459001)
	structure_type_physical_device_shader_module_identifier_features_ext               = int(1000462000)
	structure_type_physical_device_shader_module_identifier_properties_ext             = int(1000462001)
	structure_type_pipeline_shader_stage_module_identifier_create_info_ext             = int(1000462002)
	structure_type_shader_module_identifier_ext                                        = int(1000462003)
	structure_type_physical_device_rasterization_order_attachment_access_features_ext  = int(1000342000)
	structure_type_physical_device_optical_flow_features_nv                            = int(1000464000)
	structure_type_physical_device_optical_flow_properties_nv                          = int(1000464001)
	structure_type_optical_flow_image_format_info_nv                                   = int(1000464002)
	structure_type_optical_flow_image_format_properties_nv                             = int(1000464003)
	structure_type_optical_flow_session_create_info_nv                                 = int(1000464004)
	structure_type_optical_flow_execute_info_nv                                        = int(1000464005)
	structure_type_optical_flow_session_create_private_data_info_nv                    = int(1000464010)
	structure_type_physical_device_legacy_dithering_features_ext                       = int(1000465000)
	structure_type_physical_device_pipeline_protected_access_features_ext              = int(1000466000)
	structure_type_physical_device_external_format_resolve_features_android            = int(1000468000)
	structure_type_physical_device_external_format_resolve_properties_android          = int(1000468001)
	structure_type_android_hardware_buffer_format_resolve_properties_android           = int(1000468002)
	structure_type_physical_device_maintenance5_features_khr                           = int(1000470000)
	structure_type_physical_device_maintenance5_properties_khr                         = int(1000470001)
	structure_type_rendering_area_info_khr                                             = int(1000470003)
	structure_type_device_image_subresource_info_khr                                   = int(1000470004)
	structure_type_subresource_layout2_khr                                             = int(1000338002)
	structure_type_image_subresource2_khr                                              = int(1000338003)
	structure_type_pipeline_create_flags2_create_info_khr                              = int(1000470005)
	structure_type_buffer_usage_flags2_create_info_khr                                 = int(1000470006)
	structure_type_physical_device_anti_lag_features_amd                               = int(1000476000)
	structure_type_anti_lag_data_amd                                                   = int(1000476001)
	structure_type_anti_lag_presentation_info_amd                                      = int(1000476002)
	structure_type_physical_device_ray_tracing_position_fetch_features_khr             = int(1000481000)
	structure_type_physical_device_shader_object_features_ext                          = int(1000482000)
	structure_type_physical_device_shader_object_properties_ext                        = int(1000482001)
	structure_type_shader_create_info_ext                                              = int(1000482002)
	structure_type_physical_device_pipeline_binary_features_khr                        = int(1000483000)
	structure_type_pipeline_binary_create_info_khr                                     = int(1000483001)
	structure_type_pipeline_binary_info_khr                                            = int(1000483002)
	structure_type_pipeline_binary_key_khr                                             = int(1000483003)
	structure_type_physical_device_pipeline_binary_properties_khr                      = int(1000483004)
	structure_type_release_captured_pipeline_data_info_khr                             = int(1000483005)
	structure_type_pipeline_binary_data_info_khr                                       = int(1000483006)
	structure_type_pipeline_create_info_khr                                            = int(1000483007)
	structure_type_device_pipeline_binary_internal_cache_control_khr                   = int(1000483008)
	structure_type_pipeline_binary_handles_info_khr                                    = int(1000483009)
	structure_type_physical_device_tile_properties_features_qcom                       = int(1000484000)
	structure_type_tile_properties_qcom                                                = int(1000484001)
	structure_type_physical_device_amigo_profiling_features_sec                        = int(1000485000)
	structure_type_amigo_profiling_submit_info_sec                                     = int(1000485001)
	structure_type_physical_device_multiview_per_view_viewports_features_qcom          = int(1000488000)
	structure_type_physical_device_ray_tracing_invocation_reorder_features_nv          = int(1000490000)
	structure_type_physical_device_ray_tracing_invocation_reorder_properties_nv        = int(1000490001)
	structure_type_physical_device_extended_sparse_address_space_features_nv           = int(1000492000)
	structure_type_physical_device_extended_sparse_address_space_properties_nv         = int(1000492001)
	structure_type_physical_device_mutable_descriptor_type_features_ext                = int(1000351000)
	structure_type_mutable_descriptor_type_create_info_ext                             = int(1000351002)
	structure_type_physical_device_legacy_vertex_attributes_features_ext               = int(1000495000)
	structure_type_physical_device_legacy_vertex_attributes_properties_ext             = int(1000495001)
	structure_type_layer_settings_create_info_ext                                      = int(1000496000)
	structure_type_physical_device_shader_core_builtins_features_arm                   = int(1000497000)
	structure_type_physical_device_shader_core_builtins_properties_arm                 = int(1000497001)
	structure_type_physical_device_pipeline_library_group_handles_features_ext         = int(1000498000)
	structure_type_physical_device_dynamic_rendering_unused_attachments_features_ext   = int(1000499000)
	structure_type_latency_sleep_mode_info_nv                                          = int(1000505000)
	structure_type_latency_sleep_info_nv                                               = int(1000505001)
	structure_type_set_latency_marker_info_nv                                          = int(1000505002)
	structure_type_get_latency_marker_info_nv                                          = int(1000505003)
	structure_type_latency_timings_frame_report_nv                                     = int(1000505004)
	structure_type_latency_submission_present_id_nv                                    = int(1000505005)
	structure_type_out_of_band_queue_type_info_nv                                      = int(1000505006)
	structure_type_swapchain_latency_create_info_nv                                    = int(1000505007)
	structure_type_latency_surface_capabilities_nv                                     = int(1000505008)
	structure_type_physical_device_cooperative_matrix_features_khr                     = int(1000506000)
	structure_type_cooperative_matrix_properties_khr                                   = int(1000506001)
	structure_type_physical_device_cooperative_matrix_properties_khr                   = int(1000506002)
	structure_type_physical_device_multiview_per_view_render_areas_features_qcom       = int(1000510000)
	structure_type_multiview_per_view_render_areas_render_pass_begin_info_qcom         = int(1000510001)
	structure_type_physical_device_compute_shader_derivatives_features_khr             = int(1000201000)
	structure_type_physical_device_compute_shader_derivatives_properties_khr           = int(1000511000)
	structure_type_video_decode_av1_capabilities_khr                                   = int(1000512000)
	structure_type_video_decode_av1_picture_info_khr                                   = int(1000512001)
	structure_type_video_decode_av1_profile_info_khr                                   = int(1000512003)
	structure_type_video_decode_av1_session_parameters_create_info_khr                 = int(1000512004)
	structure_type_video_decode_av1_dpb_slot_info_khr                                  = int(1000512005)
	structure_type_video_encode_av1_capabilities_khr                                   = int(1000513000)
	structure_type_video_encode_av1_session_parameters_create_info_khr                 = int(1000513001)
	structure_type_video_encode_av1_picture_info_khr                                   = int(1000513002)
	structure_type_video_encode_av1_dpb_slot_info_khr                                  = int(1000513003)
	structure_type_physical_device_video_encode_av1_features_khr                       = int(1000513004)
	structure_type_video_encode_av1_profile_info_khr                                   = int(1000513005)
	structure_type_video_encode_av1_rate_control_info_khr                              = int(1000513006)
	structure_type_video_encode_av1_rate_control_layer_info_khr                        = int(1000513007)
	structure_type_video_encode_av1_quality_level_properties_khr                       = int(1000513008)
	structure_type_video_encode_av1_session_create_info_khr                            = int(1000513009)
	structure_type_video_encode_av1_gop_remaining_frame_info_khr                       = int(1000513010)
	structure_type_physical_device_video_maintenance1_features_khr                     = int(1000515000)
	structure_type_video_inline_query_info_khr                                         = int(1000515001)
	structure_type_physical_device_per_stage_descriptor_set_features_nv                = int(1000516000)
	structure_type_physical_device_image_processing2_features_qcom                     = int(1000518000)
	structure_type_physical_device_image_processing2_properties_qcom                   = int(1000518001)
	structure_type_sampler_block_match_window_create_info_qcom                         = int(1000518002)
	structure_type_sampler_cubic_weights_create_info_qcom                              = int(1000519000)
	structure_type_physical_device_cubic_weights_features_qcom                         = int(1000519001)
	structure_type_blit_image_cubic_weights_info_qcom                                  = int(1000519002)
	structure_type_physical_device_ycbcr_degamma_features_qcom                         = int(1000520000)
	structure_type_sampler_ycbcr_conversion_ycbcr_degamma_create_info_qcom             = int(1000520001)
	structure_type_physical_device_cubic_clamp_features_qcom                           = int(1000521000)
	structure_type_physical_device_attachment_feedback_loop_dynamic_state_features_ext = int(1000524000)
	structure_type_physical_device_vertex_attribute_divisor_properties_khr             = int(1000525000)
	structure_type_pipeline_vertex_input_divisor_state_create_info_khr                 = int(1000190001)
	structure_type_physical_device_vertex_attribute_divisor_features_khr               = int(1000190002)
	structure_type_physical_device_shader_float_controls2_features_khr                 = int(1000528000)
	structure_type_screen_buffer_properties_qnx                                        = int(1000529000)
	structure_type_screen_buffer_format_properties_qnx                                 = int(1000529001)
	structure_type_import_screen_buffer_info_qnx                                       = int(1000529002)
	structure_type_external_format_qnx                                                 = int(1000529003)
	structure_type_physical_device_external_memory_screen_buffer_features_qnx          = int(1000529004)
	structure_type_physical_device_layered_driver_properties_msft                      = int(1000530000)
	structure_type_physical_device_index_type_uint8_features_khr                       = int(1000265000)
	structure_type_physical_device_line_rasterization_features_khr                     = int(1000259000)
	structure_type_pipeline_rasterization_line_state_create_info_khr                   = int(1000259001)
	structure_type_physical_device_line_rasterization_properties_khr                   = int(1000259002)
	structure_type_calibrated_timestamp_info_khr                                       = int(1000184000)
	structure_type_physical_device_shader_expect_assume_features_khr                   = int(1000544000)
	structure_type_physical_device_maintenance6_features_khr                           = int(1000545000)
	structure_type_physical_device_maintenance6_properties_khr                         = int(1000545001)
	structure_type_bind_memory_status_khr                                              = int(1000545002)
	structure_type_bind_descriptor_sets_info_khr                                       = int(1000545003)
	structure_type_push_constants_info_khr                                             = int(1000545004)
	structure_type_push_descriptor_set_info_khr                                        = int(1000545005)
	structure_type_push_descriptor_set_with_template_info_khr                          = int(1000545006)
	structure_type_set_descriptor_buffer_offsets_info_ext                              = int(1000545007)
	structure_type_bind_descriptor_buffer_embedded_samplers_info_ext                   = int(1000545008)
	structure_type_physical_device_descriptor_pool_overallocation_features_nv          = int(1000546000)
	structure_type_display_surface_stereo_create_info_nv                               = int(1000551000)
	structure_type_display_mode_stereo_properties_nv                                   = int(1000551001)
	structure_type_video_encode_quantization_map_capabilities_khr                      = int(1000553000)
	structure_type_video_format_quantization_map_properties_khr                        = int(1000553001)
	structure_type_video_encode_quantization_map_info_khr                              = int(1000553002)
	structure_type_video_encode_quantization_map_session_parameters_create_info_khr    = int(1000553005)
	structure_type_physical_device_video_encode_quantization_map_features_khr          = int(1000553009)
	structure_type_video_encode_h264_quantization_map_capabilities_khr                 = int(1000553003)
	structure_type_video_encode_h265_quantization_map_capabilities_khr                 = int(1000553004)
	structure_type_video_format_h265_quantization_map_properties_khr                   = int(1000553006)
	structure_type_video_encode_av1_quantization_map_capabilities_khr                  = int(1000553007)
	structure_type_video_format_av1_quantization_map_properties_khr                    = int(1000553008)
	structure_type_physical_device_raw_access_chains_features_nv                       = int(1000555000)
	structure_type_physical_device_shader_relaxed_extended_instruction_features_khr    = int(1000558000)
	structure_type_physical_device_command_buffer_inheritance_features_nv              = int(1000559000)
	structure_type_physical_device_maintenance7_features_khr                           = int(1000562000)
	structure_type_physical_device_maintenance7_properties_khr                         = int(1000562001)
	structure_type_physical_device_layered_api_properties_list_khr                     = int(1000562002)
	structure_type_physical_device_layered_api_properties_khr                          = int(1000562003)
	structure_type_physical_device_layered_api_vulkan_properties_khr                   = int(1000562004)
	structure_type_physical_device_shader_atomic_float16_vector_features_nv            = int(1000563000)
	structure_type_physical_device_shader_replicated_composites_features_ext           = int(1000564000)
	structure_type_physical_device_ray_tracing_validation_features_nv                  = int(1000568000)
	structure_type_physical_device_device_generated_commands_features_ext              = int(1000572000)
	structure_type_physical_device_device_generated_commands_properties_ext            = int(1000572001)
	structure_type_generated_commands_memory_requirements_info_ext                     = int(1000572002)
	structure_type_indirect_execution_set_create_info_ext                              = int(1000572003)
	structure_type_generated_commands_info_ext                                         = int(1000572004)
	structure_type_indirect_commands_layout_create_info_ext                            = int(1000572006)
	structure_type_indirect_commands_layout_token_ext                                  = int(1000572007)
	structure_type_write_indirect_execution_set_pipeline_ext                           = int(1000572008)
	structure_type_write_indirect_execution_set_shader_ext                             = int(1000572009)
	structure_type_indirect_execution_set_pipeline_info_ext                            = int(1000572010)
	structure_type_indirect_execution_set_shader_info_ext                              = int(1000572011)
	structure_type_indirect_execution_set_shader_layout_info_ext                       = int(1000572012)
	structure_type_generated_commands_pipeline_info_ext                                = int(1000572013)
	structure_type_generated_commands_shader_info_ext                                  = int(1000572014)
	structure_type_physical_device_image_alignment_control_features_mesa               = int(1000575000)
	structure_type_physical_device_image_alignment_control_properties_mesa             = int(1000575001)
	structure_type_image_alignment_control_create_info_mesa                            = int(1000575002)
	structure_type_physical_device_depth_clamp_control_features_ext                    = int(1000582000)
	structure_type_pipeline_viewport_depth_clamp_control_create_info_ext               = int(1000582001)
	structure_type_physical_device_hdr_vivid_features_huawei                           = int(1000590000)
	structure_type_hdr_vivid_dynamic_metadata_huawei                                   = int(1000590001)
	structure_type_physical_device_cooperative_matrix2_features_nv                     = int(1000593000)
	structure_type_cooperative_matrix_flexible_dimensions_properties_nv                = int(1000593001)
	structure_type_physical_device_cooperative_matrix2_properties_nv                   = int(1000593002)
	structure_type_physical_device_vertex_attribute_robustness_features_ext            = int(1000608000)
	structure_type_max_enum                                                            = int(0x7FFFFFFF)
}

pub enum PipelineCacheHeaderVersion {
	pipeline_cache_header_version_one      = int(1)
	pipeline_cache_header_version_max_enum = int(0x7FFFFFFF)
}

pub enum ImageLayout {
	image_layout_undefined                                    = int(0)
	image_layout_general                                      = int(1)
	image_layout_color_attachment_optimal                     = int(2)
	image_layout_depth_stencil_attachment_optimal             = int(3)
	image_layout_depth_stencil_read_only_optimal              = int(4)
	image_layout_shader_read_only_optimal                     = int(5)
	image_layout_transfer_src_optimal                         = int(6)
	image_layout_transfer_dst_optimal                         = int(7)
	image_layout_preinitialized                               = int(8)
	image_layout_depth_read_only_stencil_attachment_optimal   = int(1000117000)
	image_layout_depth_attachment_stencil_read_only_optimal   = int(1000117001)
	image_layout_depth_attachment_optimal                     = int(1000241000)
	image_layout_depth_read_only_optimal                      = int(1000241001)
	image_layout_stencil_attachment_optimal                   = int(1000241002)
	image_layout_stencil_read_only_optimal                    = int(1000241003)
	image_layout_read_only_optimal                            = int(1000314000)
	image_layout_attachment_optimal                           = int(1000314001)
	image_layout_present_src_khr                              = int(1000001002)
	image_layout_video_decode_dst_khr                         = int(1000024000)
	image_layout_video_decode_src_khr                         = int(1000024001)
	image_layout_video_decode_dpb_khr                         = int(1000024002)
	image_layout_shared_present_khr                           = int(1000111000)
	image_layout_fragment_density_map_optimal_ext             = int(1000218000)
	image_layout_fragment_shading_rate_attachment_optimal_khr = int(1000164003)
	image_layout_rendering_local_read_khr                     = int(1000232000)
	image_layout_video_encode_dst_khr                         = int(1000299000)
	image_layout_video_encode_src_khr                         = int(1000299001)
	image_layout_video_encode_dpb_khr                         = int(1000299002)
	image_layout_attachment_feedback_loop_optimal_ext         = int(1000339000)
	image_layout_video_encode_quantization_map_khr            = int(1000553000)
	image_layout_max_enum                                     = int(0x7FFFFFFF)
}

pub enum ObjectType {
	object_type_unknown                         = int(0)
	object_type_instance                        = int(1)
	object_type_physical_device                 = int(2)
	object_type_device                          = int(3)
	object_type_queue                           = int(4)
	object_type_semaphore                       = int(5)
	object_type_command_buffer                  = int(6)
	object_type_fence                           = int(7)
	object_type_device_memory                   = int(8)
	object_type_buffer                          = int(9)
	object_type_image                           = int(10)
	object_type_event                           = int(11)
	object_type_query_pool                      = int(12)
	object_type_buffer_view                     = int(13)
	object_type_image_view                      = int(14)
	object_type_shader_module                   = int(15)
	object_type_pipeline_cache                  = int(16)
	object_type_pipeline_layout                 = int(17)
	object_type_render_pass                     = int(18)
	object_type_pipeline                        = int(19)
	object_type_descriptor_set_layout           = int(20)
	object_type_sampler                         = int(21)
	object_type_descriptor_pool                 = int(22)
	object_type_descriptor_set                  = int(23)
	object_type_framebuffer                     = int(24)
	object_type_command_pool                    = int(25)
	object_type_sampler_ycbcr_conversion        = int(1000156000)
	object_type_descriptor_update_template      = int(1000085000)
	object_type_private_data_slot               = int(1000295000)
	object_type_surface_khr                     = int(1000000000)
	object_type_swapchain_khr                   = int(1000001000)
	object_type_display_khr                     = int(1000002000)
	object_type_display_mode_khr                = int(1000002001)
	object_type_debug_report_callback_ext       = int(1000011000)
	object_type_video_session_khr               = int(1000023000)
	object_type_video_session_parameters_khr    = int(1000023001)
	object_type_cu_module_nvx                   = int(1000029000)
	object_type_cu_function_nvx                 = int(1000029001)
	object_type_debug_utils_messenger_ext       = int(1000128000)
	object_type_acceleration_structure_khr      = int(1000150000)
	object_type_validation_cache_ext            = int(1000160000)
	object_type_acceleration_structure_nv       = int(1000165000)
	object_type_performance_configuration_intel = int(1000210000)
	object_type_deferred_operation_khr          = int(1000268000)
	object_type_indirect_commands_layout_nv     = int(1000277000)
	object_type_cuda_module_nv                  = int(1000307000)
	object_type_cuda_function_nv                = int(1000307001)
	object_type_buffer_collection_fuchsia       = int(1000366000)
	object_type_micromap_ext                    = int(1000396000)
	object_type_optical_flow_session_nv         = int(1000464000)
	object_type_shader_ext                      = int(1000482000)
	object_type_pipeline_binary_khr             = int(1000483000)
	object_type_indirect_commands_layout_ext    = int(1000572000)
	object_type_indirect_execution_set_ext      = int(1000572001)
	object_type_max_enum                        = int(0x7FFFFFFF)
}

pub enum VendorId {
	vendor_id_khronos  = int(0x10000)
	vendor_id_viv      = int(0x10001)
	vendor_id_vsi      = int(0x10002)
	vendor_id_kazan    = int(0x10003)
	vendor_id_codeplay = int(0x10004)
	vendor_id_mesa     = int(0x10005)
	vendor_id_pocl     = int(0x10006)
	vendor_id_mobileye = int(0x10007)
	vendor_id_max_enum = int(0x7FFFFFFF)
}

pub enum SystemAllocationScope {
	system_allocation_scope_command  = int(0)
	system_allocation_scope_object   = int(1)
	system_allocation_scope_cache    = int(2)
	system_allocation_scope_device   = int(3)
	system_allocation_scope_instance = int(4)
	system_allocation_scope_max_enum = int(0x7FFFFFFF)
}

pub enum InternalAllocationType {
	internal_allocation_type_executable = int(0)
	internal_allocation_type_max_enum   = int(0x7FFFFFFF)
}

pub enum Format {
	format_undefined                                = int(0)
	format_r4g4_unorm_pack8                         = int(1)
	format_r4g4b4a4_unorm_pack16                    = int(2)
	format_b4g4r4a4_unorm_pack16                    = int(3)
	format_r5g6b5_unorm_pack16                      = int(4)
	format_b5g6r5_unorm_pack16                      = int(5)
	format_r5g5b5a1_unorm_pack16                    = int(6)
	format_b5g5r5a1_unorm_pack16                    = int(7)
	format_a1r5g5b5_unorm_pack16                    = int(8)
	format_r8_unorm                                 = int(9)
	format_r8_snorm                                 = int(10)
	format_r8_uscaled                               = int(11)
	format_r8_sscaled                               = int(12)
	format_r8_uint                                  = int(13)
	format_r8_sint                                  = int(14)
	format_r8_srgb                                  = int(15)
	format_r8g8_unorm                               = int(16)
	format_r8g8_snorm                               = int(17)
	format_r8g8_uscaled                             = int(18)
	format_r8g8_sscaled                             = int(19)
	format_r8g8_uint                                = int(20)
	format_r8g8_sint                                = int(21)
	format_r8g8_srgb                                = int(22)
	format_r8g8b8_unorm                             = int(23)
	format_r8g8b8_snorm                             = int(24)
	format_r8g8b8_uscaled                           = int(25)
	format_r8g8b8_sscaled                           = int(26)
	format_r8g8b8_uint                              = int(27)
	format_r8g8b8_sint                              = int(28)
	format_r8g8b8_srgb                              = int(29)
	format_b8g8r8_unorm                             = int(30)
	format_b8g8r8_snorm                             = int(31)
	format_b8g8r8_uscaled                           = int(32)
	format_b8g8r8_sscaled                           = int(33)
	format_b8g8r8_uint                              = int(34)
	format_b8g8r8_sint                              = int(35)
	format_b8g8r8_srgb                              = int(36)
	format_r8g8b8a8_unorm                           = int(37)
	format_r8g8b8a8_snorm                           = int(38)
	format_r8g8b8a8_uscaled                         = int(39)
	format_r8g8b8a8_sscaled                         = int(40)
	format_r8g8b8a8_uint                            = int(41)
	format_r8g8b8a8_sint                            = int(42)
	format_r8g8b8a8_srgb                            = int(43)
	format_b8g8r8a8_unorm                           = int(44)
	format_b8g8r8a8_snorm                           = int(45)
	format_b8g8r8a8_uscaled                         = int(46)
	format_b8g8r8a8_sscaled                         = int(47)
	format_b8g8r8a8_uint                            = int(48)
	format_b8g8r8a8_sint                            = int(49)
	format_b8g8r8a8_srgb                            = int(50)
	format_a8b8g8r8_unorm_pack32                    = int(51)
	format_a8b8g8r8_snorm_pack32                    = int(52)
	format_a8b8g8r8_uscaled_pack32                  = int(53)
	format_a8b8g8r8_sscaled_pack32                  = int(54)
	format_a8b8g8r8_uint_pack32                     = int(55)
	format_a8b8g8r8_sint_pack32                     = int(56)
	format_a8b8g8r8_srgb_pack32                     = int(57)
	format_a2r10g10b10_unorm_pack32                 = int(58)
	format_a2r10g10b10_snorm_pack32                 = int(59)
	format_a2r10g10b10_uscaled_pack32               = int(60)
	format_a2r10g10b10_sscaled_pack32               = int(61)
	format_a2r10g10b10_uint_pack32                  = int(62)
	format_a2r10g10b10_sint_pack32                  = int(63)
	format_a2b10g10r10_unorm_pack32                 = int(64)
	format_a2b10g10r10_snorm_pack32                 = int(65)
	format_a2b10g10r10_uscaled_pack32               = int(66)
	format_a2b10g10r10_sscaled_pack32               = int(67)
	format_a2b10g10r10_uint_pack32                  = int(68)
	format_a2b10g10r10_sint_pack32                  = int(69)
	format_r16_unorm                                = int(70)
	format_r16_snorm                                = int(71)
	format_r16_uscaled                              = int(72)
	format_r16_sscaled                              = int(73)
	format_r16_uint                                 = int(74)
	format_r16_sint                                 = int(75)
	format_r16_sfloat                               = int(76)
	format_r16g16_unorm                             = int(77)
	format_r16g16_snorm                             = int(78)
	format_r16g16_uscaled                           = int(79)
	format_r16g16_sscaled                           = int(80)
	format_r16g16_uint                              = int(81)
	format_r16g16_sint                              = int(82)
	format_r16g16_sfloat                            = int(83)
	format_r16g16b16_unorm                          = int(84)
	format_r16g16b16_snorm                          = int(85)
	format_r16g16b16_uscaled                        = int(86)
	format_r16g16b16_sscaled                        = int(87)
	format_r16g16b16_uint                           = int(88)
	format_r16g16b16_sint                           = int(89)
	format_r16g16b16_sfloat                         = int(90)
	format_r16g16b16a16_unorm                       = int(91)
	format_r16g16b16a16_snorm                       = int(92)
	format_r16g16b16a16_uscaled                     = int(93)
	format_r16g16b16a16_sscaled                     = int(94)
	format_r16g16b16a16_uint                        = int(95)
	format_r16g16b16a16_sint                        = int(96)
	format_r16g16b16a16_sfloat                      = int(97)
	format_r32_uint                                 = int(98)
	format_r32_sint                                 = int(99)
	format_r32_sfloat                               = int(100)
	format_r32g32_uint                              = int(101)
	format_r32g32_sint                              = int(102)
	format_r32g32_sfloat                            = int(103)
	format_r32g32b32_uint                           = int(104)
	format_r32g32b32_sint                           = int(105)
	format_r32g32b32_sfloat                         = int(106)
	format_r32g32b32a32_uint                        = int(107)
	format_r32g32b32a32_sint                        = int(108)
	format_r32g32b32a32_sfloat                      = int(109)
	format_r64_uint                                 = int(110)
	format_r64_sint                                 = int(111)
	format_r64_sfloat                               = int(112)
	format_r64g64_uint                              = int(113)
	format_r64g64_sint                              = int(114)
	format_r64g64_sfloat                            = int(115)
	format_r64g64b64_uint                           = int(116)
	format_r64g64b64_sint                           = int(117)
	format_r64g64b64_sfloat                         = int(118)
	format_r64g64b64a64_uint                        = int(119)
	format_r64g64b64a64_sint                        = int(120)
	format_r64g64b64a64_sfloat                      = int(121)
	format_b10g11r11_ufloat_pack32                  = int(122)
	format_e5b9g9r9_ufloat_pack32                   = int(123)
	format_d16_unorm                                = int(124)
	format_x8_d24_unorm_pack32                      = int(125)
	format_d32_sfloat                               = int(126)
	format_s8_uint                                  = int(127)
	format_d16_unorm_s8_uint                        = int(128)
	format_d24_unorm_s8_uint                        = int(129)
	format_d32_sfloat_s8_uint                       = int(130)
	format_bc1_rgb_unorm_block                      = int(131)
	format_bc1_rgb_srgb_block                       = int(132)
	format_bc1_rgba_unorm_block                     = int(133)
	format_bc1_rgba_srgb_block                      = int(134)
	format_bc2_unorm_block                          = int(135)
	format_bc2_srgb_block                           = int(136)
	format_bc3_unorm_block                          = int(137)
	format_bc3_srgb_block                           = int(138)
	format_bc4_unorm_block                          = int(139)
	format_bc4_snorm_block                          = int(140)
	format_bc5_unorm_block                          = int(141)
	format_bc5_snorm_block                          = int(142)
	format_bc6h_ufloat_block                        = int(143)
	format_bc6h_sfloat_block                        = int(144)
	format_bc7_unorm_block                          = int(145)
	format_bc7_srgb_block                           = int(146)
	format_etc2_r8g8b8_unorm_block                  = int(147)
	format_etc2_r8g8b8_srgb_block                   = int(148)
	format_etc2_r8g8b8a1_unorm_block                = int(149)
	format_etc2_r8g8b8a1_srgb_block                 = int(150)
	format_etc2_r8g8b8a8_unorm_block                = int(151)
	format_etc2_r8g8b8a8_srgb_block                 = int(152)
	format_eac_r11_unorm_block                      = int(153)
	format_eac_r11_snorm_block                      = int(154)
	format_eac_r11g11_unorm_block                   = int(155)
	format_eac_r11g11_snorm_block                   = int(156)
	format_astc4x4_unorm_block                      = int(157)
	format_astc4x4_srgb_block                       = int(158)
	format_astc5x4_unorm_block                      = int(159)
	format_astc5x4_srgb_block                       = int(160)
	format_astc5x5_unorm_block                      = int(161)
	format_astc5x5_srgb_block                       = int(162)
	format_astc6x5_unorm_block                      = int(163)
	format_astc6x5_srgb_block                       = int(164)
	format_astc6x6_unorm_block                      = int(165)
	format_astc6x6_srgb_block                       = int(166)
	format_astc8x5_unorm_block                      = int(167)
	format_astc8x5_srgb_block                       = int(168)
	format_astc8x6_unorm_block                      = int(169)
	format_astc8x6_srgb_block                       = int(170)
	format_astc8x8_unorm_block                      = int(171)
	format_astc8x8_srgb_block                       = int(172)
	format_astc10x5_unorm_block                     = int(173)
	format_astc10x5_srgb_block                      = int(174)
	format_astc10x6_unorm_block                     = int(175)
	format_astc10x6_srgb_block                      = int(176)
	format_astc10x8_unorm_block                     = int(177)
	format_astc10x8_srgb_block                      = int(178)
	format_astc10x10_unorm_block                    = int(179)
	format_astc10x10_srgb_block                     = int(180)
	format_astc12x10_unorm_block                    = int(181)
	format_astc12x10_srgb_block                     = int(182)
	format_astc12x12_unorm_block                    = int(183)
	format_astc12x12_srgb_block                     = int(184)
	format_g8b8g8r8_422_unorm                       = int(1000156000)
	format_b8g8r8g8_422_unorm                       = int(1000156001)
	format_g8_b8_r8_3plane420_unorm                 = int(1000156002)
	format_g8_b8r8_2plane420_unorm                  = int(1000156003)
	format_g8_b8_r8_3plane422_unorm                 = int(1000156004)
	format_g8_b8r8_2plane422_unorm                  = int(1000156005)
	format_g8_b8_r8_3plane444_unorm                 = int(1000156006)
	format_r10x6_unorm_pack16                       = int(1000156007)
	format_r10x6g10x6_unorm2pack16                  = int(1000156008)
	format_r10x6g10x6b10x6a10x6_unorm4pack16        = int(1000156009)
	format_g10x6b10x6g10x6r10x6_422_unorm4pack16    = int(1000156010)
	format_b10x6g10x6r10x6g10x6_422_unorm4pack16    = int(1000156011)
	format_g10x6_b10x6_r10x6_3plane420_unorm3pack16 = int(1000156012)
	format_g10x6_b10x6r10x6_2plane420_unorm3pack16  = int(1000156013)
	format_g10x6_b10x6_r10x6_3plane422_unorm3pack16 = int(1000156014)
	format_g10x6_b10x6r10x6_2plane422_unorm3pack16  = int(1000156015)
	format_g10x6_b10x6_r10x6_3plane444_unorm3pack16 = int(1000156016)
	format_r12x4_unorm_pack16                       = int(1000156017)
	format_r12x4g12x4_unorm2pack16                  = int(1000156018)
	format_r12x4g12x4b12x4a12x4_unorm4pack16        = int(1000156019)
	format_g12x4b12x4g12x4r12x4_422_unorm4pack16    = int(1000156020)
	format_b12x4g12x4r12x4g12x4_422_unorm4pack16    = int(1000156021)
	format_g12x4_b12x4_r12x4_3plane420_unorm3pack16 = int(1000156022)
	format_g12x4_b12x4r12x4_2plane420_unorm3pack16  = int(1000156023)
	format_g12x4_b12x4_r12x4_3plane422_unorm3pack16 = int(1000156024)
	format_g12x4_b12x4r12x4_2plane422_unorm3pack16  = int(1000156025)
	format_g12x4_b12x4_r12x4_3plane444_unorm3pack16 = int(1000156026)
	format_g16b16g16r16_422_unorm                   = int(1000156027)
	format_b16g16r16g16_422_unorm                   = int(1000156028)
	format_g16_b16_r16_3plane420_unorm              = int(1000156029)
	format_g16_b16r16_2plane420_unorm               = int(1000156030)
	format_g16_b16_r16_3plane422_unorm              = int(1000156031)
	format_g16_b16r16_2plane422_unorm               = int(1000156032)
	format_g16_b16_r16_3plane444_unorm              = int(1000156033)
	format_g8_b8r8_2plane444_unorm                  = int(1000330000)
	format_g10x6_b10x6r10x6_2plane444_unorm3pack16  = int(1000330001)
	format_g12x4_b12x4r12x4_2plane444_unorm3pack16  = int(1000330002)
	format_g16_b16r16_2plane444_unorm               = int(1000330003)
	format_a4r4g4b4_unorm_pack16                    = int(1000340000)
	format_a4b4g4r4_unorm_pack16                    = int(1000340001)
	format_astc4x4_sfloat_block                     = int(1000066000)
	format_astc5x4_sfloat_block                     = int(1000066001)
	format_astc5x5_sfloat_block                     = int(1000066002)
	format_astc6x5_sfloat_block                     = int(1000066003)
	format_astc6x6_sfloat_block                     = int(1000066004)
	format_astc8x5_sfloat_block                     = int(1000066005)
	format_astc8x6_sfloat_block                     = int(1000066006)
	format_astc8x8_sfloat_block                     = int(1000066007)
	format_astc10x5_sfloat_block                    = int(1000066008)
	format_astc10x6_sfloat_block                    = int(1000066009)
	format_astc10x8_sfloat_block                    = int(1000066010)
	format_astc10x10_sfloat_block                   = int(1000066011)
	format_astc12x10_sfloat_block                   = int(1000066012)
	format_astc12x12_sfloat_block                   = int(1000066013)
	format_pvrtc1_2bpp_unorm_block_img              = int(1000054000)
	format_pvrtc1_4bpp_unorm_block_img              = int(1000054001)
	format_pvrtc2_2bpp_unorm_block_img              = int(1000054002)
	format_pvrtc2_4bpp_unorm_block_img              = int(1000054003)
	format_pvrtc1_2bpp_srgb_block_img               = int(1000054004)
	format_pvrtc1_4bpp_srgb_block_img               = int(1000054005)
	format_pvrtc2_2bpp_srgb_block_img               = int(1000054006)
	format_pvrtc2_4bpp_srgb_block_img               = int(1000054007)
	format_r16g16_sfixed5_nv                        = int(1000464000)
	format_a1b5g5r5_unorm_pack16_khr                = int(1000470000)
	format_a8_unorm_khr                             = int(1000470001)
	format_max_enum                                 = int(0x7FFFFFFF)
}

pub enum ImageTiling {
	image_tiling_optimal                 = int(0)
	image_tiling_linear                  = int(1)
	image_tiling_drm_format_modifier_ext = int(1000158000)
	image_tiling_max_enum                = int(0x7FFFFFFF)
}

pub enum ImageType {
	image_type1d        = int(0)
	image_type2d        = int(1)
	image_type3d        = int(2)
	image_type_max_enum = int(0x7FFFFFFF)
}

pub enum PhysicalDeviceType {
	physical_device_type_other          = int(0)
	physical_device_type_integrated_gpu = int(1)
	physical_device_type_discrete_gpu   = int(2)
	physical_device_type_virtual_gpu    = int(3)
	physical_device_type_cpu            = int(4)
	physical_device_type_max_enum       = int(0x7FFFFFFF)
}

pub enum QueryType {
	query_type_occlusion                                                      = int(0)
	query_type_pipeline_statistics                                            = int(1)
	query_type_timestamp                                                      = int(2)
	query_type_result_status_only_khr                                         = int(1000023000)
	query_type_transform_feedback_stream_ext                                  = int(1000028004)
	query_type_performance_query_khr                                          = int(1000116000)
	query_type_acceleration_structure_compacted_size_khr                      = int(1000150000)
	query_type_acceleration_structure_serialization_size_khr                  = int(1000150001)
	query_type_acceleration_structure_compacted_size_nv                       = int(1000165000)
	query_type_performance_query_intel                                        = int(1000210000)
	query_type_video_encode_feedback_khr                                      = int(1000299000)
	query_type_mesh_primitives_generated_ext                                  = int(1000328000)
	query_type_primitives_generated_ext                                       = int(1000382000)
	query_type_acceleration_structure_serialization_bottom_level_pointers_khr = int(1000386000)
	query_type_acceleration_structure_size_khr                                = int(1000386001)
	query_type_micromap_serialization_size_ext                                = int(1000396000)
	query_type_micromap_compacted_size_ext                                    = int(1000396001)
	query_type_max_enum                                                       = int(0x7FFFFFFF)
}

pub enum SharingMode {
	sharing_mode_exclusive  = int(0)
	sharing_mode_concurrent = int(1)
	sharing_mode_max_enum   = int(0x7FFFFFFF)
}

pub enum ComponentSwizzle {
	component_swizzle_identity = int(0)
	component_swizzle_zero     = int(1)
	component_swizzle_one      = int(2)
	component_swizzle_r        = int(3)
	component_swizzle_g        = int(4)
	component_swizzle_b        = int(5)
	component_swizzle_a        = int(6)
	component_swizzle_max_enum = int(0x7FFFFFFF)
}

pub enum ImageViewType {
	image_view_type1d          = int(0)
	image_view_type2d          = int(1)
	image_view_type3d          = int(2)
	image_view_type_cube       = int(3)
	image_view_type1d_array    = int(4)
	image_view_type2d_array    = int(5)
	image_view_type_cube_array = int(6)
	image_view_type_max_enum   = int(0x7FFFFFFF)
}

pub enum BlendFactor {
	blend_factor_zero                     = int(0)
	blend_factor_one                      = int(1)
	blend_factor_src_color                = int(2)
	blend_factor_one_minus_src_color      = int(3)
	blend_factor_dst_color                = int(4)
	blend_factor_one_minus_dst_color      = int(5)
	blend_factor_src_alpha                = int(6)
	blend_factor_one_minus_src_alpha      = int(7)
	blend_factor_dst_alpha                = int(8)
	blend_factor_one_minus_dst_alpha      = int(9)
	blend_factor_constant_color           = int(10)
	blend_factor_one_minus_constant_color = int(11)
	blend_factor_constant_alpha           = int(12)
	blend_factor_one_minus_constant_alpha = int(13)
	blend_factor_src_alpha_saturate       = int(14)
	blend_factor_src1_color               = int(15)
	blend_factor_one_minus_src1_color     = int(16)
	blend_factor_src1_alpha               = int(17)
	blend_factor_one_minus_src1_alpha     = int(18)
	blend_factor_max_enum                 = int(0x7FFFFFFF)
}

pub enum BlendOp {
	blend_op_add                    = int(0)
	blend_op_subtract               = int(1)
	blend_op_reverse_subtract       = int(2)
	blend_op_min                    = int(3)
	blend_op_max                    = int(4)
	blend_op_zero_ext               = int(1000148000)
	blend_op_src_ext                = int(1000148001)
	blend_op_dst_ext                = int(1000148002)
	blend_op_src_over_ext           = int(1000148003)
	blend_op_dst_over_ext           = int(1000148004)
	blend_op_src_in_ext             = int(1000148005)
	blend_op_dst_in_ext             = int(1000148006)
	blend_op_src_out_ext            = int(1000148007)
	blend_op_dst_out_ext            = int(1000148008)
	blend_op_src_atop_ext           = int(1000148009)
	blend_op_dst_atop_ext           = int(1000148010)
	blend_op_xor_ext                = int(1000148011)
	blend_op_multiply_ext           = int(1000148012)
	blend_op_screen_ext             = int(1000148013)
	blend_op_overlay_ext            = int(1000148014)
	blend_op_darken_ext             = int(1000148015)
	blend_op_lighten_ext            = int(1000148016)
	blend_op_colordodge_ext         = int(1000148017)
	blend_op_colorburn_ext          = int(1000148018)
	blend_op_hardlight_ext          = int(1000148019)
	blend_op_softlight_ext          = int(1000148020)
	blend_op_difference_ext         = int(1000148021)
	blend_op_exclusion_ext          = int(1000148022)
	blend_op_invert_ext             = int(1000148023)
	blend_op_invert_rgb_ext         = int(1000148024)
	blend_op_lineardodge_ext        = int(1000148025)
	blend_op_linearburn_ext         = int(1000148026)
	blend_op_vividlight_ext         = int(1000148027)
	blend_op_linearlight_ext        = int(1000148028)
	blend_op_pinlight_ext           = int(1000148029)
	blend_op_hardmix_ext            = int(1000148030)
	blend_op_hsl_hue_ext            = int(1000148031)
	blend_op_hsl_saturation_ext     = int(1000148032)
	blend_op_hsl_color_ext          = int(1000148033)
	blend_op_hsl_luminosity_ext     = int(1000148034)
	blend_op_plus_ext               = int(1000148035)
	blend_op_plus_clamped_ext       = int(1000148036)
	blend_op_plus_clamped_alpha_ext = int(1000148037)
	blend_op_plus_darker_ext        = int(1000148038)
	blend_op_minus_ext              = int(1000148039)
	blend_op_minus_clamped_ext      = int(1000148040)
	blend_op_contrast_ext           = int(1000148041)
	blend_op_invert_ovg_ext         = int(1000148042)
	blend_op_red_ext                = int(1000148043)
	blend_op_green_ext              = int(1000148044)
	blend_op_blue_ext               = int(1000148045)
	blend_op_max_enum               = int(0x7FFFFFFF)
}

pub enum CompareOp {
	compare_op_never            = int(0)
	compare_op_less             = int(1)
	compare_op_equal            = int(2)
	compare_op_less_or_equal    = int(3)
	compare_op_greater          = int(4)
	compare_op_not_equal        = int(5)
	compare_op_greater_or_equal = int(6)
	compare_op_always           = int(7)
	compare_op_max_enum         = int(0x7FFFFFFF)
}

pub enum DynamicState {
	dynamic_state_viewport                                = int(0)
	dynamic_state_scissor                                 = int(1)
	dynamic_state_line_width                              = int(2)
	dynamic_state_depth_bias                              = int(3)
	dynamic_state_blend_constants                         = int(4)
	dynamic_state_depth_bounds                            = int(5)
	dynamic_state_stencil_compare_mask                    = int(6)
	dynamic_state_stencil_write_mask                      = int(7)
	dynamic_state_stencil_reference                       = int(8)
	dynamic_state_cull_mode                               = int(1000267000)
	dynamic_state_front_face                              = int(1000267001)
	dynamic_state_primitive_topology                      = int(1000267002)
	dynamic_state_viewport_with_count                     = int(1000267003)
	dynamic_state_scissor_with_count                      = int(1000267004)
	dynamic_state_vertex_input_binding_stride             = int(1000267005)
	dynamic_state_depth_test_enable                       = int(1000267006)
	dynamic_state_depth_write_enable                      = int(1000267007)
	dynamic_state_depth_compare_op                        = int(1000267008)
	dynamic_state_depth_bounds_test_enable                = int(1000267009)
	dynamic_state_stencil_test_enable                     = int(1000267010)
	dynamic_state_stencil_op                              = int(1000267011)
	dynamic_state_rasterizer_discard_enable               = int(1000377001)
	dynamic_state_depth_bias_enable                       = int(1000377002)
	dynamic_state_primitive_restart_enable                = int(1000377004)
	dynamic_state_viewport_w_scaling_nv                   = int(1000087000)
	dynamic_state_discard_rectangle_ext                   = int(1000099000)
	dynamic_state_discard_rectangle_enable_ext            = int(1000099001)
	dynamic_state_discard_rectangle_mode_ext              = int(1000099002)
	dynamic_state_sample_locations_ext                    = int(1000143000)
	dynamic_state_ray_tracing_pipeline_stack_size_khr     = int(1000347000)
	dynamic_state_viewport_shading_rate_palette_nv        = int(1000164004)
	dynamic_state_viewport_coarse_sample_order_nv         = int(1000164006)
	dynamic_state_exclusive_scissor_enable_nv             = int(1000205000)
	dynamic_state_exclusive_scissor_nv                    = int(1000205001)
	dynamic_state_fragment_shading_rate_khr               = int(1000226000)
	dynamic_state_vertex_input_ext                        = int(1000352000)
	dynamic_state_patch_control_points_ext                = int(1000377000)
	dynamic_state_logic_op_ext                            = int(1000377003)
	dynamic_state_color_write_enable_ext                  = int(1000381000)
	dynamic_state_depth_clamp_enable_ext                  = int(1000455003)
	dynamic_state_polygon_mode_ext                        = int(1000455004)
	dynamic_state_rasterization_samples_ext               = int(1000455005)
	dynamic_state_sample_mask_ext                         = int(1000455006)
	dynamic_state_alpha_to_coverage_enable_ext            = int(1000455007)
	dynamic_state_alpha_to_one_enable_ext                 = int(1000455008)
	dynamic_state_logic_op_enable_ext                     = int(1000455009)
	dynamic_state_color_blend_enable_ext                  = int(1000455010)
	dynamic_state_color_blend_equation_ext                = int(1000455011)
	dynamic_state_color_write_mask_ext                    = int(1000455012)
	dynamic_state_tessellation_domain_origin_ext          = int(1000455002)
	dynamic_state_rasterization_stream_ext                = int(1000455013)
	dynamic_state_conservative_rasterization_mode_ext     = int(1000455014)
	dynamic_state_extra_primitive_overestimation_size_ext = int(1000455015)
	dynamic_state_depth_clip_enable_ext                   = int(1000455016)
	dynamic_state_sample_locations_enable_ext             = int(1000455017)
	dynamic_state_color_blend_advanced_ext                = int(1000455018)
	dynamic_state_provoking_vertex_mode_ext               = int(1000455019)
	dynamic_state_line_rasterization_mode_ext             = int(1000455020)
	dynamic_state_line_stipple_enable_ext                 = int(1000455021)
	dynamic_state_depth_clip_negative_one_to_one_ext      = int(1000455022)
	dynamic_state_viewport_w_scaling_enable_nv            = int(1000455023)
	dynamic_state_viewport_swizzle_nv                     = int(1000455024)
	dynamic_state_coverage_to_color_enable_nv             = int(1000455025)
	dynamic_state_coverage_to_color_location_nv           = int(1000455026)
	dynamic_state_coverage_modulation_mode_nv             = int(1000455027)
	dynamic_state_coverage_modulation_table_enable_nv     = int(1000455028)
	dynamic_state_coverage_modulation_table_nv            = int(1000455029)
	dynamic_state_shading_rate_image_enable_nv            = int(1000455030)
	dynamic_state_representative_fragment_test_enable_nv  = int(1000455031)
	dynamic_state_coverage_reduction_mode_nv              = int(1000455032)
	dynamic_state_attachment_feedback_loop_enable_ext     = int(1000524000)
	dynamic_state_line_stipple_khr                        = int(1000259000)
	dynamic_state_depth_clamp_range_ext                   = int(1000582000)
	dynamic_state_max_enum                                = int(0x7FFFFFFF)
}

pub enum FrontFace {
	front_face_counter_clockwise = int(0)
	front_face_clockwise         = int(1)
	front_face_max_enum          = int(0x7FFFFFFF)
}

pub enum VertexInputRate {
	vertex_input_rate_vertex   = int(0)
	vertex_input_rate_instance = int(1)
	vertex_input_rate_max_enum = int(0x7FFFFFFF)
}

pub enum PrimitiveTopology {
	primitive_topology_point_list                    = int(0)
	primitive_topology_line_list                     = int(1)
	primitive_topology_line_strip                    = int(2)
	primitive_topology_triangle_list                 = int(3)
	primitive_topology_triangle_strip                = int(4)
	primitive_topology_triangle_fan                  = int(5)
	primitive_topology_line_list_with_adjacency      = int(6)
	primitive_topology_line_strip_with_adjacency     = int(7)
	primitive_topology_triangle_list_with_adjacency  = int(8)
	primitive_topology_triangle_strip_with_adjacency = int(9)
	primitive_topology_patch_list                    = int(10)
	primitive_topology_max_enum                      = int(0x7FFFFFFF)
}

pub enum PolygonMode {
	polygon_mode_fill              = int(0)
	polygon_mode_line              = int(1)
	polygon_mode_point             = int(2)
	polygon_mode_fill_rectangle_nv = int(1000153000)
	polygon_mode_max_enum          = int(0x7FFFFFFF)
}

pub enum StencilOp {
	stencil_op_keep                = int(0)
	stencil_op_zero                = int(1)
	stencil_op_replace             = int(2)
	stencil_op_increment_and_clamp = int(3)
	stencil_op_decrement_and_clamp = int(4)
	stencil_op_invert              = int(5)
	stencil_op_increment_and_wrap  = int(6)
	stencil_op_decrement_and_wrap  = int(7)
	stencil_op_max_enum            = int(0x7FFFFFFF)
}

pub enum LogicOp {
	logic_op_clear         = int(0)
	logic_op_and           = int(1)
	logic_op_and_reverse   = int(2)
	logic_op_copy          = int(3)
	logic_op_and_inverted  = int(4)
	logic_op_no_op         = int(5)
	logic_op_xor           = int(6)
	logic_op_or            = int(7)
	logic_op_nor           = int(8)
	logic_op_equivalent    = int(9)
	logic_op_invert        = int(10)
	logic_op_or_reverse    = int(11)
	logic_op_copy_inverted = int(12)
	logic_op_or_inverted   = int(13)
	logic_op_nand          = int(14)
	logic_op_set           = int(15)
	logic_op_max_enum      = int(0x7FFFFFFF)
}

pub enum BorderColor {
	border_color_float_transparent_black = int(0)
	border_color_int_transparent_black   = int(1)
	border_color_float_opaque_black      = int(2)
	border_color_int_opaque_black        = int(3)
	border_color_float_opaque_white      = int(4)
	border_color_int_opaque_white        = int(5)
	border_color_float_custom_ext        = int(1000287003)
	border_color_int_custom_ext          = int(1000287004)
	border_color_max_enum                = int(0x7FFFFFFF)
}

pub enum Filter {
	filter_nearest   = int(0)
	filter_linear    = int(1)
	filter_cubic_ext = int(1000015000)
	filter_max_enum  = int(0x7FFFFFFF)
}

pub enum SamplerAddressMode {
	sampler_address_mode_repeat               = int(0)
	sampler_address_mode_mirrored_repeat      = int(1)
	sampler_address_mode_clamp_to_edge        = int(2)
	sampler_address_mode_clamp_to_border      = int(3)
	sampler_address_mode_mirror_clamp_to_edge = int(4)
	sampler_address_mode_max_enum             = int(0x7FFFFFFF)
}

pub enum SamplerMipmapMode {
	sampler_mipmap_mode_nearest  = int(0)
	sampler_mipmap_mode_linear   = int(1)
	sampler_mipmap_mode_max_enum = int(0x7FFFFFFF)
}

pub enum DescriptorType {
	descriptor_type_sampler                    = int(0)
	descriptor_type_combined_image_sampler     = int(1)
	descriptor_type_sampled_image              = int(2)
	descriptor_type_storage_image              = int(3)
	descriptor_type_uniform_texel_buffer       = int(4)
	descriptor_type_storage_texel_buffer       = int(5)
	descriptor_type_uniform_buffer             = int(6)
	descriptor_type_storage_buffer             = int(7)
	descriptor_type_uniform_buffer_dynamic     = int(8)
	descriptor_type_storage_buffer_dynamic     = int(9)
	descriptor_type_input_attachment           = int(10)
	descriptor_type_inline_uniform_block       = int(1000138000)
	descriptor_type_acceleration_structure_khr = int(1000150000)
	descriptor_type_acceleration_structure_nv  = int(1000165000)
	descriptor_type_sample_weight_image_qcom   = int(1000440000)
	descriptor_type_block_match_image_qcom     = int(1000440001)
	descriptor_type_mutable_ext                = int(1000351000)
	descriptor_type_max_enum                   = int(0x7FFFFFFF)
}

pub enum AttachmentLoadOp {
	attachment_load_op_load      = int(0)
	attachment_load_op_clear     = int(1)
	attachment_load_op_dont_care = int(2)
	attachment_load_op_none_khr  = int(1000400000)
	attachment_load_op_max_enum  = int(0x7FFFFFFF)
}

pub enum AttachmentStoreOp {
	attachment_store_op_store     = int(0)
	attachment_store_op_dont_care = int(1)
	attachment_store_op_none      = int(1000301000)
	attachment_store_op_max_enum  = int(0x7FFFFFFF)
}

pub enum PipelineBindPoint {
	pipeline_bind_point_graphics               = int(0)
	pipeline_bind_point_compute                = int(1)
	pipeline_bind_point_ray_tracing_khr        = int(1000165000)
	pipeline_bind_point_subpass_shading_huawei = int(1000369003)
	pipeline_bind_point_max_enum               = int(0x7FFFFFFF)
}

pub enum CommandBufferLevel {
	command_buffer_level_primary   = int(0)
	command_buffer_level_secondary = int(1)
	command_buffer_level_max_enum  = int(0x7FFFFFFF)
}

pub enum IndexType {
	index_type_uint16    = int(0)
	index_type_uint32    = int(1)
	index_type_none_khr  = int(1000165000)
	index_type_uint8_khr = int(1000265000)
	index_type_max_enum  = int(0x7FFFFFFF)
}

pub enum SubpassContents {
	subpass_contents_inline                                   = int(0)
	subpass_contents_secondary_command_buffers                = int(1)
	subpass_contents_inline_and_secondary_command_buffers_khr = int(1000451000)
	subpass_contents_max_enum                                 = int(0x7FFFFFFF)
}

pub enum AccessFlagBits {
	access_indirect_command_read_bit                     = int(0x00000001)
	access_index_read_bit                                = int(0x00000002)
	access_vertex_attribute_read_bit                     = int(0x00000004)
	access_uniform_read_bit                              = int(0x00000008)
	access_input_attachment_read_bit                     = int(0x00000010)
	access_shader_read_bit                               = int(0x00000020)
	access_shader_write_bit                              = int(0x00000040)
	access_color_attachment_read_bit                     = int(0x00000080)
	access_color_attachment_write_bit                    = int(0x00000100)
	access_depth_stencil_attachment_read_bit             = int(0x00000200)
	access_depth_stencil_attachment_write_bit            = int(0x00000400)
	access_transfer_read_bit                             = int(0x00000800)
	access_transfer_write_bit                            = int(0x00001000)
	access_host_read_bit                                 = int(0x00002000)
	access_host_write_bit                                = int(0x00004000)
	access_memory_read_bit                               = int(0x00008000)
	access_memory_write_bit                              = int(0x00010000)
	access_none                                          = int(0)
	access_transform_feedback_write_bit_ext              = int(0x02000000)
	access_transform_feedback_counter_read_bit_ext       = int(0x04000000)
	access_transform_feedback_counter_write_bit_ext      = int(0x08000000)
	access_conditional_rendering_read_bit_ext            = int(0x00100000)
	access_color_attachment_read_noncoherent_bit_ext     = int(0x00080000)
	access_acceleration_structure_read_bit_khr           = int(0x00200000)
	access_acceleration_structure_write_bit_khr          = int(0x00400000)
	access_fragment_density_map_read_bit_ext             = int(0x01000000)
	access_fragment_shading_rate_attachment_read_bit_khr = int(0x00800000)
	access_command_preprocess_read_bit_nv                = int(0x00020000)
	access_command_preprocess_write_bit_nv               = int(0x00040000)
	access_flag_bits_max_enum                            = int(0x7FFFFFFF)
}

pub type AccessFlags = u32

pub enum ImageAspectFlagBits {
	image_aspect_color_bit             = int(0x00000001)
	image_aspect_depth_bit             = int(0x00000002)
	image_aspect_stencil_bit           = int(0x00000004)
	image_aspect_metadata_bit          = int(0x00000008)
	image_aspect_plane0_bit            = int(0x00000010)
	image_aspect_plane1_bit            = int(0x00000020)
	image_aspect_plane2_bit            = int(0x00000040)
	image_aspect_none                  = int(0)
	image_aspect_memory_plane0_bit_ext = int(0x00000080)
	image_aspect_memory_plane1_bit_ext = int(0x00000100)
	image_aspect_memory_plane2_bit_ext = int(0x00000200)
	image_aspect_memory_plane3_bit_ext = int(0x00000400)
	image_aspect_flag_bits_max_enum    = int(0x7FFFFFFF)
}

pub type ImageAspectFlags = u32

pub enum FormatFeatureFlagBits {
	format_feature_sampled_image_bit                                                           = int(0x00000001)
	format_feature_storage_image_bit                                                           = int(0x00000002)
	format_feature_storage_image_atomic_bit                                                    = int(0x00000004)
	format_feature_uniform_texel_buffer_bit                                                    = int(0x00000008)
	format_feature_storage_texel_buffer_bit                                                    = int(0x00000010)
	format_feature_storage_texel_buffer_atomic_bit                                             = int(0x00000020)
	format_feature_vertex_buffer_bit                                                           = int(0x00000040)
	format_feature_color_attachment_bit                                                        = int(0x00000080)
	format_feature_color_attachment_blend_bit                                                  = int(0x00000100)
	format_feature_depth_stencil_attachment_bit                                                = int(0x00000200)
	format_feature_blit_src_bit                                                                = int(0x00000400)
	format_feature_blit_dst_bit                                                                = int(0x00000800)
	format_feature_sampled_image_filter_linear_bit                                             = int(0x00001000)
	format_feature_transfer_src_bit                                                            = int(0x00004000)
	format_feature_transfer_dst_bit                                                            = int(0x00008000)
	format_feature_midpoint_chroma_samples_bit                                                 = int(0x00020000)
	format_feature_sampled_image_ycbcr_conversion_linear_filter_bit                            = int(0x00040000)
	format_feature_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit           = int(0x00080000)
	format_feature_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit           = int(0x00100000)
	format_feature_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit = int(0x00200000)
	format_feature_disjoint_bit                                                                = int(0x00400000)
	format_feature_cosited_chroma_samples_bit                                                  = int(0x00800000)
	format_feature_sampled_image_filter_minmax_bit                                             = int(0x00010000)
	format_feature_video_decode_output_bit_khr                                                 = int(0x02000000)
	format_feature_video_decode_dpb_bit_khr                                                    = int(0x04000000)
	format_feature_acceleration_structure_vertex_buffer_bit_khr                                = int(0x20000000)
	format_feature_sampled_image_filter_cubic_bit_ext                                          = int(0x00002000)
	format_feature_fragment_density_map_bit_ext                                                = int(0x01000000)
	format_feature_fragment_shading_rate_attachment_bit_khr                                    = int(0x40000000)
	format_feature_video_encode_input_bit_khr                                                  = int(0x08000000)
	format_feature_video_encode_dpb_bit_khr                                                    = int(0x10000000)
	format_feature_flag_bits_max_enum                                                          = int(0x7FFFFFFF)
}

pub type FormatFeatureFlags = u32

pub enum ImageCreateFlagBits {
	image_create_sparse_binding_bit                            = int(0x00000001)
	image_create_sparse_residency_bit                          = int(0x00000002)
	image_create_sparse_aliased_bit                            = int(0x00000004)
	image_create_mutable_format_bit                            = int(0x00000008)
	image_create_cube_compatible_bit                           = int(0x00000010)
	image_create_alias_bit                                     = int(0x00000400)
	image_create_split_instance_bind_regions_bit               = int(0x00000040)
	image_create2d_array_compatible_bit                        = int(0x00000020)
	image_create_block_texel_view_compatible_bit               = int(0x00000080)
	image_create_extended_usage_bit                            = int(0x00000100)
	image_create_protected_bit                                 = int(0x00000800)
	image_create_disjoint_bit                                  = int(0x00000200)
	image_create_corner_sampled_bit_nv                         = int(0x00002000)
	image_create_sample_locations_compatible_depth_bit_ext     = int(0x00001000)
	image_create_subsampled_bit_ext                            = int(0x00004000)
	image_create_descriptor_buffer_capture_replay_bit_ext      = int(0x00010000)
	image_create_multisampled_render_to_single_sampled_bit_ext = int(0x00040000)
	image_create2d_view_compatible_bit_ext                     = int(0x00020000)
	image_create_fragment_density_map_offset_bit_qcom          = int(0x00008000)
	image_create_video_profile_independent_bit_khr             = int(0x00100000)
	image_create_flag_bits_max_enum                            = int(0x7FFFFFFF)
}

pub type ImageCreateFlags = u32

pub enum SampleCountFlagBits {
	sample_count1_bit               = int(0x00000001)
	sample_count2_bit               = int(0x00000002)
	sample_count4_bit               = int(0x00000004)
	sample_count8_bit               = int(0x00000008)
	sample_count16_bit              = int(0x00000010)
	sample_count32_bit              = int(0x00000020)
	sample_count64_bit              = int(0x00000040)
	sample_count_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type SampleCountFlags = u32

pub enum ImageUsageFlagBits {
	image_usage_transfer_src_bit                            = int(0x00000001)
	image_usage_transfer_dst_bit                            = int(0x00000002)
	image_usage_sampled_bit                                 = int(0x00000004)
	image_usage_storage_bit                                 = int(0x00000008)
	image_usage_color_attachment_bit                        = int(0x00000010)
	image_usage_depth_stencil_attachment_bit                = int(0x00000020)
	image_usage_transient_attachment_bit                    = int(0x00000040)
	image_usage_input_attachment_bit                        = int(0x00000080)
	image_usage_video_decode_dst_bit_khr                    = int(0x00000400)
	image_usage_video_decode_src_bit_khr                    = int(0x00000800)
	image_usage_video_decode_dpb_bit_khr                    = int(0x00001000)
	image_usage_fragment_density_map_bit_ext                = int(0x00000200)
	image_usage_fragment_shading_rate_attachment_bit_khr    = int(0x00000100)
	image_usage_host_transfer_bit_ext                       = int(0x00400000)
	image_usage_video_encode_dst_bit_khr                    = int(0x00002000)
	image_usage_video_encode_src_bit_khr                    = int(0x00004000)
	image_usage_video_encode_dpb_bit_khr                    = int(0x00008000)
	image_usage_attachment_feedback_loop_bit_ext            = int(0x00080000)
	image_usage_invocation_mask_bit_huawei                  = int(0x00040000)
	image_usage_sample_weight_bit_qcom                      = int(0x00100000)
	image_usage_sample_block_match_bit_qcom                 = int(0x00200000)
	image_usage_video_encode_quantization_delta_map_bit_khr = int(0x02000000)
	image_usage_video_encode_emphasis_map_bit_khr           = int(0x04000000)
	image_usage_flag_bits_max_enum                          = int(0x7FFFFFFF)
}

pub type ImageUsageFlags = u32

pub enum InstanceCreateFlagBits {
	instance_create_enumerate_portability_bit_khr = int(0x00000001)
	instance_create_flag_bits_max_enum            = int(0x7FFFFFFF)
}

pub type InstanceCreateFlags = u32

pub enum MemoryHeapFlagBits {
	memory_heap_device_local_bit   = int(0x00000001)
	memory_heap_multi_instance_bit = int(0x00000002)
	memory_heap_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type MemoryHeapFlags = u32

pub enum MemoryPropertyFlagBits {
	memory_property_device_local_bit        = int(0x00000001)
	memory_property_host_visible_bit        = int(0x00000002)
	memory_property_host_coherent_bit       = int(0x00000004)
	memory_property_host_cached_bit         = int(0x00000008)
	memory_property_lazily_allocated_bit    = int(0x00000010)
	memory_property_protected_bit           = int(0x00000020)
	memory_property_device_coherent_bit_amd = int(0x00000040)
	memory_property_device_uncached_bit_amd = int(0x00000080)
	memory_property_rdma_capable_bit_nv     = int(0x00000100)
	memory_property_flag_bits_max_enum      = int(0x7FFFFFFF)
}

pub type MemoryPropertyFlags = u32

pub enum QueueFlagBits {
	queue_graphics_bit         = int(0x00000001)
	queue_compute_bit          = int(0x00000002)
	queue_transfer_bit         = int(0x00000004)
	queue_sparse_binding_bit   = int(0x00000008)
	queue_protected_bit        = int(0x00000010)
	queue_video_decode_bit_khr = int(0x00000020)
	queue_video_encode_bit_khr = int(0x00000040)
	queue_optical_flow_bit_nv  = int(0x00000100)
	queue_flag_bits_max_enum   = int(0x7FFFFFFF)
}

pub type QueueFlags = u32
pub type DeviceCreateFlags = u32

pub enum DeviceQueueCreateFlagBits {
	device_queue_create_protected_bit      = int(0x00000001)
	device_queue_create_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type DeviceQueueCreateFlags = u32

pub enum PipelineStageFlagBits {
	pipeline_stage_top_of_pipe_bit                          = int(0x00000001)
	pipeline_stage_draw_indirect_bit                        = int(0x00000002)
	pipeline_stage_vertex_input_bit                         = int(0x00000004)
	pipeline_stage_vertex_shader_bit                        = int(0x00000008)
	pipeline_stage_tessellation_control_shader_bit          = int(0x00000010)
	pipeline_stage_tessellation_evaluation_shader_bit       = int(0x00000020)
	pipeline_stage_geometry_shader_bit                      = int(0x00000040)
	pipeline_stage_fragment_shader_bit                      = int(0x00000080)
	pipeline_stage_early_fragment_tests_bit                 = int(0x00000100)
	pipeline_stage_late_fragment_tests_bit                  = int(0x00000200)
	pipeline_stage_color_attachment_output_bit              = int(0x00000400)
	pipeline_stage_compute_shader_bit                       = int(0x00000800)
	pipeline_stage_transfer_bit                             = int(0x00001000)
	pipeline_stage_bottom_of_pipe_bit                       = int(0x00002000)
	pipeline_stage_host_bit                                 = int(0x00004000)
	pipeline_stage_all_graphics_bit                         = int(0x00008000)
	pipeline_stage_all_commands_bit                         = int(0x00010000)
	pipeline_stage_none                                     = int(0)
	pipeline_stage_transform_feedback_bit_ext               = int(0x01000000)
	pipeline_stage_conditional_rendering_bit_ext            = int(0x00040000)
	pipeline_stage_acceleration_structure_build_bit_khr     = int(0x02000000)
	pipeline_stage_ray_tracing_shader_bit_khr               = int(0x00200000)
	pipeline_stage_fragment_density_process_bit_ext         = int(0x00800000)
	pipeline_stage_fragment_shading_rate_attachment_bit_khr = int(0x00400000)
	pipeline_stage_command_preprocess_bit_nv                = int(0x00020000)
	pipeline_stage_task_shader_bit_ext                      = int(0x00080000)
	pipeline_stage_mesh_shader_bit_ext                      = int(0x00100000)
	pipeline_stage_flag_bits_max_enum                       = int(0x7FFFFFFF)
}

pub type PipelineStageFlags = u32

pub enum MemoryMapFlagBits {
	memory_map_placed_bit_ext     = int(0x00000001)
	memory_map_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type MemoryMapFlags = u32

pub enum SparseMemoryBindFlagBits {
	sparse_memory_bind_metadata_bit       = int(0x00000001)
	sparse_memory_bind_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type SparseMemoryBindFlags = u32

pub enum SparseImageFormatFlagBits {
	sparse_image_format_single_miptail_bit         = int(0x00000001)
	sparse_image_format_aligned_mip_size_bit       = int(0x00000002)
	sparse_image_format_nonstandard_block_size_bit = int(0x00000004)
	sparse_image_format_flag_bits_max_enum         = int(0x7FFFFFFF)
}

pub type SparseImageFormatFlags = u32

pub enum FenceCreateFlagBits {
	fence_create_signaled_bit       = int(0x00000001)
	fence_create_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type FenceCreateFlags = u32
pub type SemaphoreCreateFlags = u32

pub enum EventCreateFlagBits {
	event_create_device_only_bit    = int(0x00000001)
	event_create_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type EventCreateFlags = u32

pub enum QueryPipelineStatisticFlagBits {
	query_pipeline_statistic_input_assembly_vertices_bit                    = int(0x00000001)
	query_pipeline_statistic_input_assembly_primitives_bit                  = int(0x00000002)
	query_pipeline_statistic_vertex_shader_invocations_bit                  = int(0x00000004)
	query_pipeline_statistic_geometry_shader_invocations_bit                = int(0x00000008)
	query_pipeline_statistic_geometry_shader_primitives_bit                 = int(0x00000010)
	query_pipeline_statistic_clipping_invocations_bit                       = int(0x00000020)
	query_pipeline_statistic_clipping_primitives_bit                        = int(0x00000040)
	query_pipeline_statistic_fragment_shader_invocations_bit                = int(0x00000080)
	query_pipeline_statistic_tessellation_control_shader_patches_bit        = int(0x00000100)
	query_pipeline_statistic_tessellation_evaluation_shader_invocations_bit = int(0x00000200)
	query_pipeline_statistic_compute_shader_invocations_bit                 = int(0x00000400)
	query_pipeline_statistic_task_shader_invocations_bit_ext                = int(0x00000800)
	query_pipeline_statistic_mesh_shader_invocations_bit_ext                = int(0x00001000)
	query_pipeline_statistic_cluster_culling_shader_invocations_bit_huawei  = int(0x00002000)
	query_pipeline_statistic_flag_bits_max_enum                             = int(0x7FFFFFFF)
}

pub type QueryPipelineStatisticFlags = u32
pub type QueryPoolCreateFlags = u32

pub enum QueryResultFlagBits {
	query_result64_bit                 = int(0x00000001)
	query_result_wait_bit              = int(0x00000002)
	query_result_with_availability_bit = int(0x00000004)
	query_result_partial_bit           = int(0x00000008)
	query_result_with_status_bit_khr   = int(0x00000010)
	query_result_flag_bits_max_enum    = int(0x7FFFFFFF)
}

pub type QueryResultFlags = u32

pub enum BufferCreateFlagBits {
	buffer_create_sparse_binding_bit                       = int(0x00000001)
	buffer_create_sparse_residency_bit                     = int(0x00000002)
	buffer_create_sparse_aliased_bit                       = int(0x00000004)
	buffer_create_protected_bit                            = int(0x00000008)
	buffer_create_device_address_capture_replay_bit        = int(0x00000010)
	buffer_create_descriptor_buffer_capture_replay_bit_ext = int(0x00000020)
	buffer_create_video_profile_independent_bit_khr        = int(0x00000040)
	buffer_create_flag_bits_max_enum                       = int(0x7FFFFFFF)
}

pub type BufferCreateFlags = u32

pub enum BufferUsageFlagBits {
	buffer_usage_transfer_src_bit                                     = int(0x00000001)
	buffer_usage_transfer_dst_bit                                     = int(0x00000002)
	buffer_usage_uniform_texel_buffer_bit                             = int(0x00000004)
	buffer_usage_storage_texel_buffer_bit                             = int(0x00000008)
	buffer_usage_uniform_buffer_bit                                   = int(0x00000010)
	buffer_usage_storage_buffer_bit                                   = int(0x00000020)
	buffer_usage_index_buffer_bit                                     = int(0x00000040)
	buffer_usage_vertex_buffer_bit                                    = int(0x00000080)
	buffer_usage_indirect_buffer_bit                                  = int(0x00000100)
	buffer_usage_shader_device_address_bit                            = int(0x00020000)
	buffer_usage_video_decode_src_bit_khr                             = int(0x00002000)
	buffer_usage_video_decode_dst_bit_khr                             = int(0x00004000)
	buffer_usage_transform_feedback_buffer_bit_ext                    = int(0x00000800)
	buffer_usage_transform_feedback_counter_buffer_bit_ext            = int(0x00001000)
	buffer_usage_conditional_rendering_bit_ext                        = int(0x00000200)
	buffer_usage_acceleration_structure_build_input_read_only_bit_khr = int(0x00080000)
	buffer_usage_acceleration_structure_storage_bit_khr               = int(0x00100000)
	buffer_usage_shader_binding_table_bit_khr                         = int(0x00000400)
	buffer_usage_video_encode_dst_bit_khr                             = int(0x00008000)
	buffer_usage_video_encode_src_bit_khr                             = int(0x00010000)
	buffer_usage_sampler_descriptor_buffer_bit_ext                    = int(0x00200000)
	buffer_usage_resource_descriptor_buffer_bit_ext                   = int(0x00400000)
	buffer_usage_push_descriptors_descriptor_buffer_bit_ext           = int(0x04000000)
	buffer_usage_micromap_build_input_read_only_bit_ext               = int(0x00800000)
	buffer_usage_micromap_storage_bit_ext                             = int(0x01000000)
	buffer_usage_flag_bits_max_enum                                   = int(0x7FFFFFFF)
}

pub type BufferUsageFlags = u32
pub type BufferViewCreateFlags = u32

pub enum ImageViewCreateFlagBits {
	image_view_create_fragment_density_map_dynamic_bit_ext     = int(0x00000001)
	image_view_create_descriptor_buffer_capture_replay_bit_ext = int(0x00000004)
	image_view_create_fragment_density_map_deferred_bit_ext    = int(0x00000002)
	image_view_create_flag_bits_max_enum                       = int(0x7FFFFFFF)
}

pub type ImageViewCreateFlags = u32
pub type ShaderModuleCreateFlags = u32

pub enum PipelineCacheCreateFlagBits {
	pipeline_cache_create_externally_synchronized_bit = int(0x00000001)
	pipeline_cache_create_flag_bits_max_enum          = int(0x7FFFFFFF)
}

pub type PipelineCacheCreateFlags = u32

pub enum ColorComponentFlagBits {
	color_component_r_bit              = int(0x00000001)
	color_component_g_bit              = int(0x00000002)
	color_component_b_bit              = int(0x00000004)
	color_component_a_bit              = int(0x00000008)
	color_component_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type ColorComponentFlags = u32

pub enum PipelineCreateFlagBits {
	pipeline_create_disable_optimization_bit                               = int(0x00000001)
	pipeline_create_allow_derivatives_bit                                  = int(0x00000002)
	pipeline_create_derivative_bit                                         = int(0x00000004)
	pipeline_create_view_index_from_device_index_bit                       = int(0x00000008)
	pipeline_create_dispatch_base_bit                                      = int(0x00000010)
	pipeline_create_fail_on_pipeline_compile_required_bit                  = int(0x00000100)
	pipeline_create_early_return_on_failure_bit                            = int(0x00000200)
	pipeline_create_ray_tracing_no_null_any_hit_shaders_bit_khr            = int(0x00004000)
	pipeline_create_ray_tracing_no_null_closest_hit_shaders_bit_khr        = int(0x00008000)
	pipeline_create_ray_tracing_no_null_miss_shaders_bit_khr               = int(0x00010000)
	pipeline_create_ray_tracing_no_null_intersection_shaders_bit_khr       = int(0x00020000)
	pipeline_create_ray_tracing_skip_triangles_bit_khr                     = int(0x00001000)
	pipeline_create_ray_tracing_skip_aabbs_bit_khr                         = int(0x00002000)
	pipeline_create_ray_tracing_shader_group_handle_capture_replay_bit_khr = int(0x00080000)
	pipeline_create_defer_compile_bit_nv                                   = int(0x00000020)
	pipeline_create_rendering_fragment_density_map_attachment_bit_ext      = int(0x00400000)
	pipeline_create_rendering_fragment_shading_rate_attachment_bit_khr     = int(0x00200000)
	pipeline_create_capture_statistics_bit_khr                             = int(0x00000040)
	pipeline_create_capture_internal_representations_bit_khr               = int(0x00000080)
	pipeline_create_indirect_bindable_bit_nv                               = int(0x00040000)
	pipeline_create_library_bit_khr                                        = int(0x00000800)
	pipeline_create_descriptor_buffer_bit_ext                              = int(0x20000000)
	pipeline_create_retain_link_time_optimization_info_bit_ext             = int(0x00800000)
	pipeline_create_link_time_optimization_bit_ext                         = int(0x00000400)
	pipeline_create_ray_tracing_allow_motion_bit_nv                        = int(0x00100000)
	pipeline_create_color_attachment_feedback_loop_bit_ext                 = int(0x02000000)
	pipeline_create_depth_stencil_attachment_feedback_loop_bit_ext         = int(0x04000000)
	pipeline_create_ray_tracing_opacity_micromap_bit_ext                   = int(0x01000000)
	pipeline_create_no_protected_access_bit_ext                            = int(0x08000000)
	pipeline_create_protected_access_only_bit_ext                          = int(0x40000000)
	pipeline_create_flag_bits_max_enum                                     = int(0x7FFFFFFF)
}

pub type PipelineCreateFlags = u32

pub enum PipelineShaderStageCreateFlagBits {
	pipeline_shader_stage_create_allow_varying_subgroup_size_bit = int(0x00000001)
	pipeline_shader_stage_create_require_full_subgroups_bit      = int(0x00000002)
	pipeline_shader_stage_create_flag_bits_max_enum              = int(0x7FFFFFFF)
}

pub type PipelineShaderStageCreateFlags = u32

pub enum ShaderStageFlagBits {
	shader_stage_vertex_bit                  = int(0x00000001)
	shader_stage_tessellation_control_bit    = int(0x00000002)
	shader_stage_tessellation_evaluation_bit = int(0x00000004)
	shader_stage_geometry_bit                = int(0x00000008)
	shader_stage_fragment_bit                = int(0x00000010)
	shader_stage_compute_bit                 = int(0x00000020)
	shader_stage_all_graphics                = int(0x0000001F)
	shader_stage_all                         = int(0x7FFFFFFF)
	shader_stage_raygen_bit_khr              = int(0x00000100)
	shader_stage_any_hit_bit_khr             = int(0x00000200)
	shader_stage_closest_hit_bit_khr         = int(0x00000400)
	shader_stage_miss_bit_khr                = int(0x00000800)
	shader_stage_intersection_bit_khr        = int(0x00001000)
	shader_stage_callable_bit_khr            = int(0x00002000)
	shader_stage_task_bit_ext                = int(0x00000040)
	shader_stage_mesh_bit_ext                = int(0x00000080)
	shader_stage_subpass_shading_bit_huawei  = int(0x00004000)
	shader_stage_cluster_culling_bit_huawei  = int(0x00080000)
	shader_stage_flag_bits_max_enum          = int(0x7FFFFFFF)
}

pub enum CullModeFlagBits {
	cull_mode_none               = int(0)
	cull_mode_front_bit          = int(0x00000001)
	cull_mode_back_bit           = int(0x00000002)
	cull_mode_front_and_back     = int(0x00000003)
	cull_mode_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type CullModeFlags = u32
pub type PipelineVertexInputStateCreateFlags = u32
pub type PipelineInputAssemblyStateCreateFlags = u32
pub type PipelineTessellationStateCreateFlags = u32
pub type PipelineViewportStateCreateFlags = u32
pub type PipelineRasterizationStateCreateFlags = u32
pub type PipelineMultisampleStateCreateFlags = u32

pub enum PipelineDepthStencilStateCreateFlagBits {
	pipeline_depth_stencil_state_create_rasterization_order_attachment_depth_access_bit_ext   = int(0x00000001)
	pipeline_depth_stencil_state_create_rasterization_order_attachment_stencil_access_bit_ext = int(0x00000002)
	pipeline_depth_stencil_state_create_flag_bits_max_enum                                    = int(0x7FFFFFFF)
}

pub type PipelineDepthStencilStateCreateFlags = u32

pub enum PipelineColorBlendStateCreateFlagBits {
	pipeline_color_blend_state_create_rasterization_order_attachment_access_bit_ext = int(0x00000001)
	pipeline_color_blend_state_create_flag_bits_max_enum                            = int(0x7FFFFFFF)
}

pub type PipelineColorBlendStateCreateFlags = u32
pub type PipelineDynamicStateCreateFlags = u32

pub enum PipelineLayoutCreateFlagBits {
	pipeline_layout_create_independent_sets_bit_ext = int(0x00000002)
	pipeline_layout_create_flag_bits_max_enum       = int(0x7FFFFFFF)
}

pub type PipelineLayoutCreateFlags = u32
pub type ShaderStageFlags = u32

pub enum SamplerCreateFlagBits {
	sampler_create_subsampled_bit_ext                       = int(0x00000001)
	sampler_create_subsampled_coarse_reconstruction_bit_ext = int(0x00000002)
	sampler_create_descriptor_buffer_capture_replay_bit_ext = int(0x00000008)
	sampler_create_non_seamless_cube_map_bit_ext            = int(0x00000004)
	sampler_create_image_processing_bit_qcom                = int(0x00000010)
	sampler_create_flag_bits_max_enum                       = int(0x7FFFFFFF)
}

pub type SamplerCreateFlags = u32

pub enum DescriptorPoolCreateFlagBits {
	descriptor_pool_create_free_descriptor_set_bit           = int(0x00000001)
	descriptor_pool_create_update_after_bind_bit             = int(0x00000002)
	descriptor_pool_create_host_only_bit_ext                 = int(0x00000004)
	descriptor_pool_create_allow_overallocation_sets_bit_nv  = int(0x00000008)
	descriptor_pool_create_allow_overallocation_pools_bit_nv = int(0x00000010)
	descriptor_pool_create_flag_bits_max_enum                = int(0x7FFFFFFF)
}

pub type DescriptorPoolCreateFlags = u32
pub type DescriptorPoolResetFlags = u32

pub enum DescriptorSetLayoutCreateFlagBits {
	descriptor_set_layout_create_update_after_bind_pool_bit          = int(0x00000002)
	descriptor_set_layout_create_push_descriptor_bit_khr             = int(0x00000001)
	descriptor_set_layout_create_descriptor_buffer_bit_ext           = int(0x00000010)
	descriptor_set_layout_create_embedded_immutable_samplers_bit_ext = int(0x00000020)
	descriptor_set_layout_create_indirect_bindable_bit_nv            = int(0x00000080)
	descriptor_set_layout_create_host_only_pool_bit_ext              = int(0x00000004)
	descriptor_set_layout_create_per_stage_bit_nv                    = int(0x00000040)
	descriptor_set_layout_create_flag_bits_max_enum                  = int(0x7FFFFFFF)
}

pub type DescriptorSetLayoutCreateFlags = u32

pub enum AttachmentDescriptionFlagBits {
	attachment_description_may_alias_bit      = int(0x00000001)
	attachment_description_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type AttachmentDescriptionFlags = u32

pub enum DependencyFlagBits {
	dependency_by_region_bit         = int(0x00000001)
	dependency_device_group_bit      = int(0x00000004)
	dependency_view_local_bit        = int(0x00000002)
	dependency_feedback_loop_bit_ext = int(0x00000008)
	dependency_flag_bits_max_enum    = int(0x7FFFFFFF)
}

pub type DependencyFlags = u32

pub enum FramebufferCreateFlagBits {
	framebuffer_create_imageless_bit      = int(0x00000001)
	framebuffer_create_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type FramebufferCreateFlags = u32

pub enum RenderPassCreateFlagBits {
	render_pass_create_transform_bit_qcom = int(0x00000002)
	render_pass_create_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type RenderPassCreateFlags = u32

pub enum SubpassDescriptionFlagBits {
	subpass_description_per_view_attributes_bit_nvx                           = int(0x00000001)
	subpass_description_per_view_position_x_only_bit_nvx                      = int(0x00000002)
	subpass_description_fragment_region_bit_qcom                              = int(0x00000004)
	subpass_description_shader_resolve_bit_qcom                               = int(0x00000008)
	subpass_description_rasterization_order_attachment_color_access_bit_ext   = int(0x00000010)
	subpass_description_rasterization_order_attachment_depth_access_bit_ext   = int(0x00000020)
	subpass_description_rasterization_order_attachment_stencil_access_bit_ext = int(0x00000040)
	subpass_description_enable_legacy_dithering_bit_ext                       = int(0x00000080)
	subpass_description_flag_bits_max_enum                                    = int(0x7FFFFFFF)
}

pub type SubpassDescriptionFlags = u32

pub enum CommandPoolCreateFlagBits {
	command_pool_create_transient_bit            = int(0x00000001)
	command_pool_create_reset_command_buffer_bit = int(0x00000002)
	command_pool_create_protected_bit            = int(0x00000004)
	command_pool_create_flag_bits_max_enum       = int(0x7FFFFFFF)
}

pub type CommandPoolCreateFlags = u32

pub enum CommandPoolResetFlagBits {
	command_pool_reset_release_resources_bit = int(0x00000001)
	command_pool_reset_flag_bits_max_enum    = int(0x7FFFFFFF)
}

pub type CommandPoolResetFlags = u32

pub enum CommandBufferUsageFlagBits {
	command_buffer_usage_one_time_submit_bit      = int(0x00000001)
	command_buffer_usage_render_pass_continue_bit = int(0x00000002)
	command_buffer_usage_simultaneous_use_bit     = int(0x00000004)
	command_buffer_usage_flag_bits_max_enum       = int(0x7FFFFFFF)
}

pub type CommandBufferUsageFlags = u32

pub enum QueryControlFlagBits {
	query_control_precise_bit        = int(0x00000001)
	query_control_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type QueryControlFlags = u32

pub enum CommandBufferResetFlagBits {
	command_buffer_reset_release_resources_bit = int(0x00000001)
	command_buffer_reset_flag_bits_max_enum    = int(0x7FFFFFFF)
}

pub type CommandBufferResetFlags = u32

pub enum StencilFaceFlagBits {
	stencil_face_front_bit          = int(0x00000001)
	stencil_face_back_bit           = int(0x00000002)
	stencil_face_front_and_back     = int(0x00000003)
	stencil_face_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type StencilFaceFlags = u32

pub struct Extent2D {
pub mut:
	width  u32
	height u32
}

pub struct Extent3D {
pub mut:
	width  u32
	height u32
	depth  u32
}

pub struct Offset2D {
pub mut:
	x i32
	y i32
}

pub struct Offset3D {
pub mut:
	x i32
	y i32
	z i32
}

pub struct Rect2D {
pub mut:
	offset Offset2D
	extent Extent2D
}

pub struct BaseInStructure {
pub mut:
	s_type StructureType
	p_next &BaseInStructure
}

pub struct BaseOutStructure {
pub mut:
	s_type StructureType
	p_next &BaseOutStructure
}

pub struct BufferMemoryBarrier {
pub mut:
	s_type                 StructureType = StructureType.structure_type_buffer_memory_barrier
	p_next                 voidptr
	src_access_mask        AccessFlags
	dst_access_mask        AccessFlags
	src_queue_family_index u32
	dst_queue_family_index u32
	buffer                 C.Buffer
	offset                 DeviceSize
	size                   DeviceSize
}

pub struct DispatchIndirectCommand {
pub mut:
	x u32
	y u32
	z u32
}

pub struct DrawIndexedIndirectCommand {
pub mut:
	index_count    u32
	instance_count u32
	first_index    u32
	vertex_offset  i32
	first_instance u32
}

pub struct DrawIndirectCommand {
pub mut:
	vertex_count   u32
	instance_count u32
	first_vertex   u32
	first_instance u32
}

pub struct ImageSubresourceRange {
pub mut:
	aspect_mask      ImageAspectFlags
	base_mip_level   u32
	level_count      u32
	base_array_layer u32
	layer_count      u32
}

pub struct ImageMemoryBarrier {
pub mut:
	s_type                 StructureType = StructureType.structure_type_image_memory_barrier
	p_next                 voidptr
	src_access_mask        AccessFlags
	dst_access_mask        AccessFlags
	old_layout             ImageLayout
	new_layout             ImageLayout
	src_queue_family_index u32
	dst_queue_family_index u32
	image                  C.Image
	subresource_range      ImageSubresourceRange
}

pub struct MemoryBarrier {
pub mut:
	s_type          StructureType = StructureType.structure_type_memory_barrier
	p_next          voidptr
	src_access_mask AccessFlags
	dst_access_mask AccessFlags
}

pub struct PipelineCacheHeaderVersionOne {
pub mut:
	header_size         u32
	header_version      PipelineCacheHeaderVersion
	vendor_id           u32
	device_id           u32
	pipeline_cache_uuid [uuid_size]u8
}

pub type PFN_vkAllocationFunction = fn (pUserData voidptr, size usize, alignment usize, allocationScope SystemAllocationScope)

pub type PFN_vkFreeFunction = fn (pUserData voidptr, pMemory voidptr)

pub type PFN_vkInternalAllocationNotification = fn (pUserData voidptr, size usize, allocationType InternalAllocationType, allocationScope SystemAllocationScope)

pub type PFN_vkInternalFreeNotification = fn (pUserData voidptr, size usize, allocationType InternalAllocationType, allocationScope SystemAllocationScope)

pub type PFN_vkReallocationFunction = fn (pUserData voidptr, pOriginal voidptr, size usize, alignment usize, allocationScope SystemAllocationScope)

pub type PFN_vkVoidFunction = fn ()

pub struct AllocationCallbacks {
pub mut:
	p_user_data             voidptr
	pfn_allocation          PFN_vkAllocationFunction             = unsafe { nil }
	pfn_reallocation        PFN_vkReallocationFunction           = unsafe { nil }
	pfn_free                PFN_vkFreeFunction                   = unsafe { nil }
	pfn_internal_allocation PFN_vkInternalAllocationNotification = unsafe { nil }
	pfn_internal_free       PFN_vkInternalFreeNotification       = unsafe { nil }
}

pub struct ApplicationInfo {
pub mut:
	s_type              StructureType = StructureType.structure_type_application_info
	p_next              voidptr
	p_application_name  &char
	application_version u32
	p_engine_name       &char
	engine_version      u32
	api_version         u32
}

pub struct FormatProperties {
pub mut:
	linear_tiling_features  FormatFeatureFlags
	optimal_tiling_features FormatFeatureFlags
	buffer_features         FormatFeatureFlags
}

pub struct ImageFormatProperties {
pub mut:
	max_extent        Extent3D
	max_mip_levels    u32
	max_array_layers  u32
	sample_counts     SampleCountFlags
	max_resource_size DeviceSize
}

pub struct InstanceCreateInfo {
pub mut:
	s_type                     StructureType = StructureType.structure_type_instance_create_info
	p_next                     voidptr
	flags                      InstanceCreateFlags
	p_application_info         &ApplicationInfo
	enabled_layer_count        u32
	pp_enabled_layer_names     &&char
	enabled_extension_count    u32
	pp_enabled_extension_names &&char
}

pub struct MemoryHeap {
pub mut:
	size  DeviceSize
	flags MemoryHeapFlags
}

pub struct MemoryType {
pub mut:
	property_flags MemoryPropertyFlags
	heap_index     u32
}

pub struct PhysicalDeviceFeatures {
pub mut:
	robust_buffer_access                         Bool32
	full_draw_index_uint32                       Bool32
	image_cube_array                             Bool32
	independent_blend                            Bool32
	geometry_shader                              Bool32
	tessellation_shader                          Bool32
	sample_rate_shading                          Bool32
	dual_src_blend                               Bool32
	logic_op                                     Bool32
	multi_draw_indirect                          Bool32
	draw_indirect_first_instance                 Bool32
	depth_clamp                                  Bool32
	depth_bias_clamp                             Bool32
	fill_mode_non_solid                          Bool32
	depth_bounds                                 Bool32
	wide_lines                                   Bool32
	large_points                                 Bool32
	alpha_to_one                                 Bool32
	multi_viewport                               Bool32
	sampler_anisotropy                           Bool32
	texture_compression_etc2                     Bool32
	texture_compression_astc_ldr                 Bool32
	texture_compression_bc                       Bool32
	occlusion_query_precise                      Bool32
	pipeline_statistics_query                    Bool32
	vertex_pipeline_stores_and_atomics           Bool32
	fragment_stores_and_atomics                  Bool32
	shader_tessellation_and_geometry_point_size  Bool32
	shader_image_gather_extended                 Bool32
	shader_storage_image_extended_formats        Bool32
	shader_storage_image_multisample             Bool32
	shader_storage_image_read_without_format     Bool32
	shader_storage_image_write_without_format    Bool32
	shader_uniform_buffer_array_dynamic_indexing Bool32
	shader_sampled_image_array_dynamic_indexing  Bool32
	shader_storage_buffer_array_dynamic_indexing Bool32
	shader_storage_image_array_dynamic_indexing  Bool32
	shader_clip_distance                         Bool32
	shader_cull_distance                         Bool32
	shader_float64                               Bool32
	shader_int64                                 Bool32
	shader_int16                                 Bool32
	shader_resource_residency                    Bool32
	shader_resource_min_lod                      Bool32
	sparse_binding                               Bool32
	sparse_residency_buffer                      Bool32
	sparse_residency_image2_d                    Bool32
	sparse_residency_image3_d                    Bool32
	sparse_residency2_samples                    Bool32
	sparse_residency4_samples                    Bool32
	sparse_residency8_samples                    Bool32
	sparse_residency16_samples                   Bool32
	sparse_residency_aliased                     Bool32
	variable_multisample_rate                    Bool32
	inherited_queries                            Bool32
}

pub struct PhysicalDeviceLimits {
pub mut:
	max_image_dimension1_d                                u32
	max_image_dimension2_d                                u32
	max_image_dimension3_d                                u32
	max_image_dimension_cube                              u32
	max_image_array_layers                                u32
	max_texel_buffer_elements                             u32
	max_uniform_buffer_range                              u32
	max_storage_buffer_range                              u32
	max_push_constants_size                               u32
	max_memory_allocation_count                           u32
	max_sampler_allocation_count                          u32
	buffer_image_granularity                              DeviceSize
	sparse_address_space_size                             DeviceSize
	max_bound_descriptor_sets                             u32
	max_per_stage_descriptor_samplers                     u32
	max_per_stage_descriptor_uniform_buffers              u32
	max_per_stage_descriptor_storage_buffers              u32
	max_per_stage_descriptor_sampled_images               u32
	max_per_stage_descriptor_storage_images               u32
	max_per_stage_descriptor_input_attachments            u32
	max_per_stage_resources                               u32
	max_descriptor_set_samplers                           u32
	max_descriptor_set_uniform_buffers                    u32
	max_descriptor_set_uniform_buffers_dynamic            u32
	max_descriptor_set_storage_buffers                    u32
	max_descriptor_set_storage_buffers_dynamic            u32
	max_descriptor_set_sampled_images                     u32
	max_descriptor_set_storage_images                     u32
	max_descriptor_set_input_attachments                  u32
	max_vertex_input_attributes                           u32
	max_vertex_input_bindings                             u32
	max_vertex_input_attribute_offset                     u32
	max_vertex_input_binding_stride                       u32
	max_vertex_output_components                          u32
	max_tessellation_generation_level                     u32
	max_tessellation_patch_size                           u32
	max_tessellation_control_per_vertex_input_components  u32
	max_tessellation_control_per_vertex_output_components u32
	max_tessellation_control_per_patch_output_components  u32
	max_tessellation_control_total_output_components      u32
	max_tessellation_evaluation_input_components          u32
	max_tessellation_evaluation_output_components         u32
	max_geometry_shader_invocations                       u32
	max_geometry_input_components                         u32
	max_geometry_output_components                        u32
	max_geometry_output_vertices                          u32
	max_geometry_total_output_components                  u32
	max_fragment_input_components                         u32
	max_fragment_output_attachments                       u32
	max_fragment_dual_src_attachments                     u32
	max_fragment_combined_output_resources                u32
	max_compute_shared_memory_size                        u32
	max_compute_work_group_count                          [3]u32
	max_compute_work_group_invocations                    u32
	max_compute_work_group_size                           [3]u32
	sub_pixel_precision_bits                              u32
	sub_texel_precision_bits                              u32
	mipmap_precision_bits                                 u32
	max_draw_indexed_index_value                          u32
	max_draw_indirect_count                               u32
	max_sampler_lod_bias                                  f32
	max_sampler_anisotropy                                f32
	max_viewports                                         u32
	max_viewport_dimensions                               [2]u32
	viewport_bounds_range                                 [2]f32
	viewport_sub_pixel_bits                               u32
	min_memory_map_alignment                              usize
	min_texel_buffer_offset_alignment                     DeviceSize
	min_uniform_buffer_offset_alignment                   DeviceSize
	min_storage_buffer_offset_alignment                   DeviceSize
	min_texel_offset                                      i32
	max_texel_offset                                      u32
	min_texel_gather_offset                               i32
	max_texel_gather_offset                               u32
	min_interpolation_offset                              f32
	max_interpolation_offset                              f32
	sub_pixel_interpolation_offset_bits                   u32
	max_framebuffer_width                                 u32
	max_framebuffer_height                                u32
	max_framebuffer_layers                                u32
	framebuffer_color_sample_counts                       SampleCountFlags
	framebuffer_depth_sample_counts                       SampleCountFlags
	framebuffer_stencil_sample_counts                     SampleCountFlags
	framebuffer_no_attachments_sample_counts              SampleCountFlags
	max_color_attachments                                 u32
	sampled_image_color_sample_counts                     SampleCountFlags
	sampled_image_integer_sample_counts                   SampleCountFlags
	sampled_image_depth_sample_counts                     SampleCountFlags
	sampled_image_stencil_sample_counts                   SampleCountFlags
	storage_image_sample_counts                           SampleCountFlags
	max_sample_mask_words                                 u32
	timestamp_compute_and_graphics                        Bool32
	timestamp_period                                      f32
	max_clip_distances                                    u32
	max_cull_distances                                    u32
	max_combined_clip_and_cull_distances                  u32
	discrete_queue_priorities                             u32
	point_size_range                                      [2]f32
	line_width_range                                      [2]f32
	point_size_granularity                                f32
	line_width_granularity                                f32
	strict_lines                                          Bool32
	standard_sample_locations                             Bool32
	optimal_buffer_copy_offset_alignment                  DeviceSize
	optimal_buffer_copy_row_pitch_alignment               DeviceSize
	non_coherent_atom_size                                DeviceSize
}

pub struct PhysicalDeviceMemoryProperties {
pub mut:
	memory_type_count u32
	memory_types      [max_memory_types]MemoryType
	memory_heap_count u32
	memory_heaps      [max_memory_heaps]MemoryHeap
}

pub struct PhysicalDeviceSparseProperties {
pub mut:
	residency_standard2_d_block_shape             Bool32
	residency_standard2_d_multisample_block_shape Bool32
	residency_standard3_d_block_shape             Bool32
	residency_aligned_mip_size                    Bool32
	residency_non_resident_strict                 Bool32
}

pub struct PhysicalDeviceProperties {
pub mut:
	api_version         u32
	driver_version      u32
	vendor_id           u32
	device_id           u32
	device_type         PhysicalDeviceType
	device_name         [max_physical_device_name_size]char
	pipeline_cache_uuid [uuid_size]u8
	limits              PhysicalDeviceLimits
	sparse_properties   PhysicalDeviceSparseProperties
}

pub struct QueueFamilyProperties {
pub mut:
	queue_flags                    QueueFlags
	queue_count                    u32
	timestamp_valid_bits           u32
	min_image_transfer_granularity Extent3D
}

pub struct DeviceQueueCreateInfo {
pub mut:
	s_type             StructureType = StructureType.structure_type_device_queue_create_info
	p_next             voidptr
	flags              DeviceQueueCreateFlags
	queue_family_index u32
	queue_count        u32
	p_queue_priorities &f32
}

pub struct DeviceCreateInfo {
pub mut:
	s_type                  StructureType = StructureType.structure_type_device_create_info
	p_next                  voidptr
	flags                   DeviceCreateFlags
	queue_create_info_count u32
	p_queue_create_infos    &DeviceQueueCreateInfo
	// enabledLayerCount is deprecated and should not be used
	enabled_layer_count u32
	// ppEnabledLayerNames is deprecated and should not be used
	pp_enabled_layer_names     &&char
	enabled_extension_count    u32
	pp_enabled_extension_names &&char
	p_enabled_features         &PhysicalDeviceFeatures
}

pub struct ExtensionProperties {
pub mut:
	extension_name [max_extension_name_size]char
	spec_version   u32
}

pub struct LayerProperties {
pub mut:
	layer_name             [max_extension_name_size]char
	spec_version           u32
	implementation_version u32
	description            [max_description_size]char
}

pub struct SubmitInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_submit_info
	p_next                 voidptr
	wait_semaphore_count   u32
	p_wait_semaphores      &C.Semaphore
	p_wait_dst_stage_mask  &PipelineStageFlags
	command_buffer_count   u32
	p_command_buffers      &C.CommandBuffer
	signal_semaphore_count u32
	p_signal_semaphores    &C.Semaphore
}

pub struct MappedMemoryRange {
pub mut:
	s_type StructureType = StructureType.structure_type_mapped_memory_range
	p_next voidptr
	memory C.DeviceMemory
	offset DeviceSize
	size   DeviceSize
}

pub struct MemoryAllocateInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_memory_allocate_info
	p_next            voidptr
	allocation_size   DeviceSize
	memory_type_index u32
}

pub struct MemoryRequirements {
pub mut:
	size             DeviceSize
	alignment        DeviceSize
	memory_type_bits u32
}

pub struct SparseMemoryBind {
pub mut:
	resource_offset DeviceSize
	size            DeviceSize
	memory          C.DeviceMemory
	memory_offset   DeviceSize
	flags           SparseMemoryBindFlags
}

pub struct SparseBufferMemoryBindInfo {
pub mut:
	buffer     C.Buffer
	bind_count u32
	p_binds    &SparseMemoryBind
}

pub struct SparseImageOpaqueMemoryBindInfo {
pub mut:
	image      C.Image
	bind_count u32
	p_binds    &SparseMemoryBind
}

pub struct ImageSubresource {
pub mut:
	aspect_mask ImageAspectFlags
	mip_level   u32
	array_layer u32
}

pub struct SparseImageMemoryBind {
pub mut:
	subresource   ImageSubresource
	offset        Offset3D
	extent        Extent3D
	memory        C.DeviceMemory
	memory_offset DeviceSize
	flags         SparseMemoryBindFlags
}

pub struct SparseImageMemoryBindInfo {
pub mut:
	image      C.Image
	bind_count u32
	p_binds    &SparseImageMemoryBind
}

pub struct BindSparseInfo {
pub mut:
	s_type                  StructureType = StructureType.structure_type_bind_sparse_info
	p_next                  voidptr
	wait_semaphore_count    u32
	p_wait_semaphores       &C.Semaphore
	buffer_bind_count       u32
	p_buffer_binds          &SparseBufferMemoryBindInfo
	image_opaque_bind_count u32
	p_image_opaque_binds    &SparseImageOpaqueMemoryBindInfo
	image_bind_count        u32
	p_image_binds           &SparseImageMemoryBindInfo
	signal_semaphore_count  u32
	p_signal_semaphores     &C.Semaphore
}

pub struct SparseImageFormatProperties {
pub mut:
	aspect_mask       ImageAspectFlags
	image_granularity Extent3D
	flags             SparseImageFormatFlags
}

pub struct SparseImageMemoryRequirements {
pub mut:
	format_properties        SparseImageFormatProperties
	image_mip_tail_first_lod u32
	image_mip_tail_size      DeviceSize
	image_mip_tail_offset    DeviceSize
	image_mip_tail_stride    DeviceSize
}

pub struct FenceCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_fence_create_info
	p_next voidptr
	flags  FenceCreateFlags
}

pub struct SemaphoreCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_semaphore_create_info
	p_next voidptr
	flags  SemaphoreCreateFlags
}

pub struct EventCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_event_create_info
	p_next voidptr
	flags  EventCreateFlags
}

pub struct QueryPoolCreateInfo {
pub mut:
	s_type              StructureType = StructureType.structure_type_query_pool_create_info
	p_next              voidptr
	flags               QueryPoolCreateFlags
	query_type          QueryType
	query_count         u32
	pipeline_statistics QueryPipelineStatisticFlags
}

pub struct BufferCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_buffer_create_info
	p_next                   voidptr
	flags                    BufferCreateFlags
	size                     DeviceSize
	usage                    BufferUsageFlags
	sharing_mode             SharingMode
	queue_family_index_count u32
	p_queue_family_indices   &u32
}

pub struct BufferViewCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_buffer_view_create_info
	p_next voidptr
	flags  BufferViewCreateFlags
	buffer C.Buffer
	format Format
	offset DeviceSize
	range  DeviceSize
}

pub struct ImageCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_image_create_info
	p_next                   voidptr
	flags                    ImageCreateFlags
	image_type               ImageType
	format                   Format
	extent                   Extent3D
	mip_levels               u32
	array_layers             u32
	samples                  SampleCountFlagBits
	tiling                   ImageTiling
	usage                    ImageUsageFlags
	sharing_mode             SharingMode
	queue_family_index_count u32
	p_queue_family_indices   &u32
	initial_layout           ImageLayout
}

pub struct SubresourceLayout {
pub mut:
	offset      DeviceSize
	size        DeviceSize
	row_pitch   DeviceSize
	array_pitch DeviceSize
	depth_pitch DeviceSize
}

pub struct ComponentMapping {
pub mut:
	r ComponentSwizzle
	g ComponentSwizzle
	b ComponentSwizzle
	a ComponentSwizzle
}

pub struct ImageViewCreateInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_image_view_create_info
	p_next            voidptr
	flags             ImageViewCreateFlags
	image             C.Image
	view_type         ImageViewType
	format            Format
	components        ComponentMapping
	subresource_range ImageSubresourceRange
}

pub struct ShaderModuleCreateInfo {
pub mut:
	s_type    StructureType = StructureType.structure_type_shader_module_create_info
	p_next    voidptr
	flags     ShaderModuleCreateFlags
	code_size usize
	p_code    &u32
}

pub struct PipelineCacheCreateInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_pipeline_cache_create_info
	p_next            voidptr
	flags             PipelineCacheCreateFlags
	initial_data_size usize
	p_initial_data    voidptr
}

pub struct SpecializationMapEntry {
pub mut:
	constant_id u32
	offset      u32
	size        usize
}

pub struct SpecializationInfo {
pub mut:
	map_entry_count u32
	p_map_entries   &SpecializationMapEntry
	data_size       usize
	p_data          voidptr
}

pub struct PipelineShaderStageCreateInfo {
pub mut:
	s_type                StructureType = StructureType.structure_type_pipeline_shader_stage_create_info
	p_next                voidptr
	flags                 PipelineShaderStageCreateFlags
	stage                 ShaderStageFlagBits
	vkmodule              C.ShaderModule
	p_name                &char
	p_specialization_info &SpecializationInfo
}

pub struct ComputePipelineCreateInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_compute_pipeline_create_info
	p_next               voidptr
	flags                PipelineCreateFlags
	stage                PipelineShaderStageCreateInfo
	layout               C.PipelineLayout
	base_pipeline_handle C.Pipeline
	base_pipeline_index  i32
}

pub struct VertexInputBindingDescription {
pub mut:
	binding    u32
	stride     u32
	input_rate VertexInputRate
}

pub struct VertexInputAttributeDescription {
pub mut:
	location u32
	binding  u32
	format   Format
	offset   u32
}

pub struct PipelineVertexInputStateCreateInfo {
pub mut:
	s_type                             StructureType = StructureType.structure_type_pipeline_vertex_input_state_create_info
	p_next                             voidptr
	flags                              PipelineVertexInputStateCreateFlags
	vertex_binding_description_count   u32
	p_vertex_binding_descriptions      &VertexInputBindingDescription
	vertex_attribute_description_count u32
	p_vertex_attribute_descriptions    &VertexInputAttributeDescription
}

pub struct PipelineInputAssemblyStateCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_pipeline_input_assembly_state_create_info
	p_next                   voidptr
	flags                    PipelineInputAssemblyStateCreateFlags
	topology                 PrimitiveTopology
	primitive_restart_enable Bool32
}

pub struct PipelineTessellationStateCreateInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_pipeline_tessellation_state_create_info
	p_next               voidptr
	flags                PipelineTessellationStateCreateFlags
	patch_control_points u32
}

pub struct Viewport {
pub mut:
	x         f32
	y         f32
	width     f32
	height    f32
	min_depth f32
	max_depth f32
}

pub struct PipelineViewportStateCreateInfo {
pub mut:
	s_type         StructureType = StructureType.structure_type_pipeline_viewport_state_create_info
	p_next         voidptr
	flags          PipelineViewportStateCreateFlags
	viewport_count u32
	p_viewports    &Viewport
	scissor_count  u32
	p_scissors     &Rect2D
}

pub struct PipelineRasterizationStateCreateInfo {
pub mut:
	s_type                     StructureType = StructureType.structure_type_pipeline_rasterization_state_create_info
	p_next                     voidptr
	flags                      PipelineRasterizationStateCreateFlags
	depth_clamp_enable         Bool32
	rasterizer_discard_enable  Bool32
	polygon_mode               PolygonMode
	cull_mode                  CullModeFlags
	front_face                 FrontFace
	depth_bias_enable          Bool32
	depth_bias_constant_factor f32
	depth_bias_clamp           f32
	depth_bias_slope_factor    f32
	line_width                 f32
}

pub struct PipelineMultisampleStateCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_pipeline_multisample_state_create_info
	p_next                   voidptr
	flags                    PipelineMultisampleStateCreateFlags
	rasterization_samples    SampleCountFlagBits
	sample_shading_enable    Bool32
	min_sample_shading       f32
	p_sample_mask            &SampleMask
	alpha_to_coverage_enable Bool32
	alpha_to_one_enable      Bool32
}

pub struct StencilOpState {
pub mut:
	fail_op       StencilOp
	pass_op       StencilOp
	depth_fail_op StencilOp
	compare_op    CompareOp
	compare_mask  u32
	write_mask    u32
	reference     u32
}

pub struct PipelineDepthStencilStateCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_pipeline_depth_stencil_state_create_info
	p_next                   voidptr
	flags                    PipelineDepthStencilStateCreateFlags
	depth_test_enable        Bool32
	depth_write_enable       Bool32
	depth_compare_op         CompareOp
	depth_bounds_test_enable Bool32
	stencil_test_enable      Bool32
	front                    StencilOpState
	back                     StencilOpState
	min_depth_bounds         f32
	max_depth_bounds         f32
}

pub struct PipelineColorBlendAttachmentState {
pub mut:
	blend_enable           Bool32
	src_color_blend_factor BlendFactor
	dst_color_blend_factor BlendFactor
	color_blend_op         BlendOp
	src_alpha_blend_factor BlendFactor
	dst_alpha_blend_factor BlendFactor
	alpha_blend_op         BlendOp
	color_write_mask       ColorComponentFlags
}

pub struct PipelineColorBlendStateCreateInfo {
pub mut:
	s_type           StructureType = StructureType.structure_type_pipeline_color_blend_state_create_info
	p_next           voidptr
	flags            PipelineColorBlendStateCreateFlags
	logic_op_enable  Bool32
	logic_op         LogicOp
	attachment_count u32
	p_attachments    &PipelineColorBlendAttachmentState
	blend_constants  [4]f32
}

pub struct PipelineDynamicStateCreateInfo {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_dynamic_state_create_info
	p_next              voidptr
	flags               PipelineDynamicStateCreateFlags
	dynamic_state_count u32
	p_dynamic_states    &DynamicState
}

pub struct GraphicsPipelineCreateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_graphics_pipeline_create_info
	p_next                 voidptr
	flags                  PipelineCreateFlags
	stage_count            u32
	p_stages               &PipelineShaderStageCreateInfo
	p_vertex_input_state   &PipelineVertexInputStateCreateInfo
	p_input_assembly_state &PipelineInputAssemblyStateCreateInfo
	p_tessellation_state   &PipelineTessellationStateCreateInfo
	p_viewport_state       &PipelineViewportStateCreateInfo
	p_rasterization_state  &PipelineRasterizationStateCreateInfo
	p_multisample_state    &PipelineMultisampleStateCreateInfo
	p_depth_stencil_state  &PipelineDepthStencilStateCreateInfo
	p_color_blend_state    &PipelineColorBlendStateCreateInfo
	p_dynamic_state        &PipelineDynamicStateCreateInfo
	layout                 C.PipelineLayout
	render_pass            C.RenderPass
	subpass                u32
	base_pipeline_handle   C.Pipeline
	base_pipeline_index    i32
}

pub struct PushConstantRange {
pub mut:
	stage_flags ShaderStageFlags
	offset      u32
	size        u32
}

pub struct PipelineLayoutCreateInfo {
pub mut:
	s_type                    StructureType = StructureType.structure_type_pipeline_layout_create_info
	p_next                    voidptr
	flags                     PipelineLayoutCreateFlags
	set_layout_count          u32
	p_set_layouts             &C.DescriptorSetLayout
	push_constant_range_count u32
	p_push_constant_ranges    &PushConstantRange
}

pub struct SamplerCreateInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_sampler_create_info
	p_next                   voidptr
	flags                    SamplerCreateFlags
	mag_filter               Filter
	min_filter               Filter
	mipmap_mode              SamplerMipmapMode
	address_mode_u           SamplerAddressMode
	address_mode_v           SamplerAddressMode
	address_mode_w           SamplerAddressMode
	mip_lod_bias             f32
	anisotropy_enable        Bool32
	max_anisotropy           f32
	compare_enable           Bool32
	compare_op               CompareOp
	min_lod                  f32
	max_lod                  f32
	border_color             BorderColor
	unnormalized_coordinates Bool32
}

pub struct CopyDescriptorSet {
pub mut:
	s_type            StructureType = StructureType.structure_type_copy_descriptor_set
	p_next            voidptr
	src_set           C.DescriptorSet
	src_binding       u32
	src_array_element u32
	dst_set           C.DescriptorSet
	dst_binding       u32
	dst_array_element u32
	descriptor_count  u32
}

pub struct DescriptorBufferInfo {
pub mut:
	buffer C.Buffer
	offset DeviceSize
	range  DeviceSize
}

pub struct DescriptorImageInfo {
pub mut:
	sampler      C.Sampler
	image_view   C.ImageView
	image_layout ImageLayout
}

pub struct DescriptorPoolSize {
pub mut:
	vktype           DescriptorType
	descriptor_count u32
}

pub struct DescriptorPoolCreateInfo {
pub mut:
	s_type          StructureType = StructureType.structure_type_descriptor_pool_create_info
	p_next          voidptr
	flags           DescriptorPoolCreateFlags
	max_sets        u32
	pool_size_count u32
	p_pool_sizes    &DescriptorPoolSize
}

pub struct DescriptorSetAllocateInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_descriptor_set_allocate_info
	p_next               voidptr
	descriptor_pool      C.DescriptorPool
	descriptor_set_count u32
	p_set_layouts        &C.DescriptorSetLayout
}

pub struct DescriptorSetLayoutBinding {
pub mut:
	binding              u32
	descriptor_type      DescriptorType
	descriptor_count     u32
	stage_flags          ShaderStageFlags
	p_immutable_samplers &C.Sampler
}

pub struct DescriptorSetLayoutCreateInfo {
pub mut:
	s_type        StructureType = StructureType.structure_type_descriptor_set_layout_create_info
	p_next        voidptr
	flags         DescriptorSetLayoutCreateFlags
	binding_count u32
	p_bindings    &DescriptorSetLayoutBinding
}

pub struct WriteDescriptorSet {
pub mut:
	s_type              StructureType = StructureType.structure_type_write_descriptor_set
	p_next              voidptr
	dst_set             C.DescriptorSet
	dst_binding         u32
	dst_array_element   u32
	descriptor_count    u32
	descriptor_type     DescriptorType
	p_image_info        &DescriptorImageInfo
	p_buffer_info       &DescriptorBufferInfo
	p_texel_buffer_view &C.BufferView
}

pub struct AttachmentDescription {
pub mut:
	flags            AttachmentDescriptionFlags
	format           Format
	samples          SampleCountFlagBits
	load_op          AttachmentLoadOp
	store_op         AttachmentStoreOp
	stencil_load_op  AttachmentLoadOp
	stencil_store_op AttachmentStoreOp
	initial_layout   ImageLayout
	final_layout     ImageLayout
}

pub struct AttachmentReference {
pub mut:
	attachment u32
	layout     ImageLayout
}

pub struct FramebufferCreateInfo {
pub mut:
	s_type           StructureType = StructureType.structure_type_framebuffer_create_info
	p_next           voidptr
	flags            FramebufferCreateFlags
	render_pass      C.RenderPass
	attachment_count u32
	p_attachments    &C.ImageView
	width            u32
	height           u32
	layers           u32
}

pub struct SubpassDescription {
pub mut:
	flags                      SubpassDescriptionFlags
	pipeline_bind_point        PipelineBindPoint
	input_attachment_count     u32
	p_input_attachments        &AttachmentReference
	color_attachment_count     u32
	p_color_attachments        &AttachmentReference
	p_resolve_attachments      &AttachmentReference
	p_depth_stencil_attachment &AttachmentReference
	preserve_attachment_count  u32
	p_preserve_attachments     &u32
}

pub struct SubpassDependency {
pub mut:
	src_subpass      u32
	dst_subpass      u32
	src_stage_mask   PipelineStageFlags
	dst_stage_mask   PipelineStageFlags
	src_access_mask  AccessFlags
	dst_access_mask  AccessFlags
	dependency_flags DependencyFlags
}

pub struct RenderPassCreateInfo {
pub mut:
	s_type           StructureType = StructureType.structure_type_render_pass_create_info
	p_next           voidptr
	flags            RenderPassCreateFlags
	attachment_count u32
	p_attachments    &AttachmentDescription
	subpass_count    u32
	p_subpasses      &SubpassDescription
	dependency_count u32
	p_dependencies   &SubpassDependency
}

pub struct CommandPoolCreateInfo {
pub mut:
	s_type             StructureType = StructureType.structure_type_command_pool_create_info
	p_next             voidptr
	flags              CommandPoolCreateFlags
	queue_family_index u32
}

pub struct CommandBufferAllocateInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_command_buffer_allocate_info
	p_next               voidptr
	command_pool         C.CommandPool
	level                CommandBufferLevel
	command_buffer_count u32
}

pub struct CommandBufferInheritanceInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_command_buffer_inheritance_info
	p_next                 voidptr
	render_pass            C.RenderPass
	subpass                u32
	framebuffer            C.Framebuffer
	occlusion_query_enable Bool32
	query_flags            QueryControlFlags
	pipeline_statistics    QueryPipelineStatisticFlags
}

pub struct CommandBufferBeginInfo {
pub mut:
	s_type             StructureType = StructureType.structure_type_command_buffer_begin_info
	p_next             voidptr
	flags              CommandBufferUsageFlags
	p_inheritance_info &CommandBufferInheritanceInfo
}

pub struct BufferCopy {
pub mut:
	src_offset DeviceSize
	dst_offset DeviceSize
	size       DeviceSize
}

pub struct ImageSubresourceLayers {
pub mut:
	aspect_mask      ImageAspectFlags
	mip_level        u32
	base_array_layer u32
	layer_count      u32
}

pub struct BufferImageCopy {
pub mut:
	buffer_offset       DeviceSize
	buffer_row_length   u32
	buffer_image_height u32
	image_subresource   ImageSubresourceLayers
	image_offset        Offset3D
	image_extent        Extent3D
}

pub union ClearColorValue {
pub mut:
	float32 [4]f32
	int32   [4]i32
	uint32  [4]u32
}

pub struct ClearDepthStencilValue {
pub mut:
	depth   f32
	stencil u32
}

pub union ClearValue {
pub mut:
	color         ClearColorValue
	depth_stencil ClearDepthStencilValue
}

pub struct ClearAttachment {
pub mut:
	aspect_mask      ImageAspectFlags
	color_attachment u32
	clear_value      ClearValue
}

pub struct ClearRect {
pub mut:
	rect             Rect2D
	base_array_layer u32
	layer_count      u32
}

pub struct ImageBlit {
pub mut:
	src_subresource ImageSubresourceLayers
	src_offsets     [2]Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offsets     [2]Offset3D
}

pub struct ImageCopy {
pub mut:
	src_subresource ImageSubresourceLayers
	src_offset      Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offset      Offset3D
	extent          Extent3D
}

pub struct ImageResolve {
pub mut:
	src_subresource ImageSubresourceLayers
	src_offset      Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offset      Offset3D
	extent          Extent3D
}

pub struct RenderPassBeginInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_render_pass_begin_info
	p_next            voidptr
	render_pass       C.RenderPass
	framebuffer       C.Framebuffer
	render_area       Rect2D
	clear_value_count u32
	p_clear_values    &ClearValue
}

fn C.vkCreateInstance(&InstanceCreateInfo,
	&AllocationCallbacks,
	&C.Instance) Result
pub fn create_instance(p_create_info &InstanceCreateInfo,
	p_allocator &AllocationCallbacks,
	p_instance &C.Instance) Result {
	return C.vkCreateInstance(p_create_info, p_allocator, p_instance)
}

fn C.vkDestroyInstance(C.Instance,
	&AllocationCallbacks)
pub fn destroy_instance(instance C.Instance,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyInstance(instance, p_allocator)
}

fn C.vkEnumeratePhysicalDevices(C.Instance,
	&u32,
	&C.PhysicalDevice) Result
pub fn enumerate_physical_devices(instance C.Instance,
	p_physical_device_count &u32,
	p_physical_devices &C.PhysicalDevice) Result {
	return C.vkEnumeratePhysicalDevices(instance, p_physical_device_count, p_physical_devices)
}

fn C.vkGetPhysicalDeviceFeatures(C.PhysicalDevice,
	&PhysicalDeviceFeatures)
pub fn get_physical_device_features(physical_device C.PhysicalDevice,
	p_features &PhysicalDeviceFeatures) {
	C.vkGetPhysicalDeviceFeatures(physical_device, p_features)
}

fn C.vkGetPhysicalDeviceFormatProperties(C.PhysicalDevice,
	Format,
	&FormatProperties)
pub fn get_physical_device_format_properties(physical_device C.PhysicalDevice,
	format Format,
	p_format_properties &FormatProperties) {
	C.vkGetPhysicalDeviceFormatProperties(physical_device, format, p_format_properties)
}

fn C.vkGetPhysicalDeviceImageFormatProperties(C.PhysicalDevice,
	Format,
	ImageType,
	ImageTiling,
	ImageUsageFlags,
	ImageCreateFlags,
	&ImageFormatProperties) Result
pub fn get_physical_device_image_format_properties(physical_device C.PhysicalDevice,
	format Format,
	vktype ImageType,
	tiling ImageTiling,
	usage ImageUsageFlags,
	flags ImageCreateFlags,
	p_image_format_properties &ImageFormatProperties) Result {
	return C.vkGetPhysicalDeviceImageFormatProperties(physical_device, format, vktype,
		tiling, usage, flags, p_image_format_properties)
}

fn C.vkGetPhysicalDeviceProperties(C.PhysicalDevice,
	&PhysicalDeviceProperties)
pub fn get_physical_device_properties(physical_device C.PhysicalDevice,
	p_properties &PhysicalDeviceProperties) {
	C.vkGetPhysicalDeviceProperties(physical_device, p_properties)
}

fn C.vkGetPhysicalDeviceQueueFamilyProperties(C.PhysicalDevice,
	&u32,
	&QueueFamilyProperties)
pub fn get_physical_device_queue_family_properties(physical_device C.PhysicalDevice,
	p_queue_family_property_count &u32,
	p_queue_family_properties &QueueFamilyProperties) {
	C.vkGetPhysicalDeviceQueueFamilyProperties(physical_device, p_queue_family_property_count,
		p_queue_family_properties)
}

fn C.vkGetPhysicalDeviceMemoryProperties(C.PhysicalDevice,
	&PhysicalDeviceMemoryProperties)
pub fn get_physical_device_memory_properties(physical_device C.PhysicalDevice,
	p_memory_properties &PhysicalDeviceMemoryProperties) {
	C.vkGetPhysicalDeviceMemoryProperties(physical_device, p_memory_properties)
}

fn C.vkGetInstanceProcAddr(C.Instance,
	&char) PFN_vkVoidFunction
pub fn get_instance_proc_addr(instance C.Instance,
	p_name &char) PFN_vkVoidFunction {
	return C.vkGetInstanceProcAddr(instance, p_name)
}

fn C.vkGetDeviceProcAddr(C.Device,
	&char) PFN_vkVoidFunction
pub fn get_device_proc_addr(device C.Device,
	p_name &char) PFN_vkVoidFunction {
	return C.vkGetDeviceProcAddr(device, p_name)
}

fn C.vkCreateDevice(C.PhysicalDevice,
	&DeviceCreateInfo,
	&AllocationCallbacks,
	&C.Device) Result
pub fn create_device(physical_device C.PhysicalDevice,
	p_create_info &DeviceCreateInfo,
	p_allocator &AllocationCallbacks,
	p_device &C.Device) Result {
	return C.vkCreateDevice(physical_device, p_create_info, p_allocator, p_device)
}

fn C.vkDestroyDevice(C.Device,
	&AllocationCallbacks)
pub fn destroy_device(device C.Device,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDevice(device, p_allocator)
}

fn C.vkEnumerateInstanceExtensionProperties(&char,
	&u32,
	&ExtensionProperties) Result
pub fn enumerate_instance_extension_properties(p_layer_name &char,
	p_property_count &u32,
	p_properties &ExtensionProperties) Result {
	return C.vkEnumerateInstanceExtensionProperties(p_layer_name, p_property_count, p_properties)
}

fn C.vkEnumerateDeviceExtensionProperties(C.PhysicalDevice,
	&char,
	&u32,
	&ExtensionProperties) Result
pub fn enumerate_device_extension_properties(physical_device C.PhysicalDevice,
	p_layer_name &char,
	p_property_count &u32,
	p_properties &ExtensionProperties) Result {
	return C.vkEnumerateDeviceExtensionProperties(physical_device, p_layer_name, p_property_count,
		p_properties)
}

fn C.vkEnumerateInstanceLayerProperties(&u32,
	&LayerProperties) Result
pub fn enumerate_instance_layer_properties(p_property_count &u32,
	p_properties &LayerProperties) Result {
	return C.vkEnumerateInstanceLayerProperties(p_property_count, p_properties)
}

fn C.vkEnumerateDeviceLayerProperties(C.PhysicalDevice,
	&u32,
	&LayerProperties) Result
pub fn enumerate_device_layer_properties(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &LayerProperties) Result {
	return C.vkEnumerateDeviceLayerProperties(physical_device, p_property_count, p_properties)
}

fn C.vkGetDeviceQueue(C.Device,
	u32,
	u32,
	&C.Queue)
pub fn get_device_queue(device C.Device,
	queue_family_index u32,
	queue_index u32,
	p_queue &C.Queue) {
	C.vkGetDeviceQueue(device, queue_family_index, queue_index, p_queue)
}

fn C.vkQueueSubmit(C.Queue,
	u32,
	&SubmitInfo,
	C.Fence) Result
pub fn queue_submit(queue C.Queue,
	submit_count u32,
	p_submits &SubmitInfo,
	fence C.Fence) Result {
	return C.vkQueueSubmit(queue, submit_count, p_submits, fence)
}

fn C.vkQueueWaitIdle(C.Queue) Result
pub fn queue_wait_idle(queue C.Queue) Result {
	return C.vkQueueWaitIdle(queue)
}

fn C.vkDeviceWaitIdle(C.Device) Result
pub fn device_wait_idle(device C.Device) Result {
	return C.vkDeviceWaitIdle(device)
}

fn C.vkAllocateMemory(C.Device,
	&MemoryAllocateInfo,
	&AllocationCallbacks,
	&C.DeviceMemory) Result
pub fn allocate_memory(device C.Device,
	p_allocate_info &MemoryAllocateInfo,
	p_allocator &AllocationCallbacks,
	p_memory &C.DeviceMemory) Result {
	return C.vkAllocateMemory(device, p_allocate_info, p_allocator, p_memory)
}

fn C.vkFreeMemory(C.Device,
	C.DeviceMemory,
	&AllocationCallbacks)
pub fn free_memory(device C.Device,
	memory C.DeviceMemory,
	p_allocator &AllocationCallbacks) {
	C.vkFreeMemory(device, memory, p_allocator)
}

fn C.vkMapMemory(C.Device,
	C.DeviceMemory,
	DeviceSize,
	DeviceSize,
	MemoryMapFlags,
	&voidptr) Result
pub fn map_memory(device C.Device,
	memory C.DeviceMemory,
	offset DeviceSize,
	size DeviceSize,
	flags MemoryMapFlags,
	pp_data &voidptr) Result {
	return C.vkMapMemory(device, memory, offset, size, flags, pp_data)
}

fn C.vkUnmapMemory(C.Device,
	C.DeviceMemory)
pub fn unmap_memory(device C.Device,
	memory C.DeviceMemory) {
	C.vkUnmapMemory(device, memory)
}

fn C.vkFlushMappedMemoryRanges(C.Device,
	u32,
	&MappedMemoryRange) Result
pub fn flush_mapped_memory_ranges(device C.Device,
	memory_range_count u32,
	p_memory_ranges &MappedMemoryRange) Result {
	return C.vkFlushMappedMemoryRanges(device, memory_range_count, p_memory_ranges)
}

fn C.vkInvalidateMappedMemoryRanges(C.Device,
	u32,
	&MappedMemoryRange) Result
pub fn invalidate_mapped_memory_ranges(device C.Device,
	memory_range_count u32,
	p_memory_ranges &MappedMemoryRange) Result {
	return C.vkInvalidateMappedMemoryRanges(device, memory_range_count, p_memory_ranges)
}

fn C.vkGetDeviceMemoryCommitment(C.Device,
	C.DeviceMemory,
	&DeviceSize)
pub fn get_device_memory_commitment(device C.Device,
	memory C.DeviceMemory,
	p_committed_memory_in_bytes &DeviceSize) {
	C.vkGetDeviceMemoryCommitment(device, memory, p_committed_memory_in_bytes)
}

fn C.vkBindBufferMemory(C.Device,
	C.Buffer,
	C.DeviceMemory,
	DeviceSize) Result
pub fn bind_buffer_memory(device C.Device,
	buffer C.Buffer,
	memory C.DeviceMemory,
	memory_offset DeviceSize) Result {
	return C.vkBindBufferMemory(device, buffer, memory, memory_offset)
}

fn C.vkBindImageMemory(C.Device,
	C.Image,
	C.DeviceMemory,
	DeviceSize) Result
pub fn bind_image_memory(device C.Device,
	image C.Image,
	memory C.DeviceMemory,
	memory_offset DeviceSize) Result {
	return C.vkBindImageMemory(device, image, memory, memory_offset)
}

fn C.vkGetBufferMemoryRequirements(C.Device,
	C.Buffer,
	&MemoryRequirements)
pub fn get_buffer_memory_requirements(device C.Device,
	buffer C.Buffer,
	p_memory_requirements &MemoryRequirements) {
	C.vkGetBufferMemoryRequirements(device, buffer, p_memory_requirements)
}

fn C.vkGetImageMemoryRequirements(C.Device,
	C.Image,
	&MemoryRequirements)
pub fn get_image_memory_requirements(device C.Device,
	image C.Image,
	p_memory_requirements &MemoryRequirements) {
	C.vkGetImageMemoryRequirements(device, image, p_memory_requirements)
}

fn C.vkGetImageSparseMemoryRequirements(C.Device,
	C.Image,
	&u32,
	&SparseImageMemoryRequirements)
pub fn get_image_sparse_memory_requirements(device C.Device,
	image C.Image,
	p_sparse_memory_requirement_count &u32,
	p_sparse_memory_requirements &SparseImageMemoryRequirements) {
	C.vkGetImageSparseMemoryRequirements(device, image, p_sparse_memory_requirement_count,
		p_sparse_memory_requirements)
}

fn C.vkGetPhysicalDeviceSparseImageFormatProperties(C.PhysicalDevice,
	Format,
	ImageType,
	SampleCountFlagBits,
	ImageUsageFlags,
	ImageTiling,
	&u32,
	&SparseImageFormatProperties)
pub fn get_physical_device_sparse_image_format_properties(physical_device C.PhysicalDevice,
	format Format,
	vktype ImageType,
	samples SampleCountFlagBits,
	usage ImageUsageFlags,
	tiling ImageTiling,
	p_property_count &u32,
	p_properties &SparseImageFormatProperties) {
	C.vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, vktype,
		samples, usage, tiling, p_property_count, p_properties)
}

fn C.vkQueueBindSparse(C.Queue,
	u32,
	&BindSparseInfo,
	C.Fence) Result
pub fn queue_bind_sparse(queue C.Queue,
	bind_info_count u32,
	p_bind_info &BindSparseInfo,
	fence C.Fence) Result {
	return C.vkQueueBindSparse(queue, bind_info_count, p_bind_info, fence)
}

fn C.vkCreateFence(C.Device,
	&FenceCreateInfo,
	&AllocationCallbacks,
	&C.Fence) Result
pub fn create_fence(device C.Device,
	p_create_info &FenceCreateInfo,
	p_allocator &AllocationCallbacks,
	p_fence &C.Fence) Result {
	return C.vkCreateFence(device, p_create_info, p_allocator, p_fence)
}

fn C.vkDestroyFence(C.Device,
	C.Fence,
	&AllocationCallbacks)
pub fn destroy_fence(device C.Device,
	fence C.Fence,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyFence(device, fence, p_allocator)
}

fn C.vkResetFences(C.Device,
	u32,
	&C.Fence) Result
pub fn reset_fences(device C.Device,
	fence_count u32,
	p_fences &C.Fence) Result {
	return C.vkResetFences(device, fence_count, p_fences)
}

fn C.vkGetFenceStatus(C.Device,
	C.Fence) Result
pub fn get_fence_status(device C.Device,
	fence C.Fence) Result {
	return C.vkGetFenceStatus(device, fence)
}

fn C.vkWaitForFences(C.Device,
	u32,
	&C.Fence,
	Bool32,
	u64) Result
pub fn wait_for_fences(device C.Device,
	fence_count u32,
	p_fences &C.Fence,
	wait_all Bool32,
	timeout u64) Result {
	return C.vkWaitForFences(device, fence_count, p_fences, wait_all, timeout)
}

fn C.vkCreateSemaphore(C.Device,
	&SemaphoreCreateInfo,
	&AllocationCallbacks,
	&C.Semaphore) Result
pub fn create_semaphore(device C.Device,
	p_create_info &SemaphoreCreateInfo,
	p_allocator &AllocationCallbacks,
	p_semaphore &C.Semaphore) Result {
	return C.vkCreateSemaphore(device, p_create_info, p_allocator, p_semaphore)
}

fn C.vkDestroySemaphore(C.Device,
	C.Semaphore,
	&AllocationCallbacks)
pub fn destroy_semaphore(device C.Device,
	semaphore C.Semaphore,
	p_allocator &AllocationCallbacks) {
	C.vkDestroySemaphore(device, semaphore, p_allocator)
}

fn C.vkCreateEvent(C.Device,
	&EventCreateInfo,
	&AllocationCallbacks,
	&C.Event) Result
pub fn create_event(device C.Device,
	p_create_info &EventCreateInfo,
	p_allocator &AllocationCallbacks,
	p_event &C.Event) Result {
	return C.vkCreateEvent(device, p_create_info, p_allocator, p_event)
}

fn C.vkDestroyEvent(C.Device,
	C.Event,
	&AllocationCallbacks)
pub fn destroy_event(device C.Device,
	event C.Event,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyEvent(device, event, p_allocator)
}

fn C.vkGetEventStatus(C.Device,
	C.Event) Result
pub fn get_event_status(device C.Device,
	event C.Event) Result {
	return C.vkGetEventStatus(device, event)
}

fn C.vkSetEvent(C.Device,
	C.Event) Result
pub fn set_event(device C.Device,
	event C.Event) Result {
	return C.vkSetEvent(device, event)
}

fn C.vkResetEvent(C.Device,
	C.Event) Result
pub fn reset_event(device C.Device,
	event C.Event) Result {
	return C.vkResetEvent(device, event)
}

fn C.vkCreateQueryPool(C.Device,
	&QueryPoolCreateInfo,
	&AllocationCallbacks,
	&C.QueryPool) Result
pub fn create_query_pool(device C.Device,
	p_create_info &QueryPoolCreateInfo,
	p_allocator &AllocationCallbacks,
	p_query_pool &C.QueryPool) Result {
	return C.vkCreateQueryPool(device, p_create_info, p_allocator, p_query_pool)
}

fn C.vkDestroyQueryPool(C.Device,
	C.QueryPool,
	&AllocationCallbacks)
pub fn destroy_query_pool(device C.Device,
	query_pool C.QueryPool,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyQueryPool(device, query_pool, p_allocator)
}

fn C.vkGetQueryPoolResults(C.Device,
	C.QueryPool,
	u32,
	u32,
	usize,
	voidptr,
	DeviceSize,
	QueryResultFlags) Result
pub fn get_query_pool_results(device C.Device,
	query_pool C.QueryPool,
	first_query u32,
	query_count u32,
	data_size usize,
	p_data voidptr,
	stride DeviceSize,
	flags QueryResultFlags) Result {
	return C.vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size,
		p_data, stride, flags)
}

fn C.vkCreateBuffer(C.Device,
	&BufferCreateInfo,
	&AllocationCallbacks,
	&C.Buffer) Result
pub fn create_buffer(device C.Device,
	p_create_info &BufferCreateInfo,
	p_allocator &AllocationCallbacks,
	p_buffer &C.Buffer) Result {
	return C.vkCreateBuffer(device, p_create_info, p_allocator, p_buffer)
}

fn C.vkDestroyBuffer(C.Device,
	C.Buffer,
	&AllocationCallbacks)
pub fn destroy_buffer(device C.Device,
	buffer C.Buffer,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyBuffer(device, buffer, p_allocator)
}

fn C.vkCreateBufferView(C.Device,
	&BufferViewCreateInfo,
	&AllocationCallbacks,
	&C.BufferView) Result
pub fn create_buffer_view(device C.Device,
	p_create_info &BufferViewCreateInfo,
	p_allocator &AllocationCallbacks,
	p_view &C.BufferView) Result {
	return C.vkCreateBufferView(device, p_create_info, p_allocator, p_view)
}

fn C.vkDestroyBufferView(C.Device,
	C.BufferView,
	&AllocationCallbacks)
pub fn destroy_buffer_view(device C.Device,
	buffer_view C.BufferView,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyBufferView(device, buffer_view, p_allocator)
}

fn C.vkCreateImage(C.Device,
	&ImageCreateInfo,
	&AllocationCallbacks,
	&C.Image) Result
pub fn create_image(device C.Device,
	p_create_info &ImageCreateInfo,
	p_allocator &AllocationCallbacks,
	p_image &C.Image) Result {
	return C.vkCreateImage(device, p_create_info, p_allocator, p_image)
}

fn C.vkDestroyImage(C.Device,
	C.Image,
	&AllocationCallbacks)
pub fn destroy_image(device C.Device,
	image C.Image,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyImage(device, image, p_allocator)
}

fn C.vkGetImageSubresourceLayout(C.Device,
	C.Image,
	&ImageSubresource,
	&SubresourceLayout)
pub fn get_image_subresource_layout(device C.Device,
	image C.Image,
	p_subresource &ImageSubresource,
	p_layout &SubresourceLayout) {
	C.vkGetImageSubresourceLayout(device, image, p_subresource, p_layout)
}

fn C.vkCreateImageView(C.Device,
	&ImageViewCreateInfo,
	&AllocationCallbacks,
	&C.ImageView) Result
pub fn create_image_view(device C.Device,
	p_create_info &ImageViewCreateInfo,
	p_allocator &AllocationCallbacks,
	p_view &C.ImageView) Result {
	return C.vkCreateImageView(device, p_create_info, p_allocator, p_view)
}

fn C.vkDestroyImageView(C.Device,
	C.ImageView,
	&AllocationCallbacks)
pub fn destroy_image_view(device C.Device,
	image_view C.ImageView,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyImageView(device, image_view, p_allocator)
}

fn C.vkCreateShaderModule(C.Device,
	&ShaderModuleCreateInfo,
	&AllocationCallbacks,
	&C.ShaderModule) Result
pub fn create_shader_module(device C.Device,
	p_create_info &ShaderModuleCreateInfo,
	p_allocator &AllocationCallbacks,
	p_shader_module &C.ShaderModule) Result {
	return C.vkCreateShaderModule(device, p_create_info, p_allocator, p_shader_module)
}

fn C.vkDestroyShaderModule(C.Device,
	C.ShaderModule,
	&AllocationCallbacks)
pub fn destroy_shader_module(device C.Device,
	shader_module C.ShaderModule,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyShaderModule(device, shader_module, p_allocator)
}

fn C.vkCreatePipelineCache(C.Device,
	&PipelineCacheCreateInfo,
	&AllocationCallbacks,
	&C.PipelineCache) Result
pub fn create_pipeline_cache(device C.Device,
	p_create_info &PipelineCacheCreateInfo,
	p_allocator &AllocationCallbacks,
	p_pipeline_cache &C.PipelineCache) Result {
	return C.vkCreatePipelineCache(device, p_create_info, p_allocator, p_pipeline_cache)
}

fn C.vkDestroyPipelineCache(C.Device,
	C.PipelineCache,
	&AllocationCallbacks)
pub fn destroy_pipeline_cache(device C.Device,
	pipeline_cache C.PipelineCache,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyPipelineCache(device, pipeline_cache, p_allocator)
}

fn C.vkGetPipelineCacheData(C.Device,
	C.PipelineCache,
	&usize,
	voidptr) Result
pub fn get_pipeline_cache_data(device C.Device,
	pipeline_cache C.PipelineCache,
	p_data_size &usize,
	p_data voidptr) Result {
	return C.vkGetPipelineCacheData(device, pipeline_cache, p_data_size, p_data)
}

fn C.vkMergePipelineCaches(C.Device,
	C.PipelineCache,
	u32,
	&C.PipelineCache) Result
pub fn merge_pipeline_caches(device C.Device,
	dst_cache C.PipelineCache,
	src_cache_count u32,
	p_src_caches &C.PipelineCache) Result {
	return C.vkMergePipelineCaches(device, dst_cache, src_cache_count, p_src_caches)
}

fn C.vkCreateGraphicsPipelines(C.Device,
	C.PipelineCache,
	u32,
	&GraphicsPipelineCreateInfo,
	&AllocationCallbacks,
	&C.Pipeline) Result
pub fn create_graphics_pipelines(device C.Device,
	pipeline_cache C.PipelineCache,
	create_info_count u32,
	p_create_infos &GraphicsPipelineCreateInfo,
	p_allocator &AllocationCallbacks,
	p_pipelines &C.Pipeline) Result {
	return C.vkCreateGraphicsPipelines(device, pipeline_cache, create_info_count, p_create_infos,
		p_allocator, p_pipelines)
}

fn C.vkCreateComputePipelines(C.Device,
	C.PipelineCache,
	u32,
	&ComputePipelineCreateInfo,
	&AllocationCallbacks,
	&C.Pipeline) Result
pub fn create_compute_pipelines(device C.Device,
	pipeline_cache C.PipelineCache,
	create_info_count u32,
	p_create_infos &ComputePipelineCreateInfo,
	p_allocator &AllocationCallbacks,
	p_pipelines &C.Pipeline) Result {
	return C.vkCreateComputePipelines(device, pipeline_cache, create_info_count, p_create_infos,
		p_allocator, p_pipelines)
}

fn C.vkDestroyPipeline(C.Device,
	C.Pipeline,
	&AllocationCallbacks)
pub fn destroy_pipeline(device C.Device,
	pipeline C.Pipeline,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyPipeline(device, pipeline, p_allocator)
}

fn C.vkCreatePipelineLayout(C.Device,
	&PipelineLayoutCreateInfo,
	&AllocationCallbacks,
	&C.PipelineLayout) Result
pub fn create_pipeline_layout(device C.Device,
	p_create_info &PipelineLayoutCreateInfo,
	p_allocator &AllocationCallbacks,
	p_pipeline_layout &C.PipelineLayout) Result {
	return C.vkCreatePipelineLayout(device, p_create_info, p_allocator, p_pipeline_layout)
}

fn C.vkDestroyPipelineLayout(C.Device,
	C.PipelineLayout,
	&AllocationCallbacks)
pub fn destroy_pipeline_layout(device C.Device,
	pipeline_layout C.PipelineLayout,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyPipelineLayout(device, pipeline_layout, p_allocator)
}

fn C.vkCreateSampler(C.Device,
	&SamplerCreateInfo,
	&AllocationCallbacks,
	&C.Sampler) Result
pub fn create_sampler(device C.Device,
	p_create_info &SamplerCreateInfo,
	p_allocator &AllocationCallbacks,
	p_sampler &C.Sampler) Result {
	return C.vkCreateSampler(device, p_create_info, p_allocator, p_sampler)
}

fn C.vkDestroySampler(C.Device,
	C.Sampler,
	&AllocationCallbacks)
pub fn destroy_sampler(device C.Device,
	sampler C.Sampler,
	p_allocator &AllocationCallbacks) {
	C.vkDestroySampler(device, sampler, p_allocator)
}

fn C.vkCreateDescriptorSetLayout(C.Device,
	&DescriptorSetLayoutCreateInfo,
	&AllocationCallbacks,
	&C.DescriptorSetLayout) Result
pub fn create_descriptor_set_layout(device C.Device,
	p_create_info &DescriptorSetLayoutCreateInfo,
	p_allocator &AllocationCallbacks,
	p_set_layout &C.DescriptorSetLayout) Result {
	return C.vkCreateDescriptorSetLayout(device, p_create_info, p_allocator, p_set_layout)
}

fn C.vkDestroyDescriptorSetLayout(C.Device,
	C.DescriptorSetLayout,
	&AllocationCallbacks)
pub fn destroy_descriptor_set_layout(device C.Device,
	descriptor_set_layout C.DescriptorSetLayout,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDescriptorSetLayout(device, descriptor_set_layout, p_allocator)
}

fn C.vkCreateDescriptorPool(C.Device,
	&DescriptorPoolCreateInfo,
	&AllocationCallbacks,
	&C.DescriptorPool) Result
pub fn create_descriptor_pool(device C.Device,
	p_create_info &DescriptorPoolCreateInfo,
	p_allocator &AllocationCallbacks,
	p_descriptor_pool &C.DescriptorPool) Result {
	return C.vkCreateDescriptorPool(device, p_create_info, p_allocator, p_descriptor_pool)
}

fn C.vkDestroyDescriptorPool(C.Device,
	C.DescriptorPool,
	&AllocationCallbacks)
pub fn destroy_descriptor_pool(device C.Device,
	descriptor_pool C.DescriptorPool,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDescriptorPool(device, descriptor_pool, p_allocator)
}

fn C.vkResetDescriptorPool(C.Device,
	C.DescriptorPool,
	DescriptorPoolResetFlags) Result
pub fn reset_descriptor_pool(device C.Device,
	descriptor_pool C.DescriptorPool,
	flags DescriptorPoolResetFlags) Result {
	return C.vkResetDescriptorPool(device, descriptor_pool, flags)
}

fn C.vkAllocateDescriptorSets(C.Device,
	&DescriptorSetAllocateInfo,
	&C.DescriptorSet) Result
pub fn allocate_descriptor_sets(device C.Device,
	p_allocate_info &DescriptorSetAllocateInfo,
	p_descriptor_sets &C.DescriptorSet) Result {
	return C.vkAllocateDescriptorSets(device, p_allocate_info, p_descriptor_sets)
}

fn C.vkFreeDescriptorSets(C.Device,
	C.DescriptorPool,
	u32,
	&C.DescriptorSet) Result
pub fn free_descriptor_sets(device C.Device,
	descriptor_pool C.DescriptorPool,
	descriptor_set_count u32,
	p_descriptor_sets &C.DescriptorSet) Result {
	return C.vkFreeDescriptorSets(device, descriptor_pool, descriptor_set_count, p_descriptor_sets)
}

fn C.vkUpdateDescriptorSets(C.Device,
	u32,
	&WriteDescriptorSet,
	u32,
	&CopyDescriptorSet)
pub fn update_descriptor_sets(device C.Device,
	descriptor_write_count u32,
	p_descriptor_writes &WriteDescriptorSet,
	descriptor_copy_count u32,
	p_descriptor_copies &CopyDescriptorSet) {
	C.vkUpdateDescriptorSets(device, descriptor_write_count, p_descriptor_writes, descriptor_copy_count,
		p_descriptor_copies)
}

fn C.vkCreateFramebuffer(C.Device,
	&FramebufferCreateInfo,
	&AllocationCallbacks,
	&C.Framebuffer) Result
pub fn create_framebuffer(device C.Device,
	p_create_info &FramebufferCreateInfo,
	p_allocator &AllocationCallbacks,
	p_framebuffer &C.Framebuffer) Result {
	return C.vkCreateFramebuffer(device, p_create_info, p_allocator, p_framebuffer)
}

fn C.vkDestroyFramebuffer(C.Device,
	C.Framebuffer,
	&AllocationCallbacks)
pub fn destroy_framebuffer(device C.Device,
	framebuffer C.Framebuffer,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyFramebuffer(device, framebuffer, p_allocator)
}

fn C.vkCreateRenderPass(C.Device,
	&RenderPassCreateInfo,
	&AllocationCallbacks,
	&C.RenderPass) Result
pub fn create_render_pass(device C.Device,
	p_create_info &RenderPassCreateInfo,
	p_allocator &AllocationCallbacks,
	p_render_pass &C.RenderPass) Result {
	return C.vkCreateRenderPass(device, p_create_info, p_allocator, p_render_pass)
}

fn C.vkDestroyRenderPass(C.Device,
	C.RenderPass,
	&AllocationCallbacks)
pub fn destroy_render_pass(device C.Device,
	render_pass C.RenderPass,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyRenderPass(device, render_pass, p_allocator)
}

fn C.vkGetRenderAreaGranularity(C.Device,
	C.RenderPass,
	&Extent2D)
pub fn get_render_area_granularity(device C.Device,
	render_pass C.RenderPass,
	p_granularity &Extent2D) {
	C.vkGetRenderAreaGranularity(device, render_pass, p_granularity)
}

fn C.vkCreateCommandPool(C.Device,
	&CommandPoolCreateInfo,
	&AllocationCallbacks,
	&C.CommandPool) Result
pub fn create_command_pool(device C.Device,
	p_create_info &CommandPoolCreateInfo,
	p_allocator &AllocationCallbacks,
	p_command_pool &C.CommandPool) Result {
	return C.vkCreateCommandPool(device, p_create_info, p_allocator, p_command_pool)
}

fn C.vkDestroyCommandPool(C.Device,
	C.CommandPool,
	&AllocationCallbacks)
pub fn destroy_command_pool(device C.Device,
	command_pool C.CommandPool,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyCommandPool(device, command_pool, p_allocator)
}

fn C.vkResetCommandPool(C.Device,
	C.CommandPool,
	CommandPoolResetFlags) Result
pub fn reset_command_pool(device C.Device,
	command_pool C.CommandPool,
	flags CommandPoolResetFlags) Result {
	return C.vkResetCommandPool(device, command_pool, flags)
}

fn C.vkAllocateCommandBuffers(C.Device,
	&CommandBufferAllocateInfo,
	&C.CommandBuffer) Result
pub fn allocate_command_buffers(device C.Device,
	p_allocate_info &CommandBufferAllocateInfo,
	p_command_buffers &C.CommandBuffer) Result {
	return C.vkAllocateCommandBuffers(device, p_allocate_info, p_command_buffers)
}

fn C.vkFreeCommandBuffers(C.Device,
	C.CommandPool,
	u32,
	&C.CommandBuffer)
pub fn free_command_buffers(device C.Device,
	command_pool C.CommandPool,
	command_buffer_count u32,
	p_command_buffers &C.CommandBuffer) {
	C.vkFreeCommandBuffers(device, command_pool, command_buffer_count, p_command_buffers)
}

fn C.vkBeginCommandBuffer(C.CommandBuffer,
	&CommandBufferBeginInfo) Result
pub fn begin_command_buffer(command_buffer C.CommandBuffer,
	p_begin_info &CommandBufferBeginInfo) Result {
	return C.vkBeginCommandBuffer(command_buffer, p_begin_info)
}

fn C.vkEndCommandBuffer(C.CommandBuffer) Result
pub fn end_command_buffer(command_buffer C.CommandBuffer) Result {
	return C.vkEndCommandBuffer(command_buffer)
}

fn C.vkResetCommandBuffer(C.CommandBuffer,
	CommandBufferResetFlags) Result
pub fn reset_command_buffer(command_buffer C.CommandBuffer,
	flags CommandBufferResetFlags) Result {
	return C.vkResetCommandBuffer(command_buffer, flags)
}

fn C.vkCmdBindPipeline(C.CommandBuffer,
	PipelineBindPoint,
	C.Pipeline)
pub fn cmd_bind_pipeline(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	pipeline C.Pipeline) {
	C.vkCmdBindPipeline(command_buffer, pipeline_bind_point, pipeline)
}

fn C.vkCmdSetViewport(C.CommandBuffer,
	u32,
	u32,
	&Viewport)
pub fn cmd_set_viewport(command_buffer C.CommandBuffer,
	first_viewport u32,
	viewport_count u32,
	p_viewports &Viewport) {
	C.vkCmdSetViewport(command_buffer, first_viewport, viewport_count, p_viewports)
}

fn C.vkCmdSetScissor(C.CommandBuffer,
	u32,
	u32,
	&Rect2D)
pub fn cmd_set_scissor(command_buffer C.CommandBuffer,
	first_scissor u32,
	scissor_count u32,
	p_scissors &Rect2D) {
	C.vkCmdSetScissor(command_buffer, first_scissor, scissor_count, p_scissors)
}

fn C.vkCmdSetLineWidth(C.CommandBuffer,
	f32)
pub fn cmd_set_line_width(command_buffer C.CommandBuffer,
	line_width f32) {
	C.vkCmdSetLineWidth(command_buffer, line_width)
}

fn C.vkCmdSetDepthBias(C.CommandBuffer,
	f32,
	f32,
	f32)
pub fn cmd_set_depth_bias(command_buffer C.CommandBuffer,
	depth_bias_constant_factor f32,
	depth_bias_clamp f32,
	depth_bias_slope_factor f32) {
	C.vkCmdSetDepthBias(command_buffer, depth_bias_constant_factor, depth_bias_clamp,
		depth_bias_slope_factor)
}

fn C.vkCmdSetBlendConstants(C.CommandBuffer,
	[4]f32)
pub fn cmd_set_blend_constants(command_buffer C.CommandBuffer,
	blend_constants [4]f32) {
	C.vkCmdSetBlendConstants(command_buffer, blend_constants)
}

fn C.vkCmdSetDepthBounds(C.CommandBuffer,
	f32,
	f32)
pub fn cmd_set_depth_bounds(command_buffer C.CommandBuffer,
	min_depth_bounds f32,
	max_depth_bounds f32) {
	C.vkCmdSetDepthBounds(command_buffer, min_depth_bounds, max_depth_bounds)
}

fn C.vkCmdSetStencilCompareMask(C.CommandBuffer,
	StencilFaceFlags,
	u32)
pub fn cmd_set_stencil_compare_mask(command_buffer C.CommandBuffer,
	face_mask StencilFaceFlags,
	compare_mask u32) {
	C.vkCmdSetStencilCompareMask(command_buffer, face_mask, compare_mask)
}

fn C.vkCmdSetStencilWriteMask(C.CommandBuffer,
	StencilFaceFlags,
	u32)
pub fn cmd_set_stencil_write_mask(command_buffer C.CommandBuffer,
	face_mask StencilFaceFlags,
	write_mask u32) {
	C.vkCmdSetStencilWriteMask(command_buffer, face_mask, write_mask)
}

fn C.vkCmdSetStencilReference(C.CommandBuffer,
	StencilFaceFlags,
	u32)
pub fn cmd_set_stencil_reference(command_buffer C.CommandBuffer,
	face_mask StencilFaceFlags,
	reference u32) {
	C.vkCmdSetStencilReference(command_buffer, face_mask, reference)
}

fn C.vkCmdBindDescriptorSets(C.CommandBuffer,
	PipelineBindPoint,
	C.PipelineLayout,
	u32,
	u32,
	&C.DescriptorSet,
	u32,
	&u32)
pub fn cmd_bind_descriptor_sets(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	layout C.PipelineLayout,
	first_set u32,
	descriptor_set_count u32,
	p_descriptor_sets &C.DescriptorSet,
	dynamic_offset_count u32,
	p_dynamic_offsets &u32) {
	C.vkCmdBindDescriptorSets(command_buffer, pipeline_bind_point, layout, first_set,
		descriptor_set_count, p_descriptor_sets, dynamic_offset_count, p_dynamic_offsets)
}

fn C.vkCmdBindIndexBuffer(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	IndexType)
pub fn cmd_bind_index_buffer(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	index_type IndexType) {
	C.vkCmdBindIndexBuffer(command_buffer, buffer, offset, index_type)
}

fn C.vkCmdBindVertexBuffers(C.CommandBuffer,
	u32,
	u32,
	&C.Buffer,
	&DeviceSize)
pub fn cmd_bind_vertex_buffers(command_buffer C.CommandBuffer,
	first_binding u32,
	binding_count u32,
	p_buffers &C.Buffer,
	p_offsets &DeviceSize) {
	C.vkCmdBindVertexBuffers(command_buffer, first_binding, binding_count, p_buffers,
		p_offsets)
}

fn C.vkCmdDraw(C.CommandBuffer,
	u32,
	u32,
	u32,
	u32)
pub fn cmd_draw(command_buffer C.CommandBuffer,
	vertex_count u32,
	instance_count u32,
	first_vertex u32,
	first_instance u32) {
	C.vkCmdDraw(command_buffer, vertex_count, instance_count, first_vertex, first_instance)
}

fn C.vkCmdDrawIndexed(C.CommandBuffer,
	u32,
	u32,
	u32,
	i32,
	u32)
pub fn cmd_draw_indexed(command_buffer C.CommandBuffer,
	index_count u32,
	instance_count u32,
	first_index u32,
	vertex_offset i32,
	first_instance u32) {
	C.vkCmdDrawIndexed(command_buffer, index_count, instance_count, first_index, vertex_offset,
		first_instance)
}

fn C.vkCmdDrawIndirect(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_indirect(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	draw_count u32,
	stride u32) {
	C.vkCmdDrawIndirect(command_buffer, buffer, offset, draw_count, stride)
}

fn C.vkCmdDrawIndexedIndirect(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_indexed_indirect(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	draw_count u32,
	stride u32) {
	C.vkCmdDrawIndexedIndirect(command_buffer, buffer, offset, draw_count, stride)
}

fn C.vkCmdDispatch(C.CommandBuffer,
	u32,
	u32,
	u32)
pub fn cmd_dispatch(command_buffer C.CommandBuffer,
	group_count_x u32,
	group_count_y u32,
	group_count_z u32) {
	C.vkCmdDispatch(command_buffer, group_count_x, group_count_y, group_count_z)
}

fn C.vkCmdDispatchIndirect(C.CommandBuffer,
	C.Buffer,
	DeviceSize)
pub fn cmd_dispatch_indirect(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize) {
	C.vkCmdDispatchIndirect(command_buffer, buffer, offset)
}

fn C.vkCmdCopyBuffer(C.CommandBuffer,
	C.Buffer,
	C.Buffer,
	u32,
	&BufferCopy)
pub fn cmd_copy_buffer(command_buffer C.CommandBuffer,
	src_buffer C.Buffer,
	dst_buffer C.Buffer,
	region_count u32,
	p_regions &BufferCopy) {
	C.vkCmdCopyBuffer(command_buffer, src_buffer, dst_buffer, region_count, p_regions)
}

fn C.vkCmdCopyImage(C.CommandBuffer,
	C.Image,
	ImageLayout,
	C.Image,
	ImageLayout,
	u32,
	&ImageCopy)
pub fn cmd_copy_image(command_buffer C.CommandBuffer,
	src_image C.Image,
	src_image_layout ImageLayout,
	dst_image C.Image,
	dst_image_layout ImageLayout,
	region_count u32,
	p_regions &ImageCopy) {
	C.vkCmdCopyImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout,
		region_count, p_regions)
}

fn C.vkCmdBlitImage(C.CommandBuffer,
	C.Image,
	ImageLayout,
	C.Image,
	ImageLayout,
	u32,
	&ImageBlit,
	Filter)
pub fn cmd_blit_image(command_buffer C.CommandBuffer,
	src_image C.Image,
	src_image_layout ImageLayout,
	dst_image C.Image,
	dst_image_layout ImageLayout,
	region_count u32,
	p_regions &ImageBlit,
	filter Filter) {
	C.vkCmdBlitImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout,
		region_count, p_regions, filter)
}

fn C.vkCmdCopyBufferToImage(C.CommandBuffer,
	C.Buffer,
	C.Image,
	ImageLayout,
	u32,
	&BufferImageCopy)
pub fn cmd_copy_buffer_to_image(command_buffer C.CommandBuffer,
	src_buffer C.Buffer,
	dst_image C.Image,
	dst_image_layout ImageLayout,
	region_count u32,
	p_regions &BufferImageCopy) {
	C.vkCmdCopyBufferToImage(command_buffer, src_buffer, dst_image, dst_image_layout,
		region_count, p_regions)
}

fn C.vkCmdCopyImageToBuffer(C.CommandBuffer,
	C.Image,
	ImageLayout,
	C.Buffer,
	u32,
	&BufferImageCopy)
pub fn cmd_copy_image_to_buffer(command_buffer C.CommandBuffer,
	src_image C.Image,
	src_image_layout ImageLayout,
	dst_buffer C.Buffer,
	region_count u32,
	p_regions &BufferImageCopy) {
	C.vkCmdCopyImageToBuffer(command_buffer, src_image, src_image_layout, dst_buffer,
		region_count, p_regions)
}

fn C.vkCmdUpdateBuffer(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	voidptr)
pub fn cmd_update_buffer(command_buffer C.CommandBuffer,
	dst_buffer C.Buffer,
	dst_offset DeviceSize,
	data_size DeviceSize,
	p_data voidptr) {
	C.vkCmdUpdateBuffer(command_buffer, dst_buffer, dst_offset, data_size, p_data)
}

fn C.vkCmdFillBuffer(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	u32)
pub fn cmd_fill_buffer(command_buffer C.CommandBuffer,
	dst_buffer C.Buffer,
	dst_offset DeviceSize,
	size DeviceSize,
	data u32) {
	C.vkCmdFillBuffer(command_buffer, dst_buffer, dst_offset, size, data)
}

fn C.vkCmdClearColorImage(C.CommandBuffer,
	C.Image,
	ImageLayout,
	&ClearColorValue,
	u32,
	&ImageSubresourceRange)
pub fn cmd_clear_color_image(command_buffer C.CommandBuffer,
	image C.Image,
	image_layout ImageLayout,
	p_color &ClearColorValue,
	range_count u32,
	p_ranges &ImageSubresourceRange) {
	C.vkCmdClearColorImage(command_buffer, image, image_layout, p_color, range_count,
		p_ranges)
}

fn C.vkCmdClearDepthStencilImage(C.CommandBuffer,
	C.Image,
	ImageLayout,
	&ClearDepthStencilValue,
	u32,
	&ImageSubresourceRange)
pub fn cmd_clear_depth_stencil_image(command_buffer C.CommandBuffer,
	image C.Image,
	image_layout ImageLayout,
	p_depth_stencil &ClearDepthStencilValue,
	range_count u32,
	p_ranges &ImageSubresourceRange) {
	C.vkCmdClearDepthStencilImage(command_buffer, image, image_layout, p_depth_stencil,
		range_count, p_ranges)
}

fn C.vkCmdClearAttachments(C.CommandBuffer,
	u32,
	&ClearAttachment,
	u32,
	&ClearRect)
pub fn cmd_clear_attachments(command_buffer C.CommandBuffer,
	attachment_count u32,
	p_attachments &ClearAttachment,
	rect_count u32,
	p_rects &ClearRect) {
	C.vkCmdClearAttachments(command_buffer, attachment_count, p_attachments, rect_count,
		p_rects)
}

fn C.vkCmdResolveImage(C.CommandBuffer,
	C.Image,
	ImageLayout,
	C.Image,
	ImageLayout,
	u32,
	&ImageResolve)
pub fn cmd_resolve_image(command_buffer C.CommandBuffer,
	src_image C.Image,
	src_image_layout ImageLayout,
	dst_image C.Image,
	dst_image_layout ImageLayout,
	region_count u32,
	p_regions &ImageResolve) {
	C.vkCmdResolveImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout,
		region_count, p_regions)
}

fn C.vkCmdSetEvent(C.CommandBuffer,
	C.Event,
	PipelineStageFlags)
pub fn cmd_set_event(command_buffer C.CommandBuffer,
	event C.Event,
	stage_mask PipelineStageFlags) {
	C.vkCmdSetEvent(command_buffer, event, stage_mask)
}

fn C.vkCmdResetEvent(C.CommandBuffer,
	C.Event,
	PipelineStageFlags)
pub fn cmd_reset_event(command_buffer C.CommandBuffer,
	event C.Event,
	stage_mask PipelineStageFlags) {
	C.vkCmdResetEvent(command_buffer, event, stage_mask)
}

fn C.vkCmdWaitEvents(C.CommandBuffer,
	u32,
	&C.Event,
	PipelineStageFlags,
	PipelineStageFlags,
	u32,
	&MemoryBarrier,
	u32,
	&BufferMemoryBarrier,
	u32,
	&ImageMemoryBarrier)
pub fn cmd_wait_events(command_buffer C.CommandBuffer,
	event_count u32,
	p_events &C.Event,
	src_stage_mask PipelineStageFlags,
	dst_stage_mask PipelineStageFlags,
	memory_barrier_count u32,
	p_memory_barriers &MemoryBarrier,
	buffer_memory_barrier_count u32,
	p_buffer_memory_barriers &BufferMemoryBarrier,
	image_memory_barrier_count u32,
	p_image_memory_barriers &ImageMemoryBarrier) {
	C.vkCmdWaitEvents(command_buffer, event_count, p_events, src_stage_mask, dst_stage_mask,
		memory_barrier_count, p_memory_barriers, buffer_memory_barrier_count, p_buffer_memory_barriers,
		image_memory_barrier_count, p_image_memory_barriers)
}

fn C.vkCmdPipelineBarrier(C.CommandBuffer,
	PipelineStageFlags,
	PipelineStageFlags,
	DependencyFlags,
	u32,
	&MemoryBarrier,
	u32,
	&BufferMemoryBarrier,
	u32,
	&ImageMemoryBarrier)
pub fn cmd_pipeline_barrier(command_buffer C.CommandBuffer,
	src_stage_mask PipelineStageFlags,
	dst_stage_mask PipelineStageFlags,
	dependency_flags DependencyFlags,
	memory_barrier_count u32,
	p_memory_barriers &MemoryBarrier,
	buffer_memory_barrier_count u32,
	p_buffer_memory_barriers &BufferMemoryBarrier,
	image_memory_barrier_count u32,
	p_image_memory_barriers &ImageMemoryBarrier) {
	C.vkCmdPipelineBarrier(command_buffer, src_stage_mask, dst_stage_mask, dependency_flags,
		memory_barrier_count, p_memory_barriers, buffer_memory_barrier_count, p_buffer_memory_barriers,
		image_memory_barrier_count, p_image_memory_barriers)
}

fn C.vkCmdBeginQuery(C.CommandBuffer,
	C.QueryPool,
	u32,
	QueryControlFlags)
pub fn cmd_begin_query(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	query u32,
	flags QueryControlFlags) {
	C.vkCmdBeginQuery(command_buffer, query_pool, query, flags)
}

fn C.vkCmdEndQuery(C.CommandBuffer,
	C.QueryPool,
	u32)
pub fn cmd_end_query(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	query u32) {
	C.vkCmdEndQuery(command_buffer, query_pool, query)
}

fn C.vkCmdResetQueryPool(C.CommandBuffer,
	C.QueryPool,
	u32,
	u32)
pub fn cmd_reset_query_pool(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	first_query u32,
	query_count u32) {
	C.vkCmdResetQueryPool(command_buffer, query_pool, first_query, query_count)
}

fn C.vkCmdWriteTimestamp(C.CommandBuffer,
	PipelineStageFlagBits,
	C.QueryPool,
	u32)
pub fn cmd_write_timestamp(command_buffer C.CommandBuffer,
	pipeline_stage PipelineStageFlagBits,
	query_pool C.QueryPool,
	query u32) {
	C.vkCmdWriteTimestamp(command_buffer, pipeline_stage, query_pool, query)
}

fn C.vkCmdCopyQueryPoolResults(C.CommandBuffer,
	C.QueryPool,
	u32,
	u32,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	QueryResultFlags)
pub fn cmd_copy_query_pool_results(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	first_query u32,
	query_count u32,
	dst_buffer C.Buffer,
	dst_offset DeviceSize,
	stride DeviceSize,
	flags QueryResultFlags) {
	C.vkCmdCopyQueryPoolResults(command_buffer, query_pool, first_query, query_count,
		dst_buffer, dst_offset, stride, flags)
}

fn C.vkCmdPushConstants(C.CommandBuffer,
	C.PipelineLayout,
	ShaderStageFlags,
	u32,
	u32,
	voidptr)
pub fn cmd_push_constants(command_buffer C.CommandBuffer,
	layout C.PipelineLayout,
	stage_flags ShaderStageFlags,
	offset u32,
	size u32,
	p_values voidptr) {
	C.vkCmdPushConstants(command_buffer, layout, stage_flags, offset, size, p_values)
}

fn C.vkCmdBeginRenderPass(C.CommandBuffer,
	&RenderPassBeginInfo,
	SubpassContents)
pub fn cmd_begin_render_pass(command_buffer C.CommandBuffer,
	p_render_pass_begin &RenderPassBeginInfo,
	contents SubpassContents) {
	C.vkCmdBeginRenderPass(command_buffer, p_render_pass_begin, contents)
}

fn C.vkCmdNextSubpass(C.CommandBuffer,
	SubpassContents)
pub fn cmd_next_subpass(command_buffer C.CommandBuffer,
	contents SubpassContents) {
	C.vkCmdNextSubpass(command_buffer, contents)
}

fn C.vkCmdEndRenderPass(C.CommandBuffer)
pub fn cmd_end_render_pass(command_buffer C.CommandBuffer) {
	C.vkCmdEndRenderPass(command_buffer)
}

fn C.vkCmdExecuteCommands(C.CommandBuffer,
	u32,
	&C.CommandBuffer)
pub fn cmd_execute_commands(command_buffer C.CommandBuffer,
	command_buffer_count u32,
	p_command_buffers &C.CommandBuffer) {
	C.vkCmdExecuteCommands(command_buffer, command_buffer_count, p_command_buffers)
}

// Vulkan 1.1 version number
pub const api_version_1_1 = make_api_version(0, 1, 1, 0) // Patch version should always be set to 0

pub type C.SamplerYcbcrConversion = voidptr
pub type C.DescriptorUpdateTemplate = voidptr

pub const max_device_group_size = u32(32)
pub const luid_size = u32(8)
pub const queue_family_external = ~u32(1)

pub enum PointClippingBehavior {
	point_clipping_behavior_all_clip_planes       = int(0)
	point_clipping_behavior_user_clip_planes_only = int(1)
	point_clipping_behavior_max_enum              = int(0x7FFFFFFF)
}

pub enum TessellationDomainOrigin {
	tessellation_domain_origin_upper_left = int(0)
	tessellation_domain_origin_lower_left = int(1)
	tessellation_domain_origin_max_enum   = int(0x7FFFFFFF)
}

pub enum SamplerYcbcrModelConversion {
	sampler_ycbcr_model_conversion_rgb_identity   = int(0)
	sampler_ycbcr_model_conversion_ycbcr_identity = int(1)
	sampler_ycbcr_model_conversion_ycbcr709       = int(2)
	sampler_ycbcr_model_conversion_ycbcr601       = int(3)
	sampler_ycbcr_model_conversion_ycbcr2020      = int(4)
	sampler_ycbcr_model_conversion_max_enum       = int(0x7FFFFFFF)
}

pub enum SamplerYcbcrRange {
	sampler_ycbcr_range_itu_full   = int(0)
	sampler_ycbcr_range_itu_narrow = int(1)
	sampler_ycbcr_range_max_enum   = int(0x7FFFFFFF)
}

pub enum ChromaLocation {
	chroma_location_cosited_even = int(0)
	chroma_location_midpoint     = int(1)
	chroma_location_max_enum     = int(0x7FFFFFFF)
}

pub enum DescriptorUpdateTemplateType {
	descriptor_update_template_type_descriptor_set       = int(0)
	descriptor_update_template_type_push_descriptors_khr = int(1)
	descriptor_update_template_type_max_enum             = int(0x7FFFFFFF)
}

pub enum SubgroupFeatureFlagBits {
	subgroup_feature_basic_bit                = int(0x00000001)
	subgroup_feature_vote_bit                 = int(0x00000002)
	subgroup_feature_arithmetic_bit           = int(0x00000004)
	subgroup_feature_ballot_bit               = int(0x00000008)
	subgroup_feature_shuffle_bit              = int(0x00000010)
	subgroup_feature_shuffle_relative_bit     = int(0x00000020)
	subgroup_feature_clustered_bit            = int(0x00000040)
	subgroup_feature_quad_bit                 = int(0x00000080)
	subgroup_feature_partitioned_bit_nv       = int(0x00000100)
	subgroup_feature_rotate_bit_khr           = int(0x00000200)
	subgroup_feature_rotate_clustered_bit_khr = int(0x00000400)
	subgroup_feature_flag_bits_max_enum       = int(0x7FFFFFFF)
}

pub type SubgroupFeatureFlags = u32

pub enum PeerMemoryFeatureFlagBits {
	peer_memory_feature_copy_src_bit       = int(0x00000001)
	peer_memory_feature_copy_dst_bit       = int(0x00000002)
	peer_memory_feature_generic_src_bit    = int(0x00000004)
	peer_memory_feature_generic_dst_bit    = int(0x00000008)
	peer_memory_feature_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type PeerMemoryFeatureFlags = u32

pub enum MemoryAllocateFlagBits {
	memory_allocate_device_mask_bit                   = int(0x00000001)
	memory_allocate_device_address_bit                = int(0x00000002)
	memory_allocate_device_address_capture_replay_bit = int(0x00000004)
	memory_allocate_flag_bits_max_enum                = int(0x7FFFFFFF)
}

pub type MemoryAllocateFlags = u32
pub type CommandPoolTrimFlags = u32
pub type DescriptorUpdateTemplateCreateFlags = u32

pub enum ExternalMemoryHandleTypeFlagBits {
	external_memory_handle_type_opaque_fd_bit                       = int(0x00000001)
	external_memory_handle_type_opaque_win32_bit                    = int(0x00000002)
	external_memory_handle_type_opaque_win32_kmt_bit                = int(0x00000004)
	external_memory_handle_type_d3d11_texture_bit                   = int(0x00000008)
	external_memory_handle_type_d3d11_texture_kmt_bit               = int(0x00000010)
	external_memory_handle_type_d3d12_heap_bit                      = int(0x00000020)
	external_memory_handle_type_d3d12_resource_bit                  = int(0x00000040)
	external_memory_handle_type_dma_buf_bit_ext                     = int(0x00000200)
	external_memory_handle_type_android_hardware_buffer_bit_android = int(0x00000400)
	external_memory_handle_type_host_allocation_bit_ext             = int(0x00000080)
	external_memory_handle_type_host_mapped_foreign_memory_bit_ext  = int(0x00000100)
	external_memory_handle_type_zircon_vmo_bit_fuchsia              = int(0x00000800)
	external_memory_handle_type_rdma_address_bit_nv                 = int(0x00001000)
	external_memory_handle_type_screen_buffer_bit_qnx               = int(0x00004000)
	external_memory_handle_type_flag_bits_max_enum                  = int(0x7FFFFFFF)
}

pub type ExternalMemoryHandleTypeFlags = u32

pub enum ExternalMemoryFeatureFlagBits {
	external_memory_feature_dedicated_only_bit = int(0x00000001)
	external_memory_feature_exportable_bit     = int(0x00000002)
	external_memory_feature_importable_bit     = int(0x00000004)
	external_memory_feature_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type ExternalMemoryFeatureFlags = u32

pub enum ExternalFenceHandleTypeFlagBits {
	external_fence_handle_type_opaque_fd_bit        = int(0x00000001)
	external_fence_handle_type_opaque_win32_bit     = int(0x00000002)
	external_fence_handle_type_opaque_win32_kmt_bit = int(0x00000004)
	external_fence_handle_type_sync_fd_bit          = int(0x00000008)
	external_fence_handle_type_flag_bits_max_enum   = int(0x7FFFFFFF)
}

pub type ExternalFenceHandleTypeFlags = u32

pub enum ExternalFenceFeatureFlagBits {
	external_fence_feature_exportable_bit     = int(0x00000001)
	external_fence_feature_importable_bit     = int(0x00000002)
	external_fence_feature_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type ExternalFenceFeatureFlags = u32

pub enum FenceImportFlagBits {
	fence_import_temporary_bit      = int(0x00000001)
	fence_import_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type FenceImportFlags = u32

pub enum SemaphoreImportFlagBits {
	semaphore_import_temporary_bit      = int(0x00000001)
	semaphore_import_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type SemaphoreImportFlags = u32

pub enum ExternalSemaphoreHandleTypeFlagBits {
	external_semaphore_handle_type_opaque_fd_bit            = int(0x00000001)
	external_semaphore_handle_type_opaque_win32_bit         = int(0x00000002)
	external_semaphore_handle_type_opaque_win32_kmt_bit     = int(0x00000004)
	external_semaphore_handle_type_d3d12_fence_bit          = int(0x00000008)
	external_semaphore_handle_type_sync_fd_bit              = int(0x00000010)
	external_semaphore_handle_type_zircon_event_bit_fuchsia = int(0x00000080)
	external_semaphore_handle_type_flag_bits_max_enum       = int(0x7FFFFFFF)
}

pub type ExternalSemaphoreHandleTypeFlags = u32

pub enum ExternalSemaphoreFeatureFlagBits {
	external_semaphore_feature_exportable_bit     = int(0x00000001)
	external_semaphore_feature_importable_bit     = int(0x00000002)
	external_semaphore_feature_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type ExternalSemaphoreFeatureFlags = u32

pub struct PhysicalDeviceSubgroupProperties {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_subgroup_properties
	p_next                        voidptr
	subgroup_size                 u32
	supported_stages              ShaderStageFlags
	supported_operations          SubgroupFeatureFlags
	quad_operations_in_all_stages Bool32
}

pub struct BindBufferMemoryInfo {
pub mut:
	s_type        StructureType = StructureType.structure_type_bind_buffer_memory_info
	p_next        voidptr
	buffer        C.Buffer
	memory        C.DeviceMemory
	memory_offset DeviceSize
}

pub struct BindImageMemoryInfo {
pub mut:
	s_type        StructureType = StructureType.structure_type_bind_image_memory_info
	p_next        voidptr
	image         C.Image
	memory        C.DeviceMemory
	memory_offset DeviceSize
}

pub struct PhysicalDevice16BitStorageFeatures {
pub mut:
	s_type                                  StructureType
	p_next                                  voidptr
	storage_buffer16_bit_access             Bool32
	uniform_and_storage_buffer16_bit_access Bool32
	storage_push_constant16                 Bool32
	storage_input_output16                  Bool32
}

pub struct MemoryDedicatedRequirements {
pub mut:
	s_type                        StructureType = StructureType.structure_type_memory_dedicated_requirements
	p_next                        voidptr
	prefers_dedicated_allocation  Bool32
	requires_dedicated_allocation Bool32
}

pub struct MemoryDedicatedAllocateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_memory_dedicated_allocate_info
	p_next voidptr
	image  C.Image
	buffer C.Buffer
}

pub struct MemoryAllocateFlagsInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_memory_allocate_flags_info
	p_next      voidptr
	flags       MemoryAllocateFlags
	device_mask u32
}

pub struct DeviceGroupRenderPassBeginInfo {
pub mut:
	s_type                   StructureType = StructureType.structure_type_device_group_render_pass_begin_info
	p_next                   voidptr
	device_mask              u32
	device_render_area_count u32
	p_device_render_areas    &Rect2D
}

pub struct DeviceGroupCommandBufferBeginInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_device_group_command_buffer_begin_info
	p_next      voidptr
	device_mask u32
}

pub struct DeviceGroupSubmitInfo {
pub mut:
	s_type                            StructureType = StructureType.structure_type_device_group_submit_info
	p_next                            voidptr
	wait_semaphore_count              u32
	p_wait_semaphore_device_indices   &u32
	command_buffer_count              u32
	p_command_buffer_device_masks     &u32
	signal_semaphore_count            u32
	p_signal_semaphore_device_indices &u32
}

pub struct DeviceGroupBindSparseInfo {
pub mut:
	s_type                StructureType = StructureType.structure_type_device_group_bind_sparse_info
	p_next                voidptr
	resource_device_index u32
	memory_device_index   u32
}

pub struct BindBufferMemoryDeviceGroupInfo {
pub mut:
	s_type             StructureType = StructureType.structure_type_bind_buffer_memory_device_group_info
	p_next             voidptr
	device_index_count u32
	p_device_indices   &u32
}

pub struct BindImageMemoryDeviceGroupInfo {
pub mut:
	s_type                           StructureType = StructureType.structure_type_bind_image_memory_device_group_info
	p_next                           voidptr
	device_index_count               u32
	p_device_indices                 &u32
	split_instance_bind_region_count u32
	p_split_instance_bind_regions    &Rect2D
}

pub struct PhysicalDeviceGroupProperties {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_group_properties
	p_next                voidptr
	physical_device_count u32
	physical_devices      [max_device_group_size]C.PhysicalDevice
	subset_allocation     Bool32
}

pub struct DeviceGroupDeviceCreateInfo {
pub mut:
	s_type                StructureType = StructureType.structure_type_device_group_device_create_info
	p_next                voidptr
	physical_device_count u32
	p_physical_devices    &C.PhysicalDevice
}

pub struct BufferMemoryRequirementsInfo2 {
pub mut:
	s_type StructureType = StructureType.structure_type_buffer_memory_requirements_info2
	p_next voidptr
	buffer C.Buffer
}

pub struct ImageMemoryRequirementsInfo2 {
pub mut:
	s_type StructureType = StructureType.structure_type_image_memory_requirements_info2
	p_next voidptr
	image  C.Image
}

pub struct ImageSparseMemoryRequirementsInfo2 {
pub mut:
	s_type StructureType = StructureType.structure_type_image_sparse_memory_requirements_info2
	p_next voidptr
	image  C.Image
}

pub struct MemoryRequirements2 {
pub mut:
	s_type              StructureType = StructureType.structure_type_memory_requirements2
	p_next              voidptr
	memory_requirements MemoryRequirements
}

pub struct SparseImageMemoryRequirements2 {
pub mut:
	s_type              StructureType = StructureType.structure_type_sparse_image_memory_requirements2
	p_next              voidptr
	memory_requirements SparseImageMemoryRequirements
}

pub struct PhysicalDeviceFeatures2 {
pub mut:
	s_type   StructureType = StructureType.structure_type_physical_device_features2
	p_next   voidptr
	features PhysicalDeviceFeatures
}

pub struct PhysicalDeviceProperties2 {
pub mut:
	s_type     StructureType = StructureType.structure_type_physical_device_properties2
	p_next     voidptr
	properties PhysicalDeviceProperties
}

pub struct FormatProperties2 {
pub mut:
	s_type            StructureType = StructureType.structure_type_format_properties2
	p_next            voidptr
	format_properties FormatProperties
}

pub struct ImageFormatProperties2 {
pub mut:
	s_type                  StructureType = StructureType.structure_type_image_format_properties2
	p_next                  voidptr
	image_format_properties ImageFormatProperties
}

pub struct PhysicalDeviceImageFormatInfo2 {
pub mut:
	s_type StructureType = StructureType.structure_type_physical_device_image_format_info2
	p_next voidptr
	format Format
	vktype ImageType
	tiling ImageTiling
	usage  ImageUsageFlags
	flags  ImageCreateFlags
}

pub struct QueueFamilyProperties2 {
pub mut:
	s_type                  StructureType = StructureType.structure_type_queue_family_properties2
	p_next                  voidptr
	queue_family_properties QueueFamilyProperties
}

pub struct PhysicalDeviceMemoryProperties2 {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_memory_properties2
	p_next            voidptr
	memory_properties PhysicalDeviceMemoryProperties
}

pub struct SparseImageFormatProperties2 {
pub mut:
	s_type     StructureType = StructureType.structure_type_sparse_image_format_properties2
	p_next     voidptr
	properties SparseImageFormatProperties
}

pub struct PhysicalDeviceSparseImageFormatInfo2 {
pub mut:
	s_type  StructureType = StructureType.structure_type_physical_device_sparse_image_format_info2
	p_next  voidptr
	format  Format
	vktype  ImageType
	samples SampleCountFlagBits
	usage   ImageUsageFlags
	tiling  ImageTiling
}

pub struct PhysicalDevicePointClippingProperties {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_point_clipping_properties
	p_next                  voidptr
	point_clipping_behavior PointClippingBehavior
}

pub struct InputAttachmentAspectReference {
pub mut:
	subpass                u32
	input_attachment_index u32
	aspect_mask            ImageAspectFlags
}

pub struct RenderPassInputAttachmentAspectCreateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_render_pass_input_attachment_aspect_create_info
	p_next                 voidptr
	aspect_reference_count u32
	p_aspect_references    &InputAttachmentAspectReference
}

pub struct ImageViewUsageCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_image_view_usage_create_info
	p_next voidptr
	usage  ImageUsageFlags
}

pub struct PipelineTessellationDomainOriginStateCreateInfo {
pub mut:
	s_type        StructureType = StructureType.structure_type_pipeline_tessellation_domain_origin_state_create_info
	p_next        voidptr
	domain_origin TessellationDomainOrigin
}

pub struct RenderPassMultiviewCreateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_render_pass_multiview_create_info
	p_next                 voidptr
	subpass_count          u32
	p_view_masks           &u32
	dependency_count       u32
	p_view_offsets         &i32
	correlation_mask_count u32
	p_correlation_masks    &u32
}

pub struct PhysicalDeviceMultiviewFeatures {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_multiview_features
	p_next                        voidptr
	multiview                     Bool32
	multiview_geometry_shader     Bool32
	multiview_tessellation_shader Bool32
}

pub struct PhysicalDeviceMultiviewProperties {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_multiview_properties
	p_next                       voidptr
	max_multiview_view_count     u32
	max_multiview_instance_index u32
}

pub struct PhysicalDeviceVariablePointersFeatures {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_variable_pointers_features
	p_next                           voidptr
	variable_pointers_storage_buffer Bool32
	variable_pointers                Bool32
}

pub type PhysicalDeviceVariablePointerFeatures = PhysicalDeviceVariablePointersFeatures

pub struct PhysicalDeviceProtectedMemoryFeatures {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_protected_memory_features
	p_next           voidptr
	protected_memory Bool32
}

pub struct PhysicalDeviceProtectedMemoryProperties {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_protected_memory_properties
	p_next             voidptr
	protected_no_fault Bool32
}

pub struct DeviceQueueInfo2 {
pub mut:
	s_type             StructureType = StructureType.structure_type_device_queue_info2
	p_next             voidptr
	flags              DeviceQueueCreateFlags
	queue_family_index u32
	queue_index        u32
}

pub struct ProtectedSubmitInfo {
pub mut:
	s_type           StructureType = StructureType.structure_type_protected_submit_info
	p_next           voidptr
	protected_submit Bool32
}

pub struct SamplerYcbcrConversionCreateInfo {
pub mut:
	s_type                        StructureType = StructureType.structure_type_sampler_ycbcr_conversion_create_info
	p_next                        voidptr
	format                        Format
	ycbcr_model                   SamplerYcbcrModelConversion
	ycbcr_range                   SamplerYcbcrRange
	components                    ComponentMapping
	x_chroma_offset               ChromaLocation
	y_chroma_offset               ChromaLocation
	chroma_filter                 Filter
	force_explicit_reconstruction Bool32
}

pub struct SamplerYcbcrConversionInfo {
pub mut:
	s_type     StructureType = StructureType.structure_type_sampler_ycbcr_conversion_info
	p_next     voidptr
	conversion C.SamplerYcbcrConversion
}

pub struct BindImagePlaneMemoryInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_bind_image_plane_memory_info
	p_next       voidptr
	plane_aspect ImageAspectFlagBits
}

pub struct ImagePlaneMemoryRequirementsInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_image_plane_memory_requirements_info
	p_next       voidptr
	plane_aspect ImageAspectFlagBits
}

pub struct PhysicalDeviceSamplerYcbcrConversionFeatures {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_sampler_ycbcr_conversion_features
	p_next                   voidptr
	sampler_ycbcr_conversion Bool32
}

pub struct SamplerYcbcrConversionImageFormatProperties {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_sampler_ycbcr_conversion_image_format_properties
	p_next                                  voidptr
	combined_image_sampler_descriptor_count u32
}

pub struct DescriptorUpdateTemplateEntry {
pub mut:
	dst_binding       u32
	dst_array_element u32
	descriptor_count  u32
	descriptor_type   DescriptorType
	offset            usize
	stride            usize
}

pub struct DescriptorUpdateTemplateCreateInfo {
pub mut:
	s_type                        StructureType = StructureType.structure_type_descriptor_update_template_create_info
	p_next                        voidptr
	flags                         DescriptorUpdateTemplateCreateFlags
	descriptor_update_entry_count u32
	p_descriptor_update_entries   &DescriptorUpdateTemplateEntry
	template_type                 DescriptorUpdateTemplateType
	descriptor_set_layout         C.DescriptorSetLayout
	pipeline_bind_point           PipelineBindPoint
	pipeline_layout               C.PipelineLayout
	set                           u32
}

pub struct ExternalMemoryProperties {
pub mut:
	external_memory_features          ExternalMemoryFeatureFlags
	export_from_imported_handle_types ExternalMemoryHandleTypeFlags
	compatible_handle_types           ExternalMemoryHandleTypeFlags
}

pub struct PhysicalDeviceExternalImageFormatInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_external_image_format_info
	p_next      voidptr
	handle_type ExternalMemoryHandleTypeFlagBits
}

pub struct ExternalImageFormatProperties {
pub mut:
	s_type                     StructureType = StructureType.structure_type_external_image_format_properties
	p_next                     voidptr
	external_memory_properties ExternalMemoryProperties
}

pub struct PhysicalDeviceExternalBufferInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_external_buffer_info
	p_next      voidptr
	flags       BufferCreateFlags
	usage       BufferUsageFlags
	handle_type ExternalMemoryHandleTypeFlagBits
}

pub struct ExternalBufferProperties {
pub mut:
	s_type                     StructureType = StructureType.structure_type_external_buffer_properties
	p_next                     voidptr
	external_memory_properties ExternalMemoryProperties
}

pub struct PhysicalDeviceIDProperties {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_id_properties
	p_next            voidptr
	device_uuid       [uuid_size]u8
	driver_uuid       [uuid_size]u8
	device_luid       [luid_size]u8
	device_node_mask  u32
	device_luid_valid Bool32
}

pub struct ExternalMemoryImageCreateInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_external_memory_image_create_info
	p_next       voidptr
	handle_types ExternalMemoryHandleTypeFlags
}

pub struct ExternalMemoryBufferCreateInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_external_memory_buffer_create_info
	p_next       voidptr
	handle_types ExternalMemoryHandleTypeFlags
}

pub struct ExportMemoryAllocateInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_export_memory_allocate_info
	p_next       voidptr
	handle_types ExternalMemoryHandleTypeFlags
}

pub struct PhysicalDeviceExternalFenceInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_external_fence_info
	p_next      voidptr
	handle_type ExternalFenceHandleTypeFlagBits
}

pub struct ExternalFenceProperties {
pub mut:
	s_type                            StructureType = StructureType.structure_type_external_fence_properties
	p_next                            voidptr
	export_from_imported_handle_types ExternalFenceHandleTypeFlags
	compatible_handle_types           ExternalFenceHandleTypeFlags
	external_fence_features           ExternalFenceFeatureFlags
}

pub struct ExportFenceCreateInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_export_fence_create_info
	p_next       voidptr
	handle_types ExternalFenceHandleTypeFlags
}

pub struct ExportSemaphoreCreateInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_export_semaphore_create_info
	p_next       voidptr
	handle_types ExternalSemaphoreHandleTypeFlags
}

pub struct PhysicalDeviceExternalSemaphoreInfo {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_external_semaphore_info
	p_next      voidptr
	handle_type ExternalSemaphoreHandleTypeFlagBits
}

pub struct ExternalSemaphoreProperties {
pub mut:
	s_type                            StructureType = StructureType.structure_type_external_semaphore_properties
	p_next                            voidptr
	export_from_imported_handle_types ExternalSemaphoreHandleTypeFlags
	compatible_handle_types           ExternalSemaphoreHandleTypeFlags
	external_semaphore_features       ExternalSemaphoreFeatureFlags
}

pub struct PhysicalDeviceMaintenance3Properties {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_maintenance3_properties
	p_next                     voidptr
	max_per_set_descriptors    u32
	max_memory_allocation_size DeviceSize
}

pub struct DescriptorSetLayoutSupport {
pub mut:
	s_type    StructureType = StructureType.structure_type_descriptor_set_layout_support
	p_next    voidptr
	supported Bool32
}

pub struct PhysicalDeviceShaderDrawParametersFeatures {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_shader_draw_parameters_features
	p_next                 voidptr
	shader_draw_parameters Bool32
}

pub type PhysicalDeviceShaderDrawParameterFeatures = PhysicalDeviceShaderDrawParametersFeatures

fn C.vkEnumerateInstanceVersion(&u32) Result
pub fn enumerate_instance_version(p_api_version &u32) Result {
	return C.vkEnumerateInstanceVersion(p_api_version)
}

fn C.vkBindBufferMemory2(C.Device,
	u32,
	&BindBufferMemoryInfo) Result
pub fn bind_buffer_memory2(device C.Device,
	bind_info_count u32,
	p_bind_infos &BindBufferMemoryInfo) Result {
	return C.vkBindBufferMemory2(device, bind_info_count, p_bind_infos)
}

fn C.vkBindImageMemory2(C.Device,
	u32,
	&BindImageMemoryInfo) Result
pub fn bind_image_memory2(device C.Device,
	bind_info_count u32,
	p_bind_infos &BindImageMemoryInfo) Result {
	return C.vkBindImageMemory2(device, bind_info_count, p_bind_infos)
}

fn C.vkGetDeviceGroupPeerMemoryFeatures(C.Device,
	u32,
	u32,
	u32,
	&PeerMemoryFeatureFlags)
pub fn get_device_group_peer_memory_features(device C.Device,
	heap_index u32,
	local_device_index u32,
	remote_device_index u32,
	p_peer_memory_features &PeerMemoryFeatureFlags) {
	C.vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index,
		p_peer_memory_features)
}

fn C.vkCmdSetDeviceMask(C.CommandBuffer,
	u32)
pub fn cmd_set_device_mask(command_buffer C.CommandBuffer,
	device_mask u32) {
	C.vkCmdSetDeviceMask(command_buffer, device_mask)
}

fn C.vkCmdDispatchBase(C.CommandBuffer,
	u32,
	u32,
	u32,
	u32,
	u32,
	u32)
pub fn cmd_dispatch_base(command_buffer C.CommandBuffer,
	base_group_x u32,
	base_group_y u32,
	base_group_z u32,
	group_count_x u32,
	group_count_y u32,
	group_count_z u32) {
	C.vkCmdDispatchBase(command_buffer, base_group_x, base_group_y, base_group_z, group_count_x,
		group_count_y, group_count_z)
}

fn C.vkEnumeratePhysicalDeviceGroups(C.Instance,
	&u32,
	&PhysicalDeviceGroupProperties) Result
pub fn enumerate_physical_device_groups(instance C.Instance,
	p_physical_device_group_count &u32,
	p_physical_device_group_properties &PhysicalDeviceGroupProperties) Result {
	return C.vkEnumeratePhysicalDeviceGroups(instance, p_physical_device_group_count,
		p_physical_device_group_properties)
}

fn C.vkGetImageMemoryRequirements2(C.Device,
	&ImageMemoryRequirementsInfo2,
	&MemoryRequirements2)
pub fn get_image_memory_requirements2(device C.Device,
	p_info &ImageMemoryRequirementsInfo2,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetImageMemoryRequirements2(device, p_info, p_memory_requirements)
}

fn C.vkGetBufferMemoryRequirements2(C.Device,
	&BufferMemoryRequirementsInfo2,
	&MemoryRequirements2)
pub fn get_buffer_memory_requirements2(device C.Device,
	p_info &BufferMemoryRequirementsInfo2,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetBufferMemoryRequirements2(device, p_info, p_memory_requirements)
}

fn C.vkGetImageSparseMemoryRequirements2(C.Device,
	&ImageSparseMemoryRequirementsInfo2,
	&u32,
	&SparseImageMemoryRequirements2)
pub fn get_image_sparse_memory_requirements2(device C.Device,
	p_info &ImageSparseMemoryRequirementsInfo2,
	p_sparse_memory_requirement_count &u32,
	p_sparse_memory_requirements &SparseImageMemoryRequirements2) {
	C.vkGetImageSparseMemoryRequirements2(device, p_info, p_sparse_memory_requirement_count,
		p_sparse_memory_requirements)
}

fn C.vkGetPhysicalDeviceFeatures2(C.PhysicalDevice,
	&PhysicalDeviceFeatures2)
pub fn get_physical_device_features2(physical_device C.PhysicalDevice,
	p_features &PhysicalDeviceFeatures2) {
	C.vkGetPhysicalDeviceFeatures2(physical_device, p_features)
}

fn C.vkGetPhysicalDeviceProperties2(C.PhysicalDevice,
	&PhysicalDeviceProperties2)
pub fn get_physical_device_properties2(physical_device C.PhysicalDevice,
	p_properties &PhysicalDeviceProperties2) {
	C.vkGetPhysicalDeviceProperties2(physical_device, p_properties)
}

fn C.vkGetPhysicalDeviceFormatProperties2(C.PhysicalDevice,
	Format,
	&FormatProperties2)
pub fn get_physical_device_format_properties2(physical_device C.PhysicalDevice,
	format Format,
	p_format_properties &FormatProperties2) {
	C.vkGetPhysicalDeviceFormatProperties2(physical_device, format, p_format_properties)
}

fn C.vkGetPhysicalDeviceImageFormatProperties2(C.PhysicalDevice,
	&PhysicalDeviceImageFormatInfo2,
	&ImageFormatProperties2) Result
pub fn get_physical_device_image_format_properties2(physical_device C.PhysicalDevice,
	p_image_format_info &PhysicalDeviceImageFormatInfo2,
	p_image_format_properties &ImageFormatProperties2) Result {
	return C.vkGetPhysicalDeviceImageFormatProperties2(physical_device, p_image_format_info,
		p_image_format_properties)
}

fn C.vkGetPhysicalDeviceQueueFamilyProperties2(C.PhysicalDevice,
	&u32,
	&QueueFamilyProperties2)
pub fn get_physical_device_queue_family_properties2(physical_device C.PhysicalDevice,
	p_queue_family_property_count &u32,
	p_queue_family_properties &QueueFamilyProperties2) {
	C.vkGetPhysicalDeviceQueueFamilyProperties2(physical_device, p_queue_family_property_count,
		p_queue_family_properties)
}

fn C.vkGetPhysicalDeviceMemoryProperties2(C.PhysicalDevice,
	&PhysicalDeviceMemoryProperties2)
pub fn get_physical_device_memory_properties2(physical_device C.PhysicalDevice,
	p_memory_properties &PhysicalDeviceMemoryProperties2) {
	C.vkGetPhysicalDeviceMemoryProperties2(physical_device, p_memory_properties)
}

fn C.vkGetPhysicalDeviceSparseImageFormatProperties2(C.PhysicalDevice,
	&PhysicalDeviceSparseImageFormatInfo2,
	&u32,
	&SparseImageFormatProperties2)
pub fn get_physical_device_sparse_image_format_properties2(physical_device C.PhysicalDevice,
	p_format_info &PhysicalDeviceSparseImageFormatInfo2,
	p_property_count &u32,
	p_properties &SparseImageFormatProperties2) {
	C.vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device, p_format_info,
		p_property_count, p_properties)
}

fn C.vkTrimCommandPool(C.Device,
	C.CommandPool,
	CommandPoolTrimFlags)
pub fn trim_command_pool(device C.Device,
	command_pool C.CommandPool,
	flags CommandPoolTrimFlags) {
	C.vkTrimCommandPool(device, command_pool, flags)
}

fn C.vkGetDeviceQueue2(C.Device,
	&DeviceQueueInfo2,
	&C.Queue)
pub fn get_device_queue2(device C.Device,
	p_queue_info &DeviceQueueInfo2,
	p_queue &C.Queue) {
	C.vkGetDeviceQueue2(device, p_queue_info, p_queue)
}

fn C.vkCreateSamplerYcbcrConversion(C.Device,
	&SamplerYcbcrConversionCreateInfo,
	&AllocationCallbacks,
	&C.SamplerYcbcrConversion) Result
pub fn create_sampler_ycbcr_conversion(device C.Device,
	p_create_info &SamplerYcbcrConversionCreateInfo,
	p_allocator &AllocationCallbacks,
	p_ycbcr_conversion &C.SamplerYcbcrConversion) Result {
	return C.vkCreateSamplerYcbcrConversion(device, p_create_info, p_allocator, p_ycbcr_conversion)
}

fn C.vkDestroySamplerYcbcrConversion(C.Device,
	C.SamplerYcbcrConversion,
	&AllocationCallbacks)
pub fn destroy_sampler_ycbcr_conversion(device C.Device,
	ycbcr_conversion C.SamplerYcbcrConversion,
	p_allocator &AllocationCallbacks) {
	C.vkDestroySamplerYcbcrConversion(device, ycbcr_conversion, p_allocator)
}

fn C.vkCreateDescriptorUpdateTemplate(C.Device,
	&DescriptorUpdateTemplateCreateInfo,
	&AllocationCallbacks,
	&C.DescriptorUpdateTemplate) Result
pub fn create_descriptor_update_template(device C.Device,
	p_create_info &DescriptorUpdateTemplateCreateInfo,
	p_allocator &AllocationCallbacks,
	p_descriptor_update_template &C.DescriptorUpdateTemplate) Result {
	return C.vkCreateDescriptorUpdateTemplate(device, p_create_info, p_allocator, p_descriptor_update_template)
}

fn C.vkDestroyDescriptorUpdateTemplate(C.Device,
	C.DescriptorUpdateTemplate,
	&AllocationCallbacks)
pub fn destroy_descriptor_update_template(device C.Device,
	descriptor_update_template C.DescriptorUpdateTemplate,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDescriptorUpdateTemplate(device, descriptor_update_template, p_allocator)
}

fn C.vkUpdateDescriptorSetWithTemplate(C.Device,
	C.DescriptorSet,
	C.DescriptorUpdateTemplate,
	voidptr)
pub fn update_descriptor_set_with_template(device C.Device,
	descriptor_set C.DescriptorSet,
	descriptor_update_template C.DescriptorUpdateTemplate,
	p_data voidptr) {
	C.vkUpdateDescriptorSetWithTemplate(device, descriptor_set, descriptor_update_template,
		p_data)
}

fn C.vkGetPhysicalDeviceExternalBufferProperties(C.PhysicalDevice,
	&PhysicalDeviceExternalBufferInfo,
	&ExternalBufferProperties)
pub fn get_physical_device_external_buffer_properties(physical_device C.PhysicalDevice,
	p_external_buffer_info &PhysicalDeviceExternalBufferInfo,
	p_external_buffer_properties &ExternalBufferProperties) {
	C.vkGetPhysicalDeviceExternalBufferProperties(physical_device, p_external_buffer_info,
		p_external_buffer_properties)
}

fn C.vkGetPhysicalDeviceExternalFenceProperties(C.PhysicalDevice,
	&PhysicalDeviceExternalFenceInfo,
	&ExternalFenceProperties)
pub fn get_physical_device_external_fence_properties(physical_device C.PhysicalDevice,
	p_external_fence_info &PhysicalDeviceExternalFenceInfo,
	p_external_fence_properties &ExternalFenceProperties) {
	C.vkGetPhysicalDeviceExternalFenceProperties(physical_device, p_external_fence_info,
		p_external_fence_properties)
}

fn C.vkGetPhysicalDeviceExternalSemaphoreProperties(C.PhysicalDevice,
	&PhysicalDeviceExternalSemaphoreInfo,
	&ExternalSemaphoreProperties)
pub fn get_physical_device_external_semaphore_properties(physical_device C.PhysicalDevice,
	p_external_semaphore_info &PhysicalDeviceExternalSemaphoreInfo,
	p_external_semaphore_properties &ExternalSemaphoreProperties) {
	C.vkGetPhysicalDeviceExternalSemaphoreProperties(physical_device, p_external_semaphore_info,
		p_external_semaphore_properties)
}

fn C.vkGetDescriptorSetLayoutSupport(C.Device,
	&DescriptorSetLayoutCreateInfo,
	&DescriptorSetLayoutSupport)
pub fn get_descriptor_set_layout_support(device C.Device,
	p_create_info &DescriptorSetLayoutCreateInfo,
	p_support &DescriptorSetLayoutSupport) {
	C.vkGetDescriptorSetLayoutSupport(device, p_create_info, p_support)
}

// Vulkan 1.2 version number
pub const api_version_1_2 = make_api_version(0, 1, 2, 0) // Patch version should always be set to 0

pub const max_driver_name_size = u32(256)
pub const max_driver_info_size = u32(256)

pub enum DriverId {
	driver_id_amd_proprietary              = int(1)
	driver_id_amd_open_source              = int(2)
	driver_id_mesa_radv                    = int(3)
	driver_id_nvidia_proprietary           = int(4)
	driver_id_intel_proprietary_windows    = int(5)
	driver_id_intel_open_source_mesa       = int(6)
	driver_id_imagination_proprietary      = int(7)
	driver_id_qualcomm_proprietary         = int(8)
	driver_id_arm_proprietary              = int(9)
	driver_id_google_swiftshader           = int(10)
	driver_id_ggp_proprietary              = int(11)
	driver_id_broadcom_proprietary         = int(12)
	driver_id_mesa_llvmpipe                = int(13)
	driver_id_moltenvk                     = int(14)
	driver_id_coreavi_proprietary          = int(15)
	driver_id_juice_proprietary            = int(16)
	driver_id_verisilicon_proprietary      = int(17)
	driver_id_mesa_turnip                  = int(18)
	driver_id_mesa_v3dv                    = int(19)
	driver_id_mesa_panvk                   = int(20)
	driver_id_samsung_proprietary          = int(21)
	driver_id_mesa_venus                   = int(22)
	driver_id_mesa_dozen                   = int(23)
	driver_id_mesa_nvk                     = int(24)
	driver_id_imagination_open_source_mesa = int(25)
	driver_id_mesa_honeykrisp              = int(26)
	driver_id_reserved27                   = int(27)
	driver_id_max_enum                     = int(0x7FFFFFFF)
}

pub enum ShaderFloatControlsIndependence {
	shader_float_controls_independence32_bit_only = int(0)
	shader_float_controls_independence_all        = int(1)
	shader_float_controls_independence_none       = int(2)
	shader_float_controls_independence_max_enum   = int(0x7FFFFFFF)
}

pub enum SamplerReductionMode {
	sampler_reduction_mode_weighted_average                 = int(0)
	sampler_reduction_mode_min                              = int(1)
	sampler_reduction_mode_max                              = int(2)
	sampler_reduction_mode_weighted_average_rangeclamp_qcom = int(1000521000)
	sampler_reduction_mode_max_enum                         = int(0x7FFFFFFF)
}

pub enum SemaphoreType {
	semaphore_type_binary   = int(0)
	semaphore_type_timeline = int(1)
	semaphore_type_max_enum = int(0x7FFFFFFF)
}

pub enum ResolveModeFlagBits {
	resolve_mode_none                               = int(0)
	resolve_mode_sample_zero_bit                    = int(0x00000001)
	resolve_mode_average_bit                        = int(0x00000002)
	resolve_mode_min_bit                            = int(0x00000004)
	resolve_mode_max_bit                            = int(0x00000008)
	resolve_mode_external_format_downsample_android = int(0x00000010)
	resolve_mode_flag_bits_max_enum                 = int(0x7FFFFFFF)
}

pub type ResolveModeFlags = u32

pub enum DescriptorBindingFlagBits {
	descriptor_binding_update_after_bind_bit           = int(0x00000001)
	descriptor_binding_update_unused_while_pending_bit = int(0x00000002)
	descriptor_binding_partially_bound_bit             = int(0x00000004)
	descriptor_binding_variable_descriptor_count_bit   = int(0x00000008)
	descriptor_binding_flag_bits_max_enum              = int(0x7FFFFFFF)
}

pub type DescriptorBindingFlags = u32

pub enum SemaphoreWaitFlagBits {
	semaphore_wait_any_bit            = int(0x00000001)
	semaphore_wait_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type SemaphoreWaitFlags = u32

pub struct PhysicalDeviceVulkan11Features {
pub mut:
	s_type                                  StructureType
	p_next                                  voidptr
	storage_buffer16_bit_access             Bool32
	uniform_and_storage_buffer16_bit_access Bool32
	storage_push_constant16                 Bool32
	storage_input_output16                  Bool32
	multiview                               Bool32
	multiview_geometry_shader               Bool32
	multiview_tessellation_shader           Bool32
	variable_pointers_storage_buffer        Bool32
	variable_pointers                       Bool32
	protected_memory                        Bool32
	sampler_ycbcr_conversion                Bool32
	shader_draw_parameters                  Bool32
}

pub struct PhysicalDeviceVulkan11Properties {
pub mut:
	s_type                                 StructureType
	p_next                                 voidptr
	device_uuid                            [uuid_size]u8
	driver_uuid                            [uuid_size]u8
	device_luid                            [luid_size]u8
	device_node_mask                       u32
	device_luid_valid                      Bool32
	subgroup_size                          u32
	subgroup_supported_stages              ShaderStageFlags
	subgroup_supported_operations          SubgroupFeatureFlags
	subgroup_quad_operations_in_all_stages Bool32
	point_clipping_behavior                PointClippingBehavior
	max_multiview_view_count               u32
	max_multiview_instance_index           u32
	protected_no_fault                     Bool32
	max_per_set_descriptors                u32
	max_memory_allocation_size             DeviceSize
}

pub struct PhysicalDeviceVulkan12Features {
pub mut:
	s_type                                                    StructureType
	p_next                                                    voidptr
	sampler_mirror_clamp_to_edge                              Bool32
	draw_indirect_count                                       Bool32
	storage_buffer8_bit_access                                Bool32
	uniform_and_storage_buffer8_bit_access                    Bool32
	storage_push_constant8                                    Bool32
	shader_buffer_int64_atomics                               Bool32
	shader_shared_int64_atomics                               Bool32
	shader_float16                                            Bool32
	shader_int8                                               Bool32
	descriptor_indexing                                       Bool32
	shader_input_attachment_array_dynamic_indexing            Bool32
	shader_uniform_texel_buffer_array_dynamic_indexing        Bool32
	shader_storage_texel_buffer_array_dynamic_indexing        Bool32
	shader_uniform_buffer_array_non_uniform_indexing          Bool32
	shader_sampled_image_array_non_uniform_indexing           Bool32
	shader_storage_buffer_array_non_uniform_indexing          Bool32
	shader_storage_image_array_non_uniform_indexing           Bool32
	shader_input_attachment_array_non_uniform_indexing        Bool32
	shader_uniform_texel_buffer_array_non_uniform_indexing    Bool32
	shader_storage_texel_buffer_array_non_uniform_indexing    Bool32
	descriptor_binding_uniform_buffer_update_after_bind       Bool32
	descriptor_binding_sampled_image_update_after_bind        Bool32
	descriptor_binding_storage_image_update_after_bind        Bool32
	descriptor_binding_storage_buffer_update_after_bind       Bool32
	descriptor_binding_uniform_texel_buffer_update_after_bind Bool32
	descriptor_binding_storage_texel_buffer_update_after_bind Bool32
	descriptor_binding_update_unused_while_pending            Bool32
	descriptor_binding_partially_bound                        Bool32
	descriptor_binding_variable_descriptor_count              Bool32
	runtime_descriptor_array                                  Bool32
	sampler_filter_minmax                                     Bool32
	scalar_block_layout                                       Bool32
	imageless_framebuffer                                     Bool32
	uniform_buffer_standard_layout                            Bool32
	shader_subgroup_extended_types                            Bool32
	separate_depth_stencil_layouts                            Bool32
	host_query_reset                                          Bool32
	timeline_semaphore                                        Bool32
	buffer_device_address                                     Bool32
	buffer_device_address_capture_replay                      Bool32
	buffer_device_address_multi_device                        Bool32
	vulkan_memory_model                                       Bool32
	vulkan_memory_model_device_scope                          Bool32
	vulkan_memory_model_availability_visibility_chains        Bool32
	shader_output_viewport_index                              Bool32
	shader_output_layer                                       Bool32
	subgroup_broadcast_dynamic_id                             Bool32
}

pub struct ConformanceVersion {
pub mut:
	major    u8
	minor    u8
	subminor u8
	patch    u8
}

pub struct PhysicalDeviceVulkan12Properties {
pub mut:
	s_type                                                       StructureType
	p_next                                                       voidptr
	driver_id                                                    DriverId
	driver_name                                                  [max_driver_name_size]char
	driver_info                                                  [max_driver_info_size]char
	conformance_version                                          ConformanceVersion
	denorm_behavior_independence                                 ShaderFloatControlsIndependence
	rounding_mode_independence                                   ShaderFloatControlsIndependence
	shader_signed_zero_inf_nan_preserve_float16                  Bool32
	shader_signed_zero_inf_nan_preserve_float32                  Bool32
	shader_signed_zero_inf_nan_preserve_float64                  Bool32
	shader_denorm_preserve_float16                               Bool32
	shader_denorm_preserve_float32                               Bool32
	shader_denorm_preserve_float64                               Bool32
	shader_denorm_flush_to_zero_float16                          Bool32
	shader_denorm_flush_to_zero_float32                          Bool32
	shader_denorm_flush_to_zero_float64                          Bool32
	shader_rounding_mode_rte_float16                             Bool32
	shader_rounding_mode_rte_float32                             Bool32
	shader_rounding_mode_rte_float64                             Bool32
	shader_rounding_mode_rtz_float16                             Bool32
	shader_rounding_mode_rtz_float32                             Bool32
	shader_rounding_mode_rtz_float64                             Bool32
	max_update_after_bind_descriptors_in_all_pools               u32
	shader_uniform_buffer_array_non_uniform_indexing_native      Bool32
	shader_sampled_image_array_non_uniform_indexing_native       Bool32
	shader_storage_buffer_array_non_uniform_indexing_native      Bool32
	shader_storage_image_array_non_uniform_indexing_native       Bool32
	shader_input_attachment_array_non_uniform_indexing_native    Bool32
	robust_buffer_access_update_after_bind                       Bool32
	quad_divergent_implicit_lod                                  Bool32
	max_per_stage_descriptor_update_after_bind_samplers          u32
	max_per_stage_descriptor_update_after_bind_uniform_buffers   u32
	max_per_stage_descriptor_update_after_bind_storage_buffers   u32
	max_per_stage_descriptor_update_after_bind_sampled_images    u32
	max_per_stage_descriptor_update_after_bind_storage_images    u32
	max_per_stage_descriptor_update_after_bind_input_attachments u32
	max_per_stage_update_after_bind_resources                    u32
	max_descriptor_set_update_after_bind_samplers                u32
	max_descriptor_set_update_after_bind_uniform_buffers         u32
	max_descriptor_set_update_after_bind_uniform_buffers_dynamic u32
	max_descriptor_set_update_after_bind_storage_buffers         u32
	max_descriptor_set_update_after_bind_storage_buffers_dynamic u32
	max_descriptor_set_update_after_bind_sampled_images          u32
	max_descriptor_set_update_after_bind_storage_images          u32
	max_descriptor_set_update_after_bind_input_attachments       u32
	supported_depth_resolve_modes                                ResolveModeFlags
	supported_stencil_resolve_modes                              ResolveModeFlags
	independent_resolve_none                                     Bool32
	independent_resolve                                          Bool32
	filter_minmax_single_component_formats                       Bool32
	filter_minmax_image_component_mapping                        Bool32
	max_timeline_semaphore_value_difference                      u64
	framebuffer_integer_color_sample_counts                      SampleCountFlags
}

pub struct ImageFormatListCreateInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_image_format_list_create_info
	p_next            voidptr
	view_format_count u32
	p_view_formats    &Format
}

pub struct AttachmentDescription2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_attachment_description2
	p_next           voidptr
	flags            AttachmentDescriptionFlags
	format           Format
	samples          SampleCountFlagBits
	load_op          AttachmentLoadOp
	store_op         AttachmentStoreOp
	stencil_load_op  AttachmentLoadOp
	stencil_store_op AttachmentStoreOp
	initial_layout   ImageLayout
	final_layout     ImageLayout
}

pub struct AttachmentReference2 {
pub mut:
	s_type      StructureType = StructureType.structure_type_attachment_reference2
	p_next      voidptr
	attachment  u32
	layout      ImageLayout
	aspect_mask ImageAspectFlags
}

pub struct SubpassDescription2 {
pub mut:
	s_type                     StructureType = StructureType.structure_type_subpass_description2
	p_next                     voidptr
	flags                      SubpassDescriptionFlags
	pipeline_bind_point        PipelineBindPoint
	view_mask                  u32
	input_attachment_count     u32
	p_input_attachments        &AttachmentReference2
	color_attachment_count     u32
	p_color_attachments        &AttachmentReference2
	p_resolve_attachments      &AttachmentReference2
	p_depth_stencil_attachment &AttachmentReference2
	preserve_attachment_count  u32
	p_preserve_attachments     &u32
}

pub struct SubpassDependency2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_subpass_dependency2
	p_next           voidptr
	src_subpass      u32
	dst_subpass      u32
	src_stage_mask   PipelineStageFlags
	dst_stage_mask   PipelineStageFlags
	src_access_mask  AccessFlags
	dst_access_mask  AccessFlags
	dependency_flags DependencyFlags
	view_offset      i32
}

pub struct RenderPassCreateInfo2 {
pub mut:
	s_type                     StructureType = StructureType.structure_type_render_pass_create_info2
	p_next                     voidptr
	flags                      RenderPassCreateFlags
	attachment_count           u32
	p_attachments              &AttachmentDescription2
	subpass_count              u32
	p_subpasses                &SubpassDescription2
	dependency_count           u32
	p_dependencies             &SubpassDependency2
	correlated_view_mask_count u32
	p_correlated_view_masks    &u32
}

pub struct SubpassBeginInfo {
pub mut:
	s_type   StructureType = StructureType.structure_type_subpass_begin_info
	p_next   voidptr
	contents SubpassContents
}

pub struct SubpassEndInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_subpass_end_info
	p_next voidptr
}

pub struct PhysicalDevice8BitStorageFeatures {
pub mut:
	s_type                                 StructureType
	p_next                                 voidptr
	storage_buffer8_bit_access             Bool32
	uniform_and_storage_buffer8_bit_access Bool32
	storage_push_constant8                 Bool32
}

pub struct PhysicalDeviceDriverProperties {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_driver_properties
	p_next              voidptr
	driver_id           DriverId
	driver_name         [max_driver_name_size]char
	driver_info         [max_driver_info_size]char
	conformance_version ConformanceVersion
}

pub struct PhysicalDeviceShaderAtomicInt64Features {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_shader_atomic_int64_features
	p_next                      voidptr
	shader_buffer_int64_atomics Bool32
	shader_shared_int64_atomics Bool32
}

pub struct PhysicalDeviceShaderFloat16Int8Features {
pub mut:
	s_type         StructureType = StructureType.structure_type_physical_device_shader_float16_int8_features
	p_next         voidptr
	shader_float16 Bool32
	shader_int8    Bool32
}

pub struct PhysicalDeviceFloatControlsProperties {
pub mut:
	s_type                                      StructureType = StructureType.structure_type_physical_device_float_controls_properties
	p_next                                      voidptr
	denorm_behavior_independence                ShaderFloatControlsIndependence
	rounding_mode_independence                  ShaderFloatControlsIndependence
	shader_signed_zero_inf_nan_preserve_float16 Bool32
	shader_signed_zero_inf_nan_preserve_float32 Bool32
	shader_signed_zero_inf_nan_preserve_float64 Bool32
	shader_denorm_preserve_float16              Bool32
	shader_denorm_preserve_float32              Bool32
	shader_denorm_preserve_float64              Bool32
	shader_denorm_flush_to_zero_float16         Bool32
	shader_denorm_flush_to_zero_float32         Bool32
	shader_denorm_flush_to_zero_float64         Bool32
	shader_rounding_mode_rte_float16            Bool32
	shader_rounding_mode_rte_float32            Bool32
	shader_rounding_mode_rte_float64            Bool32
	shader_rounding_mode_rtz_float16            Bool32
	shader_rounding_mode_rtz_float32            Bool32
	shader_rounding_mode_rtz_float64            Bool32
}

pub struct DescriptorSetLayoutBindingFlagsCreateInfo {
pub mut:
	s_type          StructureType = StructureType.structure_type_descriptor_set_layout_binding_flags_create_info
	p_next          voidptr
	binding_count   u32
	p_binding_flags &DescriptorBindingFlags
}

pub struct PhysicalDeviceDescriptorIndexingFeatures {
pub mut:
	s_type                                                    StructureType = StructureType.structure_type_physical_device_descriptor_indexing_features
	p_next                                                    voidptr
	shader_input_attachment_array_dynamic_indexing            Bool32
	shader_uniform_texel_buffer_array_dynamic_indexing        Bool32
	shader_storage_texel_buffer_array_dynamic_indexing        Bool32
	shader_uniform_buffer_array_non_uniform_indexing          Bool32
	shader_sampled_image_array_non_uniform_indexing           Bool32
	shader_storage_buffer_array_non_uniform_indexing          Bool32
	shader_storage_image_array_non_uniform_indexing           Bool32
	shader_input_attachment_array_non_uniform_indexing        Bool32
	shader_uniform_texel_buffer_array_non_uniform_indexing    Bool32
	shader_storage_texel_buffer_array_non_uniform_indexing    Bool32
	descriptor_binding_uniform_buffer_update_after_bind       Bool32
	descriptor_binding_sampled_image_update_after_bind        Bool32
	descriptor_binding_storage_image_update_after_bind        Bool32
	descriptor_binding_storage_buffer_update_after_bind       Bool32
	descriptor_binding_uniform_texel_buffer_update_after_bind Bool32
	descriptor_binding_storage_texel_buffer_update_after_bind Bool32
	descriptor_binding_update_unused_while_pending            Bool32
	descriptor_binding_partially_bound                        Bool32
	descriptor_binding_variable_descriptor_count              Bool32
	runtime_descriptor_array                                  Bool32
}

pub struct PhysicalDeviceDescriptorIndexingProperties {
pub mut:
	s_type                                                       StructureType = StructureType.structure_type_physical_device_descriptor_indexing_properties
	p_next                                                       voidptr
	max_update_after_bind_descriptors_in_all_pools               u32
	shader_uniform_buffer_array_non_uniform_indexing_native      Bool32
	shader_sampled_image_array_non_uniform_indexing_native       Bool32
	shader_storage_buffer_array_non_uniform_indexing_native      Bool32
	shader_storage_image_array_non_uniform_indexing_native       Bool32
	shader_input_attachment_array_non_uniform_indexing_native    Bool32
	robust_buffer_access_update_after_bind                       Bool32
	quad_divergent_implicit_lod                                  Bool32
	max_per_stage_descriptor_update_after_bind_samplers          u32
	max_per_stage_descriptor_update_after_bind_uniform_buffers   u32
	max_per_stage_descriptor_update_after_bind_storage_buffers   u32
	max_per_stage_descriptor_update_after_bind_sampled_images    u32
	max_per_stage_descriptor_update_after_bind_storage_images    u32
	max_per_stage_descriptor_update_after_bind_input_attachments u32
	max_per_stage_update_after_bind_resources                    u32
	max_descriptor_set_update_after_bind_samplers                u32
	max_descriptor_set_update_after_bind_uniform_buffers         u32
	max_descriptor_set_update_after_bind_uniform_buffers_dynamic u32
	max_descriptor_set_update_after_bind_storage_buffers         u32
	max_descriptor_set_update_after_bind_storage_buffers_dynamic u32
	max_descriptor_set_update_after_bind_sampled_images          u32
	max_descriptor_set_update_after_bind_storage_images          u32
	max_descriptor_set_update_after_bind_input_attachments       u32
}

pub struct DescriptorSetVariableDescriptorCountAllocateInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_descriptor_set_variable_descriptor_count_allocate_info
	p_next               voidptr
	descriptor_set_count u32
	p_descriptor_counts  &u32
}

pub struct DescriptorSetVariableDescriptorCountLayoutSupport {
pub mut:
	s_type                        StructureType = StructureType.structure_type_descriptor_set_variable_descriptor_count_layout_support
	p_next                        voidptr
	max_variable_descriptor_count u32
}

pub struct SubpassDescriptionDepthStencilResolve {
pub mut:
	s_type                             StructureType = StructureType.structure_type_subpass_description_depth_stencil_resolve
	p_next                             voidptr
	depth_resolve_mode                 ResolveModeFlagBits
	stencil_resolve_mode               ResolveModeFlagBits
	p_depth_stencil_resolve_attachment &AttachmentReference2
}

pub struct PhysicalDeviceDepthStencilResolveProperties {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_depth_stencil_resolve_properties
	p_next                          voidptr
	supported_depth_resolve_modes   ResolveModeFlags
	supported_stencil_resolve_modes ResolveModeFlags
	independent_resolve_none        Bool32
	independent_resolve             Bool32
}

pub struct PhysicalDeviceScalarBlockLayoutFeatures {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_scalar_block_layout_features
	p_next              voidptr
	scalar_block_layout Bool32
}

pub struct ImageStencilUsageCreateInfo {
pub mut:
	s_type        StructureType = StructureType.structure_type_image_stencil_usage_create_info
	p_next        voidptr
	stencil_usage ImageUsageFlags
}

pub struct SamplerReductionModeCreateInfo {
pub mut:
	s_type         StructureType = StructureType.structure_type_sampler_reduction_mode_create_info
	p_next         voidptr
	reduction_mode SamplerReductionMode
}

pub struct PhysicalDeviceSamplerFilterMinmaxProperties {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_physical_device_sampler_filter_minmax_properties
	p_next                                 voidptr
	filter_minmax_single_component_formats Bool32
	filter_minmax_image_component_mapping  Bool32
}

pub struct PhysicalDeviceVulkanMemoryModelFeatures {
pub mut:
	s_type                                             StructureType = StructureType.structure_type_physical_device_vulkan_memory_model_features
	p_next                                             voidptr
	vulkan_memory_model                                Bool32
	vulkan_memory_model_device_scope                   Bool32
	vulkan_memory_model_availability_visibility_chains Bool32
}

pub struct PhysicalDeviceImagelessFramebufferFeatures {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_imageless_framebuffer_features
	p_next                voidptr
	imageless_framebuffer Bool32
}

pub struct FramebufferAttachmentImageInfo {
pub mut:
	s_type            StructureType = StructureType.structure_type_framebuffer_attachment_image_info
	p_next            voidptr
	flags             ImageCreateFlags
	usage             ImageUsageFlags
	width             u32
	height            u32
	layer_count       u32
	view_format_count u32
	p_view_formats    &Format
}

pub struct FramebufferAttachmentsCreateInfo {
pub mut:
	s_type                      StructureType = StructureType.structure_type_framebuffer_attachments_create_info
	p_next                      voidptr
	attachment_image_info_count u32
	p_attachment_image_infos    &FramebufferAttachmentImageInfo
}

pub struct RenderPassAttachmentBeginInfo {
pub mut:
	s_type           StructureType = StructureType.structure_type_render_pass_attachment_begin_info
	p_next           voidptr
	attachment_count u32
	p_attachments    &C.ImageView
}

pub struct PhysicalDeviceUniformBufferStandardLayoutFeatures {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_uniform_buffer_standard_layout_features
	p_next                         voidptr
	uniform_buffer_standard_layout Bool32
}

pub struct PhysicalDeviceShaderSubgroupExtendedTypesFeatures {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_shader_subgroup_extended_types_features
	p_next                         voidptr
	shader_subgroup_extended_types Bool32
}

pub struct PhysicalDeviceSeparateDepthStencilLayoutsFeatures {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_separate_depth_stencil_layouts_features
	p_next                         voidptr
	separate_depth_stencil_layouts Bool32
}

pub struct AttachmentReferenceStencilLayout {
pub mut:
	s_type         StructureType = StructureType.structure_type_attachment_reference_stencil_layout
	p_next         voidptr
	stencil_layout ImageLayout
}

pub struct AttachmentDescriptionStencilLayout {
pub mut:
	s_type                 StructureType = StructureType.structure_type_attachment_description_stencil_layout
	p_next                 voidptr
	stencil_initial_layout ImageLayout
	stencil_final_layout   ImageLayout
}

pub struct PhysicalDeviceHostQueryResetFeatures {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_host_query_reset_features
	p_next           voidptr
	host_query_reset Bool32
}

pub struct PhysicalDeviceTimelineSemaphoreFeatures {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_timeline_semaphore_features
	p_next             voidptr
	timeline_semaphore Bool32
}

pub struct PhysicalDeviceTimelineSemaphoreProperties {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_timeline_semaphore_properties
	p_next                                  voidptr
	max_timeline_semaphore_value_difference u64
}

pub struct SemaphoreTypeCreateInfo {
pub mut:
	s_type         StructureType = StructureType.structure_type_semaphore_type_create_info
	p_next         voidptr
	semaphore_type SemaphoreType
	initial_value  u64
}

pub struct TimelineSemaphoreSubmitInfo {
pub mut:
	s_type                       StructureType = StructureType.structure_type_timeline_semaphore_submit_info
	p_next                       voidptr
	wait_semaphore_value_count   u32
	p_wait_semaphore_values      &u64
	signal_semaphore_value_count u32
	p_signal_semaphore_values    &u64
}

pub struct SemaphoreWaitInfo {
pub mut:
	s_type          StructureType = StructureType.structure_type_semaphore_wait_info
	p_next          voidptr
	flags           SemaphoreWaitFlags
	semaphore_count u32
	p_semaphores    &C.Semaphore
	p_values        &u64
}

pub struct SemaphoreSignalInfo {
pub mut:
	s_type    StructureType = StructureType.structure_type_semaphore_signal_info
	p_next    voidptr
	semaphore C.Semaphore
	value     u64
}

pub struct PhysicalDeviceBufferDeviceAddressFeatures {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_buffer_device_address_features
	p_next                               voidptr
	buffer_device_address                Bool32
	buffer_device_address_capture_replay Bool32
	buffer_device_address_multi_device   Bool32
}

pub struct BufferDeviceAddressInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_buffer_device_address_info
	p_next voidptr
	buffer C.Buffer
}

pub struct BufferOpaqueCaptureAddressCreateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_buffer_opaque_capture_address_create_info
	p_next                 voidptr
	opaque_capture_address u64
}

pub struct MemoryOpaqueCaptureAddressAllocateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_memory_opaque_capture_address_allocate_info
	p_next                 voidptr
	opaque_capture_address u64
}

pub struct DeviceMemoryOpaqueCaptureAddressInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_device_memory_opaque_capture_address_info
	p_next voidptr
	memory C.DeviceMemory
}

fn C.vkCmdDrawIndirectCount(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_indirect_count(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	count_buffer C.Buffer,
	count_buffer_offset DeviceSize,
	max_draw_count u32,
	stride u32) {
	C.vkCmdDrawIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset,
		max_draw_count, stride)
}

fn C.vkCmdDrawIndexedIndirectCount(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_indexed_indirect_count(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	count_buffer C.Buffer,
	count_buffer_offset DeviceSize,
	max_draw_count u32,
	stride u32) {
	C.vkCmdDrawIndexedIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset,
		max_draw_count, stride)
}

fn C.vkCreateRenderPass2(C.Device,
	&RenderPassCreateInfo2,
	&AllocationCallbacks,
	&C.RenderPass) Result
pub fn create_render_pass2(device C.Device,
	p_create_info &RenderPassCreateInfo2,
	p_allocator &AllocationCallbacks,
	p_render_pass &C.RenderPass) Result {
	return C.vkCreateRenderPass2(device, p_create_info, p_allocator, p_render_pass)
}

fn C.vkCmdBeginRenderPass2(C.CommandBuffer,
	&RenderPassBeginInfo,
	&SubpassBeginInfo)
pub fn cmd_begin_render_pass2(command_buffer C.CommandBuffer,
	p_render_pass_begin &RenderPassBeginInfo,
	p_subpass_begin_info &SubpassBeginInfo) {
	C.vkCmdBeginRenderPass2(command_buffer, p_render_pass_begin, p_subpass_begin_info)
}

fn C.vkCmdNextSubpass2(C.CommandBuffer,
	&SubpassBeginInfo,
	&SubpassEndInfo)
pub fn cmd_next_subpass2(command_buffer C.CommandBuffer,
	p_subpass_begin_info &SubpassBeginInfo,
	p_subpass_end_info &SubpassEndInfo) {
	C.vkCmdNextSubpass2(command_buffer, p_subpass_begin_info, p_subpass_end_info)
}

fn C.vkCmdEndRenderPass2(C.CommandBuffer,
	&SubpassEndInfo)
pub fn cmd_end_render_pass2(command_buffer C.CommandBuffer,
	p_subpass_end_info &SubpassEndInfo) {
	C.vkCmdEndRenderPass2(command_buffer, p_subpass_end_info)
}

fn C.vkResetQueryPool(C.Device,
	C.QueryPool,
	u32,
	u32)
pub fn reset_query_pool(device C.Device,
	query_pool C.QueryPool,
	first_query u32,
	query_count u32) {
	C.vkResetQueryPool(device, query_pool, first_query, query_count)
}

fn C.vkGetSemaphoreCounterValue(C.Device,
	C.Semaphore,
	&u64) Result
pub fn get_semaphore_counter_value(device C.Device,
	semaphore C.Semaphore,
	p_value &u64) Result {
	return C.vkGetSemaphoreCounterValue(device, semaphore, p_value)
}

fn C.vkWaitSemaphores(C.Device,
	&SemaphoreWaitInfo,
	u64) Result
pub fn wait_semaphores(device C.Device,
	p_wait_info &SemaphoreWaitInfo,
	timeout u64) Result {
	return C.vkWaitSemaphores(device, p_wait_info, timeout)
}

fn C.vkSignalSemaphore(C.Device,
	&SemaphoreSignalInfo) Result
pub fn signal_semaphore(device C.Device,
	p_signal_info &SemaphoreSignalInfo) Result {
	return C.vkSignalSemaphore(device, p_signal_info)
}

fn C.vkGetBufferDeviceAddress(C.Device,
	&BufferDeviceAddressInfo) DeviceAddress
pub fn get_buffer_device_address(device C.Device,
	p_info &BufferDeviceAddressInfo) DeviceAddress {
	return C.vkGetBufferDeviceAddress(device, p_info)
}

fn C.vkGetBufferOpaqueCaptureAddress(C.Device,
	&BufferDeviceAddressInfo) u64
pub fn get_buffer_opaque_capture_address(device C.Device,
	p_info &BufferDeviceAddressInfo) u64 {
	return C.vkGetBufferOpaqueCaptureAddress(device, p_info)
}

fn C.vkGetDeviceMemoryOpaqueCaptureAddress(C.Device,
	&DeviceMemoryOpaqueCaptureAddressInfo) u64
pub fn get_device_memory_opaque_capture_address(device C.Device,
	p_info &DeviceMemoryOpaqueCaptureAddressInfo) u64 {
	return C.vkGetDeviceMemoryOpaqueCaptureAddress(device, p_info)
}

// Vulkan 1.3 version number
pub const api_version_1_3 = make_api_version(0, 1, 3, 0) // Patch version should always be set to 0

pub type Flags64 = u64
pub type C.PrivateDataSlot = voidptr

pub enum PipelineCreationFeedbackFlagBits {
	pipeline_creation_feedback_valid_bit                          = int(0x00000001)
	pipeline_creation_feedback_application_pipeline_cache_hit_bit = int(0x00000002)
	pipeline_creation_feedback_base_pipeline_acceleration_bit     = int(0x00000004)
	pipeline_creation_feedback_flag_bits_max_enum                 = int(0x7FFFFFFF)
}

pub type PipelineCreationFeedbackFlags = u32

pub enum ToolPurposeFlagBits {
	tool_purpose_validation_bit          = int(0x00000001)
	tool_purpose_profiling_bit           = int(0x00000002)
	tool_purpose_tracing_bit             = int(0x00000004)
	tool_purpose_additional_features_bit = int(0x00000008)
	tool_purpose_modifying_features_bit  = int(0x00000010)
	tool_purpose_debug_reporting_bit_ext = int(0x00000020)
	tool_purpose_debug_markers_bit_ext   = int(0x00000040)
	tool_purpose_flag_bits_max_enum      = int(0x7FFFFFFF)
}

pub type ToolPurposeFlags = u32
pub type PrivateDataSlotCreateFlags = u32
pub type PipelineStageFlags2 = u64

// Flag bits for PipelineStageFlagBits2
pub type PipelineStageFlagBits2 = u64

pub const pipeline_stage_2_none = u64(0)
pub const pipeline_stage_2_none_khr = pipeline_stage_2_none
pub const pipeline_stage_2_top_of_pipe_bit = u64(0x00000001)
pub const pipeline_stage_2_top_of_pipe_bit_khr = pipeline_stage_2_top_of_pipe_bit
pub const pipeline_stage_2_draw_indirect_bit = u64(0x00000002)
pub const pipeline_stage_2_draw_indirect_bit_khr = pipeline_stage_2_draw_indirect_bit
pub const pipeline_stage_2_vertex_input_bit = u64(0x00000004)
pub const pipeline_stage_2_vertex_input_bit_khr = u32(pipeline_stage_2_vertex_input_bit)
pub const pipeline_stage_2_vertex_shader_bit = u64(0x00000008)
pub const pipeline_stage_2_vertex_shader_bit_khr = pipeline_stage_2_vertex_shader_bit
pub const pipeline_stage_2_tessellation_control_shader_bit = u64(0x00000010)
pub const pipeline_stage_2_tessellation_control_shader_bit_khr = pipeline_stage_2_tessellation_control_shader_bit
pub const pipeline_stage_2_tessellation_evaluation_shader_bit = u64(0x00000020)
pub const pipeline_stage_2_tessellation_evaluation_shader_bit_khr = u32(pipeline_stage_2_tessellation_evaluation_shader_bit)
pub const pipeline_stage_2_geometry_shader_bit = u64(0x00000040)
pub const pipeline_stage_2_geometry_shader_bit_khr = pipeline_stage_2_geometry_shader_bit
pub const pipeline_stage_2_fragment_shader_bit = u64(0x00000080)
pub const pipeline_stage_2_fragment_shader_bit_khr = pipeline_stage_2_fragment_shader_bit
pub const pipeline_stage_2_early_fragment_tests_bit = u64(0x00000100)
pub const pipeline_stage_2_early_fragment_tests_bit_khr = pipeline_stage_2_early_fragment_tests_bit
pub const pipeline_stage_2_late_fragment_tests_bit = u64(0x00000200)
pub const pipeline_stage_2_late_fragment_tests_bit_khr = pipeline_stage_2_late_fragment_tests_bit
pub const pipeline_stage_2_color_attachment_output_bit = u64(0x00000400)
pub const pipeline_stage_2_color_attachment_output_bit_khr = u32(pipeline_stage_2_color_attachment_output_bit)
pub const pipeline_stage_2_compute_shader_bit = u64(0x00000800)
pub const pipeline_stage_2_compute_shader_bit_khr = u32(pipeline_stage_2_compute_shader_bit)
pub const pipeline_stage_2_all_transfer_bit = u64(0x00001000)
pub const pipeline_stage_2_all_transfer_bit_khr = pipeline_stage_2_all_transfer_bit
pub const pipeline_stage_2_transfer_bit = pipeline_stage_2_all_transfer_bit_khr
pub const pipeline_stage_2_transfer_bit_khr = pipeline_stage_2_all_transfer_bit
pub const pipeline_stage_2_bottom_of_pipe_bit = u64(0x00002000)
pub const pipeline_stage_2_bottom_of_pipe_bit_khr = pipeline_stage_2_bottom_of_pipe_bit
pub const pipeline_stage_2_host_bit = u64(0x00004000)
pub const pipeline_stage_2_host_bit_khr = pipeline_stage_2_host_bit
pub const pipeline_stage_2_all_graphics_bit = u64(0x00008000)
pub const pipeline_stage_2_all_graphics_bit_khr = pipeline_stage_2_all_graphics_bit
pub const pipeline_stage_2_all_commands_bit = u64(0x00010000)
pub const pipeline_stage_2_all_commands_bit_khr = pipeline_stage_2_all_commands_bit
pub const pipeline_stage_2_copy_bit = u64(0x100000000)
pub const pipeline_stage_2_copy_bit_khr = pipeline_stage_2_copy_bit
pub const pipeline_stage_2_resolve_bit = u64(0x200000000)
pub const pipeline_stage_2_resolve_bit_khr = pipeline_stage_2_resolve_bit
pub const pipeline_stage_2_blit_bit = u64(0x400000000)
pub const pipeline_stage_2_blit_bit_khr = pipeline_stage_2_blit_bit
pub const pipeline_stage_2_clear_bit = u64(0x800000000)
pub const pipeline_stage_2_clear_bit_khr = pipeline_stage_2_clear_bit
pub const pipeline_stage_2_index_input_bit = u64(0x1000000000)
pub const pipeline_stage_2_index_input_bit_khr = u32(pipeline_stage_2_index_input_bit)
pub const pipeline_stage_2_vertex_attribute_input_bit = u64(0x2000000000)
pub const pipeline_stage_2_vertex_attribute_input_bit_khr = u32(pipeline_stage_2_vertex_attribute_input_bit)
pub const pipeline_stage_2_pre_rasterization_shaders_bit = u64(0x4000000000)
pub const pipeline_stage_2_pre_rasterization_shaders_bit_khr = pipeline_stage_2_pre_rasterization_shaders_bit
pub const pipeline_stage_2_video_decode_bit_khr = u64(0x04000000)
pub const pipeline_stage_2_video_encode_bit_khr = u64(0x08000000)
pub const pipeline_stage_2_transform_feedback_bit_ext = u64(0x01000000)
pub const pipeline_stage_2_conditional_rendering_bit_ext = u64(0x00040000)
pub const pipeline_stage_2_command_preprocess_bit_nv = u64(0x00020000)
pub const pipeline_stage_2_command_preprocess_bit_ext = pipeline_stage_2_command_preprocess_bit_nv
pub const pipeline_stage_2_fragment_shading_rate_attachment_bit_khr = u64(0x00400000)
pub const pipeline_stage_2_shading_rate_image_bit_nv = pipeline_stage_2_fragment_shading_rate_attachment_bit_khr
pub const pipeline_stage_2_acceleration_structure_build_bit_khr = u64(0x02000000)
pub const pipeline_stage_2_ray_tracing_shader_bit_khr = u64(0x00200000)
pub const pipeline_stage_2_ray_tracing_shader_bit_nv = pipeline_stage_2_ray_tracing_shader_bit_khr
pub const pipeline_stage_2_acceleration_structure_build_bit_nv = u32(pipeline_stage_2_acceleration_structure_build_bit_khr)
pub const pipeline_stage_2_fragment_density_process_bit_ext = u64(0x00800000)
pub const pipeline_stage_2_task_shader_bit_nv = pipeline_stage_2_task_shader_bit_ext
pub const pipeline_stage_2_mesh_shader_bit_nv = pipeline_stage_2_mesh_shader_bit_ext
pub const pipeline_stage_2_task_shader_bit_ext = u64(0x00080000)
pub const pipeline_stage_2_mesh_shader_bit_ext = u64(0x00100000)
pub const pipeline_stage_2_subpass_shader_bit_huawei = u64(0x8000000000)
// VK_PIPELINE_STAGE_2_SUBPASS_SHADING_BIT_HUAWEI is a deprecated alias
pub const pipeline_stage_2_subpass_shading_bit_huawei = u32(pipeline_stage_2_subpass_shader_bit_huawei)
pub const pipeline_stage_2_invocation_mask_bit_huawei = u64(0x10000000000)
pub const pipeline_stage_2_acceleration_structure_copy_bit_khr = u64(0x10000000)
pub const pipeline_stage_2_micromap_build_bit_ext = u64(0x40000000)
pub const pipeline_stage_2_cluster_culling_shader_bit_huawei = u64(0x20000000000)
pub const pipeline_stage_2_optical_flow_bit_nv = u64(0x20000000)

pub type AccessFlags2 = u64

// Flag bits for AccessFlagBits2
pub type AccessFlagBits2 = u64

pub const access_2_none = u64(0)
pub const access_2_none_khr = access_2_none
pub const access_2_indirect_command_read_bit = u64(0x00000001)
pub const access_2_indirect_command_read_bit_khr = access_2_indirect_command_read_bit
pub const access_2_index_read_bit = u64(0x00000002)
pub const access_2_index_read_bit_khr = access_2_index_read_bit
pub const access_2_vertex_attribute_read_bit = u64(0x00000004)
pub const access_2_vertex_attribute_read_bit_khr = u32(access_2_vertex_attribute_read_bit)
pub const access_2_uniform_read_bit = u64(0x00000008)
pub const access_2_uniform_read_bit_khr = u32(access_2_uniform_read_bit)
pub const access_2_input_attachment_read_bit = u64(0x00000010)
pub const access_2_input_attachment_read_bit_khr = u32(access_2_input_attachment_read_bit)
pub const access_2_shader_read_bit = u64(0x00000020)
pub const access_2_shader_read_bit_khr = access_2_shader_read_bit
pub const access_2_shader_write_bit = u64(0x00000040)
pub const access_2_shader_write_bit_khr = access_2_shader_write_bit
pub const access_2_color_attachment_read_bit = u64(0x00000080)
pub const access_2_color_attachment_read_bit_khr = access_2_color_attachment_read_bit
pub const access_2_color_attachment_write_bit = u64(0x00000100)
pub const access_2_color_attachment_write_bit_khr = access_2_color_attachment_write_bit
pub const access_2_depth_stencil_attachment_read_bit = u64(0x00000200)
pub const access_2_depth_stencil_attachment_read_bit_khr = access_2_depth_stencil_attachment_read_bit
pub const access_2_depth_stencil_attachment_write_bit = u64(0x00000400)
pub const access_2_depth_stencil_attachment_write_bit_khr = access_2_depth_stencil_attachment_write_bit
pub const access_2_transfer_read_bit = u64(0x00000800)
pub const access_2_transfer_read_bit_khr = access_2_transfer_read_bit
pub const access_2_transfer_write_bit = u64(0x00001000)
pub const access_2_transfer_write_bit_khr = access_2_transfer_write_bit
pub const access_2_host_read_bit = u64(0x00002000)
pub const access_2_host_read_bit_khr = access_2_host_read_bit
pub const access_2_host_write_bit = u64(0x00004000)
pub const access_2_host_write_bit_khr = access_2_host_write_bit
pub const access_2_memory_read_bit = u64(0x00008000)
pub const access_2_memory_read_bit_khr = access_2_memory_read_bit
pub const access_2_memory_write_bit = u64(0x00010000)
pub const access_2_memory_write_bit_khr = access_2_memory_write_bit
pub const access_2_shader_sampled_read_bit = u64(0x100000000)
pub const access_2_shader_sampled_read_bit_khr = access_2_shader_sampled_read_bit
pub const access_2_shader_storage_read_bit = u64(0x200000000)
pub const access_2_shader_storage_read_bit_khr = access_2_shader_storage_read_bit
pub const access_2_shader_storage_write_bit = u64(0x400000000)
pub const access_2_shader_storage_write_bit_khr = access_2_shader_storage_write_bit
pub const access_2_video_decode_read_bit_khr = u64(0x800000000)
pub const access_2_video_decode_write_bit_khr = u64(0x1000000000)
pub const access_2_video_encode_read_bit_khr = u64(0x2000000000)
pub const access_2_video_encode_write_bit_khr = u64(0x4000000000)
pub const access_2_transform_feedback_write_bit_ext = u64(0x02000000)
pub const access_2_transform_feedback_counter_read_bit_ext = u64(0x04000000)
pub const access_2_transform_feedback_counter_write_bit_ext = u64(0x08000000)
pub const access_2_conditional_rendering_read_bit_ext = u64(0x00100000)
pub const access_2_command_preprocess_read_bit_nv = u64(0x00020000)
pub const access_2_command_preprocess_write_bit_nv = u64(0x00040000)
pub const access_2_command_preprocess_read_bit_ext = access_2_command_preprocess_read_bit_nv
pub const access_2_command_preprocess_write_bit_ext = access_2_command_preprocess_write_bit_nv
pub const access_2_fragment_shading_rate_attachment_read_bit_khr = u64(0x00800000)
pub const access_2_shading_rate_image_read_bit_nv = access_2_fragment_shading_rate_attachment_read_bit_khr
pub const access_2_acceleration_structure_read_bit_khr = u64(0x00200000)
pub const access_2_acceleration_structure_write_bit_khr = u64(0x00400000)
pub const access_2_acceleration_structure_read_bit_nv = u32(access_2_acceleration_structure_read_bit_khr)
pub const access_2_acceleration_structure_write_bit_nv = u32(access_2_acceleration_structure_write_bit_khr)
pub const access_2_fragment_density_map_read_bit_ext = u64(0x01000000)
pub const access_2_color_attachment_read_noncoherent_bit_ext = u64(0x00080000)
pub const access_2_descriptor_buffer_read_bit_ext = u64(0x20000000000)
pub const access_2_invocation_mask_read_bit_huawei = u64(0x8000000000)
pub const access_2_shader_binding_table_read_bit_khr = u64(0x10000000000)
pub const access_2_micromap_read_bit_ext = u64(0x100000000000)
pub const access_2_micromap_write_bit_ext = u64(0x200000000000)
pub const access_2_optical_flow_read_bit_nv = u64(0x40000000000)
pub const access_2_optical_flow_write_bit_nv = u64(0x80000000000)

pub enum SubmitFlagBits {
	submit_protected_bit      = int(0x00000001)
	submit_flag_bits_max_enum = int(0x7FFFFFFF)
}

pub type SubmitFlags = u32

pub enum RenderingFlagBits {
	rendering_contents_secondary_command_buffers_bit = int(0x00000001)
	rendering_suspending_bit                         = int(0x00000002)
	rendering_resuming_bit                           = int(0x00000004)
	rendering_enable_legacy_dithering_bit_ext        = int(0x00000008)
	rendering_contents_inline_bit_khr                = int(0x00000010)
	rendering_flag_bits_max_enum                     = int(0x7FFFFFFF)
}

pub type RenderingFlags = u32
pub type FormatFeatureFlags2 = u64

// Flag bits for FormatFeatureFlagBits2
pub type FormatFeatureFlagBits2 = u64

pub const format_feature_2_sampled_image_bit = u64(0x00000001)
pub const format_feature_2_sampled_image_bit_khr = u32(format_feature_2_sampled_image_bit)
pub const format_feature_2_storage_image_bit = u64(0x00000002)
pub const format_feature_2_storage_image_bit_khr = u32(format_feature_2_storage_image_bit)
pub const format_feature_2_storage_image_atomic_bit = u64(0x00000004)
pub const format_feature_2_storage_image_atomic_bit_khr = u32(format_feature_2_storage_image_atomic_bit)
pub const format_feature_2_uniform_texel_buffer_bit = u64(0x00000008)
pub const format_feature_2_uniform_texel_buffer_bit_khr = u32(format_feature_2_uniform_texel_buffer_bit)
pub const format_feature_2_storage_texel_buffer_bit = u64(0x00000010)
pub const format_feature_2_storage_texel_buffer_bit_khr = u32(format_feature_2_storage_texel_buffer_bit)
pub const format_feature_2_storage_texel_buffer_atomic_bit = u64(0x00000020)
pub const format_feature_2_storage_texel_buffer_atomic_bit_khr = u32(format_feature_2_storage_texel_buffer_atomic_bit)
pub const format_feature_2_vertex_buffer_bit = u64(0x00000040)
pub const format_feature_2_vertex_buffer_bit_khr = u32(format_feature_2_vertex_buffer_bit)
pub const format_feature_2_color_attachment_bit = u64(0x00000080)
pub const format_feature_2_color_attachment_bit_khr = u32(format_feature_2_color_attachment_bit)
pub const format_feature_2_color_attachment_blend_bit = u64(0x00000100)
pub const format_feature_2_color_attachment_blend_bit_khr = u32(format_feature_2_color_attachment_blend_bit)
pub const format_feature_2_depth_stencil_attachment_bit = u64(0x00000200)
pub const format_feature_2_depth_stencil_attachment_bit_khr = u32(format_feature_2_depth_stencil_attachment_bit)
pub const format_feature_2_blit_src_bit = u64(0x00000400)
pub const format_feature_2_blit_src_bit_khr = u32(format_feature_2_blit_src_bit)
pub const format_feature_2_blit_dst_bit = u64(0x00000800)
pub const format_feature_2_blit_dst_bit_khr = u32(format_feature_2_blit_dst_bit)
pub const format_feature_2_sampled_image_filter_linear_bit = u64(0x00001000)
pub const format_feature_2_sampled_image_filter_linear_bit_khr = u32(format_feature_2_sampled_image_filter_linear_bit)
pub const format_feature_2_sampled_image_filter_cubic_bit = u64(0x00002000)
pub const format_feature_2_sampled_image_filter_cubic_bit_ext = u32(format_feature_2_sampled_image_filter_cubic_bit)
pub const format_feature_2_transfer_src_bit = u64(0x00004000)
pub const format_feature_2_transfer_src_bit_khr = u32(format_feature_2_transfer_src_bit)
pub const format_feature_2_transfer_dst_bit = u64(0x00008000)
pub const format_feature_2_transfer_dst_bit_khr = u32(format_feature_2_transfer_dst_bit)
pub const format_feature_2_sampled_image_filter_minmax_bit = u64(0x00010000)
pub const format_feature_2_sampled_image_filter_minmax_bit_khr = u32(format_feature_2_sampled_image_filter_minmax_bit)
pub const format_feature_2_midpoint_chroma_samples_bit = u64(0x00020000)
pub const format_feature_2_midpoint_chroma_samples_bit_khr = u32(format_feature_2_midpoint_chroma_samples_bit)
pub const format_feature_2_sampled_image_ycbcr_conversion_linear_filter_bit = u64(0x00040000)
pub const format_feature_2_sampled_image_ycbcr_conversion_linear_filter_bit_khr = u32(format_feature_2_sampled_image_ycbcr_conversion_linear_filter_bit)
pub const format_feature_2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit = u64(0x00080000)
pub const format_feature_2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr = u32(format_feature_2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit)
pub const format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit = u64(0x00100000)
pub const format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr = u32(format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit)
pub const format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit = u64(0x00200000)
pub const format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr = u32(format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit)
pub const format_feature_2_disjoint_bit = u64(0x00400000)
pub const format_feature_2_disjoint_bit_khr = u32(format_feature_2_disjoint_bit)
pub const format_feature_2_cosited_chroma_samples_bit = u64(0x00800000)
pub const format_feature_2_cosited_chroma_samples_bit_khr = u32(format_feature_2_cosited_chroma_samples_bit)
pub const format_feature_2_storage_read_without_format_bit = u64(0x80000000)
pub const format_feature_2_storage_read_without_format_bit_khr = u32(format_feature_2_storage_read_without_format_bit)
pub const format_feature_2_storage_write_without_format_bit = u64(0x100000000)
pub const format_feature_2_storage_write_without_format_bit_khr = u32(format_feature_2_storage_write_without_format_bit)
pub const format_feature_2_sampled_image_depth_comparison_bit = u64(0x200000000)
pub const format_feature_2_sampled_image_depth_comparison_bit_khr = u32(format_feature_2_sampled_image_depth_comparison_bit)
pub const format_feature_2_video_decode_output_bit_khr = u64(0x02000000)
pub const format_feature_2_video_decode_dpb_bit_khr = u64(0x04000000)
pub const format_feature_2_acceleration_structure_vertex_buffer_bit_khr = u64(0x20000000)
pub const format_feature_2_fragment_density_map_bit_ext = u64(0x01000000)
pub const format_feature_2_fragment_shading_rate_attachment_bit_khr = u64(0x40000000)
pub const format_feature_2_host_image_transfer_bit_ext = u64(0x400000000000)
pub const format_feature_2_video_encode_input_bit_khr = u64(0x08000000)
pub const format_feature_2_video_encode_dpb_bit_khr = u64(0x10000000)
pub const format_feature_2_linear_color_attachment_bit_nv = u64(0x4000000000)
pub const format_feature_2_weight_image_bit_qcom = u64(0x400000000)
pub const format_feature_2_weight_sampled_image_bit_qcom = u64(0x800000000)
pub const format_feature_2_block_matching_bit_qcom = u64(0x1000000000)
pub const format_feature_2_box_filter_sampled_bit_qcom = u64(0x2000000000)
pub const format_feature_2_optical_flow_image_bit_nv = u64(0x10000000000)
pub const format_feature_2_optical_flow_vector_bit_nv = u64(0x20000000000)
pub const format_feature_2_optical_flow_cost_bit_nv = u64(0x40000000000)
pub const format_feature_2_video_encode_quantization_delta_map_bit_khr = u64(0x2000000000000)
pub const format_feature_2_video_encode_emphasis_map_bit_khr = u64(0x4000000000000)

pub struct PhysicalDeviceVulkan13Features {
pub mut:
	s_type                                                    StructureType
	p_next                                                    voidptr
	robust_image_access                                       Bool32
	inline_uniform_block                                      Bool32
	descriptor_binding_inline_uniform_block_update_after_bind Bool32
	pipeline_creation_cache_control                           Bool32
	private_data                                              Bool32
	shader_demote_to_helper_invocation                        Bool32
	shader_terminate_invocation                               Bool32
	subgroup_size_control                                     Bool32
	compute_full_subgroups                                    Bool32
	synchronization2                                          Bool32
	texture_compression_astc_hdr                              Bool32
	shader_zero_initialize_workgroup_memory                   Bool32
	dynamic_rendering                                         Bool32
	shader_integer_dot_product                                Bool32
	maintenance4                                              Bool32
}

pub struct PhysicalDeviceVulkan13Properties {
pub mut:
	s_type                                                                                 StructureType
	p_next                                                                                 voidptr
	min_subgroup_size                                                                      u32
	max_subgroup_size                                                                      u32
	max_compute_workgroup_subgroups                                                        u32
	required_subgroup_size_stages                                                          ShaderStageFlags
	max_inline_uniform_block_size                                                          u32
	max_per_stage_descriptor_inline_uniform_blocks                                         u32
	max_per_stage_descriptor_update_after_bind_inline_uniform_blocks                       u32
	max_descriptor_set_inline_uniform_blocks                                               u32
	max_descriptor_set_update_after_bind_inline_uniform_blocks                             u32
	max_inline_uniform_total_size                                                          u32
	integer_dot_product8_bit_unsigned_accelerated                                          Bool32
	integer_dot_product8_bit_signed_accelerated                                            Bool32
	integer_dot_product8_bit_mixed_signedness_accelerated                                  Bool32
	integer_dot_product4x8_bit_packed_unsigned_accelerated                                 Bool32
	integer_dot_product4x8_bit_packed_signed_accelerated                                   Bool32
	integer_dot_product4x8_bit_packed_mixed_signedness_accelerated                         Bool32
	integer_dot_product16_bit_unsigned_accelerated                                         Bool32
	integer_dot_product16_bit_signed_accelerated                                           Bool32
	integer_dot_product16_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product32_bit_unsigned_accelerated                                         Bool32
	integer_dot_product32_bit_signed_accelerated                                           Bool32
	integer_dot_product32_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product64_bit_unsigned_accelerated                                         Bool32
	integer_dot_product64_bit_signed_accelerated                                           Bool32
	integer_dot_product64_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product_accumulating_saturating8_bit_unsigned_accelerated                  Bool32
	integer_dot_product_accumulating_saturating8_bit_signed_accelerated                    Bool32
	integer_dot_product_accumulating_saturating8_bit_mixed_signedness_accelerated          Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_unsigned_accelerated         Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_signed_accelerated           Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_mixed_signedness_accelerated Bool32
	integer_dot_product_accumulating_saturating16_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating16_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating16_bit_mixed_signedness_accelerated         Bool32
	integer_dot_product_accumulating_saturating32_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating32_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating32_bit_mixed_signedness_accelerated         Bool32
	integer_dot_product_accumulating_saturating64_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating64_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating64_bit_mixed_signedness_accelerated         Bool32
	storage_texel_buffer_offset_alignment_bytes                                            DeviceSize
	storage_texel_buffer_offset_single_texel_alignment                                     Bool32
	uniform_texel_buffer_offset_alignment_bytes                                            DeviceSize
	uniform_texel_buffer_offset_single_texel_alignment                                     Bool32
	max_buffer_size                                                                        DeviceSize
}

pub struct PipelineCreationFeedback {
pub mut:
	flags    PipelineCreationFeedbackFlags
	duration u64
}

pub struct PipelineCreationFeedbackCreateInfo {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_pipeline_creation_feedback_create_info
	p_next                                 voidptr
	p_pipeline_creation_feedback           &PipelineCreationFeedback
	pipeline_stage_creation_feedback_count u32
	p_pipeline_stage_creation_feedbacks    &PipelineCreationFeedback
}

pub struct PhysicalDeviceShaderTerminateInvocationFeatures {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_shader_terminate_invocation_features
	p_next                      voidptr
	shader_terminate_invocation Bool32
}

pub struct PhysicalDeviceToolProperties {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_tool_properties
	p_next      voidptr
	name        [max_extension_name_size]char
	version     [max_extension_name_size]char
	purposes    ToolPurposeFlags
	description [max_description_size]char
	layer       [max_extension_name_size]char
}

pub struct PhysicalDeviceShaderDemoteToHelperInvocationFeatures {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_shader_demote_to_helper_invocation_features
	p_next                             voidptr
	shader_demote_to_helper_invocation Bool32
}

pub struct PhysicalDevicePrivateDataFeatures {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_private_data_features
	p_next       voidptr
	private_data Bool32
}

pub struct DevicePrivateDataCreateInfo {
pub mut:
	s_type                          StructureType = StructureType.structure_type_device_private_data_create_info
	p_next                          voidptr
	private_data_slot_request_count u32
}

pub struct PrivateDataSlotCreateInfo {
pub mut:
	s_type StructureType = StructureType.structure_type_private_data_slot_create_info
	p_next voidptr
	flags  PrivateDataSlotCreateFlags
}

pub struct PhysicalDevicePipelineCreationCacheControlFeatures {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_pipeline_creation_cache_control_features
	p_next                          voidptr
	pipeline_creation_cache_control Bool32
}

pub struct MemoryBarrier2 {
pub mut:
	s_type          StructureType = StructureType.structure_type_memory_barrier2
	p_next          voidptr
	src_stage_mask  PipelineStageFlags2
	src_access_mask AccessFlags2
	dst_stage_mask  PipelineStageFlags2
	dst_access_mask AccessFlags2
}

pub struct BufferMemoryBarrier2 {
pub mut:
	s_type                 StructureType = StructureType.structure_type_buffer_memory_barrier2
	p_next                 voidptr
	src_stage_mask         PipelineStageFlags2
	src_access_mask        AccessFlags2
	dst_stage_mask         PipelineStageFlags2
	dst_access_mask        AccessFlags2
	src_queue_family_index u32
	dst_queue_family_index u32
	buffer                 C.Buffer
	offset                 DeviceSize
	size                   DeviceSize
}

pub struct ImageMemoryBarrier2 {
pub mut:
	s_type                 StructureType = StructureType.structure_type_image_memory_barrier2
	p_next                 voidptr
	src_stage_mask         PipelineStageFlags2
	src_access_mask        AccessFlags2
	dst_stage_mask         PipelineStageFlags2
	dst_access_mask        AccessFlags2
	old_layout             ImageLayout
	new_layout             ImageLayout
	src_queue_family_index u32
	dst_queue_family_index u32
	image                  C.Image
	subresource_range      ImageSubresourceRange
}

pub struct DependencyInfo {
pub mut:
	s_type                      StructureType = StructureType.structure_type_dependency_info
	p_next                      voidptr
	dependency_flags            DependencyFlags
	memory_barrier_count        u32
	p_memory_barriers           &MemoryBarrier2
	buffer_memory_barrier_count u32
	p_buffer_memory_barriers    &BufferMemoryBarrier2
	image_memory_barrier_count  u32
	p_image_memory_barriers     &ImageMemoryBarrier2
}

pub struct SemaphoreSubmitInfo {
pub mut:
	s_type       StructureType = StructureType.structure_type_semaphore_submit_info
	p_next       voidptr
	semaphore    C.Semaphore
	value        u64
	stage_mask   PipelineStageFlags2
	device_index u32
}

pub struct CommandBufferSubmitInfo {
pub mut:
	s_type         StructureType = StructureType.structure_type_command_buffer_submit_info
	p_next         voidptr
	command_buffer C.CommandBuffer
	device_mask    u32
}

pub struct SubmitInfo2 {
pub mut:
	s_type                      StructureType = StructureType.structure_type_submit_info2
	p_next                      voidptr
	flags                       SubmitFlags
	wait_semaphore_info_count   u32
	p_wait_semaphore_infos      &SemaphoreSubmitInfo
	command_buffer_info_count   u32
	p_command_buffer_infos      &CommandBufferSubmitInfo
	signal_semaphore_info_count u32
	p_signal_semaphore_infos    &SemaphoreSubmitInfo
}

pub struct PhysicalDeviceSynchronization2Features {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_synchronization2_features
	p_next           voidptr
	synchronization2 Bool32
}

pub struct PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_zero_initialize_workgroup_memory_features
	p_next                                  voidptr
	shader_zero_initialize_workgroup_memory Bool32
}

pub struct PhysicalDeviceImageRobustnessFeatures {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_image_robustness_features
	p_next              voidptr
	robust_image_access Bool32
}

pub struct BufferCopy2 {
pub mut:
	s_type     StructureType = StructureType.structure_type_buffer_copy2
	p_next     voidptr
	src_offset DeviceSize
	dst_offset DeviceSize
	size       DeviceSize
}

pub struct CopyBufferInfo2 {
pub mut:
	s_type       StructureType = StructureType.structure_type_copy_buffer_info2
	p_next       voidptr
	src_buffer   C.Buffer
	dst_buffer   C.Buffer
	region_count u32
	p_regions    &BufferCopy2
}

pub struct ImageCopy2 {
pub mut:
	s_type          StructureType = StructureType.structure_type_image_copy2
	p_next          voidptr
	src_subresource ImageSubresourceLayers
	src_offset      Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offset      Offset3D
	extent          Extent3D
}

pub struct CopyImageInfo2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_image_info2
	p_next           voidptr
	src_image        C.Image
	src_image_layout ImageLayout
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &ImageCopy2
}

pub struct BufferImageCopy2 {
pub mut:
	s_type              StructureType = StructureType.structure_type_buffer_image_copy2
	p_next              voidptr
	buffer_offset       DeviceSize
	buffer_row_length   u32
	buffer_image_height u32
	image_subresource   ImageSubresourceLayers
	image_offset        Offset3D
	image_extent        Extent3D
}

pub struct CopyBufferToImageInfo2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_buffer_to_image_info2
	p_next           voidptr
	src_buffer       C.Buffer
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &BufferImageCopy2
}

pub struct CopyImageToBufferInfo2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_image_to_buffer_info2
	p_next           voidptr
	src_image        C.Image
	src_image_layout ImageLayout
	dst_buffer       C.Buffer
	region_count     u32
	p_regions        &BufferImageCopy2
}

pub struct ImageBlit2 {
pub mut:
	s_type          StructureType = StructureType.structure_type_image_blit2
	p_next          voidptr
	src_subresource ImageSubresourceLayers
	src_offsets     [2]Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offsets     [2]Offset3D
}

pub struct BlitImageInfo2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_blit_image_info2
	p_next           voidptr
	src_image        C.Image
	src_image_layout ImageLayout
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &ImageBlit2
	filter           Filter
}

pub struct ImageResolve2 {
pub mut:
	s_type          StructureType = StructureType.structure_type_image_resolve2
	p_next          voidptr
	src_subresource ImageSubresourceLayers
	src_offset      Offset3D
	dst_subresource ImageSubresourceLayers
	dst_offset      Offset3D
	extent          Extent3D
}

pub struct ResolveImageInfo2 {
pub mut:
	s_type           StructureType = StructureType.structure_type_resolve_image_info2
	p_next           voidptr
	src_image        C.Image
	src_image_layout ImageLayout
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &ImageResolve2
}

pub struct PhysicalDeviceSubgroupSizeControlFeatures {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_subgroup_size_control_features
	p_next                 voidptr
	subgroup_size_control  Bool32
	compute_full_subgroups Bool32
}

pub struct PhysicalDeviceSubgroupSizeControlProperties {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_subgroup_size_control_properties
	p_next                          voidptr
	min_subgroup_size               u32
	max_subgroup_size               u32
	max_compute_workgroup_subgroups u32
	required_subgroup_size_stages   ShaderStageFlags
}

pub struct PipelineShaderStageRequiredSubgroupSizeCreateInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_pipeline_shader_stage_required_subgroup_size_create_info
	p_next                 voidptr
	required_subgroup_size u32
}

pub struct PhysicalDeviceInlineUniformBlockFeatures {
pub mut:
	s_type                                                    StructureType = StructureType.structure_type_physical_device_inline_uniform_block_features
	p_next                                                    voidptr
	inline_uniform_block                                      Bool32
	descriptor_binding_inline_uniform_block_update_after_bind Bool32
}

pub struct PhysicalDeviceInlineUniformBlockProperties {
pub mut:
	s_type                                                           StructureType = StructureType.structure_type_physical_device_inline_uniform_block_properties
	p_next                                                           voidptr
	max_inline_uniform_block_size                                    u32
	max_per_stage_descriptor_inline_uniform_blocks                   u32
	max_per_stage_descriptor_update_after_bind_inline_uniform_blocks u32
	max_descriptor_set_inline_uniform_blocks                         u32
	max_descriptor_set_update_after_bind_inline_uniform_blocks       u32
}

pub struct WriteDescriptorSetInlineUniformBlock {
pub mut:
	s_type    StructureType = StructureType.structure_type_write_descriptor_set_inline_uniform_block
	p_next    voidptr
	data_size u32
	p_data    voidptr
}

pub struct DescriptorPoolInlineUniformBlockCreateInfo {
pub mut:
	s_type                            StructureType = StructureType.structure_type_descriptor_pool_inline_uniform_block_create_info
	p_next                            voidptr
	max_inline_uniform_block_bindings u32
}

pub struct PhysicalDeviceTextureCompressionASTCHDRFeatures {
pub mut:
	s_type                       StructureType
	p_next                       voidptr
	texture_compression_astc_hdr Bool32
}

pub struct RenderingAttachmentInfo {
pub mut:
	s_type               StructureType = StructureType.structure_type_rendering_attachment_info
	p_next               voidptr
	image_view           C.ImageView
	image_layout         ImageLayout
	resolve_mode         ResolveModeFlagBits
	resolve_image_view   C.ImageView
	resolve_image_layout ImageLayout
	load_op              AttachmentLoadOp
	store_op             AttachmentStoreOp
	clear_value          ClearValue
}

pub struct RenderingInfo {
pub mut:
	s_type                 StructureType = StructureType.structure_type_rendering_info
	p_next                 voidptr
	flags                  RenderingFlags
	render_area            Rect2D
	layer_count            u32
	view_mask              u32
	color_attachment_count u32
	p_color_attachments    &RenderingAttachmentInfo
	p_depth_attachment     &RenderingAttachmentInfo
	p_stencil_attachment   &RenderingAttachmentInfo
}

pub struct PipelineRenderingCreateInfo {
pub mut:
	s_type                     StructureType = StructureType.structure_type_pipeline_rendering_create_info
	p_next                     voidptr
	view_mask                  u32
	color_attachment_count     u32
	p_color_attachment_formats &Format
	depth_attachment_format    Format
	stencil_attachment_format  Format
}

pub struct PhysicalDeviceDynamicRenderingFeatures {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_dynamic_rendering_features
	p_next            voidptr
	dynamic_rendering Bool32
}

pub struct CommandBufferInheritanceRenderingInfo {
pub mut:
	s_type                     StructureType = StructureType.structure_type_command_buffer_inheritance_rendering_info
	p_next                     voidptr
	flags                      RenderingFlags
	view_mask                  u32
	color_attachment_count     u32
	p_color_attachment_formats &Format
	depth_attachment_format    Format
	stencil_attachment_format  Format
	rasterization_samples      SampleCountFlagBits
}

pub struct PhysicalDeviceShaderIntegerDotProductFeatures {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_shader_integer_dot_product_features
	p_next                     voidptr
	shader_integer_dot_product Bool32
}

pub struct PhysicalDeviceShaderIntegerDotProductProperties {
pub mut:
	s_type                                                                                 StructureType = StructureType.structure_type_physical_device_shader_integer_dot_product_properties
	p_next                                                                                 voidptr
	integer_dot_product8_bit_unsigned_accelerated                                          Bool32
	integer_dot_product8_bit_signed_accelerated                                            Bool32
	integer_dot_product8_bit_mixed_signedness_accelerated                                  Bool32
	integer_dot_product4x8_bit_packed_unsigned_accelerated                                 Bool32
	integer_dot_product4x8_bit_packed_signed_accelerated                                   Bool32
	integer_dot_product4x8_bit_packed_mixed_signedness_accelerated                         Bool32
	integer_dot_product16_bit_unsigned_accelerated                                         Bool32
	integer_dot_product16_bit_signed_accelerated                                           Bool32
	integer_dot_product16_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product32_bit_unsigned_accelerated                                         Bool32
	integer_dot_product32_bit_signed_accelerated                                           Bool32
	integer_dot_product32_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product64_bit_unsigned_accelerated                                         Bool32
	integer_dot_product64_bit_signed_accelerated                                           Bool32
	integer_dot_product64_bit_mixed_signedness_accelerated                                 Bool32
	integer_dot_product_accumulating_saturating8_bit_unsigned_accelerated                  Bool32
	integer_dot_product_accumulating_saturating8_bit_signed_accelerated                    Bool32
	integer_dot_product_accumulating_saturating8_bit_mixed_signedness_accelerated          Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_unsigned_accelerated         Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_signed_accelerated           Bool32
	integer_dot_product_accumulating_saturating4x8_bit_packed_mixed_signedness_accelerated Bool32
	integer_dot_product_accumulating_saturating16_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating16_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating16_bit_mixed_signedness_accelerated         Bool32
	integer_dot_product_accumulating_saturating32_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating32_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating32_bit_mixed_signedness_accelerated         Bool32
	integer_dot_product_accumulating_saturating64_bit_unsigned_accelerated                 Bool32
	integer_dot_product_accumulating_saturating64_bit_signed_accelerated                   Bool32
	integer_dot_product_accumulating_saturating64_bit_mixed_signedness_accelerated         Bool32
}

pub struct PhysicalDeviceTexelBufferAlignmentProperties {
pub mut:
	s_type                                             StructureType = StructureType.structure_type_physical_device_texel_buffer_alignment_properties
	p_next                                             voidptr
	storage_texel_buffer_offset_alignment_bytes        DeviceSize
	storage_texel_buffer_offset_single_texel_alignment Bool32
	uniform_texel_buffer_offset_alignment_bytes        DeviceSize
	uniform_texel_buffer_offset_single_texel_alignment Bool32
}

pub struct FormatProperties3 {
pub mut:
	s_type                  StructureType = StructureType.structure_type_format_properties3
	p_next                  voidptr
	linear_tiling_features  FormatFeatureFlags2
	optimal_tiling_features FormatFeatureFlags2
	buffer_features         FormatFeatureFlags2
}

pub struct PhysicalDeviceMaintenance4Features {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_maintenance4_features
	p_next       voidptr
	maintenance4 Bool32
}

pub struct PhysicalDeviceMaintenance4Properties {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_maintenance4_properties
	p_next          voidptr
	max_buffer_size DeviceSize
}

pub struct DeviceBufferMemoryRequirements {
pub mut:
	s_type        StructureType = StructureType.structure_type_device_buffer_memory_requirements
	p_next        voidptr
	p_create_info &BufferCreateInfo
}

pub struct DeviceImageMemoryRequirements {
pub mut:
	s_type        StructureType = StructureType.structure_type_device_image_memory_requirements
	p_next        voidptr
	p_create_info &ImageCreateInfo
	plane_aspect  ImageAspectFlagBits
}

fn C.vkGetPhysicalDeviceToolProperties(C.PhysicalDevice,
	&u32,
	&PhysicalDeviceToolProperties) Result
pub fn get_physical_device_tool_properties(physical_device C.PhysicalDevice,
	p_tool_count &u32,
	p_tool_properties &PhysicalDeviceToolProperties) Result {
	return C.vkGetPhysicalDeviceToolProperties(physical_device, p_tool_count, p_tool_properties)
}

fn C.vkCreatePrivateDataSlot(C.Device,
	&PrivateDataSlotCreateInfo,
	&AllocationCallbacks,
	&C.PrivateDataSlot) Result
pub fn create_private_data_slot(device C.Device,
	p_create_info &PrivateDataSlotCreateInfo,
	p_allocator &AllocationCallbacks,
	p_private_data_slot &C.PrivateDataSlot) Result {
	return C.vkCreatePrivateDataSlot(device, p_create_info, p_allocator, p_private_data_slot)
}

fn C.vkDestroyPrivateDataSlot(C.Device,
	C.PrivateDataSlot,
	&AllocationCallbacks)
pub fn destroy_private_data_slot(device C.Device,
	private_data_slot C.PrivateDataSlot,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyPrivateDataSlot(device, private_data_slot, p_allocator)
}

fn C.vkSetPrivateData(C.Device,
	ObjectType,
	u64,
	C.PrivateDataSlot,
	u64) Result
pub fn set_private_data(device C.Device,
	object_type ObjectType,
	object_handle u64,
	private_data_slot C.PrivateDataSlot,
	data u64) Result {
	return C.vkSetPrivateData(device, object_type, object_handle, private_data_slot, data)
}

fn C.vkGetPrivateData(C.Device,
	ObjectType,
	u64,
	C.PrivateDataSlot,
	&u64)
pub fn get_private_data(device C.Device,
	object_type ObjectType,
	object_handle u64,
	private_data_slot C.PrivateDataSlot,
	p_data &u64) {
	C.vkGetPrivateData(device, object_type, object_handle, private_data_slot, p_data)
}

fn C.vkCmdSetEvent2(C.CommandBuffer,
	C.Event,
	&DependencyInfo)
pub fn cmd_set_event2(command_buffer C.CommandBuffer,
	event C.Event,
	p_dependency_info &DependencyInfo) {
	C.vkCmdSetEvent2(command_buffer, event, p_dependency_info)
}

fn C.vkCmdResetEvent2(C.CommandBuffer,
	C.Event,
	PipelineStageFlags2)
pub fn cmd_reset_event2(command_buffer C.CommandBuffer,
	event C.Event,
	stage_mask PipelineStageFlags2) {
	C.vkCmdResetEvent2(command_buffer, event, stage_mask)
}

fn C.vkCmdWaitEvents2(C.CommandBuffer,
	u32,
	&C.Event,
	&DependencyInfo)
pub fn cmd_wait_events2(command_buffer C.CommandBuffer,
	event_count u32,
	p_events &C.Event,
	p_dependency_infos &DependencyInfo) {
	C.vkCmdWaitEvents2(command_buffer, event_count, p_events, p_dependency_infos)
}

fn C.vkCmdPipelineBarrier2(C.CommandBuffer,
	&DependencyInfo)
pub fn cmd_pipeline_barrier2(command_buffer C.CommandBuffer,
	p_dependency_info &DependencyInfo) {
	C.vkCmdPipelineBarrier2(command_buffer, p_dependency_info)
}

fn C.vkCmdWriteTimestamp2(C.CommandBuffer,
	PipelineStageFlags2,
	C.QueryPool,
	u32)
pub fn cmd_write_timestamp2(command_buffer C.CommandBuffer,
	stage PipelineStageFlags2,
	query_pool C.QueryPool,
	query u32) {
	C.vkCmdWriteTimestamp2(command_buffer, stage, query_pool, query)
}

fn C.vkQueueSubmit2(C.Queue,
	u32,
	&SubmitInfo2,
	C.Fence) Result
pub fn queue_submit2(queue C.Queue,
	submit_count u32,
	p_submits &SubmitInfo2,
	fence C.Fence) Result {
	return C.vkQueueSubmit2(queue, submit_count, p_submits, fence)
}

fn C.vkCmdCopyBuffer2(C.CommandBuffer,
	&CopyBufferInfo2)
pub fn cmd_copy_buffer2(command_buffer C.CommandBuffer,
	p_copy_buffer_info &CopyBufferInfo2) {
	C.vkCmdCopyBuffer2(command_buffer, p_copy_buffer_info)
}

fn C.vkCmdCopyImage2(C.CommandBuffer,
	&CopyImageInfo2)
pub fn cmd_copy_image2(command_buffer C.CommandBuffer,
	p_copy_image_info &CopyImageInfo2) {
	C.vkCmdCopyImage2(command_buffer, p_copy_image_info)
}

fn C.vkCmdCopyBufferToImage2(C.CommandBuffer,
	&CopyBufferToImageInfo2)
pub fn cmd_copy_buffer_to_image2(command_buffer C.CommandBuffer,
	p_copy_buffer_to_image_info &CopyBufferToImageInfo2) {
	C.vkCmdCopyBufferToImage2(command_buffer, p_copy_buffer_to_image_info)
}

fn C.vkCmdCopyImageToBuffer2(C.CommandBuffer,
	&CopyImageToBufferInfo2)
pub fn cmd_copy_image_to_buffer2(command_buffer C.CommandBuffer,
	p_copy_image_to_buffer_info &CopyImageToBufferInfo2) {
	C.vkCmdCopyImageToBuffer2(command_buffer, p_copy_image_to_buffer_info)
}

fn C.vkCmdBlitImage2(C.CommandBuffer,
	&BlitImageInfo2)
pub fn cmd_blit_image2(command_buffer C.CommandBuffer,
	p_blit_image_info &BlitImageInfo2) {
	C.vkCmdBlitImage2(command_buffer, p_blit_image_info)
}

fn C.vkCmdResolveImage2(C.CommandBuffer,
	&ResolveImageInfo2)
pub fn cmd_resolve_image2(command_buffer C.CommandBuffer,
	p_resolve_image_info &ResolveImageInfo2) {
	C.vkCmdResolveImage2(command_buffer, p_resolve_image_info)
}

fn C.vkCmdBeginRendering(C.CommandBuffer,
	&RenderingInfo)
pub fn cmd_begin_rendering(command_buffer C.CommandBuffer,
	p_rendering_info &RenderingInfo) {
	C.vkCmdBeginRendering(command_buffer, p_rendering_info)
}

fn C.vkCmdEndRendering(C.CommandBuffer)
pub fn cmd_end_rendering(command_buffer C.CommandBuffer) {
	C.vkCmdEndRendering(command_buffer)
}

fn C.vkCmdSetCullMode(C.CommandBuffer,
	CullModeFlags)
pub fn cmd_set_cull_mode(command_buffer C.CommandBuffer,
	cull_mode CullModeFlags) {
	C.vkCmdSetCullMode(command_buffer, cull_mode)
}

fn C.vkCmdSetFrontFace(C.CommandBuffer,
	FrontFace)
pub fn cmd_set_front_face(command_buffer C.CommandBuffer,
	front_face FrontFace) {
	C.vkCmdSetFrontFace(command_buffer, front_face)
}

fn C.vkCmdSetPrimitiveTopology(C.CommandBuffer,
	PrimitiveTopology)
pub fn cmd_set_primitive_topology(command_buffer C.CommandBuffer,
	primitive_topology PrimitiveTopology) {
	C.vkCmdSetPrimitiveTopology(command_buffer, primitive_topology)
}

fn C.vkCmdSetViewportWithCount(C.CommandBuffer,
	u32,
	&Viewport)
pub fn cmd_set_viewport_with_count(command_buffer C.CommandBuffer,
	viewport_count u32,
	p_viewports &Viewport) {
	C.vkCmdSetViewportWithCount(command_buffer, viewport_count, p_viewports)
}

fn C.vkCmdSetScissorWithCount(C.CommandBuffer,
	u32,
	&Rect2D)
pub fn cmd_set_scissor_with_count(command_buffer C.CommandBuffer,
	scissor_count u32,
	p_scissors &Rect2D) {
	C.vkCmdSetScissorWithCount(command_buffer, scissor_count, p_scissors)
}

fn C.vkCmdBindVertexBuffers2(C.CommandBuffer,
	u32,
	u32,
	&C.Buffer,
	&DeviceSize,
	&DeviceSize,
	&DeviceSize)
pub fn cmd_bind_vertex_buffers2(command_buffer C.CommandBuffer,
	first_binding u32,
	binding_count u32,
	p_buffers &C.Buffer,
	p_offsets &DeviceSize,
	p_sizes &DeviceSize,
	p_strides &DeviceSize) {
	C.vkCmdBindVertexBuffers2(command_buffer, first_binding, binding_count, p_buffers,
		p_offsets, p_sizes, p_strides)
}

fn C.vkCmdSetDepthTestEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_test_enable(command_buffer C.CommandBuffer,
	depth_test_enable Bool32) {
	C.vkCmdSetDepthTestEnable(command_buffer, depth_test_enable)
}

fn C.vkCmdSetDepthWriteEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_write_enable(command_buffer C.CommandBuffer,
	depth_write_enable Bool32) {
	C.vkCmdSetDepthWriteEnable(command_buffer, depth_write_enable)
}

fn C.vkCmdSetDepthCompareOp(C.CommandBuffer,
	CompareOp)
pub fn cmd_set_depth_compare_op(command_buffer C.CommandBuffer,
	depth_compare_op CompareOp) {
	C.vkCmdSetDepthCompareOp(command_buffer, depth_compare_op)
}

fn C.vkCmdSetDepthBoundsTestEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_bounds_test_enable(command_buffer C.CommandBuffer,
	depth_bounds_test_enable Bool32) {
	C.vkCmdSetDepthBoundsTestEnable(command_buffer, depth_bounds_test_enable)
}

fn C.vkCmdSetStencilTestEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_stencil_test_enable(command_buffer C.CommandBuffer,
	stencil_test_enable Bool32) {
	C.vkCmdSetStencilTestEnable(command_buffer, stencil_test_enable)
}

fn C.vkCmdSetStencilOp(C.CommandBuffer,
	StencilFaceFlags,
	StencilOp,
	StencilOp,
	StencilOp,
	CompareOp)
pub fn cmd_set_stencil_op(command_buffer C.CommandBuffer,
	face_mask StencilFaceFlags,
	fail_op StencilOp,
	pass_op StencilOp,
	depth_fail_op StencilOp,
	compare_op CompareOp) {
	C.vkCmdSetStencilOp(command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op)
}

fn C.vkCmdSetRasterizerDiscardEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_rasterizer_discard_enable(command_buffer C.CommandBuffer,
	rasterizer_discard_enable Bool32) {
	C.vkCmdSetRasterizerDiscardEnable(command_buffer, rasterizer_discard_enable)
}

fn C.vkCmdSetDepthBiasEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_bias_enable(command_buffer C.CommandBuffer,
	depth_bias_enable Bool32) {
	C.vkCmdSetDepthBiasEnable(command_buffer, depth_bias_enable)
}

fn C.vkCmdSetPrimitiveRestartEnable(C.CommandBuffer,
	Bool32)
pub fn cmd_set_primitive_restart_enable(command_buffer C.CommandBuffer,
	primitive_restart_enable Bool32) {
	C.vkCmdSetPrimitiveRestartEnable(command_buffer, primitive_restart_enable)
}

fn C.vkGetDeviceBufferMemoryRequirements(C.Device,
	&DeviceBufferMemoryRequirements,
	&MemoryRequirements2)
pub fn get_device_buffer_memory_requirements(device C.Device,
	p_info &DeviceBufferMemoryRequirements,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetDeviceBufferMemoryRequirements(device, p_info, p_memory_requirements)
}

fn C.vkGetDeviceImageMemoryRequirements(C.Device,
	&DeviceImageMemoryRequirements,
	&MemoryRequirements2)
pub fn get_device_image_memory_requirements(device C.Device,
	p_info &DeviceImageMemoryRequirements,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetDeviceImageMemoryRequirements(device, p_info, p_memory_requirements)
}

fn C.vkGetDeviceImageSparseMemoryRequirements(C.Device,
	&DeviceImageMemoryRequirements,
	&u32,
	&SparseImageMemoryRequirements2)
pub fn get_device_image_sparse_memory_requirements(device C.Device,
	p_info &DeviceImageMemoryRequirements,
	p_sparse_memory_requirement_count &u32,
	p_sparse_memory_requirements &SparseImageMemoryRequirements2) {
	C.vkGetDeviceImageSparseMemoryRequirements(device, p_info, p_sparse_memory_requirement_count,
		p_sparse_memory_requirements)
}

pub type C.SurfaceKHR = voidptr

pub const khr_surface_spec_version = 25
pub const khr_surface_extension_name = 'VK_KHR_surface'

pub enum PresentModeKHR {
	present_mode_immediate_khr                 = int(0)
	present_mode_mailbox_khr                   = int(1)
	present_mode_fifo_khr                      = int(2)
	present_mode_fifo_relaxed_khr              = int(3)
	present_mode_shared_demand_refresh_khr     = int(1000111000)
	present_mode_shared_continuous_refresh_khr = int(1000111001)
	present_mode_fifo_latest_ready_ext         = int(1000361000)
	present_mode_max_enum_khr                  = int(0x7FFFFFFF)
}

pub enum ColorSpaceKHR {
	color_space_srgb_nonlinear_khr       = int(0)
	color_space_display_p3_nonlinear_ext = int(1000104001)
	color_space_extended_srgb_linear_ext = int(1000104002)
	color_space_display_p3_linear_ext    = int(1000104003)
	color_space_dci_p3_nonlinear_ext     = int(1000104004)
	color_space_bt709_linear_ext         = int(1000104005)
	color_space_bt709_nonlinear_ext      = int(1000104006)
	color_space_bt2020_linear_ext        = int(1000104007)
	color_space_hdr10_st2084_ext         = int(1000104008)
	// VK_COLOR_SPACE_DOLBYVISION_EXT is deprecated, but no reason was given in the API XML
	color_space_dolbyvision_ext             = int(1000104009)
	color_space_hdr10_hlg_ext               = int(1000104010)
	color_space_adobergb_linear_ext         = int(1000104011)
	color_space_adobergb_nonlinear_ext      = int(1000104012)
	color_space_pass_through_ext            = int(1000104013)
	color_space_extended_srgb_nonlinear_ext = int(1000104014)
	color_space_display_native_amd          = int(1000213000)
	color_space_max_enum_khr                = int(0x7FFFFFFF)
}

pub enum SurfaceTransformFlagBitsKHR {
	surface_transform_identity_bit_khr                    = int(0x00000001)
	surface_transform_rotate90_bit_khr                    = int(0x00000002)
	surface_transform_rotate180_bit_khr                   = int(0x00000004)
	surface_transform_rotate270_bit_khr                   = int(0x00000008)
	surface_transform_horizontal_mirror_bit_khr           = int(0x00000010)
	surface_transform_horizontal_mirror_rotate90_bit_khr  = int(0x00000020)
	surface_transform_horizontal_mirror_rotate180_bit_khr = int(0x00000040)
	surface_transform_horizontal_mirror_rotate270_bit_khr = int(0x00000080)
	surface_transform_inherit_bit_khr                     = int(0x00000100)
	surface_transform_flag_bits_max_enum_khr              = int(0x7FFFFFFF)
}

pub enum CompositeAlphaFlagBitsKHR {
	composite_alpha_opaque_bit_khr          = int(0x00000001)
	composite_alpha_pre_multiplied_bit_khr  = int(0x00000002)
	composite_alpha_post_multiplied_bit_khr = int(0x00000004)
	composite_alpha_inherit_bit_khr         = int(0x00000008)
	composite_alpha_flag_bits_max_enum_khr  = int(0x7FFFFFFF)
}

pub type CompositeAlphaFlagsKHR = u32
pub type SurfaceTransformFlagsKHR = u32

pub struct SurfaceCapabilitiesKHR {
pub mut:
	min_image_count           u32
	max_image_count           u32
	current_extent            Extent2D
	min_image_extent          Extent2D
	max_image_extent          Extent2D
	max_image_array_layers    u32
	supported_transforms      SurfaceTransformFlagsKHR
	current_transform         SurfaceTransformFlagBitsKHR
	supported_composite_alpha CompositeAlphaFlagsKHR
	supported_usage_flags     ImageUsageFlags
}

pub struct SurfaceFormatKHR {
pub mut:
	format      Format
	color_space ColorSpaceKHR
}

fn C.vkDestroySurfaceKHR(C.Instance,
	C.SurfaceKHR,
	&AllocationCallbacks)
pub fn destroy_surface_khr(instance C.Instance,
	surface C.SurfaceKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroySurfaceKHR(instance, surface, p_allocator)
}

fn C.vkGetPhysicalDeviceSurfaceSupportKHR(C.PhysicalDevice,
	u32,
	C.SurfaceKHR,
	&Bool32) Result
pub fn get_physical_device_surface_support_khr(physical_device C.PhysicalDevice,
	queue_family_index u32,
	surface C.SurfaceKHR,
	p_supported &Bool32) Result {
	return C.vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, queue_family_index,
		surface, p_supported)
}

fn C.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(C.PhysicalDevice,
	C.SurfaceKHR,
	&SurfaceCapabilitiesKHR) Result
pub fn get_physical_device_surface_capabilities_khr(physical_device C.PhysicalDevice,
	surface C.SurfaceKHR,
	p_surface_capabilities &SurfaceCapabilitiesKHR) Result {
	return C.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, p_surface_capabilities)
}

fn C.vkGetPhysicalDeviceSurfaceFormatsKHR(C.PhysicalDevice,
	C.SurfaceKHR,
	&u32,
	&SurfaceFormatKHR) Result
pub fn get_physical_device_surface_formats_khr(physical_device C.PhysicalDevice,
	surface C.SurfaceKHR,
	p_surface_format_count &u32,
	p_surface_formats &SurfaceFormatKHR) Result {
	return C.vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, p_surface_format_count,
		p_surface_formats)
}

fn C.vkGetPhysicalDeviceSurfacePresentModesKHR(C.PhysicalDevice,
	C.SurfaceKHR,
	&u32,
	&PresentModeKHR) Result
pub fn get_physical_device_surface_present_modes_khr(physical_device C.PhysicalDevice,
	surface C.SurfaceKHR,
	p_present_mode_count &u32,
	p_present_modes &PresentModeKHR) Result {
	return C.vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, p_present_mode_count,
		p_present_modes)
}

pub type C.SwapchainKHR = voidptr

pub const khr_swapchain_spec_version = 70
pub const khr_swapchain_extension_name = 'VK_KHR_swapchain'

pub enum SwapchainCreateFlagBitsKHR {
	swapchain_create_split_instance_bind_regions_bit_khr = int(0x00000001)
	swapchain_create_protected_bit_khr                   = int(0x00000002)
	swapchain_create_mutable_format_bit_khr              = int(0x00000004)
	swapchain_create_deferred_memory_allocation_bit_ext  = int(0x00000008)
	swapchain_create_flag_bits_max_enum_khr              = int(0x7FFFFFFF)
}

pub type SwapchainCreateFlagsKHR = u32

pub enum DeviceGroupPresentModeFlagBitsKHR {
	device_group_present_mode_local_bit_khr              = int(0x00000001)
	device_group_present_mode_remote_bit_khr             = int(0x00000002)
	device_group_present_mode_sum_bit_khr                = int(0x00000004)
	device_group_present_mode_local_multi_device_bit_khr = int(0x00000008)
	device_group_present_mode_flag_bits_max_enum_khr     = int(0x7FFFFFFF)
}

pub type DeviceGroupPresentModeFlagsKHR = u32

pub struct SwapchainCreateInfoKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_swapchain_create_info_khr
	p_next                   voidptr
	flags                    SwapchainCreateFlagsKHR
	surface                  C.SurfaceKHR
	min_image_count          u32
	image_format             Format
	image_color_space        ColorSpaceKHR
	image_extent             Extent2D
	image_array_layers       u32
	image_usage              ImageUsageFlags
	image_sharing_mode       SharingMode
	queue_family_index_count u32
	p_queue_family_indices   &u32
	pre_transform            SurfaceTransformFlagBitsKHR
	composite_alpha          CompositeAlphaFlagBitsKHR
	present_mode             PresentModeKHR
	clipped                  Bool32
	old_swapchain            C.SwapchainKHR
}

pub struct PresentInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_present_info_khr
	p_next               voidptr
	wait_semaphore_count u32
	p_wait_semaphores    &C.Semaphore
	swapchain_count      u32
	p_swapchains         &C.SwapchainKHR
	p_image_indices      &u32
	p_results            &Result
}

pub struct ImageSwapchainCreateInfoKHR {
pub mut:
	s_type    StructureType = StructureType.structure_type_image_swapchain_create_info_khr
	p_next    voidptr
	swapchain C.SwapchainKHR
}

pub struct BindImageMemorySwapchainInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_bind_image_memory_swapchain_info_khr
	p_next      voidptr
	swapchain   C.SwapchainKHR
	image_index u32
}

pub struct AcquireNextImageInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_acquire_next_image_info_khr
	p_next      voidptr
	swapchain   C.SwapchainKHR
	timeout     u64
	semaphore   C.Semaphore
	fence       C.Fence
	device_mask u32
}

pub struct DeviceGroupPresentCapabilitiesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_device_group_present_capabilities_khr
	p_next       voidptr
	present_mask [max_device_group_size]u32
	modes        DeviceGroupPresentModeFlagsKHR
}

pub struct DeviceGroupPresentInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_device_group_present_info_khr
	p_next          voidptr
	swapchain_count u32
	p_device_masks  &u32
	mode            DeviceGroupPresentModeFlagBitsKHR
}

pub struct DeviceGroupSwapchainCreateInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_device_group_swapchain_create_info_khr
	p_next voidptr
	modes  DeviceGroupPresentModeFlagsKHR
}

fn C.vkCreateSwapchainKHR(C.Device,
	&SwapchainCreateInfoKHR,
	&AllocationCallbacks,
	&C.SwapchainKHR) Result
pub fn create_swapchain_khr(device C.Device,
	p_create_info &SwapchainCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_swapchain &C.SwapchainKHR) Result {
	return C.vkCreateSwapchainKHR(device, p_create_info, p_allocator, p_swapchain)
}

fn C.vkDestroySwapchainKHR(C.Device,
	C.SwapchainKHR,
	&AllocationCallbacks)
pub fn destroy_swapchain_khr(device C.Device,
	swapchain C.SwapchainKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroySwapchainKHR(device, swapchain, p_allocator)
}

fn C.vkGetSwapchainImagesKHR(C.Device,
	C.SwapchainKHR,
	&u32,
	&C.Image) Result
pub fn get_swapchain_images_khr(device C.Device,
	swapchain C.SwapchainKHR,
	p_swapchain_image_count &u32,
	p_swapchain_images &C.Image) Result {
	return C.vkGetSwapchainImagesKHR(device, swapchain, p_swapchain_image_count, p_swapchain_images)
}

fn C.vkAcquireNextImageKHR(C.Device,
	C.SwapchainKHR,
	u64,
	C.Semaphore,
	C.Fence,
	&u32) Result
pub fn acquire_next_image_khr(device C.Device,
	swapchain C.SwapchainKHR,
	timeout u64,
	semaphore C.Semaphore,
	fence C.Fence,
	p_image_index &u32) Result {
	return C.vkAcquireNextImageKHR(device, swapchain, timeout, semaphore, fence, p_image_index)
}

fn C.vkQueuePresentKHR(C.Queue,
	&PresentInfoKHR) Result
pub fn queue_present_khr(queue C.Queue,
	p_present_info &PresentInfoKHR) Result {
	return C.vkQueuePresentKHR(queue, p_present_info)
}

fn C.vkGetDeviceGroupPresentCapabilitiesKHR(C.Device,
	&DeviceGroupPresentCapabilitiesKHR) Result
pub fn get_device_group_present_capabilities_khr(device C.Device,
	p_device_group_present_capabilities &DeviceGroupPresentCapabilitiesKHR) Result {
	return C.vkGetDeviceGroupPresentCapabilitiesKHR(device, p_device_group_present_capabilities)
}

fn C.vkGetDeviceGroupSurfacePresentModesKHR(C.Device,
	C.SurfaceKHR,
	&DeviceGroupPresentModeFlagsKHR) Result
pub fn get_device_group_surface_present_modes_khr(device C.Device,
	surface C.SurfaceKHR,
	p_modes &DeviceGroupPresentModeFlagsKHR) Result {
	return C.vkGetDeviceGroupSurfacePresentModesKHR(device, surface, p_modes)
}

fn C.vkGetPhysicalDevicePresentRectanglesKHR(C.PhysicalDevice,
	C.SurfaceKHR,
	&u32,
	&Rect2D) Result
pub fn get_physical_device_present_rectangles_khr(physical_device C.PhysicalDevice,
	surface C.SurfaceKHR,
	p_rect_count &u32,
	p_rects &Rect2D) Result {
	return C.vkGetPhysicalDevicePresentRectanglesKHR(physical_device, surface, p_rect_count,
		p_rects)
}

fn C.vkAcquireNextImage2KHR(C.Device,
	&AcquireNextImageInfoKHR,
	&u32) Result
pub fn acquire_next_image2_khr(device C.Device,
	p_acquire_info &AcquireNextImageInfoKHR,
	p_image_index &u32) Result {
	return C.vkAcquireNextImage2KHR(device, p_acquire_info, p_image_index)
}

pub type C.DisplayKHR = voidptr
pub type C.DisplayModeKHR = voidptr

pub const khr_display_spec_version = 23
pub const khr_display_extension_name = 'VK_KHR_display'

pub type DisplayModeCreateFlagsKHR = u32

pub enum DisplayPlaneAlphaFlagBitsKHR {
	display_plane_alpha_opaque_bit_khr                  = int(0x00000001)
	display_plane_alpha_global_bit_khr                  = int(0x00000002)
	display_plane_alpha_per_pixel_bit_khr               = int(0x00000004)
	display_plane_alpha_per_pixel_premultiplied_bit_khr = int(0x00000008)
	display_plane_alpha_flag_bits_max_enum_khr          = int(0x7FFFFFFF)
}

pub type DisplayPlaneAlphaFlagsKHR = u32
pub type DisplaySurfaceCreateFlagsKHR = u32

pub struct DisplayModeParametersKHR {
pub mut:
	visible_region Extent2D
	refresh_rate   u32
}

pub struct DisplayModeCreateInfoKHR {
pub mut:
	s_type     StructureType = StructureType.structure_type_display_mode_create_info_khr
	p_next     voidptr
	flags      DisplayModeCreateFlagsKHR
	parameters DisplayModeParametersKHR
}

pub struct DisplayModePropertiesKHR {
pub mut:
	display_mode C.DisplayModeKHR
	parameters   DisplayModeParametersKHR
}

pub struct DisplayPlaneCapabilitiesKHR {
pub mut:
	supported_alpha  DisplayPlaneAlphaFlagsKHR
	min_src_position Offset2D
	max_src_position Offset2D
	min_src_extent   Extent2D
	max_src_extent   Extent2D
	min_dst_position Offset2D
	max_dst_position Offset2D
	min_dst_extent   Extent2D
	max_dst_extent   Extent2D
}

pub struct DisplayPlanePropertiesKHR {
pub mut:
	current_display     C.DisplayKHR
	current_stack_index u32
}

pub struct DisplayPropertiesKHR {
pub mut:
	display                C.DisplayKHR
	display_name           &char
	physical_dimensions    Extent2D
	physical_resolution    Extent2D
	supported_transforms   SurfaceTransformFlagsKHR
	plane_reorder_possible Bool32
	persistent_content     Bool32
}

pub struct DisplaySurfaceCreateInfoKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_display_surface_create_info_khr
	p_next            voidptr
	flags             DisplaySurfaceCreateFlagsKHR
	display_mode      C.DisplayModeKHR
	plane_index       u32
	plane_stack_index u32
	transform         SurfaceTransformFlagBitsKHR
	global_alpha      f32
	alpha_mode        DisplayPlaneAlphaFlagBitsKHR
	image_extent      Extent2D
}

fn C.vkGetPhysicalDeviceDisplayPropertiesKHR(C.PhysicalDevice,
	&u32,
	&DisplayPropertiesKHR) Result
pub fn get_physical_device_display_properties_khr(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &DisplayPropertiesKHR) Result {
	return C.vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device, p_property_count,
		p_properties)
}

fn C.vkGetPhysicalDeviceDisplayPlanePropertiesKHR(C.PhysicalDevice,
	&u32,
	&DisplayPlanePropertiesKHR) Result
pub fn get_physical_device_display_plane_properties_khr(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &DisplayPlanePropertiesKHR) Result {
	return C.vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device, p_property_count,
		p_properties)
}

fn C.vkGetDisplayPlaneSupportedDisplaysKHR(C.PhysicalDevice,
	u32,
	&u32,
	&C.DisplayKHR) Result
pub fn get_display_plane_supported_displays_khr(physical_device C.PhysicalDevice,
	plane_index u32,
	p_display_count &u32,
	p_displays &C.DisplayKHR) Result {
	return C.vkGetDisplayPlaneSupportedDisplaysKHR(physical_device, plane_index, p_display_count,
		p_displays)
}

fn C.vkGetDisplayModePropertiesKHR(C.PhysicalDevice,
	C.DisplayKHR,
	&u32,
	&DisplayModePropertiesKHR) Result
pub fn get_display_mode_properties_khr(physical_device C.PhysicalDevice,
	display C.DisplayKHR,
	p_property_count &u32,
	p_properties &DisplayModePropertiesKHR) Result {
	return C.vkGetDisplayModePropertiesKHR(physical_device, display, p_property_count,
		p_properties)
}

fn C.vkCreateDisplayModeKHR(C.PhysicalDevice,
	C.DisplayKHR,
	&DisplayModeCreateInfoKHR,
	&AllocationCallbacks,
	&C.DisplayModeKHR) Result
pub fn create_display_mode_khr(physical_device C.PhysicalDevice,
	display C.DisplayKHR,
	p_create_info &DisplayModeCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_mode &C.DisplayModeKHR) Result {
	return C.vkCreateDisplayModeKHR(physical_device, display, p_create_info, p_allocator,
		p_mode)
}

fn C.vkGetDisplayPlaneCapabilitiesKHR(C.PhysicalDevice,
	C.DisplayModeKHR,
	u32,
	&DisplayPlaneCapabilitiesKHR) Result
pub fn get_display_plane_capabilities_khr(physical_device C.PhysicalDevice,
	mode C.DisplayModeKHR,
	plane_index u32,
	p_capabilities &DisplayPlaneCapabilitiesKHR) Result {
	return C.vkGetDisplayPlaneCapabilitiesKHR(physical_device, mode, plane_index, p_capabilities)
}

fn C.vkCreateDisplayPlaneSurfaceKHR(C.Instance,
	&DisplaySurfaceCreateInfoKHR,
	&AllocationCallbacks,
	&C.SurfaceKHR) Result
pub fn create_display_plane_surface_khr(instance C.Instance,
	p_create_info &DisplaySurfaceCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_surface &C.SurfaceKHR) Result {
	return C.vkCreateDisplayPlaneSurfaceKHR(instance, p_create_info, p_allocator, p_surface)
}

pub const khr_display_swapchain_spec_version = 10
pub const khr_display_swapchain_extension_name = 'VK_KHR_display_swapchain'

pub struct DisplayPresentInfoKHR {
pub mut:
	s_type     StructureType = StructureType.structure_type_display_present_info_khr
	p_next     voidptr
	src_rect   Rect2D
	dst_rect   Rect2D
	persistent Bool32
}

fn C.vkCreateSharedSwapchainsKHR(C.Device,
	u32,
	&SwapchainCreateInfoKHR,
	&AllocationCallbacks,
	&C.SwapchainKHR) Result
pub fn create_shared_swapchains_khr(device C.Device,
	swapchain_count u32,
	p_create_infos &SwapchainCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_swapchains &C.SwapchainKHR) Result {
	return C.vkCreateSharedSwapchainsKHR(device, swapchain_count, p_create_infos, p_allocator,
		p_swapchains)
}

pub const khr_sampler_mirror_clamp_to_edge_spec_version = 3
pub const khr_sampler_mirror_clamp_to_edge_extension_name = 'VK_KHR_sampler_mirror_clamp_to_edge'

pub type C.VideoSessionKHR = voidptr
pub type C.VideoSessionParametersKHR = voidptr

pub const khr_video_queue_spec_version = 8
pub const khr_video_queue_extension_name = 'VK_KHR_video_queue'

pub enum QueryResultStatusKHR {
	query_result_status_error_khr                               = int(-1)
	query_result_status_not_ready_khr                           = int(0)
	query_result_status_complete_khr                            = int(1)
	query_result_status_insufficient_bitstream_buffer_range_khr = int(-1000299000)
	query_result_status_max_enum_khr                            = int(0x7FFFFFFF)
}

pub enum VideoCodecOperationFlagBitsKHR {
	video_codec_operation_none_khr               = int(0)
	video_codec_operation_encode_h264_bit_khr    = int(0x00010000)
	video_codec_operation_encode_h265_bit_khr    = int(0x00020000)
	video_codec_operation_decode_h264_bit_khr    = int(0x00000001)
	video_codec_operation_decode_h265_bit_khr    = int(0x00000002)
	video_codec_operation_decode_av1_bit_khr     = int(0x00000004)
	video_codec_operation_encode_av1_bit_khr     = int(0x00040000)
	video_codec_operation_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoCodecOperationFlagsKHR = u32

pub enum VideoChromaSubsamplingFlagBitsKHR {
	video_chroma_subsampling_invalid_khr            = int(0)
	video_chroma_subsampling_monochrome_bit_khr     = int(0x00000001)
	video_chroma_subsampling420_bit_khr             = int(0x00000002)
	video_chroma_subsampling422_bit_khr             = int(0x00000004)
	video_chroma_subsampling444_bit_khr             = int(0x00000008)
	video_chroma_subsampling_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoChromaSubsamplingFlagsKHR = u32

pub enum VideoComponentBitDepthFlagBitsKHR {
	video_component_bit_depth_invalid_khr            = int(0)
	video_component_bit_depth8_bit_khr               = int(0x00000001)
	video_component_bit_depth10_bit_khr              = int(0x00000004)
	video_component_bit_depth12_bit_khr              = int(0x00000010)
	video_component_bit_depth_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoComponentBitDepthFlagsKHR = u32

pub enum VideoCapabilityFlagBitsKHR {
	video_capability_protected_content_bit_khr         = int(0x00000001)
	video_capability_separate_reference_images_bit_khr = int(0x00000002)
	video_capability_flag_bits_max_enum_khr            = int(0x7FFFFFFF)
}

pub type VideoCapabilityFlagsKHR = u32

pub enum VideoSessionCreateFlagBitsKHR {
	video_session_create_protected_content_bit_khr                    = int(0x00000001)
	video_session_create_allow_encode_parameter_optimizations_bit_khr = int(0x00000002)
	video_session_create_inline_queries_bit_khr                       = int(0x00000004)
	video_session_create_allow_encode_quantization_delta_map_bit_khr  = int(0x00000008)
	video_session_create_allow_encode_emphasis_map_bit_khr            = int(0x00000010)
	video_session_create_flag_bits_max_enum_khr                       = int(0x7FFFFFFF)
}

pub type VideoSessionCreateFlagsKHR = u32

pub enum VideoSessionParametersCreateFlagBitsKHR {
	video_session_parameters_create_quantization_map_compatible_bit_khr = int(0x00000001)
	video_session_parameters_create_flag_bits_max_enum_khr              = int(0x7FFFFFFF)
}

pub type VideoSessionParametersCreateFlagsKHR = u32
pub type VideoBeginCodingFlagsKHR = u32
pub type VideoEndCodingFlagsKHR = u32

pub enum VideoCodingControlFlagBitsKHR {
	video_coding_control_reset_bit_khr                = int(0x00000001)
	video_coding_control_encode_rate_control_bit_khr  = int(0x00000002)
	video_coding_control_encode_quality_level_bit_khr = int(0x00000004)
	video_coding_control_flag_bits_max_enum_khr       = int(0x7FFFFFFF)
}

pub type VideoCodingControlFlagsKHR = u32

pub struct QueueFamilyQueryResultStatusPropertiesKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_queue_family_query_result_status_properties_khr
	p_next                      voidptr
	query_result_status_support Bool32
}

pub struct QueueFamilyVideoPropertiesKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_queue_family_video_properties_khr
	p_next                 voidptr
	video_codec_operations VideoCodecOperationFlagsKHR
}

pub struct VideoProfileInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_profile_info_khr
	p_next                voidptr
	video_codec_operation VideoCodecOperationFlagBitsKHR
	chroma_subsampling    VideoChromaSubsamplingFlagsKHR
	luma_bit_depth        VideoComponentBitDepthFlagsKHR
	chroma_bit_depth      VideoComponentBitDepthFlagsKHR
}

pub struct VideoProfileListInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_profile_list_info_khr
	p_next        voidptr
	profile_count u32
	p_profiles    &VideoProfileInfoKHR
}

pub struct VideoCapabilitiesKHR {
pub mut:
	s_type                                StructureType = StructureType.structure_type_video_capabilities_khr
	p_next                                voidptr
	flags                                 VideoCapabilityFlagsKHR
	min_bitstream_buffer_offset_alignment DeviceSize
	min_bitstream_buffer_size_alignment   DeviceSize
	picture_access_granularity            Extent2D
	min_coded_extent                      Extent2D
	max_coded_extent                      Extent2D
	max_dpb_slots                         u32
	max_active_reference_pictures         u32
	std_header_version                    ExtensionProperties
}

pub struct PhysicalDeviceVideoFormatInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_video_format_info_khr
	p_next      voidptr
	image_usage ImageUsageFlags
}

pub struct VideoFormatPropertiesKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_format_properties_khr
	p_next             voidptr
	format             Format
	component_mapping  ComponentMapping
	image_create_flags ImageCreateFlags
	image_type         ImageType
	image_tiling       ImageTiling
	image_usage_flags  ImageUsageFlags
}

pub struct VideoPictureResourceInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_picture_resource_info_khr
	p_next             voidptr
	coded_offset       Offset2D
	coded_extent       Extent2D
	base_array_layer   u32
	image_view_binding C.ImageView
}

pub struct VideoReferenceSlotInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_reference_slot_info_khr
	p_next             voidptr
	slot_index         i32
	p_picture_resource &VideoPictureResourceInfoKHR
}

pub struct VideoSessionMemoryRequirementsKHR {
pub mut:
	s_type              StructureType = StructureType.structure_type_video_session_memory_requirements_khr
	p_next              voidptr
	memory_bind_index   u32
	memory_requirements MemoryRequirements
}

pub struct BindVideoSessionMemoryInfoKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_bind_video_session_memory_info_khr
	p_next            voidptr
	memory_bind_index u32
	memory            C.DeviceMemory
	memory_offset     DeviceSize
	memory_size       DeviceSize
}

pub struct VideoSessionCreateInfoKHR {
pub mut:
	s_type                        StructureType = StructureType.structure_type_video_session_create_info_khr
	p_next                        voidptr
	queue_family_index            u32
	flags                         VideoSessionCreateFlagsKHR
	p_video_profile               &VideoProfileInfoKHR
	picture_format                Format
	max_coded_extent              Extent2D
	reference_picture_format      Format
	max_dpb_slots                 u32
	max_active_reference_pictures u32
	p_std_header_version          &ExtensionProperties
}

pub struct VideoSessionParametersCreateInfoKHR {
pub mut:
	s_type                            StructureType = StructureType.structure_type_video_session_parameters_create_info_khr
	p_next                            voidptr
	flags                             VideoSessionParametersCreateFlagsKHR
	video_session_parameters_template C.VideoSessionParametersKHR
	video_session                     C.VideoSessionKHR
}

pub struct VideoSessionParametersUpdateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_session_parameters_update_info_khr
	p_next                voidptr
	update_sequence_count u32
}

pub struct VideoBeginCodingInfoKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_video_begin_coding_info_khr
	p_next                   voidptr
	flags                    VideoBeginCodingFlagsKHR
	video_session            C.VideoSessionKHR
	video_session_parameters C.VideoSessionParametersKHR
	reference_slot_count     u32
	p_reference_slots        &VideoReferenceSlotInfoKHR
}

pub struct VideoEndCodingInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_video_end_coding_info_khr
	p_next voidptr
	flags  VideoEndCodingFlagsKHR
}

pub struct VideoCodingControlInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_video_coding_control_info_khr
	p_next voidptr
	flags  VideoCodingControlFlagsKHR
}

fn C.vkGetPhysicalDeviceVideoCapabilitiesKHR(C.PhysicalDevice,
	&VideoProfileInfoKHR,
	&VideoCapabilitiesKHR) Result
pub fn get_physical_device_video_capabilities_khr(physical_device C.PhysicalDevice,
	p_video_profile &VideoProfileInfoKHR,
	p_capabilities &VideoCapabilitiesKHR) Result {
	return C.vkGetPhysicalDeviceVideoCapabilitiesKHR(physical_device, p_video_profile,
		p_capabilities)
}

fn C.vkGetPhysicalDeviceVideoFormatPropertiesKHR(C.PhysicalDevice,
	&PhysicalDeviceVideoFormatInfoKHR,
	&u32,
	&VideoFormatPropertiesKHR) Result
pub fn get_physical_device_video_format_properties_khr(physical_device C.PhysicalDevice,
	p_video_format_info &PhysicalDeviceVideoFormatInfoKHR,
	p_video_format_property_count &u32,
	p_video_format_properties &VideoFormatPropertiesKHR) Result {
	return C.vkGetPhysicalDeviceVideoFormatPropertiesKHR(physical_device, p_video_format_info,
		p_video_format_property_count, p_video_format_properties)
}

fn C.vkCreateVideoSessionKHR(C.Device,
	&VideoSessionCreateInfoKHR,
	&AllocationCallbacks,
	&C.VideoSessionKHR) Result
pub fn create_video_session_khr(device C.Device,
	p_create_info &VideoSessionCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_video_session &C.VideoSessionKHR) Result {
	return C.vkCreateVideoSessionKHR(device, p_create_info, p_allocator, p_video_session)
}

fn C.vkDestroyVideoSessionKHR(C.Device,
	C.VideoSessionKHR,
	&AllocationCallbacks)
pub fn destroy_video_session_khr(device C.Device,
	video_session C.VideoSessionKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyVideoSessionKHR(device, video_session, p_allocator)
}

fn C.vkGetVideoSessionMemoryRequirementsKHR(C.Device,
	C.VideoSessionKHR,
	&u32,
	&VideoSessionMemoryRequirementsKHR) Result
pub fn get_video_session_memory_requirements_khr(device C.Device,
	video_session C.VideoSessionKHR,
	p_memory_requirements_count &u32,
	p_memory_requirements &VideoSessionMemoryRequirementsKHR) Result {
	return C.vkGetVideoSessionMemoryRequirementsKHR(device, video_session, p_memory_requirements_count,
		p_memory_requirements)
}

fn C.vkBindVideoSessionMemoryKHR(C.Device,
	C.VideoSessionKHR,
	u32,
	&BindVideoSessionMemoryInfoKHR) Result
pub fn bind_video_session_memory_khr(device C.Device,
	video_session C.VideoSessionKHR,
	bind_session_memory_info_count u32,
	p_bind_session_memory_infos &BindVideoSessionMemoryInfoKHR) Result {
	return C.vkBindVideoSessionMemoryKHR(device, video_session, bind_session_memory_info_count,
		p_bind_session_memory_infos)
}

fn C.vkCreateVideoSessionParametersKHR(C.Device,
	&VideoSessionParametersCreateInfoKHR,
	&AllocationCallbacks,
	&C.VideoSessionParametersKHR) Result
pub fn create_video_session_parameters_khr(device C.Device,
	p_create_info &VideoSessionParametersCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_video_session_parameters &C.VideoSessionParametersKHR) Result {
	return C.vkCreateVideoSessionParametersKHR(device, p_create_info, p_allocator, p_video_session_parameters)
}

fn C.vkUpdateVideoSessionParametersKHR(C.Device,
	C.VideoSessionParametersKHR,
	&VideoSessionParametersUpdateInfoKHR) Result
pub fn update_video_session_parameters_khr(device C.Device,
	video_session_parameters C.VideoSessionParametersKHR,
	p_update_info &VideoSessionParametersUpdateInfoKHR) Result {
	return C.vkUpdateVideoSessionParametersKHR(device, video_session_parameters, p_update_info)
}

fn C.vkDestroyVideoSessionParametersKHR(C.Device,
	C.VideoSessionParametersKHR,
	&AllocationCallbacks)
pub fn destroy_video_session_parameters_khr(device C.Device,
	video_session_parameters C.VideoSessionParametersKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyVideoSessionParametersKHR(device, video_session_parameters, p_allocator)
}

fn C.vkCmdBeginVideoCodingKHR(C.CommandBuffer,
	&VideoBeginCodingInfoKHR)
pub fn cmd_begin_video_coding_khr(command_buffer C.CommandBuffer,
	p_begin_info &VideoBeginCodingInfoKHR) {
	C.vkCmdBeginVideoCodingKHR(command_buffer, p_begin_info)
}

fn C.vkCmdEndVideoCodingKHR(C.CommandBuffer,
	&VideoEndCodingInfoKHR)
pub fn cmd_end_video_coding_khr(command_buffer C.CommandBuffer,
	p_end_coding_info &VideoEndCodingInfoKHR) {
	C.vkCmdEndVideoCodingKHR(command_buffer, p_end_coding_info)
}

fn C.vkCmdControlVideoCodingKHR(C.CommandBuffer,
	&VideoCodingControlInfoKHR)
pub fn cmd_control_video_coding_khr(command_buffer C.CommandBuffer,
	p_coding_control_info &VideoCodingControlInfoKHR) {
	C.vkCmdControlVideoCodingKHR(command_buffer, p_coding_control_info)
}

pub const khr_video_decode_queue_spec_version = 8
pub const khr_video_decode_queue_extension_name = 'VK_KHR_video_decode_queue'

pub enum VideoDecodeCapabilityFlagBitsKHR {
	video_decode_capability_dpb_and_output_coincide_bit_khr = int(0x00000001)
	video_decode_capability_dpb_and_output_distinct_bit_khr = int(0x00000002)
	video_decode_capability_flag_bits_max_enum_khr          = int(0x7FFFFFFF)
}

pub type VideoDecodeCapabilityFlagsKHR = u32

pub enum VideoDecodeUsageFlagBitsKHR {
	video_decode_usage_default_khr            = int(0)
	video_decode_usage_transcoding_bit_khr    = int(0x00000001)
	video_decode_usage_offline_bit_khr        = int(0x00000002)
	video_decode_usage_streaming_bit_khr      = int(0x00000004)
	video_decode_usage_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoDecodeUsageFlagsKHR = u32
pub type VideoDecodeFlagsKHR = u32

pub struct VideoDecodeCapabilitiesKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_video_decode_capabilities_khr
	p_next voidptr
	flags  VideoDecodeCapabilityFlagsKHR
}

pub struct VideoDecodeUsageInfoKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_video_decode_usage_info_khr
	p_next            voidptr
	video_usage_hints VideoDecodeUsageFlagsKHR
}

pub struct VideoDecodeInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_video_decode_info_khr
	p_next                 voidptr
	flags                  VideoDecodeFlagsKHR
	src_buffer             C.Buffer
	src_buffer_offset      DeviceSize
	src_buffer_range       DeviceSize
	dst_picture_resource   VideoPictureResourceInfoKHR
	p_setup_reference_slot &VideoReferenceSlotInfoKHR
	reference_slot_count   u32
	p_reference_slots      &VideoReferenceSlotInfoKHR
}

fn C.vkCmdDecodeVideoKHR(C.CommandBuffer,
	&VideoDecodeInfoKHR)
pub fn cmd_decode_video_khr(command_buffer C.CommandBuffer,
	p_decode_info &VideoDecodeInfoKHR) {
	C.vkCmdDecodeVideoKHR(command_buffer, p_decode_info)
}

#include "vk_video/vulkan_video_codec_h264std.h"
#include "vk_video/vulkan_video_codec_h264std_encode.h"

pub const khr_video_encode_h264_spec_version = 14
pub const khr_video_encode_h264_extension_name = 'VK_KHR_video_encode_h264'

pub enum VideoEncodeH264CapabilityFlagBitsKHR {
	video_encode_h264_capability_hrd_compliance_bit_khr                    = int(0x00000001)
	video_encode_h264_capability_prediction_weight_table_generated_bit_khr = int(0x00000002)
	video_encode_h264_capability_row_unaligned_slice_bit_khr               = int(0x00000004)
	video_encode_h264_capability_different_slice_type_bit_khr              = int(0x00000008)
	video_encode_h264_capability_b_frame_in_l0_list_bit_khr                = int(0x00000010)
	video_encode_h264_capability_b_frame_in_l1_list_bit_khr                = int(0x00000020)
	video_encode_h264_capability_per_picture_type_min_max_qp_bit_khr       = int(0x00000040)
	video_encode_h264_capability_per_slice_constant_qp_bit_khr             = int(0x00000080)
	video_encode_h264_capability_generate_prefix_nalu_bit_khr              = int(0x00000100)
	video_encode_h264_capability_mb_qp_diff_wraparound_bit_khr             = int(0x00000200)
	video_encode_h264_capability_flag_bits_max_enum_khr                    = int(0x7FFFFFFF)
}

pub type VideoEncodeH264CapabilityFlagsKHR = u32

pub enum VideoEncodeH264StdFlagBitsKHR {
	video_encode_h264_std_separate_color_plane_flag_set_bit_khr            = int(0x00000001)
	video_encode_h264_std_qpprime_y_zero_transform_bypass_flag_set_bit_khr = int(0x00000002)
	video_encode_h264_std_scaling_matrix_present_flag_set_bit_khr          = int(0x00000004)
	video_encode_h264_std_chroma_qp_index_offset_bit_khr                   = int(0x00000008)
	video_encode_h264_std_second_chroma_qp_index_offset_bit_khr            = int(0x00000010)
	video_encode_h264_std_pic_init_qp_minus26_bit_khr                      = int(0x00000020)
	video_encode_h264_std_weighted_pred_flag_set_bit_khr                   = int(0x00000040)
	video_encode_h264_std_weighted_bipred_idc_explicit_bit_khr             = int(0x00000080)
	video_encode_h264_std_weighted_bipred_idc_implicit_bit_khr             = int(0x00000100)
	video_encode_h264_std_transform8x8_mode_flag_set_bit_khr               = int(0x00000200)
	video_encode_h264_std_direct_spatial_mv_pred_flag_unset_bit_khr        = int(0x00000400)
	video_encode_h264_std_entropy_coding_mode_flag_unset_bit_khr           = int(0x00000800)
	video_encode_h264_std_entropy_coding_mode_flag_set_bit_khr             = int(0x00001000)
	video_encode_h264_std_direct8x8_inference_flag_unset_bit_khr           = int(0x00002000)
	video_encode_h264_std_constrained_intra_pred_flag_set_bit_khr          = int(0x00004000)
	video_encode_h264_std_deblocking_filter_disabled_bit_khr               = int(0x00008000)
	video_encode_h264_std_deblocking_filter_enabled_bit_khr                = int(0x00010000)
	video_encode_h264_std_deblocking_filter_partial_bit_khr                = int(0x00020000)
	video_encode_h264_std_slice_qp_delta_bit_khr                           = int(0x00080000)
	video_encode_h264_std_different_slice_qp_delta_bit_khr                 = int(0x00100000)
	video_encode_h264_std_flag_bits_max_enum_khr                           = int(0x7FFFFFFF)
}

pub type VideoEncodeH264StdFlagsKHR = u32

pub enum VideoEncodeH264RateControlFlagBitsKHR {
	video_encode_h264_rate_control_attempt_hrd_compliance_bit_khr        = int(0x00000001)
	video_encode_h264_rate_control_regular_gop_bit_khr                   = int(0x00000002)
	video_encode_h264_rate_control_reference_pattern_flat_bit_khr        = int(0x00000004)
	video_encode_h264_rate_control_reference_pattern_dyadic_bit_khr      = int(0x00000008)
	video_encode_h264_rate_control_temporal_layer_pattern_dyadic_bit_khr = int(0x00000010)
	video_encode_h264_rate_control_flag_bits_max_enum_khr                = int(0x7FFFFFFF)
}

pub type VideoEncodeH264RateControlFlagsKHR = u32

pub struct VideoEncodeH264CapabilitiesKHR {
pub mut:
	s_type                               StructureType = StructureType.structure_type_video_encode_h264_capabilities_khr
	p_next                               voidptr
	flags                                VideoEncodeH264CapabilityFlagsKHR
	max_level_idc                        C.StdVideoH264LevelIdc
	max_slice_count                      u32
	max_p_picture_l0_reference_count     u32
	max_b_picture_l0_reference_count     u32
	max_l1_reference_count               u32
	max_temporal_layer_count             u32
	expect_dyadic_temporal_layer_pattern Bool32
	min_qp                               i32
	max_qp                               i32
	prefers_gop_remaining_frames         Bool32
	requires_gop_remaining_frames        Bool32
	std_syntax_flags                     VideoEncodeH264StdFlagsKHR
}

pub struct VideoEncodeH264QpKHR {
pub mut:
	qp_i i32
	qp_p i32
	qp_b i32
}

pub struct VideoEncodeH264QualityLevelPropertiesKHR {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_video_encode_h264_quality_level_properties_khr
	p_next                                 voidptr
	preferred_rate_control_flags           VideoEncodeH264RateControlFlagsKHR
	preferred_gop_frame_count              u32
	preferred_idr_period                   u32
	preferred_consecutive_b_frame_count    u32
	preferred_temporal_layer_count         u32
	preferred_constant_qp                  VideoEncodeH264QpKHR
	preferred_max_l0_reference_count       u32
	preferred_max_l1_reference_count       u32
	preferred_std_entropy_coding_mode_flag Bool32
}

pub struct VideoEncodeH264SessionCreateInfoKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_video_encode_h264_session_create_info_khr
	p_next            voidptr
	use_max_level_idc Bool32
	max_level_idc     C.StdVideoH264LevelIdc
}

pub struct VideoEncodeH264SessionParametersAddInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_h264_session_parameters_add_info_khr
	p_next        voidptr
	std_sps_count u32
	p_std_sp_ss   &C.StdVideoH264SequenceParameterSet
	std_pps_count u32
	p_std_pp_ss   &C.StdVideoH264PictureParameterSet
}

pub struct VideoEncodeH264SessionParametersCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_encode_h264_session_parameters_create_info_khr
	p_next                voidptr
	max_std_sps_count     u32
	max_std_pps_count     u32
	p_parameters_add_info &VideoEncodeH264SessionParametersAddInfoKHR
}

pub struct VideoEncodeH264SessionParametersGetInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_h264_session_parameters_get_info_khr
	p_next        voidptr
	write_std_sps Bool32
	write_std_pps Bool32
	std_sps_id    u32
	std_pps_id    u32
}

pub struct VideoEncodeH264SessionParametersFeedbackInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_encode_h264_session_parameters_feedback_info_khr
	p_next                voidptr
	has_std_sps_overrides Bool32
	has_std_pps_overrides Bool32
}

pub struct VideoEncodeH264NaluSliceInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_encode_h264_nalu_slice_info_khr
	p_next             voidptr
	constant_qp        i32
	p_std_slice_header &C.StdVideoEncodeH264SliceHeader
}

pub struct VideoEncodeH264PictureInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_video_encode_h264_picture_info_khr
	p_next                 voidptr
	nalu_slice_entry_count u32
	p_nalu_slice_entries   &VideoEncodeH264NaluSliceInfoKHR
	p_std_picture_info     &C.StdVideoEncodeH264PictureInfo
	generate_prefix_nalu   Bool32
}

pub struct VideoEncodeH264DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_encode_h264_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &C.StdVideoEncodeH264ReferenceInfo
}

pub struct VideoEncodeH264ProfileInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_video_encode_h264_profile_info_khr
	p_next          voidptr
	std_profile_idc C.StdVideoH264ProfileIdc
}

pub struct VideoEncodeH264RateControlInfoKHR {
pub mut:
	s_type                    StructureType = StructureType.structure_type_video_encode_h264_rate_control_info_khr
	p_next                    voidptr
	flags                     VideoEncodeH264RateControlFlagsKHR
	gop_frame_count           u32
	idr_period                u32
	consecutive_b_frame_count u32
	temporal_layer_count      u32
}

pub struct VideoEncodeH264FrameSizeKHR {
pub mut:
	frame_i_size u32
	frame_p_size u32
	frame_b_size u32
}

pub struct VideoEncodeH264RateControlLayerInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_encode_h264_rate_control_layer_info_khr
	p_next             voidptr
	use_min_qp         Bool32
	min_qp             VideoEncodeH264QpKHR
	use_max_qp         Bool32
	max_qp             VideoEncodeH264QpKHR
	use_max_frame_size Bool32
	max_frame_size     VideoEncodeH264FrameSizeKHR
}

pub struct VideoEncodeH264GopRemainingFrameInfoKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_video_encode_h264_gop_remaining_frame_info_khr
	p_next                   voidptr
	use_gop_remaining_frames Bool32
	gop_remaining_i          u32
	gop_remaining_p          u32
	gop_remaining_b          u32
}

#include "vk_video/vulkan_video_codec_h265std.h"
#include "vk_video/vulkan_video_codec_h265std_encode.h"

pub const khr_video_encode_h265_spec_version = 14
pub const khr_video_encode_h265_extension_name = 'VK_KHR_video_encode_h265'

pub enum VideoEncodeH265CapabilityFlagBitsKHR {
	video_encode_h265_capability_hrd_compliance_bit_khr                    = int(0x00000001)
	video_encode_h265_capability_prediction_weight_table_generated_bit_khr = int(0x00000002)
	video_encode_h265_capability_row_unaligned_slice_segment_bit_khr       = int(0x00000004)
	video_encode_h265_capability_different_slice_segment_type_bit_khr      = int(0x00000008)
	video_encode_h265_capability_b_frame_in_l0_list_bit_khr                = int(0x00000010)
	video_encode_h265_capability_b_frame_in_l1_list_bit_khr                = int(0x00000020)
	video_encode_h265_capability_per_picture_type_min_max_qp_bit_khr       = int(0x00000040)
	video_encode_h265_capability_per_slice_segment_constant_qp_bit_khr     = int(0x00000080)
	video_encode_h265_capability_multiple_tiles_per_slice_segment_bit_khr  = int(0x00000100)
	video_encode_h265_capability_multiple_slice_segments_per_tile_bit_khr  = int(0x00000200)
	video_encode_h265_capability_cu_qp_diff_wraparound_bit_khr             = int(0x00000400)
	video_encode_h265_capability_flag_bits_max_enum_khr                    = int(0x7FFFFFFF)
}

pub type VideoEncodeH265CapabilityFlagsKHR = u32

pub enum VideoEncodeH265StdFlagBitsKHR {
	video_encode_h265_std_separate_color_plane_flag_set_bit_khr                = int(0x00000001)
	video_encode_h265_std_sample_adaptive_offset_enabled_flag_set_bit_khr      = int(0x00000002)
	video_encode_h265_std_scaling_list_data_present_flag_set_bit_khr           = int(0x00000004)
	video_encode_h265_std_pcm_enabled_flag_set_bit_khr                         = int(0x00000008)
	video_encode_h265_std_sps_temporal_mvp_enabled_flag_set_bit_khr            = int(0x00000010)
	video_encode_h265_std_init_qp_minus26_bit_khr                              = int(0x00000020)
	video_encode_h265_std_weighted_pred_flag_set_bit_khr                       = int(0x00000040)
	video_encode_h265_std_weighted_bipred_flag_set_bit_khr                     = int(0x00000080)
	video_encode_h265_std_log2_parallel_merge_level_minus2_bit_khr             = int(0x00000100)
	video_encode_h265_std_sign_data_hiding_enabled_flag_set_bit_khr            = int(0x00000200)
	video_encode_h265_std_transform_skip_enabled_flag_set_bit_khr              = int(0x00000400)
	video_encode_h265_std_transform_skip_enabled_flag_unset_bit_khr            = int(0x00000800)
	video_encode_h265_std_pps_slice_chroma_qp_offsets_present_flag_set_bit_khr = int(0x00001000)
	video_encode_h265_std_transquant_bypass_enabled_flag_set_bit_khr           = int(0x00002000)
	video_encode_h265_std_constrained_intra_pred_flag_set_bit_khr              = int(0x00004000)
	video_encode_h265_std_entropy_coding_sync_enabled_flag_set_bit_khr         = int(0x00008000)
	video_encode_h265_std_deblocking_filter_override_enabled_flag_set_bit_khr  = int(0x00010000)
	video_encode_h265_std_dependent_slice_segments_enabled_flag_set_bit_khr    = int(0x00020000)
	video_encode_h265_std_dependent_slice_segment_flag_set_bit_khr             = int(0x00040000)
	video_encode_h265_std_slice_qp_delta_bit_khr                               = int(0x00080000)
	video_encode_h265_std_different_slice_qp_delta_bit_khr                     = int(0x00100000)
	video_encode_h265_std_flag_bits_max_enum_khr                               = int(0x7FFFFFFF)
}

pub type VideoEncodeH265StdFlagsKHR = u32

pub enum VideoEncodeH265CtbSizeFlagBitsKHR {
	video_encode_h265_ctb_size16_bit_khr              = int(0x00000001)
	video_encode_h265_ctb_size32_bit_khr              = int(0x00000002)
	video_encode_h265_ctb_size64_bit_khr              = int(0x00000004)
	video_encode_h265_ctb_size_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeH265CtbSizeFlagsKHR = u32

pub enum VideoEncodeH265TransformBlockSizeFlagBitsKHR {
	video_encode_h265_transform_block_size4_bit_khr               = int(0x00000001)
	video_encode_h265_transform_block_size8_bit_khr               = int(0x00000002)
	video_encode_h265_transform_block_size16_bit_khr              = int(0x00000004)
	video_encode_h265_transform_block_size32_bit_khr              = int(0x00000008)
	video_encode_h265_transform_block_size_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeH265TransformBlockSizeFlagsKHR = u32

pub enum VideoEncodeH265RateControlFlagBitsKHR {
	video_encode_h265_rate_control_attempt_hrd_compliance_bit_khr            = int(0x00000001)
	video_encode_h265_rate_control_regular_gop_bit_khr                       = int(0x00000002)
	video_encode_h265_rate_control_reference_pattern_flat_bit_khr            = int(0x00000004)
	video_encode_h265_rate_control_reference_pattern_dyadic_bit_khr          = int(0x00000008)
	video_encode_h265_rate_control_temporal_sub_layer_pattern_dyadic_bit_khr = int(0x00000010)
	video_encode_h265_rate_control_flag_bits_max_enum_khr                    = int(0x7FFFFFFF)
}

pub type VideoEncodeH265RateControlFlagsKHR = u32

pub struct VideoEncodeH265CapabilitiesKHR {
pub mut:
	s_type                                   StructureType = StructureType.structure_type_video_encode_h265_capabilities_khr
	p_next                                   voidptr
	flags                                    VideoEncodeH265CapabilityFlagsKHR
	max_level_idc                            u32
	max_slice_segment_count                  u32
	max_tiles                                Extent2D
	ctb_sizes                                VideoEncodeH265CtbSizeFlagsKHR
	transform_block_sizes                    VideoEncodeH265TransformBlockSizeFlagsKHR
	max_p_picture_l0_reference_count         u32
	max_b_picture_l0_reference_count         u32
	max_l1_reference_count                   u32
	max_sub_layer_count                      u32
	expect_dyadic_temporal_sub_layer_pattern Bool32
	min_qp                                   i32
	max_qp                                   i32
	prefers_gop_remaining_frames             Bool32
	requires_gop_remaining_frames            Bool32
	std_syntax_flags                         VideoEncodeH265StdFlagsKHR
}

pub struct VideoEncodeH265SessionCreateInfoKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_video_encode_h265_session_create_info_khr
	p_next            voidptr
	use_max_level_idc Bool32
	max_level_idc     u32
}

pub struct VideoEncodeH265QpKHR {
pub mut:
	qp_i i32
	qp_p i32
	qp_b i32
}

pub struct VideoEncodeH265QualityLevelPropertiesKHR {
pub mut:
	s_type                              StructureType = StructureType.structure_type_video_encode_h265_quality_level_properties_khr
	p_next                              voidptr
	preferred_rate_control_flags        VideoEncodeH265RateControlFlagsKHR
	preferred_gop_frame_count           u32
	preferred_idr_period                u32
	preferred_consecutive_b_frame_count u32
	preferred_sub_layer_count           u32
	preferred_constant_qp               VideoEncodeH265QpKHR
	preferred_max_l0_reference_count    u32
	preferred_max_l1_reference_count    u32
}

pub struct VideoEncodeH265SessionParametersAddInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_h265_session_parameters_add_info_khr
	p_next        voidptr
	std_vps_count u32
	p_std_vp_ss   &C.StdVideoH265VideoParameterSet
	std_sps_count u32
	p_std_sp_ss   &C.StdVideoH265SequenceParameterSet
	std_pps_count u32
	p_std_pp_ss   &C.StdVideoH265PictureParameterSet
}

pub struct VideoEncodeH265SessionParametersCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_encode_h265_session_parameters_create_info_khr
	p_next                voidptr
	max_std_vps_count     u32
	max_std_sps_count     u32
	max_std_pps_count     u32
	p_parameters_add_info &VideoEncodeH265SessionParametersAddInfoKHR
}

pub struct VideoEncodeH265SessionParametersGetInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_h265_session_parameters_get_info_khr
	p_next        voidptr
	write_std_vps Bool32
	write_std_sps Bool32
	write_std_pps Bool32
	std_vps_id    u32
	std_sps_id    u32
	std_pps_id    u32
}

pub struct VideoEncodeH265SessionParametersFeedbackInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_encode_h265_session_parameters_feedback_info_khr
	p_next                voidptr
	has_std_vps_overrides Bool32
	has_std_sps_overrides Bool32
	has_std_pps_overrides Bool32
}

pub struct VideoEncodeH265NaluSliceSegmentInfoKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_video_encode_h265_nalu_slice_segment_info_khr
	p_next                     voidptr
	constant_qp                i32
	p_std_slice_segment_header &C.StdVideoEncodeH265SliceSegmentHeader
}

pub struct VideoEncodeH265PictureInfoKHR {
pub mut:
	s_type                         StructureType = StructureType.structure_type_video_encode_h265_picture_info_khr
	p_next                         voidptr
	nalu_slice_segment_entry_count u32
	p_nalu_slice_segment_entries   &VideoEncodeH265NaluSliceSegmentInfoKHR
	p_std_picture_info             &C.StdVideoEncodeH265PictureInfo
}

pub struct VideoEncodeH265DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_encode_h265_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &C.StdVideoEncodeH265ReferenceInfo
}

pub struct VideoEncodeH265ProfileInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_video_encode_h265_profile_info_khr
	p_next          voidptr
	std_profile_idc C.StdVideoH265ProfileIdc
}

pub struct VideoEncodeH265RateControlInfoKHR {
pub mut:
	s_type                    StructureType = StructureType.structure_type_video_encode_h265_rate_control_info_khr
	p_next                    voidptr
	flags                     VideoEncodeH265RateControlFlagsKHR
	gop_frame_count           u32
	idr_period                u32
	consecutive_b_frame_count u32
	sub_layer_count           u32
}

pub struct VideoEncodeH265FrameSizeKHR {
pub mut:
	frame_i_size u32
	frame_p_size u32
	frame_b_size u32
}

pub struct VideoEncodeH265RateControlLayerInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_encode_h265_rate_control_layer_info_khr
	p_next             voidptr
	use_min_qp         Bool32
	min_qp             VideoEncodeH265QpKHR
	use_max_qp         Bool32
	max_qp             VideoEncodeH265QpKHR
	use_max_frame_size Bool32
	max_frame_size     VideoEncodeH265FrameSizeKHR
}

pub struct VideoEncodeH265GopRemainingFrameInfoKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_video_encode_h265_gop_remaining_frame_info_khr
	p_next                   voidptr
	use_gop_remaining_frames Bool32
	gop_remaining_i          u32
	gop_remaining_p          u32
	gop_remaining_b          u32
}

#include "vk_video/vulkan_video_codec_h264std_decode.h"

pub const khr_video_decode_h264_spec_version = 9
pub const khr_video_decode_h264_extension_name = 'VK_KHR_video_decode_h264'

pub enum VideoDecodeH264PictureLayoutFlagBitsKHR {
	video_decode_h264_picture_layout_progressive_khr                      = int(0)
	video_decode_h264_picture_layout_interlaced_interleaved_lines_bit_khr = int(0x00000001)
	video_decode_h264_picture_layout_interlaced_separate_planes_bit_khr   = int(0x00000002)
	video_decode_h264_picture_layout_flag_bits_max_enum_khr               = int(0x7FFFFFFF)
}

pub type VideoDecodeH264PictureLayoutFlagsKHR = u32

pub struct VideoDecodeH264ProfileInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_video_decode_h264_profile_info_khr
	p_next          voidptr
	std_profile_idc C.StdVideoH264ProfileIdc
	picture_layout  VideoDecodeH264PictureLayoutFlagBitsKHR
}

pub struct VideoDecodeH264CapabilitiesKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_video_decode_h264_capabilities_khr
	p_next                   voidptr
	max_level_idc            C.StdVideoH264LevelIdc
	field_offset_granularity Offset2D
}

pub struct VideoDecodeH264SessionParametersAddInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_decode_h264_session_parameters_add_info_khr
	p_next        voidptr
	std_sps_count u32
	p_std_sp_ss   &C.StdVideoH264SequenceParameterSet
	std_pps_count u32
	p_std_pp_ss   &C.StdVideoH264PictureParameterSet
}

pub struct VideoDecodeH264SessionParametersCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_decode_h264_session_parameters_create_info_khr
	p_next                voidptr
	max_std_sps_count     u32
	max_std_pps_count     u32
	p_parameters_add_info &VideoDecodeH264SessionParametersAddInfoKHR
}

pub struct VideoDecodeH264PictureInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_decode_h264_picture_info_khr
	p_next             voidptr
	p_std_picture_info &C.StdVideoDecodeH264PictureInfo
	slice_count        u32
	p_slice_offsets    &u32
}

pub struct VideoDecodeH264DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_decode_h264_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &C.StdVideoDecodeH264ReferenceInfo
}

pub const khr_dynamic_rendering_spec_version = 1
pub const khr_dynamic_rendering_extension_name = 'VK_KHR_dynamic_rendering'

pub type RenderingFlagsKHR = u32
pub type RenderingFlagBitsKHR = RenderingFlagBits

pub type RenderingInfoKHR = RenderingInfo

pub type RenderingAttachmentInfoKHR = RenderingAttachmentInfo

pub type PipelineRenderingCreateInfoKHR = PipelineRenderingCreateInfo

pub type PhysicalDeviceDynamicRenderingFeaturesKHR = PhysicalDeviceDynamicRenderingFeatures

pub type CommandBufferInheritanceRenderingInfoKHR = CommandBufferInheritanceRenderingInfo

pub const khr_multiview_spec_version = 1
pub const khr_multiview_extension_name = 'VK_KHR_multiview'

pub type RenderPassMultiviewCreateInfoKHR = RenderPassMultiviewCreateInfo

pub type PhysicalDeviceMultiviewFeaturesKHR = PhysicalDeviceMultiviewFeatures

pub type PhysicalDeviceMultiviewPropertiesKHR = PhysicalDeviceMultiviewProperties

pub const khr_get_physical_device_properties_2_spec_version = 2
pub const khr_get_physical_device_properties_2_extension_name = 'VK_KHR_get_physical_device_properties2'

pub type PhysicalDeviceFeatures2KHR = PhysicalDeviceFeatures2

pub type PhysicalDeviceProperties2KHR = PhysicalDeviceProperties2

pub type FormatProperties2KHR = FormatProperties2

pub type ImageFormatProperties2KHR = ImageFormatProperties2

pub type PhysicalDeviceImageFormatInfo2KHR = PhysicalDeviceImageFormatInfo2

pub type QueueFamilyProperties2KHR = QueueFamilyProperties2

pub type PhysicalDeviceMemoryProperties2KHR = PhysicalDeviceMemoryProperties2

pub type SparseImageFormatProperties2KHR = SparseImageFormatProperties2

pub type PhysicalDeviceSparseImageFormatInfo2KHR = PhysicalDeviceSparseImageFormatInfo2

pub const khr_device_group_spec_version = 4
pub const khr_device_group_extension_name = 'VK_KHR_device_group'

pub type PeerMemoryFeatureFlagsKHR = u32
pub type PeerMemoryFeatureFlagBitsKHR = PeerMemoryFeatureFlagBits

pub type MemoryAllocateFlagsKHR = u32
pub type MemoryAllocateFlagBitsKHR = MemoryAllocateFlagBits

pub type MemoryAllocateFlagsInfoKHR = MemoryAllocateFlagsInfo

pub type DeviceGroupRenderPassBeginInfoKHR = DeviceGroupRenderPassBeginInfo

pub type DeviceGroupCommandBufferBeginInfoKHR = DeviceGroupCommandBufferBeginInfo

pub type DeviceGroupSubmitInfoKHR = DeviceGroupSubmitInfo

pub type DeviceGroupBindSparseInfoKHR = DeviceGroupBindSparseInfo

pub type BindBufferMemoryDeviceGroupInfoKHR = BindBufferMemoryDeviceGroupInfo

pub type BindImageMemoryDeviceGroupInfoKHR = BindImageMemoryDeviceGroupInfo

pub const khr_shader_draw_parameters_spec_version = 1
pub const khr_shader_draw_parameters_extension_name = 'VK_KHR_shader_draw_parameters'

pub const khr_maintenance_1_spec_version = 2
pub const khr_maintenance_1_extension_name = 'VK_KHR_maintenance1'
// VK_KHR_MAINTENANCE1_SPEC_VERSION is a deprecated alias
pub const khr_maintenance1_spec_version = khr_maintenance_1_spec_version
// VK_KHR_MAINTENANCE1_EXTENSION_NAME is a deprecated alias
pub const khr_maintenance1_extension_name = khr_maintenance_1_extension_name

pub type CommandPoolTrimFlagsKHR = u32

pub const khr_device_group_creation_spec_version = 1
pub const khr_device_group_creation_extension_name = 'VK_KHR_device_group_creation'
pub const max_device_group_size_khr = max_device_group_size

pub type PhysicalDeviceGroupPropertiesKHR = PhysicalDeviceGroupProperties

pub type DeviceGroupDeviceCreateInfoKHR = DeviceGroupDeviceCreateInfo

pub const khr_external_memory_capabilities_spec_version = 1
pub const khr_external_memory_capabilities_extension_name = 'VK_KHR_external_memory_capabilities'
pub const luid_size_khr = luid_size

pub type ExternalMemoryHandleTypeFlagsKHR = u32
pub type ExternalMemoryHandleTypeFlagBitsKHR = ExternalMemoryHandleTypeFlagBits

pub type ExternalMemoryFeatureFlagsKHR = u32
pub type ExternalMemoryFeatureFlagBitsKHR = ExternalMemoryFeatureFlagBits

pub type ExternalMemoryPropertiesKHR = ExternalMemoryProperties

pub type PhysicalDeviceExternalImageFormatInfoKHR = PhysicalDeviceExternalImageFormatInfo

pub type ExternalImageFormatPropertiesKHR = ExternalImageFormatProperties

pub type PhysicalDeviceExternalBufferInfoKHR = PhysicalDeviceExternalBufferInfo

pub type ExternalBufferPropertiesKHR = ExternalBufferProperties

pub type PhysicalDeviceIDPropertiesKHR = PhysicalDeviceIDProperties

pub const khr_external_memory_spec_version = 1
pub const khr_external_memory_extension_name = 'VK_KHR_external_memory'
pub const queue_family_external_khr = queue_family_external

pub type ExternalMemoryImageCreateInfoKHR = ExternalMemoryImageCreateInfo

pub type ExternalMemoryBufferCreateInfoKHR = ExternalMemoryBufferCreateInfo

pub type ExportMemoryAllocateInfoKHR = ExportMemoryAllocateInfo

pub const khr_external_memory_fd_spec_version = 1
pub const khr_external_memory_fd_extension_name = 'VK_KHR_external_memory_fd'

pub struct ImportMemoryFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_import_memory_fd_info_khr
	p_next      voidptr
	handle_type ExternalMemoryHandleTypeFlagBits
	fd          int
}

pub struct MemoryFdPropertiesKHR {
pub mut:
	s_type           StructureType = StructureType.structure_type_memory_fd_properties_khr
	p_next           voidptr
	memory_type_bits u32
}

pub struct MemoryGetFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_memory_get_fd_info_khr
	p_next      voidptr
	memory      C.DeviceMemory
	handle_type ExternalMemoryHandleTypeFlagBits
}

fn C.vkGetMemoryFdKHR(C.Device,
	&MemoryGetFdInfoKHR,
	&int) Result
pub fn get_memory_fd_khr(device C.Device,
	p_get_fd_info &MemoryGetFdInfoKHR,
	p_fd &int) Result {
	return C.vkGetMemoryFdKHR(device, p_get_fd_info, p_fd)
}

fn C.vkGetMemoryFdPropertiesKHR(C.Device,
	ExternalMemoryHandleTypeFlagBits,
	int,
	&MemoryFdPropertiesKHR) Result
pub fn get_memory_fd_properties_khr(device C.Device,
	handle_type ExternalMemoryHandleTypeFlagBits,
	fd int,
	p_memory_fd_properties &MemoryFdPropertiesKHR) Result {
	return C.vkGetMemoryFdPropertiesKHR(device, handle_type, fd, p_memory_fd_properties)
}

pub const khr_external_semaphore_capabilities_spec_version = 1
pub const khr_external_semaphore_capabilities_extension_name = 'VK_KHR_external_semaphore_capabilities'

pub type ExternalSemaphoreHandleTypeFlagsKHR = u32
pub type ExternalSemaphoreHandleTypeFlagBitsKHR = ExternalSemaphoreHandleTypeFlagBits

pub type ExternalSemaphoreFeatureFlagsKHR = u32
pub type ExternalSemaphoreFeatureFlagBitsKHR = ExternalSemaphoreFeatureFlagBits

pub type PhysicalDeviceExternalSemaphoreInfoKHR = PhysicalDeviceExternalSemaphoreInfo

pub type ExternalSemaphorePropertiesKHR = ExternalSemaphoreProperties

pub const khr_external_semaphore_spec_version = 1
pub const khr_external_semaphore_extension_name = 'VK_KHR_external_semaphore'

pub type SemaphoreImportFlagsKHR = u32
pub type SemaphoreImportFlagBitsKHR = SemaphoreImportFlagBits

pub type ExportSemaphoreCreateInfoKHR = ExportSemaphoreCreateInfo

pub const khr_external_semaphore_fd_spec_version = 1
pub const khr_external_semaphore_fd_extension_name = 'VK_KHR_external_semaphore_fd'

pub struct ImportSemaphoreFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_import_semaphore_fd_info_khr
	p_next      voidptr
	semaphore   C.Semaphore
	flags       SemaphoreImportFlags
	handle_type ExternalSemaphoreHandleTypeFlagBits
	fd          int
}

pub struct SemaphoreGetFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_semaphore_get_fd_info_khr
	p_next      voidptr
	semaphore   C.Semaphore
	handle_type ExternalSemaphoreHandleTypeFlagBits
}

fn C.vkImportSemaphoreFdKHR(C.Device,
	&ImportSemaphoreFdInfoKHR) Result
pub fn import_semaphore_fd_khr(device C.Device,
	p_import_semaphore_fd_info &ImportSemaphoreFdInfoKHR) Result {
	return C.vkImportSemaphoreFdKHR(device, p_import_semaphore_fd_info)
}

fn C.vkGetSemaphoreFdKHR(C.Device,
	&SemaphoreGetFdInfoKHR,
	&int) Result
pub fn get_semaphore_fd_khr(device C.Device,
	p_get_fd_info &SemaphoreGetFdInfoKHR,
	p_fd &int) Result {
	return C.vkGetSemaphoreFdKHR(device, p_get_fd_info, p_fd)
}

pub const khr_push_descriptor_spec_version = 2
pub const khr_push_descriptor_extension_name = 'VK_KHR_push_descriptor'

pub struct PhysicalDevicePushDescriptorPropertiesKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_push_descriptor_properties_khr
	p_next               voidptr
	max_push_descriptors u32
}

fn C.vkCmdPushDescriptorSetKHR(C.CommandBuffer,
	PipelineBindPoint,
	C.PipelineLayout,
	u32,
	u32,
	&WriteDescriptorSet)
pub fn cmd_push_descriptor_set_khr(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	layout C.PipelineLayout,
	set u32,
	descriptor_write_count u32,
	p_descriptor_writes &WriteDescriptorSet) {
	C.vkCmdPushDescriptorSetKHR(command_buffer, pipeline_bind_point, layout, set, descriptor_write_count,
		p_descriptor_writes)
}

fn C.vkCmdPushDescriptorSetWithTemplateKHR(C.CommandBuffer,
	C.DescriptorUpdateTemplate,
	C.PipelineLayout,
	u32,
	voidptr)
pub fn cmd_push_descriptor_set_with_template_khr(command_buffer C.CommandBuffer,
	descriptor_update_template C.DescriptorUpdateTemplate,
	layout C.PipelineLayout,
	set u32,
	p_data voidptr) {
	C.vkCmdPushDescriptorSetWithTemplateKHR(command_buffer, descriptor_update_template,
		layout, set, p_data)
}

pub const khr_shader_float16_int8_spec_version = 1
pub const khr_shader_float16_int8_extension_name = 'VK_KHR_shader_float16_int8'

pub type PhysicalDeviceShaderFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features

pub type PhysicalDeviceFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features

pub const khr_16bit_storage_spec_version = 1
pub const khr_16bit_storage_extension_name = 'VK_KHR_16bit_storage'

pub type PhysicalDevice16BitStorageFeaturesKHR = PhysicalDevice16BitStorageFeatures

pub const khr_incremental_present_spec_version = 2
pub const khr_incremental_present_extension_name = 'VK_KHR_incremental_present'

pub struct RectLayerKHR {
pub mut:
	offset Offset2D
	extent Extent2D
	layer  u32
}

pub struct PresentRegionKHR {
pub mut:
	rectangle_count u32
	p_rectangles    &RectLayerKHR
}

pub struct PresentRegionsKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_present_regions_khr
	p_next          voidptr
	swapchain_count u32
	p_regions       &PresentRegionKHR
}

pub type DescriptorUpdateTemplateKHR = voidptr

pub const khr_descriptor_update_template_spec_version = 1
pub const khr_descriptor_update_template_extension_name = 'VK_KHR_descriptor_update_template'

pub type DescriptorUpdateTemplateTypeKHR = DescriptorUpdateTemplateType

pub type DescriptorUpdateTemplateCreateFlagsKHR = u32
pub type DescriptorUpdateTemplateEntryKHR = DescriptorUpdateTemplateEntry

pub type DescriptorUpdateTemplateCreateInfoKHR = DescriptorUpdateTemplateCreateInfo

pub const khr_imageless_framebuffer_spec_version = 1
pub const khr_imageless_framebuffer_extension_name = 'VK_KHR_imageless_framebuffer'

pub type PhysicalDeviceImagelessFramebufferFeaturesKHR = PhysicalDeviceImagelessFramebufferFeatures

pub type FramebufferAttachmentsCreateInfoKHR = FramebufferAttachmentsCreateInfo

pub type FramebufferAttachmentImageInfoKHR = FramebufferAttachmentImageInfo

pub type RenderPassAttachmentBeginInfoKHR = RenderPassAttachmentBeginInfo

pub const khr_create_renderpass_2_spec_version = 1
pub const khr_create_renderpass_2_extension_name = 'VK_KHR_create_renderpass2'

pub type RenderPassCreateInfo2KHR = RenderPassCreateInfo2

pub type AttachmentDescription2KHR = AttachmentDescription2

pub type AttachmentReference2KHR = AttachmentReference2

pub type SubpassDescription2KHR = SubpassDescription2

pub type SubpassDependency2KHR = SubpassDependency2

pub type SubpassBeginInfoKHR = SubpassBeginInfo

pub type SubpassEndInfoKHR = SubpassEndInfo

pub const khr_shared_presentable_image_spec_version = 1
pub const khr_shared_presentable_image_extension_name = 'VK_KHR_shared_presentable_image'

pub struct SharedPresentSurfaceCapabilitiesKHR {
pub mut:
	s_type                               StructureType = StructureType.structure_type_shared_present_surface_capabilities_khr
	p_next                               voidptr
	shared_present_supported_usage_flags ImageUsageFlags
}

fn C.vkGetSwapchainStatusKHR(C.Device,
	C.SwapchainKHR) Result
pub fn get_swapchain_status_khr(device C.Device,
	swapchain C.SwapchainKHR) Result {
	return C.vkGetSwapchainStatusKHR(device, swapchain)
}

pub const khr_external_fence_capabilities_spec_version = 1
pub const khr_external_fence_capabilities_extension_name = 'VK_KHR_external_fence_capabilities'

pub type ExternalFenceHandleTypeFlagsKHR = u32
pub type ExternalFenceHandleTypeFlagBitsKHR = ExternalFenceHandleTypeFlagBits

pub type ExternalFenceFeatureFlagsKHR = u32
pub type ExternalFenceFeatureFlagBitsKHR = ExternalFenceFeatureFlagBits

pub type PhysicalDeviceExternalFenceInfoKHR = PhysicalDeviceExternalFenceInfo

pub type ExternalFencePropertiesKHR = ExternalFenceProperties

pub const khr_external_fence_spec_version = 1
pub const khr_external_fence_extension_name = 'VK_KHR_external_fence'

pub type FenceImportFlagsKHR = u32
pub type FenceImportFlagBitsKHR = FenceImportFlagBits

pub type ExportFenceCreateInfoKHR = ExportFenceCreateInfo

pub const khr_external_fence_fd_spec_version = 1
pub const khr_external_fence_fd_extension_name = 'VK_KHR_external_fence_fd'

pub struct ImportFenceFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_import_fence_fd_info_khr
	p_next      voidptr
	fence       C.Fence
	flags       FenceImportFlags
	handle_type ExternalFenceHandleTypeFlagBits
	fd          int
}

pub struct FenceGetFdInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_fence_get_fd_info_khr
	p_next      voidptr
	fence       C.Fence
	handle_type ExternalFenceHandleTypeFlagBits
}

fn C.vkImportFenceFdKHR(C.Device,
	&ImportFenceFdInfoKHR) Result
pub fn import_fence_fd_khr(device C.Device,
	p_import_fence_fd_info &ImportFenceFdInfoKHR) Result {
	return C.vkImportFenceFdKHR(device, p_import_fence_fd_info)
}

fn C.vkGetFenceFdKHR(C.Device,
	&FenceGetFdInfoKHR,
	&int) Result
pub fn get_fence_fd_khr(device C.Device,
	p_get_fd_info &FenceGetFdInfoKHR,
	p_fd &int) Result {
	return C.vkGetFenceFdKHR(device, p_get_fd_info, p_fd)
}

pub const khr_performance_query_spec_version = 1
pub const khr_performance_query_extension_name = 'VK_KHR_performance_query'

pub enum PerformanceCounterUnitKHR {
	performance_counter_unit_generic_khr          = int(0)
	performance_counter_unit_percentage_khr       = int(1)
	performance_counter_unit_nanoseconds_khr      = int(2)
	performance_counter_unit_bytes_khr            = int(3)
	performance_counter_unit_bytes_per_second_khr = int(4)
	performance_counter_unit_kelvin_khr           = int(5)
	performance_counter_unit_watts_khr            = int(6)
	performance_counter_unit_volts_khr            = int(7)
	performance_counter_unit_amps_khr             = int(8)
	performance_counter_unit_hertz_khr            = int(9)
	performance_counter_unit_cycles_khr           = int(10)
	performance_counter_unit_max_enum_khr         = int(0x7FFFFFFF)
}

pub enum PerformanceCounterScopeKHR {
	performance_counter_scope_command_buffer_khr = int(0)
	performance_counter_scope_render_pass_khr    = int(1)
	performance_counter_scope_command_khr        = int(2)
	performance_counter_scope_max_enum_khr       = int(0x7FFFFFFF)
}

pub enum PerformanceCounterStorageKHR {
	performance_counter_storage_int32_khr    = int(0)
	performance_counter_storage_int64_khr    = int(1)
	performance_counter_storage_uint32_khr   = int(2)
	performance_counter_storage_uint64_khr   = int(3)
	performance_counter_storage_float32_khr  = int(4)
	performance_counter_storage_float64_khr  = int(5)
	performance_counter_storage_max_enum_khr = int(0x7FFFFFFF)
}

pub enum PerformanceCounterDescriptionFlagBitsKHR {
	performance_counter_description_performance_impacting_bit_khr = int(0x00000001)
	performance_counter_description_concurrently_impacted_bit_khr = int(0x00000002)
	performance_counter_description_flag_bits_max_enum_khr        = int(0x7FFFFFFF)
}

pub type PerformanceCounterDescriptionFlagsKHR = u32

pub enum AcquireProfilingLockFlagBitsKHR {
	acquire_profiling_lock_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type AcquireProfilingLockFlagsKHR = u32

pub struct PhysicalDevicePerformanceQueryFeaturesKHR {
pub mut:
	s_type                                   StructureType = StructureType.structure_type_physical_device_performance_query_features_khr
	p_next                                   voidptr
	performance_counter_query_pools          Bool32
	performance_counter_multiple_query_pools Bool32
}

pub struct PhysicalDevicePerformanceQueryPropertiesKHR {
pub mut:
	s_type                            StructureType = StructureType.structure_type_physical_device_performance_query_properties_khr
	p_next                            voidptr
	allow_command_buffer_query_copies Bool32
}

pub struct PerformanceCounterKHR {
pub mut:
	s_type  StructureType = StructureType.structure_type_performance_counter_khr
	p_next  voidptr
	unit    PerformanceCounterUnitKHR
	scope   PerformanceCounterScopeKHR
	storage PerformanceCounterStorageKHR
	uuid    [uuid_size]u8
}

pub struct PerformanceCounterDescriptionKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_performance_counter_description_khr
	p_next      voidptr
	flags       PerformanceCounterDescriptionFlagsKHR
	name        [max_description_size]char
	category    [max_description_size]char
	description [max_description_size]char
}

pub struct QueryPoolPerformanceCreateInfoKHR {
pub mut:
	s_type              StructureType = StructureType.structure_type_query_pool_performance_create_info_khr
	p_next              voidptr
	queue_family_index  u32
	counter_index_count u32
	p_counter_indices   &u32
}

pub union PerformanceCounterResultKHR {
pub mut:
	int32   i32
	int64   i64
	uint32  u32
	uint64  u64
	float32 f32
	float64 f64
}

pub struct AcquireProfilingLockInfoKHR {
pub mut:
	s_type  StructureType = StructureType.structure_type_acquire_profiling_lock_info_khr
	p_next  voidptr
	flags   AcquireProfilingLockFlagsKHR
	timeout u64
}

pub struct PerformanceQuerySubmitInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_performance_query_submit_info_khr
	p_next             voidptr
	counter_pass_index u32
}

fn C.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(C.PhysicalDevice,
	u32,
	&u32,
	&PerformanceCounterKHR,
	&PerformanceCounterDescriptionKHR) Result
pub fn enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device C.PhysicalDevice,
	queue_family_index u32,
	p_counter_count &u32,
	p_counters &PerformanceCounterKHR,
	p_counter_descriptions &PerformanceCounterDescriptionKHR) Result {
	return C.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device,
		queue_family_index, p_counter_count, p_counters, p_counter_descriptions)
}

fn C.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(C.PhysicalDevice,
	&QueryPoolPerformanceCreateInfoKHR,
	&u32)
pub fn get_physical_device_queue_family_performance_query_passes_khr(physical_device C.PhysicalDevice,
	p_performance_query_create_info &QueryPoolPerformanceCreateInfoKHR,
	p_num_passes &u32) {
	C.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(physical_device, p_performance_query_create_info,
		p_num_passes)
}

fn C.vkAcquireProfilingLockKHR(C.Device,
	&AcquireProfilingLockInfoKHR) Result
pub fn acquire_profiling_lock_khr(device C.Device,
	p_info &AcquireProfilingLockInfoKHR) Result {
	return C.vkAcquireProfilingLockKHR(device, p_info)
}

fn C.vkReleaseProfilingLockKHR(C.Device)
pub fn release_profiling_lock_khr(device C.Device) {
	C.vkReleaseProfilingLockKHR(device)
}

pub const khr_maintenance_2_spec_version = 1
pub const khr_maintenance_2_extension_name = 'VK_KHR_maintenance2'
// VK_KHR_MAINTENANCE2_SPEC_VERSION is a deprecated alias
pub const khr_maintenance2_spec_version = khr_maintenance_2_spec_version
// VK_KHR_MAINTENANCE2_EXTENSION_NAME is a deprecated alias
pub const khr_maintenance2_extension_name = khr_maintenance_2_extension_name

pub type PointClippingBehaviorKHR = PointClippingBehavior

pub type TessellationDomainOriginKHR = TessellationDomainOrigin

pub type PhysicalDevicePointClippingPropertiesKHR = PhysicalDevicePointClippingProperties

pub type RenderPassInputAttachmentAspectCreateInfoKHR = RenderPassInputAttachmentAspectCreateInfo

pub type InputAttachmentAspectReferenceKHR = InputAttachmentAspectReference

pub type ImageViewUsageCreateInfoKHR = ImageViewUsageCreateInfo

pub type PipelineTessellationDomainOriginStateCreateInfoKHR = PipelineTessellationDomainOriginStateCreateInfo

pub const khr_get_surface_capabilities_2_spec_version = 1
pub const khr_get_surface_capabilities_2_extension_name = 'VK_KHR_get_surface_capabilities2'

pub struct PhysicalDeviceSurfaceInfo2KHR {
pub mut:
	s_type  StructureType = StructureType.structure_type_physical_device_surface_info2_khr
	p_next  voidptr
	surface C.SurfaceKHR
}

pub struct SurfaceCapabilities2KHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_surface_capabilities2_khr
	p_next               voidptr
	surface_capabilities SurfaceCapabilitiesKHR
}

pub struct SurfaceFormat2KHR {
pub mut:
	s_type         StructureType = StructureType.structure_type_surface_format2_khr
	p_next         voidptr
	surface_format SurfaceFormatKHR
}

fn C.vkGetPhysicalDeviceSurfaceCapabilities2KHR(C.PhysicalDevice,
	&PhysicalDeviceSurfaceInfo2KHR,
	&SurfaceCapabilities2KHR) Result
pub fn get_physical_device_surface_capabilities2_khr(physical_device C.PhysicalDevice,
	p_surface_info &PhysicalDeviceSurfaceInfo2KHR,
	p_surface_capabilities &SurfaceCapabilities2KHR) Result {
	return C.vkGetPhysicalDeviceSurfaceCapabilities2KHR(physical_device, p_surface_info,
		p_surface_capabilities)
}

fn C.vkGetPhysicalDeviceSurfaceFormats2KHR(C.PhysicalDevice,
	&PhysicalDeviceSurfaceInfo2KHR,
	&u32,
	&SurfaceFormat2KHR) Result
pub fn get_physical_device_surface_formats2_khr(physical_device C.PhysicalDevice,
	p_surface_info &PhysicalDeviceSurfaceInfo2KHR,
	p_surface_format_count &u32,
	p_surface_formats &SurfaceFormat2KHR) Result {
	return C.vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device, p_surface_info, p_surface_format_count,
		p_surface_formats)
}

pub const khr_variable_pointers_spec_version = 1
pub const khr_variable_pointers_extension_name = 'VK_KHR_variable_pointers'

pub type PhysicalDeviceVariablePointerFeaturesKHR = PhysicalDeviceVariablePointersFeatures

pub type PhysicalDeviceVariablePointersFeaturesKHR = PhysicalDeviceVariablePointersFeatures

pub const khr_get_display_properties_2_spec_version = 1
pub const khr_get_display_properties_2_extension_name = 'VK_KHR_get_display_properties2'

pub struct DisplayProperties2KHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_display_properties2_khr
	p_next             voidptr
	display_properties DisplayPropertiesKHR
}

pub struct DisplayPlaneProperties2KHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_display_plane_properties2_khr
	p_next                   voidptr
	display_plane_properties DisplayPlanePropertiesKHR
}

pub struct DisplayModeProperties2KHR {
pub mut:
	s_type                  StructureType = StructureType.structure_type_display_mode_properties2_khr
	p_next                  voidptr
	display_mode_properties DisplayModePropertiesKHR
}

pub struct DisplayPlaneInfo2KHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_display_plane_info2_khr
	p_next      voidptr
	mode        C.DisplayModeKHR
	plane_index u32
}

pub struct DisplayPlaneCapabilities2KHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_display_plane_capabilities2_khr
	p_next       voidptr
	capabilities DisplayPlaneCapabilitiesKHR
}

fn C.vkGetPhysicalDeviceDisplayProperties2KHR(C.PhysicalDevice,
	&u32,
	&DisplayProperties2KHR) Result
pub fn get_physical_device_display_properties2_khr(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &DisplayProperties2KHR) Result {
	return C.vkGetPhysicalDeviceDisplayProperties2KHR(physical_device, p_property_count,
		p_properties)
}

fn C.vkGetPhysicalDeviceDisplayPlaneProperties2KHR(C.PhysicalDevice,
	&u32,
	&DisplayPlaneProperties2KHR) Result
pub fn get_physical_device_display_plane_properties2_khr(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &DisplayPlaneProperties2KHR) Result {
	return C.vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device, p_property_count,
		p_properties)
}

fn C.vkGetDisplayModeProperties2KHR(C.PhysicalDevice,
	C.DisplayKHR,
	&u32,
	&DisplayModeProperties2KHR) Result
pub fn get_display_mode_properties2_khr(physical_device C.PhysicalDevice,
	display C.DisplayKHR,
	p_property_count &u32,
	p_properties &DisplayModeProperties2KHR) Result {
	return C.vkGetDisplayModeProperties2KHR(physical_device, display, p_property_count,
		p_properties)
}

fn C.vkGetDisplayPlaneCapabilities2KHR(C.PhysicalDevice,
	&DisplayPlaneInfo2KHR,
	&DisplayPlaneCapabilities2KHR) Result
pub fn get_display_plane_capabilities2_khr(physical_device C.PhysicalDevice,
	p_display_plane_info &DisplayPlaneInfo2KHR,
	p_capabilities &DisplayPlaneCapabilities2KHR) Result {
	return C.vkGetDisplayPlaneCapabilities2KHR(physical_device, p_display_plane_info,
		p_capabilities)
}

pub const khr_dedicated_allocation_spec_version = 3
pub const khr_dedicated_allocation_extension_name = 'VK_KHR_dedicated_allocation'

pub type MemoryDedicatedRequirementsKHR = MemoryDedicatedRequirements

pub type MemoryDedicatedAllocateInfoKHR = MemoryDedicatedAllocateInfo

pub const khr_storage_buffer_storage_class_spec_version = 1
pub const khr_storage_buffer_storage_class_extension_name = 'VK_KHR_storage_buffer_storage_class'

pub const khr_relaxed_block_layout_spec_version = 1
pub const khr_relaxed_block_layout_extension_name = 'VK_KHR_relaxed_block_layout'

pub const khr_get_memory_requirements_2_spec_version = 1
pub const khr_get_memory_requirements_2_extension_name = 'VK_KHR_get_memory_requirements2'

pub type BufferMemoryRequirementsInfo2KHR = BufferMemoryRequirementsInfo2

pub type ImageMemoryRequirementsInfo2KHR = ImageMemoryRequirementsInfo2

pub type ImageSparseMemoryRequirementsInfo2KHR = ImageSparseMemoryRequirementsInfo2

pub type MemoryRequirements2KHR = MemoryRequirements2

pub type SparseImageMemoryRequirements2KHR = SparseImageMemoryRequirements2

pub const khr_image_format_list_spec_version = 1
pub const khr_image_format_list_extension_name = 'VK_KHR_image_format_list'

pub type ImageFormatListCreateInfoKHR = ImageFormatListCreateInfo

pub type SamplerYcbcrConversionKHR = voidptr

pub const khr_sampler_ycbcr_conversion_spec_version = 14
pub const khr_sampler_ycbcr_conversion_extension_name = 'VK_KHR_sampler_ycbcr_conversion'

pub type SamplerYcbcrModelConversionKHR = SamplerYcbcrModelConversion

pub type SamplerYcbcrRangeKHR = SamplerYcbcrRange

pub type ChromaLocationKHR = ChromaLocation

pub type SamplerYcbcrConversionCreateInfoKHR = SamplerYcbcrConversionCreateInfo

pub type SamplerYcbcrConversionInfoKHR = SamplerYcbcrConversionInfo

pub type BindImagePlaneMemoryInfoKHR = BindImagePlaneMemoryInfo

pub type ImagePlaneMemoryRequirementsInfoKHR = ImagePlaneMemoryRequirementsInfo

pub type PhysicalDeviceSamplerYcbcrConversionFeaturesKHR = PhysicalDeviceSamplerYcbcrConversionFeatures

pub type SamplerYcbcrConversionImageFormatPropertiesKHR = SamplerYcbcrConversionImageFormatProperties

pub const khr_bind_memory_2_spec_version = 1
pub const khr_bind_memory_2_extension_name = 'VK_KHR_bind_memory2'

pub type BindBufferMemoryInfoKHR = BindBufferMemoryInfo

pub type BindImageMemoryInfoKHR = BindImageMemoryInfo

pub const khr_maintenance_3_spec_version = 1
pub const khr_maintenance_3_extension_name = 'VK_KHR_maintenance3'
// VK_KHR_MAINTENANCE3_SPEC_VERSION is a deprecated alias
pub const khr_maintenance3_spec_version = khr_maintenance_3_spec_version
// VK_KHR_MAINTENANCE3_EXTENSION_NAME is a deprecated alias
pub const khr_maintenance3_extension_name = khr_maintenance_3_extension_name

pub type PhysicalDeviceMaintenance3PropertiesKHR = PhysicalDeviceMaintenance3Properties

pub type DescriptorSetLayoutSupportKHR = DescriptorSetLayoutSupport

pub const khr_draw_indirect_count_spec_version = 1
pub const khr_draw_indirect_count_extension_name = 'VK_KHR_draw_indirect_count'

pub const khr_shader_subgroup_extended_types_spec_version = 1
pub const khr_shader_subgroup_extended_types_extension_name = 'VK_KHR_shader_subgroup_extended_types'

pub type PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR = PhysicalDeviceShaderSubgroupExtendedTypesFeatures

pub const khr_8bit_storage_spec_version = 1
pub const khr_8bit_storage_extension_name = 'VK_KHR_8bit_storage'

pub type PhysicalDevice8BitStorageFeaturesKHR = PhysicalDevice8BitStorageFeatures

pub const khr_shader_atomic_int64_spec_version = 1
pub const khr_shader_atomic_int64_extension_name = 'VK_KHR_shader_atomic_int64'

pub type PhysicalDeviceShaderAtomicInt64FeaturesKHR = PhysicalDeviceShaderAtomicInt64Features

pub const khr_shader_clock_spec_version = 1
pub const khr_shader_clock_extension_name = 'VK_KHR_shader_clock'

pub struct PhysicalDeviceShaderClockFeaturesKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_shader_clock_features_khr
	p_next                voidptr
	shader_subgroup_clock Bool32
	shader_device_clock   Bool32
}

#include "vk_video/vulkan_video_codec_h265std_decode.h"

pub const khr_video_decode_h265_spec_version = 8
pub const khr_video_decode_h265_extension_name = 'VK_KHR_video_decode_h265'

pub struct VideoDecodeH265ProfileInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_video_decode_h265_profile_info_khr
	p_next          voidptr
	std_profile_idc C.StdVideoH265ProfileIdc
}

pub struct VideoDecodeH265CapabilitiesKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_decode_h265_capabilities_khr
	p_next        voidptr
	max_level_idc u32
}

pub struct VideoDecodeH265SessionParametersAddInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_decode_h265_session_parameters_add_info_khr
	p_next        voidptr
	std_vps_count u32
	p_std_vp_ss   &C.StdVideoH265VideoParameterSet
	std_sps_count u32
	p_std_sp_ss   &C.StdVideoH265SequenceParameterSet
	std_pps_count u32
	p_std_pp_ss   &C.StdVideoH265PictureParameterSet
}

pub struct VideoDecodeH265SessionParametersCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_decode_h265_session_parameters_create_info_khr
	p_next                voidptr
	max_std_vps_count     u32
	max_std_sps_count     u32
	max_std_pps_count     u32
	p_parameters_add_info &VideoDecodeH265SessionParametersAddInfoKHR
}

pub struct VideoDecodeH265PictureInfoKHR {
pub mut:
	s_type                  StructureType = StructureType.structure_type_video_decode_h265_picture_info_khr
	p_next                  voidptr
	p_std_picture_info      &C.StdVideoDecodeH265PictureInfo
	slice_segment_count     u32
	p_slice_segment_offsets &u32
}

pub struct VideoDecodeH265DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_decode_h265_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &C.StdVideoDecodeH265ReferenceInfo
}

pub const max_global_priority_size_khr = u32(16)
pub const khr_global_priority_spec_version = 1
pub const khr_global_priority_extension_name = 'VK_KHR_global_priority'

pub enum QueueGlobalPriorityKHR {
	queue_global_priority_low_khr      = int(128)
	queue_global_priority_medium_khr   = int(256)
	queue_global_priority_high_khr     = int(512)
	queue_global_priority_realtime_khr = int(1024)
	queue_global_priority_max_enum_khr = int(0x7FFFFFFF)
}

pub struct DeviceQueueGlobalPriorityCreateInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_device_queue_global_priority_create_info_khr
	p_next          voidptr
	global_priority QueueGlobalPriorityKHR
}

pub struct PhysicalDeviceGlobalPriorityQueryFeaturesKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_global_priority_query_features_khr
	p_next                voidptr
	global_priority_query Bool32
}

pub struct QueueFamilyGlobalPriorityPropertiesKHR {
pub mut:
	s_type         StructureType = StructureType.structure_type_queue_family_global_priority_properties_khr
	p_next         voidptr
	priority_count u32
	priorities     [max_global_priority_size_khr]QueueGlobalPriorityKHR
}

pub const khr_driver_properties_spec_version = 1
pub const khr_driver_properties_extension_name = 'VK_KHR_driver_properties'
pub const max_driver_name_size_khr = max_driver_name_size
pub const max_driver_info_size_khr = max_driver_info_size

pub type DriverIdKHR = DriverId

pub type ConformanceVersionKHR = ConformanceVersion

pub type PhysicalDeviceDriverPropertiesKHR = PhysicalDeviceDriverProperties

pub const khr_shader_float_controls_spec_version = 4
pub const khr_shader_float_controls_extension_name = 'VK_KHR_shader_float_controls'

pub type ShaderFloatControlsIndependenceKHR = ShaderFloatControlsIndependence

pub type PhysicalDeviceFloatControlsPropertiesKHR = PhysicalDeviceFloatControlsProperties

pub const khr_depth_stencil_resolve_spec_version = 1
pub const khr_depth_stencil_resolve_extension_name = 'VK_KHR_depth_stencil_resolve'

pub type ResolveModeFlagBitsKHR = ResolveModeFlagBits

pub type ResolveModeFlagsKHR = u32
pub type SubpassDescriptionDepthStencilResolveKHR = SubpassDescriptionDepthStencilResolve

pub type PhysicalDeviceDepthStencilResolvePropertiesKHR = PhysicalDeviceDepthStencilResolveProperties

pub const khr_swapchain_mutable_format_spec_version = 1
pub const khr_swapchain_mutable_format_extension_name = 'VK_KHR_swapchain_mutable_format'

pub const khr_timeline_semaphore_spec_version = 2
pub const khr_timeline_semaphore_extension_name = 'VK_KHR_timeline_semaphore'

pub type SemaphoreTypeKHR = SemaphoreType

pub type SemaphoreWaitFlagBitsKHR = SemaphoreWaitFlagBits

pub type SemaphoreWaitFlagsKHR = u32
pub type PhysicalDeviceTimelineSemaphoreFeaturesKHR = PhysicalDeviceTimelineSemaphoreFeatures

pub type PhysicalDeviceTimelineSemaphorePropertiesKHR = PhysicalDeviceTimelineSemaphoreProperties

pub type SemaphoreTypeCreateInfoKHR = SemaphoreTypeCreateInfo

pub type TimelineSemaphoreSubmitInfoKHR = TimelineSemaphoreSubmitInfo

pub type SemaphoreWaitInfoKHR = SemaphoreWaitInfo

pub type SemaphoreSignalInfoKHR = SemaphoreSignalInfo

pub const khr_vulkan_memory_model_spec_version = 3
pub const khr_vulkan_memory_model_extension_name = 'VK_KHR_vulkan_memory_model'

pub type PhysicalDeviceVulkanMemoryModelFeaturesKHR = PhysicalDeviceVulkanMemoryModelFeatures

pub const khr_shader_terminate_invocation_spec_version = 1
pub const khr_shader_terminate_invocation_extension_name = 'VK_KHR_shader_terminate_invocation'

pub type PhysicalDeviceShaderTerminateInvocationFeaturesKHR = PhysicalDeviceShaderTerminateInvocationFeatures

pub const khr_fragment_shading_rate_spec_version = 2
pub const khr_fragment_shading_rate_extension_name = 'VK_KHR_fragment_shading_rate'

pub enum FragmentShadingRateCombinerOpKHR {
	fragment_shading_rate_combiner_op_keep_khr     = int(0)
	fragment_shading_rate_combiner_op_replace_khr  = int(1)
	fragment_shading_rate_combiner_op_min_khr      = int(2)
	fragment_shading_rate_combiner_op_max_khr      = int(3)
	fragment_shading_rate_combiner_op_mul_khr      = int(4)
	fragment_shading_rate_combiner_op_max_enum_khr = int(0x7FFFFFFF)
}

pub struct FragmentShadingRateAttachmentInfoKHR {
pub mut:
	s_type                             StructureType = StructureType.structure_type_fragment_shading_rate_attachment_info_khr
	p_next                             voidptr
	p_fragment_shading_rate_attachment &AttachmentReference2
	shading_rate_attachment_texel_size Extent2D
}

pub struct PipelineFragmentShadingRateStateCreateInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_pipeline_fragment_shading_rate_state_create_info_khr
	p_next        voidptr
	fragment_size Extent2D
	combiner_ops  [2]FragmentShadingRateCombinerOpKHR
}

pub struct PhysicalDeviceFragmentShadingRateFeaturesKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_fragment_shading_rate_features_khr
	p_next                           voidptr
	pipeline_fragment_shading_rate   Bool32
	primitive_fragment_shading_rate  Bool32
	attachment_fragment_shading_rate Bool32
}

pub struct PhysicalDeviceFragmentShadingRatePropertiesKHR {
pub mut:
	s_type                                                       StructureType = StructureType.structure_type_physical_device_fragment_shading_rate_properties_khr
	p_next                                                       voidptr
	min_fragment_shading_rate_attachment_texel_size              Extent2D
	max_fragment_shading_rate_attachment_texel_size              Extent2D
	max_fragment_shading_rate_attachment_texel_size_aspect_ratio u32
	primitive_fragment_shading_rate_with_multiple_viewports      Bool32
	layered_shading_rate_attachments                             Bool32
	fragment_shading_rate_non_trivial_combiner_ops               Bool32
	max_fragment_size                                            Extent2D
	max_fragment_size_aspect_ratio                               u32
	max_fragment_shading_rate_coverage_samples                   u32
	max_fragment_shading_rate_rasterization_samples              SampleCountFlagBits
	fragment_shading_rate_with_shader_depth_stencil_writes       Bool32
	fragment_shading_rate_with_sample_mask                       Bool32
	fragment_shading_rate_with_shader_sample_mask                Bool32
	fragment_shading_rate_with_conservative_rasterization        Bool32
	fragment_shading_rate_with_fragment_shader_interlock         Bool32
	fragment_shading_rate_with_custom_sample_locations           Bool32
	fragment_shading_rate_strict_multiply_combiner               Bool32
}

pub struct PhysicalDeviceFragmentShadingRateKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_physical_device_fragment_shading_rate_khr
	p_next        voidptr
	sample_counts SampleCountFlags
	fragment_size Extent2D
}

pub struct RenderingFragmentShadingRateAttachmentInfoKHR {
pub mut:
	s_type                             StructureType = StructureType.structure_type_rendering_fragment_shading_rate_attachment_info_khr
	p_next                             voidptr
	image_view                         C.ImageView
	image_layout                       ImageLayout
	shading_rate_attachment_texel_size Extent2D
}

fn C.vkGetPhysicalDeviceFragmentShadingRatesKHR(C.PhysicalDevice,
	&u32,
	&PhysicalDeviceFragmentShadingRateKHR) Result
pub fn get_physical_device_fragment_shading_rates_khr(physical_device C.PhysicalDevice,
	p_fragment_shading_rate_count &u32,
	p_fragment_shading_rates &PhysicalDeviceFragmentShadingRateKHR) Result {
	return C.vkGetPhysicalDeviceFragmentShadingRatesKHR(physical_device, p_fragment_shading_rate_count,
		p_fragment_shading_rates)
}

fn C.vkCmdSetFragmentShadingRateKHR(C.CommandBuffer,
	&Extent2D,
	[2]FragmentShadingRateCombinerOpKHR)
pub fn cmd_set_fragment_shading_rate_khr(command_buffer C.CommandBuffer,
	p_fragment_size &Extent2D,
	combiner_ops [2]FragmentShadingRateCombinerOpKHR) {
	C.vkCmdSetFragmentShadingRateKHR(command_buffer, p_fragment_size, combiner_ops)
}

pub const khr_dynamic_rendering_local_read_spec_version = 1
pub const khr_dynamic_rendering_local_read_extension_name = 'VK_KHR_dynamic_rendering_local_read'

pub struct PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_dynamic_rendering_local_read_features_khr
	p_next                       voidptr
	dynamic_rendering_local_read Bool32
}

pub struct RenderingAttachmentLocationInfoKHR {
pub mut:
	s_type                       StructureType = StructureType.structure_type_rendering_attachment_location_info_khr
	p_next                       voidptr
	color_attachment_count       u32
	p_color_attachment_locations &u32
}

pub struct RenderingInputAttachmentIndexInfoKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_rendering_input_attachment_index_info_khr
	p_next                           voidptr
	color_attachment_count           u32
	p_color_attachment_input_indices &u32
	p_depth_input_attachment_index   &u32
	p_stencil_input_attachment_index &u32
}

fn C.vkCmdSetRenderingAttachmentLocationsKHR(C.CommandBuffer,
	&RenderingAttachmentLocationInfoKHR)
pub fn cmd_set_rendering_attachment_locations_khr(command_buffer C.CommandBuffer,
	p_location_info &RenderingAttachmentLocationInfoKHR) {
	C.vkCmdSetRenderingAttachmentLocationsKHR(command_buffer, p_location_info)
}

fn C.vkCmdSetRenderingInputAttachmentIndicesKHR(C.CommandBuffer,
	&RenderingInputAttachmentIndexInfoKHR)
pub fn cmd_set_rendering_input_attachment_indices_khr(command_buffer C.CommandBuffer,
	p_input_attachment_index_info &RenderingInputAttachmentIndexInfoKHR) {
	C.vkCmdSetRenderingInputAttachmentIndicesKHR(command_buffer, p_input_attachment_index_info)
}

pub const khr_shader_quad_control_spec_version = 1
pub const khr_shader_quad_control_extension_name = 'VK_KHR_shader_quad_control'

pub struct PhysicalDeviceShaderQuadControlFeaturesKHR {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_shader_quad_control_features_khr
	p_next              voidptr
	shader_quad_control Bool32
}

pub const khr_spirv_1_4_spec_version = 1
pub const khr_spirv_1_4_extension_name = 'VK_KHR_spirv_1_4'

pub const khr_surface_protected_capabilities_spec_version = 1
pub const khr_surface_protected_capabilities_extension_name = 'VK_KHR_surface_protected_capabilities'

pub struct SurfaceProtectedCapabilitiesKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_surface_protected_capabilities_khr
	p_next             voidptr
	supports_protected Bool32
}

pub const khr_separate_depth_stencil_layouts_spec_version = 1
pub const khr_separate_depth_stencil_layouts_extension_name = 'VK_KHR_separate_depth_stencil_layouts'

pub type PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR = PhysicalDeviceSeparateDepthStencilLayoutsFeatures

pub type AttachmentReferenceStencilLayoutKHR = AttachmentReferenceStencilLayout

pub type AttachmentDescriptionStencilLayoutKHR = AttachmentDescriptionStencilLayout

pub const khr_present_wait_spec_version = 1
pub const khr_present_wait_extension_name = 'VK_KHR_present_wait'

pub struct PhysicalDevicePresentWaitFeaturesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_present_wait_features_khr
	p_next       voidptr
	present_wait Bool32
}

fn C.vkWaitForPresentKHR(C.Device,
	C.SwapchainKHR,
	u64,
	u64) Result
pub fn wait_for_present_khr(device C.Device,
	swapchain C.SwapchainKHR,
	present_id u64,
	timeout u64) Result {
	return C.vkWaitForPresentKHR(device, swapchain, present_id, timeout)
}

pub const khr_uniform_buffer_standard_layout_spec_version = 1
pub const khr_uniform_buffer_standard_layout_extension_name = 'VK_KHR_uniform_buffer_standard_layout'

pub type PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR = PhysicalDeviceUniformBufferStandardLayoutFeatures

pub const khr_buffer_device_address_spec_version = 1
pub const khr_buffer_device_address_extension_name = 'VK_KHR_buffer_device_address'

pub type PhysicalDeviceBufferDeviceAddressFeaturesKHR = PhysicalDeviceBufferDeviceAddressFeatures

pub type BufferDeviceAddressInfoKHR = BufferDeviceAddressInfo

pub type BufferOpaqueCaptureAddressCreateInfoKHR = BufferOpaqueCaptureAddressCreateInfo

pub type MemoryOpaqueCaptureAddressAllocateInfoKHR = MemoryOpaqueCaptureAddressAllocateInfo

pub type DeviceMemoryOpaqueCaptureAddressInfoKHR = DeviceMemoryOpaqueCaptureAddressInfo

pub type C.DeferredOperationKHR = voidptr

pub const khr_deferred_host_operations_spec_version = 4
pub const khr_deferred_host_operations_extension_name = 'VK_KHR_deferred_host_operations'

fn C.vkCreateDeferredOperationKHR(C.Device,
	&AllocationCallbacks,
	&C.DeferredOperationKHR) Result
pub fn create_deferred_operation_khr(device C.Device,
	p_allocator &AllocationCallbacks,
	p_deferred_operation &C.DeferredOperationKHR) Result {
	return C.vkCreateDeferredOperationKHR(device, p_allocator, p_deferred_operation)
}

fn C.vkDestroyDeferredOperationKHR(C.Device,
	C.DeferredOperationKHR,
	&AllocationCallbacks)
pub fn destroy_deferred_operation_khr(device C.Device,
	operation C.DeferredOperationKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDeferredOperationKHR(device, operation, p_allocator)
}

fn C.vkGetDeferredOperationMaxConcurrencyKHR(C.Device,
	C.DeferredOperationKHR) u32
pub fn get_deferred_operation_max_concurrency_khr(device C.Device,
	operation C.DeferredOperationKHR) u32 {
	return C.vkGetDeferredOperationMaxConcurrencyKHR(device, operation)
}

fn C.vkGetDeferredOperationResultKHR(C.Device,
	C.DeferredOperationKHR) Result
pub fn get_deferred_operation_result_khr(device C.Device,
	operation C.DeferredOperationKHR) Result {
	return C.vkGetDeferredOperationResultKHR(device, operation)
}

fn C.vkDeferredOperationJoinKHR(C.Device,
	C.DeferredOperationKHR) Result
pub fn deferred_operation_join_khr(device C.Device,
	operation C.DeferredOperationKHR) Result {
	return C.vkDeferredOperationJoinKHR(device, operation)
}

pub const khr_pipeline_executable_properties_spec_version = 1
pub const khr_pipeline_executable_properties_extension_name = 'VK_KHR_pipeline_executable_properties'

pub enum PipelineExecutableStatisticFormatKHR {
	pipeline_executable_statistic_format_bool32_khr   = int(0)
	pipeline_executable_statistic_format_int64_khr    = int(1)
	pipeline_executable_statistic_format_uint64_khr   = int(2)
	pipeline_executable_statistic_format_float64_khr  = int(3)
	pipeline_executable_statistic_format_max_enum_khr = int(0x7FFFFFFF)
}

pub struct PhysicalDevicePipelineExecutablePropertiesFeaturesKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_pipeline_executable_properties_features_khr
	p_next                   voidptr
	pipeline_executable_info Bool32
}

pub struct PipelineInfoKHR {
pub mut:
	s_type   StructureType = StructureType.structure_type_pipeline_info_khr
	p_next   voidptr
	pipeline C.Pipeline
}

pub struct PipelineExecutablePropertiesKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_pipeline_executable_properties_khr
	p_next        voidptr
	stages        ShaderStageFlags
	name          [max_description_size]char
	description   [max_description_size]char
	subgroup_size u32
}

pub struct PipelineExecutableInfoKHR {
pub mut:
	s_type           StructureType = StructureType.structure_type_pipeline_executable_info_khr
	p_next           voidptr
	pipeline         C.Pipeline
	executable_index u32
}

pub union PipelineExecutableStatisticValueKHR {
pub mut:
	b32 Bool32
	i64 i64
	u64 u64
	f64 f64
}

pub struct PipelineExecutableStatisticKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_pipeline_executable_statistic_khr
	p_next      voidptr
	name        [max_description_size]char
	description [max_description_size]char
	format      PipelineExecutableStatisticFormatKHR
	value       PipelineExecutableStatisticValueKHR
}

pub struct PipelineExecutableInternalRepresentationKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_pipeline_executable_internal_representation_khr
	p_next      voidptr
	name        [max_description_size]char
	description [max_description_size]char
	is_text     Bool32
	data_size   usize
	p_data      voidptr
}

fn C.vkGetPipelineExecutablePropertiesKHR(C.Device,
	&PipelineInfoKHR,
	&u32,
	&PipelineExecutablePropertiesKHR) Result
pub fn get_pipeline_executable_properties_khr(device C.Device,
	p_pipeline_info &PipelineInfoKHR,
	p_executable_count &u32,
	p_properties &PipelineExecutablePropertiesKHR) Result {
	return C.vkGetPipelineExecutablePropertiesKHR(device, p_pipeline_info, p_executable_count,
		p_properties)
}

fn C.vkGetPipelineExecutableStatisticsKHR(C.Device,
	&PipelineExecutableInfoKHR,
	&u32,
	&PipelineExecutableStatisticKHR) Result
pub fn get_pipeline_executable_statistics_khr(device C.Device,
	p_executable_info &PipelineExecutableInfoKHR,
	p_statistic_count &u32,
	p_statistics &PipelineExecutableStatisticKHR) Result {
	return C.vkGetPipelineExecutableStatisticsKHR(device, p_executable_info, p_statistic_count,
		p_statistics)
}

fn C.vkGetPipelineExecutableInternalRepresentationsKHR(C.Device,
	&PipelineExecutableInfoKHR,
	&u32,
	&PipelineExecutableInternalRepresentationKHR) Result
pub fn get_pipeline_executable_internal_representations_khr(device C.Device,
	p_executable_info &PipelineExecutableInfoKHR,
	p_internal_representation_count &u32,
	p_internal_representations &PipelineExecutableInternalRepresentationKHR) Result {
	return C.vkGetPipelineExecutableInternalRepresentationsKHR(device, p_executable_info,
		p_internal_representation_count, p_internal_representations)
}

pub const khr_map_memory_2_spec_version = 1
pub const khr_map_memory_2_extension_name = 'VK_KHR_map_memory2'

pub enum MemoryUnmapFlagBitsKHR {
	memory_unmap_reserve_bit_ext        = int(0x00000001)
	memory_unmap_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type MemoryUnmapFlagsKHR = u32

pub struct MemoryMapInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_memory_map_info_khr
	p_next voidptr
	flags  MemoryMapFlags
	memory C.DeviceMemory
	offset DeviceSize
	size   DeviceSize
}

pub struct MemoryUnmapInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_memory_unmap_info_khr
	p_next voidptr
	flags  MemoryUnmapFlagsKHR
	memory C.DeviceMemory
}

fn C.vkMapMemory2KHR(C.Device,
	&MemoryMapInfoKHR,
	&voidptr) Result
pub fn map_memory2_khr(device C.Device,
	p_memory_map_info &MemoryMapInfoKHR,
	pp_data &voidptr) Result {
	return C.vkMapMemory2KHR(device, p_memory_map_info, pp_data)
}

fn C.vkUnmapMemory2KHR(C.Device,
	&MemoryUnmapInfoKHR) Result
pub fn unmap_memory2_khr(device C.Device,
	p_memory_unmap_info &MemoryUnmapInfoKHR) Result {
	return C.vkUnmapMemory2KHR(device, p_memory_unmap_info)
}

pub const khr_shader_integer_dot_product_spec_version = 1
pub const khr_shader_integer_dot_product_extension_name = 'VK_KHR_shader_integer_dot_product'

pub type PhysicalDeviceShaderIntegerDotProductFeaturesKHR = PhysicalDeviceShaderIntegerDotProductFeatures

pub type PhysicalDeviceShaderIntegerDotProductPropertiesKHR = PhysicalDeviceShaderIntegerDotProductProperties

pub const khr_pipeline_library_spec_version = 1
pub const khr_pipeline_library_extension_name = 'VK_KHR_pipeline_library'

pub struct PipelineLibraryCreateInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_pipeline_library_create_info_khr
	p_next        voidptr
	library_count u32
	p_libraries   &C.Pipeline
}

pub const khr_shader_non_semantic_info_spec_version = 1
pub const khr_shader_non_semantic_info_extension_name = 'VK_KHR_shader_non_semantic_info'

pub const khr_present_id_spec_version = 1
pub const khr_present_id_extension_name = 'VK_KHR_present_id'

pub struct PresentIdKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_present_id_khr
	p_next          voidptr
	swapchain_count u32
	p_present_ids   &u64
}

pub struct PhysicalDevicePresentIdFeaturesKHR {
pub mut:
	s_type     StructureType = StructureType.structure_type_physical_device_present_id_features_khr
	p_next     voidptr
	present_id Bool32
}

pub const khr_video_encode_queue_spec_version = 12
pub const khr_video_encode_queue_extension_name = 'VK_KHR_video_encode_queue'

pub enum VideoEncodeTuningModeKHR {
	video_encode_tuning_mode_default_khr           = int(0)
	video_encode_tuning_mode_high_quality_khr      = int(1)
	video_encode_tuning_mode_low_latency_khr       = int(2)
	video_encode_tuning_mode_ultra_low_latency_khr = int(3)
	video_encode_tuning_mode_lossless_khr          = int(4)
	video_encode_tuning_mode_max_enum_khr          = int(0x7FFFFFFF)
}

pub enum VideoEncodeFlagBitsKHR {
	video_encode_with_quantization_delta_map_bit_khr = int(0x00000001)
	video_encode_with_emphasis_map_bit_khr           = int(0x00000002)
	video_encode_flag_bits_max_enum_khr              = int(0x7FFFFFFF)
}

pub type VideoEncodeFlagsKHR = u32

pub enum VideoEncodeCapabilityFlagBitsKHR {
	video_encode_capability_preceding_externally_encoded_bytes_bit_khr            = int(0x00000001)
	video_encode_capability_insufficient_bitstream_buffer_range_detection_bit_khr = int(0x00000002)
	video_encode_capability_quantization_delta_map_bit_khr                        = int(0x00000004)
	video_encode_capability_emphasis_map_bit_khr                                  = int(0x00000008)
	video_encode_capability_flag_bits_max_enum_khr                                = int(0x7FFFFFFF)
}

pub type VideoEncodeCapabilityFlagsKHR = u32

pub enum VideoEncodeRateControlModeFlagBitsKHR {
	video_encode_rate_control_mode_default_khr            = int(0)
	video_encode_rate_control_mode_disabled_bit_khr       = int(0x00000001)
	video_encode_rate_control_mode_cbr_bit_khr            = int(0x00000002)
	video_encode_rate_control_mode_vbr_bit_khr            = int(0x00000004)
	video_encode_rate_control_mode_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeRateControlModeFlagsKHR = u32

pub enum VideoEncodeFeedbackFlagBitsKHR {
	video_encode_feedback_bitstream_buffer_offset_bit_khr = int(0x00000001)
	video_encode_feedback_bitstream_bytes_written_bit_khr = int(0x00000002)
	video_encode_feedback_bitstream_has_overrides_bit_khr = int(0x00000004)
	video_encode_feedback_flag_bits_max_enum_khr          = int(0x7FFFFFFF)
}

pub type VideoEncodeFeedbackFlagsKHR = u32

pub enum VideoEncodeUsageFlagBitsKHR {
	video_encode_usage_default_khr            = int(0)
	video_encode_usage_transcoding_bit_khr    = int(0x00000001)
	video_encode_usage_streaming_bit_khr      = int(0x00000002)
	video_encode_usage_recording_bit_khr      = int(0x00000004)
	video_encode_usage_conferencing_bit_khr   = int(0x00000008)
	video_encode_usage_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeUsageFlagsKHR = u32

pub enum VideoEncodeContentFlagBitsKHR {
	video_encode_content_default_khr            = int(0)
	video_encode_content_camera_bit_khr         = int(0x00000001)
	video_encode_content_desktop_bit_khr        = int(0x00000002)
	video_encode_content_rendered_bit_khr       = int(0x00000004)
	video_encode_content_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeContentFlagsKHR = u32
pub type VideoEncodeRateControlFlagsKHR = u32

pub struct VideoEncodeInfoKHR {
pub mut:
	s_type                             StructureType = StructureType.structure_type_video_encode_info_khr
	p_next                             voidptr
	flags                              VideoEncodeFlagsKHR
	dst_buffer                         C.Buffer
	dst_buffer_offset                  DeviceSize
	dst_buffer_range                   DeviceSize
	src_picture_resource               VideoPictureResourceInfoKHR
	p_setup_reference_slot             &VideoReferenceSlotInfoKHR
	reference_slot_count               u32
	p_reference_slots                  &VideoReferenceSlotInfoKHR
	preceding_externally_encoded_bytes u32
}

pub struct VideoEncodeCapabilitiesKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_video_encode_capabilities_khr
	p_next                           voidptr
	flags                            VideoEncodeCapabilityFlagsKHR
	rate_control_modes               VideoEncodeRateControlModeFlagsKHR
	max_rate_control_layers          u32
	max_bitrate                      u64
	max_quality_levels               u32
	encode_input_picture_granularity Extent2D
	supported_encode_feedback_flags  VideoEncodeFeedbackFlagsKHR
}

pub struct QueryPoolVideoEncodeFeedbackCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_query_pool_video_encode_feedback_create_info_khr
	p_next                voidptr
	encode_feedback_flags VideoEncodeFeedbackFlagsKHR
}

pub struct VideoEncodeUsageInfoKHR {
pub mut:
	s_type              StructureType = StructureType.structure_type_video_encode_usage_info_khr
	p_next              voidptr
	video_usage_hints   VideoEncodeUsageFlagsKHR
	video_content_hints VideoEncodeContentFlagsKHR
	tuning_mode         VideoEncodeTuningModeKHR
}

pub struct VideoEncodeRateControlLayerInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_video_encode_rate_control_layer_info_khr
	p_next                 voidptr
	average_bitrate        u64
	max_bitrate            u64
	frame_rate_numerator   u32
	frame_rate_denominator u32
}

pub struct VideoEncodeRateControlInfoKHR {
pub mut:
	s_type                            StructureType = StructureType.structure_type_video_encode_rate_control_info_khr
	p_next                            voidptr
	flags                             VideoEncodeRateControlFlagsKHR
	rate_control_mode                 VideoEncodeRateControlModeFlagBitsKHR
	layer_count                       u32
	p_layers                          &VideoEncodeRateControlLayerInfoKHR
	virtual_buffer_size_in_ms         u32
	initial_virtual_buffer_size_in_ms u32
}

pub struct PhysicalDeviceVideoEncodeQualityLevelInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_video_encode_quality_level_info_khr
	p_next          voidptr
	p_video_profile &VideoProfileInfoKHR
	quality_level   u32
}

pub struct VideoEncodeQualityLevelPropertiesKHR {
pub mut:
	s_type                             StructureType = StructureType.structure_type_video_encode_quality_level_properties_khr
	p_next                             voidptr
	preferred_rate_control_mode        VideoEncodeRateControlModeFlagBitsKHR
	preferred_rate_control_layer_count u32
}

pub struct VideoEncodeQualityLevelInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_quality_level_info_khr
	p_next        voidptr
	quality_level u32
}

pub struct VideoEncodeSessionParametersGetInfoKHR {
pub mut:
	s_type                   StructureType = StructureType.structure_type_video_encode_session_parameters_get_info_khr
	p_next                   voidptr
	video_session_parameters C.VideoSessionParametersKHR
}

pub struct VideoEncodeSessionParametersFeedbackInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_session_parameters_feedback_info_khr
	p_next        voidptr
	has_overrides Bool32
}

fn C.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(C.PhysicalDevice,
	&PhysicalDeviceVideoEncodeQualityLevelInfoKHR,
	&VideoEncodeQualityLevelPropertiesKHR) Result
pub fn get_physical_device_video_encode_quality_level_properties_khr(physical_device C.PhysicalDevice,
	p_quality_level_info &PhysicalDeviceVideoEncodeQualityLevelInfoKHR,
	p_quality_level_properties &VideoEncodeQualityLevelPropertiesKHR) Result {
	return C.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(physical_device,
		p_quality_level_info, p_quality_level_properties)
}

fn C.vkGetEncodedVideoSessionParametersKHR(C.Device,
	&VideoEncodeSessionParametersGetInfoKHR,
	&VideoEncodeSessionParametersFeedbackInfoKHR,
	&usize,
	voidptr) Result
pub fn get_encoded_video_session_parameters_khr(device C.Device,
	p_video_session_parameters_info &VideoEncodeSessionParametersGetInfoKHR,
	p_feedback_info &VideoEncodeSessionParametersFeedbackInfoKHR,
	p_data_size &usize,
	p_data voidptr) Result {
	return C.vkGetEncodedVideoSessionParametersKHR(device, p_video_session_parameters_info,
		p_feedback_info, p_data_size, p_data)
}

fn C.vkCmdEncodeVideoKHR(C.CommandBuffer,
	&VideoEncodeInfoKHR)
pub fn cmd_encode_video_khr(command_buffer C.CommandBuffer,
	p_encode_info &VideoEncodeInfoKHR) {
	C.vkCmdEncodeVideoKHR(command_buffer, p_encode_info)
}

pub const khr_synchronization_2_spec_version = 1
pub const khr_synchronization_2_extension_name = 'VK_KHR_synchronization2'

pub type PipelineStageFlags2KHR = u64
pub type PipelineStageFlagBits2KHR = u64

pub type AccessFlags2KHR = u64
pub type AccessFlagBits2KHR = u64

pub type SubmitFlagBitsKHR = SubmitFlagBits

pub type SubmitFlagsKHR = u32
pub type MemoryBarrier2KHR = MemoryBarrier2

pub type BufferMemoryBarrier2KHR = BufferMemoryBarrier2

pub type ImageMemoryBarrier2KHR = ImageMemoryBarrier2

pub type DependencyInfoKHR = DependencyInfo

pub type SubmitInfo2KHR = SubmitInfo2

pub type SemaphoreSubmitInfoKHR = SemaphoreSubmitInfo

pub type CommandBufferSubmitInfoKHR = CommandBufferSubmitInfo

pub type PhysicalDeviceSynchronization2FeaturesKHR = PhysicalDeviceSynchronization2Features

pub const khr_fragment_shader_barycentric_spec_version = 1
pub const khr_fragment_shader_barycentric_extension_name = 'VK_KHR_fragment_shader_barycentric'

pub struct PhysicalDeviceFragmentShaderBarycentricFeaturesKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_fragment_shader_barycentric_features_khr
	p_next                      voidptr
	fragment_shader_barycentric Bool32
}

pub struct PhysicalDeviceFragmentShaderBarycentricPropertiesKHR {
pub mut:
	s_type                                                 StructureType = StructureType.structure_type_physical_device_fragment_shader_barycentric_properties_khr
	p_next                                                 voidptr
	tri_strip_vertex_order_independent_of_provoking_vertex Bool32
}

pub const khr_shader_subgroup_uniform_control_flow_spec_version = 1
pub const khr_shader_subgroup_uniform_control_flow_extension_name = 'VK_KHR_shader_subgroup_uniform_control_flow'

pub struct PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_shader_subgroup_uniform_control_flow_features_khr
	p_next                               voidptr
	shader_subgroup_uniform_control_flow Bool32
}

pub const khr_zero_initialize_workgroup_memory_spec_version = 1
pub const khr_zero_initialize_workgroup_memory_extension_name = 'VK_KHR_zero_initialize_workgroup_memory'

pub type PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR = PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures

pub const khr_workgroup_memory_explicit_layout_spec_version = 1
pub const khr_workgroup_memory_explicit_layout_extension_name = 'VK_KHR_workgroup_memory_explicit_layout'

pub struct PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR {
pub mut:
	s_type                                               StructureType = StructureType.structure_type_physical_device_workgroup_memory_explicit_layout_features_khr
	p_next                                               voidptr
	workgroup_memory_explicit_layout                     Bool32
	workgroup_memory_explicit_layout_scalar_block_layout Bool32
	workgroup_memory_explicit_layout8_bit_access         Bool32
	workgroup_memory_explicit_layout16_bit_access        Bool32
}

pub const khr_copy_commands_2_spec_version = 1
pub const khr_copy_commands_2_extension_name = 'VK_KHR_copy_commands2'

pub type CopyBufferInfo2KHR = CopyBufferInfo2

pub type CopyImageInfo2KHR = CopyImageInfo2

pub type CopyBufferToImageInfo2KHR = CopyBufferToImageInfo2

pub type CopyImageToBufferInfo2KHR = CopyImageToBufferInfo2

pub type BlitImageInfo2KHR = BlitImageInfo2

pub type ResolveImageInfo2KHR = ResolveImageInfo2

pub type BufferCopy2KHR = BufferCopy2

pub type ImageCopy2KHR = ImageCopy2

pub type ImageBlit2KHR = ImageBlit2

pub type BufferImageCopy2KHR = BufferImageCopy2

pub type ImageResolve2KHR = ImageResolve2

pub const khr_format_feature_flags_2_spec_version = 2
pub const khr_format_feature_flags_2_extension_name = 'VK_KHR_format_feature_flags2'

pub type FormatFeatureFlags2KHR = u64
pub type FormatFeatureFlagBits2KHR = u64

pub type FormatProperties3KHR = FormatProperties3

pub const khr_ray_tracing_maintenance_1_spec_version = 1
pub const khr_ray_tracing_maintenance_1_extension_name = 'VK_KHR_ray_tracing_maintenance1'

pub struct PhysicalDeviceRayTracingMaintenance1FeaturesKHR {
pub mut:
	s_type                                    StructureType = StructureType.structure_type_physical_device_ray_tracing_maintenance1_features_khr
	p_next                                    voidptr
	ray_tracing_maintenance1                  Bool32
	ray_tracing_pipeline_trace_rays_indirect2 Bool32
}

pub struct TraceRaysIndirectCommand2KHR {
pub mut:
	raygen_shader_record_address          DeviceAddress
	raygen_shader_record_size             DeviceSize
	miss_shader_binding_table_address     DeviceAddress
	miss_shader_binding_table_size        DeviceSize
	miss_shader_binding_table_stride      DeviceSize
	hit_shader_binding_table_address      DeviceAddress
	hit_shader_binding_table_size         DeviceSize
	hit_shader_binding_table_stride       DeviceSize
	callable_shader_binding_table_address DeviceAddress
	callable_shader_binding_table_size    DeviceSize
	callable_shader_binding_table_stride  DeviceSize
	width                                 u32
	height                                u32
	depth                                 u32
}

fn C.vkCmdTraceRaysIndirect2KHR(C.CommandBuffer,
	DeviceAddress)
pub fn cmd_trace_rays_indirect2_khr(command_buffer C.CommandBuffer,
	indirect_device_address DeviceAddress) {
	C.vkCmdTraceRaysIndirect2KHR(command_buffer, indirect_device_address)
}

pub const khr_portability_enumeration_spec_version = 1
pub const khr_portability_enumeration_extension_name = 'VK_KHR_portability_enumeration'

pub const khr_maintenance_4_spec_version = 2
pub const khr_maintenance_4_extension_name = 'VK_KHR_maintenance4'

pub type PhysicalDeviceMaintenance4FeaturesKHR = PhysicalDeviceMaintenance4Features

pub type PhysicalDeviceMaintenance4PropertiesKHR = PhysicalDeviceMaintenance4Properties

pub type DeviceBufferMemoryRequirementsKHR = DeviceBufferMemoryRequirements

pub type DeviceImageMemoryRequirementsKHR = DeviceImageMemoryRequirements

pub const khr_shader_subgroup_rotate_spec_version = 2
pub const khr_shader_subgroup_rotate_extension_name = 'VK_KHR_shader_subgroup_rotate'

pub struct PhysicalDeviceShaderSubgroupRotateFeaturesKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_shader_subgroup_rotate_features_khr
	p_next                           voidptr
	shader_subgroup_rotate           Bool32
	shader_subgroup_rotate_clustered Bool32
}

pub const khr_shader_maximal_reconvergence_spec_version = 1
pub const khr_shader_maximal_reconvergence_extension_name = 'VK_KHR_shader_maximal_reconvergence'

pub struct PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_shader_maximal_reconvergence_features_khr
	p_next                       voidptr
	shader_maximal_reconvergence Bool32
}

pub const khr_maintenance_5_spec_version = 1
pub const khr_maintenance_5_extension_name = 'VK_KHR_maintenance5'

pub type PipelineCreateFlags2KHR = u64

// Flag bits for PipelineCreateFlagBits2KHR
pub type PipelineCreateFlagBits2KHR = u64

pub const pipeline_create_2_disable_optimization_bit_khr = u64(0x00000001)
pub const pipeline_create_2_allow_derivatives_bit_khr = u64(0x00000002)
pub const pipeline_create_2_derivative_bit_khr = u64(0x00000004)
pub const pipeline_create_2_execution_graph_bit_amdx = u64(0x100000000)
pub const pipeline_create_2_enable_legacy_dithering_bit_ext = u64(0x400000000)
pub const pipeline_create_2_view_index_from_device_index_bit_khr = u64(0x00000008)
pub const pipeline_create_2_dispatch_base_bit_khr = u64(0x00000010)
pub const pipeline_create_2_defer_compile_bit_nv = u64(0x00000020)
pub const pipeline_create_2_capture_statistics_bit_khr = u64(0x00000040)
pub const pipeline_create_2_capture_internal_representations_bit_khr = u64(0x00000080)
pub const pipeline_create_2_fail_on_pipeline_compile_required_bit_khr = u64(0x00000100)
pub const pipeline_create_2_early_return_on_failure_bit_khr = u64(0x00000200)
pub const pipeline_create_2_link_time_optimization_bit_ext = u64(0x00000400)
pub const pipeline_create_2_retain_link_time_optimization_info_bit_ext = u64(0x00800000)
pub const pipeline_create_2_library_bit_khr = u64(0x00000800)
pub const pipeline_create_2_ray_tracing_skip_triangles_bit_khr = u64(0x00001000)
pub const pipeline_create_2_ray_tracing_skip_aabbs_bit_khr = u64(0x00002000)
pub const pipeline_create_2_ray_tracing_no_null_any_hit_shaders_bit_khr = u64(0x00004000)
pub const pipeline_create_2_ray_tracing_no_null_closest_hit_shaders_bit_khr = u64(0x00008000)
pub const pipeline_create_2_ray_tracing_no_null_miss_shaders_bit_khr = u64(0x00010000)
pub const pipeline_create_2_ray_tracing_no_null_intersection_shaders_bit_khr = u64(0x00020000)
pub const pipeline_create_2_ray_tracing_shader_group_handle_capture_replay_bit_khr = u64(0x00080000)
pub const pipeline_create_2_indirect_bindable_bit_nv = u64(0x00040000)
pub const pipeline_create_2_ray_tracing_allow_motion_bit_nv = u64(0x00100000)
pub const pipeline_create_2_rendering_fragment_shading_rate_attachment_bit_khr = u64(0x00200000)
pub const pipeline_create_2_rendering_fragment_density_map_attachment_bit_ext = u64(0x00400000)
pub const pipeline_create_2_ray_tracing_opacity_micromap_bit_ext = u64(0x01000000)
pub const pipeline_create_2_color_attachment_feedback_loop_bit_ext = u64(0x02000000)
pub const pipeline_create_2_depth_stencil_attachment_feedback_loop_bit_ext = u64(0x04000000)
pub const pipeline_create_2_no_protected_access_bit_ext = u64(0x08000000)
pub const pipeline_create_2_protected_access_only_bit_ext = u64(0x40000000)
pub const pipeline_create_2_ray_tracing_displacement_micromap_bit_nv = u64(0x10000000)
pub const pipeline_create_2_descriptor_buffer_bit_ext = u64(0x20000000)
pub const pipeline_create_2_capture_data_bit_khr = u64(0x80000000)
pub const pipeline_create_2_indirect_bindable_bit_ext = u64(0x4000000000)

pub type BufferUsageFlags2KHR = u64

// Flag bits for BufferUsageFlagBits2KHR
pub type BufferUsageFlagBits2KHR = u64

pub const buffer_usage_2_transfer_src_bit_khr = u64(0x00000001)
pub const buffer_usage_2_transfer_dst_bit_khr = u64(0x00000002)
pub const buffer_usage_2_uniform_texel_buffer_bit_khr = u64(0x00000004)
pub const buffer_usage_2_storage_texel_buffer_bit_khr = u64(0x00000008)
pub const buffer_usage_2_uniform_buffer_bit_khr = u64(0x00000010)
pub const buffer_usage_2_storage_buffer_bit_khr = u64(0x00000020)
pub const buffer_usage_2_index_buffer_bit_khr = u64(0x00000040)
pub const buffer_usage_2_vertex_buffer_bit_khr = u64(0x00000080)
pub const buffer_usage_2_indirect_buffer_bit_khr = u64(0x00000100)
pub const buffer_usage_2_execution_graph_scratch_bit_amdx = u64(0x02000000)
pub const buffer_usage_2_conditional_rendering_bit_ext = u64(0x00000200)
pub const buffer_usage_2_shader_binding_table_bit_khr = u64(0x00000400)
pub const buffer_usage_2_ray_tracing_bit_nv = u32(buffer_usage_2_shader_binding_table_bit_khr)
pub const buffer_usage_2_transform_feedback_buffer_bit_ext = u64(0x00000800)
pub const buffer_usage_2_transform_feedback_counter_buffer_bit_ext = u64(0x00001000)
pub const buffer_usage_2_video_decode_src_bit_khr = u64(0x00002000)
pub const buffer_usage_2_video_decode_dst_bit_khr = u64(0x00004000)
pub const buffer_usage_2_video_encode_dst_bit_khr = u64(0x00008000)
pub const buffer_usage_2_video_encode_src_bit_khr = u64(0x00010000)
pub const buffer_usage_2_shader_device_address_bit_khr = u64(0x00020000)
pub const buffer_usage_2_acceleration_structure_build_input_read_only_bit_khr = u64(0x00080000)
pub const buffer_usage_2_acceleration_structure_storage_bit_khr = u64(0x00100000)
pub const buffer_usage_2_sampler_descriptor_buffer_bit_ext = u64(0x00200000)
pub const buffer_usage_2_resource_descriptor_buffer_bit_ext = u64(0x00400000)
pub const buffer_usage_2_push_descriptors_descriptor_buffer_bit_ext = u64(0x04000000)
pub const buffer_usage_2_micromap_build_input_read_only_bit_ext = u64(0x00800000)
pub const buffer_usage_2_micromap_storage_bit_ext = u64(0x01000000)
pub const buffer_usage_2_preprocess_buffer_bit_ext = u64(0x80000000)

pub struct PhysicalDeviceMaintenance5FeaturesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_maintenance5_features_khr
	p_next       voidptr
	maintenance5 Bool32
}

pub struct PhysicalDeviceMaintenance5PropertiesKHR {
pub mut:
	s_type                                                    StructureType = StructureType.structure_type_physical_device_maintenance5_properties_khr
	p_next                                                    voidptr
	early_fragment_multisample_coverage_after_sample_counting Bool32
	early_fragment_sample_mask_test_before_sample_counting    Bool32
	depth_stencil_swizzle_one_support                         Bool32
	polygon_mode_point_size                                   Bool32
	non_strict_single_pixel_wide_lines_use_parallelogram      Bool32
	non_strict_wide_lines_use_parallelogram                   Bool32
}

pub struct RenderingAreaInfoKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_rendering_area_info_khr
	p_next                     voidptr
	view_mask                  u32
	color_attachment_count     u32
	p_color_attachment_formats &Format
	depth_attachment_format    Format
	stencil_attachment_format  Format
}

pub struct ImageSubresource2KHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_image_subresource2_khr
	p_next            voidptr
	image_subresource ImageSubresource
}

pub struct DeviceImageSubresourceInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_device_image_subresource_info_khr
	p_next        voidptr
	p_create_info &ImageCreateInfo
	p_subresource &ImageSubresource2KHR
}

pub struct SubresourceLayout2KHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_subresource_layout2_khr
	p_next             voidptr
	subresource_layout SubresourceLayout
}

pub struct PipelineCreateFlags2CreateInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_pipeline_create_flags2_create_info_khr
	p_next voidptr
	flags  PipelineCreateFlags2KHR
}

pub struct BufferUsageFlags2CreateInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_buffer_usage_flags2_create_info_khr
	p_next voidptr
	usage  BufferUsageFlags2KHR
}

fn C.vkCmdBindIndexBuffer2KHR(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	IndexType)
pub fn cmd_bind_index_buffer2_khr(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	size DeviceSize,
	index_type IndexType) {
	C.vkCmdBindIndexBuffer2KHR(command_buffer, buffer, offset, size, index_type)
}

fn C.vkGetRenderingAreaGranularityKHR(C.Device,
	&RenderingAreaInfoKHR,
	&Extent2D)
pub fn get_rendering_area_granularity_khr(device C.Device,
	p_rendering_area_info &RenderingAreaInfoKHR,
	p_granularity &Extent2D) {
	C.vkGetRenderingAreaGranularityKHR(device, p_rendering_area_info, p_granularity)
}

fn C.vkGetDeviceImageSubresourceLayoutKHR(C.Device,
	&DeviceImageSubresourceInfoKHR,
	&SubresourceLayout2KHR)
pub fn get_device_image_subresource_layout_khr(device C.Device,
	p_info &DeviceImageSubresourceInfoKHR,
	p_layout &SubresourceLayout2KHR) {
	C.vkGetDeviceImageSubresourceLayoutKHR(device, p_info, p_layout)
}

fn C.vkGetImageSubresourceLayout2KHR(C.Device,
	C.Image,
	&ImageSubresource2KHR,
	&SubresourceLayout2KHR)
pub fn get_image_subresource_layout2_khr(device C.Device,
	image C.Image,
	p_subresource &ImageSubresource2KHR,
	p_layout &SubresourceLayout2KHR) {
	C.vkGetImageSubresourceLayout2KHR(device, image, p_subresource, p_layout)
}

pub const khr_ray_tracing_position_fetch_spec_version = 1
pub const khr_ray_tracing_position_fetch_extension_name = 'VK_KHR_ray_tracing_position_fetch'

pub struct PhysicalDeviceRayTracingPositionFetchFeaturesKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_ray_tracing_position_fetch_features_khr
	p_next                     voidptr
	ray_tracing_position_fetch Bool32
}

pub type C.PipelineBinaryKHR = voidptr

pub const max_pipeline_binary_key_size_khr = u32(32)
pub const khr_pipeline_binary_spec_version = 1
pub const khr_pipeline_binary_extension_name = 'VK_KHR_pipeline_binary'

pub struct PhysicalDevicePipelineBinaryFeaturesKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_pipeline_binary_features_khr
	p_next            voidptr
	pipeline_binaries Bool32
}

pub struct PhysicalDevicePipelineBinaryPropertiesKHR {
pub mut:
	s_type                                     StructureType = StructureType.structure_type_physical_device_pipeline_binary_properties_khr
	p_next                                     voidptr
	pipeline_binary_internal_cache             Bool32
	pipeline_binary_internal_cache_control     Bool32
	pipeline_binary_prefers_internal_cache     Bool32
	pipeline_binary_precompiled_internal_cache Bool32
	pipeline_binary_compressed_data            Bool32
}

pub struct DevicePipelineBinaryInternalCacheControlKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_device_pipeline_binary_internal_cache_control_khr
	p_next                 voidptr
	disable_internal_cache Bool32
}

pub struct PipelineBinaryKeyKHR {
pub mut:
	s_type   StructureType = StructureType.structure_type_pipeline_binary_key_khr
	p_next   voidptr
	key_size u32
	key      [max_pipeline_binary_key_size_khr]u8
}

pub struct PipelineBinaryDataKHR {
pub mut:
	data_size usize
	p_data    voidptr
}

pub struct PipelineBinaryKeysAndDataKHR {
pub mut:
	binary_count           u32
	p_pipeline_binary_keys &PipelineBinaryKeyKHR
	p_pipeline_binary_data &PipelineBinaryDataKHR
}

pub struct PipelineCreateInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_pipeline_create_info_khr
	p_next voidptr
}

pub struct PipelineBinaryCreateInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_pipeline_binary_create_info_khr
	p_next                 voidptr
	p_keys_and_data_info   &PipelineBinaryKeysAndDataKHR
	pipeline               C.Pipeline
	p_pipeline_create_info &PipelineCreateInfoKHR
}

pub struct PipelineBinaryInfoKHR {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_binary_info_khr
	p_next              voidptr
	binary_count        u32
	p_pipeline_binaries &C.PipelineBinaryKHR
}

pub struct ReleaseCapturedPipelineDataInfoKHR {
pub mut:
	s_type   StructureType = StructureType.structure_type_release_captured_pipeline_data_info_khr
	p_next   voidptr
	pipeline C.Pipeline
}

pub struct PipelineBinaryDataInfoKHR {
pub mut:
	s_type          StructureType = StructureType.structure_type_pipeline_binary_data_info_khr
	p_next          voidptr
	pipeline_binary C.PipelineBinaryKHR
}

pub struct PipelineBinaryHandlesInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_pipeline_binary_handles_info_khr
	p_next                voidptr
	pipeline_binary_count u32
	p_pipeline_binaries   &C.PipelineBinaryKHR
}

fn C.vkCreatePipelineBinariesKHR(C.Device,
	&PipelineBinaryCreateInfoKHR,
	&AllocationCallbacks,
	&PipelineBinaryHandlesInfoKHR) Result
pub fn create_pipeline_binaries_khr(device C.Device,
	p_create_info &PipelineBinaryCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_binaries &PipelineBinaryHandlesInfoKHR) Result {
	return C.vkCreatePipelineBinariesKHR(device, p_create_info, p_allocator, p_binaries)
}

fn C.vkDestroyPipelineBinaryKHR(C.Device,
	C.PipelineBinaryKHR,
	&AllocationCallbacks)
pub fn destroy_pipeline_binary_khr(device C.Device,
	pipeline_binary C.PipelineBinaryKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyPipelineBinaryKHR(device, pipeline_binary, p_allocator)
}

fn C.vkGetPipelineKeyKHR(C.Device,
	&PipelineCreateInfoKHR,
	&PipelineBinaryKeyKHR) Result
pub fn get_pipeline_key_khr(device C.Device,
	p_pipeline_create_info &PipelineCreateInfoKHR,
	p_pipeline_key &PipelineBinaryKeyKHR) Result {
	return C.vkGetPipelineKeyKHR(device, p_pipeline_create_info, p_pipeline_key)
}

fn C.vkGetPipelineBinaryDataKHR(C.Device,
	&PipelineBinaryDataInfoKHR,
	&PipelineBinaryKeyKHR,
	&usize,
	voidptr) Result
pub fn get_pipeline_binary_data_khr(device C.Device,
	p_info &PipelineBinaryDataInfoKHR,
	p_pipeline_binary_key &PipelineBinaryKeyKHR,
	p_pipeline_binary_data_size &usize,
	p_pipeline_binary_data voidptr) Result {
	return C.vkGetPipelineBinaryDataKHR(device, p_info, p_pipeline_binary_key, p_pipeline_binary_data_size,
		p_pipeline_binary_data)
}

fn C.vkReleaseCapturedPipelineDataKHR(C.Device,
	&ReleaseCapturedPipelineDataInfoKHR,
	&AllocationCallbacks) Result
pub fn release_captured_pipeline_data_khr(device C.Device,
	p_info &ReleaseCapturedPipelineDataInfoKHR,
	p_allocator &AllocationCallbacks) Result {
	return C.vkReleaseCapturedPipelineDataKHR(device, p_info, p_allocator)
}

pub const khr_cooperative_matrix_spec_version = 2
pub const khr_cooperative_matrix_extension_name = 'VK_KHR_cooperative_matrix'

pub enum ComponentTypeKHR {
	component_type_float16_khr  = int(0)
	component_type_float32_khr  = int(1)
	component_type_float64_khr  = int(2)
	component_type_sint8_khr    = int(3)
	component_type_sint16_khr   = int(4)
	component_type_sint32_khr   = int(5)
	component_type_sint64_khr   = int(6)
	component_type_uint8_khr    = int(7)
	component_type_uint16_khr   = int(8)
	component_type_uint32_khr   = int(9)
	component_type_uint64_khr   = int(10)
	component_type_max_enum_khr = int(0x7FFFFFFF)
}

pub enum ScopeKHR {
	scope_device_khr       = int(1)
	scope_workgroup_khr    = int(2)
	scope_subgroup_khr     = int(3)
	scope_queue_family_khr = int(5)
	scope_max_enum_khr     = int(0x7FFFFFFF)
}

pub struct CooperativeMatrixPropertiesKHR {
pub mut:
	s_type                  StructureType = StructureType.structure_type_cooperative_matrix_properties_khr
	p_next                  voidptr
	m_size                  u32
	n_size                  u32
	k_size                  u32
	a_type                  ComponentTypeKHR
	b_type                  ComponentTypeKHR
	c_type                  ComponentTypeKHR
	result_type             ComponentTypeKHR
	saturating_accumulation Bool32
	scope                   ScopeKHR
}

pub struct PhysicalDeviceCooperativeMatrixFeaturesKHR {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_cooperative_matrix_features_khr
	p_next                                  voidptr
	cooperative_matrix                      Bool32
	cooperative_matrix_robust_buffer_access Bool32
}

pub struct PhysicalDeviceCooperativeMatrixPropertiesKHR {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_cooperative_matrix_properties_khr
	p_next                              voidptr
	cooperative_matrix_supported_stages ShaderStageFlags
}

fn C.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR(C.PhysicalDevice,
	&u32,
	&CooperativeMatrixPropertiesKHR) Result
pub fn get_physical_device_cooperative_matrix_properties_khr(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &CooperativeMatrixPropertiesKHR) Result {
	return C.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR(physical_device, p_property_count,
		p_properties)
}

pub const khr_compute_shader_derivatives_spec_version = 1
pub const khr_compute_shader_derivatives_extension_name = 'VK_KHR_compute_shader_derivatives'

pub struct PhysicalDeviceComputeShaderDerivativesFeaturesKHR {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_compute_shader_derivatives_features_khr
	p_next                          voidptr
	compute_derivative_group_quads  Bool32
	compute_derivative_group_linear Bool32
}

pub struct PhysicalDeviceComputeShaderDerivativesPropertiesKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_compute_shader_derivatives_properties_khr
	p_next                           voidptr
	mesh_and_task_shader_derivatives Bool32
}

#include "vk_video/vulkan_video_codec_av1std.h"
#include "vk_video/vulkan_video_codec_av1std_decode.h"

pub const max_video_av1_references_per_frame_khr = u32(7)
pub const khr_video_decode_av1_spec_version = 1
pub const khr_video_decode_av1_extension_name = 'VK_KHR_video_decode_av1'

pub struct VideoDecodeAV1ProfileInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_decode_av1_profile_info_khr
	p_next             voidptr
	std_profile        u32
	film_grain_support Bool32
}

pub struct VideoDecodeAV1CapabilitiesKHR {
pub mut:
	s_type    StructureType = StructureType.structure_type_video_decode_av1_capabilities_khr
	p_next    voidptr
	max_level u32
}

pub struct VideoDecodeAV1SessionParametersCreateInfoKHR {
pub mut:
	s_type                StructureType = StructureType.structure_type_video_decode_av1_session_parameters_create_info_khr
	p_next                voidptr
	p_std_sequence_header &voidptr
}

pub struct VideoDecodeAV1PictureInfoKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_video_decode_av1_picture_info_khr
	p_next                      voidptr
	p_std_picture_info          &voidptr
	reference_name_slot_indices [max_video_av1_references_per_frame_khr]i32
	frame_header_offset         u32
	tile_count                  u32
	p_tile_offsets              &u32
	p_tile_sizes                &u32
}

pub struct VideoDecodeAV1DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_decode_av1_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &voidptr
}

#include "vk_video/vulkan_video_codec_av1std_encode.h"

pub const khr_video_encode_av1_spec_version = 1
pub const khr_video_encode_av1_extension_name = 'VK_KHR_video_encode_av1'

pub enum VideoEncodeAV1PredictionModeKHR {
	video_encode_av1_prediction_mode_intra_only_khr              = int(0)
	video_encode_av1_prediction_mode_single_reference_khr        = int(1)
	video_encode_av1_prediction_mode_unidirectional_compound_khr = int(2)
	video_encode_av1_prediction_mode_bidirectional_compound_khr  = int(3)
	video_encode_av1_prediction_mode_max_enum_khr                = int(0x7FFFFFFF)
}

pub enum VideoEncodeAV1RateControlGroupKHR {
	video_encode_av1_rate_control_group_intra_khr        = int(0)
	video_encode_av1_rate_control_group_predictive_khr   = int(1)
	video_encode_av1_rate_control_group_bipredictive_khr = int(2)
	video_encode_av1_rate_control_group_max_enum_khr     = int(0x7FFFFFFF)
}

pub enum VideoEncodeAV1CapabilityFlagBitsKHR {
	video_encode_av1_capability_per_rate_control_group_min_max_q_index_bit_khr = int(0x00000001)
	video_encode_av1_capability_generate_obu_extension_header_bit_khr          = int(0x00000002)
	video_encode_av1_capability_primary_reference_cdf_only_bit_khr             = int(0x00000004)
	video_encode_av1_capability_frame_size_override_bit_khr                    = int(0x00000008)
	video_encode_av1_capability_motion_vector_scaling_bit_khr                  = int(0x00000010)
	video_encode_av1_capability_flag_bits_max_enum_khr                         = int(0x7FFFFFFF)
}

pub type VideoEncodeAV1CapabilityFlagsKHR = u32

pub enum VideoEncodeAV1StdFlagBitsKHR {
	video_encode_av1_std_uniform_tile_spacing_flag_set_bit_khr = int(0x00000001)
	video_encode_av1_std_skip_mode_present_unset_bit_khr       = int(0x00000002)
	video_encode_av1_std_primary_ref_frame_bit_khr             = int(0x00000004)
	video_encode_av1_std_delta_q_bit_khr                       = int(0x00000008)
	video_encode_av1_std_flag_bits_max_enum_khr                = int(0x7FFFFFFF)
}

pub type VideoEncodeAV1StdFlagsKHR = u32

pub enum VideoEncodeAV1SuperblockSizeFlagBitsKHR {
	video_encode_av1_superblock_size64_bit_khr              = int(0x00000001)
	video_encode_av1_superblock_size128_bit_khr             = int(0x00000002)
	video_encode_av1_superblock_size_flag_bits_max_enum_khr = int(0x7FFFFFFF)
}

pub type VideoEncodeAV1SuperblockSizeFlagsKHR = u32

pub enum VideoEncodeAV1RateControlFlagBitsKHR {
	video_encode_av1_rate_control_regular_gop_bit_khr                   = int(0x00000001)
	video_encode_av1_rate_control_temporal_layer_pattern_dyadic_bit_khr = int(0x00000002)
	video_encode_av1_rate_control_reference_pattern_flat_bit_khr        = int(0x00000004)
	video_encode_av1_rate_control_reference_pattern_dyadic_bit_khr      = int(0x00000008)
	video_encode_av1_rate_control_flag_bits_max_enum_khr                = int(0x7FFFFFFF)
}

pub type VideoEncodeAV1RateControlFlagsKHR = u32

pub struct PhysicalDeviceVideoEncodeAV1FeaturesKHR {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_video_encode_av1_features_khr
	p_next           voidptr
	video_encode_av1 Bool32
}

pub struct VideoEncodeAV1CapabilitiesKHR {
pub mut:
	s_type                                             StructureType = StructureType.structure_type_video_encode_av1_capabilities_khr
	p_next                                             voidptr
	flags                                              VideoEncodeAV1CapabilityFlagsKHR
	max_level                                          u32
	coded_picture_alignment                            Extent2D
	max_tiles                                          Extent2D
	min_tile_size                                      Extent2D
	max_tile_size                                      Extent2D
	superblock_sizes                                   VideoEncodeAV1SuperblockSizeFlagsKHR
	max_single_reference_count                         u32
	single_reference_name_mask                         u32
	max_unidirectional_compound_reference_count        u32
	max_unidirectional_compound_group1_reference_count u32
	unidirectional_compound_reference_name_mask        u32
	max_bidirectional_compound_reference_count         u32
	max_bidirectional_compound_group1_reference_count  u32
	max_bidirectional_compound_group2_reference_count  u32
	bidirectional_compound_reference_name_mask         u32
	max_temporal_layer_count                           u32
	max_spatial_layer_count                            u32
	max_operating_points                               u32
	min_q_index                                        u32
	max_q_index                                        u32
	prefers_gop_remaining_frames                       Bool32
	requires_gop_remaining_frames                      Bool32
	std_syntax_flags                                   VideoEncodeAV1StdFlagsKHR
}

pub struct VideoEncodeAV1QIndexKHR {
pub mut:
	intra_q_index        u32
	predictive_q_index   u32
	bipredictive_q_index u32
}

pub struct VideoEncodeAV1QualityLevelPropertiesKHR {
pub mut:
	s_type                                                       StructureType = StructureType.structure_type_video_encode_av1_quality_level_properties_khr
	p_next                                                       voidptr
	preferred_rate_control_flags                                 VideoEncodeAV1RateControlFlagsKHR
	preferred_gop_frame_count                                    u32
	preferred_key_frame_period                                   u32
	preferred_consecutive_bipredictive_frame_count               u32
	preferred_temporal_layer_count                               u32
	preferred_constant_q_index                                   VideoEncodeAV1QIndexKHR
	preferred_max_single_reference_count                         u32
	preferred_single_reference_name_mask                         u32
	preferred_max_unidirectional_compound_reference_count        u32
	preferred_max_unidirectional_compound_group1_reference_count u32
	preferred_unidirectional_compound_reference_name_mask        u32
	preferred_max_bidirectional_compound_reference_count         u32
	preferred_max_bidirectional_compound_group1_reference_count  u32
	preferred_max_bidirectional_compound_group2_reference_count  u32
	preferred_bidirectional_compound_reference_name_mask         u32
}

pub struct VideoEncodeAV1SessionCreateInfoKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_video_encode_av1_session_create_info_khr
	p_next        voidptr
	use_max_level Bool32
	max_level     u32
}

pub struct VideoEncodeAV1SessionParametersCreateInfoKHR {
pub mut:
	s_type                    StructureType = StructureType.structure_type_video_encode_av1_session_parameters_create_info_khr
	p_next                    voidptr
	p_std_sequence_header     &voidptr
	p_std_decoder_model_info  &StdVideoEncodeAV1DecoderModelInfo
	std_operating_point_count u32
	p_std_operating_points    &StdVideoEncodeAV1OperatingPointInfo
}

pub struct VideoEncodeAV1PictureInfoKHR {
pub mut:
	s_type                        StructureType = StructureType.structure_type_video_encode_av1_picture_info_khr
	p_next                        voidptr
	prediction_mode               VideoEncodeAV1PredictionModeKHR
	rate_control_group            VideoEncodeAV1RateControlGroupKHR
	constant_q_index              u32
	p_std_picture_info            &StdVideoEncodeAV1PictureInfo
	reference_name_slot_indices   [max_video_av1_references_per_frame_khr]i32
	primary_reference_cdf_only    Bool32
	generate_obu_extension_header Bool32
}

pub struct VideoEncodeAV1DpbSlotInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_encode_av1_dpb_slot_info_khr
	p_next               voidptr
	p_std_reference_info &StdVideoEncodeAV1ReferenceInfo
}

pub struct VideoEncodeAV1ProfileInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_video_encode_av1_profile_info_khr
	p_next      voidptr
	std_profile u32
}

pub struct VideoEncodeAV1FrameSizeKHR {
pub mut:
	intra_frame_size        u32
	predictive_frame_size   u32
	bipredictive_frame_size u32
}

pub struct VideoEncodeAV1GopRemainingFrameInfoKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_video_encode_av1_gop_remaining_frame_info_khr
	p_next                     voidptr
	use_gop_remaining_frames   Bool32
	gop_remaining_intra        u32
	gop_remaining_predictive   u32
	gop_remaining_bipredictive u32
}

pub struct VideoEncodeAV1RateControlInfoKHR {
pub mut:
	s_type                               StructureType = StructureType.structure_type_video_encode_av1_rate_control_info_khr
	p_next                               voidptr
	flags                                VideoEncodeAV1RateControlFlagsKHR
	gop_frame_count                      u32
	key_frame_period                     u32
	consecutive_bipredictive_frame_count u32
	temporal_layer_count                 u32
}

pub struct VideoEncodeAV1RateControlLayerInfoKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_video_encode_av1_rate_control_layer_info_khr
	p_next             voidptr
	use_min_q_index    Bool32
	min_q_index        VideoEncodeAV1QIndexKHR
	use_max_q_index    Bool32
	max_q_index        VideoEncodeAV1QIndexKHR
	use_max_frame_size Bool32
	max_frame_size     VideoEncodeAV1FrameSizeKHR
}

pub const khr_video_maintenance_1_spec_version = 1
pub const khr_video_maintenance_1_extension_name = 'VK_KHR_video_maintenance1'

pub struct PhysicalDeviceVideoMaintenance1FeaturesKHR {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_video_maintenance1_features_khr
	p_next             voidptr
	video_maintenance1 Bool32
}

pub struct VideoInlineQueryInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_video_inline_query_info_khr
	p_next      voidptr
	query_pool  C.QueryPool
	first_query u32
	query_count u32
}

pub const khr_vertex_attribute_divisor_spec_version = 1
pub const khr_vertex_attribute_divisor_extension_name = 'VK_KHR_vertex_attribute_divisor'

pub struct PhysicalDeviceVertexAttributeDivisorPropertiesKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_vertex_attribute_divisor_properties_khr
	p_next                           voidptr
	max_vertex_attrib_divisor        u32
	supports_non_zero_first_instance Bool32
}

pub struct VertexInputBindingDivisorDescriptionKHR {
pub mut:
	binding u32
	divisor u32
}

pub struct PipelineVertexInputDivisorStateCreateInfoKHR {
pub mut:
	s_type                       StructureType = StructureType.structure_type_pipeline_vertex_input_divisor_state_create_info_khr
	p_next                       voidptr
	vertex_binding_divisor_count u32
	p_vertex_binding_divisors    &VertexInputBindingDivisorDescriptionKHR
}

pub struct PhysicalDeviceVertexAttributeDivisorFeaturesKHR {
pub mut:
	s_type                                      StructureType = StructureType.structure_type_physical_device_vertex_attribute_divisor_features_khr
	p_next                                      voidptr
	vertex_attribute_instance_rate_divisor      Bool32
	vertex_attribute_instance_rate_zero_divisor Bool32
}

pub const khr_load_store_op_none_spec_version = 1
pub const khr_load_store_op_none_extension_name = 'VK_KHR_load_store_op_none'

pub const khr_shader_float_controls_2_spec_version = 1
pub const khr_shader_float_controls_2_extension_name = 'VK_KHR_shader_float_controls2'

pub struct PhysicalDeviceShaderFloatControls2FeaturesKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_shader_float_controls2_features_khr
	p_next                 voidptr
	shader_float_controls2 Bool32
}

pub const khr_index_type_uint8_spec_version = 1
pub const khr_index_type_uint8_extension_name = 'VK_KHR_index_type_uint8'

pub struct PhysicalDeviceIndexTypeUint8FeaturesKHR {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_index_type_uint8_features_khr
	p_next           voidptr
	index_type_uint8 Bool32
}

pub const khr_line_rasterization_spec_version = 1
pub const khr_line_rasterization_extension_name = 'VK_KHR_line_rasterization'

pub enum LineRasterizationModeKHR {
	line_rasterization_mode_default_khr            = int(0)
	line_rasterization_mode_rectangular_khr        = int(1)
	line_rasterization_mode_bresenham_khr          = int(2)
	line_rasterization_mode_rectangular_smooth_khr = int(3)
	line_rasterization_mode_max_enum_khr           = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceLineRasterizationFeaturesKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_line_rasterization_features_khr
	p_next                     voidptr
	rectangular_lines          Bool32
	bresenham_lines            Bool32
	smooth_lines               Bool32
	stippled_rectangular_lines Bool32
	stippled_bresenham_lines   Bool32
	stippled_smooth_lines      Bool32
}

pub struct PhysicalDeviceLineRasterizationPropertiesKHR {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_line_rasterization_properties_khr
	p_next                        voidptr
	line_sub_pixel_precision_bits u32
}

pub struct PipelineRasterizationLineStateCreateInfoKHR {
pub mut:
	s_type                  StructureType = StructureType.structure_type_pipeline_rasterization_line_state_create_info_khr
	p_next                  voidptr
	line_rasterization_mode LineRasterizationModeKHR
	stippled_line_enable    Bool32
	line_stipple_factor     u32
	line_stipple_pattern    u16
}

fn C.vkCmdSetLineStippleKHR(C.CommandBuffer,
	u32,
	u16)
pub fn cmd_set_line_stipple_khr(command_buffer C.CommandBuffer,
	line_stipple_factor u32,
	line_stipple_pattern u16) {
	C.vkCmdSetLineStippleKHR(command_buffer, line_stipple_factor, line_stipple_pattern)
}

pub const khr_calibrated_timestamps_spec_version = 1
pub const khr_calibrated_timestamps_extension_name = 'VK_KHR_calibrated_timestamps'

pub enum TimeDomainKHR {
	time_domain_device_khr                    = int(0)
	time_domain_clock_monotonic_khr           = int(1)
	time_domain_clock_monotonic_raw_khr       = int(2)
	time_domain_query_performance_counter_khr = int(3)
	time_domain_max_enum_khr                  = int(0x7FFFFFFF)
}

pub struct CalibratedTimestampInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_calibrated_timestamp_info_khr
	p_next      voidptr
	time_domain TimeDomainKHR
}

fn C.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR(C.PhysicalDevice,
	&u32,
	&TimeDomainKHR) Result
pub fn get_physical_device_calibrateable_time_domains_khr(physical_device C.PhysicalDevice,
	p_time_domain_count &u32,
	p_time_domains &TimeDomainKHR) Result {
	return C.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR(physical_device, p_time_domain_count,
		p_time_domains)
}

fn C.vkGetCalibratedTimestampsKHR(C.Device,
	u32,
	&CalibratedTimestampInfoKHR,
	&u64,
	&u64) Result
pub fn get_calibrated_timestamps_khr(device C.Device,
	timestamp_count u32,
	p_timestamp_infos &CalibratedTimestampInfoKHR,
	p_timestamps &u64,
	p_max_deviation &u64) Result {
	return C.vkGetCalibratedTimestampsKHR(device, timestamp_count, p_timestamp_infos,
		p_timestamps, p_max_deviation)
}

pub const khr_shader_expect_assume_spec_version = 1
pub const khr_shader_expect_assume_extension_name = 'VK_KHR_shader_expect_assume'

pub struct PhysicalDeviceShaderExpectAssumeFeaturesKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_shader_expect_assume_features_khr
	p_next               voidptr
	shader_expect_assume Bool32
}

pub const khr_maintenance_6_spec_version = 1
pub const khr_maintenance_6_extension_name = 'VK_KHR_maintenance6'

pub struct PhysicalDeviceMaintenance6FeaturesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_maintenance6_features_khr
	p_next       voidptr
	maintenance6 Bool32
}

pub struct PhysicalDeviceMaintenance6PropertiesKHR {
pub mut:
	s_type                                      StructureType = StructureType.structure_type_physical_device_maintenance6_properties_khr
	p_next                                      voidptr
	block_texel_view_compatible_multiple_layers Bool32
	max_combined_image_sampler_descriptor_count u32
	fragment_shading_rate_clamp_combiner_inputs Bool32
}

pub struct BindMemoryStatusKHR {
pub mut:
	s_type   StructureType = StructureType.structure_type_bind_memory_status_khr
	p_next   voidptr
	p_result &Result
}

pub struct BindDescriptorSetsInfoKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_bind_descriptor_sets_info_khr
	p_next               voidptr
	stage_flags          ShaderStageFlags
	layout               C.PipelineLayout
	first_set            u32
	descriptor_set_count u32
	p_descriptor_sets    &C.DescriptorSet
	dynamic_offset_count u32
	p_dynamic_offsets    &u32
}

pub struct PushConstantsInfoKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_push_constants_info_khr
	p_next      voidptr
	layout      C.PipelineLayout
	stage_flags ShaderStageFlags
	offset      u32
	size        u32
	p_values    voidptr
}

pub struct PushDescriptorSetInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_push_descriptor_set_info_khr
	p_next                 voidptr
	stage_flags            ShaderStageFlags
	layout                 C.PipelineLayout
	set                    u32
	descriptor_write_count u32
	p_descriptor_writes    &WriteDescriptorSet
}

pub struct PushDescriptorSetWithTemplateInfoKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_push_descriptor_set_with_template_info_khr
	p_next                     voidptr
	descriptor_update_template C.DescriptorUpdateTemplate
	layout                     C.PipelineLayout
	set                        u32
	p_data                     voidptr
}

pub struct SetDescriptorBufferOffsetsInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_set_descriptor_buffer_offsets_info_ext
	p_next           voidptr
	stage_flags      ShaderStageFlags
	layout           C.PipelineLayout
	first_set        u32
	set_count        u32
	p_buffer_indices &u32
	p_offsets        &DeviceSize
}

pub struct BindDescriptorBufferEmbeddedSamplersInfoEXT {
pub mut:
	s_type      StructureType = StructureType.structure_type_bind_descriptor_buffer_embedded_samplers_info_ext
	p_next      voidptr
	stage_flags ShaderStageFlags
	layout      C.PipelineLayout
	set         u32
}

fn C.vkCmdBindDescriptorSets2KHR(C.CommandBuffer,
	&BindDescriptorSetsInfoKHR)
pub fn cmd_bind_descriptor_sets2_khr(command_buffer C.CommandBuffer,
	p_bind_descriptor_sets_info &BindDescriptorSetsInfoKHR) {
	C.vkCmdBindDescriptorSets2KHR(command_buffer, p_bind_descriptor_sets_info)
}

fn C.vkCmdPushConstants2KHR(C.CommandBuffer,
	&PushConstantsInfoKHR)
pub fn cmd_push_constants2_khr(command_buffer C.CommandBuffer,
	p_push_constants_info &PushConstantsInfoKHR) {
	C.vkCmdPushConstants2KHR(command_buffer, p_push_constants_info)
}

fn C.vkCmdPushDescriptorSet2KHR(C.CommandBuffer,
	&PushDescriptorSetInfoKHR)
pub fn cmd_push_descriptor_set2_khr(command_buffer C.CommandBuffer,
	p_push_descriptor_set_info &PushDescriptorSetInfoKHR) {
	C.vkCmdPushDescriptorSet2KHR(command_buffer, p_push_descriptor_set_info)
}

fn C.vkCmdPushDescriptorSetWithTemplate2KHR(C.CommandBuffer,
	&PushDescriptorSetWithTemplateInfoKHR)
pub fn cmd_push_descriptor_set_with_template2_khr(command_buffer C.CommandBuffer,
	p_push_descriptor_set_with_template_info &PushDescriptorSetWithTemplateInfoKHR) {
	C.vkCmdPushDescriptorSetWithTemplate2KHR(command_buffer, p_push_descriptor_set_with_template_info)
}

fn C.vkCmdSetDescriptorBufferOffsets2EXT(C.CommandBuffer,
	&SetDescriptorBufferOffsetsInfoEXT)
pub fn cmd_set_descriptor_buffer_offsets2_ext(command_buffer C.CommandBuffer,
	p_set_descriptor_buffer_offsets_info &SetDescriptorBufferOffsetsInfoEXT) {
	C.vkCmdSetDescriptorBufferOffsets2EXT(command_buffer, p_set_descriptor_buffer_offsets_info)
}

fn C.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(C.CommandBuffer,
	&BindDescriptorBufferEmbeddedSamplersInfoEXT)
pub fn cmd_bind_descriptor_buffer_embedded_samplers2_ext(command_buffer C.CommandBuffer,
	p_bind_descriptor_buffer_embedded_samplers_info &BindDescriptorBufferEmbeddedSamplersInfoEXT) {
	C.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(command_buffer, p_bind_descriptor_buffer_embedded_samplers_info)
}

pub const khr_video_encode_quantization_map_spec_version = 2
pub const khr_video_encode_quantization_map_extension_name = 'VK_KHR_video_encode_quantization_map'

pub struct VideoEncodeQuantizationMapCapabilitiesKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_video_encode_quantization_map_capabilities_khr
	p_next                      voidptr
	max_quantization_map_extent Extent2D
}

pub struct VideoFormatQuantizationMapPropertiesKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_video_format_quantization_map_properties_khr
	p_next                      voidptr
	quantization_map_texel_size Extent2D
}

pub struct VideoEncodeQuantizationMapInfoKHR {
pub mut:
	s_type                  StructureType = StructureType.structure_type_video_encode_quantization_map_info_khr
	p_next                  voidptr
	quantization_map        C.ImageView
	quantization_map_extent Extent2D
}

pub struct VideoEncodeQuantizationMapSessionParametersCreateInfoKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_video_encode_quantization_map_session_parameters_create_info_khr
	p_next                      voidptr
	quantization_map_texel_size Extent2D
}

pub struct PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_video_encode_quantization_map_features_khr
	p_next                        voidptr
	video_encode_quantization_map Bool32
}

pub struct VideoEncodeH264QuantizationMapCapabilitiesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_video_encode_h264_quantization_map_capabilities_khr
	p_next       voidptr
	min_qp_delta i32
	max_qp_delta i32
}

pub struct VideoEncodeH265QuantizationMapCapabilitiesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_video_encode_h265_quantization_map_capabilities_khr
	p_next       voidptr
	min_qp_delta i32
	max_qp_delta i32
}

pub struct VideoFormatH265QuantizationMapPropertiesKHR {
pub mut:
	s_type               StructureType = StructureType.structure_type_video_format_h265_quantization_map_properties_khr
	p_next               voidptr
	compatible_ctb_sizes VideoEncodeH265CtbSizeFlagsKHR
}

pub struct VideoEncodeAV1QuantizationMapCapabilitiesKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_video_encode_av1_quantization_map_capabilities_khr
	p_next            voidptr
	min_q_index_delta i32
	max_q_index_delta i32
}

pub struct VideoFormatAV1QuantizationMapPropertiesKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_video_format_av1_quantization_map_properties_khr
	p_next                      voidptr
	compatible_superblock_sizes VideoEncodeAV1SuperblockSizeFlagsKHR
}

pub const khr_shader_relaxed_extended_instruction_spec_version = 1
pub const khr_shader_relaxed_extended_instruction_extension_name = 'VK_KHR_shader_relaxed_extended_instruction'

pub struct PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_shader_relaxed_extended_instruction_features_khr
	p_next                              voidptr
	shader_relaxed_extended_instruction Bool32
}

pub const khr_maintenance_7_spec_version = 1
pub const khr_maintenance_7_extension_name = 'VK_KHR_maintenance7'

pub enum PhysicalDeviceLayeredApiKHR {
	physical_device_layered_api_vulkan_khr   = int(0)
	physical_device_layered_api_d3d12_khr    = int(1)
	physical_device_layered_api_metal_khr    = int(2)
	physical_device_layered_api_opengl_khr   = int(3)
	physical_device_layered_api_opengles_khr = int(4)
	physical_device_layered_api_max_enum_khr = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceMaintenance7FeaturesKHR {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_maintenance7_features_khr
	p_next       voidptr
	maintenance7 Bool32
}

pub struct PhysicalDeviceMaintenance7PropertiesKHR {
pub mut:
	s_type                                                             StructureType = StructureType.structure_type_physical_device_maintenance7_properties_khr
	p_next                                                             voidptr
	robust_fragment_shading_rate_attachment_access                     Bool32
	separate_depth_stencil_attachment_access                           Bool32
	max_descriptor_set_total_uniform_buffers_dynamic                   u32
	max_descriptor_set_total_storage_buffers_dynamic                   u32
	max_descriptor_set_total_buffers_dynamic                           u32
	max_descriptor_set_update_after_bind_total_uniform_buffers_dynamic u32
	max_descriptor_set_update_after_bind_total_storage_buffers_dynamic u32
	max_descriptor_set_update_after_bind_total_buffers_dynamic         u32
}

pub struct PhysicalDeviceLayeredApiPropertiesKHR {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_layered_api_properties_khr
	p_next      voidptr
	vendor_id   u32
	device_id   u32
	layered_api PhysicalDeviceLayeredApiKHR
	device_name [max_physical_device_name_size]char
}

pub struct PhysicalDeviceLayeredApiPropertiesListKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_layered_api_properties_list_khr
	p_next            voidptr
	layered_api_count u32
	p_layered_apis    &PhysicalDeviceLayeredApiPropertiesKHR
}

pub struct PhysicalDeviceLayeredApiVulkanPropertiesKHR {
pub mut:
	s_type     StructureType = StructureType.structure_type_physical_device_layered_api_vulkan_properties_khr
	p_next     voidptr
	properties PhysicalDeviceProperties2
}

pub type C.DebugReportCallbackEXT = voidptr

pub const ext_debug_report_spec_version = 10
pub const ext_debug_report_extension_name = 'VK_EXT_debug_report'

pub enum DebugReportObjectTypeEXT {
	debug_report_object_type_unknown_ext                    = int(0)
	debug_report_object_type_instance_ext                   = int(1)
	debug_report_object_type_physical_device_ext            = int(2)
	debug_report_object_type_device_ext                     = int(3)
	debug_report_object_type_queue_ext                      = int(4)
	debug_report_object_type_semaphore_ext                  = int(5)
	debug_report_object_type_command_buffer_ext             = int(6)
	debug_report_object_type_fence_ext                      = int(7)
	debug_report_object_type_device_memory_ext              = int(8)
	debug_report_object_type_buffer_ext                     = int(9)
	debug_report_object_type_image_ext                      = int(10)
	debug_report_object_type_event_ext                      = int(11)
	debug_report_object_type_query_pool_ext                 = int(12)
	debug_report_object_type_buffer_view_ext                = int(13)
	debug_report_object_type_image_view_ext                 = int(14)
	debug_report_object_type_shader_module_ext              = int(15)
	debug_report_object_type_pipeline_cache_ext             = int(16)
	debug_report_object_type_pipeline_layout_ext            = int(17)
	debug_report_object_type_render_pass_ext                = int(18)
	debug_report_object_type_pipeline_ext                   = int(19)
	debug_report_object_type_descriptor_set_layout_ext      = int(20)
	debug_report_object_type_sampler_ext                    = int(21)
	debug_report_object_type_descriptor_pool_ext            = int(22)
	debug_report_object_type_descriptor_set_ext             = int(23)
	debug_report_object_type_framebuffer_ext                = int(24)
	debug_report_object_type_command_pool_ext               = int(25)
	debug_report_object_type_surface_khr_ext                = int(26)
	debug_report_object_type_swapchain_khr_ext              = int(27)
	debug_report_object_type_debug_report_callback_ext_ext  = int(28)
	debug_report_object_type_display_khr_ext                = int(29)
	debug_report_object_type_display_mode_khr_ext           = int(30)
	debug_report_object_type_validation_cache_ext_ext       = int(33)
	debug_report_object_type_sampler_ycbcr_conversion_ext   = int(1000156000)
	debug_report_object_type_descriptor_update_template_ext = int(1000085000)
	debug_report_object_type_cu_module_nvx_ext              = int(1000029000)
	debug_report_object_type_cu_function_nvx_ext            = int(1000029001)
	debug_report_object_type_acceleration_structure_khr_ext = int(1000150000)
	debug_report_object_type_acceleration_structure_nv_ext  = int(1000165000)
	debug_report_object_type_cuda_module_nv_ext             = int(1000307000)
	debug_report_object_type_cuda_function_nv_ext           = int(1000307001)
	debug_report_object_type_buffer_collection_fuchsia_ext  = int(1000366000)
	debug_report_object_type_max_enum_ext                   = int(0x7FFFFFFF)
}

pub enum DebugReportFlagBitsEXT {
	debug_report_information_bit_ext         = int(0x00000001)
	debug_report_warning_bit_ext             = int(0x00000002)
	debug_report_performance_warning_bit_ext = int(0x00000004)
	debug_report_error_bit_ext               = int(0x00000008)
	debug_report_debug_bit_ext               = int(0x00000010)
	debug_report_flag_bits_max_enum_ext      = int(0x7FFFFFFF)
}

pub type DebugReportFlagsEXT = u32
pub type PFN_vkDebugReportCallbackEXT = fn (flags DebugReportFlagsEXT, objectType DebugReportObjectTypeEXT, object u64, location usize, messageCode i32, pLayerPrefix &char, pMessage &char, pUserData voidptr)

pub struct DebugReportCallbackCreateInfoEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_debug_report_callback_create_info_ext
	p_next       voidptr
	flags        DebugReportFlagsEXT
	pfn_callback PFN_vkDebugReportCallbackEXT = unsafe { nil }
	p_user_data  voidptr
}

fn C.vkCreateDebugReportCallbackEXT(C.Instance,
	&DebugReportCallbackCreateInfoEXT,
	&AllocationCallbacks,
	&C.DebugReportCallbackEXT) Result
pub fn create_debug_report_callback_ext(instance C.Instance,
	p_create_info &DebugReportCallbackCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_callback &C.DebugReportCallbackEXT) Result {
	return C.vkCreateDebugReportCallbackEXT(instance, p_create_info, p_allocator, p_callback)
}

fn C.vkDestroyDebugReportCallbackEXT(C.Instance,
	C.DebugReportCallbackEXT,
	&AllocationCallbacks)
pub fn destroy_debug_report_callback_ext(instance C.Instance,
	callback C.DebugReportCallbackEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDebugReportCallbackEXT(instance, callback, p_allocator)
}

fn C.vkDebugReportMessageEXT(C.Instance,
	DebugReportFlagsEXT,
	DebugReportObjectTypeEXT,
	u64,
	usize,
	i32,
	&char,
	&char)
pub fn debug_report_message_ext(instance C.Instance,
	flags DebugReportFlagsEXT,
	object_type DebugReportObjectTypeEXT,
	object u64,
	location usize,
	message_code i32,
	p_layer_prefix &char,
	p_message &char) {
	C.vkDebugReportMessageEXT(instance, flags, object_type, object, location, message_code,
		p_layer_prefix, p_message)
}

pub const nv_glsl_shader_spec_version = 1
pub const nv_glsl_shader_extension_name = 'VK_NV_glsl_shader'

pub const ext_depth_range_unrestricted_spec_version = 1
pub const ext_depth_range_unrestricted_extension_name = 'VK_EXT_depth_range_unrestricted'

pub const img_filter_cubic_spec_version = 1
pub const img_filter_cubic_extension_name = 'VK_IMG_filter_cubic'

pub const amd_rasterization_order_spec_version = 1
pub const amd_rasterization_order_extension_name = 'VK_AMD_rasterization_order'

pub enum RasterizationOrderAMD {
	rasterization_order_strict_amd   = int(0)
	rasterization_order_relaxed_amd  = int(1)
	rasterization_order_max_enum_amd = int(0x7FFFFFFF)
}

pub struct PipelineRasterizationStateRasterizationOrderAMD {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_rasterization_state_rasterization_order_amd
	p_next              voidptr
	rasterization_order RasterizationOrderAMD
}

pub const amd_shader_trinary_minmax_spec_version = 1
pub const amd_shader_trinary_minmax_extension_name = 'VK_AMD_shader_trinary_minmax'

pub const amd_shader_explicit_vertex_parameter_spec_version = 1
pub const amd_shader_explicit_vertex_parameter_extension_name = 'VK_AMD_shader_explicit_vertex_parameter'

pub const ext_debug_marker_spec_version = 4
pub const ext_debug_marker_extension_name = 'VK_EXT_debug_marker'

pub struct DebugMarkerObjectNameInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_debug_marker_object_name_info_ext
	p_next        voidptr
	object_type   DebugReportObjectTypeEXT
	object        u64
	p_object_name &char
}

pub struct DebugMarkerObjectTagInfoEXT {
pub mut:
	s_type      StructureType = StructureType.structure_type_debug_marker_object_tag_info_ext
	p_next      voidptr
	object_type DebugReportObjectTypeEXT
	object      u64
	tag_name    u64
	tag_size    usize
	p_tag       voidptr
}

pub struct DebugMarkerMarkerInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_debug_marker_marker_info_ext
	p_next        voidptr
	p_marker_name &char
	color         [4]f32
}

fn C.vkDebugMarkerSetObjectTagEXT(C.Device,
	&DebugMarkerObjectTagInfoEXT) Result
pub fn debug_marker_set_object_tag_ext(device C.Device,
	p_tag_info &DebugMarkerObjectTagInfoEXT) Result {
	return C.vkDebugMarkerSetObjectTagEXT(device, p_tag_info)
}

fn C.vkDebugMarkerSetObjectNameEXT(C.Device,
	&DebugMarkerObjectNameInfoEXT) Result
pub fn debug_marker_set_object_name_ext(device C.Device,
	p_name_info &DebugMarkerObjectNameInfoEXT) Result {
	return C.vkDebugMarkerSetObjectNameEXT(device, p_name_info)
}

fn C.vkCmdDebugMarkerBeginEXT(C.CommandBuffer,
	&DebugMarkerMarkerInfoEXT)
pub fn cmd_debug_marker_begin_ext(command_buffer C.CommandBuffer,
	p_marker_info &DebugMarkerMarkerInfoEXT) {
	C.vkCmdDebugMarkerBeginEXT(command_buffer, p_marker_info)
}

fn C.vkCmdDebugMarkerEndEXT(C.CommandBuffer)
pub fn cmd_debug_marker_end_ext(command_buffer C.CommandBuffer) {
	C.vkCmdDebugMarkerEndEXT(command_buffer)
}

fn C.vkCmdDebugMarkerInsertEXT(C.CommandBuffer,
	&DebugMarkerMarkerInfoEXT)
pub fn cmd_debug_marker_insert_ext(command_buffer C.CommandBuffer,
	p_marker_info &DebugMarkerMarkerInfoEXT) {
	C.vkCmdDebugMarkerInsertEXT(command_buffer, p_marker_info)
}

pub const amd_gcn_shader_spec_version = 1
pub const amd_gcn_shader_extension_name = 'VK_AMD_gcn_shader'

pub const nv_dedicated_allocation_spec_version = 1
pub const nv_dedicated_allocation_extension_name = 'VK_NV_dedicated_allocation'

pub struct DedicatedAllocationImageCreateInfoNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_dedicated_allocation_image_create_info_nv
	p_next               voidptr
	dedicated_allocation Bool32
}

pub struct DedicatedAllocationBufferCreateInfoNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_dedicated_allocation_buffer_create_info_nv
	p_next               voidptr
	dedicated_allocation Bool32
}

pub struct DedicatedAllocationMemoryAllocateInfoNV {
pub mut:
	s_type StructureType = StructureType.structure_type_dedicated_allocation_memory_allocate_info_nv
	p_next voidptr
	image  C.Image
	buffer C.Buffer
}

pub const ext_transform_feedback_spec_version = 1
pub const ext_transform_feedback_extension_name = 'VK_EXT_transform_feedback'

pub type PipelineRasterizationStateStreamCreateFlagsEXT = u32

pub struct PhysicalDeviceTransformFeedbackFeaturesEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_transform_feedback_features_ext
	p_next             voidptr
	transform_feedback Bool32
	geometry_streams   Bool32
}

pub struct PhysicalDeviceTransformFeedbackPropertiesEXT {
pub mut:
	s_type                                         StructureType = StructureType.structure_type_physical_device_transform_feedback_properties_ext
	p_next                                         voidptr
	max_transform_feedback_streams                 u32
	max_transform_feedback_buffers                 u32
	max_transform_feedback_buffer_size             DeviceSize
	max_transform_feedback_stream_data_size        u32
	max_transform_feedback_buffer_data_size        u32
	max_transform_feedback_buffer_data_stride      u32
	transform_feedback_queries                     Bool32
	transform_feedback_streams_lines_triangles     Bool32
	transform_feedback_rasterization_stream_select Bool32
	transform_feedback_draw                        Bool32
}

pub struct PipelineRasterizationStateStreamCreateInfoEXT {
pub mut:
	s_type               StructureType = StructureType.structure_type_pipeline_rasterization_state_stream_create_info_ext
	p_next               voidptr
	flags                PipelineRasterizationStateStreamCreateFlagsEXT
	rasterization_stream u32
}

fn C.vkCmdBindTransformFeedbackBuffersEXT(C.CommandBuffer,
	u32,
	u32,
	&C.Buffer,
	&DeviceSize,
	&DeviceSize)
pub fn cmd_bind_transform_feedback_buffers_ext(command_buffer C.CommandBuffer,
	first_binding u32,
	binding_count u32,
	p_buffers &C.Buffer,
	p_offsets &DeviceSize,
	p_sizes &DeviceSize) {
	C.vkCmdBindTransformFeedbackBuffersEXT(command_buffer, first_binding, binding_count,
		p_buffers, p_offsets, p_sizes)
}

fn C.vkCmdBeginTransformFeedbackEXT(C.CommandBuffer,
	u32,
	u32,
	&C.Buffer,
	&DeviceSize)
pub fn cmd_begin_transform_feedback_ext(command_buffer C.CommandBuffer,
	first_counter_buffer u32,
	counter_buffer_count u32,
	p_counter_buffers &C.Buffer,
	p_counter_buffer_offsets &DeviceSize) {
	C.vkCmdBeginTransformFeedbackEXT(command_buffer, first_counter_buffer, counter_buffer_count,
		p_counter_buffers, p_counter_buffer_offsets)
}

fn C.vkCmdEndTransformFeedbackEXT(C.CommandBuffer,
	u32,
	u32,
	&C.Buffer,
	&DeviceSize)
pub fn cmd_end_transform_feedback_ext(command_buffer C.CommandBuffer,
	first_counter_buffer u32,
	counter_buffer_count u32,
	p_counter_buffers &C.Buffer,
	p_counter_buffer_offsets &DeviceSize) {
	C.vkCmdEndTransformFeedbackEXT(command_buffer, first_counter_buffer, counter_buffer_count,
		p_counter_buffers, p_counter_buffer_offsets)
}

fn C.vkCmdBeginQueryIndexedEXT(C.CommandBuffer,
	C.QueryPool,
	u32,
	QueryControlFlags,
	u32)
pub fn cmd_begin_query_indexed_ext(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	query u32,
	flags QueryControlFlags,
	index u32) {
	C.vkCmdBeginQueryIndexedEXT(command_buffer, query_pool, query, flags, index)
}

fn C.vkCmdEndQueryIndexedEXT(C.CommandBuffer,
	C.QueryPool,
	u32,
	u32)
pub fn cmd_end_query_indexed_ext(command_buffer C.CommandBuffer,
	query_pool C.QueryPool,
	query u32,
	index u32) {
	C.vkCmdEndQueryIndexedEXT(command_buffer, query_pool, query, index)
}

fn C.vkCmdDrawIndirectByteCountEXT(C.CommandBuffer,
	u32,
	u32,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_indirect_byte_count_ext(command_buffer C.CommandBuffer,
	instance_count u32,
	first_instance u32,
	counter_buffer C.Buffer,
	counter_buffer_offset DeviceSize,
	counter_offset u32,
	vertex_stride u32) {
	C.vkCmdDrawIndirectByteCountEXT(command_buffer, instance_count, first_instance, counter_buffer,
		counter_buffer_offset, counter_offset, vertex_stride)
}

pub type C.CuModuleNVX = voidptr
pub type C.CuFunctionNVX = voidptr

pub const nvx_binary_import_spec_version = 2
pub const nvx_binary_import_extension_name = 'VK_NVX_binary_import'

pub struct CuModuleCreateInfoNVX {
pub mut:
	s_type    StructureType = StructureType.structure_type_cu_module_create_info_nvx
	p_next    voidptr
	data_size usize
	p_data    voidptr
}

pub struct CuModuleTexturingModeCreateInfoNVX {
pub mut:
	s_type             StructureType = StructureType.structure_type_cu_module_texturing_mode_create_info_nvx
	p_next             voidptr
	use64bit_texturing Bool32
}

pub struct CuFunctionCreateInfoNVX {
pub mut:
	s_type   StructureType = StructureType.structure_type_cu_function_create_info_nvx
	p_next   voidptr
	vkmodule C.CuModuleNVX
	p_name   &char
}

pub struct CuLaunchInfoNVX {
pub mut:
	s_type           StructureType = StructureType.structure_type_cu_launch_info_nvx
	p_next           voidptr
	function         C.CuFunctionNVX
	grid_dim_x       u32
	grid_dim_y       u32
	grid_dim_z       u32
	block_dim_x      u32
	block_dim_y      u32
	block_dim_z      u32
	shared_mem_bytes u32
	param_count      usize
	p_params         voidptr
	extra_count      usize
	p_extras         voidptr
}

fn C.vkCreateCuModuleNVX(C.Device,
	&CuModuleCreateInfoNVX,
	&AllocationCallbacks,
	&C.CuModuleNVX) Result
pub fn create_cu_module_nvx(device C.Device,
	p_create_info &CuModuleCreateInfoNVX,
	p_allocator &AllocationCallbacks,
	p_module &C.CuModuleNVX) Result {
	return C.vkCreateCuModuleNVX(device, p_create_info, p_allocator, p_module)
}

fn C.vkCreateCuFunctionNVX(C.Device,
	&CuFunctionCreateInfoNVX,
	&AllocationCallbacks,
	&C.CuFunctionNVX) Result
pub fn create_cu_function_nvx(device C.Device,
	p_create_info &CuFunctionCreateInfoNVX,
	p_allocator &AllocationCallbacks,
	p_function &C.CuFunctionNVX) Result {
	return C.vkCreateCuFunctionNVX(device, p_create_info, p_allocator, p_function)
}

fn C.vkDestroyCuModuleNVX(C.Device,
	C.CuModuleNVX,
	&AllocationCallbacks)
pub fn destroy_cu_module_nvx(device C.Device,
	vkmodule C.CuModuleNVX,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyCuModuleNVX(device, vkmodule, p_allocator)
}

fn C.vkDestroyCuFunctionNVX(C.Device,
	C.CuFunctionNVX,
	&AllocationCallbacks)
pub fn destroy_cu_function_nvx(device C.Device,
	function C.CuFunctionNVX,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyCuFunctionNVX(device, function, p_allocator)
}

fn C.vkCmdCuLaunchKernelNVX(C.CommandBuffer,
	&CuLaunchInfoNVX)
pub fn cmd_cu_launch_kernel_nvx(command_buffer C.CommandBuffer,
	p_launch_info &CuLaunchInfoNVX) {
	C.vkCmdCuLaunchKernelNVX(command_buffer, p_launch_info)
}

pub const nvx_image_view_handle_spec_version = 3
pub const nvx_image_view_handle_extension_name = 'VK_NVX_image_view_handle'

pub struct ImageViewHandleInfoNVX {
pub mut:
	s_type          StructureType = StructureType.structure_type_image_view_handle_info_nvx
	p_next          voidptr
	image_view      C.ImageView
	descriptor_type DescriptorType
	sampler         C.Sampler
}

pub struct ImageViewAddressPropertiesNVX {
pub mut:
	s_type         StructureType = StructureType.structure_type_image_view_address_properties_nvx
	p_next         voidptr
	device_address DeviceAddress
	size           DeviceSize
}

fn C.vkGetImageViewHandleNVX(C.Device,
	&ImageViewHandleInfoNVX) u32
pub fn get_image_view_handle_nvx(device C.Device,
	p_info &ImageViewHandleInfoNVX) u32 {
	return C.vkGetImageViewHandleNVX(device, p_info)
}

fn C.vkGetImageViewHandle64NVX(C.Device,
	&ImageViewHandleInfoNVX) u64
pub fn get_image_view_handle64_nvx(device C.Device,
	p_info &ImageViewHandleInfoNVX) u64 {
	return C.vkGetImageViewHandle64NVX(device, p_info)
}

fn C.vkGetImageViewAddressNVX(C.Device,
	C.ImageView,
	&ImageViewAddressPropertiesNVX) Result
pub fn get_image_view_address_nvx(device C.Device,
	image_view C.ImageView,
	p_properties &ImageViewAddressPropertiesNVX) Result {
	return C.vkGetImageViewAddressNVX(device, image_view, p_properties)
}

pub const amd_draw_indirect_count_spec_version = 2
pub const amd_draw_indirect_count_extension_name = 'VK_AMD_draw_indirect_count'

pub const amd_negative_viewport_height_spec_version = 1
pub const amd_negative_viewport_height_extension_name = 'VK_AMD_negative_viewport_height'

pub const amd_gpu_shader_half_float_spec_version = 2
pub const amd_gpu_shader_half_float_extension_name = 'VK_AMD_gpu_shader_half_float'

pub const amd_shader_ballot_spec_version = 1
pub const amd_shader_ballot_extension_name = 'VK_AMD_shader_ballot'

pub const amd_texture_gather_bias_lod_spec_version = 1
pub const amd_texture_gather_bias_lod_extension_name = 'VK_AMD_texture_gather_bias_lod'

pub struct TextureLODGatherFormatPropertiesAMD {
pub mut:
	s_type                               StructureType = StructureType.structure_type_texture_lod_gather_format_properties_amd
	p_next                               voidptr
	supports_texture_gather_lod_bias_amd Bool32
}

pub const amd_shader_info_spec_version = 1
pub const amd_shader_info_extension_name = 'VK_AMD_shader_info'

pub enum ShaderInfoTypeAMD {
	shader_info_type_statistics_amd  = int(0)
	shader_info_type_binary_amd      = int(1)
	shader_info_type_disassembly_amd = int(2)
	shader_info_type_max_enum_amd    = int(0x7FFFFFFF)
}

pub struct ShaderResourceUsageAMD {
pub mut:
	num_used_vgprs                u32
	num_used_sgprs                u32
	lds_size_per_local_work_group u32
	lds_usage_size_in_bytes       usize
	scratch_mem_usage_in_bytes    usize
}

pub struct ShaderStatisticsInfoAMD {
pub mut:
	shader_stage_mask       ShaderStageFlags
	resource_usage          ShaderResourceUsageAMD
	num_physical_vgprs      u32
	num_physical_sgprs      u32
	num_available_vgprs     u32
	num_available_sgprs     u32
	compute_work_group_size [3]u32
}

fn C.vkGetShaderInfoAMD(C.Device,
	C.Pipeline,
	ShaderStageFlagBits,
	ShaderInfoTypeAMD,
	&usize,
	voidptr) Result
pub fn get_shader_info_amd(device C.Device,
	pipeline C.Pipeline,
	shader_stage ShaderStageFlagBits,
	info_type ShaderInfoTypeAMD,
	p_info_size &usize,
	p_info voidptr) Result {
	return C.vkGetShaderInfoAMD(device, pipeline, shader_stage, info_type, p_info_size,
		p_info)
}

pub const amd_shader_image_load_store_lod_spec_version = 1
pub const amd_shader_image_load_store_lod_extension_name = 'VK_AMD_shader_image_load_store_lod'

pub const nv_corner_sampled_image_spec_version = 2
pub const nv_corner_sampled_image_extension_name = 'VK_NV_corner_sampled_image'

pub struct PhysicalDeviceCornerSampledImageFeaturesNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_corner_sampled_image_features_nv
	p_next               voidptr
	corner_sampled_image Bool32
}

pub const img_format_pvrtc_spec_version = 1
pub const img_format_pvrtc_extension_name = 'VK_IMG_format_pvrtc'

pub const nv_external_memory_capabilities_spec_version = 1
pub const nv_external_memory_capabilities_extension_name = 'VK_NV_external_memory_capabilities'

pub enum ExternalMemoryHandleTypeFlagBitsNV {
	external_memory_handle_type_opaque_win32_bit_nv     = int(0x00000001)
	external_memory_handle_type_opaque_win32_kmt_bit_nv = int(0x00000002)
	external_memory_handle_type_d3d11_image_bit_nv      = int(0x00000004)
	external_memory_handle_type_d3d11_image_kmt_bit_nv  = int(0x00000008)
	external_memory_handle_type_flag_bits_max_enum_nv   = int(0x7FFFFFFF)
}

pub type ExternalMemoryHandleTypeFlagsNV = u32

pub enum ExternalMemoryFeatureFlagBitsNV {
	external_memory_feature_dedicated_only_bit_nv = int(0x00000001)
	external_memory_feature_exportable_bit_nv     = int(0x00000002)
	external_memory_feature_importable_bit_nv     = int(0x00000004)
	external_memory_feature_flag_bits_max_enum_nv = int(0x7FFFFFFF)
}

pub type ExternalMemoryFeatureFlagsNV = u32

pub struct ExternalImageFormatPropertiesNV {
pub mut:
	image_format_properties           ImageFormatProperties
	external_memory_features          ExternalMemoryFeatureFlagsNV
	export_from_imported_handle_types ExternalMemoryHandleTypeFlagsNV
	compatible_handle_types           ExternalMemoryHandleTypeFlagsNV
}

fn C.vkGetPhysicalDeviceExternalImageFormatPropertiesNV(C.PhysicalDevice,
	Format,
	ImageType,
	ImageTiling,
	ImageUsageFlags,
	ImageCreateFlags,
	ExternalMemoryHandleTypeFlagsNV,
	&ExternalImageFormatPropertiesNV) Result
pub fn get_physical_device_external_image_format_properties_nv(physical_device C.PhysicalDevice,
	format Format,
	vktype ImageType,
	tiling ImageTiling,
	usage ImageUsageFlags,
	flags ImageCreateFlags,
	external_handle_type ExternalMemoryHandleTypeFlagsNV,
	p_external_image_format_properties &ExternalImageFormatPropertiesNV) Result {
	return C.vkGetPhysicalDeviceExternalImageFormatPropertiesNV(physical_device, format,
		vktype, tiling, usage, flags, external_handle_type, p_external_image_format_properties)
}

pub const nv_external_memory_spec_version = 1
pub const nv_external_memory_extension_name = 'VK_NV_external_memory'

pub struct ExternalMemoryImageCreateInfoNV {
pub mut:
	s_type       StructureType = StructureType.structure_type_external_memory_image_create_info_nv
	p_next       voidptr
	handle_types ExternalMemoryHandleTypeFlagsNV
}

pub struct ExportMemoryAllocateInfoNV {
pub mut:
	s_type       StructureType = StructureType.structure_type_export_memory_allocate_info_nv
	p_next       voidptr
	handle_types ExternalMemoryHandleTypeFlagsNV
}

pub const ext_validation_flags_spec_version = 3
pub const ext_validation_flags_extension_name = 'VK_EXT_validation_flags'

pub enum ValidationCheckEXT {
	validation_check_all_ext      = int(0)
	validation_check_shaders_ext  = int(1)
	validation_check_max_enum_ext = int(0x7FFFFFFF)
}

pub struct ValidationFlagsEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_validation_flags_ext
	p_next                          voidptr
	disabled_validation_check_count u32
	p_disabled_validation_checks    &ValidationCheckEXT
}

pub const ext_shader_subgroup_ballot_spec_version = 1
pub const ext_shader_subgroup_ballot_extension_name = 'VK_EXT_shader_subgroup_ballot'

pub const ext_shader_subgroup_vote_spec_version = 1
pub const ext_shader_subgroup_vote_extension_name = 'VK_EXT_shader_subgroup_vote'

pub const ext_texture_compression_astc_hdr_spec_version = 1
pub const ext_texture_compression_astc_hdr_extension_name = 'VK_EXT_texture_compression_astc_hdr'

pub type PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT = PhysicalDeviceTextureCompressionASTCHDRFeatures

pub const ext_astc_decode_mode_spec_version = 1
pub const ext_astc_decode_mode_extension_name = 'VK_EXT_astc_decode_mode'

pub struct ImageViewASTCDecodeModeEXT {
pub mut:
	s_type      StructureType = StructureType.structure_type_image_view_astc_decode_mode_ext
	p_next      voidptr
	decode_mode Format
}

pub struct PhysicalDeviceASTCDecodeFeaturesEXT {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_astc_decode_features_ext
	p_next                      voidptr
	decode_mode_shared_exponent Bool32
}

pub const ext_pipeline_robustness_spec_version = 1
pub const ext_pipeline_robustness_extension_name = 'VK_EXT_pipeline_robustness'

pub enum PipelineRobustnessBufferBehaviorEXT {
	pipeline_robustness_buffer_behavior_device_default_ext        = int(0)
	pipeline_robustness_buffer_behavior_disabled_ext              = int(1)
	pipeline_robustness_buffer_behavior_robust_buffer_access_ext  = int(2)
	pipeline_robustness_buffer_behavior_robust_buffer_access2_ext = int(3)
	pipeline_robustness_buffer_behavior_max_enum_ext              = int(0x7FFFFFFF)
}

pub enum PipelineRobustnessImageBehaviorEXT {
	pipeline_robustness_image_behavior_device_default_ext       = int(0)
	pipeline_robustness_image_behavior_disabled_ext             = int(1)
	pipeline_robustness_image_behavior_robust_image_access_ext  = int(2)
	pipeline_robustness_image_behavior_robust_image_access2_ext = int(3)
	pipeline_robustness_image_behavior_max_enum_ext             = int(0x7FFFFFFF)
}

pub struct PhysicalDevicePipelineRobustnessFeaturesEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_pipeline_robustness_features_ext
	p_next              voidptr
	pipeline_robustness Bool32
}

pub struct PhysicalDevicePipelineRobustnessPropertiesEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_pipeline_robustness_properties_ext
	p_next                             voidptr
	default_robustness_storage_buffers PipelineRobustnessBufferBehaviorEXT
	default_robustness_uniform_buffers PipelineRobustnessBufferBehaviorEXT
	default_robustness_vertex_inputs   PipelineRobustnessBufferBehaviorEXT
	default_robustness_images          PipelineRobustnessImageBehaviorEXT
}

pub struct PipelineRobustnessCreateInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_pipeline_robustness_create_info_ext
	p_next          voidptr
	storage_buffers PipelineRobustnessBufferBehaviorEXT
	uniform_buffers PipelineRobustnessBufferBehaviorEXT
	vertex_inputs   PipelineRobustnessBufferBehaviorEXT
	images          PipelineRobustnessImageBehaviorEXT
}

pub const ext_conditional_rendering_spec_version = 2
pub const ext_conditional_rendering_extension_name = 'VK_EXT_conditional_rendering'

pub enum ConditionalRenderingFlagBitsEXT {
	conditional_rendering_inverted_bit_ext       = int(0x00000001)
	conditional_rendering_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type ConditionalRenderingFlagsEXT = u32

pub struct ConditionalRenderingBeginInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_conditional_rendering_begin_info_ext
	p_next voidptr
	buffer C.Buffer
	offset DeviceSize
	flags  ConditionalRenderingFlagsEXT
}

pub struct PhysicalDeviceConditionalRenderingFeaturesEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_conditional_rendering_features_ext
	p_next                          voidptr
	conditional_rendering           Bool32
	inherited_conditional_rendering Bool32
}

pub struct CommandBufferInheritanceConditionalRenderingInfoEXT {
pub mut:
	s_type                       StructureType = StructureType.structure_type_command_buffer_inheritance_conditional_rendering_info_ext
	p_next                       voidptr
	conditional_rendering_enable Bool32
}

fn C.vkCmdBeginConditionalRenderingEXT(C.CommandBuffer,
	&ConditionalRenderingBeginInfoEXT)
pub fn cmd_begin_conditional_rendering_ext(command_buffer C.CommandBuffer,
	p_conditional_rendering_begin &ConditionalRenderingBeginInfoEXT) {
	C.vkCmdBeginConditionalRenderingEXT(command_buffer, p_conditional_rendering_begin)
}

fn C.vkCmdEndConditionalRenderingEXT(C.CommandBuffer)
pub fn cmd_end_conditional_rendering_ext(command_buffer C.CommandBuffer) {
	C.vkCmdEndConditionalRenderingEXT(command_buffer)
}

pub const nv_clip_space_w_scaling_spec_version = 1
pub const nv_clip_space_w_scaling_extension_name = 'VK_NV_clip_space_w_scaling'

pub struct ViewportWScalingNV {
pub mut:
	xcoeff f32
	ycoeff f32
}

pub struct PipelineViewportWScalingStateCreateInfoNV {
pub mut:
	s_type                    StructureType = StructureType.structure_type_pipeline_viewport_w_scaling_state_create_info_nv
	p_next                    voidptr
	viewport_w_scaling_enable Bool32
	viewport_count            u32
	p_viewport_w_scalings     &ViewportWScalingNV
}

fn C.vkCmdSetViewportWScalingNV(C.CommandBuffer,
	u32,
	u32,
	&ViewportWScalingNV)
pub fn cmd_set_viewport_w_scaling_nv(command_buffer C.CommandBuffer,
	first_viewport u32,
	viewport_count u32,
	p_viewport_w_scalings &ViewportWScalingNV) {
	C.vkCmdSetViewportWScalingNV(command_buffer, first_viewport, viewport_count, p_viewport_w_scalings)
}

pub const ext_direct_mode_display_spec_version = 1
pub const ext_direct_mode_display_extension_name = 'VK_EXT_direct_mode_display'

fn C.vkReleaseDisplayEXT(C.PhysicalDevice,
	C.DisplayKHR) Result
pub fn release_display_ext(physical_device C.PhysicalDevice,
	display C.DisplayKHR) Result {
	return C.vkReleaseDisplayEXT(physical_device, display)
}

pub const ext_display_surface_counter_spec_version = 1
pub const ext_display_surface_counter_extension_name = 'VK_EXT_display_surface_counter'

pub enum SurfaceCounterFlagBitsEXT {
	surface_counter_vblank_bit_ext         = int(0x00000001)
	surface_counter_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type SurfaceCounterFlagsEXT = u32

pub struct SurfaceCapabilities2EXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_surface_capabilities2_ext
	p_next                     voidptr
	min_image_count            u32
	max_image_count            u32
	current_extent             Extent2D
	min_image_extent           Extent2D
	max_image_extent           Extent2D
	max_image_array_layers     u32
	supported_transforms       SurfaceTransformFlagsKHR
	current_transform          SurfaceTransformFlagBitsKHR
	supported_composite_alpha  CompositeAlphaFlagsKHR
	supported_usage_flags      ImageUsageFlags
	supported_surface_counters SurfaceCounterFlagsEXT
}

fn C.vkGetPhysicalDeviceSurfaceCapabilities2EXT(C.PhysicalDevice,
	C.SurfaceKHR,
	&SurfaceCapabilities2EXT) Result
pub fn get_physical_device_surface_capabilities2_ext(physical_device C.PhysicalDevice,
	surface C.SurfaceKHR,
	p_surface_capabilities &SurfaceCapabilities2EXT) Result {
	return C.vkGetPhysicalDeviceSurfaceCapabilities2EXT(physical_device, surface, p_surface_capabilities)
}

pub const ext_display_control_spec_version = 1
pub const ext_display_control_extension_name = 'VK_EXT_display_control'

pub enum DisplayPowerStateEXT {
	display_power_state_off_ext      = int(0)
	display_power_state_suspend_ext  = int(1)
	display_power_state_on_ext       = int(2)
	display_power_state_max_enum_ext = int(0x7FFFFFFF)
}

pub enum DeviceEventTypeEXT {
	device_event_type_display_hotplug_ext = int(0)
	device_event_type_max_enum_ext        = int(0x7FFFFFFF)
}

pub enum DisplayEventTypeEXT {
	display_event_type_first_pixel_out_ext = int(0)
	display_event_type_max_enum_ext        = int(0x7FFFFFFF)
}

pub struct DisplayPowerInfoEXT {
pub mut:
	s_type      StructureType = StructureType.structure_type_display_power_info_ext
	p_next      voidptr
	power_state DisplayPowerStateEXT
}

pub struct DeviceEventInfoEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_device_event_info_ext
	p_next       voidptr
	device_event DeviceEventTypeEXT
}

pub struct DisplayEventInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_display_event_info_ext
	p_next        voidptr
	display_event DisplayEventTypeEXT
}

pub struct SwapchainCounterCreateInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_swapchain_counter_create_info_ext
	p_next           voidptr
	surface_counters SurfaceCounterFlagsEXT
}

fn C.vkDisplayPowerControlEXT(C.Device,
	C.DisplayKHR,
	&DisplayPowerInfoEXT) Result
pub fn display_power_control_ext(device C.Device,
	display C.DisplayKHR,
	p_display_power_info &DisplayPowerInfoEXT) Result {
	return C.vkDisplayPowerControlEXT(device, display, p_display_power_info)
}

fn C.vkRegisterDeviceEventEXT(C.Device,
	&DeviceEventInfoEXT,
	&AllocationCallbacks,
	&C.Fence) Result
pub fn register_device_event_ext(device C.Device,
	p_device_event_info &DeviceEventInfoEXT,
	p_allocator &AllocationCallbacks,
	p_fence &C.Fence) Result {
	return C.vkRegisterDeviceEventEXT(device, p_device_event_info, p_allocator, p_fence)
}

fn C.vkRegisterDisplayEventEXT(C.Device,
	C.DisplayKHR,
	&DisplayEventInfoEXT,
	&AllocationCallbacks,
	&C.Fence) Result
pub fn register_display_event_ext(device C.Device,
	display C.DisplayKHR,
	p_display_event_info &DisplayEventInfoEXT,
	p_allocator &AllocationCallbacks,
	p_fence &C.Fence) Result {
	return C.vkRegisterDisplayEventEXT(device, display, p_display_event_info, p_allocator,
		p_fence)
}

fn C.vkGetSwapchainCounterEXT(C.Device,
	C.SwapchainKHR,
	SurfaceCounterFlagBitsEXT,
	&u64) Result
pub fn get_swapchain_counter_ext(device C.Device,
	swapchain C.SwapchainKHR,
	counter SurfaceCounterFlagBitsEXT,
	p_counter_value &u64) Result {
	return C.vkGetSwapchainCounterEXT(device, swapchain, counter, p_counter_value)
}

pub const google_display_timing_spec_version = 1
pub const google_display_timing_extension_name = 'VK_GOOGE_display_timing'

pub struct RefreshCycleDurationGOOGLE {
pub mut:
	refresh_duration u64
}

pub struct PastPresentationTimingGOOGLE {
pub mut:
	present_id            u32
	desired_present_time  u64
	actual_present_time   u64
	earliest_present_time u64
	present_margin        u64
}

pub struct PresentTimeGOOGLE {
pub mut:
	present_id           u32
	desired_present_time u64
}

pub struct PresentTimesInfoGOOGLE {
pub mut:
	s_type          StructureType = StructureType.structure_type_present_times_info_google
	p_next          voidptr
	swapchain_count u32
	p_times         &PresentTimeGOOGLE
}

fn C.vkGetRefreshCycleDurationGOOGLE(C.Device,
	C.SwapchainKHR,
	&RefreshCycleDurationGOOGLE) Result
pub fn get_refresh_cycle_duration_google(device C.Device,
	swapchain C.SwapchainKHR,
	p_display_timing_properties &RefreshCycleDurationGOOGLE) Result {
	return C.vkGetRefreshCycleDurationGOOGLE(device, swapchain, p_display_timing_properties)
}

fn C.vkGetPastPresentationTimingGOOGLE(C.Device,
	C.SwapchainKHR,
	&u32,
	&PastPresentationTimingGOOGLE) Result
pub fn get_past_presentation_timing_google(device C.Device,
	swapchain C.SwapchainKHR,
	p_presentation_timing_count &u32,
	p_presentation_timings &PastPresentationTimingGOOGLE) Result {
	return C.vkGetPastPresentationTimingGOOGLE(device, swapchain, p_presentation_timing_count,
		p_presentation_timings)
}

pub const nv_sample_mask_override_coverage_spec_version = 1
pub const nv_sample_mask_override_coverage_extension_name = 'VK_NV_sample_mask_override_coverage'

pub const nv_geometry_shader_passthrough_spec_version = 1
pub const nv_geometry_shader_passthrough_extension_name = 'VK_NV_geometry_shader_passthrough'

pub const nv_viewport_array_2_spec_version = 1
pub const nv_viewport_array_2_extension_name = 'VK_NV_viewport_array2'
// VK_NV_VIEWPORT_ARRAY2_SPEC_VERSION is a deprecated alias
pub const nv_viewport_array2_spec_version = nv_viewport_array_2_spec_version
// VK_NV_VIEWPORT_ARRAY2_EXTENSION_NAME is a deprecated alias
pub const nv_viewport_array2_extension_name = nv_viewport_array_2_extension_name

pub const nvx_multiview_per_view_attributes_spec_version = 1
pub const nvx_multiview_per_view_attributes_extension_name = 'VK_NVX_multiview_per_view_attributes'

pub struct PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_multiview_per_view_attributes_properties_nvx
	p_next                           voidptr
	per_view_position_all_components Bool32
}

pub struct MultiviewPerViewAttributesInfoNVX {
pub mut:
	s_type                              StructureType = StructureType.structure_type_multiview_per_view_attributes_info_nvx
	p_next                              voidptr
	per_view_attributes                 Bool32
	per_view_attributes_position_x_only Bool32
}

pub const nv_viewport_swizzle_spec_version = 1
pub const nv_viewport_swizzle_extension_name = 'VK_NV_viewport_swizzle'

pub enum ViewportCoordinateSwizzleNV {
	viewport_coordinate_swizzle_positive_x_nv = int(0)
	viewport_coordinate_swizzle_negative_x_nv = int(1)
	viewport_coordinate_swizzle_positive_y_nv = int(2)
	viewport_coordinate_swizzle_negative_y_nv = int(3)
	viewport_coordinate_swizzle_positive_z_nv = int(4)
	viewport_coordinate_swizzle_negative_z_nv = int(5)
	viewport_coordinate_swizzle_positive_w_nv = int(6)
	viewport_coordinate_swizzle_negative_w_nv = int(7)
	viewport_coordinate_swizzle_max_enum_nv   = int(0x7FFFFFFF)
}

pub type PipelineViewportSwizzleStateCreateFlagsNV = u32

pub struct ViewportSwizzleNV {
pub mut:
	x ViewportCoordinateSwizzleNV
	y ViewportCoordinateSwizzleNV
	z ViewportCoordinateSwizzleNV
	w ViewportCoordinateSwizzleNV
}

pub struct PipelineViewportSwizzleStateCreateInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_viewport_swizzle_state_create_info_nv
	p_next              voidptr
	flags               PipelineViewportSwizzleStateCreateFlagsNV
	viewport_count      u32
	p_viewport_swizzles &ViewportSwizzleNV
}

pub const ext_discard_rectangles_spec_version = 2
pub const ext_discard_rectangles_extension_name = 'VK_EXT_discard_rectangles'

pub enum DiscardRectangleModeEXT {
	discard_rectangle_mode_inclusive_ext = int(0)
	discard_rectangle_mode_exclusive_ext = int(1)
	discard_rectangle_mode_max_enum_ext  = int(0x7FFFFFFF)
}

pub type PipelineDiscardRectangleStateCreateFlagsEXT = u32

pub struct PhysicalDeviceDiscardRectanglePropertiesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_discard_rectangle_properties_ext
	p_next                 voidptr
	max_discard_rectangles u32
}

pub struct PipelineDiscardRectangleStateCreateInfoEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_pipeline_discard_rectangle_state_create_info_ext
	p_next                  voidptr
	flags                   PipelineDiscardRectangleStateCreateFlagsEXT
	discard_rectangle_mode  DiscardRectangleModeEXT
	discard_rectangle_count u32
	p_discard_rectangles    &Rect2D
}

fn C.vkCmdSetDiscardRectangleEXT(C.CommandBuffer,
	u32,
	u32,
	&Rect2D)
pub fn cmd_set_discard_rectangle_ext(command_buffer C.CommandBuffer,
	first_discard_rectangle u32,
	discard_rectangle_count u32,
	p_discard_rectangles &Rect2D) {
	C.vkCmdSetDiscardRectangleEXT(command_buffer, first_discard_rectangle, discard_rectangle_count,
		p_discard_rectangles)
}

fn C.vkCmdSetDiscardRectangleEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_discard_rectangle_enable_ext(command_buffer C.CommandBuffer,
	discard_rectangle_enable Bool32) {
	C.vkCmdSetDiscardRectangleEnableEXT(command_buffer, discard_rectangle_enable)
}

fn C.vkCmdSetDiscardRectangleModeEXT(C.CommandBuffer,
	DiscardRectangleModeEXT)
pub fn cmd_set_discard_rectangle_mode_ext(command_buffer C.CommandBuffer,
	discard_rectangle_mode DiscardRectangleModeEXT) {
	C.vkCmdSetDiscardRectangleModeEXT(command_buffer, discard_rectangle_mode)
}

pub const ext_conservative_rasterization_spec_version = 1
pub const ext_conservative_rasterization_extension_name = 'VK_EXT_conservative_rasterization'

pub enum ConservativeRasterizationModeEXT {
	conservative_rasterization_mode_disabled_ext      = int(0)
	conservative_rasterization_mode_overestimate_ext  = int(1)
	conservative_rasterization_mode_underestimate_ext = int(2)
	conservative_rasterization_mode_max_enum_ext      = int(0x7FFFFFFF)
}

pub type PipelineRasterizationConservativeStateCreateFlagsEXT = u32

pub struct PhysicalDeviceConservativeRasterizationPropertiesEXT {
pub mut:
	s_type                                          StructureType = StructureType.structure_type_physical_device_conservative_rasterization_properties_ext
	p_next                                          voidptr
	primitive_overestimation_size                   f32
	max_extra_primitive_overestimation_size         f32
	extra_primitive_overestimation_size_granularity f32
	primitive_underestimation                       Bool32
	conservative_point_and_line_rasterization       Bool32
	degenerate_triangles_rasterized                 Bool32
	degenerate_lines_rasterized                     Bool32
	fully_covered_fragment_shader_input_variable    Bool32
	conservative_rasterization_post_depth_coverage  Bool32
}

pub struct PipelineRasterizationConservativeStateCreateInfoEXT {
pub mut:
	s_type                              StructureType = StructureType.structure_type_pipeline_rasterization_conservative_state_create_info_ext
	p_next                              voidptr
	flags                               PipelineRasterizationConservativeStateCreateFlagsEXT
	conservative_rasterization_mode     ConservativeRasterizationModeEXT
	extra_primitive_overestimation_size f32
}

pub const ext_depth_clip_enable_spec_version = 1
pub const ext_depth_clip_enable_extension_name = 'VK_EXT_depth_clip_enable'

pub type PipelineRasterizationDepthClipStateCreateFlagsEXT = u32

pub struct PhysicalDeviceDepthClipEnableFeaturesEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_depth_clip_enable_features_ext
	p_next            voidptr
	depth_clip_enable Bool32
}

pub struct PipelineRasterizationDepthClipStateCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_pipeline_rasterization_depth_clip_state_create_info_ext
	p_next            voidptr
	flags             PipelineRasterizationDepthClipStateCreateFlagsEXT
	depth_clip_enable Bool32
}

pub const ext_swapchain_color_space_spec_version = 5
pub const ext_swapchain_color_space_extension_name = 'VK_EXT_swapchain_colorspace'

pub const ext_hdr_metadata_spec_version = 3
pub const ext_hdr_metadata_extension_name = 'VK_EXT_hdr_metadata'

pub struct XYColorEXT {
pub mut:
	x f32
	y f32
}

pub struct HdrMetadataEXT {
pub mut:
	s_type                        StructureType = StructureType.structure_type_hdr_metadata_ext
	p_next                        voidptr
	display_primary_red           XYColorEXT
	display_primary_green         XYColorEXT
	display_primary_blue          XYColorEXT
	white_point                   XYColorEXT
	max_luminance                 f32
	min_luminance                 f32
	max_content_light_level       f32
	max_frame_average_light_level f32
}

fn C.vkSetHdrMetadataEXT(C.Device,
	u32,
	&C.SwapchainKHR,
	&HdrMetadataEXT)
pub fn set_hdr_metadata_ext(device C.Device,
	swapchain_count u32,
	p_swapchains &C.SwapchainKHR,
	p_metadata &HdrMetadataEXT) {
	C.vkSetHdrMetadataEXT(device, swapchain_count, p_swapchains, p_metadata)
}

pub const img_relaxed_line_rasterization_spec_version = 1
pub const img_relaxed_line_rasterization_extension_name = 'VK_IMG_relaxed_line_rasterization'

pub struct PhysicalDeviceRelaxedLineRasterizationFeaturesIMG {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_relaxed_line_rasterization_features_img
	p_next                     voidptr
	relaxed_line_rasterization Bool32
}

pub const ext_external_memory_dma_buf_spec_version = 1
pub const ext_external_memory_dma_buf_extension_name = 'VK_EXT_external_memory_dma_buf'

pub const ext_queue_family_foreign_spec_version = 1
pub const ext_queue_family_foreign_extension_name = 'VK_EXT_queue_family_foreign'
pub const queue_family_foreign_ext = ~u32(2)

pub type C.DebugUtilsMessengerEXT = voidptr

pub const ext_debug_utils_spec_version = 2
pub const ext_debug_utils_extension_name = 'VK_EXT_debug_utils'

pub type DebugUtilsMessengerCallbackDataFlagsEXT = u32

pub enum DebugUtilsMessageSeverityFlagBitsEXT {
	debug_utils_message_severity_verbose_bit_ext        = int(0x00000001)
	debug_utils_message_severity_info_bit_ext           = int(0x00000010)
	debug_utils_message_severity_warning_bit_ext        = int(0x00000100)
	debug_utils_message_severity_error_bit_ext          = int(0x00001000)
	debug_utils_message_severity_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub enum DebugUtilsMessageTypeFlagBitsEXT {
	debug_utils_message_type_general_bit_ext                = int(0x00000001)
	debug_utils_message_type_validation_bit_ext             = int(0x00000002)
	debug_utils_message_type_performance_bit_ext            = int(0x00000004)
	debug_utils_message_type_device_address_binding_bit_ext = int(0x00000008)
	debug_utils_message_type_flag_bits_max_enum_ext         = int(0x7FFFFFFF)
}

pub type DebugUtilsMessageTypeFlagsEXT = u32
pub type DebugUtilsMessageSeverityFlagsEXT = u32
pub type DebugUtilsMessengerCreateFlagsEXT = u32

pub struct DebugUtilsLabelEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_debug_utils_label_ext
	p_next       voidptr
	p_label_name &char
	color        [4]f32
}

pub struct DebugUtilsObjectNameInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_debug_utils_object_name_info_ext
	p_next        voidptr
	object_type   ObjectType
	object_handle u64
	p_object_name &char
}

pub struct DebugUtilsMessengerCallbackDataEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_debug_utils_messenger_callback_data_ext
	p_next              voidptr
	flags               DebugUtilsMessengerCallbackDataFlagsEXT
	p_message_id_name   &char
	message_id_number   i32
	p_message           &char
	queue_label_count   u32
	p_queue_labels      &DebugUtilsLabelEXT
	cmd_buf_label_count u32
	p_cmd_buf_labels    &DebugUtilsLabelEXT
	object_count        u32
	p_objects           &DebugUtilsObjectNameInfoEXT
}

pub type PFN_vkDebugUtilsMessengerCallbackEXT = fn (messageSeverity DebugUtilsMessageSeverityFlagBitsEXT, messageTypes DebugUtilsMessageTypeFlagsEXT, pCallbackData &DebugUtilsMessengerCallbackDataEXT, pUserData voidptr)

pub struct DebugUtilsMessengerCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_debug_utils_messenger_create_info_ext
	p_next            voidptr
	flags             DebugUtilsMessengerCreateFlagsEXT
	message_severity  DebugUtilsMessageSeverityFlagsEXT
	message_type      DebugUtilsMessageTypeFlagsEXT
	pfn_user_callback PFN_vkDebugUtilsMessengerCallbackEXT = unsafe { nil }
	p_user_data       voidptr
}

pub struct DebugUtilsObjectTagInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_debug_utils_object_tag_info_ext
	p_next        voidptr
	object_type   ObjectType
	object_handle u64
	tag_name      u64
	tag_size      usize
	p_tag         voidptr
}

fn C.vkSetDebugUtilsObjectNameEXT(C.Device,
	&DebugUtilsObjectNameInfoEXT) Result
pub fn set_debug_utils_object_name_ext(device C.Device,
	p_name_info &DebugUtilsObjectNameInfoEXT) Result {
	return C.vkSetDebugUtilsObjectNameEXT(device, p_name_info)
}

fn C.vkSetDebugUtilsObjectTagEXT(C.Device,
	&DebugUtilsObjectTagInfoEXT) Result
pub fn set_debug_utils_object_tag_ext(device C.Device,
	p_tag_info &DebugUtilsObjectTagInfoEXT) Result {
	return C.vkSetDebugUtilsObjectTagEXT(device, p_tag_info)
}

fn C.vkQueueBeginDebugUtilsLabelEXT(C.Queue,
	&DebugUtilsLabelEXT)
pub fn queue_begin_debug_utils_label_ext(queue C.Queue,
	p_label_info &DebugUtilsLabelEXT) {
	C.vkQueueBeginDebugUtilsLabelEXT(queue, p_label_info)
}

fn C.vkQueueEndDebugUtilsLabelEXT(C.Queue)
pub fn queue_end_debug_utils_label_ext(queue C.Queue) {
	C.vkQueueEndDebugUtilsLabelEXT(queue)
}

fn C.vkQueueInsertDebugUtilsLabelEXT(C.Queue,
	&DebugUtilsLabelEXT)
pub fn queue_insert_debug_utils_label_ext(queue C.Queue,
	p_label_info &DebugUtilsLabelEXT) {
	C.vkQueueInsertDebugUtilsLabelEXT(queue, p_label_info)
}

fn C.vkCmdBeginDebugUtilsLabelEXT(C.CommandBuffer,
	&DebugUtilsLabelEXT)
pub fn cmd_begin_debug_utils_label_ext(command_buffer C.CommandBuffer,
	p_label_info &DebugUtilsLabelEXT) {
	C.vkCmdBeginDebugUtilsLabelEXT(command_buffer, p_label_info)
}

fn C.vkCmdEndDebugUtilsLabelEXT(C.CommandBuffer)
pub fn cmd_end_debug_utils_label_ext(command_buffer C.CommandBuffer) {
	C.vkCmdEndDebugUtilsLabelEXT(command_buffer)
}

fn C.vkCmdInsertDebugUtilsLabelEXT(C.CommandBuffer,
	&DebugUtilsLabelEXT)
pub fn cmd_insert_debug_utils_label_ext(command_buffer C.CommandBuffer,
	p_label_info &DebugUtilsLabelEXT) {
	C.vkCmdInsertDebugUtilsLabelEXT(command_buffer, p_label_info)
}

fn C.vkCreateDebugUtilsMessengerEXT(C.Instance,
	&DebugUtilsMessengerCreateInfoEXT,
	&AllocationCallbacks,
	&C.DebugUtilsMessengerEXT) Result
pub fn create_debug_utils_messenger_ext(instance C.Instance,
	p_create_info &DebugUtilsMessengerCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_messenger &C.DebugUtilsMessengerEXT) Result {
	return C.vkCreateDebugUtilsMessengerEXT(instance, p_create_info, p_allocator, p_messenger)
}

fn C.vkDestroyDebugUtilsMessengerEXT(C.Instance,
	C.DebugUtilsMessengerEXT,
	&AllocationCallbacks)
pub fn destroy_debug_utils_messenger_ext(instance C.Instance,
	messenger C.DebugUtilsMessengerEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyDebugUtilsMessengerEXT(instance, messenger, p_allocator)
}

fn C.vkSubmitDebugUtilsMessageEXT(C.Instance,
	DebugUtilsMessageSeverityFlagBitsEXT,
	DebugUtilsMessageTypeFlagsEXT,
	&DebugUtilsMessengerCallbackDataEXT)
pub fn submit_debug_utils_message_ext(instance C.Instance,
	message_severity DebugUtilsMessageSeverityFlagBitsEXT,
	message_types DebugUtilsMessageTypeFlagsEXT,
	p_callback_data &DebugUtilsMessengerCallbackDataEXT) {
	C.vkSubmitDebugUtilsMessageEXT(instance, message_severity, message_types, p_callback_data)
}

pub const ext_sampler_filter_minmax_spec_version = 2
pub const ext_sampler_filter_minmax_extension_name = 'VK_EXT_sampler_filter_minmax'

pub type SamplerReductionModeEXT = SamplerReductionMode

pub type SamplerReductionModeCreateInfoEXT = SamplerReductionModeCreateInfo

pub type PhysicalDeviceSamplerFilterMinmaxPropertiesEXT = PhysicalDeviceSamplerFilterMinmaxProperties

pub const amd_gpu_shader_int16_spec_version = 2
pub const amd_gpu_shader_int16_extension_name = 'VK_AMD_gpu_shader_int16'

pub const amd_mixed_attachment_samples_spec_version = 1
pub const amd_mixed_attachment_samples_extension_name = 'VK_AMD_mixed_attachment_samples'

pub struct AttachmentSampleCountInfoAMD {
pub mut:
	s_type                           StructureType = StructureType.structure_type_attachment_sample_count_info_amd
	p_next                           voidptr
	color_attachment_count           u32
	p_color_attachment_samples       &SampleCountFlagBits
	depth_stencil_attachment_samples SampleCountFlagBits
}

pub const amd_shader_fragment_mask_spec_version = 1
pub const amd_shader_fragment_mask_extension_name = 'VK_AMD_shader_fragment_mask'

pub const ext_inline_uniform_block_spec_version = 1
pub const ext_inline_uniform_block_extension_name = 'VK_EXT_inline_uniform_block'

pub type PhysicalDeviceInlineUniformBlockFeaturesEXT = PhysicalDeviceInlineUniformBlockFeatures

pub type PhysicalDeviceInlineUniformBlockPropertiesEXT = PhysicalDeviceInlineUniformBlockProperties

pub type WriteDescriptorSetInlineUniformBlockEXT = WriteDescriptorSetInlineUniformBlock

pub type DescriptorPoolInlineUniformBlockCreateInfoEXT = DescriptorPoolInlineUniformBlockCreateInfo

pub const ext_shader_stencil_export_spec_version = 1
pub const ext_shader_stencil_export_extension_name = 'VK_EXT_shader_stencil_export'

pub const ext_sample_locations_spec_version = 1
pub const ext_sample_locations_extension_name = 'VK_EXT_sample_locations'

pub struct SampleLocationEXT {
pub mut:
	x f32
	y f32
}

pub struct SampleLocationsInfoEXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_sample_locations_info_ext
	p_next                     voidptr
	sample_locations_per_pixel SampleCountFlagBits
	sample_location_grid_size  Extent2D
	sample_locations_count     u32
	p_sample_locations         &SampleLocationEXT
}

pub struct AttachmentSampleLocationsEXT {
pub mut:
	attachment_index      u32
	sample_locations_info SampleLocationsInfoEXT
}

pub struct SubpassSampleLocationsEXT {
pub mut:
	subpass_index         u32
	sample_locations_info SampleLocationsInfoEXT
}

pub struct RenderPassSampleLocationsBeginInfoEXT {
pub mut:
	s_type                                    StructureType = StructureType.structure_type_render_pass_sample_locations_begin_info_ext
	p_next                                    voidptr
	attachment_initial_sample_locations_count u32
	p_attachment_initial_sample_locations     &AttachmentSampleLocationsEXT
	post_subpass_sample_locations_count       u32
	p_post_subpass_sample_locations           &SubpassSampleLocationsEXT
}

pub struct PipelineSampleLocationsStateCreateInfoEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_pipeline_sample_locations_state_create_info_ext
	p_next                  voidptr
	sample_locations_enable Bool32
	sample_locations_info   SampleLocationsInfoEXT
}

pub struct PhysicalDeviceSampleLocationsPropertiesEXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_sample_locations_properties_ext
	p_next                           voidptr
	sample_location_sample_counts    SampleCountFlags
	max_sample_location_grid_size    Extent2D
	sample_location_coordinate_range [2]f32
	sample_location_sub_pixel_bits   u32
	variable_sample_locations        Bool32
}

pub struct MultisamplePropertiesEXT {
pub mut:
	s_type                        StructureType = StructureType.structure_type_multisample_properties_ext
	p_next                        voidptr
	max_sample_location_grid_size Extent2D
}

fn C.vkCmdSetSampleLocationsEXT(C.CommandBuffer,
	&SampleLocationsInfoEXT)
pub fn cmd_set_sample_locations_ext(command_buffer C.CommandBuffer,
	p_sample_locations_info &SampleLocationsInfoEXT) {
	C.vkCmdSetSampleLocationsEXT(command_buffer, p_sample_locations_info)
}

fn C.vkGetPhysicalDeviceMultisamplePropertiesEXT(C.PhysicalDevice,
	SampleCountFlagBits,
	&MultisamplePropertiesEXT)
pub fn get_physical_device_multisample_properties_ext(physical_device C.PhysicalDevice,
	samples SampleCountFlagBits,
	p_multisample_properties &MultisamplePropertiesEXT) {
	C.vkGetPhysicalDeviceMultisamplePropertiesEXT(physical_device, samples, p_multisample_properties)
}

pub const ext_blend_operation_advanced_spec_version = 2
pub const ext_blend_operation_advanced_extension_name = 'VK_EXT_blend_operation_advanced'

pub enum BlendOverlapEXT {
	blend_overlap_uncorrelated_ext = int(0)
	blend_overlap_disjoint_ext     = int(1)
	blend_overlap_conjoint_ext     = int(2)
	blend_overlap_max_enum_ext     = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceBlendOperationAdvancedFeaturesEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_blend_operation_advanced_features_ext
	p_next                             voidptr
	advanced_blend_coherent_operations Bool32
}

pub struct PhysicalDeviceBlendOperationAdvancedPropertiesEXT {
pub mut:
	s_type                                     StructureType = StructureType.structure_type_physical_device_blend_operation_advanced_properties_ext
	p_next                                     voidptr
	advanced_blend_max_color_attachments       u32
	advanced_blend_independent_blend           Bool32
	advanced_blend_non_premultiplied_src_color Bool32
	advanced_blend_non_premultiplied_dst_color Bool32
	advanced_blend_correlated_overlap          Bool32
	advanced_blend_all_operations              Bool32
}

pub struct PipelineColorBlendAdvancedStateCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_pipeline_color_blend_advanced_state_create_info_ext
	p_next            voidptr
	src_premultiplied Bool32
	dst_premultiplied Bool32
	blend_overlap     BlendOverlapEXT
}

pub const nv_fragment_coverage_to_color_spec_version = 1
pub const nv_fragment_coverage_to_color_extension_name = 'VK_NV_fragment_coverage_to_color'

pub type PipelineCoverageToColorStateCreateFlagsNV = u32

pub struct PipelineCoverageToColorStateCreateInfoNV {
pub mut:
	s_type                     StructureType = StructureType.structure_type_pipeline_coverage_to_color_state_create_info_nv
	p_next                     voidptr
	flags                      PipelineCoverageToColorStateCreateFlagsNV
	coverage_to_color_enable   Bool32
	coverage_to_color_location u32
}

pub const nv_framebuffer_mixed_samples_spec_version = 1
pub const nv_framebuffer_mixed_samples_extension_name = 'VK_NV_framebuffer_mixed_samples'

pub enum CoverageModulationModeNV {
	coverage_modulation_mode_none_nv     = int(0)
	coverage_modulation_mode_rgb_nv      = int(1)
	coverage_modulation_mode_alpha_nv    = int(2)
	coverage_modulation_mode_rgba_nv     = int(3)
	coverage_modulation_mode_max_enum_nv = int(0x7FFFFFFF)
}

pub type PipelineCoverageModulationStateCreateFlagsNV = u32

pub struct PipelineCoverageModulationStateCreateInfoNV {
pub mut:
	s_type                           StructureType = StructureType.structure_type_pipeline_coverage_modulation_state_create_info_nv
	p_next                           voidptr
	flags                            PipelineCoverageModulationStateCreateFlagsNV
	coverage_modulation_mode         CoverageModulationModeNV
	coverage_modulation_table_enable Bool32
	coverage_modulation_table_count  u32
	p_coverage_modulation_table      &f32
}

pub type AttachmentSampleCountInfoNV = AttachmentSampleCountInfoAMD

pub const nv_fill_rectangle_spec_version = 1
pub const nv_fill_rectangle_extension_name = 'VK_NV_fill_rectangle'

pub const nv_shader_sm_builtins_spec_version = 1
pub const nv_shader_sm_builtins_extension_name = 'VK_NV_shader_sm_builtins'

pub struct PhysicalDeviceShaderSMBuiltinsPropertiesNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_shader_sm_builtins_properties_nv
	p_next              voidptr
	shader_sm_count     u32
	shader_warps_per_sm u32
}

pub struct PhysicalDeviceShaderSMBuiltinsFeaturesNV {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_shader_sm_builtins_features_nv
	p_next             voidptr
	shader_sm_builtins Bool32
}

pub const ext_post_depth_coverage_spec_version = 1
pub const ext_post_depth_coverage_extension_name = 'VK_EXT_post_depth_coverage'

pub const ext_image_drm_format_modifier_spec_version = 2
pub const ext_image_drm_format_modifier_extension_name = 'VK_EXT_image_drm_format_modifier'

pub struct DrmFormatModifierPropertiesEXT {
pub mut:
	drm_format_modifier                 u64
	drm_format_modifier_plane_count     u32
	drm_format_modifier_tiling_features FormatFeatureFlags
}

pub struct DrmFormatModifierPropertiesListEXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_drm_format_modifier_properties_list_ext
	p_next                           voidptr
	drm_format_modifier_count        u32
	p_drm_format_modifier_properties &DrmFormatModifierPropertiesEXT
}

pub struct PhysicalDeviceImageDrmFormatModifierInfoEXT {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_image_drm_format_modifier_info_ext
	p_next                   voidptr
	drm_format_modifier      u64
	sharing_mode             SharingMode
	queue_family_index_count u32
	p_queue_family_indices   &u32
}

pub struct ImageDrmFormatModifierListCreateInfoEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_image_drm_format_modifier_list_create_info_ext
	p_next                    voidptr
	drm_format_modifier_count u32
	p_drm_format_modifiers    &u64
}

pub struct ImageDrmFormatModifierExplicitCreateInfoEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_image_drm_format_modifier_explicit_create_info_ext
	p_next                          voidptr
	drm_format_modifier             u64
	drm_format_modifier_plane_count u32
	p_plane_layouts                 &SubresourceLayout
}

pub struct ImageDrmFormatModifierPropertiesEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_image_drm_format_modifier_properties_ext
	p_next              voidptr
	drm_format_modifier u64
}

pub struct DrmFormatModifierProperties2EXT {
pub mut:
	drm_format_modifier                 u64
	drm_format_modifier_plane_count     u32
	drm_format_modifier_tiling_features FormatFeatureFlags2
}

pub struct DrmFormatModifierPropertiesList2EXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_drm_format_modifier_properties_list2_ext
	p_next                           voidptr
	drm_format_modifier_count        u32
	p_drm_format_modifier_properties &DrmFormatModifierProperties2EXT
}

fn C.vkGetImageDrmFormatModifierPropertiesEXT(C.Device,
	C.Image,
	&ImageDrmFormatModifierPropertiesEXT) Result
pub fn get_image_drm_format_modifier_properties_ext(device C.Device,
	image C.Image,
	p_properties &ImageDrmFormatModifierPropertiesEXT) Result {
	return C.vkGetImageDrmFormatModifierPropertiesEXT(device, image, p_properties)
}

pub type C.ValidationCacheEXT = voidptr

pub const ext_validation_cache_spec_version = 1
pub const ext_validation_cache_extension_name = 'VK_EXT_validation_cache'

pub enum ValidationCacheHeaderVersionEXT {
	validation_cache_header_version_one_ext      = int(1)
	validation_cache_header_version_max_enum_ext = int(0x7FFFFFFF)
}

pub type ValidationCacheCreateFlagsEXT = u32

pub struct ValidationCacheCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_validation_cache_create_info_ext
	p_next            voidptr
	flags             ValidationCacheCreateFlagsEXT
	initial_data_size usize
	p_initial_data    voidptr
}

pub struct ShaderModuleValidationCacheCreateInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_shader_module_validation_cache_create_info_ext
	p_next           voidptr
	validation_cache C.ValidationCacheEXT
}

fn C.vkCreateValidationCacheEXT(C.Device,
	&ValidationCacheCreateInfoEXT,
	&AllocationCallbacks,
	&C.ValidationCacheEXT) Result
pub fn create_validation_cache_ext(device C.Device,
	p_create_info &ValidationCacheCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_validation_cache &C.ValidationCacheEXT) Result {
	return C.vkCreateValidationCacheEXT(device, p_create_info, p_allocator, p_validation_cache)
}

fn C.vkDestroyValidationCacheEXT(C.Device,
	C.ValidationCacheEXT,
	&AllocationCallbacks)
pub fn destroy_validation_cache_ext(device C.Device,
	validation_cache C.ValidationCacheEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyValidationCacheEXT(device, validation_cache, p_allocator)
}

fn C.vkMergeValidationCachesEXT(C.Device,
	C.ValidationCacheEXT,
	u32,
	&C.ValidationCacheEXT) Result
pub fn merge_validation_caches_ext(device C.Device,
	dst_cache C.ValidationCacheEXT,
	src_cache_count u32,
	p_src_caches &C.ValidationCacheEXT) Result {
	return C.vkMergeValidationCachesEXT(device, dst_cache, src_cache_count, p_src_caches)
}

fn C.vkGetValidationCacheDataEXT(C.Device,
	C.ValidationCacheEXT,
	&usize,
	voidptr) Result
pub fn get_validation_cache_data_ext(device C.Device,
	validation_cache C.ValidationCacheEXT,
	p_data_size &usize,
	p_data voidptr) Result {
	return C.vkGetValidationCacheDataEXT(device, validation_cache, p_data_size, p_data)
}

pub const ext_descriptor_indexing_spec_version = 2
pub const ext_descriptor_indexing_extension_name = 'VK_EXT_descriptor_indexing'

pub type DescriptorBindingFlagBitsEXT = DescriptorBindingFlagBits

pub type DescriptorBindingFlagsEXT = u32
pub type DescriptorSetLayoutBindingFlagsCreateInfoEXT = DescriptorSetLayoutBindingFlagsCreateInfo

pub type PhysicalDeviceDescriptorIndexingFeaturesEXT = PhysicalDeviceDescriptorIndexingFeatures

pub type PhysicalDeviceDescriptorIndexingPropertiesEXT = PhysicalDeviceDescriptorIndexingProperties

pub type DescriptorSetVariableDescriptorCountAllocateInfoEXT = DescriptorSetVariableDescriptorCountAllocateInfo

pub type DescriptorSetVariableDescriptorCountLayoutSupportEXT = DescriptorSetVariableDescriptorCountLayoutSupport

pub const ext_shader_viewport_index_layer_spec_version = 1
pub const ext_shader_viewport_index_layer_extension_name = 'VK_EXT_shader_viewport_index_layer'

pub const nv_shading_rate_image_spec_version = 3
pub const nv_shading_rate_image_extension_name = 'VK_NV_shading_rate_image'

pub enum ShadingRatePaletteEntryNV {
	shading_rate_palette_entry_no_invocations_nv            = int(0)
	shading_rate_palette_entry16_invocations_per_pixel_nv   = int(1)
	shading_rate_palette_entry8_invocations_per_pixel_nv    = int(2)
	shading_rate_palette_entry4_invocations_per_pixel_nv    = int(3)
	shading_rate_palette_entry2_invocations_per_pixel_nv    = int(4)
	shading_rate_palette_entry1_invocation_per_pixel_nv     = int(5)
	shading_rate_palette_entry1_invocation_per2x1_pixels_nv = int(6)
	shading_rate_palette_entry1_invocation_per1x2_pixels_nv = int(7)
	shading_rate_palette_entry1_invocation_per2x2_pixels_nv = int(8)
	shading_rate_palette_entry1_invocation_per4x2_pixels_nv = int(9)
	shading_rate_palette_entry1_invocation_per2x4_pixels_nv = int(10)
	shading_rate_palette_entry1_invocation_per4x4_pixels_nv = int(11)
	shading_rate_palette_entry_max_enum_nv                  = int(0x7FFFFFFF)
}

pub enum CoarseSampleOrderTypeNV {
	coarse_sample_order_type_default_nv      = int(0)
	coarse_sample_order_type_custom_nv       = int(1)
	coarse_sample_order_type_pixel_major_nv  = int(2)
	coarse_sample_order_type_sample_major_nv = int(3)
	coarse_sample_order_type_max_enum_nv     = int(0x7FFFFFFF)
}

pub struct ShadingRatePaletteNV {
pub mut:
	shading_rate_palette_entry_count u32
	p_shading_rate_palette_entries   &ShadingRatePaletteEntryNV
}

pub struct PipelineViewportShadingRateImageStateCreateInfoNV {
pub mut:
	s_type                    StructureType = StructureType.structure_type_pipeline_viewport_shading_rate_image_state_create_info_nv
	p_next                    voidptr
	shading_rate_image_enable Bool32
	viewport_count            u32
	p_shading_rate_palettes   &ShadingRatePaletteNV
}

pub struct PhysicalDeviceShadingRateImageFeaturesNV {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_shading_rate_image_features_nv
	p_next                           voidptr
	shading_rate_image               Bool32
	shading_rate_coarse_sample_order Bool32
}

pub struct PhysicalDeviceShadingRateImagePropertiesNV {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_shading_rate_image_properties_nv
	p_next                          voidptr
	shading_rate_texel_size         Extent2D
	shading_rate_palette_size       u32
	shading_rate_max_coarse_samples u32
}

pub struct CoarseSampleLocationNV {
pub mut:
	pixel_x u32
	pixel_y u32
	sample  u32
}

pub struct CoarseSampleOrderCustomNV {
pub mut:
	shading_rate          ShadingRatePaletteEntryNV
	sample_count          u32
	sample_location_count u32
	p_sample_locations    &CoarseSampleLocationNV
}

pub struct PipelineViewportCoarseSampleOrderStateCreateInfoNV {
pub mut:
	s_type                    StructureType = StructureType.structure_type_pipeline_viewport_coarse_sample_order_state_create_info_nv
	p_next                    voidptr
	sample_order_type         CoarseSampleOrderTypeNV
	custom_sample_order_count u32
	p_custom_sample_orders    &CoarseSampleOrderCustomNV
}

fn C.vkCmdBindShadingRateImageNV(C.CommandBuffer,
	C.ImageView,
	ImageLayout)
pub fn cmd_bind_shading_rate_image_nv(command_buffer C.CommandBuffer,
	image_view C.ImageView,
	image_layout ImageLayout) {
	C.vkCmdBindShadingRateImageNV(command_buffer, image_view, image_layout)
}

fn C.vkCmdSetViewportShadingRatePaletteNV(C.CommandBuffer,
	u32,
	u32,
	&ShadingRatePaletteNV)
pub fn cmd_set_viewport_shading_rate_palette_nv(command_buffer C.CommandBuffer,
	first_viewport u32,
	viewport_count u32,
	p_shading_rate_palettes &ShadingRatePaletteNV) {
	C.vkCmdSetViewportShadingRatePaletteNV(command_buffer, first_viewport, viewport_count,
		p_shading_rate_palettes)
}

fn C.vkCmdSetCoarseSampleOrderNV(C.CommandBuffer,
	CoarseSampleOrderTypeNV,
	u32,
	&CoarseSampleOrderCustomNV)
pub fn cmd_set_coarse_sample_order_nv(command_buffer C.CommandBuffer,
	sample_order_type CoarseSampleOrderTypeNV,
	custom_sample_order_count u32,
	p_custom_sample_orders &CoarseSampleOrderCustomNV) {
	C.vkCmdSetCoarseSampleOrderNV(command_buffer, sample_order_type, custom_sample_order_count,
		p_custom_sample_orders)
}

pub type C.AccelerationStructureNV = voidptr

pub const nv_ray_tracing_spec_version = 3
pub const nv_ray_tracing_extension_name = 'VK_NV_ray_tracing'
pub const shader_unused_khr = ~u32(0)
pub const shader_unused_nv = shader_unused_khr

pub enum RayTracingShaderGroupTypeKHR {
	ray_tracing_shader_group_type_general_khr              = int(0)
	ray_tracing_shader_group_type_triangles_hit_group_khr  = int(1)
	ray_tracing_shader_group_type_procedural_hit_group_khr = int(2)
	ray_tracing_shader_group_type_max_enum_khr             = int(0x7FFFFFFF)
}

pub type RayTracingShaderGroupTypeNV = RayTracingShaderGroupTypeKHR

pub enum GeometryTypeKHR {
	geometry_type_triangles_khr = int(0)
	geometry_type_aabbs_khr     = int(1)
	geometry_type_instances_khr = int(2)
	geometry_type_max_enum_khr  = int(0x7FFFFFFF)
}

pub type GeometryTypeNV = GeometryTypeKHR

pub enum AccelerationStructureTypeKHR {
	acceleration_structure_type_top_level_khr    = int(0)
	acceleration_structure_type_bottom_level_khr = int(1)
	acceleration_structure_type_generic_khr      = int(2)
	acceleration_structure_type_max_enum_khr     = int(0x7FFFFFFF)
}

pub type AccelerationStructureTypeNV = AccelerationStructureTypeKHR

pub enum CopyAccelerationStructureModeKHR {
	copy_acceleration_structure_mode_clone_khr       = int(0)
	copy_acceleration_structure_mode_compact_khr     = int(1)
	copy_acceleration_structure_mode_serialize_khr   = int(2)
	copy_acceleration_structure_mode_deserialize_khr = int(3)
	copy_acceleration_structure_mode_max_enum_khr    = int(0x7FFFFFFF)
}

pub type CopyAccelerationStructureModeNV = CopyAccelerationStructureModeKHR

pub enum AccelerationStructureMemoryRequirementsTypeNV {
	acceleration_structure_memory_requirements_type_object_nv         = int(0)
	acceleration_structure_memory_requirements_type_build_scratch_nv  = int(1)
	acceleration_structure_memory_requirements_type_update_scratch_nv = int(2)
	acceleration_structure_memory_requirements_type_max_enum_nv       = int(0x7FFFFFFF)
}

pub enum GeometryFlagBitsKHR {
	geometry_opaque_bit_khr                          = int(0x00000001)
	geometry_no_duplicate_any_hit_invocation_bit_khr = int(0x00000002)
	geometry_flag_bits_max_enum_khr                  = int(0x7FFFFFFF)
}

pub type GeometryFlagsKHR = u32
pub type GeometryFlagsNV = u32
pub type GeometryFlagBitsNV = GeometryFlagBitsKHR

pub enum GeometryInstanceFlagBitsKHR {
	geometry_instance_triangle_facing_cull_disable_bit_khr = int(0x00000001)
	geometry_instance_triangle_flip_facing_bit_khr         = int(0x00000002)
	geometry_instance_force_opaque_bit_khr                 = int(0x00000004)
	geometry_instance_force_no_opaque_bit_khr              = int(0x00000008)
	geometry_instance_force_opacity_micromap2_state_ext    = int(0x00000010)
	geometry_instance_disable_opacity_micromaps_ext        = int(0x00000020)
	geometry_instance_flag_bits_max_enum_khr               = int(0x7FFFFFFF)
}

pub type GeometryInstanceFlagsKHR = u32
pub type GeometryInstanceFlagsNV = u32
pub type GeometryInstanceFlagBitsNV = GeometryInstanceFlagBitsKHR

pub enum BuildAccelerationStructureFlagBitsKHR {
	build_acceleration_structure_allow_update_bit_khr                   = int(0x00000001)
	build_acceleration_structure_allow_compaction_bit_khr               = int(0x00000002)
	build_acceleration_structure_prefer_fast_trace_bit_khr              = int(0x00000004)
	build_acceleration_structure_prefer_fast_build_bit_khr              = int(0x00000008)
	build_acceleration_structure_low_memory_bit_khr                     = int(0x00000010)
	build_acceleration_structure_motion_bit_nv                          = int(0x00000020)
	build_acceleration_structure_allow_opacity_micromap_update_ext      = int(0x00000040)
	build_acceleration_structure_allow_disable_opacity_micromaps_ext    = int(0x00000080)
	build_acceleration_structure_allow_opacity_micromap_data_update_ext = int(0x00000100)
	build_acceleration_structure_allow_data_access_khr                  = int(0x00000800)
	build_acceleration_structure_flag_bits_max_enum_khr                 = int(0x7FFFFFFF)
}

pub type BuildAccelerationStructureFlagsKHR = u32
pub type BuildAccelerationStructureFlagsNV = u32
pub type BuildAccelerationStructureFlagBitsNV = BuildAccelerationStructureFlagBitsKHR

pub struct RayTracingShaderGroupCreateInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_ray_tracing_shader_group_create_info_nv
	p_next              voidptr
	vktype              RayTracingShaderGroupTypeKHR
	general_shader      u32
	closest_hit_shader  u32
	any_hit_shader      u32
	intersection_shader u32
}

pub struct RayTracingPipelineCreateInfoNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_ray_tracing_pipeline_create_info_nv
	p_next               voidptr
	flags                PipelineCreateFlags
	stage_count          u32
	p_stages             &PipelineShaderStageCreateInfo
	group_count          u32
	p_groups             &RayTracingShaderGroupCreateInfoNV
	max_recursion_depth  u32
	layout               C.PipelineLayout
	base_pipeline_handle C.Pipeline
	base_pipeline_index  i32
}

pub struct GeometryTrianglesNV {
pub mut:
	s_type           StructureType = StructureType.structure_type_geometry_triangles_nv
	p_next           voidptr
	vertex_data      C.Buffer
	vertex_offset    DeviceSize
	vertex_count     u32
	vertex_stride    DeviceSize
	vertex_format    Format
	index_data       C.Buffer
	index_offset     DeviceSize
	index_count      u32
	index_type       IndexType
	transform_data   C.Buffer
	transform_offset DeviceSize
}

pub struct GeometryAABBNV {
pub mut:
	s_type     StructureType
	p_next     voidptr
	aabb_data  C.Buffer
	num_aab_bs u32
	stride     u32
	offset     DeviceSize
}

pub struct GeometryDataNV {
pub mut:
	triangles GeometryTrianglesNV
	aabbs     GeometryAABBNV
}

pub struct GeometryNV {
pub mut:
	s_type        StructureType = StructureType.structure_type_geometry_nv
	p_next        voidptr
	geometry_type GeometryTypeKHR
	geometry      GeometryDataNV
	flags         GeometryFlagsKHR
}

pub struct AccelerationStructureInfoNV {
pub mut:
	s_type         StructureType = StructureType.structure_type_acceleration_structure_info_nv
	p_next         voidptr
	vktype         AccelerationStructureTypeNV
	flags          u32
	instance_count u32
	geometry_count u32
	p_geometries   &GeometryNV
}

pub struct AccelerationStructureCreateInfoNV {
pub mut:
	s_type         StructureType = StructureType.structure_type_acceleration_structure_create_info_nv
	p_next         voidptr
	compacted_size DeviceSize
	info           AccelerationStructureInfoNV
}

pub struct BindAccelerationStructureMemoryInfoNV {
pub mut:
	s_type                 StructureType = StructureType.structure_type_bind_acceleration_structure_memory_info_nv
	p_next                 voidptr
	acceleration_structure C.AccelerationStructureNV
	memory                 C.DeviceMemory
	memory_offset          DeviceSize
	device_index_count     u32
	p_device_indices       &u32
}

pub struct WriteDescriptorSetAccelerationStructureNV {
pub mut:
	s_type                       StructureType = StructureType.structure_type_write_descriptor_set_acceleration_structure_nv
	p_next                       voidptr
	acceleration_structure_count u32
	p_acceleration_structures    &C.AccelerationStructureNV
}

pub struct AccelerationStructureMemoryRequirementsInfoNV {
pub mut:
	s_type                 StructureType = StructureType.structure_type_acceleration_structure_memory_requirements_info_nv
	p_next                 voidptr
	vktype                 AccelerationStructureMemoryRequirementsTypeNV
	acceleration_structure C.AccelerationStructureNV
}

pub struct PhysicalDeviceRayTracingPropertiesNV {
pub mut:
	s_type                                     StructureType = StructureType.structure_type_physical_device_ray_tracing_properties_nv
	p_next                                     voidptr
	shader_group_handle_size                   u32
	max_recursion_depth                        u32
	max_shader_group_stride                    u32
	shader_group_base_alignment                u32
	max_geometry_count                         u64
	max_instance_count                         u64
	max_triangle_count                         u64
	max_descriptor_set_acceleration_structures u32
}

pub struct TransformMatrixKHR {
pub mut:
	matrix [4][3]f32
}

pub type TransformMatrixNV = TransformMatrixKHR

pub struct AabbPositionsKHR {
pub mut:
	min_x f32
	min_y f32
	min_z f32
	max_x f32
	max_y f32
	max_z f32
}

pub type AabbPositionsNV = AabbPositionsKHR

pub struct AccelerationStructureInstanceKHR {
pub mut:
	transform                                   TransformMatrixKHR
	instance_custom_index                       u32
	mask                                        u32
	instance_shader_binding_table_record_offset u32
	flags                                       GeometryInstanceFlagsKHR
	acceleration_structure_reference            u64
}

pub type AccelerationStructureInstanceNV = AccelerationStructureInstanceKHR

fn C.vkCreateAccelerationStructureNV(C.Device,
	&AccelerationStructureCreateInfoNV,
	&AllocationCallbacks,
	&C.AccelerationStructureNV) Result
pub fn create_acceleration_structure_nv(device C.Device,
	p_create_info &AccelerationStructureCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_acceleration_structure &C.AccelerationStructureNV) Result {
	return C.vkCreateAccelerationStructureNV(device, p_create_info, p_allocator, p_acceleration_structure)
}

fn C.vkDestroyAccelerationStructureNV(C.Device,
	C.AccelerationStructureNV,
	&AllocationCallbacks)
pub fn destroy_acceleration_structure_nv(device C.Device,
	acceleration_structure C.AccelerationStructureNV,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyAccelerationStructureNV(device, acceleration_structure, p_allocator)
}

fn C.vkGetAccelerationStructureMemoryRequirementsNV(C.Device,
	&AccelerationStructureMemoryRequirementsInfoNV,
	&MemoryRequirements2KHR)
pub fn get_acceleration_structure_memory_requirements_nv(device C.Device,
	p_info &AccelerationStructureMemoryRequirementsInfoNV,
	p_memory_requirements &MemoryRequirements2KHR) {
	C.vkGetAccelerationStructureMemoryRequirementsNV(device, p_info, p_memory_requirements)
}

fn C.vkBindAccelerationStructureMemoryNV(C.Device,
	u32,
	&BindAccelerationStructureMemoryInfoNV) Result
pub fn bind_acceleration_structure_memory_nv(device C.Device,
	bind_info_count u32,
	p_bind_infos &BindAccelerationStructureMemoryInfoNV) Result {
	return C.vkBindAccelerationStructureMemoryNV(device, bind_info_count, p_bind_infos)
}

fn C.vkCmdBuildAccelerationStructureNV(C.CommandBuffer,
	&AccelerationStructureInfoNV,
	C.Buffer,
	DeviceSize,
	Bool32,
	C.AccelerationStructureNV,
	C.AccelerationStructureNV,
	C.Buffer,
	DeviceSize)
pub fn cmd_build_acceleration_structure_nv(command_buffer C.CommandBuffer,
	p_info &AccelerationStructureInfoNV,
	instance_data C.Buffer,
	instance_offset DeviceSize,
	update Bool32,
	dst C.AccelerationStructureNV,
	src C.AccelerationStructureNV,
	scratch C.Buffer,
	scratch_offset DeviceSize) {
	C.vkCmdBuildAccelerationStructureNV(command_buffer, p_info, instance_data, instance_offset,
		update, dst, src, scratch, scratch_offset)
}

fn C.vkCmdCopyAccelerationStructureNV(C.CommandBuffer,
	C.AccelerationStructureNV,
	C.AccelerationStructureNV,
	CopyAccelerationStructureModeKHR)
pub fn cmd_copy_acceleration_structure_nv(command_buffer C.CommandBuffer,
	dst C.AccelerationStructureNV,
	src C.AccelerationStructureNV,
	mode CopyAccelerationStructureModeKHR) {
	C.vkCmdCopyAccelerationStructureNV(command_buffer, dst, src, mode)
}

fn C.vkCmdTraceRaysNV(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	DeviceSize,
	u32,
	u32,
	u32)
pub fn cmd_trace_rays_nv(command_buffer C.CommandBuffer,
	raygen_shader_binding_table_buffer C.Buffer,
	raygen_shader_binding_offset DeviceSize,
	miss_shader_binding_table_buffer C.Buffer,
	miss_shader_binding_offset DeviceSize,
	miss_shader_binding_stride DeviceSize,
	hit_shader_binding_table_buffer C.Buffer,
	hit_shader_binding_offset DeviceSize,
	hit_shader_binding_stride DeviceSize,
	callable_shader_binding_table_buffer C.Buffer,
	callable_shader_binding_offset DeviceSize,
	callable_shader_binding_stride DeviceSize,
	width u32,
	height u32,
	depth u32) {
	C.vkCmdTraceRaysNV(command_buffer, raygen_shader_binding_table_buffer, raygen_shader_binding_offset,
		miss_shader_binding_table_buffer, miss_shader_binding_offset, miss_shader_binding_stride,
		hit_shader_binding_table_buffer, hit_shader_binding_offset, hit_shader_binding_stride,
		callable_shader_binding_table_buffer, callable_shader_binding_offset, callable_shader_binding_stride,
		width, height, depth)
}

fn C.vkCreateRayTracingPipelinesNV(C.Device,
	C.PipelineCache,
	u32,
	&RayTracingPipelineCreateInfoNV,
	&AllocationCallbacks,
	&C.Pipeline) Result
pub fn create_ray_tracing_pipelines_nv(device C.Device,
	pipeline_cache C.PipelineCache,
	create_info_count u32,
	p_create_infos &RayTracingPipelineCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_pipelines &C.Pipeline) Result {
	return C.vkCreateRayTracingPipelinesNV(device, pipeline_cache, create_info_count,
		p_create_infos, p_allocator, p_pipelines)
}

fn C.vkGetRayTracingShaderGroupHandlesKHR(C.Device,
	C.Pipeline,
	u32,
	u32,
	usize,
	voidptr) Result
pub fn get_ray_tracing_shader_group_handles_khr(device C.Device,
	pipeline C.Pipeline,
	first_group u32,
	group_count u32,
	data_size usize,
	p_data voidptr) Result {
	return C.vkGetRayTracingShaderGroupHandlesKHR(device, pipeline, first_group, group_count,
		data_size, p_data)
}

fn C.vkGetAccelerationStructureHandleNV(C.Device,
	C.AccelerationStructureNV,
	usize,
	voidptr) Result
pub fn get_acceleration_structure_handle_nv(device C.Device,
	acceleration_structure C.AccelerationStructureNV,
	data_size usize,
	p_data voidptr) Result {
	return C.vkGetAccelerationStructureHandleNV(device, acceleration_structure, data_size,
		p_data)
}

fn C.vkCmdWriteAccelerationStructuresPropertiesNV(C.CommandBuffer,
	u32,
	&C.AccelerationStructureNV,
	QueryType,
	C.QueryPool,
	u32)
pub fn cmd_write_acceleration_structures_properties_nv(command_buffer C.CommandBuffer,
	acceleration_structure_count u32,
	p_acceleration_structures &C.AccelerationStructureNV,
	query_type QueryType,
	query_pool C.QueryPool,
	first_query u32) {
	C.vkCmdWriteAccelerationStructuresPropertiesNV(command_buffer, acceleration_structure_count,
		p_acceleration_structures, query_type, query_pool, first_query)
}

fn C.vkCompileDeferredNV(C.Device,
	C.Pipeline,
	u32) Result
pub fn compile_deferred_nv(device C.Device,
	pipeline C.Pipeline,
	shader u32) Result {
	return C.vkCompileDeferredNV(device, pipeline, shader)
}

pub const nv_representative_fragment_test_spec_version = 2
pub const nv_representative_fragment_test_extension_name = 'VK_NV_representative_fragment_test'

pub struct PhysicalDeviceRepresentativeFragmentTestFeaturesNV {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_representative_fragment_test_features_nv
	p_next                       voidptr
	representative_fragment_test Bool32
}

pub struct PipelineRepresentativeFragmentTestStateCreateInfoNV {
pub mut:
	s_type                              StructureType = StructureType.structure_type_pipeline_representative_fragment_test_state_create_info_nv
	p_next                              voidptr
	representative_fragment_test_enable Bool32
}

pub const ext_filter_cubic_spec_version = 3
pub const ext_filter_cubic_extension_name = 'VK_EXT_filter_cubic'

pub struct PhysicalDeviceImageViewImageFormatInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_image_view_image_format_info_ext
	p_next          voidptr
	image_view_type ImageViewType
}

pub struct FilterCubicImageViewImageFormatPropertiesEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_filter_cubic_image_view_image_format_properties_ext
	p_next              voidptr
	filter_cubic        Bool32
	filter_cubic_minmax Bool32
}

pub const qcom_render_pass_shader_resolve_spec_version = 4
pub const qcom_render_pass_shader_resolve_extension_name = 'VK_QCOM_render_pass_shader_resolve'

pub const ext_global_priority_spec_version = 2
pub const ext_global_priority_extension_name = 'VK_EXT_global_priority'

pub type QueueGlobalPriorityEXT = QueueGlobalPriorityKHR

pub type DeviceQueueGlobalPriorityCreateInfoEXT = DeviceQueueGlobalPriorityCreateInfoKHR

pub const ext_external_memory_host_spec_version = 1
pub const ext_external_memory_host_extension_name = 'VK_EXT_external_memory_host'

pub struct ImportMemoryHostPointerInfoEXT {
pub mut:
	s_type         StructureType = StructureType.structure_type_import_memory_host_pointer_info_ext
	p_next         voidptr
	handle_type    ExternalMemoryHandleTypeFlagBits
	p_host_pointer voidptr
}

pub struct MemoryHostPointerPropertiesEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_memory_host_pointer_properties_ext
	p_next           voidptr
	memory_type_bits u32
}

pub struct PhysicalDeviceExternalMemoryHostPropertiesEXT {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_external_memory_host_properties_ext
	p_next                              voidptr
	min_imported_host_pointer_alignment DeviceSize
}

fn C.vkGetMemoryHostPointerPropertiesEXT(C.Device,
	ExternalMemoryHandleTypeFlagBits,
	voidptr,
	&MemoryHostPointerPropertiesEXT) Result
pub fn get_memory_host_pointer_properties_ext(device C.Device,
	handle_type ExternalMemoryHandleTypeFlagBits,
	p_host_pointer voidptr,
	p_memory_host_pointer_properties &MemoryHostPointerPropertiesEXT) Result {
	return C.vkGetMemoryHostPointerPropertiesEXT(device, handle_type, p_host_pointer,
		p_memory_host_pointer_properties)
}

pub const amd_buffer_marker_spec_version = 1
pub const amd_buffer_marker_extension_name = 'VK_AMD_buffer_marker'

fn C.vkCmdWriteBufferMarkerAMD(C.CommandBuffer,
	PipelineStageFlagBits,
	C.Buffer,
	DeviceSize,
	u32)
pub fn cmd_write_buffer_marker_amd(command_buffer C.CommandBuffer,
	pipeline_stage PipelineStageFlagBits,
	dst_buffer C.Buffer,
	dst_offset DeviceSize,
	marker u32) {
	C.vkCmdWriteBufferMarkerAMD(command_buffer, pipeline_stage, dst_buffer, dst_offset,
		marker)
}

fn C.vkCmdWriteBufferMarker2AMD(C.CommandBuffer,
	PipelineStageFlags2,
	C.Buffer,
	DeviceSize,
	u32)
pub fn cmd_write_buffer_marker2_amd(command_buffer C.CommandBuffer,
	stage PipelineStageFlags2,
	dst_buffer C.Buffer,
	dst_offset DeviceSize,
	marker u32) {
	C.vkCmdWriteBufferMarker2AMD(command_buffer, stage, dst_buffer, dst_offset, marker)
}

pub const amd_pipeline_compiler_control_spec_version = 1
pub const amd_pipeline_compiler_control_extension_name = 'VK_AMD_pipeline_compiler_control'

pub enum PipelineCompilerControlFlagBitsAMD {
	pipeline_compiler_control_flag_bits_max_enum_amd = int(0x7FFFFFFF)
}

pub type PipelineCompilerControlFlagsAMD = u32

pub struct PipelineCompilerControlCreateInfoAMD {
pub mut:
	s_type                 StructureType = StructureType.structure_type_pipeline_compiler_control_create_info_amd
	p_next                 voidptr
	compiler_control_flags PipelineCompilerControlFlagsAMD
}

pub const ext_calibrated_timestamps_spec_version = 2
pub const ext_calibrated_timestamps_extension_name = 'VK_EXT_calibrated_timestamps'

pub type TimeDomainEXT = TimeDomainKHR

pub type CalibratedTimestampInfoEXT = CalibratedTimestampInfoKHR

pub const amd_shader_core_properties_spec_version = 2
pub const amd_shader_core_properties_extension_name = 'VK_AMD_shader_core_properties'

pub struct PhysicalDeviceShaderCorePropertiesAMD {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_shader_core_properties_amd
	p_next                         voidptr
	shader_engine_count            u32
	shader_arrays_per_engine_count u32
	compute_units_per_shader_array u32
	simd_per_compute_unit          u32
	wavefronts_per_simd            u32
	wavefront_size                 u32
	sgprs_per_simd                 u32
	min_sgpr_allocation            u32
	max_sgpr_allocation            u32
	sgpr_allocation_granularity    u32
	vgprs_per_simd                 u32
	min_vgpr_allocation            u32
	max_vgpr_allocation            u32
	vgpr_allocation_granularity    u32
}

pub const amd_memory_overallocation_behavior_spec_version = 1
pub const amd_memory_overallocation_behavior_extension_name = 'VK_AMD_memory_overallocation_behavior'

pub enum MemoryOverallocationBehaviorAMD {
	memory_overallocation_behavior_default_amd    = int(0)
	memory_overallocation_behavior_allowed_amd    = int(1)
	memory_overallocation_behavior_disallowed_amd = int(2)
	memory_overallocation_behavior_max_enum_amd   = int(0x7FFFFFFF)
}

pub struct DeviceMemoryOverallocationCreateInfoAMD {
pub mut:
	s_type                  StructureType = StructureType.structure_type_device_memory_overallocation_create_info_amd
	p_next                  voidptr
	overallocation_behavior MemoryOverallocationBehaviorAMD
}

pub const ext_vertex_attribute_divisor_spec_version = 3
pub const ext_vertex_attribute_divisor_extension_name = 'VK_EXT_vertex_attribute_divisor'

pub struct PhysicalDeviceVertexAttributeDivisorPropertiesEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_vertex_attribute_divisor_properties_ext
	p_next                    voidptr
	max_vertex_attrib_divisor u32
}

pub type VertexInputBindingDivisorDescriptionEXT = VertexInputBindingDivisorDescriptionKHR

pub type PipelineVertexInputDivisorStateCreateInfoEXT = PipelineVertexInputDivisorStateCreateInfoKHR

pub type PhysicalDeviceVertexAttributeDivisorFeaturesEXT = PhysicalDeviceVertexAttributeDivisorFeaturesKHR

pub const ext_pipeline_creation_feedback_spec_version = 1
pub const ext_pipeline_creation_feedback_extension_name = 'VK_EXT_pipeline_creation_feedback'

pub type PipelineCreationFeedbackFlagBitsEXT = PipelineCreationFeedbackFlagBits

pub type PipelineCreationFeedbackFlagsEXT = u32
pub type PipelineCreationFeedbackCreateInfoEXT = PipelineCreationFeedbackCreateInfo

pub type PipelineCreationFeedbackEXT = PipelineCreationFeedback

pub const nv_shader_subgroup_partitioned_spec_version = 1
pub const nv_shader_subgroup_partitioned_extension_name = 'VK_NV_shader_subgroup_partitioned'

pub const nv_compute_shader_derivatives_spec_version = 1
pub const nv_compute_shader_derivatives_extension_name = 'VK_NV_compute_shader_derivatives'

pub type PhysicalDeviceComputeShaderDerivativesFeaturesNV = PhysicalDeviceComputeShaderDerivativesFeaturesKHR

pub const nv_mesh_shader_spec_version = 1
pub const nv_mesh_shader_extension_name = 'VK_NV_mesh_shader'

pub struct PhysicalDeviceMeshShaderFeaturesNV {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_mesh_shader_features_nv
	p_next      voidptr
	task_shader Bool32
	mesh_shader Bool32
}

pub struct PhysicalDeviceMeshShaderPropertiesNV {
pub mut:
	s_type                                StructureType = StructureType.structure_type_physical_device_mesh_shader_properties_nv
	p_next                                voidptr
	max_draw_mesh_tasks_count             u32
	max_task_work_group_invocations       u32
	max_task_work_group_size              [3]u32
	max_task_total_memory_size            u32
	max_task_output_count                 u32
	max_mesh_work_group_invocations       u32
	max_mesh_work_group_size              [3]u32
	max_mesh_total_memory_size            u32
	max_mesh_output_vertices              u32
	max_mesh_output_primitives            u32
	max_mesh_multiview_view_count         u32
	mesh_output_per_vertex_granularity    u32
	mesh_output_per_primitive_granularity u32
}

pub struct DrawMeshTasksIndirectCommandNV {
pub mut:
	task_count u32
	first_task u32
}

fn C.vkCmdDrawMeshTasksNV(C.CommandBuffer,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_nv(command_buffer C.CommandBuffer,
	task_count u32,
	first_task u32) {
	C.vkCmdDrawMeshTasksNV(command_buffer, task_count, first_task)
}

fn C.vkCmdDrawMeshTasksIndirectNV(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_indirect_nv(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	draw_count u32,
	stride u32) {
	C.vkCmdDrawMeshTasksIndirectNV(command_buffer, buffer, offset, draw_count, stride)
}

fn C.vkCmdDrawMeshTasksIndirectCountNV(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_indirect_count_nv(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	count_buffer C.Buffer,
	count_buffer_offset DeviceSize,
	max_draw_count u32,
	stride u32) {
	C.vkCmdDrawMeshTasksIndirectCountNV(command_buffer, buffer, offset, count_buffer,
		count_buffer_offset, max_draw_count, stride)
}

pub const nv_fragment_shader_barycentric_spec_version = 1
pub const nv_fragment_shader_barycentric_extension_name = 'VK_NV_fragment_shader_barycentric'

pub type PhysicalDeviceFragmentShaderBarycentricFeaturesNV = PhysicalDeviceFragmentShaderBarycentricFeaturesKHR

pub const nv_shader_image_footprint_spec_version = 2
pub const nv_shader_image_footprint_extension_name = 'VK_NV_shader_image_footprint'

pub struct PhysicalDeviceShaderImageFootprintFeaturesNV {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_shader_image_footprint_features_nv
	p_next          voidptr
	image_footprint Bool32
}

pub const nv_scissor_exclusive_spec_version = 2
pub const nv_scissor_exclusive_extension_name = 'VK_NV_scissor_exclusive'

pub struct PipelineViewportExclusiveScissorStateCreateInfoNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_pipeline_viewport_exclusive_scissor_state_create_info_nv
	p_next                  voidptr
	exclusive_scissor_count u32
	p_exclusive_scissors    &Rect2D
}

pub struct PhysicalDeviceExclusiveScissorFeaturesNV {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_exclusive_scissor_features_nv
	p_next            voidptr
	exclusive_scissor Bool32
}

fn C.vkCmdSetExclusiveScissorEnableNV(C.CommandBuffer,
	u32,
	u32,
	&Bool32)
pub fn cmd_set_exclusive_scissor_enable_nv(command_buffer C.CommandBuffer,
	first_exclusive_scissor u32,
	exclusive_scissor_count u32,
	p_exclusive_scissor_enables &Bool32) {
	C.vkCmdSetExclusiveScissorEnableNV(command_buffer, first_exclusive_scissor, exclusive_scissor_count,
		p_exclusive_scissor_enables)
}

fn C.vkCmdSetExclusiveScissorNV(C.CommandBuffer,
	u32,
	u32,
	&Rect2D)
pub fn cmd_set_exclusive_scissor_nv(command_buffer C.CommandBuffer,
	first_exclusive_scissor u32,
	exclusive_scissor_count u32,
	p_exclusive_scissors &Rect2D) {
	C.vkCmdSetExclusiveScissorNV(command_buffer, first_exclusive_scissor, exclusive_scissor_count,
		p_exclusive_scissors)
}

pub const nv_device_diagnostic_checkpoints_spec_version = 2
pub const nv_device_diagnostic_checkpoints_extension_name = 'VK_NV_device_diagnostic_checkpoints'

pub struct QueueFamilyCheckpointPropertiesNV {
pub mut:
	s_type                          StructureType = StructureType.structure_type_queue_family_checkpoint_properties_nv
	p_next                          voidptr
	checkpoint_execution_stage_mask PipelineStageFlags
}

pub struct CheckpointDataNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_checkpoint_data_nv
	p_next              voidptr
	stage               PipelineStageFlagBits
	p_checkpoint_marker voidptr
}

pub struct QueueFamilyCheckpointProperties2NV {
pub mut:
	s_type                          StructureType = StructureType.structure_type_queue_family_checkpoint_properties2_nv
	p_next                          voidptr
	checkpoint_execution_stage_mask PipelineStageFlags2
}

pub struct CheckpointData2NV {
pub mut:
	s_type              StructureType = StructureType.structure_type_checkpoint_data2_nv
	p_next              voidptr
	stage               PipelineStageFlags2
	p_checkpoint_marker voidptr
}

fn C.vkCmdSetCheckpointNV(C.CommandBuffer,
	voidptr)
pub fn cmd_set_checkpoint_nv(command_buffer C.CommandBuffer,
	p_checkpoint_marker voidptr) {
	C.vkCmdSetCheckpointNV(command_buffer, p_checkpoint_marker)
}

fn C.vkGetQueueCheckpointDataNV(C.Queue,
	&u32,
	&CheckpointDataNV)
pub fn get_queue_checkpoint_data_nv(queue C.Queue,
	p_checkpoint_data_count &u32,
	p_checkpoint_data &CheckpointDataNV) {
	C.vkGetQueueCheckpointDataNV(queue, p_checkpoint_data_count, p_checkpoint_data)
}

fn C.vkGetQueueCheckpointData2NV(C.Queue,
	&u32,
	&CheckpointData2NV)
pub fn get_queue_checkpoint_data2_nv(queue C.Queue,
	p_checkpoint_data_count &u32,
	p_checkpoint_data &CheckpointData2NV) {
	C.vkGetQueueCheckpointData2NV(queue, p_checkpoint_data_count, p_checkpoint_data)
}

pub const intel_shader_integer_functions_2_spec_version = 1
pub const intel_shader_integer_functions_2_extension_name = 'VK_INTE_shader_integer_functions2'

pub struct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_shader_integer_functions2_features_intel
	p_next                    voidptr
	shader_integer_functions2 Bool32
}

pub type C.PerformanceConfigurationINTEL = voidptr

pub const intel_performance_query_spec_version = 2
pub const intel_performance_query_extension_name = 'VK_INTE_performance_query'

pub enum PerformanceConfigurationTypeINTEL {
	performance_configuration_type_command_queue_metrics_discovery_activated_intel = int(0)
	performance_configuration_type_max_enum_intel                                  = int(0x7FFFFFFF)
}

pub enum QueryPoolSamplingModeINTEL {
	query_pool_sampling_mode_manual_intel   = int(0)
	query_pool_sampling_mode_max_enum_intel = int(0x7FFFFFFF)
}

pub enum PerformanceOverrideTypeINTEL {
	performance_override_type_null_hardware_intel    = int(0)
	performance_override_type_flush_gpu_caches_intel = int(1)
	performance_override_type_max_enum_intel         = int(0x7FFFFFFF)
}

pub enum PerformanceParameterTypeINTEL {
	performance_parameter_type_hw_counters_supported_intel    = int(0)
	performance_parameter_type_stream_marker_valid_bits_intel = int(1)
	performance_parameter_type_max_enum_intel                 = int(0x7FFFFFFF)
}

pub enum PerformanceValueTypeINTEL {
	performance_value_type_uint32_intel   = int(0)
	performance_value_type_uint64_intel   = int(1)
	performance_value_type_float_intel    = int(2)
	performance_value_type_bool_intel     = int(3)
	performance_value_type_string_intel   = int(4)
	performance_value_type_max_enum_intel = int(0x7FFFFFFF)
}

pub union PerformanceValueDataINTEL {
pub mut:
	value32      u32
	value64      u64
	value_float  f32
	value_bool   Bool32
	value_string &char
}

pub struct PerformanceValueINTEL {
pub mut:
	vktype PerformanceValueTypeINTEL
	data   PerformanceValueDataINTEL
}

pub struct InitializePerformanceApiInfoINTEL {
pub mut:
	s_type      StructureType = StructureType.structure_type_initialize_performance_api_info_intel
	p_next      voidptr
	p_user_data voidptr
}

pub struct QueryPoolPerformanceQueryCreateInfoINTEL {
pub mut:
	s_type                        StructureType = StructureType.structure_type_query_pool_performance_query_create_info_intel
	p_next                        voidptr
	performance_counters_sampling QueryPoolSamplingModeINTEL
}

pub type QueryPoolCreateInfoINTEL = QueryPoolPerformanceQueryCreateInfoINTEL

pub struct PerformanceMarkerInfoINTEL {
pub mut:
	s_type StructureType = StructureType.structure_type_performance_marker_info_intel
	p_next voidptr
	marker u64
}

pub struct PerformanceStreamMarkerInfoINTEL {
pub mut:
	s_type StructureType = StructureType.structure_type_performance_stream_marker_info_intel
	p_next voidptr
	marker u32
}

pub struct PerformanceOverrideInfoINTEL {
pub mut:
	s_type    StructureType = StructureType.structure_type_performance_override_info_intel
	p_next    voidptr
	vktype    PerformanceOverrideTypeINTEL
	enable    Bool32
	parameter u64
}

pub struct PerformanceConfigurationAcquireInfoINTEL {
pub mut:
	s_type StructureType = StructureType.structure_type_performance_configuration_acquire_info_intel
	p_next voidptr
	vktype PerformanceConfigurationTypeINTEL
}

fn C.vkInitializePerformanceApiINTEL(C.Device,
	&InitializePerformanceApiInfoINTEL) Result
pub fn initialize_performance_api_intel(device C.Device,
	p_initialize_info &InitializePerformanceApiInfoINTEL) Result {
	return C.vkInitializePerformanceApiINTEL(device, p_initialize_info)
}

fn C.vkUninitializePerformanceApiINTEL(C.Device)
pub fn uninitialize_performance_api_intel(device C.Device) {
	C.vkUninitializePerformanceApiINTEL(device)
}

fn C.vkCmdSetPerformanceMarkerINTEL(C.CommandBuffer,
	&PerformanceMarkerInfoINTEL) Result
pub fn cmd_set_performance_marker_intel(command_buffer C.CommandBuffer,
	p_marker_info &PerformanceMarkerInfoINTEL) Result {
	return C.vkCmdSetPerformanceMarkerINTEL(command_buffer, p_marker_info)
}

fn C.vkCmdSetPerformanceStreamMarkerINTEL(C.CommandBuffer,
	&PerformanceStreamMarkerInfoINTEL) Result
pub fn cmd_set_performance_stream_marker_intel(command_buffer C.CommandBuffer,
	p_marker_info &PerformanceStreamMarkerInfoINTEL) Result {
	return C.vkCmdSetPerformanceStreamMarkerINTEL(command_buffer, p_marker_info)
}

fn C.vkCmdSetPerformanceOverrideINTEL(C.CommandBuffer,
	&PerformanceOverrideInfoINTEL) Result
pub fn cmd_set_performance_override_intel(command_buffer C.CommandBuffer,
	p_override_info &PerformanceOverrideInfoINTEL) Result {
	return C.vkCmdSetPerformanceOverrideINTEL(command_buffer, p_override_info)
}

fn C.vkAcquirePerformanceConfigurationINTEL(C.Device,
	&PerformanceConfigurationAcquireInfoINTEL,
	&C.PerformanceConfigurationINTEL) Result
pub fn acquire_performance_configuration_intel(device C.Device,
	p_acquire_info &PerformanceConfigurationAcquireInfoINTEL,
	p_configuration &C.PerformanceConfigurationINTEL) Result {
	return C.vkAcquirePerformanceConfigurationINTEL(device, p_acquire_info, p_configuration)
}

fn C.vkReleasePerformanceConfigurationINTEL(C.Device,
	C.PerformanceConfigurationINTEL) Result
pub fn release_performance_configuration_intel(device C.Device,
	configuration C.PerformanceConfigurationINTEL) Result {
	return C.vkReleasePerformanceConfigurationINTEL(device, configuration)
}

fn C.vkQueueSetPerformanceConfigurationINTEL(C.Queue,
	C.PerformanceConfigurationINTEL) Result
pub fn queue_set_performance_configuration_intel(queue C.Queue,
	configuration C.PerformanceConfigurationINTEL) Result {
	return C.vkQueueSetPerformanceConfigurationINTEL(queue, configuration)
}

fn C.vkGetPerformanceParameterINTEL(C.Device,
	PerformanceParameterTypeINTEL,
	&PerformanceValueINTEL) Result
pub fn get_performance_parameter_intel(device C.Device,
	parameter PerformanceParameterTypeINTEL,
	p_value &PerformanceValueINTEL) Result {
	return C.vkGetPerformanceParameterINTEL(device, parameter, p_value)
}

pub const ext_pci_bus_info_spec_version = 2
pub const ext_pci_bus_info_extension_name = 'VK_EXT_pci_bus_info'

pub struct PhysicalDevicePCIBusInfoPropertiesEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_pci_bus_info_properties_ext
	p_next       voidptr
	pci_domain   u32
	pci_bus      u32
	pci_device   u32
	pci_function u32
}

pub const amd_display_native_hdr_spec_version = 1
pub const amd_display_native_hdr_extension_name = 'VK_AMD_display_native_hdr'

pub struct DisplayNativeHdrSurfaceCapabilitiesAMD {
pub mut:
	s_type                StructureType = StructureType.structure_type_display_native_hdr_surface_capabilities_amd
	p_next                voidptr
	local_dimming_support Bool32
}

pub struct SwapchainDisplayNativeHdrCreateInfoAMD {
pub mut:
	s_type               StructureType = StructureType.structure_type_swapchain_display_native_hdr_create_info_amd
	p_next               voidptr
	local_dimming_enable Bool32
}

fn C.vkSetLocalDimmingAMD(C.Device,
	C.SwapchainKHR,
	Bool32)
pub fn set_local_dimming_amd(device C.Device,
	swap_chain C.SwapchainKHR,
	local_dimming_enable Bool32) {
	C.vkSetLocalDimmingAMD(device, swap_chain, local_dimming_enable)
}

pub const ext_fragment_density_map_spec_version = 2
pub const ext_fragment_density_map_extension_name = 'VK_EXT_fragment_density_map'

pub struct PhysicalDeviceFragmentDensityMapFeaturesEXT {
pub mut:
	s_type                                     StructureType = StructureType.structure_type_physical_device_fragment_density_map_features_ext
	p_next                                     voidptr
	fragment_density_map                       Bool32
	fragment_density_map_dynamic               Bool32
	fragment_density_map_non_subsampled_images Bool32
}

pub struct PhysicalDeviceFragmentDensityMapPropertiesEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_fragment_density_map_properties_ext
	p_next                          voidptr
	min_fragment_density_texel_size Extent2D
	max_fragment_density_texel_size Extent2D
	fragment_density_invocations    Bool32
}

pub struct RenderPassFragmentDensityMapCreateInfoEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_render_pass_fragment_density_map_create_info_ext
	p_next                          voidptr
	fragment_density_map_attachment AttachmentReference
}

pub struct RenderingFragmentDensityMapAttachmentInfoEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_rendering_fragment_density_map_attachment_info_ext
	p_next       voidptr
	image_view   C.ImageView
	image_layout ImageLayout
}

pub const ext_scalar_block_layout_spec_version = 1
pub const ext_scalar_block_layout_extension_name = 'VK_EXT_scalar_block_layout'

pub type PhysicalDeviceScalarBlockLayoutFeaturesEXT = PhysicalDeviceScalarBlockLayoutFeatures

pub const google_hlsl_functionality_1_spec_version = 1
pub const google_hlsl_functionality_1_extension_name = 'VK_GOOGE_hlsl_functionality1'
// VK_GOOGLE_HLSL_FUNCTIONALITY1_SPEC_VERSION is a deprecated alias
pub const google_hlsl_functionality1_spec_version = google_hlsl_functionality_1_spec_version
// VK_GOOGLE_HLSL_FUNCTIONALITY1_EXTENSION_NAME is a deprecated alias
pub const google_hlsl_functionality1_extension_name = google_hlsl_functionality_1_extension_name

pub const google_decorate_string_spec_version = 1
pub const google_decorate_string_extension_name = 'VK_GOOGE_decorate_string'

pub const ext_subgroup_size_control_spec_version = 2
pub const ext_subgroup_size_control_extension_name = 'VK_EXT_subgroup_size_control'

pub type PhysicalDeviceSubgroupSizeControlFeaturesEXT = PhysicalDeviceSubgroupSizeControlFeatures

pub type PhysicalDeviceSubgroupSizeControlPropertiesEXT = PhysicalDeviceSubgroupSizeControlProperties

pub type PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo

pub const amd_shader_core_properties_2_spec_version = 1
pub const amd_shader_core_properties_2_extension_name = 'VK_AMD_shader_core_properties2'

pub enum ShaderCorePropertiesFlagBitsAMD {
	shader_core_properties_flag_bits_max_enum_amd = int(0x7FFFFFFF)
}

pub type ShaderCorePropertiesFlagsAMD = u32

pub struct PhysicalDeviceShaderCoreProperties2AMD {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_shader_core_properties2_amd
	p_next                    voidptr
	shader_core_features      ShaderCorePropertiesFlagsAMD
	active_compute_unit_count u32
}

pub const amd_device_coherent_memory_spec_version = 1
pub const amd_device_coherent_memory_extension_name = 'VK_AMD_device_coherent_memory'

pub struct PhysicalDeviceCoherentMemoryFeaturesAMD {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_coherent_memory_features_amd
	p_next                 voidptr
	device_coherent_memory Bool32
}

pub const ext_shader_image_atomic_int64_spec_version = 1
pub const ext_shader_image_atomic_int64_extension_name = 'VK_EXT_shader_image_atomic_int64'

pub struct PhysicalDeviceShaderImageAtomicInt64FeaturesEXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_shader_image_atomic_int64_features_ext
	p_next                     voidptr
	shader_image_int64_atomics Bool32
	sparse_image_int64_atomics Bool32
}

pub const ext_memory_budget_spec_version = 1
pub const ext_memory_budget_extension_name = 'VK_EXT_memory_budget'

pub struct PhysicalDeviceMemoryBudgetPropertiesEXT {
pub mut:
	s_type      StructureType = StructureType.structure_type_physical_device_memory_budget_properties_ext
	p_next      voidptr
	heap_budget [max_memory_heaps]DeviceSize
	heap_usage  [max_memory_heaps]DeviceSize
}

pub const ext_memory_priority_spec_version = 1
pub const ext_memory_priority_extension_name = 'VK_EXT_memory_priority'

pub struct PhysicalDeviceMemoryPriorityFeaturesEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_memory_priority_features_ext
	p_next          voidptr
	memory_priority Bool32
}

pub struct MemoryPriorityAllocateInfoEXT {
pub mut:
	s_type   StructureType = StructureType.structure_type_memory_priority_allocate_info_ext
	p_next   voidptr
	priority f32
}

pub const nv_dedicated_allocation_image_aliasing_spec_version = 1
pub const nv_dedicated_allocation_image_aliasing_extension_name = 'VK_NV_dedicated_allocation_image_aliasing'

pub struct PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_dedicated_allocation_image_aliasing_features_nv
	p_next                              voidptr
	dedicated_allocation_image_aliasing Bool32
}

pub const ext_buffer_device_address_spec_version = 2
pub const ext_buffer_device_address_extension_name = 'VK_EXT_buffer_device_address'

pub struct PhysicalDeviceBufferDeviceAddressFeaturesEXT {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_buffer_device_address_features_ext
	p_next                               voidptr
	buffer_device_address                Bool32
	buffer_device_address_capture_replay Bool32
	buffer_device_address_multi_device   Bool32
}

pub type PhysicalDeviceBufferAddressFeaturesEXT = PhysicalDeviceBufferDeviceAddressFeaturesEXT

pub type BufferDeviceAddressInfoEXT = BufferDeviceAddressInfo

pub struct BufferDeviceAddressCreateInfoEXT {
pub mut:
	s_type         StructureType = StructureType.structure_type_buffer_device_address_create_info_ext
	p_next         voidptr
	device_address DeviceAddress
}

pub const ext_tooling_info_spec_version = 1
pub const ext_tooling_info_extension_name = 'VK_EXT_tooling_info'

pub type ToolPurposeFlagBitsEXT = ToolPurposeFlagBits

pub type ToolPurposeFlagsEXT = u32
pub type PhysicalDeviceToolPropertiesEXT = PhysicalDeviceToolProperties

pub const ext_separate_stencil_usage_spec_version = 1
pub const ext_separate_stencil_usage_extension_name = 'VK_EXT_separate_stencil_usage'

pub type ImageStencilUsageCreateInfoEXT = ImageStencilUsageCreateInfo

pub const ext_validation_features_spec_version = 6
pub const ext_validation_features_extension_name = 'VK_EXT_validation_features'

pub enum ValidationFeatureEnableEXT {
	validation_feature_enable_gpu_assisted_ext                      = int(0)
	validation_feature_enable_gpu_assisted_reserve_binding_slot_ext = int(1)
	validation_feature_enable_best_practices_ext                    = int(2)
	validation_feature_enable_debug_printf_ext                      = int(3)
	validation_feature_enable_synchronization_validation_ext        = int(4)
	validation_feature_enable_max_enum_ext                          = int(0x7FFFFFFF)
}

pub enum ValidationFeatureDisableEXT {
	validation_feature_disable_all_ext                     = int(0)
	validation_feature_disable_shaders_ext                 = int(1)
	validation_feature_disable_thread_safety_ext           = int(2)
	validation_feature_disable_api_parameters_ext          = int(3)
	validation_feature_disable_object_lifetimes_ext        = int(4)
	validation_feature_disable_core_checks_ext             = int(5)
	validation_feature_disable_unique_handles_ext          = int(6)
	validation_feature_disable_shader_validation_cache_ext = int(7)
	validation_feature_disable_max_enum_ext                = int(0x7FFFFFFF)
}

pub struct ValidationFeaturesEXT {
pub mut:
	s_type                            StructureType = StructureType.structure_type_validation_features_ext
	p_next                            voidptr
	enabled_validation_feature_count  u32
	p_enabled_validation_features     &ValidationFeatureEnableEXT
	disabled_validation_feature_count u32
	p_disabled_validation_features    &ValidationFeatureDisableEXT
}

pub const nv_cooperative_matrix_spec_version = 1
pub const nv_cooperative_matrix_extension_name = 'VK_NV_cooperative_matrix'

pub type ComponentTypeNV = ComponentTypeKHR

pub type ScopeNV = ScopeKHR

pub struct CooperativeMatrixPropertiesNV {
pub mut:
	s_type StructureType = StructureType.structure_type_cooperative_matrix_properties_nv
	p_next voidptr
	m_size u32
	n_size u32
	k_size u32
	a_type ComponentTypeNV
	b_type ComponentTypeNV
	c_type ComponentTypeNV
	d_type ComponentTypeNV
	scope  ScopeNV
}

pub struct PhysicalDeviceCooperativeMatrixFeaturesNV {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_cooperative_matrix_features_nv
	p_next                                  voidptr
	cooperative_matrix                      Bool32
	cooperative_matrix_robust_buffer_access Bool32
}

pub struct PhysicalDeviceCooperativeMatrixPropertiesNV {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_cooperative_matrix_properties_nv
	p_next                              voidptr
	cooperative_matrix_supported_stages ShaderStageFlags
}

fn C.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(C.PhysicalDevice,
	&u32,
	&CooperativeMatrixPropertiesNV) Result
pub fn get_physical_device_cooperative_matrix_properties_nv(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &CooperativeMatrixPropertiesNV) Result {
	return C.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device, p_property_count,
		p_properties)
}

pub const nv_coverage_reduction_mode_spec_version = 1
pub const nv_coverage_reduction_mode_extension_name = 'VK_NV_coverage_reduction_mode'

pub enum CoverageReductionModeNV {
	coverage_reduction_mode_merge_nv    = int(0)
	coverage_reduction_mode_truncate_nv = int(1)
	coverage_reduction_mode_max_enum_nv = int(0x7FFFFFFF)
}

pub type PipelineCoverageReductionStateCreateFlagsNV = u32

pub struct PhysicalDeviceCoverageReductionModeFeaturesNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_coverage_reduction_mode_features_nv
	p_next                  voidptr
	coverage_reduction_mode Bool32
}

pub struct PipelineCoverageReductionStateCreateInfoNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_pipeline_coverage_reduction_state_create_info_nv
	p_next                  voidptr
	flags                   PipelineCoverageReductionStateCreateFlagsNV
	coverage_reduction_mode CoverageReductionModeNV
}

pub struct FramebufferMixedSamplesCombinationNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_framebuffer_mixed_samples_combination_nv
	p_next                  voidptr
	coverage_reduction_mode CoverageReductionModeNV
	rasterization_samples   SampleCountFlagBits
	depth_stencil_samples   SampleCountFlags
	color_samples           SampleCountFlags
}

fn C.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(C.PhysicalDevice,
	&u32,
	&FramebufferMixedSamplesCombinationNV) Result
pub fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(physical_device C.PhysicalDevice,
	p_combination_count &u32,
	p_combinations &FramebufferMixedSamplesCombinationNV) Result {
	return C.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device,
		p_combination_count, p_combinations)
}

pub const ext_fragment_shader_interlock_spec_version = 1
pub const ext_fragment_shader_interlock_extension_name = 'VK_EXT_fragment_shader_interlock'

pub struct PhysicalDeviceFragmentShaderInterlockFeaturesEXT {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_physical_device_fragment_shader_interlock_features_ext
	p_next                                 voidptr
	fragment_shader_sample_interlock       Bool32
	fragment_shader_pixel_interlock        Bool32
	fragment_shader_shading_rate_interlock Bool32
}

pub const ext_ycbcr_image_arrays_spec_version = 1
pub const ext_ycbcr_image_arrays_extension_name = 'VK_EXT_ycbcr_image_arrays'

pub struct PhysicalDeviceYcbcrImageArraysFeaturesEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_ycbcr_image_arrays_features_ext
	p_next             voidptr
	ycbcr_image_arrays Bool32
}

pub const ext_provoking_vertex_spec_version = 1
pub const ext_provoking_vertex_extension_name = 'VK_EXT_provoking_vertex'

pub enum ProvokingVertexModeEXT {
	provoking_vertex_mode_first_vertex_ext = int(0)
	provoking_vertex_mode_last_vertex_ext  = int(1)
	provoking_vertex_mode_max_enum_ext     = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceProvokingVertexFeaturesEXT {
pub mut:
	s_type                                        StructureType = StructureType.structure_type_physical_device_provoking_vertex_features_ext
	p_next                                        voidptr
	provoking_vertex_last                         Bool32
	transform_feedback_preserves_provoking_vertex Bool32
}

pub struct PhysicalDeviceProvokingVertexPropertiesEXT {
pub mut:
	s_type                                                     StructureType = StructureType.structure_type_physical_device_provoking_vertex_properties_ext
	p_next                                                     voidptr
	provoking_vertex_mode_per_pipeline                         Bool32
	transform_feedback_preserves_triangle_fan_provoking_vertex Bool32
}

pub struct PipelineRasterizationProvokingVertexStateCreateInfoEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_pipeline_rasterization_provoking_vertex_state_create_info_ext
	p_next                voidptr
	provoking_vertex_mode ProvokingVertexModeEXT
}

pub const ext_headless_surface_spec_version = 1
pub const ext_headless_surface_extension_name = 'VK_EXT_headless_surface'

pub type HeadlessSurfaceCreateFlagsEXT = u32

pub struct HeadlessSurfaceCreateInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_headless_surface_create_info_ext
	p_next voidptr
	flags  HeadlessSurfaceCreateFlagsEXT
}

fn C.vkCreateHeadlessSurfaceEXT(C.Instance,
	&HeadlessSurfaceCreateInfoEXT,
	&AllocationCallbacks,
	&C.SurfaceKHR) Result
pub fn create_headless_surface_ext(instance C.Instance,
	p_create_info &HeadlessSurfaceCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_surface &C.SurfaceKHR) Result {
	return C.vkCreateHeadlessSurfaceEXT(instance, p_create_info, p_allocator, p_surface)
}

pub const ext_line_rasterization_spec_version = 1
pub const ext_line_rasterization_extension_name = 'VK_EXT_line_rasterization'

pub type LineRasterizationModeEXT = LineRasterizationModeKHR

pub type PhysicalDeviceLineRasterizationFeaturesEXT = PhysicalDeviceLineRasterizationFeaturesKHR

pub type PhysicalDeviceLineRasterizationPropertiesEXT = PhysicalDeviceLineRasterizationPropertiesKHR

pub type PipelineRasterizationLineStateCreateInfoEXT = PipelineRasterizationLineStateCreateInfoKHR

pub const ext_shader_atomic_float_spec_version = 1
pub const ext_shader_atomic_float_extension_name = 'VK_EXT_shader_atomic_float'

pub struct PhysicalDeviceShaderAtomicFloatFeaturesEXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_shader_atomic_float_features_ext
	p_next                           voidptr
	shader_buffer_float32_atomics    Bool32
	shader_buffer_float32_atomic_add Bool32
	shader_buffer_float64_atomics    Bool32
	shader_buffer_float64_atomic_add Bool32
	shader_shared_float32_atomics    Bool32
	shader_shared_float32_atomic_add Bool32
	shader_shared_float64_atomics    Bool32
	shader_shared_float64_atomic_add Bool32
	shader_image_float32_atomics     Bool32
	shader_image_float32_atomic_add  Bool32
	sparse_image_float32_atomics     Bool32
	sparse_image_float32_atomic_add  Bool32
}

pub const ext_host_query_reset_spec_version = 1
pub const ext_host_query_reset_extension_name = 'VK_EXT_host_query_reset'

pub type PhysicalDeviceHostQueryResetFeaturesEXT = PhysicalDeviceHostQueryResetFeatures

pub const ext_index_type_uint8_spec_version = 1
pub const ext_index_type_uint8_extension_name = 'VK_EXT_index_type_uint8'

pub type PhysicalDeviceIndexTypeUint8FeaturesEXT = PhysicalDeviceIndexTypeUint8FeaturesKHR

pub const ext_extended_dynamic_state_spec_version = 1
pub const ext_extended_dynamic_state_extension_name = 'VK_EXT_extended_dynamic_state'

pub struct PhysicalDeviceExtendedDynamicStateFeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_extended_dynamic_state_features_ext
	p_next                 voidptr
	extended_dynamic_state Bool32
}

pub const ext_host_image_copy_spec_version = 1
pub const ext_host_image_copy_extension_name = 'VK_EXT_host_image_copy'

pub enum HostImageCopyFlagBitsEXT {
	host_image_copy_memcpy_ext             = int(0x00000001)
	host_image_copy_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type HostImageCopyFlagsEXT = u32

pub struct PhysicalDeviceHostImageCopyFeaturesEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_host_image_copy_features_ext
	p_next          voidptr
	host_image_copy Bool32
}

pub struct PhysicalDeviceHostImageCopyPropertiesEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_host_image_copy_properties_ext
	p_next                             voidptr
	copy_src_layout_count              u32
	p_copy_src_layouts                 &ImageLayout
	copy_dst_layout_count              u32
	p_copy_dst_layouts                 &ImageLayout
	optimal_tiling_layout_uuid         [uuid_size]u8
	identical_memory_type_requirements Bool32
}

pub struct MemoryToImageCopyEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_memory_to_image_copy_ext
	p_next              voidptr
	p_host_pointer      voidptr
	memory_row_length   u32
	memory_image_height u32
	image_subresource   ImageSubresourceLayers
	image_offset        Offset3D
	image_extent        Extent3D
}

pub struct ImageToMemoryCopyEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_image_to_memory_copy_ext
	p_next              voidptr
	p_host_pointer      voidptr
	memory_row_length   u32
	memory_image_height u32
	image_subresource   ImageSubresourceLayers
	image_offset        Offset3D
	image_extent        Extent3D
}

pub struct CopyMemoryToImageInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_memory_to_image_info_ext
	p_next           voidptr
	flags            HostImageCopyFlagsEXT
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &MemoryToImageCopyEXT
}

pub struct CopyImageToMemoryInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_image_to_memory_info_ext
	p_next           voidptr
	flags            HostImageCopyFlagsEXT
	src_image        C.Image
	src_image_layout ImageLayout
	region_count     u32
	p_regions        &ImageToMemoryCopyEXT
}

pub struct CopyImageToImageInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_copy_image_to_image_info_ext
	p_next           voidptr
	flags            HostImageCopyFlagsEXT
	src_image        C.Image
	src_image_layout ImageLayout
	dst_image        C.Image
	dst_image_layout ImageLayout
	region_count     u32
	p_regions        &ImageCopy2
}

pub struct HostImageLayoutTransitionInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_host_image_layout_transition_info_ext
	p_next            voidptr
	image             C.Image
	old_layout        ImageLayout
	new_layout        ImageLayout
	subresource_range ImageSubresourceRange
}

pub struct SubresourceHostMemcpySizeEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_subresource_host_memcpy_size_ext
	p_next voidptr
	size   DeviceSize
}

pub struct HostImageCopyDevicePerformanceQueryEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_host_image_copy_device_performance_query_ext
	p_next                  voidptr
	optimal_device_access   Bool32
	identical_memory_layout Bool32
}

pub type SubresourceLayout2EXT = SubresourceLayout2KHR

pub type ImageSubresource2EXT = ImageSubresource2KHR

fn C.vkCopyMemoryToImageEXT(C.Device,
	&CopyMemoryToImageInfoEXT) Result
pub fn copy_memory_to_image_ext(device C.Device,
	p_copy_memory_to_image_info &CopyMemoryToImageInfoEXT) Result {
	return C.vkCopyMemoryToImageEXT(device, p_copy_memory_to_image_info)
}

fn C.vkCopyImageToMemoryEXT(C.Device,
	&CopyImageToMemoryInfoEXT) Result
pub fn copy_image_to_memory_ext(device C.Device,
	p_copy_image_to_memory_info &CopyImageToMemoryInfoEXT) Result {
	return C.vkCopyImageToMemoryEXT(device, p_copy_image_to_memory_info)
}

fn C.vkCopyImageToImageEXT(C.Device,
	&CopyImageToImageInfoEXT) Result
pub fn copy_image_to_image_ext(device C.Device,
	p_copy_image_to_image_info &CopyImageToImageInfoEXT) Result {
	return C.vkCopyImageToImageEXT(device, p_copy_image_to_image_info)
}

fn C.vkTransitionImageLayoutEXT(C.Device,
	u32,
	&HostImageLayoutTransitionInfoEXT) Result
pub fn transition_image_layout_ext(device C.Device,
	transition_count u32,
	p_transitions &HostImageLayoutTransitionInfoEXT) Result {
	return C.vkTransitionImageLayoutEXT(device, transition_count, p_transitions)
}

pub const ext_map_memory_placed_spec_version = 1
pub const ext_map_memory_placed_extension_name = 'VK_EXT_map_memory_placed'

pub struct PhysicalDeviceMapMemoryPlacedFeaturesEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_map_memory_placed_features_ext
	p_next                  voidptr
	memory_map_placed       Bool32
	memory_map_range_placed Bool32
	memory_unmap_reserve    Bool32
}

pub struct PhysicalDeviceMapMemoryPlacedPropertiesEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_map_memory_placed_properties_ext
	p_next                          voidptr
	min_placed_memory_map_alignment DeviceSize
}

pub struct MemoryMapPlacedInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_memory_map_placed_info_ext
	p_next           voidptr
	p_placed_address voidptr
}

pub const ext_shader_atomic_float_2_spec_version = 1
pub const ext_shader_atomic_float_2_extension_name = 'VK_EXT_shader_atomic_float2'

pub struct PhysicalDeviceShaderAtomicFloat2FeaturesEXT {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_shader_atomic_float2_features_ext
	p_next                               voidptr
	shader_buffer_float16_atomics        Bool32
	shader_buffer_float16_atomic_add     Bool32
	shader_buffer_float16_atomic_min_max Bool32
	shader_buffer_float32_atomic_min_max Bool32
	shader_buffer_float64_atomic_min_max Bool32
	shader_shared_float16_atomics        Bool32
	shader_shared_float16_atomic_add     Bool32
	shader_shared_float16_atomic_min_max Bool32
	shader_shared_float32_atomic_min_max Bool32
	shader_shared_float64_atomic_min_max Bool32
	shader_image_float32_atomic_min_max  Bool32
	sparse_image_float32_atomic_min_max  Bool32
}

pub const ext_surface_maintenance_1_spec_version = 1
pub const ext_surface_maintenance_1_extension_name = 'VK_EXT_surface_maintenance1'

pub enum PresentScalingFlagBitsEXT {
	present_scaling_one_to_one_bit_ext           = int(0x00000001)
	present_scaling_aspect_ratio_stretch_bit_ext = int(0x00000002)
	present_scaling_stretch_bit_ext              = int(0x00000004)
	present_scaling_flag_bits_max_enum_ext       = int(0x7FFFFFFF)
}

pub type PresentScalingFlagsEXT = u32

pub enum PresentGravityFlagBitsEXT {
	present_gravity_min_bit_ext            = int(0x00000001)
	present_gravity_max_bit_ext            = int(0x00000002)
	present_gravity_centered_bit_ext       = int(0x00000004)
	present_gravity_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type PresentGravityFlagsEXT = u32

pub struct SurfacePresentModeEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_surface_present_mode_ext
	p_next       voidptr
	present_mode PresentModeKHR
}

pub struct SurfacePresentScalingCapabilitiesEXT {
pub mut:
	s_type                      StructureType = StructureType.structure_type_surface_present_scaling_capabilities_ext
	p_next                      voidptr
	supported_present_scaling   PresentScalingFlagsEXT
	supported_present_gravity_x PresentGravityFlagsEXT
	supported_present_gravity_y PresentGravityFlagsEXT
	min_scaled_image_extent     Extent2D
	max_scaled_image_extent     Extent2D
}

pub struct SurfacePresentModeCompatibilityEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_surface_present_mode_compatibility_ext
	p_next             voidptr
	present_mode_count u32
	p_present_modes    &PresentModeKHR
}

pub const ext_swapchain_maintenance_1_spec_version = 1
pub const ext_swapchain_maintenance_1_extension_name = 'VK_EXT_swapchain_maintenance1'

pub struct PhysicalDeviceSwapchainMaintenance1FeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_swapchain_maintenance1_features_ext
	p_next                 voidptr
	swapchain_maintenance1 Bool32
}

pub struct SwapchainPresentFenceInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_swapchain_present_fence_info_ext
	p_next          voidptr
	swapchain_count u32
	p_fences        &C.Fence
}

pub struct SwapchainPresentModesCreateInfoEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_swapchain_present_modes_create_info_ext
	p_next             voidptr
	present_mode_count u32
	p_present_modes    &PresentModeKHR
}

pub struct SwapchainPresentModeInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_swapchain_present_mode_info_ext
	p_next          voidptr
	swapchain_count u32
	p_present_modes &PresentModeKHR
}

pub struct SwapchainPresentScalingCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_swapchain_present_scaling_create_info_ext
	p_next            voidptr
	scaling_behavior  PresentScalingFlagsEXT
	present_gravity_x PresentGravityFlagsEXT
	present_gravity_y PresentGravityFlagsEXT
}

pub struct ReleaseSwapchainImagesInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_release_swapchain_images_info_ext
	p_next            voidptr
	swapchain         C.SwapchainKHR
	image_index_count u32
	p_image_indices   &u32
}

fn C.vkReleaseSwapchainImagesEXT(C.Device,
	&ReleaseSwapchainImagesInfoEXT) Result
pub fn release_swapchain_images_ext(device C.Device,
	p_release_info &ReleaseSwapchainImagesInfoEXT) Result {
	return C.vkReleaseSwapchainImagesEXT(device, p_release_info)
}

pub const ext_shader_demote_to_helper_invocation_spec_version = 1
pub const ext_shader_demote_to_helper_invocation_extension_name = 'VK_EXT_shader_demote_to_helper_invocation'

pub type PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT = PhysicalDeviceShaderDemoteToHelperInvocationFeatures

pub type C.IndirectCommandsLayoutNV = voidptr

pub const nv_device_generated_commands_spec_version = 3
pub const nv_device_generated_commands_extension_name = 'VK_NV_device_generated_commands'

pub enum IndirectCommandsTokenTypeNV {
	indirect_commands_token_type_shader_group_nv    = int(0)
	indirect_commands_token_type_state_flags_nv     = int(1)
	indirect_commands_token_type_index_buffer_nv    = int(2)
	indirect_commands_token_type_vertex_buffer_nv   = int(3)
	indirect_commands_token_type_push_constant_nv   = int(4)
	indirect_commands_token_type_draw_indexed_nv    = int(5)
	indirect_commands_token_type_draw_nv            = int(6)
	indirect_commands_token_type_draw_tasks_nv      = int(7)
	indirect_commands_token_type_draw_mesh_tasks_nv = int(1000328000)
	indirect_commands_token_type_pipeline_nv        = int(1000428003)
	indirect_commands_token_type_dispatch_nv        = int(1000428004)
	indirect_commands_token_type_max_enum_nv        = int(0x7FFFFFFF)
}

pub enum IndirectStateFlagBitsNV {
	indirect_state_flag_frontface_bit_nv = int(0x00000001)
	indirect_state_flag_bits_max_enum_nv = int(0x7FFFFFFF)
}

pub type IndirectStateFlagsNV = u32

pub enum IndirectCommandsLayoutUsageFlagBitsNV {
	indirect_commands_layout_usage_explicit_preprocess_bit_nv = int(0x00000001)
	indirect_commands_layout_usage_indexed_sequences_bit_nv   = int(0x00000002)
	indirect_commands_layout_usage_unordered_sequences_bit_nv = int(0x00000004)
	indirect_commands_layout_usage_flag_bits_max_enum_nv      = int(0x7FFFFFFF)
}

pub type IndirectCommandsLayoutUsageFlagsNV = u32

pub struct PhysicalDeviceDeviceGeneratedCommandsPropertiesNV {
pub mut:
	s_type                                        StructureType = StructureType.structure_type_physical_device_device_generated_commands_properties_nv
	p_next                                        voidptr
	max_graphics_shader_group_count               u32
	max_indirect_sequence_count                   u32
	max_indirect_commands_token_count             u32
	max_indirect_commands_stream_count            u32
	max_indirect_commands_token_offset            u32
	max_indirect_commands_stream_stride           u32
	min_sequences_count_buffer_offset_alignment   u32
	min_sequences_index_buffer_offset_alignment   u32
	min_indirect_commands_buffer_offset_alignment u32
}

pub struct PhysicalDeviceDeviceGeneratedCommandsFeaturesNV {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_device_generated_commands_features_nv
	p_next                    voidptr
	device_generated_commands Bool32
}

pub struct GraphicsShaderGroupCreateInfoNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_graphics_shader_group_create_info_nv
	p_next               voidptr
	stage_count          u32
	p_stages             &PipelineShaderStageCreateInfo
	p_vertex_input_state &PipelineVertexInputStateCreateInfo
	p_tessellation_state &PipelineTessellationStateCreateInfo
}

pub struct GraphicsPipelineShaderGroupsCreateInfoNV {
pub mut:
	s_type         StructureType = StructureType.structure_type_graphics_pipeline_shader_groups_create_info_nv
	p_next         voidptr
	group_count    u32
	p_groups       &GraphicsShaderGroupCreateInfoNV
	pipeline_count u32
	p_pipelines    &C.Pipeline
}

pub struct BindShaderGroupIndirectCommandNV {
pub mut:
	group_index u32
}

pub struct BindIndexBufferIndirectCommandNV {
pub mut:
	buffer_address DeviceAddress
	size           u32
	index_type     IndexType
}

pub struct BindVertexBufferIndirectCommandNV {
pub mut:
	buffer_address DeviceAddress
	size           u32
	stride         u32
}

pub struct SetStateFlagsIndirectCommandNV {
pub mut:
	data u32
}

pub struct IndirectCommandsStreamNV {
pub mut:
	buffer C.Buffer
	offset DeviceSize
}

pub struct IndirectCommandsLayoutTokenNV {
pub mut:
	s_type                          StructureType = StructureType.structure_type_indirect_commands_layout_token_nv
	p_next                          voidptr
	token_type                      IndirectCommandsTokenTypeNV
	stream                          u32
	offset                          u32
	vertex_binding_unit             u32
	vertex_dynamic_stride           Bool32
	pushconstant_pipeline_layout    C.PipelineLayout
	pushconstant_shader_stage_flags ShaderStageFlags
	pushconstant_offset             u32
	pushconstant_size               u32
	indirect_state_flags            IndirectStateFlagsNV
	index_type_count                u32
	p_index_types                   &IndexType
	p_index_type_values             &u32
}

pub struct IndirectCommandsLayoutCreateInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_indirect_commands_layout_create_info_nv
	p_next              voidptr
	flags               IndirectCommandsLayoutUsageFlagsNV
	pipeline_bind_point PipelineBindPoint
	token_count         u32
	p_tokens            &IndirectCommandsLayoutTokenNV
	stream_count        u32
	p_stream_strides    &u32
}

pub struct GeneratedCommandsInfoNV {
pub mut:
	s_type                   StructureType = StructureType.structure_type_generated_commands_info_nv
	p_next                   voidptr
	pipeline_bind_point      PipelineBindPoint
	pipeline                 C.Pipeline
	indirect_commands_layout C.IndirectCommandsLayoutNV
	stream_count             u32
	p_streams                &IndirectCommandsStreamNV
	sequences_count          u32
	preprocess_buffer        C.Buffer
	preprocess_offset        DeviceSize
	preprocess_size          DeviceSize
	sequences_count_buffer   C.Buffer
	sequences_count_offset   DeviceSize
	sequences_index_buffer   C.Buffer
	sequences_index_offset   DeviceSize
}

pub struct GeneratedCommandsMemoryRequirementsInfoNV {
pub mut:
	s_type                   StructureType = StructureType.structure_type_generated_commands_memory_requirements_info_nv
	p_next                   voidptr
	pipeline_bind_point      PipelineBindPoint
	pipeline                 C.Pipeline
	indirect_commands_layout C.IndirectCommandsLayoutNV
	max_sequences_count      u32
}

fn C.vkGetGeneratedCommandsMemoryRequirementsNV(C.Device,
	&GeneratedCommandsMemoryRequirementsInfoNV,
	&MemoryRequirements2)
pub fn get_generated_commands_memory_requirements_nv(device C.Device,
	p_info &GeneratedCommandsMemoryRequirementsInfoNV,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetGeneratedCommandsMemoryRequirementsNV(device, p_info, p_memory_requirements)
}

fn C.vkCmdPreprocessGeneratedCommandsNV(C.CommandBuffer,
	&GeneratedCommandsInfoNV)
pub fn cmd_preprocess_generated_commands_nv(command_buffer C.CommandBuffer,
	p_generated_commands_info &GeneratedCommandsInfoNV) {
	C.vkCmdPreprocessGeneratedCommandsNV(command_buffer, p_generated_commands_info)
}

fn C.vkCmdExecuteGeneratedCommandsNV(C.CommandBuffer,
	Bool32,
	&GeneratedCommandsInfoNV)
pub fn cmd_execute_generated_commands_nv(command_buffer C.CommandBuffer,
	is_preprocessed Bool32,
	p_generated_commands_info &GeneratedCommandsInfoNV) {
	C.vkCmdExecuteGeneratedCommandsNV(command_buffer, is_preprocessed, p_generated_commands_info)
}

fn C.vkCmdBindPipelineShaderGroupNV(C.CommandBuffer,
	PipelineBindPoint,
	C.Pipeline,
	u32)
pub fn cmd_bind_pipeline_shader_group_nv(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	pipeline C.Pipeline,
	group_index u32) {
	C.vkCmdBindPipelineShaderGroupNV(command_buffer, pipeline_bind_point, pipeline, group_index)
}

fn C.vkCreateIndirectCommandsLayoutNV(C.Device,
	&IndirectCommandsLayoutCreateInfoNV,
	&AllocationCallbacks,
	&C.IndirectCommandsLayoutNV) Result
pub fn create_indirect_commands_layout_nv(device C.Device,
	p_create_info &IndirectCommandsLayoutCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_indirect_commands_layout &C.IndirectCommandsLayoutNV) Result {
	return C.vkCreateIndirectCommandsLayoutNV(device, p_create_info, p_allocator, p_indirect_commands_layout)
}

fn C.vkDestroyIndirectCommandsLayoutNV(C.Device,
	C.IndirectCommandsLayoutNV,
	&AllocationCallbacks)
pub fn destroy_indirect_commands_layout_nv(device C.Device,
	indirect_commands_layout C.IndirectCommandsLayoutNV,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyIndirectCommandsLayoutNV(device, indirect_commands_layout, p_allocator)
}

pub const nv_inherited_viewport_scissor_spec_version = 1
pub const nv_inherited_viewport_scissor_extension_name = 'VK_NV_inherited_viewport_scissor'

pub struct PhysicalDeviceInheritedViewportScissorFeaturesNV {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_inherited_viewport_scissor_features_nv
	p_next                        voidptr
	inherited_viewport_scissor2_d Bool32
}

pub struct CommandBufferInheritanceViewportScissorInfoNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_command_buffer_inheritance_viewport_scissor_info_nv
	p_next               voidptr
	viewport_scissor2_d  Bool32
	viewport_depth_count u32
	p_viewport_depths    &Viewport
}

pub const ext_texel_buffer_alignment_spec_version = 1
pub const ext_texel_buffer_alignment_extension_name = 'VK_EXT_texel_buffer_alignment'

pub struct PhysicalDeviceTexelBufferAlignmentFeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_texel_buffer_alignment_features_ext
	p_next                 voidptr
	texel_buffer_alignment Bool32
}

pub type PhysicalDeviceTexelBufferAlignmentPropertiesEXT = PhysicalDeviceTexelBufferAlignmentProperties

pub const qcom_render_pass_transform_spec_version = 4
pub const qcom_render_pass_transform_extension_name = 'VK_QCOM_render_pass_transform'

pub struct RenderPassTransformBeginInfoQCOM {
pub mut:
	s_type    StructureType = StructureType.structure_type_render_pass_transform_begin_info_qcom
	p_next    voidptr
	transform SurfaceTransformFlagBitsKHR
}

pub struct CommandBufferInheritanceRenderPassTransformInfoQCOM {
pub mut:
	s_type      StructureType = StructureType.structure_type_command_buffer_inheritance_render_pass_transform_info_qcom
	p_next      voidptr
	transform   SurfaceTransformFlagBitsKHR
	render_area Rect2D
}

pub const ext_depth_bias_control_spec_version = 1
pub const ext_depth_bias_control_extension_name = 'VK_EXT_depth_bias_control'

pub enum DepthBiasRepresentationEXT {
	depth_bias_representation_least_representable_value_format_ext      = int(0)
	depth_bias_representation_least_representable_value_force_unorm_ext = int(1)
	depth_bias_representation_float_ext                                 = int(2)
	depth_bias_representation_max_enum_ext                              = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceDepthBiasControlFeaturesEXT {
pub mut:
	s_type                                               StructureType = StructureType.structure_type_physical_device_depth_bias_control_features_ext
	p_next                                               voidptr
	depth_bias_control                                   Bool32
	least_representable_value_force_unorm_representation Bool32
	float_representation                                 Bool32
	depth_bias_exact                                     Bool32
}

pub struct DepthBiasInfoEXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_depth_bias_info_ext
	p_next                     voidptr
	depth_bias_constant_factor f32
	depth_bias_clamp           f32
	depth_bias_slope_factor    f32
}

pub struct DepthBiasRepresentationInfoEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_depth_bias_representation_info_ext
	p_next                    voidptr
	depth_bias_representation DepthBiasRepresentationEXT
	depth_bias_exact          Bool32
}

fn C.vkCmdSetDepthBias2EXT(C.CommandBuffer,
	&DepthBiasInfoEXT)
pub fn cmd_set_depth_bias2_ext(command_buffer C.CommandBuffer,
	p_depth_bias_info &DepthBiasInfoEXT) {
	C.vkCmdSetDepthBias2EXT(command_buffer, p_depth_bias_info)
}

pub const ext_device_memory_report_spec_version = 2
pub const ext_device_memory_report_extension_name = 'VK_EXT_device_memory_report'

pub enum DeviceMemoryReportEventTypeEXT {
	device_memory_report_event_type_allocate_ext          = int(0)
	device_memory_report_event_type_free_ext              = int(1)
	device_memory_report_event_type_import_ext            = int(2)
	device_memory_report_event_type_unimport_ext          = int(3)
	device_memory_report_event_type_allocation_failed_ext = int(4)
	device_memory_report_event_type_max_enum_ext          = int(0x7FFFFFFF)
}

pub type DeviceMemoryReportFlagsEXT = u32

pub struct PhysicalDeviceDeviceMemoryReportFeaturesEXT {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_device_memory_report_features_ext
	p_next               voidptr
	device_memory_report Bool32
}

pub struct DeviceMemoryReportCallbackDataEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_device_memory_report_callback_data_ext
	p_next           voidptr
	flags            DeviceMemoryReportFlagsEXT
	vktype           DeviceMemoryReportEventTypeEXT
	memory_object_id u64
	size             DeviceSize
	object_type      ObjectType
	object_handle    u64
	heap_index       u32
}

pub type PFN_vkDeviceMemoryReportCallbackEXT = fn (pCallbackData &DeviceMemoryReportCallbackDataEXT, pUserData voidptr)

pub struct DeviceDeviceMemoryReportCreateInfoEXT {
pub mut:
	s_type            StructureType = StructureType.structure_type_device_device_memory_report_create_info_ext
	p_next            voidptr
	flags             DeviceMemoryReportFlagsEXT
	pfn_user_callback PFN_vkDeviceMemoryReportCallbackEXT = unsafe { nil }
	p_user_data       voidptr
}

pub const ext_acquire_drm_display_spec_version = 1
pub const ext_acquire_drm_display_extension_name = 'VK_EXT_acquire_drm_display'

fn C.vkAcquireDrmDisplayEXT(C.PhysicalDevice,
	i32,
	C.DisplayKHR) Result
pub fn acquire_drm_display_ext(physical_device C.PhysicalDevice,
	drm_fd i32,
	display C.DisplayKHR) Result {
	return C.vkAcquireDrmDisplayEXT(physical_device, drm_fd, display)
}

fn C.vkGetDrmDisplayEXT(C.PhysicalDevice,
	i32,
	u32,
	&C.DisplayKHR) Result
pub fn get_drm_display_ext(physical_device C.PhysicalDevice,
	drm_fd i32,
	connector_id u32,
	display &C.DisplayKHR) Result {
	return C.vkGetDrmDisplayEXT(physical_device, drm_fd, connector_id, display)
}

pub const ext_robustness_2_spec_version = 1
pub const ext_robustness_2_extension_name = 'VK_EXT_robustness2'

pub struct PhysicalDeviceRobustness2FeaturesEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_robustness2_features_ext
	p_next                voidptr
	robust_buffer_access2 Bool32
	robust_image_access2  Bool32
	null_descriptor       Bool32
}

pub struct PhysicalDeviceRobustness2PropertiesEXT {
pub mut:
	s_type                                      StructureType = StructureType.structure_type_physical_device_robustness2_properties_ext
	p_next                                      voidptr
	robust_storage_buffer_access_size_alignment DeviceSize
	robust_uniform_buffer_access_size_alignment DeviceSize
}

pub const ext_custom_border_color_spec_version = 12
pub const ext_custom_border_color_extension_name = 'VK_EXT_custom_border_color'

pub struct SamplerCustomBorderColorCreateInfoEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_sampler_custom_border_color_create_info_ext
	p_next              voidptr
	custom_border_color ClearColorValue
	format              Format
}

pub struct PhysicalDeviceCustomBorderColorPropertiesEXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_custom_border_color_properties_ext
	p_next                           voidptr
	max_custom_border_color_samplers u32
}

pub struct PhysicalDeviceCustomBorderColorFeaturesEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_custom_border_color_features_ext
	p_next                             voidptr
	custom_border_colors               Bool32
	custom_border_color_without_format Bool32
}

pub const google_user_type_spec_version = 1
pub const google_user_type_extension_name = 'VK_GOOGE_user_type'

pub const nv_present_barrier_spec_version = 1
pub const nv_present_barrier_extension_name = 'VK_NV_present_barrier'

pub struct PhysicalDevicePresentBarrierFeaturesNV {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_present_barrier_features_nv
	p_next          voidptr
	present_barrier Bool32
}

pub struct SurfaceCapabilitiesPresentBarrierNV {
pub mut:
	s_type                    StructureType = StructureType.structure_type_surface_capabilities_present_barrier_nv
	p_next                    voidptr
	present_barrier_supported Bool32
}

pub struct SwapchainPresentBarrierCreateInfoNV {
pub mut:
	s_type                 StructureType = StructureType.structure_type_swapchain_present_barrier_create_info_nv
	p_next                 voidptr
	present_barrier_enable Bool32
}

pub type PrivateDataSlotEXT = voidptr

pub const ext_private_data_spec_version = 1
pub const ext_private_data_extension_name = 'VK_EXT_private_data'

pub type PrivateDataSlotCreateFlagsEXT = u32
pub type PhysicalDevicePrivateDataFeaturesEXT = PhysicalDevicePrivateDataFeatures

pub type DevicePrivateDataCreateInfoEXT = DevicePrivateDataCreateInfo

pub type PrivateDataSlotCreateInfoEXT = PrivateDataSlotCreateInfo

pub const ext_pipeline_creation_cache_control_spec_version = 3
pub const ext_pipeline_creation_cache_control_extension_name = 'VK_EXT_pipeline_creation_cache_control'

pub type PhysicalDevicePipelineCreationCacheControlFeaturesEXT = PhysicalDevicePipelineCreationCacheControlFeatures

pub const nv_device_diagnostics_config_spec_version = 2
pub const nv_device_diagnostics_config_extension_name = 'VK_NV_device_diagnostics_config'

pub enum DeviceDiagnosticsConfigFlagBitsNV {
	device_diagnostics_config_enable_shader_debug_info_bit_nv      = int(0x00000001)
	device_diagnostics_config_enable_resource_tracking_bit_nv      = int(0x00000002)
	device_diagnostics_config_enable_automatic_checkpoints_bit_nv  = int(0x00000004)
	device_diagnostics_config_enable_shader_error_reporting_bit_nv = int(0x00000008)
	device_diagnostics_config_flag_bits_max_enum_nv                = int(0x7FFFFFFF)
}

pub type DeviceDiagnosticsConfigFlagsNV = u32

pub struct PhysicalDeviceDiagnosticsConfigFeaturesNV {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_diagnostics_config_features_nv
	p_next             voidptr
	diagnostics_config Bool32
}

pub struct DeviceDiagnosticsConfigCreateInfoNV {
pub mut:
	s_type StructureType = StructureType.structure_type_device_diagnostics_config_create_info_nv
	p_next voidptr
	flags  DeviceDiagnosticsConfigFlagsNV
}

pub const qcom_render_pass_store_ops_spec_version = 2
pub const qcom_render_pass_store_ops_extension_name = 'VK_QCOM_render_pass_store_ops'

pub type C.CudaModuleNV = voidptr
pub type C.CudaFunctionNV = voidptr

pub const nv_cuda_kernel_launch_spec_version = 2
pub const nv_cuda_kernel_launch_extension_name = 'VK_NV_cuda_kernel_launch'

pub struct CudaModuleCreateInfoNV {
pub mut:
	s_type    StructureType = StructureType.structure_type_cuda_module_create_info_nv
	p_next    voidptr
	data_size usize
	p_data    voidptr
}

pub struct CudaFunctionCreateInfoNV {
pub mut:
	s_type   StructureType = StructureType.structure_type_cuda_function_create_info_nv
	p_next   voidptr
	vkmodule C.CudaModuleNV
	p_name   &char
}

pub struct CudaLaunchInfoNV {
pub mut:
	s_type           StructureType = StructureType.structure_type_cuda_launch_info_nv
	p_next           voidptr
	function         C.CudaFunctionNV
	grid_dim_x       u32
	grid_dim_y       u32
	grid_dim_z       u32
	block_dim_x      u32
	block_dim_y      u32
	block_dim_z      u32
	shared_mem_bytes u32
	param_count      usize
	p_params         voidptr
	extra_count      usize
	p_extras         voidptr
}

pub struct PhysicalDeviceCudaKernelLaunchFeaturesNV {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_cuda_kernel_launch_features_nv
	p_next                      voidptr
	cuda_kernel_launch_features Bool32
}

pub struct PhysicalDeviceCudaKernelLaunchPropertiesNV {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_cuda_kernel_launch_properties_nv
	p_next                   voidptr
	compute_capability_minor u32
	compute_capability_major u32
}

fn C.vkCreateCudaModuleNV(C.Device,
	&CudaModuleCreateInfoNV,
	&AllocationCallbacks,
	&C.CudaModuleNV) Result
pub fn create_cuda_module_nv(device C.Device,
	p_create_info &CudaModuleCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_module &C.CudaModuleNV) Result {
	return C.vkCreateCudaModuleNV(device, p_create_info, p_allocator, p_module)
}

fn C.vkGetCudaModuleCacheNV(C.Device,
	C.CudaModuleNV,
	&usize,
	voidptr) Result
pub fn get_cuda_module_cache_nv(device C.Device,
	vkmodule C.CudaModuleNV,
	p_cache_size &usize,
	p_cache_data voidptr) Result {
	return C.vkGetCudaModuleCacheNV(device, vkmodule, p_cache_size, p_cache_data)
}

fn C.vkCreateCudaFunctionNV(C.Device,
	&CudaFunctionCreateInfoNV,
	&AllocationCallbacks,
	&C.CudaFunctionNV) Result
pub fn create_cuda_function_nv(device C.Device,
	p_create_info &CudaFunctionCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_function &C.CudaFunctionNV) Result {
	return C.vkCreateCudaFunctionNV(device, p_create_info, p_allocator, p_function)
}

fn C.vkDestroyCudaModuleNV(C.Device,
	C.CudaModuleNV,
	&AllocationCallbacks)
pub fn destroy_cuda_module_nv(device C.Device,
	vkmodule C.CudaModuleNV,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyCudaModuleNV(device, vkmodule, p_allocator)
}

fn C.vkDestroyCudaFunctionNV(C.Device,
	C.CudaFunctionNV,
	&AllocationCallbacks)
pub fn destroy_cuda_function_nv(device C.Device,
	function C.CudaFunctionNV,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyCudaFunctionNV(device, function, p_allocator)
}

fn C.vkCmdCudaLaunchKernelNV(C.CommandBuffer,
	&CudaLaunchInfoNV)
pub fn cmd_cuda_launch_kernel_nv(command_buffer C.CommandBuffer,
	p_launch_info &CudaLaunchInfoNV) {
	C.vkCmdCudaLaunchKernelNV(command_buffer, p_launch_info)
}

pub const nv_low_latency_spec_version = 1
pub const nv_low_latency_extension_name = 'VK_NV_low_latency'

pub struct QueryLowLatencySupportNV {
pub mut:
	s_type                     StructureType = StructureType.structure_type_query_low_latency_support_nv
	p_next                     voidptr
	p_queried_low_latency_data voidptr
}

pub type C.AccelerationStructureKHR = voidptr

pub const ext_descriptor_buffer_spec_version = 1
pub const ext_descriptor_buffer_extension_name = 'VK_EXT_descriptor_buffer'

pub struct PhysicalDeviceDescriptorBufferPropertiesEXT {
pub mut:
	s_type                                                     StructureType = StructureType.structure_type_physical_device_descriptor_buffer_properties_ext
	p_next                                                     voidptr
	combined_image_sampler_descriptor_single_array             Bool32
	bufferless_push_descriptors                                Bool32
	allow_sampler_image_view_post_submit_creation              Bool32
	descriptor_buffer_offset_alignment                         DeviceSize
	max_descriptor_buffer_bindings                             u32
	max_resource_descriptor_buffer_bindings                    u32
	max_sampler_descriptor_buffer_bindings                     u32
	max_embedded_immutable_sampler_bindings                    u32
	max_embedded_immutable_samplers                            u32
	buffer_capture_replay_descriptor_data_size                 usize
	image_capture_replay_descriptor_data_size                  usize
	image_view_capture_replay_descriptor_data_size             usize
	sampler_capture_replay_descriptor_data_size                usize
	acceleration_structure_capture_replay_descriptor_data_size usize
	sampler_descriptor_size                                    usize
	combined_image_sampler_descriptor_size                     usize
	sampled_image_descriptor_size                              usize
	storage_image_descriptor_size                              usize
	uniform_texel_buffer_descriptor_size                       usize
	robust_uniform_texel_buffer_descriptor_size                usize
	storage_texel_buffer_descriptor_size                       usize
	robust_storage_texel_buffer_descriptor_size                usize
	uniform_buffer_descriptor_size                             usize
	robust_uniform_buffer_descriptor_size                      usize
	storage_buffer_descriptor_size                             usize
	robust_storage_buffer_descriptor_size                      usize
	input_attachment_descriptor_size                           usize
	acceleration_structure_descriptor_size                     usize
	max_sampler_descriptor_buffer_range                        DeviceSize
	max_resource_descriptor_buffer_range                       DeviceSize
	sampler_descriptor_buffer_address_space_size               DeviceSize
	resource_descriptor_buffer_address_space_size              DeviceSize
	descriptor_buffer_address_space_size                       DeviceSize
}

pub struct PhysicalDeviceDescriptorBufferDensityMapPropertiesEXT {
pub mut:
	s_type                                             StructureType = StructureType.structure_type_physical_device_descriptor_buffer_density_map_properties_ext
	p_next                                             voidptr
	combined_image_sampler_density_map_descriptor_size usize
}

pub struct PhysicalDeviceDescriptorBufferFeaturesEXT {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_physical_device_descriptor_buffer_features_ext
	p_next                                 voidptr
	descriptor_buffer                      Bool32
	descriptor_buffer_capture_replay       Bool32
	descriptor_buffer_image_layout_ignored Bool32
	descriptor_buffer_push_descriptors     Bool32
}

pub struct DescriptorAddressInfoEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_descriptor_address_info_ext
	p_next  voidptr
	address DeviceAddress
	range   DeviceSize
	format  Format
}

pub struct DescriptorBufferBindingInfoEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_descriptor_buffer_binding_info_ext
	p_next  voidptr
	address DeviceAddress
	usage   BufferUsageFlags
}

pub struct DescriptorBufferBindingPushDescriptorBufferHandleEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_descriptor_buffer_binding_push_descriptor_buffer_handle_ext
	p_next voidptr
	buffer C.Buffer
}

pub union DescriptorDataEXT {
pub mut:
	p_sampler                &C.Sampler
	p_combined_image_sampler &DescriptorImageInfo
	p_input_attachment_image &DescriptorImageInfo
	p_sampled_image          &DescriptorImageInfo
	p_storage_image          &DescriptorImageInfo
	p_uniform_texel_buffer   &DescriptorAddressInfoEXT
	p_storage_texel_buffer   &DescriptorAddressInfoEXT
	p_uniform_buffer         &DescriptorAddressInfoEXT
	p_storage_buffer         &DescriptorAddressInfoEXT
	acceleration_structure   DeviceAddress
}

pub struct DescriptorGetInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_descriptor_get_info_ext
	p_next voidptr
	vktype DescriptorType
	data   DescriptorDataEXT
}

pub struct BufferCaptureDescriptorDataInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_buffer_capture_descriptor_data_info_ext
	p_next voidptr
	buffer C.Buffer
}

pub struct ImageCaptureDescriptorDataInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_image_capture_descriptor_data_info_ext
	p_next voidptr
	image  C.Image
}

pub struct ImageViewCaptureDescriptorDataInfoEXT {
pub mut:
	s_type     StructureType = StructureType.structure_type_image_view_capture_descriptor_data_info_ext
	p_next     voidptr
	image_view C.ImageView
}

pub struct SamplerCaptureDescriptorDataInfoEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_sampler_capture_descriptor_data_info_ext
	p_next  voidptr
	sampler C.Sampler
}

pub struct OpaqueCaptureDescriptorDataCreateInfoEXT {
pub mut:
	s_type                         StructureType = StructureType.structure_type_opaque_capture_descriptor_data_create_info_ext
	p_next                         voidptr
	opaque_capture_descriptor_data voidptr
}

pub struct AccelerationStructureCaptureDescriptorDataInfoEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_acceleration_structure_capture_descriptor_data_info_ext
	p_next                    voidptr
	acceleration_structure    C.AccelerationStructureKHR
	acceleration_structure_nv C.AccelerationStructureNV
}

fn C.vkGetDescriptorSetLayoutSizeEXT(C.Device,
	C.DescriptorSetLayout,
	&DeviceSize)
pub fn get_descriptor_set_layout_size_ext(device C.Device,
	layout C.DescriptorSetLayout,
	p_layout_size_in_bytes &DeviceSize) {
	C.vkGetDescriptorSetLayoutSizeEXT(device, layout, p_layout_size_in_bytes)
}

fn C.vkGetDescriptorSetLayoutBindingOffsetEXT(C.Device,
	C.DescriptorSetLayout,
	u32,
	&DeviceSize)
pub fn get_descriptor_set_layout_binding_offset_ext(device C.Device,
	layout C.DescriptorSetLayout,
	binding u32,
	p_offset &DeviceSize) {
	C.vkGetDescriptorSetLayoutBindingOffsetEXT(device, layout, binding, p_offset)
}

fn C.vkGetDescriptorEXT(C.Device,
	&DescriptorGetInfoEXT,
	usize,
	voidptr)
pub fn get_descriptor_ext(device C.Device,
	p_descriptor_info &DescriptorGetInfoEXT,
	data_size usize,
	p_descriptor voidptr) {
	C.vkGetDescriptorEXT(device, p_descriptor_info, data_size, p_descriptor)
}

fn C.vkCmdBindDescriptorBuffersEXT(C.CommandBuffer,
	u32,
	&DescriptorBufferBindingInfoEXT)
pub fn cmd_bind_descriptor_buffers_ext(command_buffer C.CommandBuffer,
	buffer_count u32,
	p_binding_infos &DescriptorBufferBindingInfoEXT) {
	C.vkCmdBindDescriptorBuffersEXT(command_buffer, buffer_count, p_binding_infos)
}

fn C.vkCmdSetDescriptorBufferOffsetsEXT(C.CommandBuffer,
	PipelineBindPoint,
	C.PipelineLayout,
	u32,
	u32,
	&u32,
	&DeviceSize)
pub fn cmd_set_descriptor_buffer_offsets_ext(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	layout C.PipelineLayout,
	first_set u32,
	set_count u32,
	p_buffer_indices &u32,
	p_offsets &DeviceSize) {
	C.vkCmdSetDescriptorBufferOffsetsEXT(command_buffer, pipeline_bind_point, layout,
		first_set, set_count, p_buffer_indices, p_offsets)
}

fn C.vkCmdBindDescriptorBufferEmbeddedSamplersEXT(C.CommandBuffer,
	PipelineBindPoint,
	C.PipelineLayout,
	u32)
pub fn cmd_bind_descriptor_buffer_embedded_samplers_ext(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	layout C.PipelineLayout,
	set u32) {
	C.vkCmdBindDescriptorBufferEmbeddedSamplersEXT(command_buffer, pipeline_bind_point,
		layout, set)
}

fn C.vkGetBufferOpaqueCaptureDescriptorDataEXT(C.Device,
	&BufferCaptureDescriptorDataInfoEXT,
	voidptr) Result
pub fn get_buffer_opaque_capture_descriptor_data_ext(device C.Device,
	p_info &BufferCaptureDescriptorDataInfoEXT,
	p_data voidptr) Result {
	return C.vkGetBufferOpaqueCaptureDescriptorDataEXT(device, p_info, p_data)
}

fn C.vkGetImageOpaqueCaptureDescriptorDataEXT(C.Device,
	&ImageCaptureDescriptorDataInfoEXT,
	voidptr) Result
pub fn get_image_opaque_capture_descriptor_data_ext(device C.Device,
	p_info &ImageCaptureDescriptorDataInfoEXT,
	p_data voidptr) Result {
	return C.vkGetImageOpaqueCaptureDescriptorDataEXT(device, p_info, p_data)
}

fn C.vkGetImageViewOpaqueCaptureDescriptorDataEXT(C.Device,
	&ImageViewCaptureDescriptorDataInfoEXT,
	voidptr) Result
pub fn get_image_view_opaque_capture_descriptor_data_ext(device C.Device,
	p_info &ImageViewCaptureDescriptorDataInfoEXT,
	p_data voidptr) Result {
	return C.vkGetImageViewOpaqueCaptureDescriptorDataEXT(device, p_info, p_data)
}

fn C.vkGetSamplerOpaqueCaptureDescriptorDataEXT(C.Device,
	&SamplerCaptureDescriptorDataInfoEXT,
	voidptr) Result
pub fn get_sampler_opaque_capture_descriptor_data_ext(device C.Device,
	p_info &SamplerCaptureDescriptorDataInfoEXT,
	p_data voidptr) Result {
	return C.vkGetSamplerOpaqueCaptureDescriptorDataEXT(device, p_info, p_data)
}

fn C.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(C.Device,
	&AccelerationStructureCaptureDescriptorDataInfoEXT,
	voidptr) Result
pub fn get_acceleration_structure_opaque_capture_descriptor_data_ext(device C.Device,
	p_info &AccelerationStructureCaptureDescriptorDataInfoEXT,
	p_data voidptr) Result {
	return C.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(device, p_info,
		p_data)
}

pub const ext_graphics_pipeline_library_spec_version = 1
pub const ext_graphics_pipeline_library_extension_name = 'VK_EXT_graphics_pipeline_library'

pub enum GraphicsPipelineLibraryFlagBitsEXT {
	graphics_pipeline_library_vertex_input_interface_bit_ext    = int(0x00000001)
	graphics_pipeline_library_pre_rasterization_shaders_bit_ext = int(0x00000002)
	graphics_pipeline_library_fragment_shader_bit_ext           = int(0x00000004)
	graphics_pipeline_library_fragment_output_interface_bit_ext = int(0x00000008)
	graphics_pipeline_library_flag_bits_max_enum_ext            = int(0x7FFFFFFF)
}

pub type GraphicsPipelineLibraryFlagsEXT = u32

pub struct PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_graphics_pipeline_library_features_ext
	p_next                    voidptr
	graphics_pipeline_library Bool32
}

pub struct PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT {
pub mut:
	s_type                                                         StructureType = StructureType.structure_type_physical_device_graphics_pipeline_library_properties_ext
	p_next                                                         voidptr
	graphics_pipeline_library_fast_linking                         Bool32
	graphics_pipeline_library_independent_interpolation_decoration Bool32
}

pub struct GraphicsPipelineLibraryCreateInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_graphics_pipeline_library_create_info_ext
	p_next voidptr
	flags  GraphicsPipelineLibraryFlagsEXT
}

pub const amd_shader_early_and_late_fragment_tests_spec_version = 1
pub const amd_shader_early_and_late_fragment_tests_extension_name = 'VK_AMD_shader_early_and_late_fragment_tests'

pub struct PhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_shader_early_and_late_fragment_tests_features_amd
	p_next                               voidptr
	shader_early_and_late_fragment_tests Bool32
}

pub const nv_fragment_shading_rate_enums_spec_version = 1
pub const nv_fragment_shading_rate_enums_extension_name = 'VK_NV_fragment_shading_rate_enums'

pub enum FragmentShadingRateTypeNV {
	fragment_shading_rate_type_fragment_size_nv = int(0)
	fragment_shading_rate_type_enums_nv         = int(1)
	fragment_shading_rate_type_max_enum_nv      = int(0x7FFFFFFF)
}

pub enum FragmentShadingRateNV {
	fragment_shading_rate1_invocation_per_pixel_nv     = int(0)
	fragment_shading_rate1_invocation_per1x2_pixels_nv = int(1)
	fragment_shading_rate1_invocation_per2x1_pixels_nv = int(4)
	fragment_shading_rate1_invocation_per2x2_pixels_nv = int(5)
	fragment_shading_rate1_invocation_per2x4_pixels_nv = int(6)
	fragment_shading_rate1_invocation_per4x2_pixels_nv = int(9)
	fragment_shading_rate1_invocation_per4x4_pixels_nv = int(10)
	fragment_shading_rate2_invocations_per_pixel_nv    = int(11)
	fragment_shading_rate4_invocations_per_pixel_nv    = int(12)
	fragment_shading_rate8_invocations_per_pixel_nv    = int(13)
	fragment_shading_rate16_invocations_per_pixel_nv   = int(14)
	fragment_shading_rate_no_invocations_nv            = int(15)
	fragment_shading_rate_max_enum_nv                  = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceFragmentShadingRateEnumsFeaturesNV {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_fragment_shading_rate_enums_features_nv
	p_next                               voidptr
	fragment_shading_rate_enums          Bool32
	supersample_fragment_shading_rates   Bool32
	no_invocation_fragment_shading_rates Bool32
}

pub struct PhysicalDeviceFragmentShadingRateEnumsPropertiesNV {
pub mut:
	s_type                                     StructureType = StructureType.structure_type_physical_device_fragment_shading_rate_enums_properties_nv
	p_next                                     voidptr
	max_fragment_shading_rate_invocation_count SampleCountFlagBits
}

pub struct PipelineFragmentShadingRateEnumStateCreateInfoNV {
pub mut:
	s_type            StructureType = StructureType.structure_type_pipeline_fragment_shading_rate_enum_state_create_info_nv
	p_next            voidptr
	shading_rate_type FragmentShadingRateTypeNV
	shading_rate      FragmentShadingRateNV
	combiner_ops      [2]FragmentShadingRateCombinerOpKHR
}

fn C.vkCmdSetFragmentShadingRateEnumNV(C.CommandBuffer,
	FragmentShadingRateNV,
	[2]FragmentShadingRateCombinerOpKHR)
pub fn cmd_set_fragment_shading_rate_enum_nv(command_buffer C.CommandBuffer,
	shading_rate FragmentShadingRateNV,
	combiner_ops [2]FragmentShadingRateCombinerOpKHR) {
	C.vkCmdSetFragmentShadingRateEnumNV(command_buffer, shading_rate, combiner_ops)
}

pub const nv_ray_tracing_motion_blur_spec_version = 1
pub const nv_ray_tracing_motion_blur_extension_name = 'VK_NV_ray_tracing_motion_blur'

pub enum AccelerationStructureMotionInstanceTypeNV {
	acceleration_structure_motion_instance_type_static_nv        = int(0)
	acceleration_structure_motion_instance_type_matrix_motion_nv = int(1)
	acceleration_structure_motion_instance_type_srt_motion_nv    = int(2)
	acceleration_structure_motion_instance_type_max_enum_nv      = int(0x7FFFFFFF)
}

pub type AccelerationStructureMotionInfoFlagsNV = u32
pub type AccelerationStructureMotionInstanceFlagsNV = u32

pub union DeviceOrHostAddressConstKHR {
pub mut:
	device_address DeviceAddress
	host_address   voidptr
}

pub struct AccelerationStructureGeometryMotionTrianglesDataNV {
pub mut:
	s_type      StructureType = StructureType.structure_type_acceleration_structure_geometry_motion_triangles_data_nv
	p_next      voidptr
	vertex_data DeviceOrHostAddressConstKHR
}

pub struct AccelerationStructureMotionInfoNV {
pub mut:
	s_type        StructureType = StructureType.structure_type_acceleration_structure_motion_info_nv
	p_next        voidptr
	max_instances u32
	flags         AccelerationStructureMotionInfoFlagsNV
}

pub struct AccelerationStructureMatrixMotionInstanceNV {
pub mut:
	transform_t0                                TransformMatrixKHR
	transform_t1                                TransformMatrixKHR
	instance_custom_index                       u32
	mask                                        u32
	instance_shader_binding_table_record_offset u32
	flags                                       GeometryInstanceFlagsKHR
	acceleration_structure_reference            u64
}

pub struct SRTDataNV {
pub mut:
	sx  f32
	a   f32
	b   f32
	pvx f32
	sy  f32
	c   f32
	pvy f32
	sz  f32
	pvz f32
	qx  f32
	qy  f32
	qz  f32
	qw  f32
	tx  f32
	ty  f32
	tz  f32
}

pub struct AccelerationStructureSRTMotionInstanceNV {
pub mut:
	transform_t0                                SRTDataNV
	transform_t1                                SRTDataNV
	instance_custom_index                       u32
	mask                                        u32
	instance_shader_binding_table_record_offset u32
	flags                                       GeometryInstanceFlagsKHR
	acceleration_structure_reference            u64
}

pub union AccelerationStructureMotionInstanceDataNV {
pub mut:
	static_instance        AccelerationStructureInstanceKHR
	matrix_motion_instance AccelerationStructureMatrixMotionInstanceNV
	srt_motion_instance    AccelerationStructureSRTMotionInstanceNV
}

pub struct AccelerationStructureMotionInstanceNV {
pub mut:
	vktype AccelerationStructureMotionInstanceTypeNV
	flags  AccelerationStructureMotionInstanceFlagsNV
	data   AccelerationStructureMotionInstanceDataNV
}

pub struct PhysicalDeviceRayTracingMotionBlurFeaturesNV {
pub mut:
	s_type                                               StructureType = StructureType.structure_type_physical_device_ray_tracing_motion_blur_features_nv
	p_next                                               voidptr
	ray_tracing_motion_blur                              Bool32
	ray_tracing_motion_blur_pipeline_trace_rays_indirect Bool32
}

pub const ext_ycbcr_2plane_444_formats_spec_version = 1
pub const ext_ycbcr_2plane_444_formats_extension_name = 'VK_EXT_ycbcr_2plane_444_formats'

pub struct PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_ycbcr2_plane444_formats_features_ext
	p_next                 voidptr
	ycbcr2plane444_formats Bool32
}

pub const ext_fragment_density_map_2_spec_version = 1
pub const ext_fragment_density_map_2_extension_name = 'VK_EXT_fragment_density_map2'

pub struct PhysicalDeviceFragmentDensityMap2FeaturesEXT {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_fragment_density_map2_features_ext
	p_next                        voidptr
	fragment_density_map_deferred Bool32
}

pub struct PhysicalDeviceFragmentDensityMap2PropertiesEXT {
pub mut:
	s_type                                        StructureType = StructureType.structure_type_physical_device_fragment_density_map2_properties_ext
	p_next                                        voidptr
	subsampled_loads                              Bool32
	subsampled_coarse_reconstruction_early_access Bool32
	max_subsampled_array_layers                   u32
	max_descriptor_set_subsampled_samplers        u32
}

pub const qcom_rotated_copy_commands_spec_version = 2
pub const qcom_rotated_copy_commands_extension_name = 'VK_QCOM_rotated_copy_commands'

pub struct CopyCommandTransformInfoQCOM {
pub mut:
	s_type    StructureType = StructureType.structure_type_copy_command_transform_info_qcom
	p_next    voidptr
	transform SurfaceTransformFlagBitsKHR
}

pub const ext_image_robustness_spec_version = 1
pub const ext_image_robustness_extension_name = 'VK_EXT_image_robustness'

pub type PhysicalDeviceImageRobustnessFeaturesEXT = PhysicalDeviceImageRobustnessFeatures

pub const ext_image_compression_control_spec_version = 1
pub const ext_image_compression_control_extension_name = 'VK_EXT_image_compression_control'

pub enum ImageCompressionFlagBitsEXT {
	image_compression_default_ext             = int(0)
	image_compression_fixed_rate_default_ext  = int(0x00000001)
	image_compression_fixed_rate_explicit_ext = int(0x00000002)
	image_compression_disabled_ext            = int(0x00000004)
	image_compression_flag_bits_max_enum_ext  = int(0x7FFFFFFF)
}

pub type ImageCompressionFlagsEXT = u32

pub enum ImageCompressionFixedRateFlagBitsEXT {
	image_compression_fixed_rate_none_ext               = int(0)
	image_compression_fixed_rate1bpc_bit_ext            = int(0x00000001)
	image_compression_fixed_rate2bpc_bit_ext            = int(0x00000002)
	image_compression_fixed_rate3bpc_bit_ext            = int(0x00000004)
	image_compression_fixed_rate4bpc_bit_ext            = int(0x00000008)
	image_compression_fixed_rate5bpc_bit_ext            = int(0x00000010)
	image_compression_fixed_rate6bpc_bit_ext            = int(0x00000020)
	image_compression_fixed_rate7bpc_bit_ext            = int(0x00000040)
	image_compression_fixed_rate8bpc_bit_ext            = int(0x00000080)
	image_compression_fixed_rate9bpc_bit_ext            = int(0x00000100)
	image_compression_fixed_rate10bpc_bit_ext           = int(0x00000200)
	image_compression_fixed_rate11bpc_bit_ext           = int(0x00000400)
	image_compression_fixed_rate12bpc_bit_ext           = int(0x00000800)
	image_compression_fixed_rate13bpc_bit_ext           = int(0x00001000)
	image_compression_fixed_rate14bpc_bit_ext           = int(0x00002000)
	image_compression_fixed_rate15bpc_bit_ext           = int(0x00004000)
	image_compression_fixed_rate16bpc_bit_ext           = int(0x00008000)
	image_compression_fixed_rate17bpc_bit_ext           = int(0x00010000)
	image_compression_fixed_rate18bpc_bit_ext           = int(0x00020000)
	image_compression_fixed_rate19bpc_bit_ext           = int(0x00040000)
	image_compression_fixed_rate20bpc_bit_ext           = int(0x00080000)
	image_compression_fixed_rate21bpc_bit_ext           = int(0x00100000)
	image_compression_fixed_rate22bpc_bit_ext           = int(0x00200000)
	image_compression_fixed_rate23bpc_bit_ext           = int(0x00400000)
	image_compression_fixed_rate24bpc_bit_ext           = int(0x00800000)
	image_compression_fixed_rate_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type ImageCompressionFixedRateFlagsEXT = u32

pub struct PhysicalDeviceImageCompressionControlFeaturesEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_image_compression_control_features_ext
	p_next                    voidptr
	image_compression_control Bool32
}

pub struct ImageCompressionControlEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_image_compression_control_ext
	p_next                          voidptr
	flags                           ImageCompressionFlagsEXT
	compression_control_plane_count u32
	p_fixed_rate_flags              &ImageCompressionFixedRateFlagsEXT
}

pub struct ImageCompressionPropertiesEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_image_compression_properties_ext
	p_next                             voidptr
	image_compression_flags            ImageCompressionFlagsEXT
	image_compression_fixed_rate_flags ImageCompressionFixedRateFlagsEXT
}

pub const ext_attachment_feedback_loop_layout_spec_version = 2
pub const ext_attachment_feedback_loop_layout_extension_name = 'VK_EXT_attachment_feedback_loop_layout'

pub struct PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_attachment_feedback_loop_layout_features_ext
	p_next                          voidptr
	attachment_feedback_loop_layout Bool32
}

pub const ext_4444_formats_spec_version = 1
pub const ext_4444_formats_extension_name = 'VK_EXT_4444_formats'

pub struct PhysicalDevice4444FormatsFeaturesEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device4444_formats_features_ext
	p_next             voidptr
	format_a4_r4_g4_b4 Bool32
	format_a4_b4_g4_r4 Bool32
}

pub const ext_device_fault_spec_version = 2
pub const ext_device_fault_extension_name = 'VK_EXT_device_fault'

pub enum DeviceFaultAddressTypeEXT {
	device_fault_address_type_none_ext                        = int(0)
	device_fault_address_type_read_invalid_ext                = int(1)
	device_fault_address_type_write_invalid_ext               = int(2)
	device_fault_address_type_execute_invalid_ext             = int(3)
	device_fault_address_type_instruction_pointer_unknown_ext = int(4)
	device_fault_address_type_instruction_pointer_invalid_ext = int(5)
	device_fault_address_type_instruction_pointer_fault_ext   = int(6)
	device_fault_address_type_max_enum_ext                    = int(0x7FFFFFFF)
}

pub enum DeviceFaultVendorBinaryHeaderVersionEXT {
	device_fault_vendor_binary_header_version_one_ext      = int(1)
	device_fault_vendor_binary_header_version_max_enum_ext = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceFaultFeaturesEXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_fault_features_ext
	p_next                     voidptr
	device_fault               Bool32
	device_fault_vendor_binary Bool32
}

pub struct DeviceFaultCountsEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_device_fault_counts_ext
	p_next             voidptr
	address_info_count u32
	vendor_info_count  u32
	vendor_binary_size DeviceSize
}

pub struct DeviceFaultAddressInfoEXT {
pub mut:
	address_type      DeviceFaultAddressTypeEXT
	reported_address  DeviceAddress
	address_precision DeviceSize
}

pub struct DeviceFaultVendorInfoEXT {
pub mut:
	description       [max_description_size]char
	vendor_fault_code u64
	vendor_fault_data u64
}

pub struct DeviceFaultInfoEXT {
pub mut:
	s_type               StructureType = StructureType.structure_type_device_fault_info_ext
	p_next               voidptr
	description          [max_description_size]char
	p_address_infos      &DeviceFaultAddressInfoEXT
	p_vendor_infos       &DeviceFaultVendorInfoEXT
	p_vendor_binary_data voidptr
}

pub struct DeviceFaultVendorBinaryHeaderVersionOneEXT {
pub mut:
	header_size             u32
	header_version          DeviceFaultVendorBinaryHeaderVersionEXT
	vendor_id               u32
	device_id               u32
	driver_version          u32
	pipeline_cache_uuid     [uuid_size]u8
	application_name_offset u32
	application_version     u32
	engine_name_offset      u32
	engine_version          u32
	api_version             u32
}

fn C.vkGetDeviceFaultInfoEXT(C.Device,
	&DeviceFaultCountsEXT,
	&DeviceFaultInfoEXT) Result
pub fn get_device_fault_info_ext(device C.Device,
	p_fault_counts &DeviceFaultCountsEXT,
	p_fault_info &DeviceFaultInfoEXT) Result {
	return C.vkGetDeviceFaultInfoEXT(device, p_fault_counts, p_fault_info)
}

pub const arm_rasterization_order_attachment_access_spec_version = 1
pub const arm_rasterization_order_attachment_access_extension_name = 'VK_ARM_rasterization_order_attachment_access'

pub struct PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT {
pub mut:
	s_type                                        StructureType = StructureType.structure_type_physical_device_rasterization_order_attachment_access_features_ext
	p_next                                        voidptr
	rasterization_order_color_attachment_access   Bool32
	rasterization_order_depth_attachment_access   Bool32
	rasterization_order_stencil_attachment_access Bool32
}

pub type PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM = PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT

pub const ext_rgba10x6_formats_spec_version = 1
pub const ext_rgba10x6_formats_extension_name = 'VK_EXT_rgba10x6_formats'

pub struct PhysicalDeviceRGBA10X6FormatsFeaturesEXT {
pub mut:
	s_type                                  StructureType
	p_next                                  voidptr
	format_rgba10x6_without_y_cb_cr_sampler Bool32
}

pub const valve_mutable_descriptor_type_spec_version = 1
pub const valve_mutable_descriptor_type_extension_name = 'VK_VAVE_mutable_descriptor_type'

pub struct PhysicalDeviceMutableDescriptorTypeFeaturesEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_mutable_descriptor_type_features_ext
	p_next                  voidptr
	mutable_descriptor_type Bool32
}

pub type PhysicalDeviceMutableDescriptorTypeFeaturesVALVE = PhysicalDeviceMutableDescriptorTypeFeaturesEXT

pub struct MutableDescriptorTypeListEXT {
pub mut:
	descriptor_type_count u32
	p_descriptor_types    &DescriptorType
}

pub type MutableDescriptorTypeListVALVE = MutableDescriptorTypeListEXT

pub struct MutableDescriptorTypeCreateInfoEXT {
pub mut:
	s_type                             StructureType = StructureType.structure_type_mutable_descriptor_type_create_info_ext
	p_next                             voidptr
	mutable_descriptor_type_list_count u32
	p_mutable_descriptor_type_lists    &MutableDescriptorTypeListEXT
}

pub type MutableDescriptorTypeCreateInfoVALVE = MutableDescriptorTypeCreateInfoEXT

pub const ext_vertex_input_dynamic_state_spec_version = 2
pub const ext_vertex_input_dynamic_state_extension_name = 'VK_EXT_vertex_input_dynamic_state'

pub struct PhysicalDeviceVertexInputDynamicStateFeaturesEXT {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_vertex_input_dynamic_state_features_ext
	p_next                     voidptr
	vertex_input_dynamic_state Bool32
}

pub struct VertexInputBindingDescription2EXT {
pub mut:
	s_type     StructureType = StructureType.structure_type_vertex_input_binding_description2_ext
	p_next     voidptr
	binding    u32
	stride     u32
	input_rate VertexInputRate
	divisor    u32
}

pub struct VertexInputAttributeDescription2EXT {
pub mut:
	s_type   StructureType = StructureType.structure_type_vertex_input_attribute_description2_ext
	p_next   voidptr
	location u32
	binding  u32
	format   Format
	offset   u32
}

fn C.vkCmdSetVertexInputEXT(C.CommandBuffer,
	u32,
	&VertexInputBindingDescription2EXT,
	u32,
	&VertexInputAttributeDescription2EXT)
pub fn cmd_set_vertex_input_ext(command_buffer C.CommandBuffer,
	vertex_binding_description_count u32,
	p_vertex_binding_descriptions &VertexInputBindingDescription2EXT,
	vertex_attribute_description_count u32,
	p_vertex_attribute_descriptions &VertexInputAttributeDescription2EXT) {
	C.vkCmdSetVertexInputEXT(command_buffer, vertex_binding_description_count, p_vertex_binding_descriptions,
		vertex_attribute_description_count, p_vertex_attribute_descriptions)
}

pub const ext_physical_device_drm_spec_version = 1
pub const ext_physical_device_drm_extension_name = 'VK_EXT_physical_device_drm'

pub struct PhysicalDeviceDrmPropertiesEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_physical_device_drm_properties_ext
	p_next        voidptr
	has_primary   Bool32
	has_render    Bool32
	primary_major i64
	primary_minor i64
	render_major  i64
	render_minor  i64
}

pub const ext_device_address_binding_report_spec_version = 1
pub const ext_device_address_binding_report_extension_name = 'VK_EXT_device_address_binding_report'

pub enum DeviceAddressBindingTypeEXT {
	device_address_binding_type_bind_ext     = int(0)
	device_address_binding_type_unbind_ext   = int(1)
	device_address_binding_type_max_enum_ext = int(0x7FFFFFFF)
}

pub enum DeviceAddressBindingFlagBitsEXT {
	device_address_binding_internal_object_bit_ext = int(0x00000001)
	device_address_binding_flag_bits_max_enum_ext  = int(0x7FFFFFFF)
}

pub type DeviceAddressBindingFlagsEXT = u32

pub struct PhysicalDeviceAddressBindingReportFeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_address_binding_report_features_ext
	p_next                 voidptr
	report_address_binding Bool32
}

pub struct DeviceAddressBindingCallbackDataEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_device_address_binding_callback_data_ext
	p_next       voidptr
	flags        DeviceAddressBindingFlagsEXT
	base_address DeviceAddress
	size         DeviceSize
	binding_type DeviceAddressBindingTypeEXT
}

pub const ext_depth_clip_control_spec_version = 1
pub const ext_depth_clip_control_extension_name = 'VK_EXT_depth_clip_control'

pub struct PhysicalDeviceDepthClipControlFeaturesEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_depth_clip_control_features_ext
	p_next             voidptr
	depth_clip_control Bool32
}

pub struct PipelineViewportDepthClipControlCreateInfoEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_viewport_depth_clip_control_create_info_ext
	p_next              voidptr
	negative_one_to_one Bool32
}

pub const ext_primitive_topology_list_restart_spec_version = 1
pub const ext_primitive_topology_list_restart_extension_name = 'VK_EXT_primitive_topology_list_restart'

pub struct PhysicalDevicePrimitiveTopologyListRestartFeaturesEXT {
pub mut:
	s_type                                StructureType = StructureType.structure_type_physical_device_primitive_topology_list_restart_features_ext
	p_next                                voidptr
	primitive_topology_list_restart       Bool32
	primitive_topology_patch_list_restart Bool32
}

pub const ext_present_mode_fifo_latest_ready_spec_version = 1
pub const ext_present_mode_fifo_latest_ready_extension_name = 'VK_EXT_present_mode_fifo_latest_ready'

pub struct PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_present_mode_fifo_latest_ready_features_ext
	p_next                         voidptr
	present_mode_fifo_latest_ready Bool32
}

pub const huawei_subpass_shading_spec_version = 3
pub const huawei_subpass_shading_extension_name = 'VK_HAWEI_subpass_shading'

pub struct SubpassShadingPipelineCreateInfoHUAWEI {
pub mut:
	s_type      StructureType = StructureType.structure_type_subpass_shading_pipeline_create_info_huawei
	p_next      voidptr
	render_pass C.RenderPass
	subpass     u32
}

pub struct PhysicalDeviceSubpassShadingFeaturesHUAWEI {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_subpass_shading_features_huawei
	p_next          voidptr
	subpass_shading Bool32
}

pub struct PhysicalDeviceSubpassShadingPropertiesHUAWEI {
pub mut:
	s_type                                          StructureType = StructureType.structure_type_physical_device_subpass_shading_properties_huawei
	p_next                                          voidptr
	max_subpass_shading_workgroup_size_aspect_ratio u32
}

fn C.vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(C.Device,
	C.RenderPass,
	&Extent2D) Result
pub fn get_device_subpass_shading_max_workgroup_size_huawei(device C.Device,
	renderpass C.RenderPass,
	p_max_workgroup_size &Extent2D) Result {
	return C.vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(device, renderpass, p_max_workgroup_size)
}

fn C.vkCmdSubpassShadingHUAWEI(C.CommandBuffer)
pub fn cmd_subpass_shading_huawei(command_buffer C.CommandBuffer) {
	C.vkCmdSubpassShadingHUAWEI(command_buffer)
}

pub const huawei_invocation_mask_spec_version = 1
pub const huawei_invocation_mask_extension_name = 'VK_HAWEI_invocation_mask'

pub struct PhysicalDeviceInvocationMaskFeaturesHUAWEI {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_invocation_mask_features_huawei
	p_next          voidptr
	invocation_mask Bool32
}

fn C.vkCmdBindInvocationMaskHUAWEI(C.CommandBuffer,
	C.ImageView,
	ImageLayout)
pub fn cmd_bind_invocation_mask_huawei(command_buffer C.CommandBuffer,
	image_view C.ImageView,
	image_layout ImageLayout) {
	C.vkCmdBindInvocationMaskHUAWEI(command_buffer, image_view, image_layout)
}

pub type RemoteAddressNV = voidptr

pub const nv_external_memory_rdma_spec_version = 1
pub const nv_external_memory_rdma_extension_name = 'VK_NV_external_memory_rdma'

pub struct MemoryGetRemoteAddressInfoNV {
pub mut:
	s_type      StructureType = StructureType.structure_type_memory_get_remote_address_info_nv
	p_next      voidptr
	memory      C.DeviceMemory
	handle_type ExternalMemoryHandleTypeFlagBits
}

pub struct PhysicalDeviceExternalMemoryRDMAFeaturesNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_external_memory_rdma_features_nv
	p_next               voidptr
	external_memory_rdma Bool32
}

fn C.vkGetMemoryRemoteAddressNV(C.Device,
	&MemoryGetRemoteAddressInfoNV,
	&RemoteAddressNV) Result
pub fn get_memory_remote_address_nv(device C.Device,
	p_memory_get_remote_address_info &MemoryGetRemoteAddressInfoNV,
	p_address &RemoteAddressNV) Result {
	return C.vkGetMemoryRemoteAddressNV(device, p_memory_get_remote_address_info, p_address)
}

pub const ext_pipeline_properties_spec_version = 1
pub const ext_pipeline_properties_extension_name = 'VK_EXT_pipeline_properties'

pub type PipelineInfoEXT = PipelineInfoKHR

pub struct PipelinePropertiesIdentifierEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_properties_identifier_ext
	p_next              voidptr
	pipeline_identifier [uuid_size]u8
}

pub struct PhysicalDevicePipelinePropertiesFeaturesEXT {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_pipeline_properties_features_ext
	p_next                         voidptr
	pipeline_properties_identifier Bool32
}

fn C.vkGetPipelinePropertiesEXT(C.Device,
	&PipelineInfoEXT,
	&BaseOutStructure) Result
pub fn get_pipeline_properties_ext(device C.Device,
	p_pipeline_info &PipelineInfoEXT,
	p_pipeline_properties &BaseOutStructure) Result {
	return C.vkGetPipelinePropertiesEXT(device, p_pipeline_info, p_pipeline_properties)
}

pub const ext_frame_boundary_spec_version = 1
pub const ext_frame_boundary_extension_name = 'VK_EXT_frame_boundary'

pub enum FrameBoundaryFlagBitsEXT {
	frame_boundary_frame_end_bit_ext      = int(0x00000001)
	frame_boundary_flag_bits_max_enum_ext = int(0x7FFFFFFF)
}

pub type FrameBoundaryFlagsEXT = u32

pub struct PhysicalDeviceFrameBoundaryFeaturesEXT {
pub mut:
	s_type         StructureType = StructureType.structure_type_physical_device_frame_boundary_features_ext
	p_next         voidptr
	frame_boundary Bool32
}

pub struct FrameBoundaryEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_frame_boundary_ext
	p_next       voidptr
	flags        FrameBoundaryFlagsEXT
	frame_id     u64
	image_count  u32
	p_images     &C.Image
	buffer_count u32
	p_buffers    &C.Buffer
	tag_name     u64
	tag_size     usize
	p_tag        voidptr
}

pub const ext_multisampled_render_to_single_sampled_spec_version = 1
pub const ext_multisampled_render_to_single_sampled_extension_name = 'VK_EXT_multisampled_render_to_single_sampled'

pub struct PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT {
pub mut:
	s_type                                StructureType = StructureType.structure_type_physical_device_multisampled_render_to_single_sampled_features_ext
	p_next                                voidptr
	multisampled_render_to_single_sampled Bool32
}

pub struct SubpassResolvePerformanceQueryEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_subpass_resolve_performance_query_ext
	p_next  voidptr
	optimal Bool32
}

pub struct MultisampledRenderToSingleSampledInfoEXT {
pub mut:
	s_type                                       StructureType = StructureType.structure_type_multisampled_render_to_single_sampled_info_ext
	p_next                                       voidptr
	multisampled_render_to_single_sampled_enable Bool32
	rasterization_samples                        SampleCountFlagBits
}

pub const ext_extended_dynamic_state_2_spec_version = 1
pub const ext_extended_dynamic_state_2_extension_name = 'VK_EXT_extended_dynamic_state2'

pub struct PhysicalDeviceExtendedDynamicState2FeaturesEXT {
pub mut:
	s_type                                       StructureType = StructureType.structure_type_physical_device_extended_dynamic_state2_features_ext
	p_next                                       voidptr
	extended_dynamic_state2                      Bool32
	extended_dynamic_state2_logic_op             Bool32
	extended_dynamic_state2_patch_control_points Bool32
}

fn C.vkCmdSetPatchControlPointsEXT(C.CommandBuffer,
	u32)
pub fn cmd_set_patch_control_points_ext(command_buffer C.CommandBuffer,
	patch_control_points u32) {
	C.vkCmdSetPatchControlPointsEXT(command_buffer, patch_control_points)
}

fn C.vkCmdSetLogicOpEXT(C.CommandBuffer,
	LogicOp)
pub fn cmd_set_logic_op_ext(command_buffer C.CommandBuffer,
	logic_op LogicOp) {
	C.vkCmdSetLogicOpEXT(command_buffer, logic_op)
}

pub const ext_color_write_enable_spec_version = 1
pub const ext_color_write_enable_extension_name = 'VK_EXT_color_write_enable'

pub struct PhysicalDeviceColorWriteEnableFeaturesEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_physical_device_color_write_enable_features_ext
	p_next             voidptr
	color_write_enable Bool32
}

pub struct PipelineColorWriteCreateInfoEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_pipeline_color_write_create_info_ext
	p_next                voidptr
	attachment_count      u32
	p_color_write_enables &Bool32
}

fn C.vkCmdSetColorWriteEnableEXT(C.CommandBuffer,
	u32,
	&Bool32)
pub fn cmd_set_color_write_enable_ext(command_buffer C.CommandBuffer,
	attachment_count u32,
	p_color_write_enables &Bool32) {
	C.vkCmdSetColorWriteEnableEXT(command_buffer, attachment_count, p_color_write_enables)
}

pub const ext_primitives_generated_query_spec_version = 1
pub const ext_primitives_generated_query_extension_name = 'VK_EXT_primitives_generated_query'

pub struct PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT {
pub mut:
	s_type                                             StructureType = StructureType.structure_type_physical_device_primitives_generated_query_features_ext
	p_next                                             voidptr
	primitives_generated_query                         Bool32
	primitives_generated_query_with_rasterizer_discard Bool32
	primitives_generated_query_with_non_zero_streams   Bool32
}

pub const ext_global_priority_query_spec_version = 1
pub const ext_global_priority_query_extension_name = 'VK_EXT_global_priority_query'
pub const max_global_priority_size_ext = max_global_priority_size_khr

pub type PhysicalDeviceGlobalPriorityQueryFeaturesEXT = PhysicalDeviceGlobalPriorityQueryFeaturesKHR

pub type QueueFamilyGlobalPriorityPropertiesEXT = QueueFamilyGlobalPriorityPropertiesKHR

pub const ext_image_view_min_lod_spec_version = 1
pub const ext_image_view_min_lod_extension_name = 'VK_EXT_image_view_min_lod'

pub struct PhysicalDeviceImageViewMinLodFeaturesEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_physical_device_image_view_min_lod_features_ext
	p_next  voidptr
	min_lod Bool32
}

pub struct ImageViewMinLodCreateInfoEXT {
pub mut:
	s_type  StructureType = StructureType.structure_type_image_view_min_lod_create_info_ext
	p_next  voidptr
	min_lod f32
}

pub const ext_multi_draw_spec_version = 1
pub const ext_multi_draw_extension_name = 'VK_EXT_multi_draw'

pub struct PhysicalDeviceMultiDrawFeaturesEXT {
pub mut:
	s_type     StructureType = StructureType.structure_type_physical_device_multi_draw_features_ext
	p_next     voidptr
	multi_draw Bool32
}

pub struct PhysicalDeviceMultiDrawPropertiesEXT {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_multi_draw_properties_ext
	p_next               voidptr
	max_multi_draw_count u32
}

pub struct MultiDrawInfoEXT {
pub mut:
	first_vertex u32
	vertex_count u32
}

pub struct MultiDrawIndexedInfoEXT {
pub mut:
	first_index   u32
	index_count   u32
	vertex_offset i32
}

fn C.vkCmdDrawMultiEXT(C.CommandBuffer,
	u32,
	&MultiDrawInfoEXT,
	u32,
	u32,
	u32)
pub fn cmd_draw_multi_ext(command_buffer C.CommandBuffer,
	draw_count u32,
	p_vertex_info &MultiDrawInfoEXT,
	instance_count u32,
	first_instance u32,
	stride u32) {
	C.vkCmdDrawMultiEXT(command_buffer, draw_count, p_vertex_info, instance_count, first_instance,
		stride)
}

fn C.vkCmdDrawMultiIndexedEXT(C.CommandBuffer,
	u32,
	&MultiDrawIndexedInfoEXT,
	u32,
	u32,
	u32,
	&i32)
pub fn cmd_draw_multi_indexed_ext(command_buffer C.CommandBuffer,
	draw_count u32,
	p_index_info &MultiDrawIndexedInfoEXT,
	instance_count u32,
	first_instance u32,
	stride u32,
	p_vertex_offset &i32) {
	C.vkCmdDrawMultiIndexedEXT(command_buffer, draw_count, p_index_info, instance_count,
		first_instance, stride, p_vertex_offset)
}

pub const ext_image_2d_view_of_3d_spec_version = 1
pub const ext_image_2d_view_of_3d_extension_name = 'VK_EXT_image_2d_view_of_3d'

pub struct PhysicalDeviceImage2DViewOf3DFeaturesEXT {
pub mut:
	s_type                StructureType
	p_next                voidptr
	image2_d_view_of3_d   Bool32
	sampler2_d_view_of3_d Bool32
}

pub const ext_shader_tile_image_spec_version = 1
pub const ext_shader_tile_image_extension_name = 'VK_EXT_shader_tile_image'

pub struct PhysicalDeviceShaderTileImageFeaturesEXT {
pub mut:
	s_type                                StructureType = StructureType.structure_type_physical_device_shader_tile_image_features_ext
	p_next                                voidptr
	shader_tile_image_color_read_access   Bool32
	shader_tile_image_depth_read_access   Bool32
	shader_tile_image_stencil_read_access Bool32
}

pub struct PhysicalDeviceShaderTileImagePropertiesEXT {
pub mut:
	s_type                                                   StructureType = StructureType.structure_type_physical_device_shader_tile_image_properties_ext
	p_next                                                   voidptr
	shader_tile_image_coherent_read_accelerated              Bool32
	shader_tile_image_read_sample_from_pixel_rate_invocation Bool32
	shader_tile_image_read_from_helper_invocation            Bool32
}

pub type C.MicromapEXT = voidptr

pub const ext_opacity_micromap_spec_version = 2
pub const ext_opacity_micromap_extension_name = 'VK_EXT_opacity_micromap'

pub enum MicromapTypeEXT {
	micromap_type_opacity_micromap_ext = int(0)
	micromap_type_max_enum_ext         = int(0x7FFFFFFF)
}

pub enum BuildMicromapModeEXT {
	build_micromap_mode_build_ext    = int(0)
	build_micromap_mode_max_enum_ext = int(0x7FFFFFFF)
}

pub enum CopyMicromapModeEXT {
	copy_micromap_mode_clone_ext       = int(0)
	copy_micromap_mode_serialize_ext   = int(1)
	copy_micromap_mode_deserialize_ext = int(2)
	copy_micromap_mode_compact_ext     = int(3)
	copy_micromap_mode_max_enum_ext    = int(0x7FFFFFFF)
}

pub enum OpacityMicromapFormatEXT {
	opacity_micromap_format2_state_ext   = int(1)
	opacity_micromap_format4_state_ext   = int(2)
	opacity_micromap_format_max_enum_ext = int(0x7FFFFFFF)
}

pub enum OpacityMicromapSpecialIndexEXT {
	opacity_micromap_special_index_fully_transparent_ext         = int(-1)
	opacity_micromap_special_index_fully_opaque_ext              = int(-2)
	opacity_micromap_special_index_fully_unknown_transparent_ext = int(-3)
	opacity_micromap_special_index_fully_unknown_opaque_ext      = int(-4)
	opacity_micromap_special_index_max_enum_ext                  = int(0x7FFFFFFF)
}

pub enum AccelerationStructureCompatibilityKHR {
	acceleration_structure_compatibility_compatible_khr   = int(0)
	acceleration_structure_compatibility_incompatible_khr = int(1)
	acceleration_structure_compatibility_max_enum_khr     = int(0x7FFFFFFF)
}

pub enum AccelerationStructureBuildTypeKHR {
	acceleration_structure_build_type_host_khr           = int(0)
	acceleration_structure_build_type_device_khr         = int(1)
	acceleration_structure_build_type_host_or_device_khr = int(2)
	acceleration_structure_build_type_max_enum_khr       = int(0x7FFFFFFF)
}

pub enum BuildMicromapFlagBitsEXT {
	build_micromap_prefer_fast_trace_bit_ext = int(0x00000001)
	build_micromap_prefer_fast_build_bit_ext = int(0x00000002)
	build_micromap_allow_compaction_bit_ext  = int(0x00000004)
	build_micromap_flag_bits_max_enum_ext    = int(0x7FFFFFFF)
}

pub type BuildMicromapFlagsEXT = u32

pub enum MicromapCreateFlagBitsEXT {
	micromap_create_device_address_capture_replay_bit_ext = int(0x00000001)
	micromap_create_flag_bits_max_enum_ext                = int(0x7FFFFFFF)
}

pub type MicromapCreateFlagsEXT = u32

pub struct MicromapUsageEXT {
pub mut:
	count             u32
	subdivision_level u32
	format            u32
}

pub union DeviceOrHostAddressKHR {
pub mut:
	device_address DeviceAddress
	host_address   voidptr
}

pub struct MicromapBuildInfoEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_micromap_build_info_ext
	p_next                voidptr
	vktype                MicromapTypeEXT
	flags                 BuildMicromapFlagsEXT
	mode                  BuildMicromapModeEXT
	dst_micromap          C.MicromapEXT
	usage_counts_count    u32
	p_usage_counts        &MicromapUsageEXT
	pp_usage_counts       &MicromapUsageEXT
	data                  DeviceOrHostAddressConstKHR
	scratch_data          DeviceOrHostAddressKHR
	triangle_array        DeviceOrHostAddressConstKHR
	triangle_array_stride DeviceSize
}

pub struct MicromapCreateInfoEXT {
pub mut:
	s_type         StructureType = StructureType.structure_type_micromap_create_info_ext
	p_next         voidptr
	create_flags   MicromapCreateFlagsEXT
	buffer         C.Buffer
	offset         DeviceSize
	size           DeviceSize
	vktype         MicromapTypeEXT
	device_address DeviceAddress
}

pub struct PhysicalDeviceOpacityMicromapFeaturesEXT {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_opacity_micromap_features_ext
	p_next                  voidptr
	micromap                Bool32
	micromap_capture_replay Bool32
	micromap_host_commands  Bool32
}

pub struct PhysicalDeviceOpacityMicromapPropertiesEXT {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_opacity_micromap_properties_ext
	p_next                               voidptr
	max_opacity2_state_subdivision_level u32
	max_opacity4_state_subdivision_level u32
}

pub struct MicromapVersionInfoEXT {
pub mut:
	s_type         StructureType = StructureType.structure_type_micromap_version_info_ext
	p_next         voidptr
	p_version_data &u8
}

pub struct CopyMicromapToMemoryInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_micromap_to_memory_info_ext
	p_next voidptr
	src    C.MicromapEXT
	dst    DeviceOrHostAddressKHR
	mode   CopyMicromapModeEXT
}

pub struct CopyMemoryToMicromapInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_memory_to_micromap_info_ext
	p_next voidptr
	src    DeviceOrHostAddressConstKHR
	dst    C.MicromapEXT
	mode   CopyMicromapModeEXT
}

pub struct CopyMicromapInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_micromap_info_ext
	p_next voidptr
	src    C.MicromapEXT
	dst    C.MicromapEXT
	mode   CopyMicromapModeEXT
}

pub struct MicromapBuildSizesInfoEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_micromap_build_sizes_info_ext
	p_next             voidptr
	micromap_size      DeviceSize
	build_scratch_size DeviceSize
	discardable        Bool32
}

pub struct AccelerationStructureTrianglesOpacityMicromapEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_acceleration_structure_triangles_opacity_micromap_ext
	p_next             voidptr
	index_type         IndexType
	index_buffer       DeviceOrHostAddressConstKHR
	index_stride       DeviceSize
	base_triangle      u32
	usage_counts_count u32
	p_usage_counts     &MicromapUsageEXT
	pp_usage_counts    &MicromapUsageEXT
	micromap           C.MicromapEXT
}

pub struct MicromapTriangleEXT {
pub mut:
	data_offset       u32
	subdivision_level u16
	format            u16
}

fn C.vkCreateMicromapEXT(C.Device,
	&MicromapCreateInfoEXT,
	&AllocationCallbacks,
	&C.MicromapEXT) Result
pub fn create_micromap_ext(device C.Device,
	p_create_info &MicromapCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_micromap &C.MicromapEXT) Result {
	return C.vkCreateMicromapEXT(device, p_create_info, p_allocator, p_micromap)
}

fn C.vkDestroyMicromapEXT(C.Device,
	C.MicromapEXT,
	&AllocationCallbacks)
pub fn destroy_micromap_ext(device C.Device,
	micromap C.MicromapEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyMicromapEXT(device, micromap, p_allocator)
}

fn C.vkCmdBuildMicromapsEXT(C.CommandBuffer,
	u32,
	&MicromapBuildInfoEXT)
pub fn cmd_build_micromaps_ext(command_buffer C.CommandBuffer,
	info_count u32,
	p_infos &MicromapBuildInfoEXT) {
	C.vkCmdBuildMicromapsEXT(command_buffer, info_count, p_infos)
}

fn C.vkBuildMicromapsEXT(C.Device,
	C.DeferredOperationKHR,
	u32,
	&MicromapBuildInfoEXT) Result
pub fn build_micromaps_ext(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	info_count u32,
	p_infos &MicromapBuildInfoEXT) Result {
	return C.vkBuildMicromapsEXT(device, deferred_operation, info_count, p_infos)
}

fn C.vkCopyMicromapEXT(C.Device,
	C.DeferredOperationKHR,
	&CopyMicromapInfoEXT) Result
pub fn copy_micromap_ext(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyMicromapInfoEXT) Result {
	return C.vkCopyMicromapEXT(device, deferred_operation, p_info)
}

fn C.vkCopyMicromapToMemoryEXT(C.Device,
	C.DeferredOperationKHR,
	&CopyMicromapToMemoryInfoEXT) Result
pub fn copy_micromap_to_memory_ext(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyMicromapToMemoryInfoEXT) Result {
	return C.vkCopyMicromapToMemoryEXT(device, deferred_operation, p_info)
}

fn C.vkCopyMemoryToMicromapEXT(C.Device,
	C.DeferredOperationKHR,
	&CopyMemoryToMicromapInfoEXT) Result
pub fn copy_memory_to_micromap_ext(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyMemoryToMicromapInfoEXT) Result {
	return C.vkCopyMemoryToMicromapEXT(device, deferred_operation, p_info)
}

fn C.vkWriteMicromapsPropertiesEXT(C.Device,
	u32,
	&C.MicromapEXT,
	QueryType,
	usize,
	voidptr,
	usize) Result
pub fn write_micromaps_properties_ext(device C.Device,
	micromap_count u32,
	p_micromaps &C.MicromapEXT,
	query_type QueryType,
	data_size usize,
	p_data voidptr,
	stride usize) Result {
	return C.vkWriteMicromapsPropertiesEXT(device, micromap_count, p_micromaps, query_type,
		data_size, p_data, stride)
}

fn C.vkCmdCopyMicromapEXT(C.CommandBuffer,
	&CopyMicromapInfoEXT)
pub fn cmd_copy_micromap_ext(command_buffer C.CommandBuffer,
	p_info &CopyMicromapInfoEXT) {
	C.vkCmdCopyMicromapEXT(command_buffer, p_info)
}

fn C.vkCmdCopyMicromapToMemoryEXT(C.CommandBuffer,
	&CopyMicromapToMemoryInfoEXT)
pub fn cmd_copy_micromap_to_memory_ext(command_buffer C.CommandBuffer,
	p_info &CopyMicromapToMemoryInfoEXT) {
	C.vkCmdCopyMicromapToMemoryEXT(command_buffer, p_info)
}

fn C.vkCmdCopyMemoryToMicromapEXT(C.CommandBuffer,
	&CopyMemoryToMicromapInfoEXT)
pub fn cmd_copy_memory_to_micromap_ext(command_buffer C.CommandBuffer,
	p_info &CopyMemoryToMicromapInfoEXT) {
	C.vkCmdCopyMemoryToMicromapEXT(command_buffer, p_info)
}

fn C.vkCmdWriteMicromapsPropertiesEXT(C.CommandBuffer,
	u32,
	&C.MicromapEXT,
	QueryType,
	C.QueryPool,
	u32)
pub fn cmd_write_micromaps_properties_ext(command_buffer C.CommandBuffer,
	micromap_count u32,
	p_micromaps &C.MicromapEXT,
	query_type QueryType,
	query_pool C.QueryPool,
	first_query u32) {
	C.vkCmdWriteMicromapsPropertiesEXT(command_buffer, micromap_count, p_micromaps, query_type,
		query_pool, first_query)
}

fn C.vkGetDeviceMicromapCompatibilityEXT(C.Device,
	&MicromapVersionInfoEXT,
	&AccelerationStructureCompatibilityKHR)
pub fn get_device_micromap_compatibility_ext(device C.Device,
	p_version_info &MicromapVersionInfoEXT,
	p_compatibility &AccelerationStructureCompatibilityKHR) {
	C.vkGetDeviceMicromapCompatibilityEXT(device, p_version_info, p_compatibility)
}

fn C.vkGetMicromapBuildSizesEXT(C.Device,
	AccelerationStructureBuildTypeKHR,
	&MicromapBuildInfoEXT,
	&MicromapBuildSizesInfoEXT)
pub fn get_micromap_build_sizes_ext(device C.Device,
	build_type AccelerationStructureBuildTypeKHR,
	p_build_info &MicromapBuildInfoEXT,
	p_size_info &MicromapBuildSizesInfoEXT) {
	C.vkGetMicromapBuildSizesEXT(device, build_type, p_build_info, p_size_info)
}

pub const ext_load_store_op_none_spec_version = 1
pub const ext_load_store_op_none_extension_name = 'VK_EXT_load_store_op_none'

pub const huawei_cluster_culling_shader_spec_version = 3
pub const huawei_cluster_culling_shader_extension_name = 'VK_HAWEI_cluster_culling_shader'

pub struct PhysicalDeviceClusterCullingShaderFeaturesHUAWEI {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_cluster_culling_shader_features_huawei
	p_next                           voidptr
	clusterculling_shader            Bool32
	multiview_cluster_culling_shader Bool32
}

pub struct PhysicalDeviceClusterCullingShaderPropertiesHUAWEI {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_cluster_culling_shader_properties_huawei
	p_next                           voidptr
	max_work_group_count             [3]u32
	max_work_group_size              [3]u32
	max_output_cluster_count         u32
	indirect_buffer_offset_alignment DeviceSize
}

pub struct PhysicalDeviceClusterCullingShaderVrsFeaturesHUAWEI {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_cluster_culling_shader_vrs_features_huawei
	p_next               voidptr
	cluster_shading_rate Bool32
}

fn C.vkCmdDrawClusterHUAWEI(C.CommandBuffer,
	u32,
	u32,
	u32)
pub fn cmd_draw_cluster_huawei(command_buffer C.CommandBuffer,
	group_count_x u32,
	group_count_y u32,
	group_count_z u32) {
	C.vkCmdDrawClusterHUAWEI(command_buffer, group_count_x, group_count_y, group_count_z)
}

fn C.vkCmdDrawClusterIndirectHUAWEI(C.CommandBuffer,
	C.Buffer,
	DeviceSize)
pub fn cmd_draw_cluster_indirect_huawei(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize) {
	C.vkCmdDrawClusterIndirectHUAWEI(command_buffer, buffer, offset)
}

pub const ext_border_color_swizzle_spec_version = 1
pub const ext_border_color_swizzle_extension_name = 'VK_EXT_border_color_swizzle'

pub struct PhysicalDeviceBorderColorSwizzleFeaturesEXT {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_border_color_swizzle_features_ext
	p_next                          voidptr
	border_color_swizzle            Bool32
	border_color_swizzle_from_image Bool32
}

pub struct SamplerBorderColorComponentMappingCreateInfoEXT {
pub mut:
	s_type     StructureType = StructureType.structure_type_sampler_border_color_component_mapping_create_info_ext
	p_next     voidptr
	components ComponentMapping
	srgb       Bool32
}

pub const ext_pageable_device_local_memory_spec_version = 1
pub const ext_pageable_device_local_memory_extension_name = 'VK_EXT_pageable_device_local_memory'

pub struct PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_pageable_device_local_memory_features_ext
	p_next                       voidptr
	pageable_device_local_memory Bool32
}

fn C.vkSetDeviceMemoryPriorityEXT(C.Device,
	C.DeviceMemory,
	f32)
pub fn set_device_memory_priority_ext(device C.Device,
	memory C.DeviceMemory,
	priority f32) {
	C.vkSetDeviceMemoryPriorityEXT(device, memory, priority)
}

pub const arm_shader_core_properties_spec_version = 1
pub const arm_shader_core_properties_extension_name = 'VK_ARM_shader_core_properties'

pub struct PhysicalDeviceShaderCorePropertiesARM {
pub mut:
	s_type     StructureType = StructureType.structure_type_physical_device_shader_core_properties_arm
	p_next     voidptr
	pixel_rate u32
	texel_rate u32
	fma_rate   u32
}

pub const arm_scheduling_controls_spec_version = 1
pub const arm_scheduling_controls_extension_name = 'VK_ARM_scheduling_controls'

pub type PhysicalDeviceSchedulingControlsFlagsARM = u64

// Flag bits for PhysicalDeviceSchedulingControlsFlagBitsARM
pub type PhysicalDeviceSchedulingControlsFlagBitsARM = u64

pub const physical_device_scheduling_controls_shader_core_count_arm = u64(0x00000001)

pub struct DeviceQueueShaderCoreControlCreateInfoARM {
pub mut:
	s_type            StructureType = StructureType.structure_type_device_queue_shader_core_control_create_info_arm
	p_next            voidptr
	shader_core_count u32
}

pub struct PhysicalDeviceSchedulingControlsFeaturesARM {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_scheduling_controls_features_arm
	p_next              voidptr
	scheduling_controls Bool32
}

pub struct PhysicalDeviceSchedulingControlsPropertiesARM {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_scheduling_controls_properties_arm
	p_next                    voidptr
	scheduling_controls_flags PhysicalDeviceSchedulingControlsFlagsARM
}

pub const ext_image_sliced_view_of_3d_spec_version = 1
pub const ext_image_sliced_view_of_3d_extension_name = 'VK_EXT_image_sliced_view_of_3d'
pub const remaining_3d_slices_ext = ~u32(0)

pub struct PhysicalDeviceImageSlicedViewOf3DFeaturesEXT {
pub mut:
	s_type                  StructureType
	p_next                  voidptr
	image_sliced_view_of3_d Bool32
}

pub struct ImageViewSlicedCreateInfoEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_image_view_sliced_create_info_ext
	p_next       voidptr
	slice_offset u32
	slice_count  u32
}

pub const valve_descriptor_set_host_mapping_spec_version = 1
pub const valve_descriptor_set_host_mapping_extension_name = 'VK_VAVE_descriptor_set_host_mapping'

pub struct PhysicalDeviceDescriptorSetHostMappingFeaturesVALVE {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_descriptor_set_host_mapping_features_valve
	p_next                      voidptr
	descriptor_set_host_mapping Bool32
}

pub struct DescriptorSetBindingReferenceVALVE {
pub mut:
	s_type                StructureType = StructureType.structure_type_descriptor_set_binding_reference_valve
	p_next                voidptr
	descriptor_set_layout C.DescriptorSetLayout
	binding               u32
}

pub struct DescriptorSetLayoutHostMappingInfoVALVE {
pub mut:
	s_type            StructureType = StructureType.structure_type_descriptor_set_layout_host_mapping_info_valve
	p_next            voidptr
	descriptor_offset usize
	descriptor_size   u32
}

fn C.vkGetDescriptorSetLayoutHostMappingInfoVALVE(C.Device,
	&DescriptorSetBindingReferenceVALVE,
	&DescriptorSetLayoutHostMappingInfoVALVE)
pub fn get_descriptor_set_layout_host_mapping_info_valve(device C.Device,
	p_binding_reference &DescriptorSetBindingReferenceVALVE,
	p_host_mapping &DescriptorSetLayoutHostMappingInfoVALVE) {
	C.vkGetDescriptorSetLayoutHostMappingInfoVALVE(device, p_binding_reference, p_host_mapping)
}

fn C.vkGetDescriptorSetHostMappingVALVE(C.Device,
	C.DescriptorSet,
	&voidptr)
pub fn get_descriptor_set_host_mapping_valve(device C.Device,
	descriptor_set C.DescriptorSet,
	pp_data &voidptr) {
	C.vkGetDescriptorSetHostMappingVALVE(device, descriptor_set, pp_data)
}

pub const ext_depth_clamp_zero_one_spec_version = 1
pub const ext_depth_clamp_zero_one_extension_name = 'VK_EXT_depth_clamp_zero_one'

pub struct PhysicalDeviceDepthClampZeroOneFeaturesEXT {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_depth_clamp_zero_one_features_ext
	p_next               voidptr
	depth_clamp_zero_one Bool32
}

pub const ext_non_seamless_cube_map_spec_version = 1
pub const ext_non_seamless_cube_map_extension_name = 'VK_EXT_non_seamless_cube_map'

pub struct PhysicalDeviceNonSeamlessCubeMapFeaturesEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_non_seamless_cube_map_features_ext
	p_next                voidptr
	non_seamless_cube_map Bool32
}

pub const arm_render_pass_striped_spec_version = 1
pub const arm_render_pass_striped_extension_name = 'VK_ARM_render_pass_striped'

pub struct PhysicalDeviceRenderPassStripedFeaturesARM {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_render_pass_striped_features_arm
	p_next              voidptr
	render_pass_striped Bool32
}

pub struct PhysicalDeviceRenderPassStripedPropertiesARM {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_render_pass_striped_properties_arm
	p_next                         voidptr
	render_pass_stripe_granularity Extent2D
	max_render_pass_stripes        u32
}

pub struct RenderPassStripeInfoARM {
pub mut:
	s_type      StructureType = StructureType.structure_type_render_pass_stripe_info_arm
	p_next      voidptr
	stripe_area Rect2D
}

pub struct RenderPassStripeBeginInfoARM {
pub mut:
	s_type            StructureType = StructureType.structure_type_render_pass_stripe_begin_info_arm
	p_next            voidptr
	stripe_info_count u32
	p_stripe_infos    &RenderPassStripeInfoARM
}

pub struct RenderPassStripeSubmitInfoARM {
pub mut:
	s_type                      StructureType = StructureType.structure_type_render_pass_stripe_submit_info_arm
	p_next                      voidptr
	stripe_semaphore_info_count u32
	p_stripe_semaphore_infos    &SemaphoreSubmitInfo
}

pub const qcom_fragment_density_map_offset_spec_version = 2
pub const qcom_fragment_density_map_offset_extension_name = 'VK_QCOM_fragment_density_map_offset'

pub struct PhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_fragment_density_map_offset_features_qcom
	p_next                      voidptr
	fragment_density_map_offset Bool32
}

pub struct PhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_fragment_density_map_offset_properties_qcom
	p_next                              voidptr
	fragment_density_offset_granularity Extent2D
}

pub struct SubpassFragmentDensityMapOffsetEndInfoQCOM {
pub mut:
	s_type                        StructureType = StructureType.structure_type_subpass_fragment_density_map_offset_end_info_qcom
	p_next                        voidptr
	fragment_density_offset_count u32
	p_fragment_density_offsets    &Offset2D
}

pub const nv_copy_memory_indirect_spec_version = 1
pub const nv_copy_memory_indirect_extension_name = 'VK_NV_copy_memory_indirect'

pub struct CopyMemoryIndirectCommandNV {
pub mut:
	src_address DeviceAddress
	dst_address DeviceAddress
	size        DeviceSize
}

pub struct CopyMemoryToImageIndirectCommandNV {
pub mut:
	src_address         DeviceAddress
	buffer_row_length   u32
	buffer_image_height u32
	image_subresource   ImageSubresourceLayers
	image_offset        Offset3D
	image_extent        Extent3D
}

pub struct PhysicalDeviceCopyMemoryIndirectFeaturesNV {
pub mut:
	s_type        StructureType = StructureType.structure_type_physical_device_copy_memory_indirect_features_nv
	p_next        voidptr
	indirect_copy Bool32
}

pub struct PhysicalDeviceCopyMemoryIndirectPropertiesNV {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_copy_memory_indirect_properties_nv
	p_next           voidptr
	supported_queues QueueFlags
}

fn C.vkCmdCopyMemoryIndirectNV(C.CommandBuffer,
	DeviceAddress,
	u32,
	u32)
pub fn cmd_copy_memory_indirect_nv(command_buffer C.CommandBuffer,
	copy_buffer_address DeviceAddress,
	copy_count u32,
	stride u32) {
	C.vkCmdCopyMemoryIndirectNV(command_buffer, copy_buffer_address, copy_count, stride)
}

fn C.vkCmdCopyMemoryToImageIndirectNV(C.CommandBuffer,
	DeviceAddress,
	u32,
	u32,
	C.Image,
	ImageLayout,
	&ImageSubresourceLayers)
pub fn cmd_copy_memory_to_image_indirect_nv(command_buffer C.CommandBuffer,
	copy_buffer_address DeviceAddress,
	copy_count u32,
	stride u32,
	dst_image C.Image,
	dst_image_layout ImageLayout,
	p_image_subresources &ImageSubresourceLayers) {
	C.vkCmdCopyMemoryToImageIndirectNV(command_buffer, copy_buffer_address, copy_count,
		stride, dst_image, dst_image_layout, p_image_subresources)
}

pub const nv_memory_decompression_spec_version = 1
pub const nv_memory_decompression_extension_name = 'VK_NV_memory_decompression'

// Flag bits for MemoryDecompressionMethodFlagBitsNV
pub type MemoryDecompressionMethodFlagBitsNV = u64

pub const memory_decompression_method_gdeflate_1_0_bit_nv = u64(0x00000001)

pub type MemoryDecompressionMethodFlagsNV = u64

pub struct DecompressMemoryRegionNV {
pub mut:
	src_address          DeviceAddress
	dst_address          DeviceAddress
	compressed_size      DeviceSize
	decompressed_size    DeviceSize
	decompression_method MemoryDecompressionMethodFlagsNV
}

pub struct PhysicalDeviceMemoryDecompressionFeaturesNV {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_memory_decompression_features_nv
	p_next               voidptr
	memory_decompression Bool32
}

pub struct PhysicalDeviceMemoryDecompressionPropertiesNV {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_memory_decompression_properties_nv
	p_next                           voidptr
	decompression_methods            MemoryDecompressionMethodFlagsNV
	max_decompression_indirect_count u64
}

fn C.vkCmdDecompressMemoryNV(C.CommandBuffer,
	u32,
	&DecompressMemoryRegionNV)
pub fn cmd_decompress_memory_nv(command_buffer C.CommandBuffer,
	decompress_region_count u32,
	p_decompress_memory_regions &DecompressMemoryRegionNV) {
	C.vkCmdDecompressMemoryNV(command_buffer, decompress_region_count, p_decompress_memory_regions)
}

fn C.vkCmdDecompressMemoryIndirectCountNV(C.CommandBuffer,
	DeviceAddress,
	DeviceAddress,
	u32)
pub fn cmd_decompress_memory_indirect_count_nv(command_buffer C.CommandBuffer,
	indirect_commands_address DeviceAddress,
	indirect_commands_count_address DeviceAddress,
	stride u32) {
	C.vkCmdDecompressMemoryIndirectCountNV(command_buffer, indirect_commands_address,
		indirect_commands_count_address, stride)
}

pub const nv_device_generated_commands_compute_spec_version = 2
pub const nv_device_generated_commands_compute_extension_name = 'VK_NV_device_generated_commands_compute'

pub struct PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_device_generated_commands_compute_features_nv
	p_next                                  voidptr
	device_generated_compute                Bool32
	device_generated_compute_pipelines      Bool32
	device_generated_compute_capture_replay Bool32
}

pub struct ComputePipelineIndirectBufferInfoNV {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_compute_pipeline_indirect_buffer_info_nv
	p_next                                 voidptr
	device_address                         DeviceAddress
	size                                   DeviceSize
	pipeline_device_address_capture_replay DeviceAddress
}

pub struct PipelineIndirectDeviceAddressInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_indirect_device_address_info_nv
	p_next              voidptr
	pipeline_bind_point PipelineBindPoint
	pipeline            C.Pipeline
}

pub struct BindPipelineIndirectCommandNV {
pub mut:
	pipeline_address DeviceAddress
}

fn C.vkGetPipelineIndirectMemoryRequirementsNV(C.Device,
	&ComputePipelineCreateInfo,
	&MemoryRequirements2)
pub fn get_pipeline_indirect_memory_requirements_nv(device C.Device,
	p_create_info &ComputePipelineCreateInfo,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetPipelineIndirectMemoryRequirementsNV(device, p_create_info, p_memory_requirements)
}

fn C.vkCmdUpdatePipelineIndirectBufferNV(C.CommandBuffer,
	PipelineBindPoint,
	C.Pipeline)
pub fn cmd_update_pipeline_indirect_buffer_nv(command_buffer C.CommandBuffer,
	pipeline_bind_point PipelineBindPoint,
	pipeline C.Pipeline) {
	C.vkCmdUpdatePipelineIndirectBufferNV(command_buffer, pipeline_bind_point, pipeline)
}

fn C.vkGetPipelineIndirectDeviceAddressNV(C.Device,
	&PipelineIndirectDeviceAddressInfoNV) DeviceAddress
pub fn get_pipeline_indirect_device_address_nv(device C.Device,
	p_info &PipelineIndirectDeviceAddressInfoNV) DeviceAddress {
	return C.vkGetPipelineIndirectDeviceAddressNV(device, p_info)
}

pub const nv_linear_color_attachment_spec_version = 1
pub const nv_linear_color_attachment_extension_name = 'VK_NV_linear_color_attachment'

pub struct PhysicalDeviceLinearColorAttachmentFeaturesNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_linear_color_attachment_features_nv
	p_next                  voidptr
	linear_color_attachment Bool32
}

pub const google_surfaceless_query_spec_version = 2
pub const google_surfaceless_query_extension_name = 'VK_GOOGE_surfaceless_query'

pub const ext_image_compression_control_swapchain_spec_version = 1
pub const ext_image_compression_control_swapchain_extension_name = 'VK_EXT_image_compression_control_swapchain'

pub struct PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT {
pub mut:
	s_type                              StructureType = StructureType.structure_type_physical_device_image_compression_control_swapchain_features_ext
	p_next                              voidptr
	image_compression_control_swapchain Bool32
}

pub const qcom_image_processing_spec_version = 1
pub const qcom_image_processing_extension_name = 'VK_QCOM_image_processing'

pub struct ImageViewSampleWeightCreateInfoQCOM {
pub mut:
	s_type        StructureType = StructureType.structure_type_image_view_sample_weight_create_info_qcom
	p_next        voidptr
	filter_center Offset2D
	filter_size   Extent2D
	num_phases    u32
}

pub struct PhysicalDeviceImageProcessingFeaturesQCOM {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_image_processing_features_qcom
	p_next                  voidptr
	texture_sample_weighted Bool32
	texture_box_filter      Bool32
	texture_block_match     Bool32
}

pub struct PhysicalDeviceImageProcessingPropertiesQCOM {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_image_processing_properties_qcom
	p_next                      voidptr
	max_weight_filter_phases    u32
	max_weight_filter_dimension Extent2D
	max_block_match_region      Extent2D
	max_box_filter_block_size   Extent2D
}

pub const ext_nested_command_buffer_spec_version = 1
pub const ext_nested_command_buffer_extension_name = 'VK_EXT_nested_command_buffer'

pub struct PhysicalDeviceNestedCommandBufferFeaturesEXT {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_physical_device_nested_command_buffer_features_ext
	p_next                                 voidptr
	nested_command_buffer                  Bool32
	nested_command_buffer_rendering        Bool32
	nested_command_buffer_simultaneous_use Bool32
}

pub struct PhysicalDeviceNestedCommandBufferPropertiesEXT {
pub mut:
	s_type                           StructureType = StructureType.structure_type_physical_device_nested_command_buffer_properties_ext
	p_next                           voidptr
	max_command_buffer_nesting_level u32
}

pub const ext_external_memory_acquire_unmodified_spec_version = 1
pub const ext_external_memory_acquire_unmodified_extension_name = 'VK_EXT_external_memory_acquire_unmodified'

pub struct ExternalMemoryAcquireUnmodifiedEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_external_memory_acquire_unmodified_ext
	p_next                    voidptr
	acquire_unmodified_memory Bool32
}

pub const ext_extended_dynamic_state_3_spec_version = 2
pub const ext_extended_dynamic_state_3_extension_name = 'VK_EXT_extended_dynamic_state3'

pub struct PhysicalDeviceExtendedDynamicState3FeaturesEXT {
pub mut:
	s_type                                                      StructureType = StructureType.structure_type_physical_device_extended_dynamic_state3_features_ext
	p_next                                                      voidptr
	extended_dynamic_state3_tessellation_domain_origin          Bool32
	extended_dynamic_state3_depth_clamp_enable                  Bool32
	extended_dynamic_state3_polygon_mode                        Bool32
	extended_dynamic_state3_rasterization_samples               Bool32
	extended_dynamic_state3_sample_mask                         Bool32
	extended_dynamic_state3_alpha_to_coverage_enable            Bool32
	extended_dynamic_state3_alpha_to_one_enable                 Bool32
	extended_dynamic_state3_logic_op_enable                     Bool32
	extended_dynamic_state3_color_blend_enable                  Bool32
	extended_dynamic_state3_color_blend_equation                Bool32
	extended_dynamic_state3_color_write_mask                    Bool32
	extended_dynamic_state3_rasterization_stream                Bool32
	extended_dynamic_state3_conservative_rasterization_mode     Bool32
	extended_dynamic_state3_extra_primitive_overestimation_size Bool32
	extended_dynamic_state3_depth_clip_enable                   Bool32
	extended_dynamic_state3_sample_locations_enable             Bool32
	extended_dynamic_state3_color_blend_advanced                Bool32
	extended_dynamic_state3_provoking_vertex_mode               Bool32
	extended_dynamic_state3_line_rasterization_mode             Bool32
	extended_dynamic_state3_line_stipple_enable                 Bool32
	extended_dynamic_state3_depth_clip_negative_one_to_one      Bool32
	extended_dynamic_state3_viewport_w_scaling_enable           Bool32
	extended_dynamic_state3_viewport_swizzle                    Bool32
	extended_dynamic_state3_coverage_to_color_enable            Bool32
	extended_dynamic_state3_coverage_to_color_location          Bool32
	extended_dynamic_state3_coverage_modulation_mode            Bool32
	extended_dynamic_state3_coverage_modulation_table_enable    Bool32
	extended_dynamic_state3_coverage_modulation_table           Bool32
	extended_dynamic_state3_coverage_reduction_mode             Bool32
	extended_dynamic_state3_representative_fragment_test_enable Bool32
	extended_dynamic_state3_shading_rate_image_enable           Bool32
}

pub struct PhysicalDeviceExtendedDynamicState3PropertiesEXT {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_extended_dynamic_state3_properties_ext
	p_next                                  voidptr
	dynamic_primitive_topology_unrestricted Bool32
}

pub struct ColorBlendEquationEXT {
pub mut:
	src_color_blend_factor BlendFactor
	dst_color_blend_factor BlendFactor
	color_blend_op         BlendOp
	src_alpha_blend_factor BlendFactor
	dst_alpha_blend_factor BlendFactor
	alpha_blend_op         BlendOp
}

pub struct ColorBlendAdvancedEXT {
pub mut:
	advanced_blend_op BlendOp
	src_premultiplied Bool32
	dst_premultiplied Bool32
	blend_overlap     BlendOverlapEXT
	clamp_results     Bool32
}

fn C.vkCmdSetDepthClampEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_clamp_enable_ext(command_buffer C.CommandBuffer,
	depth_clamp_enable Bool32) {
	C.vkCmdSetDepthClampEnableEXT(command_buffer, depth_clamp_enable)
}

fn C.vkCmdSetPolygonModeEXT(C.CommandBuffer,
	PolygonMode)
pub fn cmd_set_polygon_mode_ext(command_buffer C.CommandBuffer,
	polygon_mode PolygonMode) {
	C.vkCmdSetPolygonModeEXT(command_buffer, polygon_mode)
}

fn C.vkCmdSetRasterizationSamplesEXT(C.CommandBuffer,
	SampleCountFlagBits)
pub fn cmd_set_rasterization_samples_ext(command_buffer C.CommandBuffer,
	rasterization_samples SampleCountFlagBits) {
	C.vkCmdSetRasterizationSamplesEXT(command_buffer, rasterization_samples)
}

fn C.vkCmdSetSampleMaskEXT(C.CommandBuffer,
	SampleCountFlagBits,
	&SampleMask)
pub fn cmd_set_sample_mask_ext(command_buffer C.CommandBuffer,
	samples SampleCountFlagBits,
	p_sample_mask &SampleMask) {
	C.vkCmdSetSampleMaskEXT(command_buffer, samples, p_sample_mask)
}

fn C.vkCmdSetAlphaToCoverageEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_alpha_to_coverage_enable_ext(command_buffer C.CommandBuffer,
	alpha_to_coverage_enable Bool32) {
	C.vkCmdSetAlphaToCoverageEnableEXT(command_buffer, alpha_to_coverage_enable)
}

fn C.vkCmdSetAlphaToOneEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_alpha_to_one_enable_ext(command_buffer C.CommandBuffer,
	alpha_to_one_enable Bool32) {
	C.vkCmdSetAlphaToOneEnableEXT(command_buffer, alpha_to_one_enable)
}

fn C.vkCmdSetLogicOpEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_logic_op_enable_ext(command_buffer C.CommandBuffer,
	logic_op_enable Bool32) {
	C.vkCmdSetLogicOpEnableEXT(command_buffer, logic_op_enable)
}

fn C.vkCmdSetColorBlendEnableEXT(C.CommandBuffer,
	u32,
	u32,
	&Bool32)
pub fn cmd_set_color_blend_enable_ext(command_buffer C.CommandBuffer,
	first_attachment u32,
	attachment_count u32,
	p_color_blend_enables &Bool32) {
	C.vkCmdSetColorBlendEnableEXT(command_buffer, first_attachment, attachment_count,
		p_color_blend_enables)
}

fn C.vkCmdSetColorBlendEquationEXT(C.CommandBuffer,
	u32,
	u32,
	&ColorBlendEquationEXT)
pub fn cmd_set_color_blend_equation_ext(command_buffer C.CommandBuffer,
	first_attachment u32,
	attachment_count u32,
	p_color_blend_equations &ColorBlendEquationEXT) {
	C.vkCmdSetColorBlendEquationEXT(command_buffer, first_attachment, attachment_count,
		p_color_blend_equations)
}

fn C.vkCmdSetColorWriteMaskEXT(C.CommandBuffer,
	u32,
	u32,
	&ColorComponentFlags)
pub fn cmd_set_color_write_mask_ext(command_buffer C.CommandBuffer,
	first_attachment u32,
	attachment_count u32,
	p_color_write_masks &ColorComponentFlags) {
	C.vkCmdSetColorWriteMaskEXT(command_buffer, first_attachment, attachment_count, p_color_write_masks)
}

fn C.vkCmdSetTessellationDomainOriginEXT(C.CommandBuffer,
	TessellationDomainOrigin)
pub fn cmd_set_tessellation_domain_origin_ext(command_buffer C.CommandBuffer,
	domain_origin TessellationDomainOrigin) {
	C.vkCmdSetTessellationDomainOriginEXT(command_buffer, domain_origin)
}

fn C.vkCmdSetRasterizationStreamEXT(C.CommandBuffer,
	u32)
pub fn cmd_set_rasterization_stream_ext(command_buffer C.CommandBuffer,
	rasterization_stream u32) {
	C.vkCmdSetRasterizationStreamEXT(command_buffer, rasterization_stream)
}

fn C.vkCmdSetConservativeRasterizationModeEXT(C.CommandBuffer,
	ConservativeRasterizationModeEXT)
pub fn cmd_set_conservative_rasterization_mode_ext(command_buffer C.CommandBuffer,
	conservative_rasterization_mode ConservativeRasterizationModeEXT) {
	C.vkCmdSetConservativeRasterizationModeEXT(command_buffer, conservative_rasterization_mode)
}

fn C.vkCmdSetExtraPrimitiveOverestimationSizeEXT(C.CommandBuffer,
	f32)
pub fn cmd_set_extra_primitive_overestimation_size_ext(command_buffer C.CommandBuffer,
	extra_primitive_overestimation_size f32) {
	C.vkCmdSetExtraPrimitiveOverestimationSizeEXT(command_buffer, extra_primitive_overestimation_size)
}

fn C.vkCmdSetDepthClipEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_clip_enable_ext(command_buffer C.CommandBuffer,
	depth_clip_enable Bool32) {
	C.vkCmdSetDepthClipEnableEXT(command_buffer, depth_clip_enable)
}

fn C.vkCmdSetSampleLocationsEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_sample_locations_enable_ext(command_buffer C.CommandBuffer,
	sample_locations_enable Bool32) {
	C.vkCmdSetSampleLocationsEnableEXT(command_buffer, sample_locations_enable)
}

fn C.vkCmdSetColorBlendAdvancedEXT(C.CommandBuffer,
	u32,
	u32,
	&ColorBlendAdvancedEXT)
pub fn cmd_set_color_blend_advanced_ext(command_buffer C.CommandBuffer,
	first_attachment u32,
	attachment_count u32,
	p_color_blend_advanced &ColorBlendAdvancedEXT) {
	C.vkCmdSetColorBlendAdvancedEXT(command_buffer, first_attachment, attachment_count,
		p_color_blend_advanced)
}

fn C.vkCmdSetProvokingVertexModeEXT(C.CommandBuffer,
	ProvokingVertexModeEXT)
pub fn cmd_set_provoking_vertex_mode_ext(command_buffer C.CommandBuffer,
	provoking_vertex_mode ProvokingVertexModeEXT) {
	C.vkCmdSetProvokingVertexModeEXT(command_buffer, provoking_vertex_mode)
}

fn C.vkCmdSetLineRasterizationModeEXT(C.CommandBuffer,
	LineRasterizationModeEXT)
pub fn cmd_set_line_rasterization_mode_ext(command_buffer C.CommandBuffer,
	line_rasterization_mode LineRasterizationModeEXT) {
	C.vkCmdSetLineRasterizationModeEXT(command_buffer, line_rasterization_mode)
}

fn C.vkCmdSetLineStippleEnableEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_line_stipple_enable_ext(command_buffer C.CommandBuffer,
	stippled_line_enable Bool32) {
	C.vkCmdSetLineStippleEnableEXT(command_buffer, stippled_line_enable)
}

fn C.vkCmdSetDepthClipNegativeOneToOneEXT(C.CommandBuffer,
	Bool32)
pub fn cmd_set_depth_clip_negative_one_to_one_ext(command_buffer C.CommandBuffer,
	negative_one_to_one Bool32) {
	C.vkCmdSetDepthClipNegativeOneToOneEXT(command_buffer, negative_one_to_one)
}

fn C.vkCmdSetViewportWScalingEnableNV(C.CommandBuffer,
	Bool32)
pub fn cmd_set_viewport_w_scaling_enable_nv(command_buffer C.CommandBuffer,
	viewport_w_scaling_enable Bool32) {
	C.vkCmdSetViewportWScalingEnableNV(command_buffer, viewport_w_scaling_enable)
}

fn C.vkCmdSetViewportSwizzleNV(C.CommandBuffer,
	u32,
	u32,
	&ViewportSwizzleNV)
pub fn cmd_set_viewport_swizzle_nv(command_buffer C.CommandBuffer,
	first_viewport u32,
	viewport_count u32,
	p_viewport_swizzles &ViewportSwizzleNV) {
	C.vkCmdSetViewportSwizzleNV(command_buffer, first_viewport, viewport_count, p_viewport_swizzles)
}

fn C.vkCmdSetCoverageToColorEnableNV(C.CommandBuffer,
	Bool32)
pub fn cmd_set_coverage_to_color_enable_nv(command_buffer C.CommandBuffer,
	coverage_to_color_enable Bool32) {
	C.vkCmdSetCoverageToColorEnableNV(command_buffer, coverage_to_color_enable)
}

fn C.vkCmdSetCoverageToColorLocationNV(C.CommandBuffer,
	u32)
pub fn cmd_set_coverage_to_color_location_nv(command_buffer C.CommandBuffer,
	coverage_to_color_location u32) {
	C.vkCmdSetCoverageToColorLocationNV(command_buffer, coverage_to_color_location)
}

fn C.vkCmdSetCoverageModulationModeNV(C.CommandBuffer,
	CoverageModulationModeNV)
pub fn cmd_set_coverage_modulation_mode_nv(command_buffer C.CommandBuffer,
	coverage_modulation_mode CoverageModulationModeNV) {
	C.vkCmdSetCoverageModulationModeNV(command_buffer, coverage_modulation_mode)
}

fn C.vkCmdSetCoverageModulationTableEnableNV(C.CommandBuffer,
	Bool32)
pub fn cmd_set_coverage_modulation_table_enable_nv(command_buffer C.CommandBuffer,
	coverage_modulation_table_enable Bool32) {
	C.vkCmdSetCoverageModulationTableEnableNV(command_buffer, coverage_modulation_table_enable)
}

fn C.vkCmdSetCoverageModulationTableNV(C.CommandBuffer,
	u32,
	&f32)
pub fn cmd_set_coverage_modulation_table_nv(command_buffer C.CommandBuffer,
	coverage_modulation_table_count u32,
	p_coverage_modulation_table &f32) {
	C.vkCmdSetCoverageModulationTableNV(command_buffer, coverage_modulation_table_count,
		p_coverage_modulation_table)
}

fn C.vkCmdSetShadingRateImageEnableNV(C.CommandBuffer,
	Bool32)
pub fn cmd_set_shading_rate_image_enable_nv(command_buffer C.CommandBuffer,
	shading_rate_image_enable Bool32) {
	C.vkCmdSetShadingRateImageEnableNV(command_buffer, shading_rate_image_enable)
}

fn C.vkCmdSetRepresentativeFragmentTestEnableNV(C.CommandBuffer,
	Bool32)
pub fn cmd_set_representative_fragment_test_enable_nv(command_buffer C.CommandBuffer,
	representative_fragment_test_enable Bool32) {
	C.vkCmdSetRepresentativeFragmentTestEnableNV(command_buffer, representative_fragment_test_enable)
}

fn C.vkCmdSetCoverageReductionModeNV(C.CommandBuffer,
	CoverageReductionModeNV)
pub fn cmd_set_coverage_reduction_mode_nv(command_buffer C.CommandBuffer,
	coverage_reduction_mode CoverageReductionModeNV) {
	C.vkCmdSetCoverageReductionModeNV(command_buffer, coverage_reduction_mode)
}

pub const ext_subpass_merge_feedback_spec_version = 2
pub const ext_subpass_merge_feedback_extension_name = 'VK_EXT_subpass_merge_feedback'

pub enum SubpassMergeStatusEXT {
	subpass_merge_status_merged_ext                                   = int(0)
	subpass_merge_status_disallowed_ext                               = int(1)
	subpass_merge_status_not_merged_side_effects_ext                  = int(2)
	subpass_merge_status_not_merged_samples_mismatch_ext              = int(3)
	subpass_merge_status_not_merged_views_mismatch_ext                = int(4)
	subpass_merge_status_not_merged_aliasing_ext                      = int(5)
	subpass_merge_status_not_merged_dependencies_ext                  = int(6)
	subpass_merge_status_not_merged_incompatible_input_attachment_ext = int(7)
	subpass_merge_status_not_merged_too_many_attachments_ext          = int(8)
	subpass_merge_status_not_merged_insufficient_storage_ext          = int(9)
	subpass_merge_status_not_merged_depth_stencil_count_ext           = int(10)
	subpass_merge_status_not_merged_resolve_attachment_reuse_ext      = int(11)
	subpass_merge_status_not_merged_single_subpass_ext                = int(12)
	subpass_merge_status_not_merged_unspecified_ext                   = int(13)
	subpass_merge_status_max_enum_ext                                 = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceSubpassMergeFeedbackFeaturesEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_subpass_merge_feedback_features_ext
	p_next                 voidptr
	subpass_merge_feedback Bool32
}

pub struct RenderPassCreationControlEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_render_pass_creation_control_ext
	p_next           voidptr
	disallow_merging Bool32
}

pub struct RenderPassCreationFeedbackInfoEXT {
pub mut:
	post_merge_subpass_count u32
}

pub struct RenderPassCreationFeedbackCreateInfoEXT {
pub mut:
	s_type                 StructureType = StructureType.structure_type_render_pass_creation_feedback_create_info_ext
	p_next                 voidptr
	p_render_pass_feedback &RenderPassCreationFeedbackInfoEXT
}

pub struct RenderPassSubpassFeedbackInfoEXT {
pub mut:
	subpass_merge_status SubpassMergeStatusEXT
	description          [max_description_size]char
	post_merge_index     u32
}

pub struct RenderPassSubpassFeedbackCreateInfoEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_render_pass_subpass_feedback_create_info_ext
	p_next             voidptr
	p_subpass_feedback &RenderPassSubpassFeedbackInfoEXT
}

pub const lunarg_direct_driver_loading_spec_version = 1
pub const lunarg_direct_driver_loading_extension_name = 'VK_NARG_direct_driver_loading'

pub enum DirectDriverLoadingModeLUNARG {
	direct_driver_loading_mode_exclusive_lunarg = int(0)
	direct_driver_loading_mode_inclusive_lunarg = int(1)
	direct_driver_loading_mode_max_enum_lunarg  = int(0x7FFFFFFF)
}

pub type DirectDriverLoadingFlagsLUNARG = u32
pub type PFN_vkGetInstanceProcAddrLUNARG = fn (instanceconst C.Instance, pName &char)

pub struct DirectDriverLoadingInfoLUNARG {
pub mut:
	s_type                     StructureType = StructureType.structure_type_direct_driver_loading_info_lunarg
	p_next                     voidptr
	flags                      DirectDriverLoadingFlagsLUNARG
	pfn_get_instance_proc_addr PFN_vkGetInstanceProcAddrLUNARG = unsafe { nil }
}

pub struct DirectDriverLoadingListLUNARG {
pub mut:
	s_type       StructureType = StructureType.structure_type_direct_driver_loading_list_lunarg
	p_next       voidptr
	mode         DirectDriverLoadingModeLUNARG
	driver_count u32
	p_drivers    &DirectDriverLoadingInfoLUNARG
}

pub const max_shader_module_identifier_size_ext = u32(32)
pub const ext_shader_module_identifier_spec_version = 1
pub const ext_shader_module_identifier_extension_name = 'VK_EXT_shader_module_identifier'

pub struct PhysicalDeviceShaderModuleIdentifierFeaturesEXT {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_shader_module_identifier_features_ext
	p_next                   voidptr
	shader_module_identifier Bool32
}

pub struct PhysicalDeviceShaderModuleIdentifierPropertiesEXT {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_shader_module_identifier_properties_ext
	p_next                                  voidptr
	shader_module_identifier_algorithm_uuid [uuid_size]u8
}

pub struct PipelineShaderStageModuleIdentifierCreateInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_pipeline_shader_stage_module_identifier_create_info_ext
	p_next          voidptr
	identifier_size u32
	p_identifier    &u8
}

pub struct ShaderModuleIdentifierEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_shader_module_identifier_ext
	p_next          voidptr
	identifier_size u32
	identifier      [max_shader_module_identifier_size_ext]u8
}

fn C.vkGetShaderModuleIdentifierEXT(C.Device,
	C.ShaderModule,
	&ShaderModuleIdentifierEXT)
pub fn get_shader_module_identifier_ext(device C.Device,
	shader_module C.ShaderModule,
	p_identifier &ShaderModuleIdentifierEXT) {
	C.vkGetShaderModuleIdentifierEXT(device, shader_module, p_identifier)
}

fn C.vkGetShaderModuleCreateInfoIdentifierEXT(C.Device,
	&ShaderModuleCreateInfo,
	&ShaderModuleIdentifierEXT)
pub fn get_shader_module_create_info_identifier_ext(device C.Device,
	p_create_info &ShaderModuleCreateInfo,
	p_identifier &ShaderModuleIdentifierEXT) {
	C.vkGetShaderModuleCreateInfoIdentifierEXT(device, p_create_info, p_identifier)
}

pub const ext_rasterization_order_attachment_access_spec_version = 1
pub const ext_rasterization_order_attachment_access_extension_name = 'VK_EXT_rasterization_order_attachment_access'

pub type C.OpticalFlowSessionNV = voidptr

pub const nv_optical_flow_spec_version = 1
pub const nv_optical_flow_extension_name = 'VK_NV_optical_flow'

pub enum OpticalFlowPerformanceLevelNV {
	optical_flow_performance_level_unknown_nv  = int(0)
	optical_flow_performance_level_slow_nv     = int(1)
	optical_flow_performance_level_medium_nv   = int(2)
	optical_flow_performance_level_fast_nv     = int(3)
	optical_flow_performance_level_max_enum_nv = int(0x7FFFFFFF)
}

pub enum OpticalFlowSessionBindingPointNV {
	optical_flow_session_binding_point_unknown_nv              = int(0)
	optical_flow_session_binding_point_input_nv                = int(1)
	optical_flow_session_binding_point_reference_nv            = int(2)
	optical_flow_session_binding_point_hint_nv                 = int(3)
	optical_flow_session_binding_point_flow_vector_nv          = int(4)
	optical_flow_session_binding_point_backward_flow_vector_nv = int(5)
	optical_flow_session_binding_point_cost_nv                 = int(6)
	optical_flow_session_binding_point_backward_cost_nv        = int(7)
	optical_flow_session_binding_point_global_flow_nv          = int(8)
	optical_flow_session_binding_point_max_enum_nv             = int(0x7FFFFFFF)
}

pub enum OpticalFlowGridSizeFlagBitsNV {
	optical_flow_grid_size_unknown_nv            = int(0)
	optical_flow_grid_size1x1_bit_nv             = int(0x00000001)
	optical_flow_grid_size2x2_bit_nv             = int(0x00000002)
	optical_flow_grid_size4x4_bit_nv             = int(0x00000004)
	optical_flow_grid_size8x8_bit_nv             = int(0x00000008)
	optical_flow_grid_size_flag_bits_max_enum_nv = int(0x7FFFFFFF)
}

pub type OpticalFlowGridSizeFlagsNV = u32

pub enum OpticalFlowUsageFlagBitsNV {
	optical_flow_usage_unknown_nv            = int(0)
	optical_flow_usage_input_bit_nv          = int(0x00000001)
	optical_flow_usage_output_bit_nv         = int(0x00000002)
	optical_flow_usage_hint_bit_nv           = int(0x00000004)
	optical_flow_usage_cost_bit_nv           = int(0x00000008)
	optical_flow_usage_global_flow_bit_nv    = int(0x00000010)
	optical_flow_usage_flag_bits_max_enum_nv = int(0x7FFFFFFF)
}

pub type OpticalFlowUsageFlagsNV = u32

pub enum OpticalFlowSessionCreateFlagBitsNV {
	optical_flow_session_create_enable_hint_bit_nv        = int(0x00000001)
	optical_flow_session_create_enable_cost_bit_nv        = int(0x00000002)
	optical_flow_session_create_enable_global_flow_bit_nv = int(0x00000004)
	optical_flow_session_create_allow_regions_bit_nv      = int(0x00000008)
	optical_flow_session_create_both_directions_bit_nv    = int(0x00000010)
	optical_flow_session_create_flag_bits_max_enum_nv     = int(0x7FFFFFFF)
}

pub type OpticalFlowSessionCreateFlagsNV = u32

pub enum OpticalFlowExecuteFlagBitsNV {
	optical_flow_execute_disable_temporal_hints_bit_nv = int(0x00000001)
	optical_flow_execute_flag_bits_max_enum_nv         = int(0x7FFFFFFF)
}

pub type OpticalFlowExecuteFlagsNV = u32

pub struct PhysicalDeviceOpticalFlowFeaturesNV {
pub mut:
	s_type       StructureType = StructureType.structure_type_physical_device_optical_flow_features_nv
	p_next       voidptr
	optical_flow Bool32
}

pub struct PhysicalDeviceOpticalFlowPropertiesNV {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_optical_flow_properties_nv
	p_next                       voidptr
	supported_output_grid_sizes  OpticalFlowGridSizeFlagsNV
	supported_hint_grid_sizes    OpticalFlowGridSizeFlagsNV
	hint_supported               Bool32
	cost_supported               Bool32
	bidirectional_flow_supported Bool32
	global_flow_supported        Bool32
	min_width                    u32
	min_height                   u32
	max_width                    u32
	max_height                   u32
	max_num_regions_of_interest  u32
}

pub struct OpticalFlowImageFormatInfoNV {
pub mut:
	s_type StructureType = StructureType.structure_type_optical_flow_image_format_info_nv
	p_next voidptr
	usage  OpticalFlowUsageFlagsNV
}

pub struct OpticalFlowImageFormatPropertiesNV {
pub mut:
	s_type StructureType = StructureType.structure_type_optical_flow_image_format_properties_nv
	p_next voidptr
	format Format
}

pub struct OpticalFlowSessionCreateInfoNV {
pub mut:
	s_type             StructureType = StructureType.structure_type_optical_flow_session_create_info_nv
	p_next             voidptr
	width              u32
	height             u32
	image_format       Format
	flow_vector_format Format
	cost_format        Format
	output_grid_size   OpticalFlowGridSizeFlagsNV
	hint_grid_size     OpticalFlowGridSizeFlagsNV
	performance_level  OpticalFlowPerformanceLevelNV
	flags              OpticalFlowSessionCreateFlagsNV
}

pub struct OpticalFlowSessionCreatePrivateDataInfoNV {
pub mut:
	s_type         StructureType = StructureType.structure_type_optical_flow_session_create_private_data_info_nv
	p_next         voidptr
	id             u32
	size           u32
	p_private_data voidptr
}

pub struct OpticalFlowExecuteInfoNV {
pub mut:
	s_type       StructureType = StructureType.structure_type_optical_flow_execute_info_nv
	p_next       voidptr
	flags        OpticalFlowExecuteFlagsNV
	region_count u32
	p_regions    &Rect2D
}

fn C.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(C.PhysicalDevice,
	&OpticalFlowImageFormatInfoNV,
	&u32,
	&OpticalFlowImageFormatPropertiesNV) Result
pub fn get_physical_device_optical_flow_image_formats_nv(physical_device C.PhysicalDevice,
	p_optical_flow_image_format_info &OpticalFlowImageFormatInfoNV,
	p_format_count &u32,
	p_image_format_properties &OpticalFlowImageFormatPropertiesNV) Result {
	return C.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(physical_device, p_optical_flow_image_format_info,
		p_format_count, p_image_format_properties)
}

fn C.vkCreateOpticalFlowSessionNV(C.Device,
	&OpticalFlowSessionCreateInfoNV,
	&AllocationCallbacks,
	&C.OpticalFlowSessionNV) Result
pub fn create_optical_flow_session_nv(device C.Device,
	p_create_info &OpticalFlowSessionCreateInfoNV,
	p_allocator &AllocationCallbacks,
	p_session &C.OpticalFlowSessionNV) Result {
	return C.vkCreateOpticalFlowSessionNV(device, p_create_info, p_allocator, p_session)
}

fn C.vkDestroyOpticalFlowSessionNV(C.Device,
	C.OpticalFlowSessionNV,
	&AllocationCallbacks)
pub fn destroy_optical_flow_session_nv(device C.Device,
	session C.OpticalFlowSessionNV,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyOpticalFlowSessionNV(device, session, p_allocator)
}

fn C.vkBindOpticalFlowSessionImageNV(C.Device,
	C.OpticalFlowSessionNV,
	OpticalFlowSessionBindingPointNV,
	C.ImageView,
	ImageLayout) Result
pub fn bind_optical_flow_session_image_nv(device C.Device,
	session C.OpticalFlowSessionNV,
	binding_point OpticalFlowSessionBindingPointNV,
	view C.ImageView,
	layout ImageLayout) Result {
	return C.vkBindOpticalFlowSessionImageNV(device, session, binding_point, view, layout)
}

fn C.vkCmdOpticalFlowExecuteNV(C.CommandBuffer,
	C.OpticalFlowSessionNV,
	&OpticalFlowExecuteInfoNV)
pub fn cmd_optical_flow_execute_nv(command_buffer C.CommandBuffer,
	session C.OpticalFlowSessionNV,
	p_execute_info &OpticalFlowExecuteInfoNV) {
	C.vkCmdOpticalFlowExecuteNV(command_buffer, session, p_execute_info)
}

pub const ext_legacy_dithering_spec_version = 2
pub const ext_legacy_dithering_extension_name = 'VK_EXT_legacy_dithering'

pub struct PhysicalDeviceLegacyDitheringFeaturesEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_physical_device_legacy_dithering_features_ext
	p_next           voidptr
	legacy_dithering Bool32
}

pub const ext_pipeline_protected_access_spec_version = 1
pub const ext_pipeline_protected_access_extension_name = 'VK_EXT_pipeline_protected_access'

pub struct PhysicalDevicePipelineProtectedAccessFeaturesEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_physical_device_pipeline_protected_access_features_ext
	p_next                    voidptr
	pipeline_protected_access Bool32
}

pub const amd_anti_lag_spec_version = 1
pub const amd_anti_lag_extension_name = 'VK_AMD_anti_lag'

pub enum AntiLagModeAMD {
	anti_lag_mode_driver_control_amd = int(0)
	anti_lag_mode_on_amd             = int(1)
	anti_lag_mode_off_amd            = int(2)
	anti_lag_mode_max_enum_amd       = int(0x7FFFFFFF)
}

pub enum AntiLagStageAMD {
	anti_lag_stage_input_amd    = int(0)
	anti_lag_stage_present_amd  = int(1)
	anti_lag_stage_max_enum_amd = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceAntiLagFeaturesAMD {
pub mut:
	s_type   StructureType = StructureType.structure_type_physical_device_anti_lag_features_amd
	p_next   voidptr
	anti_lag Bool32
}

pub struct AntiLagPresentationInfoAMD {
pub mut:
	s_type      StructureType = StructureType.structure_type_anti_lag_presentation_info_amd
	p_next      voidptr
	stage       AntiLagStageAMD
	frame_index u64
}

pub struct AntiLagDataAMD {
pub mut:
	s_type              StructureType = StructureType.structure_type_anti_lag_data_amd
	p_next              voidptr
	mode                AntiLagModeAMD
	max_fps             u32
	p_presentation_info &AntiLagPresentationInfoAMD
}

fn C.vkAntiLagUpdateAMD(C.Device,
	&AntiLagDataAMD)
pub fn anti_lag_update_amd(device C.Device,
	p_data &AntiLagDataAMD) {
	C.vkAntiLagUpdateAMD(device, p_data)
}

pub type C.ShaderEXT = voidptr

pub const ext_shader_object_spec_version = 1
pub const ext_shader_object_extension_name = 'VK_EXT_shader_object'

pub enum ShaderCodeTypeEXT {
	shader_code_type_binary_ext   = int(0)
	shader_code_type_spirv_ext    = int(1)
	shader_code_type_max_enum_ext = int(0x7FFFFFFF)
}

pub enum DepthClampModeEXT {
	depth_clamp_mode_viewport_range_ext     = int(0)
	depth_clamp_mode_user_defined_range_ext = int(1)
	depth_clamp_mode_max_enum_ext           = int(0x7FFFFFFF)
}

pub enum ShaderCreateFlagBitsEXT {
	shader_create_link_stage_bit_ext                       = int(0x00000001)
	shader_create_allow_varying_subgroup_size_bit_ext      = int(0x00000002)
	shader_create_require_full_subgroups_bit_ext           = int(0x00000004)
	shader_create_no_task_shader_bit_ext                   = int(0x00000008)
	shader_create_dispatch_base_bit_ext                    = int(0x00000010)
	shader_create_fragment_shading_rate_attachment_bit_ext = int(0x00000020)
	shader_create_fragment_density_map_attachment_bit_ext  = int(0x00000040)
	shader_create_indirect_bindable_bit_ext                = int(0x00000080)
	shader_create_flag_bits_max_enum_ext                   = int(0x7FFFFFFF)
}

pub type ShaderCreateFlagsEXT = u32

pub struct PhysicalDeviceShaderObjectFeaturesEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_physical_device_shader_object_features_ext
	p_next        voidptr
	shader_object Bool32
}

pub struct PhysicalDeviceShaderObjectPropertiesEXT {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_shader_object_properties_ext
	p_next                voidptr
	shader_binary_uuid    [uuid_size]u8
	shader_binary_version u32
}

pub struct ShaderCreateInfoEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_shader_create_info_ext
	p_next                    voidptr
	flags                     ShaderCreateFlagsEXT
	stage                     ShaderStageFlagBits
	next_stage                ShaderStageFlags
	code_type                 ShaderCodeTypeEXT
	code_size                 usize
	p_code                    voidptr
	p_name                    &char
	set_layout_count          u32
	p_set_layouts             &C.DescriptorSetLayout
	push_constant_range_count u32
	p_push_constant_ranges    &PushConstantRange
	p_specialization_info     &SpecializationInfo
}

pub type ShaderRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo

pub struct DepthClampRangeEXT {
pub mut:
	min_depth_clamp f32
	max_depth_clamp f32
}

fn C.vkCreateShadersEXT(C.Device,
	u32,
	&ShaderCreateInfoEXT,
	&AllocationCallbacks,
	&C.ShaderEXT) Result
pub fn create_shaders_ext(device C.Device,
	create_info_count u32,
	p_create_infos &ShaderCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_shaders &C.ShaderEXT) Result {
	return C.vkCreateShadersEXT(device, create_info_count, p_create_infos, p_allocator,
		p_shaders)
}

fn C.vkDestroyShaderEXT(C.Device,
	C.ShaderEXT,
	&AllocationCallbacks)
pub fn destroy_shader_ext(device C.Device,
	shader C.ShaderEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyShaderEXT(device, shader, p_allocator)
}

fn C.vkGetShaderBinaryDataEXT(C.Device,
	C.ShaderEXT,
	&usize,
	voidptr) Result
pub fn get_shader_binary_data_ext(device C.Device,
	shader C.ShaderEXT,
	p_data_size &usize,
	p_data voidptr) Result {
	return C.vkGetShaderBinaryDataEXT(device, shader, p_data_size, p_data)
}

fn C.vkCmdBindShadersEXT(C.CommandBuffer,
	u32,
	&ShaderStageFlagBits,
	&C.ShaderEXT)
pub fn cmd_bind_shaders_ext(command_buffer C.CommandBuffer,
	stage_count u32,
	p_stages &ShaderStageFlagBits,
	p_shaders &C.ShaderEXT) {
	C.vkCmdBindShadersEXT(command_buffer, stage_count, p_stages, p_shaders)
}

fn C.vkCmdSetDepthClampRangeEXT(C.CommandBuffer,
	DepthClampModeEXT,
	&DepthClampRangeEXT)
pub fn cmd_set_depth_clamp_range_ext(command_buffer C.CommandBuffer,
	depth_clamp_mode DepthClampModeEXT,
	p_depth_clamp_range &DepthClampRangeEXT) {
	C.vkCmdSetDepthClampRangeEXT(command_buffer, depth_clamp_mode, p_depth_clamp_range)
}

pub const qcom_tile_properties_spec_version = 1
pub const qcom_tile_properties_extension_name = 'VK_QCOM_tile_properties'

pub struct PhysicalDeviceTilePropertiesFeaturesQCOM {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_tile_properties_features_qcom
	p_next          voidptr
	tile_properties Bool32
}

pub struct TilePropertiesQCOM {
pub mut:
	s_type     StructureType = StructureType.structure_type_tile_properties_qcom
	p_next     voidptr
	tile_size  Extent3D
	apron_size Extent2D
	origin     Offset2D
}

fn C.vkGetFramebufferTilePropertiesQCOM(C.Device,
	C.Framebuffer,
	&u32,
	&TilePropertiesQCOM) Result
pub fn get_framebuffer_tile_properties_qcom(device C.Device,
	framebuffer C.Framebuffer,
	p_properties_count &u32,
	p_properties &TilePropertiesQCOM) Result {
	return C.vkGetFramebufferTilePropertiesQCOM(device, framebuffer, p_properties_count,
		p_properties)
}

fn C.vkGetDynamicRenderingTilePropertiesQCOM(C.Device,
	&RenderingInfo,
	&TilePropertiesQCOM) Result
pub fn get_dynamic_rendering_tile_properties_qcom(device C.Device,
	p_rendering_info &RenderingInfo,
	p_properties &TilePropertiesQCOM) Result {
	return C.vkGetDynamicRenderingTilePropertiesQCOM(device, p_rendering_info, p_properties)
}

pub const sec_amigo_profiling_spec_version = 1
pub const sec_amigo_profiling_extension_name = 'VK_SEC_amigo_profiling'

pub struct PhysicalDeviceAmigoProfilingFeaturesSEC {
pub mut:
	s_type          StructureType = StructureType.structure_type_physical_device_amigo_profiling_features_sec
	p_next          voidptr
	amigo_profiling Bool32
}

pub struct AmigoProfilingSubmitInfoSEC {
pub mut:
	s_type                StructureType = StructureType.structure_type_amigo_profiling_submit_info_sec
	p_next                voidptr
	first_draw_timestamp  u64
	swap_buffer_timestamp u64
}

pub const qcom_multiview_per_view_viewports_spec_version = 1
pub const qcom_multiview_per_view_viewports_extension_name = 'VK_QCOM_multiview_per_view_viewports'

pub struct PhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_multiview_per_view_viewports_features_qcom
	p_next                       voidptr
	multiview_per_view_viewports Bool32
}

pub const nv_ray_tracing_invocation_reorder_spec_version = 1
pub const nv_ray_tracing_invocation_reorder_extension_name = 'VK_NV_ray_tracing_invocation_reorder'

pub enum RayTracingInvocationReorderModeNV {
	ray_tracing_invocation_reorder_mode_none_nv     = int(0)
	ray_tracing_invocation_reorder_mode_reorder_nv  = int(1)
	ray_tracing_invocation_reorder_mode_max_enum_nv = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceRayTracingInvocationReorderPropertiesNV {
pub mut:
	s_type                                         StructureType = StructureType.structure_type_physical_device_ray_tracing_invocation_reorder_properties_nv
	p_next                                         voidptr
	ray_tracing_invocation_reorder_reordering_hint RayTracingInvocationReorderModeNV
}

pub struct PhysicalDeviceRayTracingInvocationReorderFeaturesNV {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_ray_tracing_invocation_reorder_features_nv
	p_next                         voidptr
	ray_tracing_invocation_reorder Bool32
}

pub const nv_extended_sparse_address_space_spec_version = 1
pub const nv_extended_sparse_address_space_extension_name = 'VK_NV_extended_sparse_address_space'

pub struct PhysicalDeviceExtendedSparseAddressSpaceFeaturesNV {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_extended_sparse_address_space_features_nv
	p_next                        voidptr
	extended_sparse_address_space Bool32
}

pub struct PhysicalDeviceExtendedSparseAddressSpacePropertiesNV {
pub mut:
	s_type                             StructureType = StructureType.structure_type_physical_device_extended_sparse_address_space_properties_nv
	p_next                             voidptr
	extended_sparse_address_space_size DeviceSize
	extended_sparse_image_usage_flags  ImageUsageFlags
	extended_sparse_buffer_usage_flags BufferUsageFlags
}

pub const ext_mutable_descriptor_type_spec_version = 1
pub const ext_mutable_descriptor_type_extension_name = 'VK_EXT_mutable_descriptor_type'

pub const ext_legacy_vertex_attributes_spec_version = 1
pub const ext_legacy_vertex_attributes_extension_name = 'VK_EXT_legacy_vertex_attributes'

pub struct PhysicalDeviceLegacyVertexAttributesFeaturesEXT {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_legacy_vertex_attributes_features_ext
	p_next                   voidptr
	legacy_vertex_attributes Bool32
}

pub struct PhysicalDeviceLegacyVertexAttributesPropertiesEXT {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_legacy_vertex_attributes_properties_ext
	p_next                       voidptr
	native_unaligned_performance Bool32
}

pub const ext_layer_settings_spec_version = 2
pub const ext_layer_settings_extension_name = 'VK_EXT_layer_settings'

pub enum LayerSettingTypeEXT {
	layer_setting_type_bool32_ext   = int(0)
	layer_setting_type_int32_ext    = int(1)
	layer_setting_type_int64_ext    = int(2)
	layer_setting_type_uint32_ext   = int(3)
	layer_setting_type_uint64_ext   = int(4)
	layer_setting_type_float32_ext  = int(5)
	layer_setting_type_float64_ext  = int(6)
	layer_setting_type_string_ext   = int(7)
	layer_setting_type_max_enum_ext = int(0x7FFFFFFF)
}

pub struct LayerSettingEXT {
pub mut:
	p_layer_name   &char
	p_setting_name &char
	vktype         LayerSettingTypeEXT
	value_count    u32
	p_values       voidptr
}

pub struct LayerSettingsCreateInfoEXT {
pub mut:
	s_type        StructureType = StructureType.structure_type_layer_settings_create_info_ext
	p_next        voidptr
	setting_count u32
	p_settings    &LayerSettingEXT
}

pub const arm_shader_core_builtins_spec_version = 2
pub const arm_shader_core_builtins_extension_name = 'VK_ARM_shader_core_builtins'

pub struct PhysicalDeviceShaderCoreBuiltinsFeaturesARM {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_shader_core_builtins_features_arm
	p_next               voidptr
	shader_core_builtins Bool32
}

pub struct PhysicalDeviceShaderCoreBuiltinsPropertiesARM {
pub mut:
	s_type                StructureType = StructureType.structure_type_physical_device_shader_core_builtins_properties_arm
	p_next                voidptr
	shader_core_mask      u64
	shader_core_count     u32
	shader_warps_per_core u32
}

pub const ext_pipeline_library_group_handles_spec_version = 1
pub const ext_pipeline_library_group_handles_extension_name = 'VK_EXT_pipeline_library_group_handles'

pub struct PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_pipeline_library_group_handles_features_ext
	p_next                         voidptr
	pipeline_library_group_handles Bool32
}

pub const ext_dynamic_rendering_unused_attachments_spec_version = 1
pub const ext_dynamic_rendering_unused_attachments_extension_name = 'VK_EXT_dynamic_rendering_unused_attachments'

pub struct PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT {
pub mut:
	s_type                               StructureType = StructureType.structure_type_physical_device_dynamic_rendering_unused_attachments_features_ext
	p_next                               voidptr
	dynamic_rendering_unused_attachments Bool32
}

pub const nv_low_latency_2_spec_version = 2
pub const nv_low_latency_2_extension_name = 'VK_NV_low_latency2'

pub enum LatencyMarkerNV {
	latency_marker_simulation_start_nv               = int(0)
	latency_marker_simulation_end_nv                 = int(1)
	latency_marker_rendersubmit_start_nv             = int(2)
	latency_marker_rendersubmit_end_nv               = int(3)
	latency_marker_present_start_nv                  = int(4)
	latency_marker_present_end_nv                    = int(5)
	latency_marker_input_sample_nv                   = int(6)
	latency_marker_trigger_flash_nv                  = int(7)
	latency_marker_out_of_band_rendersubmit_start_nv = int(8)
	latency_marker_out_of_band_rendersubmit_end_nv   = int(9)
	latency_marker_out_of_band_present_start_nv      = int(10)
	latency_marker_out_of_band_present_end_nv        = int(11)
	latency_marker_max_enum_nv                       = int(0x7FFFFFFF)
}

pub enum OutOfBandQueueTypeNV {
	out_of_band_queue_type_render_nv   = int(0)
	out_of_band_queue_type_present_nv  = int(1)
	out_of_band_queue_type_max_enum_nv = int(0x7FFFFFFF)
}

pub struct LatencySleepModeInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_latency_sleep_mode_info_nv
	p_next              voidptr
	low_latency_mode    Bool32
	low_latency_boost   Bool32
	minimum_interval_us u32
}

pub struct LatencySleepInfoNV {
pub mut:
	s_type           StructureType = StructureType.structure_type_latency_sleep_info_nv
	p_next           voidptr
	signal_semaphore C.Semaphore
	value            u64
}

pub struct SetLatencyMarkerInfoNV {
pub mut:
	s_type     StructureType = StructureType.structure_type_set_latency_marker_info_nv
	p_next     voidptr
	present_id u64
	marker     LatencyMarkerNV
}

pub struct LatencyTimingsFrameReportNV {
pub mut:
	s_type                        StructureType = StructureType.structure_type_latency_timings_frame_report_nv
	p_next                        voidptr
	present_id                    u64
	input_sample_time_us          u64
	sim_start_time_us             u64
	sim_end_time_us               u64
	render_submit_start_time_us   u64
	render_submit_end_time_us     u64
	present_start_time_us         u64
	present_end_time_us           u64
	driver_start_time_us          u64
	driver_end_time_us            u64
	os_render_queue_start_time_us u64
	os_render_queue_end_time_us   u64
	gpu_render_start_time_us      u64
	gpu_render_end_time_us        u64
}

pub struct GetLatencyMarkerInfoNV {
pub mut:
	s_type       StructureType = StructureType.structure_type_get_latency_marker_info_nv
	p_next       voidptr
	timing_count u32
	p_timings    &LatencyTimingsFrameReportNV
}

pub struct LatencySubmissionPresentIdNV {
pub mut:
	s_type     StructureType = StructureType.structure_type_latency_submission_present_id_nv
	p_next     voidptr
	present_id u64
}

pub struct SwapchainLatencyCreateInfoNV {
pub mut:
	s_type              StructureType = StructureType.structure_type_swapchain_latency_create_info_nv
	p_next              voidptr
	latency_mode_enable Bool32
}

pub struct OutOfBandQueueTypeInfoNV {
pub mut:
	s_type     StructureType = StructureType.structure_type_out_of_band_queue_type_info_nv
	p_next     voidptr
	queue_type OutOfBandQueueTypeNV
}

pub struct LatencySurfaceCapabilitiesNV {
pub mut:
	s_type             StructureType = StructureType.structure_type_latency_surface_capabilities_nv
	p_next             voidptr
	present_mode_count u32
	p_present_modes    &PresentModeKHR
}

fn C.vkSetLatencySleepModeNV(C.Device,
	C.SwapchainKHR,
	&LatencySleepModeInfoNV) Result
pub fn set_latency_sleep_mode_nv(device C.Device,
	swapchain C.SwapchainKHR,
	p_sleep_mode_info &LatencySleepModeInfoNV) Result {
	return C.vkSetLatencySleepModeNV(device, swapchain, p_sleep_mode_info)
}

fn C.vkLatencySleepNV(C.Device,
	C.SwapchainKHR,
	&LatencySleepInfoNV) Result
pub fn latency_sleep_nv(device C.Device,
	swapchain C.SwapchainKHR,
	p_sleep_info &LatencySleepInfoNV) Result {
	return C.vkLatencySleepNV(device, swapchain, p_sleep_info)
}

fn C.vkSetLatencyMarkerNV(C.Device,
	C.SwapchainKHR,
	&SetLatencyMarkerInfoNV)
pub fn set_latency_marker_nv(device C.Device,
	swapchain C.SwapchainKHR,
	p_latency_marker_info &SetLatencyMarkerInfoNV) {
	C.vkSetLatencyMarkerNV(device, swapchain, p_latency_marker_info)
}

fn C.vkGetLatencyTimingsNV(C.Device,
	C.SwapchainKHR,
	&GetLatencyMarkerInfoNV)
pub fn get_latency_timings_nv(device C.Device,
	swapchain C.SwapchainKHR,
	p_latency_marker_info &GetLatencyMarkerInfoNV) {
	C.vkGetLatencyTimingsNV(device, swapchain, p_latency_marker_info)
}

fn C.vkQueueNotifyOutOfBandNV(C.Queue,
	&OutOfBandQueueTypeInfoNV)
pub fn queue_notify_out_of_band_nv(queue C.Queue,
	p_queue_type_info &OutOfBandQueueTypeInfoNV) {
	C.vkQueueNotifyOutOfBandNV(queue, p_queue_type_info)
}

pub const qcom_multiview_per_view_render_areas_spec_version = 1
pub const qcom_multiview_per_view_render_areas_extension_name = 'VK_QCOM_multiview_per_view_render_areas'

pub struct PhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM {
pub mut:
	s_type                          StructureType = StructureType.structure_type_physical_device_multiview_per_view_render_areas_features_qcom
	p_next                          voidptr
	multiview_per_view_render_areas Bool32
}

pub struct MultiviewPerViewRenderAreasRenderPassBeginInfoQCOM {
pub mut:
	s_type                     StructureType = StructureType.structure_type_multiview_per_view_render_areas_render_pass_begin_info_qcom
	p_next                     voidptr
	per_view_render_area_count u32
	p_per_view_render_areas    &Rect2D
}

pub const nv_per_stage_descriptor_set_spec_version = 1
pub const nv_per_stage_descriptor_set_extension_name = 'VK_NV_per_stage_descriptor_set'

pub struct PhysicalDevicePerStageDescriptorSetFeaturesNV {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_per_stage_descriptor_set_features_nv
	p_next                   voidptr
	per_stage_descriptor_set Bool32
	dynamic_pipeline_layout  Bool32
}

pub const qcom_image_processing_2_spec_version = 1
pub const qcom_image_processing_2_extension_name = 'VK_QCOM_image_processing2'

pub enum BlockMatchWindowCompareModeQCOM {
	block_match_window_compare_mode_min_qcom      = int(0)
	block_match_window_compare_mode_max_qcom      = int(1)
	block_match_window_compare_mode_max_enum_qcom = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceImageProcessing2FeaturesQCOM {
pub mut:
	s_type               StructureType = StructureType.structure_type_physical_device_image_processing2_features_qcom
	p_next               voidptr
	texture_block_match2 Bool32
}

pub struct PhysicalDeviceImageProcessing2PropertiesQCOM {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_image_processing2_properties_qcom
	p_next                 voidptr
	max_block_match_window Extent2D
}

pub struct SamplerBlockMatchWindowCreateInfoQCOM {
pub mut:
	s_type              StructureType = StructureType.structure_type_sampler_block_match_window_create_info_qcom
	p_next              voidptr
	window_extent       Extent2D
	window_compare_mode BlockMatchWindowCompareModeQCOM
}

pub const qcom_filter_cubic_weights_spec_version = 1
pub const qcom_filter_cubic_weights_extension_name = 'VK_QCOM_filter_cubic_weights'

pub enum CubicFilterWeightsQCOM {
	cubic_filter_weights_catmull_rom_qcom           = int(0)
	cubic_filter_weights_zero_tangent_cardinal_qcom = int(1)
	cubic_filter_weights_b_spline_qcom              = int(2)
	cubic_filter_weights_mitchell_netravali_qcom    = int(3)
	cubic_filter_weights_max_enum_qcom              = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceCubicWeightsFeaturesQCOM {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_cubic_weights_features_qcom
	p_next                   voidptr
	selectable_cubic_weights Bool32
}

pub struct SamplerCubicWeightsCreateInfoQCOM {
pub mut:
	s_type        StructureType = StructureType.structure_type_sampler_cubic_weights_create_info_qcom
	p_next        voidptr
	cubic_weights CubicFilterWeightsQCOM
}

pub struct BlitImageCubicWeightsInfoQCOM {
pub mut:
	s_type        StructureType = StructureType.structure_type_blit_image_cubic_weights_info_qcom
	p_next        voidptr
	cubic_weights CubicFilterWeightsQCOM
}

pub const qcom_ycbcr_degamma_spec_version = 1
pub const qcom_ycbcr_degamma_extension_name = 'VK_QCOM_ycbcr_degamma'

pub struct PhysicalDeviceYcbcrDegammaFeaturesQCOM {
pub mut:
	s_type        StructureType = StructureType.structure_type_physical_device_ycbcr_degamma_features_qcom
	p_next        voidptr
	ycbcr_degamma Bool32
}

pub struct SamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM {
pub mut:
	s_type               StructureType = StructureType.structure_type_sampler_ycbcr_conversion_ycbcr_degamma_create_info_qcom
	p_next               voidptr
	enable_y_degamma     Bool32
	enable_cb_cr_degamma Bool32
}

pub const qcom_filter_cubic_clamp_spec_version = 1
pub const qcom_filter_cubic_clamp_extension_name = 'VK_QCOM_filter_cubic_clamp'

pub struct PhysicalDeviceCubicClampFeaturesQCOM {
pub mut:
	s_type            StructureType = StructureType.structure_type_physical_device_cubic_clamp_features_qcom
	p_next            voidptr
	cubic_range_clamp Bool32
}

pub const ext_attachment_feedback_loop_dynamic_state_spec_version = 1
pub const ext_attachment_feedback_loop_dynamic_state_extension_name = 'VK_EXT_attachment_feedback_loop_dynamic_state'

pub struct PhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT {
pub mut:
	s_type                                 StructureType = StructureType.structure_type_physical_device_attachment_feedback_loop_dynamic_state_features_ext
	p_next                                 voidptr
	attachment_feedback_loop_dynamic_state Bool32
}

fn C.vkCmdSetAttachmentFeedbackLoopEnableEXT(C.CommandBuffer,
	ImageAspectFlags)
pub fn cmd_set_attachment_feedback_loop_enable_ext(command_buffer C.CommandBuffer,
	aspect_mask ImageAspectFlags) {
	C.vkCmdSetAttachmentFeedbackLoopEnableEXT(command_buffer, aspect_mask)
}

pub const msft_layered_driver_spec_version = 1
pub const msft_layered_driver_extension_name = 'VK_MST_layered_driver'

pub enum LayeredDriverUnderlyingApiMSFT {
	layered_driver_underlying_api_none_msft     = int(0)
	layered_driver_underlying_api_d3d12_msft    = int(1)
	layered_driver_underlying_api_max_enum_msft = int(0x7FFFFFFF)
}

pub struct PhysicalDeviceLayeredDriverPropertiesMSFT {
pub mut:
	s_type         StructureType = StructureType.structure_type_physical_device_layered_driver_properties_msft
	p_next         voidptr
	underlying_api LayeredDriverUnderlyingApiMSFT
}

pub const nv_descriptor_pool_overallocation_spec_version = 1
pub const nv_descriptor_pool_overallocation_extension_name = 'VK_NV_descriptor_pool_overallocation'

pub struct PhysicalDeviceDescriptorPoolOverallocationFeaturesNV {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_descriptor_pool_overallocation_features_nv
	p_next                         voidptr
	descriptor_pool_overallocation Bool32
}

pub const nv_display_stereo_spec_version = 1
pub const nv_display_stereo_extension_name = 'VK_NV_display_stereo'

pub enum DisplaySurfaceStereoTypeNV {
	display_surface_stereo_type_none_nv               = int(0)
	display_surface_stereo_type_onboard_din_nv        = int(1)
	display_surface_stereo_type_hdmi3d_nv             = int(2)
	display_surface_stereo_type_inband_displayport_nv = int(3)
	display_surface_stereo_type_max_enum_nv           = int(0x7FFFFFFF)
}

pub struct DisplaySurfaceStereoCreateInfoNV {
pub mut:
	s_type      StructureType = StructureType.structure_type_display_surface_stereo_create_info_nv
	p_next      voidptr
	stereo_type DisplaySurfaceStereoTypeNV
}

pub struct DisplayModeStereoPropertiesNV {
pub mut:
	s_type            StructureType = StructureType.structure_type_display_mode_stereo_properties_nv
	p_next            voidptr
	hdmi3_d_supported Bool32
}

pub const nv_raw_access_chains_spec_version = 1
pub const nv_raw_access_chains_extension_name = 'VK_NV_raw_access_chains'

pub struct PhysicalDeviceRawAccessChainsFeaturesNV {
pub mut:
	s_type                   StructureType = StructureType.structure_type_physical_device_raw_access_chains_features_nv
	p_next                   voidptr
	shader_raw_access_chains Bool32
}

pub const nv_command_buffer_inheritance_spec_version = 1
pub const nv_command_buffer_inheritance_extension_name = 'VK_NV_command_buffer_inheritance'

pub struct PhysicalDeviceCommandBufferInheritanceFeaturesNV {
pub mut:
	s_type                     StructureType = StructureType.structure_type_physical_device_command_buffer_inheritance_features_nv
	p_next                     voidptr
	command_buffer_inheritance Bool32
}

pub const nv_shader_atomic_float16_vector_spec_version = 1
pub const nv_shader_atomic_float16_vector_extension_name = 'VK_NV_shader_atomic_float16_vector'

pub struct PhysicalDeviceShaderAtomicFloat16VectorFeaturesNV {
pub mut:
	s_type                        StructureType = StructureType.structure_type_physical_device_shader_atomic_float16_vector_features_nv
	p_next                        voidptr
	shader_float16_vector_atomics Bool32
}

pub const ext_shader_replicated_composites_spec_version = 1
pub const ext_shader_replicated_composites_extension_name = 'VK_EXT_shader_replicated_composites'

pub struct PhysicalDeviceShaderReplicatedCompositesFeaturesEXT {
pub mut:
	s_type                       StructureType = StructureType.structure_type_physical_device_shader_replicated_composites_features_ext
	p_next                       voidptr
	shader_replicated_composites Bool32
}

pub const nv_ray_tracing_validation_spec_version = 1
pub const nv_ray_tracing_validation_extension_name = 'VK_NV_ray_tracing_validation'

pub struct PhysicalDeviceRayTracingValidationFeaturesNV {
pub mut:
	s_type                 StructureType = StructureType.structure_type_physical_device_ray_tracing_validation_features_nv
	p_next                 voidptr
	ray_tracing_validation Bool32
}

pub type C.IndirectExecutionSetEXT = voidptr
pub type C.IndirectCommandsLayoutEXT = voidptr

pub const ext_device_generated_commands_spec_version = 1
pub const ext_device_generated_commands_extension_name = 'VK_EXT_device_generated_commands'

pub enum IndirectExecutionSetInfoTypeEXT {
	indirect_execution_set_info_type_pipelines_ext      = int(0)
	indirect_execution_set_info_type_shader_objects_ext = int(1)
	indirect_execution_set_info_type_max_enum_ext       = int(0x7FFFFFFF)
}

pub enum IndirectCommandsTokenTypeEXT {
	indirect_commands_token_type_execution_set_ext            = int(0)
	indirect_commands_token_type_push_constant_ext            = int(1)
	indirect_commands_token_type_sequence_index_ext           = int(2)
	indirect_commands_token_type_index_buffer_ext             = int(3)
	indirect_commands_token_type_vertex_buffer_ext            = int(4)
	indirect_commands_token_type_draw_indexed_ext             = int(5)
	indirect_commands_token_type_draw_ext                     = int(6)
	indirect_commands_token_type_draw_indexed_count_ext       = int(7)
	indirect_commands_token_type_draw_count_ext               = int(8)
	indirect_commands_token_type_dispatch_ext                 = int(9)
	indirect_commands_token_type_draw_mesh_tasks_nv_ext       = int(1000202002)
	indirect_commands_token_type_draw_mesh_tasks_count_nv_ext = int(1000202003)
	indirect_commands_token_type_draw_mesh_tasks_ext          = int(1000328000)
	indirect_commands_token_type_draw_mesh_tasks_count_ext    = int(1000328001)
	indirect_commands_token_type_trace_rays2_ext              = int(1000386004)
	indirect_commands_token_type_max_enum_ext                 = int(0x7FFFFFFF)
}

pub enum IndirectCommandsInputModeFlagBitsEXT {
	indirect_commands_input_mode_vulkan_index_buffer_ext = int(0x00000001)
	indirect_commands_input_mode_dxgi_index_buffer_ext   = int(0x00000002)
	indirect_commands_input_mode_flag_bits_max_enum_ext  = int(0x7FFFFFFF)
}

pub type IndirectCommandsInputModeFlagsEXT = u32

pub enum IndirectCommandsLayoutUsageFlagBitsEXT {
	indirect_commands_layout_usage_explicit_preprocess_bit_ext = int(0x00000001)
	indirect_commands_layout_usage_unordered_sequences_bit_ext = int(0x00000002)
	indirect_commands_layout_usage_flag_bits_max_enum_ext      = int(0x7FFFFFFF)
}

pub type IndirectCommandsLayoutUsageFlagsEXT = u32

pub struct PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT {
pub mut:
	s_type                            StructureType = StructureType.structure_type_physical_device_device_generated_commands_features_ext
	p_next                            voidptr
	device_generated_commands         Bool32
	dynamic_generated_pipeline_layout Bool32
}

pub struct PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT {
pub mut:
	s_type                                                     StructureType = StructureType.structure_type_physical_device_device_generated_commands_properties_ext
	p_next                                                     voidptr
	max_indirect_pipeline_count                                u32
	max_indirect_shader_object_count                           u32
	max_indirect_sequence_count                                u32
	max_indirect_commands_token_count                          u32
	max_indirect_commands_token_offset                         u32
	max_indirect_commands_indirect_stride                      u32
	supported_indirect_commands_input_modes                    IndirectCommandsInputModeFlagsEXT
	supported_indirect_commands_shader_stages                  ShaderStageFlags
	supported_indirect_commands_shader_stages_pipeline_binding ShaderStageFlags
	supported_indirect_commands_shader_stages_shader_binding   ShaderStageFlags
	device_generated_commands_transform_feedback               Bool32
	device_generated_commands_multi_draw_indirect_count        Bool32
}

pub struct GeneratedCommandsMemoryRequirementsInfoEXT {
pub mut:
	s_type                   StructureType = StructureType.structure_type_generated_commands_memory_requirements_info_ext
	p_next                   voidptr
	indirect_execution_set   C.IndirectExecutionSetEXT
	indirect_commands_layout C.IndirectCommandsLayoutEXT
	max_sequence_count       u32
	max_draw_count           u32
}

pub struct IndirectExecutionSetPipelineInfoEXT {
pub mut:
	s_type             StructureType = StructureType.structure_type_indirect_execution_set_pipeline_info_ext
	p_next             voidptr
	initial_pipeline   C.Pipeline
	max_pipeline_count u32
}

pub struct IndirectExecutionSetShaderLayoutInfoEXT {
pub mut:
	s_type           StructureType = StructureType.structure_type_indirect_execution_set_shader_layout_info_ext
	p_next           voidptr
	set_layout_count u32
	p_set_layouts    &C.DescriptorSetLayout
}

pub struct IndirectExecutionSetShaderInfoEXT {
pub mut:
	s_type                    StructureType = StructureType.structure_type_indirect_execution_set_shader_info_ext
	p_next                    voidptr
	shader_count              u32
	p_initial_shaders         &C.ShaderEXT
	p_set_layout_infos        &IndirectExecutionSetShaderLayoutInfoEXT
	max_shader_count          u32
	push_constant_range_count u32
	p_push_constant_ranges    &PushConstantRange
}

pub union IndirectExecutionSetInfoEXT {
pub mut:
	p_pipeline_info &IndirectExecutionSetPipelineInfoEXT
	p_shader_info   &IndirectExecutionSetShaderInfoEXT
}

pub struct IndirectExecutionSetCreateInfoEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_indirect_execution_set_create_info_ext
	p_next voidptr
	vktype IndirectExecutionSetInfoTypeEXT
	info   IndirectExecutionSetInfoEXT
}

pub struct GeneratedCommandsInfoEXT {
pub mut:
	s_type                   StructureType = StructureType.structure_type_generated_commands_info_ext
	p_next                   voidptr
	shader_stages            ShaderStageFlags
	indirect_execution_set   C.IndirectExecutionSetEXT
	indirect_commands_layout C.IndirectCommandsLayoutEXT
	indirect_address         DeviceAddress
	indirect_address_size    DeviceSize
	preprocess_address       DeviceAddress
	preprocess_size          DeviceSize
	max_sequence_count       u32
	sequence_count_address   DeviceAddress
	max_draw_count           u32
}

pub struct WriteIndirectExecutionSetPipelineEXT {
pub mut:
	s_type   StructureType = StructureType.structure_type_write_indirect_execution_set_pipeline_ext
	p_next   voidptr
	index    u32
	pipeline C.Pipeline
}

pub struct IndirectCommandsPushConstantTokenEXT {
pub mut:
	update_range PushConstantRange
}

pub struct IndirectCommandsVertexBufferTokenEXT {
pub mut:
	vertex_binding_unit u32
}

pub struct IndirectCommandsIndexBufferTokenEXT {
pub mut:
	mode IndirectCommandsInputModeFlagBitsEXT
}

pub struct IndirectCommandsExecutionSetTokenEXT {
pub mut:
	vktype        IndirectExecutionSetInfoTypeEXT
	shader_stages ShaderStageFlags
}

pub union IndirectCommandsTokenDataEXT {
pub mut:
	p_push_constant &IndirectCommandsPushConstantTokenEXT
	p_vertex_buffer &IndirectCommandsVertexBufferTokenEXT
	p_index_buffer  &IndirectCommandsIndexBufferTokenEXT
	p_execution_set &IndirectCommandsExecutionSetTokenEXT
}

pub struct IndirectCommandsLayoutTokenEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_indirect_commands_layout_token_ext
	p_next voidptr
	vktype IndirectCommandsTokenTypeEXT
	data   IndirectCommandsTokenDataEXT
	offset u32
}

pub struct IndirectCommandsLayoutCreateInfoEXT {
pub mut:
	s_type          StructureType = StructureType.structure_type_indirect_commands_layout_create_info_ext
	p_next          voidptr
	flags           IndirectCommandsLayoutUsageFlagsEXT
	shader_stages   ShaderStageFlags
	indirect_stride u32
	pipeline_layout C.PipelineLayout
	token_count     u32
	p_tokens        &IndirectCommandsLayoutTokenEXT
}

pub struct DrawIndirectCountIndirectCommandEXT {
pub mut:
	buffer_address DeviceAddress
	stride         u32
	command_count  u32
}

pub struct BindVertexBufferIndirectCommandEXT {
pub mut:
	buffer_address DeviceAddress
	size           u32
	stride         u32
}

pub struct BindIndexBufferIndirectCommandEXT {
pub mut:
	buffer_address DeviceAddress
	size           u32
	index_type     IndexType
}

pub struct GeneratedCommandsPipelineInfoEXT {
pub mut:
	s_type   StructureType = StructureType.structure_type_generated_commands_pipeline_info_ext
	p_next   voidptr
	pipeline C.Pipeline
}

pub struct GeneratedCommandsShaderInfoEXT {
pub mut:
	s_type       StructureType = StructureType.structure_type_generated_commands_shader_info_ext
	p_next       voidptr
	shader_count u32
	p_shaders    &C.ShaderEXT
}

pub struct WriteIndirectExecutionSetShaderEXT {
pub mut:
	s_type StructureType = StructureType.structure_type_write_indirect_execution_set_shader_ext
	p_next voidptr
	index  u32
	shader C.ShaderEXT
}

fn C.vkGetGeneratedCommandsMemoryRequirementsEXT(C.Device,
	&GeneratedCommandsMemoryRequirementsInfoEXT,
	&MemoryRequirements2)
pub fn get_generated_commands_memory_requirements_ext(device C.Device,
	p_info &GeneratedCommandsMemoryRequirementsInfoEXT,
	p_memory_requirements &MemoryRequirements2) {
	C.vkGetGeneratedCommandsMemoryRequirementsEXT(device, p_info, p_memory_requirements)
}

fn C.vkCmdPreprocessGeneratedCommandsEXT(C.CommandBuffer,
	&GeneratedCommandsInfoEXT,
	C.CommandBuffer)
pub fn cmd_preprocess_generated_commands_ext(command_buffer C.CommandBuffer,
	p_generated_commands_info &GeneratedCommandsInfoEXT,
	state_command_buffer C.CommandBuffer) {
	C.vkCmdPreprocessGeneratedCommandsEXT(command_buffer, p_generated_commands_info, state_command_buffer)
}

fn C.vkCmdExecuteGeneratedCommandsEXT(C.CommandBuffer,
	Bool32,
	&GeneratedCommandsInfoEXT)
pub fn cmd_execute_generated_commands_ext(command_buffer C.CommandBuffer,
	is_preprocessed Bool32,
	p_generated_commands_info &GeneratedCommandsInfoEXT) {
	C.vkCmdExecuteGeneratedCommandsEXT(command_buffer, is_preprocessed, p_generated_commands_info)
}

fn C.vkCreateIndirectCommandsLayoutEXT(C.Device,
	&IndirectCommandsLayoutCreateInfoEXT,
	&AllocationCallbacks,
	&C.IndirectCommandsLayoutEXT) Result
pub fn create_indirect_commands_layout_ext(device C.Device,
	p_create_info &IndirectCommandsLayoutCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_indirect_commands_layout &C.IndirectCommandsLayoutEXT) Result {
	return C.vkCreateIndirectCommandsLayoutEXT(device, p_create_info, p_allocator, p_indirect_commands_layout)
}

fn C.vkDestroyIndirectCommandsLayoutEXT(C.Device,
	C.IndirectCommandsLayoutEXT,
	&AllocationCallbacks)
pub fn destroy_indirect_commands_layout_ext(device C.Device,
	indirect_commands_layout C.IndirectCommandsLayoutEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyIndirectCommandsLayoutEXT(device, indirect_commands_layout, p_allocator)
}

fn C.vkCreateIndirectExecutionSetEXT(C.Device,
	&IndirectExecutionSetCreateInfoEXT,
	&AllocationCallbacks,
	&C.IndirectExecutionSetEXT) Result
pub fn create_indirect_execution_set_ext(device C.Device,
	p_create_info &IndirectExecutionSetCreateInfoEXT,
	p_allocator &AllocationCallbacks,
	p_indirect_execution_set &C.IndirectExecutionSetEXT) Result {
	return C.vkCreateIndirectExecutionSetEXT(device, p_create_info, p_allocator, p_indirect_execution_set)
}

fn C.vkDestroyIndirectExecutionSetEXT(C.Device,
	C.IndirectExecutionSetEXT,
	&AllocationCallbacks)
pub fn destroy_indirect_execution_set_ext(device C.Device,
	indirect_execution_set C.IndirectExecutionSetEXT,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyIndirectExecutionSetEXT(device, indirect_execution_set, p_allocator)
}

fn C.vkUpdateIndirectExecutionSetPipelineEXT(C.Device,
	C.IndirectExecutionSetEXT,
	u32,
	&WriteIndirectExecutionSetPipelineEXT)
pub fn update_indirect_execution_set_pipeline_ext(device C.Device,
	indirect_execution_set C.IndirectExecutionSetEXT,
	execution_set_write_count u32,
	p_execution_set_writes &WriteIndirectExecutionSetPipelineEXT) {
	C.vkUpdateIndirectExecutionSetPipelineEXT(device, indirect_execution_set, execution_set_write_count,
		p_execution_set_writes)
}

fn C.vkUpdateIndirectExecutionSetShaderEXT(C.Device,
	C.IndirectExecutionSetEXT,
	u32,
	&WriteIndirectExecutionSetShaderEXT)
pub fn update_indirect_execution_set_shader_ext(device C.Device,
	indirect_execution_set C.IndirectExecutionSetEXT,
	execution_set_write_count u32,
	p_execution_set_writes &WriteIndirectExecutionSetShaderEXT) {
	C.vkUpdateIndirectExecutionSetShaderEXT(device, indirect_execution_set, execution_set_write_count,
		p_execution_set_writes)
}

pub const mesa_image_alignment_control_spec_version = 1
pub const mesa_image_alignment_control_extension_name = 'VK_MESA_image_alignment_control'

pub struct PhysicalDeviceImageAlignmentControlFeaturesMESA {
pub mut:
	s_type                  StructureType = StructureType.structure_type_physical_device_image_alignment_control_features_mesa
	p_next                  voidptr
	image_alignment_control Bool32
}

pub struct PhysicalDeviceImageAlignmentControlPropertiesMESA {
pub mut:
	s_type                         StructureType = StructureType.structure_type_physical_device_image_alignment_control_properties_mesa
	p_next                         voidptr
	supported_image_alignment_mask u32
}

pub struct ImageAlignmentControlCreateInfoMESA {
pub mut:
	s_type                      StructureType = StructureType.structure_type_image_alignment_control_create_info_mesa
	p_next                      voidptr
	maximum_requested_alignment u32
}

pub const ext_depth_clamp_control_spec_version = 1
pub const ext_depth_clamp_control_extension_name = 'VK_EXT_depth_clamp_control'

pub struct PhysicalDeviceDepthClampControlFeaturesEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_physical_device_depth_clamp_control_features_ext
	p_next              voidptr
	depth_clamp_control Bool32
}

pub struct PipelineViewportDepthClampControlCreateInfoEXT {
pub mut:
	s_type              StructureType = StructureType.structure_type_pipeline_viewport_depth_clamp_control_create_info_ext
	p_next              voidptr
	depth_clamp_mode    DepthClampModeEXT
	p_depth_clamp_range &DepthClampRangeEXT
}

pub const huawei_hdr_vivid_spec_version = 1
pub const huawei_hdr_vivid_extension_name = 'VK_HAWEI_hdr_vivid'

pub struct PhysicalDeviceHdrVividFeaturesHUAWEI {
pub mut:
	s_type    StructureType = StructureType.structure_type_physical_device_hdr_vivid_features_huawei
	p_next    voidptr
	hdr_vivid Bool32
}

pub struct HdrVividDynamicMetadataHUAWEI {
pub mut:
	s_type                StructureType = StructureType.structure_type_hdr_vivid_dynamic_metadata_huawei
	p_next                voidptr
	dynamic_metadata_size usize
	p_dynamic_metadata    voidptr
}

pub const nv_cooperative_matrix_2_spec_version = 1
pub const nv_cooperative_matrix_2_extension_name = 'VK_NV_cooperative_matrix2'

pub struct CooperativeMatrixFlexibleDimensionsPropertiesNV {
pub mut:
	s_type                  StructureType = StructureType.structure_type_cooperative_matrix_flexible_dimensions_properties_nv
	p_next                  voidptr
	m_granularity           u32
	n_granularity           u32
	k_granularity           u32
	a_type                  ComponentTypeKHR
	b_type                  ComponentTypeKHR
	c_type                  ComponentTypeKHR
	result_type             ComponentTypeKHR
	saturating_accumulation Bool32
	scope                   ScopeKHR
	workgroup_invocations   u32
}

pub struct PhysicalDeviceCooperativeMatrix2FeaturesNV {
pub mut:
	s_type                                    StructureType = StructureType.structure_type_physical_device_cooperative_matrix2_features_nv
	p_next                                    voidptr
	cooperative_matrix_workgroup_scope        Bool32
	cooperative_matrix_flexible_dimensions    Bool32
	cooperative_matrix_reductions             Bool32
	cooperative_matrix_conversions            Bool32
	cooperative_matrix_per_element_operations Bool32
	cooperative_matrix_tensor_addressing      Bool32
	cooperative_matrix_block_loads            Bool32
}

pub struct PhysicalDeviceCooperativeMatrix2PropertiesNV {
pub mut:
	s_type                                                    StructureType = StructureType.structure_type_physical_device_cooperative_matrix2_properties_nv
	p_next                                                    voidptr
	cooperative_matrix_workgroup_scope_max_workgroup_size     u32
	cooperative_matrix_flexible_dimensions_max_dimension      u32
	cooperative_matrix_workgroup_scope_reserved_shared_memory u32
}

fn C.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV(C.PhysicalDevice,
	&u32,
	&CooperativeMatrixFlexibleDimensionsPropertiesNV) Result
pub fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(physical_device C.PhysicalDevice,
	p_property_count &u32,
	p_properties &CooperativeMatrixFlexibleDimensionsPropertiesNV) Result {
	return C.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV(physical_device,
		p_property_count, p_properties)
}

pub const ext_vertex_attribute_robustness_spec_version = 1
pub const ext_vertex_attribute_robustness_extension_name = 'VK_EXT_vertex_attribute_robustness'

pub struct PhysicalDeviceVertexAttributeRobustnessFeaturesEXT {
pub mut:
	s_type                      StructureType = StructureType.structure_type_physical_device_vertex_attribute_robustness_features_ext
	p_next                      voidptr
	vertex_attribute_robustness Bool32
}

pub const khr_acceleration_structure_spec_version = 13
pub const khr_acceleration_structure_extension_name = 'VK_KHR_acceleration_structure'

pub enum BuildAccelerationStructureModeKHR {
	build_acceleration_structure_mode_build_khr    = int(0)
	build_acceleration_structure_mode_update_khr   = int(1)
	build_acceleration_structure_mode_max_enum_khr = int(0x7FFFFFFF)
}

pub enum AccelerationStructureCreateFlagBitsKHR {
	acceleration_structure_create_device_address_capture_replay_bit_khr    = int(0x00000001)
	acceleration_structure_create_descriptor_buffer_capture_replay_bit_ext = int(0x00000008)
	acceleration_structure_create_motion_bit_nv                            = int(0x00000004)
	acceleration_structure_create_flag_bits_max_enum_khr                   = int(0x7FFFFFFF)
}

pub type AccelerationStructureCreateFlagsKHR = u32

pub struct AccelerationStructureBuildRangeInfoKHR {
pub mut:
	primitive_count  u32
	primitive_offset u32
	first_vertex     u32
	transform_offset u32
}

pub struct AccelerationStructureGeometryTrianglesDataKHR {
pub mut:
	s_type         StructureType = StructureType.structure_type_acceleration_structure_geometry_triangles_data_khr
	p_next         voidptr
	vertex_format  Format
	vertex_data    DeviceOrHostAddressConstKHR
	vertex_stride  DeviceSize
	max_vertex     u32
	index_type     IndexType
	index_data     DeviceOrHostAddressConstKHR
	transform_data DeviceOrHostAddressConstKHR
}

pub struct AccelerationStructureGeometryAabbsDataKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_acceleration_structure_geometry_aabbs_data_khr
	p_next voidptr
	data   DeviceOrHostAddressConstKHR
	stride DeviceSize
}

pub struct AccelerationStructureGeometryInstancesDataKHR {
pub mut:
	s_type            StructureType = StructureType.structure_type_acceleration_structure_geometry_instances_data_khr
	p_next            voidptr
	array_of_pointers Bool32
	data              DeviceOrHostAddressConstKHR
}

pub union AccelerationStructureGeometryDataKHR {
pub mut:
	triangles AccelerationStructureGeometryTrianglesDataKHR
	aabbs     AccelerationStructureGeometryAabbsDataKHR
	instances AccelerationStructureGeometryInstancesDataKHR
}

pub struct AccelerationStructureGeometryKHR {
pub mut:
	s_type        StructureType = StructureType.structure_type_acceleration_structure_geometry_khr
	p_next        voidptr
	geometry_type GeometryTypeKHR
	geometry      AccelerationStructureGeometryDataKHR
	flags         GeometryFlagsKHR
}

pub struct AccelerationStructureBuildGeometryInfoKHR {
pub mut:
	s_type                     StructureType = StructureType.structure_type_acceleration_structure_build_geometry_info_khr
	p_next                     voidptr
	vktype                     AccelerationStructureTypeKHR
	flags                      BuildAccelerationStructureFlagsKHR
	mode                       BuildAccelerationStructureModeKHR
	src_acceleration_structure C.AccelerationStructureKHR
	dst_acceleration_structure C.AccelerationStructureKHR
	geometry_count             u32
	p_geometries               &AccelerationStructureGeometryKHR
	pp_geometries              &AccelerationStructureGeometryKHR
	scratch_data               DeviceOrHostAddressKHR
}

pub struct AccelerationStructureCreateInfoKHR {
pub mut:
	s_type         StructureType = StructureType.structure_type_acceleration_structure_create_info_khr
	p_next         voidptr
	create_flags   AccelerationStructureCreateFlagsKHR
	buffer         C.Buffer
	offset         DeviceSize
	size           DeviceSize
	vktype         AccelerationStructureTypeKHR
	device_address DeviceAddress
}

pub struct WriteDescriptorSetAccelerationStructureKHR {
pub mut:
	s_type                       StructureType = StructureType.structure_type_write_descriptor_set_acceleration_structure_khr
	p_next                       voidptr
	acceleration_structure_count u32
	p_acceleration_structures    &C.AccelerationStructureKHR
}

pub struct PhysicalDeviceAccelerationStructureFeaturesKHR {
pub mut:
	s_type                                                      StructureType = StructureType.structure_type_physical_device_acceleration_structure_features_khr
	p_next                                                      voidptr
	acceleration_structure                                      Bool32
	acceleration_structure_capture_replay                       Bool32
	acceleration_structure_indirect_build                       Bool32
	acceleration_structure_host_commands                        Bool32
	descriptor_binding_acceleration_structure_update_after_bind Bool32
}

pub struct PhysicalDeviceAccelerationStructurePropertiesKHR {
pub mut:
	s_type                                                             StructureType = StructureType.structure_type_physical_device_acceleration_structure_properties_khr
	p_next                                                             voidptr
	max_geometry_count                                                 u64
	max_instance_count                                                 u64
	max_primitive_count                                                u64
	max_per_stage_descriptor_acceleration_structures                   u32
	max_per_stage_descriptor_update_after_bind_acceleration_structures u32
	max_descriptor_set_acceleration_structures                         u32
	max_descriptor_set_update_after_bind_acceleration_structures       u32
	min_acceleration_structure_scratch_offset_alignment                u32
}

pub struct AccelerationStructureDeviceAddressInfoKHR {
pub mut:
	s_type                 StructureType = StructureType.structure_type_acceleration_structure_device_address_info_khr
	p_next                 voidptr
	acceleration_structure C.AccelerationStructureKHR
}

pub struct AccelerationStructureVersionInfoKHR {
pub mut:
	s_type         StructureType = StructureType.structure_type_acceleration_structure_version_info_khr
	p_next         voidptr
	p_version_data &u8
}

pub struct CopyAccelerationStructureToMemoryInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_acceleration_structure_to_memory_info_khr
	p_next voidptr
	src    C.AccelerationStructureKHR
	dst    DeviceOrHostAddressKHR
	mode   CopyAccelerationStructureModeKHR
}

pub struct CopyMemoryToAccelerationStructureInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_memory_to_acceleration_structure_info_khr
	p_next voidptr
	src    DeviceOrHostAddressConstKHR
	dst    C.AccelerationStructureKHR
	mode   CopyAccelerationStructureModeKHR
}

pub struct CopyAccelerationStructureInfoKHR {
pub mut:
	s_type StructureType = StructureType.structure_type_copy_acceleration_structure_info_khr
	p_next voidptr
	src    C.AccelerationStructureKHR
	dst    C.AccelerationStructureKHR
	mode   CopyAccelerationStructureModeKHR
}

pub struct AccelerationStructureBuildSizesInfoKHR {
pub mut:
	s_type                      StructureType = StructureType.structure_type_acceleration_structure_build_sizes_info_khr
	p_next                      voidptr
	acceleration_structure_size DeviceSize
	update_scratch_size         DeviceSize
	build_scratch_size          DeviceSize
}

fn C.vkCreateAccelerationStructureKHR(C.Device,
	&AccelerationStructureCreateInfoKHR,
	&AllocationCallbacks,
	&C.AccelerationStructureKHR) Result
pub fn create_acceleration_structure_khr(device C.Device,
	p_create_info &AccelerationStructureCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_acceleration_structure &C.AccelerationStructureKHR) Result {
	return C.vkCreateAccelerationStructureKHR(device, p_create_info, p_allocator, p_acceleration_structure)
}

fn C.vkDestroyAccelerationStructureKHR(C.Device,
	C.AccelerationStructureKHR,
	&AllocationCallbacks)
pub fn destroy_acceleration_structure_khr(device C.Device,
	acceleration_structure C.AccelerationStructureKHR,
	p_allocator &AllocationCallbacks) {
	C.vkDestroyAccelerationStructureKHR(device, acceleration_structure, p_allocator)
}

fn C.vkCmdBuildAccelerationStructuresKHR(C.CommandBuffer,
	u32,
	&AccelerationStructureBuildGeometryInfoKHR,
	&AccelerationStructureBuildRangeInfoKHR)
pub fn cmd_build_acceleration_structures_khr(command_buffer C.CommandBuffer,
	info_count u32,
	p_infos &AccelerationStructureBuildGeometryInfoKHR,
	pp_build_range_infos &AccelerationStructureBuildRangeInfoKHR) {
	C.vkCmdBuildAccelerationStructuresKHR(command_buffer, info_count, p_infos, pp_build_range_infos)
}

fn C.vkCmdBuildAccelerationStructuresIndirectKHR(C.CommandBuffer,
	u32,
	&AccelerationStructureBuildGeometryInfoKHR,
	&DeviceAddress,
	&u32,
	&u32)
pub fn cmd_build_acceleration_structures_indirect_khr(command_buffer C.CommandBuffer,
	info_count u32,
	p_infos &AccelerationStructureBuildGeometryInfoKHR,
	p_indirect_device_addresses &DeviceAddress,
	p_indirect_strides &u32,
	pp_max_primitive_counts &u32) {
	C.vkCmdBuildAccelerationStructuresIndirectKHR(command_buffer, info_count, p_infos,
		p_indirect_device_addresses, p_indirect_strides, pp_max_primitive_counts)
}

fn C.vkBuildAccelerationStructuresKHR(C.Device,
	C.DeferredOperationKHR,
	u32,
	&AccelerationStructureBuildGeometryInfoKHR,
	&AccelerationStructureBuildRangeInfoKHR) Result
pub fn build_acceleration_structures_khr(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	info_count u32,
	p_infos &AccelerationStructureBuildGeometryInfoKHR,
	pp_build_range_infos &AccelerationStructureBuildRangeInfoKHR) Result {
	return C.vkBuildAccelerationStructuresKHR(device, deferred_operation, info_count,
		p_infos, pp_build_range_infos)
}

fn C.vkCopyAccelerationStructureKHR(C.Device,
	C.DeferredOperationKHR,
	&CopyAccelerationStructureInfoKHR) Result
pub fn copy_acceleration_structure_khr(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyAccelerationStructureInfoKHR) Result {
	return C.vkCopyAccelerationStructureKHR(device, deferred_operation, p_info)
}

fn C.vkCopyAccelerationStructureToMemoryKHR(C.Device,
	C.DeferredOperationKHR,
	&CopyAccelerationStructureToMemoryInfoKHR) Result
pub fn copy_acceleration_structure_to_memory_khr(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyAccelerationStructureToMemoryInfoKHR) Result {
	return C.vkCopyAccelerationStructureToMemoryKHR(device, deferred_operation, p_info)
}

fn C.vkCopyMemoryToAccelerationStructureKHR(C.Device,
	C.DeferredOperationKHR,
	&CopyMemoryToAccelerationStructureInfoKHR) Result
pub fn copy_memory_to_acceleration_structure_khr(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	p_info &CopyMemoryToAccelerationStructureInfoKHR) Result {
	return C.vkCopyMemoryToAccelerationStructureKHR(device, deferred_operation, p_info)
}

fn C.vkWriteAccelerationStructuresPropertiesKHR(C.Device,
	u32,
	&C.AccelerationStructureKHR,
	QueryType,
	usize,
	voidptr,
	usize) Result
pub fn write_acceleration_structures_properties_khr(device C.Device,
	acceleration_structure_count u32,
	p_acceleration_structures &C.AccelerationStructureKHR,
	query_type QueryType,
	data_size usize,
	p_data voidptr,
	stride usize) Result {
	return C.vkWriteAccelerationStructuresPropertiesKHR(device, acceleration_structure_count,
		p_acceleration_structures, query_type, data_size, p_data, stride)
}

fn C.vkCmdCopyAccelerationStructureKHR(C.CommandBuffer,
	&CopyAccelerationStructureInfoKHR)
pub fn cmd_copy_acceleration_structure_khr(command_buffer C.CommandBuffer,
	p_info &CopyAccelerationStructureInfoKHR) {
	C.vkCmdCopyAccelerationStructureKHR(command_buffer, p_info)
}

fn C.vkCmdCopyAccelerationStructureToMemoryKHR(C.CommandBuffer,
	&CopyAccelerationStructureToMemoryInfoKHR)
pub fn cmd_copy_acceleration_structure_to_memory_khr(command_buffer C.CommandBuffer,
	p_info &CopyAccelerationStructureToMemoryInfoKHR) {
	C.vkCmdCopyAccelerationStructureToMemoryKHR(command_buffer, p_info)
}

fn C.vkCmdCopyMemoryToAccelerationStructureKHR(C.CommandBuffer,
	&CopyMemoryToAccelerationStructureInfoKHR)
pub fn cmd_copy_memory_to_acceleration_structure_khr(command_buffer C.CommandBuffer,
	p_info &CopyMemoryToAccelerationStructureInfoKHR) {
	C.vkCmdCopyMemoryToAccelerationStructureKHR(command_buffer, p_info)
}

fn C.vkGetAccelerationStructureDeviceAddressKHR(C.Device,
	&AccelerationStructureDeviceAddressInfoKHR) DeviceAddress
pub fn get_acceleration_structure_device_address_khr(device C.Device,
	p_info &AccelerationStructureDeviceAddressInfoKHR) DeviceAddress {
	return C.vkGetAccelerationStructureDeviceAddressKHR(device, p_info)
}

fn C.vkCmdWriteAccelerationStructuresPropertiesKHR(C.CommandBuffer,
	u32,
	&C.AccelerationStructureKHR,
	QueryType,
	C.QueryPool,
	u32)
pub fn cmd_write_acceleration_structures_properties_khr(command_buffer C.CommandBuffer,
	acceleration_structure_count u32,
	p_acceleration_structures &C.AccelerationStructureKHR,
	query_type QueryType,
	query_pool C.QueryPool,
	first_query u32) {
	C.vkCmdWriteAccelerationStructuresPropertiesKHR(command_buffer, acceleration_structure_count,
		p_acceleration_structures, query_type, query_pool, first_query)
}

fn C.vkGetDeviceAccelerationStructureCompatibilityKHR(C.Device,
	&AccelerationStructureVersionInfoKHR,
	&AccelerationStructureCompatibilityKHR)
pub fn get_device_acceleration_structure_compatibility_khr(device C.Device,
	p_version_info &AccelerationStructureVersionInfoKHR,
	p_compatibility &AccelerationStructureCompatibilityKHR) {
	C.vkGetDeviceAccelerationStructureCompatibilityKHR(device, p_version_info, p_compatibility)
}

fn C.vkGetAccelerationStructureBuildSizesKHR(C.Device,
	AccelerationStructureBuildTypeKHR,
	&AccelerationStructureBuildGeometryInfoKHR,
	&u32,
	&AccelerationStructureBuildSizesInfoKHR)
pub fn get_acceleration_structure_build_sizes_khr(device C.Device,
	build_type AccelerationStructureBuildTypeKHR,
	p_build_info &AccelerationStructureBuildGeometryInfoKHR,
	p_max_primitive_counts &u32,
	p_size_info &AccelerationStructureBuildSizesInfoKHR) {
	C.vkGetAccelerationStructureBuildSizesKHR(device, build_type, p_build_info, p_max_primitive_counts,
		p_size_info)
}

pub const khr_ray_tracing_pipeline_spec_version = 1
pub const khr_ray_tracing_pipeline_extension_name = 'VK_KHR_ray_tracing_pipeline'

pub enum ShaderGroupShaderKHR {
	shader_group_shader_general_khr      = int(0)
	shader_group_shader_closest_hit_khr  = int(1)
	shader_group_shader_any_hit_khr      = int(2)
	shader_group_shader_intersection_khr = int(3)
	shader_group_shader_max_enum_khr     = int(0x7FFFFFFF)
}

pub struct RayTracingShaderGroupCreateInfoKHR {
pub mut:
	s_type                               StructureType = StructureType.structure_type_ray_tracing_shader_group_create_info_khr
	p_next                               voidptr
	vktype                               RayTracingShaderGroupTypeKHR
	general_shader                       u32
	closest_hit_shader                   u32
	any_hit_shader                       u32
	intersection_shader                  u32
	p_shader_group_capture_replay_handle voidptr
}

pub struct RayTracingPipelineInterfaceCreateInfoKHR {
pub mut:
	s_type                              StructureType = StructureType.structure_type_ray_tracing_pipeline_interface_create_info_khr
	p_next                              voidptr
	max_pipeline_ray_payload_size       u32
	max_pipeline_ray_hit_attribute_size u32
}

pub struct RayTracingPipelineCreateInfoKHR {
pub mut:
	s_type                           StructureType = StructureType.structure_type_ray_tracing_pipeline_create_info_khr
	p_next                           voidptr
	flags                            PipelineCreateFlags
	stage_count                      u32
	p_stages                         &PipelineShaderStageCreateInfo
	group_count                      u32
	p_groups                         &RayTracingShaderGroupCreateInfoKHR
	max_pipeline_ray_recursion_depth u32
	p_library_info                   &PipelineLibraryCreateInfoKHR
	p_library_interface              &RayTracingPipelineInterfaceCreateInfoKHR
	p_dynamic_state                  &PipelineDynamicStateCreateInfo
	layout                           C.PipelineLayout
	base_pipeline_handle             C.Pipeline
	base_pipeline_index              i32
}

pub struct PhysicalDeviceRayTracingPipelineFeaturesKHR {
pub mut:
	s_type                                                        StructureType = StructureType.structure_type_physical_device_ray_tracing_pipeline_features_khr
	p_next                                                        voidptr
	ray_tracing_pipeline                                          Bool32
	ray_tracing_pipeline_shader_group_handle_capture_replay       Bool32
	ray_tracing_pipeline_shader_group_handle_capture_replay_mixed Bool32
	ray_tracing_pipeline_trace_rays_indirect                      Bool32
	ray_traversal_primitive_culling                               Bool32
}

pub struct PhysicalDeviceRayTracingPipelinePropertiesKHR {
pub mut:
	s_type                                  StructureType = StructureType.structure_type_physical_device_ray_tracing_pipeline_properties_khr
	p_next                                  voidptr
	shader_group_handle_size                u32
	max_ray_recursion_depth                 u32
	max_shader_group_stride                 u32
	shader_group_base_alignment             u32
	shader_group_handle_capture_replay_size u32
	max_ray_dispatch_invocation_count       u32
	shader_group_handle_alignment           u32
	max_ray_hit_attribute_size              u32
}

pub struct StridedDeviceAddressRegionKHR {
pub mut:
	device_address DeviceAddress
	stride         DeviceSize
	size           DeviceSize
}

pub struct TraceRaysIndirectCommandKHR {
pub mut:
	width  u32
	height u32
	depth  u32
}

fn C.vkCmdTraceRaysKHR(C.CommandBuffer,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	u32,
	u32,
	u32)
pub fn cmd_trace_rays_khr(command_buffer C.CommandBuffer,
	p_raygen_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_miss_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_hit_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_callable_shader_binding_table &StridedDeviceAddressRegionKHR,
	width u32,
	height u32,
	depth u32) {
	C.vkCmdTraceRaysKHR(command_buffer, p_raygen_shader_binding_table, p_miss_shader_binding_table,
		p_hit_shader_binding_table, p_callable_shader_binding_table, width, height, depth)
}

fn C.vkCreateRayTracingPipelinesKHR(C.Device,
	C.DeferredOperationKHR,
	C.PipelineCache,
	u32,
	&RayTracingPipelineCreateInfoKHR,
	&AllocationCallbacks,
	&C.Pipeline) Result
pub fn create_ray_tracing_pipelines_khr(device C.Device,
	deferred_operation C.DeferredOperationKHR,
	pipeline_cache C.PipelineCache,
	create_info_count u32,
	p_create_infos &RayTracingPipelineCreateInfoKHR,
	p_allocator &AllocationCallbacks,
	p_pipelines &C.Pipeline) Result {
	return C.vkCreateRayTracingPipelinesKHR(device, deferred_operation, pipeline_cache,
		create_info_count, p_create_infos, p_allocator, p_pipelines)
}

fn C.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(C.Device,
	C.Pipeline,
	u32,
	u32,
	usize,
	voidptr) Result
pub fn get_ray_tracing_capture_replay_shader_group_handles_khr(device C.Device,
	pipeline C.Pipeline,
	first_group u32,
	group_count u32,
	data_size usize,
	p_data voidptr) Result {
	return C.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(device, pipeline, first_group,
		group_count, data_size, p_data)
}

fn C.vkCmdTraceRaysIndirectKHR(C.CommandBuffer,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	&StridedDeviceAddressRegionKHR,
	DeviceAddress)
pub fn cmd_trace_rays_indirect_khr(command_buffer C.CommandBuffer,
	p_raygen_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_miss_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_hit_shader_binding_table &StridedDeviceAddressRegionKHR,
	p_callable_shader_binding_table &StridedDeviceAddressRegionKHR,
	indirect_device_address DeviceAddress) {
	C.vkCmdTraceRaysIndirectKHR(command_buffer, p_raygen_shader_binding_table, p_miss_shader_binding_table,
		p_hit_shader_binding_table, p_callable_shader_binding_table, indirect_device_address)
}

fn C.vkGetRayTracingShaderGroupStackSizeKHR(C.Device,
	C.Pipeline,
	u32,
	ShaderGroupShaderKHR) DeviceSize
pub fn get_ray_tracing_shader_group_stack_size_khr(device C.Device,
	pipeline C.Pipeline,
	group u32,
	group_shader ShaderGroupShaderKHR) DeviceSize {
	return C.vkGetRayTracingShaderGroupStackSizeKHR(device, pipeline, group, group_shader)
}

fn C.vkCmdSetRayTracingPipelineStackSizeKHR(C.CommandBuffer,
	u32)
pub fn cmd_set_ray_tracing_pipeline_stack_size_khr(command_buffer C.CommandBuffer,
	pipeline_stack_size u32) {
	C.vkCmdSetRayTracingPipelineStackSizeKHR(command_buffer, pipeline_stack_size)
}

pub const khr_ray_query_spec_version = 1
pub const khr_ray_query_extension_name = 'VK_KHR_ray_query'

pub struct PhysicalDeviceRayQueryFeaturesKHR {
pub mut:
	s_type    StructureType = StructureType.structure_type_physical_device_ray_query_features_khr
	p_next    voidptr
	ray_query Bool32
}

pub const ext_mesh_shader_spec_version = 1
pub const ext_mesh_shader_extension_name = 'VK_EXT_mesh_shader'

pub struct PhysicalDeviceMeshShaderFeaturesEXT {
pub mut:
	s_type                                      StructureType = StructureType.structure_type_physical_device_mesh_shader_features_ext
	p_next                                      voidptr
	task_shader                                 Bool32
	mesh_shader                                 Bool32
	multiview_mesh_shader                       Bool32
	primitive_fragment_shading_rate_mesh_shader Bool32
	mesh_shader_queries                         Bool32
}

pub struct PhysicalDeviceMeshShaderPropertiesEXT {
pub mut:
	s_type                                    StructureType = StructureType.structure_type_physical_device_mesh_shader_properties_ext
	p_next                                    voidptr
	max_task_work_group_total_count           u32
	max_task_work_group_count                 [3]u32
	max_task_work_group_invocations           u32
	max_task_work_group_size                  [3]u32
	max_task_payload_size                     u32
	max_task_shared_memory_size               u32
	max_task_payload_and_shared_memory_size   u32
	max_mesh_work_group_total_count           u32
	max_mesh_work_group_count                 [3]u32
	max_mesh_work_group_invocations           u32
	max_mesh_work_group_size                  [3]u32
	max_mesh_shared_memory_size               u32
	max_mesh_payload_and_shared_memory_size   u32
	max_mesh_output_memory_size               u32
	max_mesh_payload_and_output_memory_size   u32
	max_mesh_output_components                u32
	max_mesh_output_vertices                  u32
	max_mesh_output_primitives                u32
	max_mesh_output_layers                    u32
	max_mesh_multiview_view_count             u32
	mesh_output_per_vertex_granularity        u32
	mesh_output_per_primitive_granularity     u32
	max_preferred_task_work_group_invocations u32
	max_preferred_mesh_work_group_invocations u32
	prefers_local_invocation_vertex_output    Bool32
	prefers_local_invocation_primitive_output Bool32
	prefers_compact_vertex_output             Bool32
	prefers_compact_primitive_output          Bool32
}

pub struct DrawMeshTasksIndirectCommandEXT {
pub mut:
	group_count_x u32
	group_count_y u32
	group_count_z u32
}

fn C.vkCmdDrawMeshTasksEXT(C.CommandBuffer,
	u32,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_ext(command_buffer C.CommandBuffer,
	group_count_x u32,
	group_count_y u32,
	group_count_z u32) {
	C.vkCmdDrawMeshTasksEXT(command_buffer, group_count_x, group_count_y, group_count_z)
}

fn C.vkCmdDrawMeshTasksIndirectEXT(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_indirect_ext(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	draw_count u32,
	stride u32) {
	C.vkCmdDrawMeshTasksIndirectEXT(command_buffer, buffer, offset, draw_count, stride)
}

fn C.vkCmdDrawMeshTasksIndirectCountEXT(C.CommandBuffer,
	C.Buffer,
	DeviceSize,
	C.Buffer,
	DeviceSize,
	u32,
	u32)
pub fn cmd_draw_mesh_tasks_indirect_count_ext(command_buffer C.CommandBuffer,
	buffer C.Buffer,
	offset DeviceSize,
	count_buffer C.Buffer,
	count_buffer_offset DeviceSize,
	max_draw_count u32,
	stride u32) {
	C.vkCmdDrawMeshTasksIndirectCountEXT(command_buffer, buffer, offset, count_buffer,
		count_buffer_offset, max_draw_count, stride)
}
