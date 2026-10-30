module main

import antono2.vulkan as vk

#include "@VMODROOT/ci/header_order_smoke/consumer.h"

fn C.v_vulkan_consumer_header_version() u32

fn main() {
	assert C.v_vulkan_consumer_header_version() == u32(vk.header_version)
}
