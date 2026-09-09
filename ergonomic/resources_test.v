module ergonomic

import antono2.vulkan as vk

fn test_validate_buffer_range_rejects_empty_and_overflowing_ranges() {
	validate_buffer_range(64, 0, 0) or {
		assert err.msg() == 'mapped buffer size must be greater than zero'
		validate_buffer_range(64, 60, 8) or {
			assert err.msg() == 'mapped buffer range exceeds buffer size'
			return
		}
	}
	assert false
}

fn test_map_rejects_non_host_visible_memory_before_vulkan_call() {
	buffer := OwnedBuffer{
		size: 64
		memory_properties: u32(vk.MemoryPropertyFlagBits.device_local)
	}
	buffer.map(0, 64, 0) or {
		assert err.msg() == 'buffer memory is not host visible'
		return
	}
	assert false
}

fn test_write_bytes_checks_range_and_copies_to_coherent_mapping() ! {
	mut storage := []u8{len: 8}
	mapping := MappedBufferMemory{
		memory_properties: u32(vk.MemoryPropertyFlagBits.host_visible) | u32(vk.MemoryPropertyFlagBits.host_coherent)
		size: 8
		data: storage.data
	}
	mapping.write_bytes(2, [u8(7), 8, 9])!
	assert storage == [u8(0), 0, 7, 8, 9, 0, 0, 0]
	mapping.write_bytes(7, [u8(1), 2]) or {
		assert err.msg() == 'mapped buffer write exceeds mapped range'
		return
	}
	assert false
}

fn test_write_bytes_rejects_noncoherent_mapping() {
	mut storage := []u8{len: 4}
	mapping := MappedBufferMemory{
		memory_properties: u32(vk.MemoryPropertyFlagBits.host_visible)
		size: 4
		data: storage.data
	}
	mapping.write_bytes(0, [u8(1)]) or {
		assert err.msg() == 'write_bytes requires host-coherent buffer memory'
		return
	}
	assert false
}

fn test_upload_bytes_validates_empty_write_offset_without_vulkan_call() ! {
	buffer := OwnedBuffer{ size: 4 }
	buffer.upload_bytes(4, [])!
	buffer.upload_bytes(5, []) or {
		assert err.msg() == 'mapped buffer range exceeds buffer size'
		return
	}
	assert false
}

fn test_shader_validation_rejects_invalid_input_before_vulkan_call() {
	device := Device{}
	device.new_shader_module([]) or {
		assert err.msg() == 'SPIR-V code must not be empty'
		device.new_shader_module([u32(1)]) or {
			assert err.msg() == 'SPIR-V code has an invalid magic word'
			device.new_shader_module_bytes([u8(3), 2, 35]) or {
				assert err.msg() == 'SPIR-V byte count must be a multiple of four'
				return
			}
		}
	}
	assert false
}

fn test_mapping_and_shader_cleanup_are_idempotent_when_cleared() {
	mut mapping := MappedBufferMemory{}
	mapping.unmap()
	mapping.unmap()
	assert isnil(mapping.data)
	mut shader := OwnedShaderModule{}
	shader.destroy()
	shader.destroy()
	assert isnil(shader.handle)
}
