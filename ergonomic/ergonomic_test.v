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
