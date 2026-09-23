module main

import antono2.vulkan as vk

// Compile only: these null arguments would be invalid in a running Vulkan call.
fn main() {
	features := vk.PhysicalDeviceVulkan14Features{}
	println(sizeof(vk.PhysicalDeviceVulkan14Features))
	println(features.dynamicRenderingLocalRead)
	vk.cmd_set_rendering_attachment_locations(vk.CommandBuffer(unsafe { nil }), unsafe { nil })
}
