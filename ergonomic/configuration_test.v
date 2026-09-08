module ergonomic

import antono2.vulkan as vk

fn test_missing_names_is_stable_and_deduplicated() {
	assert missing_names(['VK_A', 'VK_B', 'VK_A'], ['VK_B']) == ['VK_A']
}

fn test_validate_requested_names_rejects_invalid_name() {
	validate_requested_names('extensions', [''], ['VK_A']) or {
		assert err.msg() == 'extensions names must be non-empty and contain no NUL bytes'
		return
	}
	assert false
}

fn test_validate_requested_names_rejects_missing_name() {
	validate_requested_names('extensions', ['VK_B'], ['VK_A']) or {
		assert err.msg() == 'unsupported extensions: VK_B'
		return
	}
	assert false
}

fn test_device_options_reject_empty_queue_family_before_vulkan_calls() {
	physical_device := PhysicalDevice{}
	empty_family := QueueFamily{}
	physical_device.new_device_with_options(DeviceOptions{
		queue_family: empty_family
	}) or {
		assert err.msg() == 'queue family 0 has no queues'
		return
	}
	assert false
}

fn test_device_options_reject_invalid_queue_index_before_vulkan_calls() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueFlags: u32(vk.QueueFlagBits.graphics)
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_family: family
		queue_index: 1
	}) or {
		assert err.msg() == 'queue index 1 is outside queue family 2'
		return
	}
	assert false
}

fn test_device_options_reject_invalid_priority_before_vulkan_calls() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueFlags: u32(vk.QueueFlagBits.graphics)
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_family: family
		queue_priority: 1.5
	}) or {
		assert err.msg() == 'queue priority must be between 0.0 and 1.0'
		return
	}
	assert false
}
