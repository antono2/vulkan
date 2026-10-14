// Format queries with application-supplied preference order and requirements.
module ergonomic

import antono2.vulkan as vk

pub fn (device PhysicalDevice) format_properties(format vk.Format) vk.FormatProperties {
	mut properties := vk.FormatProperties{}
	vk.get_physical_device_format_properties(device.handle, format, mut properties)
	return properties
}

pub fn format_supports(properties vk.FormatProperties, tiling vk.ImageTiling, required vk.FormatFeatureFlags) bool {
	available := match tiling {
		.linear { properties.linearTilingFeatures }
		.optimal { properties.optimalTilingFeatures }
		else { return false }
	}

	return available & required == required
}

pub fn (device PhysicalDevice) select_format(preferred []vk.Format, tiling vk.ImageTiling, required vk.FormatFeatureFlags) !vk.Format {
	for format in preferred {
		if format_supports(device.format_properties(format), tiling, required) { return format }
	}
	return error('none of the preferred formats supports the requested tiling and features')
}

pub struct ImageFormatSupport {
pub:
	supported  bool
	properties vk.ImageFormatProperties
}

// Unsupported formats are reported separately from native query failures.
pub fn (device PhysicalDevice) image_format_properties(format vk.Format, image_type vk.ImageType, tiling vk.ImageTiling, usage vk.ImageUsageFlags, flags vk.ImageCreateFlags) !ImageFormatSupport {
	mut properties := vk.ImageFormatProperties{}
	status := vk.get_physical_device_image_format_properties(device.handle, format, image_type,
		tiling, usage, flags, mut properties)
	if status == .error_format_not_supported { return ImageFormatSupport{} }
	require_success(status, 'vkGetPhysicalDeviceImageFormatProperties')!
	return ImageFormatSupport{
		supported:  true
		properties: properties
	}
}
