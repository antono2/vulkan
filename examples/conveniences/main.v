// Headless integration check for descriptors, format queries and cache round trips.
module main

import antono2.vulkan as vk
import antono2.vulkan.ergonomic as vke

fn main() {
	run() or {
		eprintln(err)
		exit(1)
	}
}

fn run() ! {
	uniform_binding := u32(0)
	set_count := u32(2) // Two sets, each with one uniform-buffer descriptor.
	uniform_bytes := u64(16 * sizeof(f32)) // Space for a 4x4 float matrix.
	probe_timeout_ns := u64(10_000_000_000) // Ten seconds; Vulkan timeouts use nanoseconds.
	mut instance := vke.new_instance_with_options(vke.InstanceOptions{
		// Device UUID and external-resource capability queries require Vulkan 1.1.
		api_version: vk.api_version_1_1
		extensions:  [
			'VK_EXT_debug_utils',
		]
	})!
	defer { instance.destroy() }
	devices := instance.physical_devices()!
	if devices.len == 0 { return error('no Vulkan device') }
	physical := devices[0]
	identity := instance.device_identity(physical)!
	assert identity.device_uuid.len == 16 // Vulkan device UUIDs contain 16 bytes.
	$if linux {
		memory := instance.external_buffer_properties(physical,
			u32(vk.BufferUsageFlagBits.vertex_buffer), 0, .opaque_fd)!
		semaphore := instance.external_semaphore_properties(physical, .opaque_fd)!
		println('external buffer flags=${memory.externalMemoryFeatures}, semaphore flags=${semaphore.externalSemaphoreFeatures}')
	}
	family := physical.find_queue_family(u32(vk.QueueFlagBits.graphics)) or {
		return error('no graphics queue')
	}
	mut device := physical.new_device(family)!
	defer { device.destroy() }
	format := physical.select_format([vk.Format.d32_sfloat, .d24_unorm_s8_uint], .optimal,
		u32(vk.FormatFeatureFlagBits.depth_stencil_attachment))!
	assert format != .undefined
	support := physical.image_format_properties(.r8g8b8a8_unorm, ._2d, .optimal,
		u32(vk.ImageUsageFlagBits.sampled), 0)!
	assert support.supported
	mut layout := device.new_descriptor_layout([
		vk.DescriptorSetLayoutBinding{
			binding:         uniform_binding
			descriptorType:  .uniform_buffer
			descriptorCount: 1
			stageFlags:      u32(vk.ShaderStageFlagBits.vertex)
		},
	])!
	defer { layout.destroy() }
	mut pool := device.new_descriptor_pool(set_count, [
		vk.DescriptorPoolSize{ type: .uniform_buffer, descriptorCount: set_count },
	])!
	defer { pool.destroy() }
	mut buffer := device.new_buffer(uniform_bytes, u32(vk.BufferUsageFlagBits.uniform_buffer),
		u32(vk.MemoryPropertyFlagBits.host_visible) | u32(vk.MemoryPropertyFlagBits.host_coherent))!
	defer { buffer.destroy() }
	sets := pool.allocate([layout, layout])!
	for set in sets {
		set.write_buffers(uniform_binding, 0, [
			vk.DescriptorBufferInfo{ buffer: buffer.handle, range: uniform_bytes },
		])!
	}
	mut rejected := false
	// Array element 1 is invalid: this binding contains only element 0.
	sets[0].write_buffers(uniform_binding, 1, [
		vk.DescriptorBufferInfo{ buffer: buffer.handle, range: uniform_bytes },
	]) or { rejected = true }
	assert rejected
	pool.reset()!
	rejected = false
	sets[0].write_buffers(uniform_binding, 0, [
		vk.DescriptorBufferInfo{ buffer: buffer.handle, range: uniform_bytes },
	]) or { rejected = true }
	assert rejected
	assert pool.allocate([layout])!.len == 1
	mut cache := device.new_pipeline_cache([])!
	defer { cache.destroy() }
	data := cache.bytes()!
	assert data.len >= 32 // Version-one cache headers occupy at least 32 bytes.
	mut restored := device.new_pipeline_cache(data)!
	defer { restored.destroy() }
	mut corrupt := data.clone()
	// Byte 8 begins vendorID in a version-one header; flip it to test rejection.
	corrupt[8] ^= 0xff
	rejected = false
	device.new_pipeline_cache(corrupt) or { rejected = true }
	assert rejected
	labels := device.debug_labels()!
	// Two timestamps bracket the command buffer: start at 0, end at 1.
	mut queries := device.new_timestamp_queries(2)!
	defer { queries.destroy() }
	mut commands := device.new_command_pool(0)!
	defer { commands.destroy() }
	mut command := commands.allocate_primary(1)![0]
	mut completed := device.new_fence(false)!
	defer { completed.destroy() }
	defer { device.wait_idle() or {} }
	command.begin(u32(vk.CommandBufferUsageFlagBits.one_time_submit))!
	queries.reset(command.handle)!
	label_rgba := [f32(0.1), 0.4, 0.8, 1.0]! // Opaque blue in GPU debugging tools.
	labels.begin_label(command.handle, 'timestamp probe', label_rgba)
	queries.write(command.handle, .top_of_pipe, 0)!
	queries.write(command.handle, .bottom_of_pipe, 1)!
	labels.end_label(command.handle)
	command.end()!
	device.queue.submit([command], vke.SubmitOptions{ fence: completed.handle })!
	vke.require_success(completed.wait(probe_timeout_ns)!, 'wait timestamp probe')!
	samples := queries.read()!
	assert samples.len == 2 && samples[0].available && samples[1].available
	assert queries.elapsed_ns(samples[0], samples[1])! >= 0
	println('Vulkan format, descriptor, cache and timestamp checks passed on ${physical.name()}')
}
