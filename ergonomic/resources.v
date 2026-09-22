module ergonomic

import antono2.vulkan as vk

// MappedBufferMemory is a borrowed mapping of one OwnedBuffer range. The
// buffer and its parent OwnedDevice must outlive the mapping.
@[nocopy]
pub struct MappedBufferMemory {
	device            vk.Device
	memory            vk.DeviceMemory
	memory_properties vk.MemoryPropertyFlags
pub:
	offset vk.DeviceSize
	size   vk.DeviceSize
pub mut:
	data voidptr
}

fn validate_buffer_range(buffer_size vk.DeviceSize, offset vk.DeviceSize,
	size vk.DeviceSize) ! {
	if size == 0 {
		return error('mapped buffer size must be greater than zero')
	}
	if offset > buffer_size || size > buffer_size - offset {
		return error('mapped buffer range exceeds buffer size')
	}
}

// map maps a checked range of host-visible buffer memory. For non-coherent
// memory, callers using data directly remain responsible for flush/invalidate.
pub fn (buffer &OwnedBuffer) map(offset vk.DeviceSize, size vk.DeviceSize,
	flags vk.MemoryMapFlags) !&MappedBufferMemory {
	validate_buffer_range(buffer.size, offset, size)!
	if buffer.memory_properties & u32(vk.MemoryPropertyFlagBits.host_visible) == 0 {
		return error('buffer memory is not host visible')
	}
	mut data := voidptr(unsafe { nil })
	require_success(vk.map_memory(buffer.device, buffer.memory, offset, size, flags, &data), 'vkMapMemory')!
	return &MappedBufferMemory{
		device:            buffer.device
		memory:            buffer.memory
		memory_properties: buffer.memory_properties
		offset:            offset
		size:              size
		data:              data
	}
}

// write_bytes copies bytes into coherent mapped memory after validating the
// relative range. Empty writes are harmless.
pub fn (mapping &MappedBufferMemory) write_bytes(relative_offset vk.DeviceSize,
	bytes []u8) ! {
	if isnil(mapping.data) {
		return error('buffer memory is not mapped')
	}
	if mapping.memory_properties & u32(vk.MemoryPropertyFlagBits.host_coherent) == 0 {
		return error('write_bytes requires host-coherent buffer memory')
	}
	byte_count := vk.DeviceSize(bytes.len)
	if relative_offset > mapping.size || byte_count > mapping.size - relative_offset {
		return error('mapped buffer write exceeds mapped range')
	}
	if bytes.len == 0 {
		return
	}
	unsafe {
		destination := voidptr(usize(mapping.data) + usize(relative_offset))
		vmemcpy(destination, bytes.data, bytes.len)
	}
}

// unmap ends this mapping and clears its pointer. Repeated calls are harmless.
pub fn (mut mapping MappedBufferMemory) unmap() {
	if isnil(mapping.data) {
		return
	}
	vk.unmap_memory(mapping.device, mapping.memory)
	mapping.data = unsafe { nil }
}

// upload_bytes performs one checked map/copy/unmap operation. The buffer must
// use host-visible, host-coherent memory.
pub fn (buffer &OwnedBuffer) upload_bytes(offset vk.DeviceSize, bytes []u8) ! {
	if bytes.len == 0 {
		if offset > buffer.size {
			return error('mapped buffer range exceeds buffer size')
		}
		return
	}
	mut mapping := buffer.map(offset, vk.DeviceSize(bytes.len), 0)!
	defer {
		mapping.unmap()
	}
	mapping.write_bytes(0, bytes)!
}

// OwnedShaderModule owns a VkShaderModule created from validated SPIR-V words.
// Its parent OwnedDevice must outlive it.
@[nocopy]
pub struct OwnedShaderModule {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
pub mut:
	handle vk.ShaderModule
}

fn validate_spirv_words(words []u32) ! {
	if words.len == 0 {
		return error('SPIR-V code must not be empty')
	}
	if words[0] != u32(0x07230203) {
		return error('SPIR-V code has an invalid magic word')
	}
}

// new_shader_module creates an owned module from aligned SPIR-V words.
pub fn (device &OwnedDevice) new_shader_module(words []u32) !&OwnedShaderModule {
	validate_spirv_words(words)!
	info := vk.ShaderModuleCreateInfo{
		codeSize: usize(words.len) * sizeof(u32)
		pCode:    words.data
	}
	mut handle := vk.ShaderModule(unsafe { nil })
	require_success(vk.create_shader_module(device.handle, &info, allocator_ptr(device.allocator), &handle), 'vkCreateShaderModule')!
	return &OwnedShaderModule{
		device:    device.handle
		allocator: device.allocator
		handle:    handle
	}
}

// new_shader_module_bytes validates the byte count and copies bytes into an
// aligned word slice before creating an owned shader module.
pub fn (device &OwnedDevice) new_shader_module_bytes(code []u8) !&OwnedShaderModule {
	if code.len == 0 {
		return error('SPIR-V code must not be empty')
	}
	word_size := int(sizeof(u32))
	if code.len % word_size != 0 {
		return error('SPIR-V byte count must be a multiple of four')
	}
	mut words := []u32{len: code.len / word_size}
	unsafe {
		vmemcpy(words.data, code.data, code.len)
	}
	return device.new_shader_module(words)
}

// destroy releases the shader module and clears its handle. Repeated calls
// are harmless while the parent OwnedDevice remains alive.
pub fn (mut shader OwnedShaderModule) destroy() {
	if isnil(shader.handle) {
		return
	}
	vk.destroy_shader_module(shader.device, shader.handle, allocator_ptr(shader.allocator))
	shader.handle = vk.ShaderModule(unsafe { nil })
}

// wait_idle waits for all work submitted to this device to complete.
pub fn (device &OwnedDevice) wait_idle() ! {
	require_success(vk.device_wait_idle(device.handle), 'vkDeviceWaitIdle')!
}

// wait_idle waits for all work submitted to this queue to complete.
pub fn (queue Queue) wait_idle() ! {
	require_success(vk.queue_wait_idle(queue.handle), 'vkQueueWaitIdle')!
}
