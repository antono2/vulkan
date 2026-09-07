module ergonomic

import antono2.vulkan as vk

// VulkanError preserves the VkResult and the operation which returned it.
// Callers can match it with `if err is ergonomic.VulkanError`.
pub struct VulkanError {
	Error
pub:
	result    vk.Result
	operation string
}

// msg implements IError without losing the original VkResult value.
pub fn (err VulkanError) msg() string {
	return '${err.operation}: ${err.result} (${int(err.result)})'
}

// is_error reports whether a VkResult is a Vulkan failure code. Positive
// statuses such as timeout and incomplete are not failures.
pub fn is_error(result vk.Result) bool {
	return int(result) < 0
}

// check converts only Vulkan failure codes to typed V errors and
// preserves success and positive status codes for the caller to inspect.
pub fn check(result vk.Result, operation string) !vk.Result {
	if is_error(result) {
		return VulkanError{
			result: result
			operation: operation
		}
	}
	return result
}

// require_success accepts only VK_SUCCESS. It is useful for operations whose
// contract does not expose a meaningful positive status to the caller.
pub fn require_success(result vk.Result, operation string) ! {
	if result != .success {
		return VulkanError{
			result: result
			operation: operation
		}
	}
}

// Instance is a lightweight wrapper around VkInstance. It does not destroy
// itself implicitly; call destroy exactly once for every successfully created
// instance.
pub struct Instance {
pub:
	handle vk.Instance
}

// new_instance initializes Volk, creates an instance with Vulkan's default
// allocator, and loads instance-level commands.
pub fn new_instance(create_info &vk.InstanceCreateInfo) !Instance {
	require_success(vk.initialize_loader(), 'volkInitialize')!
	mut handle := vk.Instance(unsafe { nil })
	require_success(vk.create_instance(create_info, unsafe { nil }, &handle), 'vkCreateInstance')!
	vk.load_instance_commands(handle)
	return Instance{
		handle: handle
	}
}

// destroy destroys an instance created by new_instance.
pub fn (instance Instance) destroy() {
	vk.destroy_instance(instance.handle, unsafe { nil })
}

// PhysicalDevice pairs a Vulkan handle with its core property snapshot.
pub struct PhysicalDevice {
pub:
	handle     vk.PhysicalDevice
	properties vk.PhysicalDeviceProperties
}

// name returns an owned V string copied from VkPhysicalDeviceProperties.
pub fn (device PhysicalDevice) name() string {
	return unsafe { cstring_to_vstring(&device.properties.deviceName[0]) }
}

// physical_devices performs Vulkan's count/fill enumeration pattern and
// retries when the available device set changes and VK_INCOMPLETE is returned.
pub fn (instance Instance) physical_devices() ![]PhysicalDevice {
	for {
		mut count := u32(0)
		require_success(vk.enumerate_physical_devices(instance.handle, &count, unsafe {
			nil
		}), 'vkEnumeratePhysicalDevices(count)')!
		if count == 0 {
			return []PhysicalDevice{}
		}

		mut handles := unsafe { []vk.PhysicalDevice{len: int(count)} }
		result := vk.enumerate_physical_devices(instance.handle, &count, handles.data)
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkEnumeratePhysicalDevices(values)')!

		mut devices := []PhysicalDevice{cap: int(count)}
		for handle in handles[..int(count)] {
			mut properties := vk.PhysicalDeviceProperties{}
			vk.get_physical_device_properties(handle, mut properties)
			devices << PhysicalDevice{
				handle: handle
				properties: properties
			}
		}
		return devices
	}
	return []PhysicalDevice{}
}
