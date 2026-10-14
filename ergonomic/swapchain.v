// Explicit swapchain ownership. Images are borrowed; owned views die with the swapchain.
module ergonomic

import antono2.vulkan as vk

@[nocopy]
pub struct OwnedSwapchain {
	device    vk.Device
	allocator &HostAllocator = unsafe { nil }
pub:
	images []vk.Image
	views  []vk.ImageView
	format vk.Format
	extent vk.Extent2D
pub mut:
	handle vk.SwapchainKHR
}

pub fn swapchain_images(device vk.Device, swapchain vk.SwapchainKHR) ![]vk.Image {
	for {
		mut count := u32(0)
		status := vk.get_swapchain_images_khr(device, swapchain, &count, unsafe { nil })
		if status == .incomplete { continue
		 }
		require_success(status, 'vkGetSwapchainImagesKHR(count)')!
		if count == 0 { return error('swapchain contains no images') }
		mut images := []vk.Image{len: int(count), init: vk.Image(unsafe { nil })}
		filled := vk.get_swapchain_images_khr(device, swapchain, &count, images.data)
		if filled == .incomplete { continue
		 }
		require_success(filled, 'vkGetSwapchainImagesKHR(images)')!
		return images[..int(count)].clone()
	}
	return []vk.Image{}
}

// Device must have enabled VK_KHR_swapchain. On replacement Vulkan may retire
// oldSwapchain even if later creation fails. Caller handles recreation policy.
pub fn (device &OwnedDevice) new_swapchain(info &vk.SwapchainCreateInfoKHR) !&OwnedSwapchain {
	if info.imageExtent.width == 0 || info.imageExtent.height == 0 {
		return error('defer swapchain creation while framebuffer extent is zero')
	}
	if info.imageArrayLayers != 1 {
		return error('convenience swapchain views require one image layer')
	}
	mut handle := vk.SwapchainKHR(unsafe { nil })
	require_success(vk.create_swapchain_khr(device.handle, info, allocator_ptr(device.allocator),
		&handle), 'vkCreateSwapchainKHR')!
	mut success := false
	mut views := []vk.ImageView{}
	defer {
		if !success {
			for view in views {
				vk.destroy_image_view(device.handle, view, allocator_ptr(device.allocator))
			}
			vk.destroy_swapchain_khr(device.handle, handle, allocator_ptr(device.allocator))
		}
	}
	images := swapchain_images(device.handle, handle)!
	for image in images {
		view_info := vk.ImageViewCreateInfo{
			image:            image
			viewType:         ._2d
			format:           info.imageFormat
			subresourceRange: vk.ImageSubresourceRange{
				aspectMask: u32(vk.ImageAspectFlagBits.color)
				levelCount: 1
				layerCount: 1
			}
		}
		mut view := vk.ImageView(unsafe { nil })
		require_success(vk.create_image_view(device.handle, &view_info,
			allocator_ptr(device.allocator), &view), 'vkCreateImageView(swapchain)')!
		views << view
	}
	success = true
	return &OwnedSwapchain{
		device:    device.handle
		allocator: device.allocator
		handle:    handle
		images:    images
		views:     views
		format:    info.imageFormat
		extent:    info.imageExtent
	}
}

pub struct AcquireOutcome {
pub:
	status      vk.Result
	image_index ?u32
}

pub fn acquire_outcome(status vk.Result, index u32) !AcquireOutcome {
	if status in [.success, .suboptimal_khr] { return AcquireOutcome{
			status:      status
			image_index: index
		} }
	if status in [.timeout, .not_ready, .error_out_of_date_khr] { return AcquireOutcome{
			status: status
		} }
	require_success(status, 'vkAcquireNextImageKHR')!
	return AcquireOutcome{
		status: status
	}
}

pub fn (swapchain &OwnedSwapchain) acquire(timeout u64, semaphore vk.Semaphore, fence vk.Fence) !AcquireOutcome {
	if isnil(swapchain.handle) { return error('swapchain is destroyed') }
	if isnil(semaphore) && isnil(fence) { return error('acquire requires a semaphore or fence') }
	mut index := u32(0)
	status := vk.acquire_next_image_khr(swapchain.device, swapchain.handle, timeout, semaphore,
		fence, &index)
	return acquire_outcome(status, index)
}

pub fn (queue Queue) present(swapchain &OwnedSwapchain, index u32, waits []vk.Semaphore) !vk.Result {
	if isnil(swapchain.handle) || index >= u32(swapchain.images.len) {
		return error('invalid swapchain or image index')
	}
	if queue.device != swapchain.device { return error('present queue belongs to another device') }
	info := vk.PresentInfoKHR{
		waitSemaphoreCount: u32(waits.len)
		pWaitSemaphores:    waits.data
		swapchainCount:     1
		pSwapchains:        &swapchain.handle
		pImageIndices:      &index
	}
	status := vk.queue_present_khr(queue.handle, &info)
	if status in [.success, .suboptimal_khr, .error_out_of_date_khr] { return status }
	return check(status, 'vkQueuePresentKHR')
}

// Complete GPU/presentation use and destroy framebuffers before destruction.
pub fn (mut swapchain OwnedSwapchain) destroy() {
	if isnil(swapchain.handle) { return }
	for view in swapchain.views {
		vk.destroy_image_view(swapchain.device, view, allocator_ptr(swapchain.allocator))
	}
	vk.destroy_swapchain_khr(swapchain.device, swapchain.handle, allocator_ptr(swapchain.allocator))
	swapchain.handle = unsafe { nil }
}
