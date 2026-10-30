module main

import ci.header_order_smoke.consumer
import antono2.vulkan as vk

fn main() {
	assert consumer.header_version() == u32(vk.header_version)
}
