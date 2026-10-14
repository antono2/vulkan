// Cross-API identity and exact external-buffer/semaphore capability queries.
// No dependency on OpenCL or an OS-specific handle import implementation.
module ergonomic

import antono2.vulkan as vk

pub struct DeviceIdentity {
pub:
	device_uuid [16]u8
	driver_uuid [16]u8
}

fn (instance &OwnedInstance) require_interop_queries() ! {
	if isnil(instance.handle) || instance.api_version < vk.api_version_1_1 {
		return error('interop queries require a live Vulkan 1.1+ instance')
	}
}

// physical must come from this instance. UUID matching is necessary but does
// not establish external resource compatibility; query the exact usage too.
pub fn (instance &OwnedInstance) device_identity(physical PhysicalDevice) !DeviceIdentity {
	instance.require_interop_queries()!
	mut id := vk.PhysicalDeviceIDProperties{}
	mut properties := vk.PhysicalDeviceProperties2{
		pNext: &id
	}
	vk.get_physical_device_properties2(physical.handle, mut properties)
	return DeviceIdentity{
		device_uuid: id.deviceUUID
		driver_uuid: id.driverUUID
	}
}

pub fn (instance &OwnedInstance) external_buffer_properties(physical PhysicalDevice, usage vk.BufferUsageFlags, flags vk.BufferCreateFlags, handle_type vk.ExternalMemoryHandleTypeFlagBits) !vk.ExternalMemoryProperties {
	instance.require_interop_queries()!
	if usage == 0 { return error('external buffer usage must be nonzero') }
	info := vk.PhysicalDeviceExternalBufferInfo{
		flags:      flags
		usage:      usage
		handleType: handle_type
	}
	mut properties := vk.ExternalBufferProperties{}
	vk.get_physical_device_external_buffer_properties(physical.handle, &info, mut properties)
	return properties.externalMemoryProperties
}

pub fn (instance &OwnedInstance) external_semaphore_properties(physical PhysicalDevice, handle_type vk.ExternalSemaphoreHandleTypeFlagBits) !vk.ExternalSemaphoreProperties {
	instance.require_interop_queries()!
	info := vk.PhysicalDeviceExternalSemaphoreInfo{
		handleType: handle_type
	}
	mut properties := vk.ExternalSemaphoreProperties{}
	vk.get_physical_device_external_semaphore_properties(physical.handle, &info, mut properties)
	return properties
}
