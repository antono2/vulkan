module ergonomic

import antono2.vulkan as vk

fn test_format_mask_and_acquire_outcomes() ! {
	properties := vk.FormatProperties{
		optimalTilingFeatures: 3
		linearTilingFeatures:  1
	}
	assert format_supports(properties, .optimal, 3)
	assert !format_supports(properties, .linear, 3)
	assert !format_supports(properties, .optimal, 4)
	for status in [vk.Result.timeout, .not_ready, .error_out_of_date_khr] {
		outcome := acquire_outcome(status, 999)!
		assert outcome.status == status
		assert outcome.image_index == none
	}
	for status in [vk.Result.success, .suboptimal_khr] {
		outcome := acquire_outcome(status, 2)!
		assert outcome.image_index? == 2
	}
	mut rejected := false
	acquire_outcome(.error_device_lost, 2) or {
		rejected = true
		assert err is VulkanError
	}
	assert rejected
	assert !pipeline_cache_compatible([u8(0), 1], vk.PhysicalDeviceProperties{})
}

fn test_descriptor_validation_without_driver() {
	device := OwnedDevice{}
	mut rejected := false
	device.new_descriptor_layout([
		vk.DescriptorSetLayoutBinding{ binding: 0, descriptorCount: 0 },
	]) or { rejected = true }
	assert rejected
	rejected = false
	device.new_descriptor_pool(0, []) or { rejected = true }
	assert rejected
}
