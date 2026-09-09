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

fn test_legacy_queue_plan_requests_every_queue_through_selected_index() ! {
	family := QueueFamily{
		index: 3
		properties: vk.QueueFamilyProperties{
			queueFlags: u32(vk.QueueFlagBits.graphics)
			queueCount: 3
		}
	}
	plan := device_queue_plan(DeviceOptions{
		queue_family: family
		queue_index: 2
		queue_priority: 0.75
	})!
	assert plan.requests.len == 1
	assert plan.requests[0].queue_family.index == 3
	assert plan.requests[0].priorities == [f32(0.75), 0.75, 0.75]
	assert plan.primary_family_index == 3
	assert plan.primary_queue_index == 2
}

fn test_multi_queue_plan_preserves_family_and_priority_order() ! {
	graphics := QueueFamily{
		index: 1
		properties: vk.QueueFamilyProperties{
			queueFlags: u32(vk.QueueFlagBits.graphics)
			queueCount: 2
		}
	}
	transfer := QueueFamily{
		index: 4
		properties: vk.QueueFamilyProperties{
			queueFlags: u32(vk.QueueFlagBits.transfer)
			queueCount: 1
		}
	}
	plan := device_queue_plan(DeviceOptions{
		queue_requests: [
			DeviceQueueRequest{
				queue_family: graphics
				priorities: [f32(1.0), 0.5]
			},
			DeviceQueueRequest{
				queue_family: transfer
				priorities: [f32(0.25)]
			},
		]
	})!
	assert plan.requests.len == 2
	assert plan.requests[0].priorities == [f32(1.0), 0.5]
	assert plan.requests[1].queue_family.index == 4
	assert plan.primary_family_index == 1
	assert plan.primary_queue_index == 0
}

fn test_multi_queue_options_reject_empty_priority_list() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_requests: [
			DeviceQueueRequest{
				queue_family: family
				priorities: []
			},
		]
	}) or {
		assert err.msg() == 'queue family 2 must request at least one queue'
		return
	}
	assert false
}

fn test_multi_queue_options_reject_excess_queue_count() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_requests: [
			DeviceQueueRequest{
				queue_family: family
				priorities: [f32(1.0), 0.5]
			},
		]
	}) or {
		assert err.msg() == 'requested 2 queues from family 2, which exposes 1'
		return
	}
	assert false
}

fn test_multi_queue_options_reject_invalid_priority() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_requests: [
			DeviceQueueRequest{
				queue_family: family
				priorities: [f32(-0.25)]
			},
		]
	}) or {
		assert err.msg() == 'queue priority for family 2 index 0 must be between 0.0 and 1.0'
		return
	}
	assert false
}

fn test_multi_queue_options_reject_duplicate_families() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_requests: [
			DeviceQueueRequest{
				queue_family: family
			},
			DeviceQueueRequest{
				queue_family: family
			},
		]
	}) or {
		assert err.msg() == 'queue family 2 is requested more than once'
		return
	}
	assert false
}

fn test_multi_queue_options_reject_legacy_queue_fields() {
	physical_device := PhysicalDevice{}
	family := QueueFamily{
		index: 2
		properties: vk.QueueFamilyProperties{
			queueCount: 1
		}
	}
	physical_device.new_device_with_options(DeviceOptions{
		queue_family: family
		queue_requests: [DeviceQueueRequest{
			queue_family: family
		}]
	}) or {
		assert err.msg() == 'queue_requests cannot be combined with queue_family, queue_index, or queue_priority'
		return
	}
	assert false
}
