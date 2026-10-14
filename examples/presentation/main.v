// A finite clear-and-present example that recreates its swapchain after resize.
module main

import antono2.glfw
import antono2.vulkan as vk
import antono2.vulkan.ergonomic as vke

fn C.glfwSetWindowSize(window &glfw.Window, width int, height int)
fn main() {
	run() or {
		eprintln(err)
		exit(1)
	}
}

fn run() ! {
	if !glfw.initialize() { return error('GLFW initialization failed') }
	defer { glfw.terminate() }
	glfw.window_hint(glfw.client_api, glfw.no_api)
	window := glfw.create_window(640, 360, 'Vulkan presentation', unsafe { nil }, unsafe { nil })
	if isnil(window) { return error('window creation failed') }
	defer { glfw.destroy_window(window) }
	mut count := u32(0)
	names := glfw.get_required_instance_extensions(&count)
	mut extensions := []string{}
	for i in 0 .. int(count) {
		extensions << unsafe { cstring_to_vstring(names[i]) }
	}
	mut instance := vke.new_instance_with_options(vke.InstanceOptions{ extensions: extensions })!
	defer { instance.destroy() }
	mut surface := vk.SurfaceKHR(unsafe { nil })
	vke.require_success(glfw.create_window_surface(instance.handle, window, unsafe { nil },
		&surface), 'glfwCreateWindowSurface')!
	defer { vk.destroy_surface_khr(instance.handle, surface, unsafe { nil }) }
	devices := instance.physical_devices()!
	if devices.len == 0 { return error('no Vulkan device') }
	physical := devices[0]
	family := physical.find_present_queue_family(u32(vk.QueueFlagBits.graphics), surface)!
	mut device := physical.new_device_with_options(vke.DeviceOptions{
		queue_family: family
		extensions:   [
			'VK_KHR_swapchain',
		]
	})!
	defer { device.destroy() }
	render_generation(physical, device, surface, window)!
	C.glfwSetWindowSize(window, 800, 450)
	glfw.poll_events()
	render_generation(physical, device, surface, window)!
	println('Presented two swapchain generations, including resize.')
}

fn render_generation(physical vke.PhysicalDevice, device &vke.OwnedDevice, surface vk.SurfaceKHR, window &glfw.Window) ! {
	support := physical.surface_support(surface)!
	required_usage := u32(vk.ImageUsageFlagBits.transfer_dst) | u32(vk.ImageUsageFlagBits.color_attachment)
	if support.capabilities.supportedUsageFlags & required_usage != required_usage {
		return error('this clear example requires transfer-destination and color-attachment swapchain images')
	}
	format := vke.select_surface_format(support.formats, [
		vk.SurfaceFormatKHR{ format: .b8g8r8a8_srgb, colorSpace: .srgb_nonlinear },
	])!
	mut width := i32(0)
	mut height := i32(0)
	glfw.get_framebuffer_size(window, &width, &height)
	if width <= 0 || height <= 0 {
		return error('window is minimized; resume when extent is nonzero')
	}
	extent := vke.select_surface_extent(support.capabilities, vk.Extent2D{
		width:  u32(width)
		height: u32(height)
	})
	info := vk.SwapchainCreateInfoKHR{
		surface:          surface
		minImageCount:    vke.select_surface_image_count(support.capabilities, 1)
		imageFormat:      format.format
		imageColorSpace:  format.colorSpace
		imageExtent:      extent
		imageArrayLayers: 1
		imageUsage:       required_usage
		imageSharingMode: .exclusive
		preTransform:     support.capabilities.currentTransform
		compositeAlpha:   vke.select_composite_alpha(support.capabilities.supportedCompositeAlpha, [
			.opaque,
		])!
		presentMode:      .fifo
		clipped:          vk._true
	}
	mut swapchain := device.new_swapchain(&info)!
	defer { swapchain.destroy() }
	mut pool := device.new_command_pool(u32(vk.CommandPoolCreateFlagBits.reset_command_buffer))!
	defer { pool.destroy() }
	mut command := pool.allocate_primary(1)![0]
	mut ready := device.new_semaphore()!
	defer { ready.destroy() }
	mut done := []&vke.OwnedSemaphore{}
	defer {
		for mut semaphore in done {
			semaphore.destroy()
		}
	}
	for _ in swapchain.images {
		done << device.new_semaphore()!
	}
	mut fence := device.new_fence(true)!
	defer { fence.destroy() }
	// Also complete submitted work before cleanup on an error path.
	defer { device.wait_idle() or {} }
	for _ in 0 .. 6 {
		glfw.poll_events()
		vke.require_success(fence.wait(10_000_000_000)!, 'wait frame')!
		acquired := swapchain.acquire(1_000_000_000, ready.handle, unsafe { nil })!
		index := acquired.image_index or {
			if acquired.status == .error_out_of_date_khr { return }
			return error('image acquisition did not complete: ${acquired.status}')
		}

		command.reset(0)!
		command.begin(u32(vk.CommandBufferUsageFlagBits.one_time_submit))!
		range := vk.ImageSubresourceRange{
			aspectMask: u32(vk.ImageAspectFlagBits.color)
			levelCount: 1
			layerCount: 1
		}
		before := vk.ImageMemoryBarrier{
			oldLayout:           .undefined
			newLayout:           .transfer_dst_optimal
			dstAccessMask:       u32(vk.AccessFlagBits.transfer_write)
			srcQueueFamilyIndex: vk.queue_family_ignored
			dstQueueFamilyIndex: vk.queue_family_ignored
			image:               swapchain.images[index]
			subresourceRange:    range
		}
		vk.cmd_pipeline_barrier(command.handle, u32(vk.PipelineStageFlagBits.top_of_pipe),
			u32(vk.PipelineStageFlagBits.transfer), 0, 0, unsafe { nil }, 0, unsafe { nil }, 1,
			&before)
		color := vk.ClearColorValue{
			float32: [f32(0.05), 0.15, 0.35, 1.0]!
		}
		vk.cmd_clear_color_image(command.handle, swapchain.images[index], .transfer_dst_optimal,
			&color, 1, &range)
		after := vk.ImageMemoryBarrier{
			oldLayout:           .transfer_dst_optimal
			newLayout:           .present_src_khr
			srcAccessMask:       u32(vk.AccessFlagBits.transfer_write)
			srcQueueFamilyIndex: vk.queue_family_ignored
			dstQueueFamilyIndex: vk.queue_family_ignored
			image:               swapchain.images[index]
			subresourceRange:    range
		}
		vk.cmd_pipeline_barrier(command.handle, u32(vk.PipelineStageFlagBits.transfer),
			u32(vk.PipelineStageFlagBits.bottom_of_pipe), 0, 0, unsafe { nil }, 0, unsafe { nil },
			1, &after)
		command.end()!
		fence.reset()!
		device.queue.submit([command], vke.SubmitOptions{
			wait_semaphores:   [ready.handle]
			wait_stage_masks:  [
				u32(vk.PipelineStageFlagBits.transfer),
			]
			signal_semaphores: [done[index].handle]
			fence:             fence.handle
		})!
		status := device.queue.present(swapchain, index, [done[index].handle])!
		if status == .error_out_of_date_khr { return }
	}
	device.wait_idle()!
}
