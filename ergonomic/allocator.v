module ergonomic

import antono2.vulkan as vk

// HostAllocator keeps a stable copy of the Vulkan host allocation callbacks.
// pUserData and its backing state remain the application's responsibility.
@[heap]
struct HostAllocator {
	callbacks vk.AllocationCallbacks
}

fn new_host_allocator(callbacks &vk.AllocationCallbacks) &HostAllocator {
	if isnil(callbacks) {
		return unsafe { nil }
	}
	return &HostAllocator{
		callbacks: *callbacks
	}
}

fn allocator_ptr(allocator &HostAllocator) &vk.AllocationCallbacks {
	if isnil(allocator) {
		return unsafe { nil }
	}
	return &allocator.callbacks
}
