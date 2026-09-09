module ergonomic

import antono2.vulkan as vk

// SurfaceSupport is an owned snapshot of the presentation capabilities used
// when choosing a swapchain configuration.
pub struct SurfaceSupport {
pub:
	capabilities  vk.SurfaceCapabilitiesKHR
	formats       []vk.SurfaceFormatKHR
	present_modes []vk.PresentModeKHR
}

// surface_capabilities queries the fixed and variable limits for surface.
pub fn (device PhysicalDevice) surface_capabilities(surface vk.SurfaceKHR) !vk.SurfaceCapabilitiesKHR {
	if isnil(surface) {
		return error('presentation surface must not be null')
	}
	mut capabilities := vk.SurfaceCapabilitiesKHR{}
	require_success(vk.get_physical_device_surface_capabilities_khr(device.handle, surface, mut capabilities), 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR')!
	return capabilities
}

// surface_formats performs Vulkan's count/fill enumeration and retries if the
// surface changes while it is being queried.
pub fn (device PhysicalDevice) surface_formats(surface vk.SurfaceKHR) ![]vk.SurfaceFormatKHR {
	if isnil(surface) {
		return error('presentation surface must not be null')
	}
	for {
		mut count := u32(0)
		mut no_formats := unsafe { nil }
		result := vk.get_physical_device_surface_formats_khr(device.handle, surface, &count, mut no_formats)
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkGetPhysicalDeviceSurfaceFormatsKHR(count)')!
		if count == 0 {
			return []vk.SurfaceFormatKHR{}
		}
		mut formats := []vk.SurfaceFormatKHR{len: int(count)}
		fill_result := vk.get_physical_device_surface_formats_khr(device.handle, surface, &count, mut formats[0])
		if fill_result == .incomplete {
			continue
		}
		require_success(fill_result, 'vkGetPhysicalDeviceSurfaceFormatsKHR(values)')!
		return formats[..int(count)].clone()
	}
	return []vk.SurfaceFormatKHR{}
}

// surface_present_modes performs Vulkan's count/fill enumeration and retries
// if the surface changes while it is being queried.
pub fn (device PhysicalDevice) surface_present_modes(surface vk.SurfaceKHR) ![]vk.PresentModeKHR {
	if isnil(surface) {
		return error('presentation surface must not be null')
	}
	for {
		mut count := u32(0)
		result := vk.get_physical_device_surface_present_modes_khr(device.handle, surface, &count, unsafe { nil })
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkGetPhysicalDeviceSurfacePresentModesKHR(count)')!
		if count == 0 {
			return []vk.PresentModeKHR{}
		}
		mut modes := []vk.PresentModeKHR{len: int(count)}
		fill_result := vk.get_physical_device_surface_present_modes_khr(device.handle, surface, &count, modes.data)
		if fill_result == .incomplete {
			continue
		}
		require_success(fill_result, 'vkGetPhysicalDeviceSurfacePresentModesKHR(values)')!
		return modes[..int(count)].clone()
	}
	return []vk.PresentModeKHR{}
}

// surface_support obtains the capabilities, formats, and present modes needed
// to configure or recreate a swapchain.
pub fn (device PhysicalDevice) surface_support(surface vk.SurfaceKHR) !SurfaceSupport {
	return SurfaceSupport{
		capabilities: device.surface_capabilities(surface)!
		formats: device.surface_formats(surface)!
		present_modes: device.surface_present_modes(surface)!
	}
}

// select_surface_format picks the first available exact match in preferred
// order, falling back to the first advertised format. A lone undefined format
// means the surface accepts the caller's first preference.
pub fn select_surface_format(available []vk.SurfaceFormatKHR,
	preferred []vk.SurfaceFormatKHR) !vk.SurfaceFormatKHR {
	if available.len == 0 {
		return error('surface exposes no formats')
	}
	if available.len == 1 && available[0].format == .undefined && preferred.len > 0 {
		return preferred[0]
	}
	for wanted in preferred {
		for candidate in available {
			if candidate.format == wanted.format && candidate.colorSpace == wanted.colorSpace {
				return candidate
			}
		}
	}
	return available[0]
}

// select_present_mode picks the first available mode in preferred order. FIFO
// is the portable fallback; malformed empty input is rejected.
pub fn select_present_mode(available []vk.PresentModeKHR,
	preferred []vk.PresentModeKHR) !vk.PresentModeKHR {
	if available.len == 0 {
		return error('surface exposes no present modes')
	}
	for wanted in preferred {
		if wanted in available {
			return wanted
		}
	}
	if vk.PresentModeKHR.fifo in available {
		return .fifo
	}
	return available[0]
}

// select_surface_extent returns the surface's fixed extent when one is set,
// otherwise clamps the requested framebuffer extent to the advertised range.
pub fn select_surface_extent(capabilities vk.SurfaceCapabilitiesKHR,
	requested vk.Extent2D) vk.Extent2D {
	if capabilities.currentExtent.width != max_u32 {
		return capabilities.currentExtent
	}
	return vk.Extent2D{
		width: clamp_u32(requested.width, capabilities.minImageExtent.width, capabilities.maxImageExtent.width)
		height: clamp_u32(requested.height, capabilities.minImageExtent.height, capabilities.maxImageExtent.height)
	}
}

fn clamp_u32(value u32, minimum u32, maximum u32) u32 {
	return if value < minimum {
		minimum
	} else if value > maximum {
		maximum
	} else {
		value
	}
}

// select_surface_image_count requests minImageCount plus additional_images and
// clamps the result to maxImageCount when the surface defines a maximum.
pub fn select_surface_image_count(capabilities vk.SurfaceCapabilitiesKHR,
	additional_images u32) u32 {
	mut count := if additional_images > max_u32 - capabilities.minImageCount {
		max_u32
	} else {
		capabilities.minImageCount + additional_images
	}
	if capabilities.maxImageCount > 0 && count > capabilities.maxImageCount {
		count = capabilities.maxImageCount
	}
	return count
}

// select_composite_alpha picks the first supported mode in preferred order.
pub fn select_composite_alpha(supported vk.CompositeAlphaFlagsKHR,
	preferred []vk.CompositeAlphaFlagBitsKHR) !vk.CompositeAlphaFlagBitsKHR {
	for wanted in preferred {
		if supported & u32(wanted) != 0 {
			return wanted
		}
	}
	return error('surface exposes none of the preferred composite-alpha modes')
}
