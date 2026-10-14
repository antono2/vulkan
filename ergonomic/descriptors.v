// Owned layouts and pools; descriptor sets borrow their pool and layout metadata.
module ergonomic

import antono2.vulkan as vk

@[nocopy]
pub struct OwnedDescriptorLayout {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
	bindings  []vk.DescriptorSetLayoutBinding
pub mut:
	handle vk.DescriptorSetLayout
}

pub fn (device &OwnedDevice) new_descriptor_layout(bindings []vk.DescriptorSetLayoutBinding) !&OwnedDescriptorLayout {
	mut seen := map[u32]bool{}
	for binding in bindings {
		if binding.descriptorCount == 0 || binding.stageFlags == 0 || binding.binding in seen {
			return error('descriptor bindings need unique numbers, nonzero counts and shader stages')
		}
		if !isnil(binding.pImmutableSamplers) {
			return error('immutable samplers require the raw descriptor layout API')
		}
		seen[binding.binding] = true
	}
	info := vk.DescriptorSetLayoutCreateInfo{
		bindingCount: u32(bindings.len)
		pBindings:    bindings.data
	}
	mut handle := vk.DescriptorSetLayout(unsafe { nil })
	require_success(vk.create_descriptor_set_layout(device.handle, &info,
		allocator_ptr(device.allocator), &handle), 'vkCreateDescriptorSetLayout')!
	return &OwnedDescriptorLayout{
		device:    device.handle
		allocator: device.allocator
		bindings:  bindings.clone()
		handle:    handle
	}
}

pub fn (mut layout OwnedDescriptorLayout) destroy() {
	if !isnil(layout.handle) {
		vk.destroy_descriptor_set_layout(layout.device, layout.handle,
			allocator_ptr(layout.allocator))
		layout.handle = unsafe { nil }
	}
}

@[heap; nocopy]
pub struct OwnedDescriptorPool {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
mut:
	generation u64
pub mut:
	handle vk.DescriptorPool
}

pub fn (device &OwnedDevice) new_descriptor_pool(max_sets u32, sizes []vk.DescriptorPoolSize) !&OwnedDescriptorPool {
	if max_sets == 0 { return error('descriptor pool max_sets must be positive') }
	for size in sizes {
		if size.descriptorCount == 0 { return error('descriptor pool sizes must be positive') }
	}
	info := vk.DescriptorPoolCreateInfo{
		maxSets:       max_sets
		poolSizeCount: u32(sizes.len)
		pPoolSizes:    sizes.data
	}
	mut handle := vk.DescriptorPool(unsafe { nil })
	require_success(vk.create_descriptor_pool(device.handle, &info,
		allocator_ptr(device.allocator), &handle), 'vkCreateDescriptorPool')!
	return &OwnedDescriptorPool{
		device:    device.handle
		allocator: device.allocator
		handle:    handle
	}
}

// Pool reset/destruction invalidates every set. Complete GPU use before either.
pub fn (mut pool OwnedDescriptorPool) reset() ! {
	if isnil(pool.handle) { return error('descriptor pool is destroyed') }
	require_success(vk.reset_descriptor_pool(pool.device, pool.handle, 0), 'vkResetDescriptorPool')!
	pool.generation++
}

pub fn (mut pool OwnedDescriptorPool) destroy() {
	if !isnil(pool.handle) {
		vk.destroy_descriptor_pool(pool.device, pool.handle, allocator_ptr(pool.allocator))
		pool.handle = unsafe { nil }
		pool.generation++
	}
}

pub struct BorrowedDescriptorSet {
	pool       &OwnedDescriptorPool
	generation u64
	bindings   []vk.DescriptorSetLayoutBinding
pub:
	handle vk.DescriptorSet
}

pub fn (pool &OwnedDescriptorPool) allocate(layouts []&OwnedDescriptorLayout) ![]BorrowedDescriptorSet {
	if isnil(pool.handle) { return error('descriptor pool is destroyed') }
	if layouts.len == 0 { return []BorrowedDescriptorSet{} }
	mut handles := []vk.DescriptorSetLayout{cap: layouts.len}
	for layout in layouts {
		if isnil(layout.handle) || layout.device != pool.device {
			return error('descriptor layout belongs to another device or is destroyed')
		}
		handles << layout.handle
	}
	info := vk.DescriptorSetAllocateInfo{
		descriptorPool:     pool.handle
		descriptorSetCount: u32(handles.len)
		pSetLayouts:        handles.data
	}
	mut sets := []vk.DescriptorSet{len: handles.len, init: vk.DescriptorSet(unsafe { nil })}
	require_success(vk.allocate_descriptor_sets(pool.device, &info, sets.data),
		'vkAllocateDescriptorSets')!
	mut result := []BorrowedDescriptorSet{cap: sets.len}
	for i, handle in sets {
		result << BorrowedDescriptorSet{
			pool:       pool
			generation: pool.generation
			bindings:   layouts[i].bindings.clone()
			handle:     handle
		}
	}
	return result
}

fn (set BorrowedDescriptorSet) binding_type(binding u32, first u32, count int) !vk.DescriptorType {
	if isnil(set.pool.handle) || set.generation != set.pool.generation {
		return error('descriptor set invalidated by pool reset or destruction')
	}
	for entry in set.bindings {
		if entry.binding == binding {
			if count < 1 || u64(first) + u64(count) > entry.descriptorCount {
				return error('descriptor write exceeds binding array')
			}
			return entry.descriptorType
		}
	}
	return error('descriptor binding does not exist')
}

pub fn (set BorrowedDescriptorSet) write_buffers(binding u32, first u32, infos []vk.DescriptorBufferInfo) ! {
	kind := set.binding_type(binding, first, infos.len)!
	if kind !in [.uniform_buffer, .storage_buffer, .uniform_buffer_dynamic, .storage_buffer_dynamic] {
		return error('binding does not accept buffer descriptors')
	}
	for info in infos {
		if isnil(info.buffer) || info.range == 0 {
			return error('buffer descriptor needs a buffer and nonzero range')
		}
	}
	write := vk.WriteDescriptorSet{
		dstSet:          set.handle
		dstBinding:      binding
		dstArrayElement: first
		descriptorCount: u32(infos.len)
		descriptorType:  kind
		pBufferInfo:     infos.data
	}
	vk.update_descriptor_sets(set.pool.device, 1, &write, 0, unsafe { nil })
}

pub fn (set BorrowedDescriptorSet) write_images(binding u32, first u32, infos []vk.DescriptorImageInfo) ! {
	kind := set.binding_type(binding, first, infos.len)!
	if kind !in [.sampler, .combined_image_sampler, .sampled_image, .storage_image, .input_attachment] {
		return error('binding does not accept image descriptors')
	}
	for info in infos {
		if kind != .sampler && isnil(info.imageView) {
			return error('image descriptor needs a view')
		}
		if kind in [.sampler, .combined_image_sampler] && isnil(info.sampler) {
			return error('sampler descriptor needs a sampler')
		}
	}
	write := vk.WriteDescriptorSet{
		dstSet:          set.handle
		dstBinding:      binding
		dstArrayElement: first
		descriptorCount: u32(infos.len)
		descriptorType:  kind
		pImageInfo:      infos.data
	}
	vk.update_descriptor_sets(set.pool.device, 1, &write, 0, unsafe { nil })
}
