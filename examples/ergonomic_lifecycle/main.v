module main

import antono2.vulkan as vk
import antono2.vulkan.ergonomic as vke

fn main() {
	instance := vke.new_instance_with_options(vke.InstanceOptions{
		application_name: 'ergonomic lifecycle smoke test'
		api_version: vk.api_version_1_0
		layers: ['VK_LAYER_KHRONOS_validation']
	}) or { panic(err) }
	defer {
		instance.destroy()
	}

	physical_devices := instance.physical_devices() or { panic(err) }
	if physical_devices.len == 0 {
		panic('no Vulkan physical devices were found')
	}
	physical_device := physical_devices[0]
	required_queue_flags := u32(vk.QueueFlagBits.graphics) | u32(vk.QueueFlagBits.compute)
	queue_family := physical_device.find_queue_family(required_queue_flags) or {
		panic('no graphics/compute queue family was found')
	}
	device := physical_device.new_device_with_options(vke.DeviceOptions{
		queue_family: queue_family
	}) or { panic(err) }
	defer {
		device.destroy()
	}

	memory_properties := u32(vk.MemoryPropertyFlagBits.device_local)
	buffer_usage := u32(vk.BufferUsageFlagBits.vertex_buffer) | u32(vk.BufferUsageFlagBits.transfer_dst)
	buffer := device.new_buffer(4096, buffer_usage, memory_properties) or { panic(err) }
	defer {
		buffer.destroy()
	}

	image_usage := u32(vk.ImageUsageFlagBits.sampled) | u32(vk.ImageUsageFlagBits.transfer_dst)
	image := device.new_image_2d(64, 64, .r8g8b8a8_unorm, .optimal, image_usage, memory_properties) or { panic(err) }
	defer {
		image.destroy()
	}
	view := image.new_view(u32(vk.ImageAspectFlagBits.color)) or { panic(err) }
	defer {
		view.destroy()
	}

	pool_flags := u32(vk.CommandPoolCreateFlagBits.reset_command_buffer)
	pool := device.new_command_pool(pool_flags) or { panic(err) }
	defer {
		pool.destroy()
	}
	mut command_buffer := pool.allocate_primary(1) or { panic(err) }[0]
	defer {
		command_buffer.free()
	}
	command_buffer.begin(u32(vk.CommandBufferUsageFlagBits.one_time_submit)) or { panic(err) }
	transition := vke.ImageLayoutTransition{
		old_layout: .undefined
		new_layout: .transfer_dst_optimal
		src_stage_mask: u32(vk.PipelineStageFlagBits.top_of_pipe)
		dst_stage_mask: u32(vk.PipelineStageFlagBits.transfer)
		dst_access_mask: u32(vk.AccessFlagBits.transfer_write)
		aspect_mask: u32(vk.ImageAspectFlagBits.color)
	}
	command_buffer.transition_image_layout(image, transition) or { panic(err) }
	command_buffer.end() or { panic(err) }

	mut fence := device.new_fence(false) or { panic(err) }
	defer {
		fence.destroy()
	}
	mut semaphore := device.new_semaphore() or { panic(err) }
	defer {
		semaphore.destroy()
	}
	device.queue.submit([command_buffer], vke.SubmitOptions{
		fence: fence
	}) or { panic(err) }
	if fence.wait(5_000_000_000) or { panic(err) } != .success {
		panic('queue submission did not complete before the smoke-test timeout')
	}

	println('Vulkan ergonomic lifecycle passed on ${physical_device.name()}')
}
