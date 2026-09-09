module ergonomic

import antono2.vulkan as vk

fn test_check_preserves_success_and_positive_statuses() ! {
	assert check(.success, 'success')! == .success
	assert check(.timeout, 'wait')! == .timeout
	assert check(.incomplete, 'enumerate')! == .incomplete
}

fn test_check_returns_typed_vulkan_error() {
	check(.error_device_lost, 'vkQueueSubmit') or {
		assert err is VulkanError
		if err is VulkanError {
			assert err.result == vk.Result.error_device_lost
			assert err.operation == 'vkQueueSubmit'
			assert err.msg().contains('-4')
		}
		return
	}
	assert false
}

fn test_require_success_rejects_positive_status() {
	require_success(.timeout, 'vkWaitForFences') or {
		assert err is VulkanError
		if err is VulkanError {
			assert err.result == vk.Result.timeout
		}
		return
	}
	assert false
}

fn test_is_error_uses_vulkan_result_sign() {
	assert !is_error(.success)
	assert !is_error(.suboptimal_khr)
	assert is_error(.error_out_of_date_khr)
}

fn queue_family(index u32, flags vk.QueueFlags, count u32) QueueFamily {
	return QueueFamily{
		index: index
		properties: vk.QueueFamilyProperties{
			queueFlags: flags
			queueCount: count
		}
	}
}

fn test_queue_family_supports_all_required_flags() {
	graphics_compute := u32(vk.QueueFlagBits.graphics) | u32(vk.QueueFlagBits.compute)
	family := queue_family(3, graphics_compute, 2)
	assert family.supports(u32(vk.QueueFlagBits.graphics))
	assert family.supports(graphics_compute)
	assert !family.supports(graphics_compute | u32(vk.QueueFlagBits.transfer))
}

fn test_queue_family_with_no_queues_is_not_supported() {
	family := queue_family(0, u32(vk.QueueFlagBits.graphics), 0)
	assert !family.supports(u32(vk.QueueFlagBits.graphics))
	assert !family.supports(0)
}

fn test_select_queue_family_returns_first_full_match() {
	families := [
		queue_family(0, u32(vk.QueueFlagBits.graphics), 1),
		queue_family(1, u32(vk.QueueFlagBits.compute) | u32(vk.QueueFlagBits.transfer), 1),
		queue_family(2, u32(vk.QueueFlagBits.compute) | u32(vk.QueueFlagBits.transfer), 2),
	]
	required := u32(vk.QueueFlagBits.compute) | u32(vk.QueueFlagBits.transfer)
	selected := select_queue_family(families, required) or {
		assert false
		return
	}
	assert selected.index == 1
	assert selected.properties.queueCount == 1
}

fn test_select_queue_family_returns_none_without_a_match() {
	families := [queue_family(0, u32(vk.QueueFlagBits.graphics), 1)]
	select_queue_family(families, u32(vk.QueueFlagBits.compute)) or { return }
	assert false
}

fn test_empty_flag_mask_selects_first_available_queue() {
	families := [queue_family(0, 0, 0), queue_family(1, 0, 1)]
	selected := select_queue_family(families, 0) or {
		assert false
		return
	}
	assert selected.index == 1
}

fn test_command_pool_and_primary_buffer_expose_raw_handles_and_ownership_metadata() {
	pool_handle := vk.CommandPool(unsafe { nil })
	buffer_handle := vk.CommandBuffer(unsafe { nil })
	flags := u32(vk.CommandPoolCreateFlagBits.reset_command_buffer)
	pool := CommandPool{
		device: vk.Device(unsafe { nil })
		handle: pool_handle
		queue_family_index: 4
		flags: flags
	}
	buffer := PrimaryCommandBuffer{
		device: vk.Device(unsafe { nil })
		command_pool: pool.handle
		handle: buffer_handle
	}

	assert pool.handle == pool_handle
	assert pool.queue_family_index == 4
	assert pool.flags == flags
	assert buffer.handle == buffer_handle
	assert buffer.command_pool == pool.handle
}

fn test_command_pool_rejects_queue_from_another_device_before_vulkan_call() {
	device := Device{
		handle: vk.Device(unsafe { voidptr(1) })
	}
	foreign_queue := Queue{
		device: vk.Device(unsafe { voidptr(2) })
	}
	device.new_command_pool_for_queue(foreign_queue, 0) or {
		assert err.msg() == 'queue does not belong to this device'
		return
	}
	assert false
}

fn test_allocate_primary_rejects_zero_count_before_calling_vulkan() {
	pool := CommandPool{
		device: vk.Device(unsafe { nil })
		handle: vk.CommandPool(unsafe { nil })
	}
	pool.allocate_primary(0) or {
		assert err.msg() == 'command buffer count must be greater than zero'
		return
	}
	assert false
}

fn test_free_is_idempotent_for_an_already_cleared_command_buffer() {
	mut buffer := PrimaryCommandBuffer{
		device: vk.Device(unsafe { nil })
		command_pool: vk.CommandPool(unsafe { nil })
		handle: vk.CommandBuffer(unsafe { nil })
	}
	buffer.free()
	buffer.free()
	assert isnil(buffer.handle)
}

fn test_fence_and_semaphore_retain_parent_device_and_raw_handles() {
	device_handle := vk.Device(unsafe { nil })
	fence_handle := vk.Fence(unsafe { nil })
	semaphore_handle := vk.Semaphore(unsafe { nil })
	fence := Fence{
		device: device_handle
		handle: fence_handle
	}
	semaphore := Semaphore{
		device: device_handle
		handle: semaphore_handle
	}

	assert fence.device == device_handle
	assert fence.handle == fence_handle
	assert semaphore.device == device_handle
	assert semaphore.handle == semaphore_handle
}

fn test_sync_destroy_is_idempotent_for_cleared_handles() {
	mut fence := Fence{
		device: vk.Device(unsafe { nil })
		handle: vk.Fence(unsafe { nil })
	}
	mut semaphore := Semaphore{
		device: vk.Device(unsafe { nil })
		handle: vk.Semaphore(unsafe { nil })
	}
	fence.destroy()
	fence.destroy()
	semaphore.destroy()
	semaphore.destroy()
	assert isnil(fence.handle)
	assert isnil(semaphore.handle)
}

fn test_queue_submit_rejects_empty_command_list_before_calling_vulkan() {
	queue := Queue{
		handle: vk.Queue(unsafe { nil })
	}
	queue.submit([], SubmitOptions{}) or {
		assert err.msg() == 'queue submission requires at least one command buffer'
		return
	}
	assert false
}

fn test_queue_submit_rejects_mismatched_waits_and_stage_masks() {
	queue := Queue{
		handle: vk.Queue(unsafe { nil })
	}
	command_buffer := PrimaryCommandBuffer{
		handle: vk.CommandBuffer(unsafe { nil })
	}
	wait_semaphore := Semaphore{
		handle: vk.Semaphore(unsafe { nil })
	}
	options := SubmitOptions{
		wait_semaphores: [wait_semaphore]
	}
	queue.submit([command_buffer], options) or {
		assert err.msg() == 'wait semaphore count must match wait stage mask count'
		return
	}
	assert false
}

fn test_submit_options_accept_matching_waits_signals_and_optional_fence() {
	wait_semaphore := Semaphore{
		handle: vk.Semaphore(unsafe { nil })
	}
	signal_semaphore := Semaphore{
		handle: vk.Semaphore(unsafe { nil })
	}
	fence := Fence{
		handle: vk.Fence(unsafe { nil })
	}
	stage := u32(vk.PipelineStageFlagBits.color_attachment_output)
	options := SubmitOptions{
		wait_semaphores: [wait_semaphore]
		wait_stage_masks: [stage]
		signal_semaphores: [signal_semaphore]
		fence: fence
	}
	assert options.wait_semaphores.len == 1
	assert options.wait_stage_masks.len == 1
	assert options.wait_stage_masks[0] == stage
	assert options.signal_semaphores.len == 1
	if configured_fence := options.fence {
		assert configured_fence.handle == fence.handle
	} else {
		assert false
	}
}

fn memory_properties(types []vk.MemoryPropertyFlags) vk.PhysicalDeviceMemoryProperties {
	mut properties := vk.PhysicalDeviceMemoryProperties{
		memoryTypeCount: u32(types.len)
	}
	for index, flags in types {
		properties.memoryTypes[index] = vk.MemoryType{
			propertyFlags: flags
		}
	}
	return properties
}

fn test_select_memory_type_requires_allowed_bit_and_all_properties() {
	host_visible := u32(vk.MemoryPropertyFlagBits.host_visible)
	host_coherent := u32(vk.MemoryPropertyFlagBits.host_coherent)
	properties := memory_properties([
		host_visible,
		host_coherent,
		host_visible | host_coherent,
	])

	selected := select_memory_type(properties, u32(0b110), host_visible | host_coherent) or {
		assert false
		return
	}
	assert selected == 2
}

fn test_select_memory_type_returns_none_without_compatible_type() {
	properties := memory_properties([
		u32(vk.MemoryPropertyFlagBits.device_local),
		u32(vk.MemoryPropertyFlagBits.host_visible),
	])
	required := u32(vk.MemoryPropertyFlagBits.host_visible) | u32(vk.MemoryPropertyFlagBits.host_coherent)

	select_memory_type(properties, u32(0b11), required) or { return }
	assert false
}

fn test_select_memory_type_ignores_compatible_disallowed_type() {
	host_visible := u32(vk.MemoryPropertyFlagBits.host_visible)
	properties := memory_properties([host_visible, 0])

	select_memory_type(properties, u32(0b10), host_visible) or { return }
	assert false
}

fn test_new_image_2d_rejects_empty_extent_before_calling_vulkan() {
	device := Device{
		handle: vk.Device(unsafe { nil })
	}
	usage := u32(vk.ImageUsageFlagBits.sampled)
	device.new_image_2d(0, 1, .r8g8b8a8_unorm, .optimal, usage, 0) or {
		assert err.msg() == 'image width and height must be greater than zero'
		return
	}
	assert false
}

fn test_new_image_2d_rejects_empty_usage_before_calling_vulkan() {
	device := Device{
		handle: vk.Device(unsafe { nil })
	}
	device.new_image_2d(1, 1, .r8g8b8a8_unorm, .optimal, 0, 0) or {
		assert err.msg() == 'image usage must not be empty'
		return
	}
	assert false
}

fn test_owned_image_exposes_creation_and_allocation_metadata() {
	extent := vk.Extent3D{
		width: 640
		height: 480
		depth: 1
	}
	image := OwnedImage{
		device: vk.Device(unsafe { nil })
		handle: vk.Image(unsafe { nil })
		memory: vk.DeviceMemory(unsafe { nil })
		format: .r8g8b8a8_unorm
		extent: extent
		tiling: .optimal
		usage: u32(vk.ImageUsageFlagBits.sampled)
		allocation_size: 4096
		memory_type_index: 2
	}
	assert image.format == .r8g8b8a8_unorm
	assert image.extent.width == 640
	assert image.extent.height == 480
	assert image.allocation_size == 4096
	assert image.memory_type_index == 2
}

fn test_new_image_view_rejects_empty_aspect_before_calling_vulkan() {
	image := OwnedImage{
		device: vk.Device(unsafe { nil })
		handle: vk.Image(unsafe { nil })
		format: .r8g8b8a8_unorm
	}
	image.new_view(0) or {
		assert err.msg() == 'image view aspect mask must not be empty'
		return
	}
	assert false
}

fn test_new_image_view_rejects_transfer_only_usage_before_calling_vulkan() {
	image := OwnedImage{
		device: vk.Device(unsafe { nil })
		handle: vk.Image(unsafe { nil })
		format: .r8g8b8a8_unorm
		usage: u32(vk.ImageUsageFlagBits.transfer_dst)
	}
	image.new_view(u32(vk.ImageAspectFlagBits.color)) or {
		assert err.msg() == 'image usage does not support image views'
		return
	}
	assert false
}

fn test_image_view_accepts_every_usage_permitted_by_vuid_04441() {
	compatible_usages := [
		u32(vk.ImageUsageFlagBits.sampled),
		u32(vk.ImageUsageFlagBits.storage),
		u32(vk.ImageUsageFlagBits.color_attachment),
		u32(vk.ImageUsageFlagBits.depth_stencil_attachment),
		u32(vk.ImageUsageFlagBits.input_attachment),
		u32(vk.ImageUsageFlagBits.transient_attachment),
		u32(vk.ImageUsageFlagBits.fragment_shading_rate_attachment),
		u32(vk.ImageUsageFlagBits.fragment_density_map_bit_ext),
		u32(vk.ImageUsageFlagBits.video_decode_dst),
		u32(vk.ImageUsageFlagBits.video_decode_dpb),
		u32(vk.ImageUsageFlagBits.video_encode_src),
		u32(vk.ImageUsageFlagBits.video_encode_dpb),
		u32(vk.ImageUsageFlagBits.sample_weight_bit_qcom),
		u32(vk.ImageUsageFlagBits.sample_block_match_bit_qcom),
		u32(vk.ImageUsageFlagBits.video_encode_quantization_delta_map),
		u32(vk.ImageUsageFlagBits.video_encode_emphasis_map),
	]
	for usage in compatible_usages {
		assert image_usage_supports_view(usage)
	}
	assert !image_usage_supports_view(u32(vk.ImageUsageFlagBits.transfer_src) | u32(vk.ImageUsageFlagBits.transfer_dst))
}

fn test_owned_image_view_exposes_parent_and_subresource_metadata() {
	color := u32(vk.ImageAspectFlagBits.color)
	view_handle := vk.ImageView(unsafe { nil })
	image_handle := vk.Image(unsafe { nil })
	view := OwnedImageView{
		device: vk.Device(unsafe { nil })
		handle: view_handle
		image: image_handle
		format: .r8g8b8a8_unorm
		view_type: ._2d
		subresource_range: single_image_subresource_range(color)
	}

	assert view.handle == view_handle
	assert view.image == image_handle
	assert view.format == .r8g8b8a8_unorm
	assert view.view_type == ._2d
	assert view.subresource_range.aspectMask == color
	assert view.subresource_range.baseMipLevel == 0
	assert view.subresource_range.levelCount == 1
	assert view.subresource_range.baseArrayLayer == 0
	assert view.subresource_range.layerCount == 1
}

fn test_image_layout_transition_builds_explicit_single_subresource_barrier() {
	image := OwnedImage{
		handle: vk.Image(unsafe { nil })
	}
	transition := ImageLayoutTransition{
		old_layout: .undefined
		new_layout: .transfer_dst_optimal
		src_stage_mask: u32(vk.PipelineStageFlagBits.top_of_pipe)
		dst_stage_mask: u32(vk.PipelineStageFlagBits.transfer)
		src_access_mask: 0
		dst_access_mask: u32(vk.AccessFlagBits.transfer_write)
		dependency_flags: u32(vk.DependencyFlagBits.by_region)
		aspect_mask: u32(vk.ImageAspectFlagBits.color)
	}
	barrier := transition.image_memory_barrier(image)

	assert barrier.image == image.handle
	assert barrier.oldLayout == .undefined
	assert barrier.newLayout == .transfer_dst_optimal
	assert barrier.srcAccessMask == 0
	assert barrier.dstAccessMask == u32(vk.AccessFlagBits.transfer_write)
	assert barrier.srcQueueFamilyIndex == vk.queue_family_ignored
	assert barrier.dstQueueFamilyIndex == vk.queue_family_ignored
	assert barrier.subresourceRange.aspectMask == u32(vk.ImageAspectFlagBits.color)
	assert barrier.subresourceRange.levelCount == 1
	assert barrier.subresourceRange.layerCount == 1
}

fn test_transition_image_layout_rejects_empty_aspect_before_calling_vulkan() {
	buffer := PrimaryCommandBuffer{
		handle: vk.CommandBuffer(unsafe { nil })
	}
	image := OwnedImage{
		handle: vk.Image(unsafe { nil })
	}
	transition := ImageLayoutTransition{
		old_layout: .undefined
		new_layout: .general
	}
	buffer.transition_image_layout(image, transition) or {
		assert err.msg() == 'image transition aspect mask must not be empty'
		return
	}
	assert false
}
