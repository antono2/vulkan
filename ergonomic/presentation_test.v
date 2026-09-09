module ergonomic

import antono2.vulkan as vk

fn surface_format(format vk.Format, color_space vk.ColorSpaceKHR) vk.SurfaceFormatKHR {
	return vk.SurfaceFormatKHR{
		format: format
		colorSpace: color_space
	}
}

fn test_select_surface_format_uses_preference_order() ! {
	linear := surface_format(.r8g8b8a8_unorm, .srgb_nonlinear)
	srgb := surface_format(.b8g8r8a8_srgb, .srgb_nonlinear)
	selected := select_surface_format([linear, srgb], [srgb, linear])!
	assert selected.format == .b8g8r8a8_srgb
	assert selected.colorSpace == .srgb_nonlinear
}

fn test_select_surface_format_accepts_preference_for_undefined_surface() ! {
	undefined := surface_format(.undefined, .srgb_nonlinear)
	preferred := surface_format(.b8g8r8a8_srgb, .srgb_nonlinear)
	assert select_surface_format([undefined], [preferred])! == preferred
}

fn test_select_surface_format_rejects_empty_input() {
	select_surface_format([], []) or {
		assert err.msg() == 'surface exposes no formats'
		return
	}
	assert false
}

fn test_select_present_mode_uses_preference_then_fifo_fallback() ! {
	available := [vk.PresentModeKHR.fifo, .mailbox]
	assert select_present_mode(available, [.immediate, .mailbox])! == .mailbox
	assert select_present_mode(available, [.immediate])! == .fifo
}

fn test_select_present_mode_rejects_empty_input() {
	select_present_mode([], [.fifo]) or {
		assert err.msg() == 'surface exposes no present modes'
		return
	}
	assert false
}

fn test_select_surface_extent_uses_fixed_extent() {
	capabilities := vk.SurfaceCapabilitiesKHR{
		currentExtent: vk.Extent2D{ width: 800, height: 600 }
	}
	assert select_surface_extent(capabilities, vk.Extent2D{ width: 1920, height: 1080 }) == vk.Extent2D{ width: 800, height: 600 }
}

fn test_select_surface_extent_clamps_variable_extent() {
	capabilities := vk.SurfaceCapabilitiesKHR{
		currentExtent: vk.Extent2D{ width: max_u32, height: max_u32 }
		minImageExtent: vk.Extent2D{ width: 320, height: 240 }
		maxImageExtent: vk.Extent2D{ width: 1920, height: 1080 }
	}
	assert select_surface_extent(capabilities, vk.Extent2D{ width: 200, height: 1440 }) == vk.Extent2D{ width: 320, height: 1080 }
}

fn test_select_surface_image_count_clamps_and_avoids_overflow() {
	bounded := vk.SurfaceCapabilitiesKHR{ minImageCount: 2, maxImageCount: 3 }
	assert select_surface_image_count(bounded, 1) == 3
	assert select_surface_image_count(bounded, 10) == 3
	unbounded := vk.SurfaceCapabilitiesKHR{ minImageCount: max_u32 - 1 }
	assert select_surface_image_count(unbounded, 10) == max_u32
}

fn test_select_composite_alpha_uses_supported_preference() ! {
	supported := u32(vk.CompositeAlphaFlagBitsKHR.opaque) | u32(vk.CompositeAlphaFlagBitsKHR.inherit)
	assert select_composite_alpha(supported, [.pre_multiplied, .inherit, .opaque])! == .inherit
}

fn test_select_composite_alpha_rejects_missing_preference() {
	select_composite_alpha(u32(vk.CompositeAlphaFlagBitsKHR.opaque), [.inherit]) or {
		assert err.msg() == 'surface exposes none of the preferred composite-alpha modes'
		return
	}
	assert false
}

fn test_surface_queries_reject_null_before_vulkan_call() {
	device := PhysicalDevice{}
	device.surface_support(unsafe { nil }) or {
		assert err.msg() == 'presentation surface must not be null'
		return
	}
	assert false
}
