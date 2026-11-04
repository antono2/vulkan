// Confirms a dependent module sees the same pinned Vulkan header version as the bindings.
module main

import ci.header_order_smoke.consumer
import antono2.vulkan as vk

fn main() {
	assert consumer.header_version() == u32(vk.header_version)
}
