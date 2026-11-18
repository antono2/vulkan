// Query and allocate multisampled attachments with the standard image owner.
module ergonomic

import antono2.vulkan as vk

// Return the immutable physical-device snapshot that created this owner. The
// instance and logical device must remain alive while the snapshot is used.
pub fn (device &OwnedDevice) physical_device_snapshot() !PhysicalDevice {
	if isnil(device) || isnil(device.handle) || isnil(device.physical_device.handle) {
		return error('physical-device snapshot requires a live owned device')
	}
	return device.physical_device
}

fn validate_multisample_image_request(width u32, height u32, format vk.Format,
	samples vk.SampleCountFlagBits, usage vk.ImageUsageFlags) ! {
	if width == 0 || height == 0 || format == .undefined || usage == 0 {
		return error('multisample image requires positive dimensions, a format and usage')
	}
	if samples !in [vk.SampleCountFlagBits._1, ._2, ._4, ._8, ._16, ._32, ._64] {
		return error('multisample image requires one supported sample-count flag')
	}
}

// Own an optimal-tiled, one-level/layer image with an explicit sample count.
// The physical format query precedes creation. Views, render passes, resolves
// and completion before destruction belong to callers. Host allocator callbacks
// follow the device through every rollback and final destruction path.
pub fn (device &OwnedDevice) new_multisample_image_2d(width u32, height u32,
	format vk.Format, samples vk.SampleCountFlagBits, usage vk.ImageUsageFlags,
	required_memory_properties vk.MemoryPropertyFlags) !&OwnedImage {
	validate_multisample_image_request(width, height, format, samples, usage)!
	physical := device.physical_device_snapshot()!
	support := physical.image_format_properties(format, ._2d, .optimal, usage, 0)!
	if !support.supported || width > support.properties.maxExtent.width
		|| height > support.properties.maxExtent.height
		|| support.properties.sampleCounts & u32(samples) == 0 {
		return error('multisample image exceeds physical format extent or sample support')
	}
	extent := vk.Extent3D{ width: width, height: height, depth: 1 }
	info := vk.ImageCreateInfo{
		imageType:     ._2d
		format:        format
		extent:        extent
		mipLevels:     1
		arrayLayers:   1
		samples:       samples
		tiling:        .optimal
		usage:         usage
		sharingMode:   .exclusive
		initialLayout: .undefined
	}
	return device.new_owned_image(&info, required_memory_properties)
}
