module consumer

#include "@VMODROOT/ci/header_order_smoke/consumer.h"

fn C.v_vulkan_consumer_header_version() u32

pub fn header_version() u32 {
	return C.v_vulkan_consumer_header_version()
}
