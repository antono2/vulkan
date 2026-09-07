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
