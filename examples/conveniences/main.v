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
	mut instance := vke.new_instance_with_options(vke.InstanceOptions{
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
	assert identity.device_uuid.len == 16
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
			binding:         0
			descriptorType:  .uniform_buffer
			descriptorCount: 1
			stageFlags:      u32(vk.ShaderStageFlagBits.vertex)
		},
	])!
	defer { layout.destroy() }
	mut pool := device.new_descriptor_pool(2, [
		vk.DescriptorPoolSize{ type: .uniform_buffer, descriptorCount: 2 },
	])!
	defer { pool.destroy() }
	mut buffer := device.new_buffer(64, u32(vk.BufferUsageFlagBits.uniform_buffer),
		u32(vk.MemoryPropertyFlagBits.host_visible) | u32(vk.MemoryPropertyFlagBits.host_coherent))!
	defer { buffer.destroy() }
	sets := pool.allocate([layout, layout])!
	for set in sets {
		set.write_buffers(0, 0, [
			vk.DescriptorBufferInfo{ buffer: buffer.handle, range: 64 },
		])!
	}
	mut rejected := false
	sets[0].write_buffers(0, 1, [
		vk.DescriptorBufferInfo{ buffer: buffer.handle, range: 64 },
	]) or { rejected = true }
	assert rejected
	pool.reset()!
	rejected = false
	sets[0].write_buffers(0, 0, [
		vk.DescriptorBufferInfo{ buffer: buffer.handle, range: 64 },
	]) or { rejected = true }
	assert rejected
	assert pool.allocate([layout])!.len == 1
	mut cache := device.new_pipeline_cache([])!
	defer { cache.destroy() }
	data := cache.bytes()!
	assert data.len >= 32
	mut restored := device.new_pipeline_cache(data)!
	defer { restored.destroy() }
	mut corrupt := data.clone()
	corrupt[8] ^= 255
	rejected = false
	device.new_pipeline_cache(corrupt) or { rejected = true }
	assert rejected
	labels := device.debug_labels()!
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
	labels.begin_label(command.handle, 'timestamp probe', [f32(0.1), 0.4, 0.8, 1.0]!)
	queries.write(command.handle, .top_of_pipe, 0)!
	queries.write(command.handle, .bottom_of_pipe, 1)!
	labels.end_label(command.handle)
	command.end()!
	device.queue.submit([command], vke.SubmitOptions{ fence: completed.handle })!
	vke.require_success(completed.wait(10_000_000_000)!, 'wait timestamp probe')!
	samples := queries.read()!
	assert samples.len == 2 && samples[0].available && samples[1].available
	assert queries.elapsed_ns(samples[0], samples[1])! >= 0
	println('Vulkan format, descriptor, cache and timestamp checks passed on ${physical.name()}')
}
