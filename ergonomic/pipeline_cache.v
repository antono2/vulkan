// Pipeline cache blobs are driver/device-specific; callers own storage policy.
module ergonomic

import antono2.vulkan as vk
import encoding.binary

@[nocopy]
pub struct OwnedPipelineCache {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
pub mut:
	handle vk.PipelineCache
}

pub fn pipeline_cache_compatible(data []u8, properties vk.PhysicalDeviceProperties) bool {
	if data.len < 32 { return false }
	if binary.little_endian_u32(data[..4]) != 32 || binary.little_endian_u32(data[4..8]) != 1 {
		return false
	}
	if binary.little_endian_u32(data[8..12]) != properties.vendorID
		|| binary.little_endian_u32(data[12..16]) != properties.deviceID {
		return false
	}
	for i in 0 .. 16 {
		if data[16 + i] != properties.pipelineCacheUUID[i] { return false }
	}
	return true
}

// Rejected data returns an error; pass [] to explicitly start with an empty cache.
pub fn (device &OwnedDevice) new_pipeline_cache(data []u8) !&OwnedPipelineCache {
	if data.len > 0 && !pipeline_cache_compatible(data, device.physical_device.properties) {
		return error('pipeline cache header does not match this device')
	}
	info := vk.PipelineCacheCreateInfo{
		initialDataSize: usize(data.len)
		pInitialData:    data.data
	}
	mut handle := vk.PipelineCache(unsafe { nil })
	require_success(vk.create_pipeline_cache(device.handle, &info, allocator_ptr(device.allocator),
		&handle), 'vkCreatePipelineCache')!
	return &OwnedPipelineCache{
		device:    device.handle
		allocator: device.allocator
		handle:    handle
	}
}

// Caller externally synchronizes cache use, including pipeline creation.
pub fn (cache &OwnedPipelineCache) bytes() ![]u8 {
	if isnil(cache.handle) { return error('pipeline cache is destroyed') }
	for {
		mut size := usize(0)
		require_success(vk.get_pipeline_cache_data(cache.device, cache.handle, &size,
			unsafe { nil }), 'vkGetPipelineCacheData(size)')!
		if size > usize(max_int) { return error('pipeline cache exceeds V array capacity') }
		mut data := []u8{len: int(size)}
		status := vk.get_pipeline_cache_data(cache.device, cache.handle, &size, data.data)
		if status == .incomplete { continue
		 }
		require_success(status, 'vkGetPipelineCacheData(bytes)')!
		return data[..int(size)].clone()
	}
	return []u8{}
}

pub fn (mut cache OwnedPipelineCache) destroy() {
	if !isnil(cache.handle) {
		vk.destroy_pipeline_cache(cache.device, cache.handle, allocator_ptr(cache.allocator))
		cache.handle = unsafe { nil }
	}
}
