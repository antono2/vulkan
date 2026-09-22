module ergonomic

import antono2.vulkan as vk

fn test_host_allocator_is_optional_and_copies_the_callback_struct() {
	assert isnil(allocator_ptr(new_host_allocator(unsafe { nil })))

	mut callbacks := vk.AllocationCallbacks{
		pUserData: unsafe { voidptr(17) }
	}
	allocator := new_host_allocator(&callbacks)
	assert !isnil(allocator_ptr(allocator))
	assert allocator_ptr(allocator).pUserData == unsafe { voidptr(17) }
	callbacks.pUserData = unsafe { voidptr(19) }
	assert allocator_ptr(allocator).pUserData == unsafe { voidptr(17) }
}
