module main

import antono2.vulkan as vk

fn accept_xlib_surface(info &vk.XlibSurfaceCreateInfoKHR) {
	_ = info
}

fn main() {
	assert vk.khr_xlib_surface_spec_version > 0
	accept_xlib_surface(unsafe { nil })
}
