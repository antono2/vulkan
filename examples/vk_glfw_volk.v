/*
  This program creates a window and prints a message on pressing Enter. Press ESC to exit.
  It provides examples for calling vulkan and glfw functions, using the bindings located at
  modules/vulkan/vulkan.v
*/

module main

import vulkan as vk

#flag linux -I$env('VULKAN_SDK')/include
#flag linux -I$env('VULKAN_SDK')/include/vulkan
#flag windows -I$env('VULKAN_SDK')/Include
#flag windows -I$env('VULKAN_SDK')/Include/vulkan
#flag linux -L$env('VULKAN_SDK')/lib
#flag windows -L$env('VULKAN_SDK')/Lib

// GLFW
// https://www.glfw.org/docs/latest/vulkan_guide.html
#flag windows -I<PATH TO GLFW INCLUDE, LIKE C:\glfw-3.4.bin.WIN64\include>
#flag windows -Iinclude
#flag linux -L/usr/lib/x86_64-linux-gnu
#flag windows -L<PATH TO GLFW LIB, LIKE C:\glfw-3.4.bin.WIN64\lib-mingw-w64>
#flag linux -lglfw
#flag windows -lglfw3
#flag windows -lgdi32
// Please see https://www.glfw.org/docs/latest/build_guide.html#build_macros for more information
#flag windows -DGLFW_INCLUDE_GLCOREARB=1 // makes the GLFW header include the modern GL/glcorearb.h header (OpenGL/gl3.h on macOS) instead of the regular OpenGL header.

// Volk
// https://github.com/zeux/volk#basic-usage
#flag windows -I$env('VULKAN_SDK')/Include/Volk
// https://github.com/zeux/volk#building
#flag -DVOLK_IMPLEMENTATION
#include "volk.h"

fn C.volkInitialize()
fn C.volkLoadInstance(C.Instance)

// This has to come after other includes
#include "GLFW/glfw3.h"

pub const glfw_true = 1
pub const glfw_press = 1
pub const glfw_key_enter = 257
pub const glfw_key_escape = 256
pub const glfw_client_api = 0x00022001
pub const glfw_no_api = 0

pub type C.GLFWwindow = voidptr

@[heap]
struct App {
pub mut:
	main_window C.GLFWwindow
	vk_instance C.Instance
	share_data  []string // some data to share between main() and glfw callback functions
}

fn init_app(window &C.GLFWwindow) App {
	new_app := App{
		main_window: unsafe { window }
		vk_instance: unsafe { nil }
		share_data:  []
	}
	return new_app
}

fn main() {
	C.volkInitialize()
	// initialize GLFW ("init" is a reserved keyword in V)
	glfw_initialize()
	mut window := unsafe { nil }
	glfw_window_hint(glfw_client_api, glfw_no_api)
	window = glfw_create_window(960, 480, 'Greetings!', unsafe { nil },
		unsafe { nil })

	mut app := init_app(window)
	defer {
		glfw_terminate()
		unsafe {
			// TODO: vkDestroySurfaceKHR before vkDestroyInstance
			// use vk.destroy_instance instead of free
			free(app.vk_instance)
		}
	}

	// Set user pointer to &App
	// User pointer is a reference to your glfw user data,
	// which you might need inside glfw callback functions
	glfw_set_user_pointer(window, &app)
	// set callback function for keyboard input
	glfw_set_key_callback(window, key_callback_function)

	if !glfw_is_vulkan_supported() {
		panic('Vulkan loader could not be found by GLFW')
	}

	mut glfw_required_instance_extensions_cnt := u32(0)
	mut glfw_required_instance_extensions := glfw_get_required_instance_extensions(&glfw_required_instance_extensions_cnt)

	enabled_layer_names := [c'VK_LAYER_KHRONOS_validation']
	enabled_layer_names_count := u32(1)

	create_info := vk.InstanceCreateInfo{
		s_type:                     vk.StructureType.structure_type_instance_create_info
		p_next:                     unsafe { nil }
		flags:                      0
		p_application_info:         &vk.ApplicationInfo{
			s_type:              vk.StructureType.structure_type_application_info
			p_next:              unsafe { nil }
			p_application_name:  c'Vulkan in Vlang'
			application_version: 1
			p_engine_name:       c'Not an Engine'
			engine_version:      1
			api_version:         vk.header_version_complete
		}
		pp_enabled_layer_names:     &(enabled_layer_names[0])
		enabled_layer_count:        enabled_layer_names_count
		pp_enabled_extension_names: glfw_required_instance_extensions
		enabled_extension_count:    glfw_required_instance_extensions_cnt
	}
	create_instance_result := vk.create_instance(&create_info, unsafe { nil }, &app.vk_instance)
	// Note: You can use string_VkResult in /usr/include/vulkan/generated/vk_enum_string_helper.h
	// otherwise the string value of ${result} will just be the enum name, eg. 'success'
	if create_instance_result != vk.Result.success {
		println('Could not create vulkan instance. VkResult: ${create_instance_result}')
	}
	// https://github.com/zeux/volk#basic-usage
	C.volkLoadInstance(app.vk_instance)

	// TODO: Use vkEnumerateInstanceLayerProperties and vkEnumerateInstanceExtensionProperties to
	// find supported properties of the current vk instance

	// TODO: Add debug extension in case of "v -d debug_vk" and vkCreateDebugUtilsMessengerEXT with debug callback.
	// https://github.com/vlang/v/blob/master/doc/docs.md#conditional-compilation

	mut surface := 0
	create_surface_result := glfw_create_window_surface(app.vk_instance, window, unsafe { nil },
		surface)
	if create_surface_result != vk.Result.success {
		panic('Could not create glfw window surface')
	}
	mut physical_device_cnt := u32(0)
	vk.enumerate_physical_devices(app.vk_instance, &physical_device_cnt, unsafe { nil })
	if physical_device_cnt == 0 {
		panic('Could not find GPUs with vulkan support')
	}
	mut physical_devices_c := unsafe { malloc(physical_device_cnt * sizeof(C.PhysicalDevice)) }
	unsafe {
		defer { free(physical_devices_c) }
	}
	if vk.enumerate_physical_devices(app.vk_instance, &physical_device_cnt, physical_devices_c) != vk.Result.success {
		panic('Could not enumerate physical devices')
	}
	mut physical_device := C.PhysicalDevice(unsafe { nil })
	// TODO: "v fmt -w" on this file removes the "C." from "C.PhysicalDevice"
	physical_devices := to_v_array[C.PhysicalDevice](physical_devices_c, physical_device_cnt)

	for i in 0 .. physical_device_cnt {
		if is_device_suitable(physical_devices[i]) {
			println('Found suitable physical device address: ${C.PhysicalDevice(physical_devices[i])}')
			physical_device = physical_devices[i]
		}
	}

	if !glfw_get_physical_device_presentation_support(app.vk_instance, physical_device,
		0) {
		panic('Graphics card does not have presentation support for GLFW')
	}

	mut device_extension_properties_count := u32(0)
	mut enumerate_device_extension_properties_result := vk.enumerate_device_extension_properties(physical_device,
		unsafe { nil }, &device_extension_properties_count, unsafe { nil })
	if enumerate_device_extension_properties_result != vk.Result.success {
		panic('Could not enumerate_device_extension_properties to get the number of properties')
	}
	mut device_extension_properties_c := unsafe { malloc(sizeof(vk.ExtensionProperties) * device_extension_properties_count) }
	enumerate_device_extension_properties_result = vk.enumerate_device_extension_properties(physical_device,
		unsafe { nil }, device_extension_properties_count, device_extension_properties_c)
	if enumerate_device_extension_properties_result != vk.Result.success {
		panic('Could not enumerate_device_extension_properties to get the properties array')
	}
	device_extensions_required := [c'VK_KHR_swapchain']
	device_extension_properties := to_v_array[vk.ExtensionProperties](device_extension_properties_c,
		device_extension_properties_count)
	for i in 0 .. device_extensions_required.len {
		mut extension_is_supported_by_device := false
		for j in 0 .. device_extension_properties.len {
			tmp_compare_result := unsafe { device_extensions_required[i].vstring().compare(device_extension_properties[j].extension_name[0].vstring()) }
			if tmp_compare_result == 0 {
				extension_is_supported_by_device = true
			}
		}
		if !extension_is_supported_by_device {
			panic('Required extension ${unsafe { device_extensions_required[i].vstring() }} not supported by graphics card')
		}
	}

	println('All required vulkan device extensions are supported by your graphics card')

	for !(glfw_window_should_close(window)) {
		/*
			<-- Here you can do the rendering stuff and so on.. -->
		 */
		// now print the data (which could come from callback) from the app struct and remove it afterwards
		for _, s in app.share_data {
			println(s)
		}
		app.share_data = []
		glfw_poll_events()
	}
}

// Called on a keyboard event
// GLFW_PRESS, GLFW_RELEASE or GLFW_REPEAT
// https://www.glfw.org/docs/latest/group__keys.html
fn key_callback_function(window &C.GLFWwindow, key int, scancode int, action int, mods int) {
	if action == glfw_press {
		// get user data pointer from glfw.window
		mut app := unsafe { &App(glfw_get_user_pointer(window)) }
		if key == glfw_key_enter {
			txt := 'Enter key pressed'
			app.share_data << txt
		}
		if key == glfw_key_escape {
			unsafe { glfw_set_should_close(window, 1) }
		}
	}
}

fn is_device_suitable(device C.PhysicalDevice) bool {
	device_properties := vk.PhysicalDeviceProperties{}
	vk.get_physical_device_properties(device, &device_properties)
	return device_properties.device_type == vk.PhysicalDeviceType.physical_device_type_discrete_gpu
}

// NOTE: array d is consumed/freed
fn to_v_array[T](d &T, len u32) []T {
	mut ret := unsafe { []T{len: int(len)} }
	for i in 0 .. len {
		unsafe {
			ret[i] = d[i]
		}
	}
	unsafe {
		free(d)
	}
	return ret
}

// Using heap, since window contains a pointer to user data,
// which should not be cleaned up automatically
@[heap; typedef]
struct C.GLFWwindow {
}

@[typedef]
struct C.GLFWmonitor {
}

fn C.glfwInit() int
pub fn glfw_initialize() bool {
	return C.glfwInit() == glfw_true
}

fn C.glfwTerminate()
pub fn glfw_terminate() {
	C.glfwTerminate()
}

fn C.glfwCreateWindow(width int, height int, title &char, monitor &C.GLFWmonitor, share &C.GLFWwindow) &C.GLFWwindow
pub fn glfw_create_window(width int, height int, title string, monitor &C.GLFWmonitor, share &C.GLFWwindow) &C.GLFWwindow {
	return C.glfwCreateWindow(width, height, title.str, monitor, share)
}

fn C.glfwSetWindowUserPointer(window &C.GLFWwindow, pointer voidptr)
pub fn glfw_set_user_pointer(window &C.GLFWwindow, pointer voidptr) {
	C.glfwSetWindowUserPointer(window, pointer)
}

fn C.glfwGetWindowUserPointer(window &C.GLFWwindow) voidptr
pub fn glfw_get_user_pointer(window &C.GLFWwindow) voidptr {
	return C.glfwGetWindowUserPointer(window)
}

pub type GLFWFnKey = fn (window &C.GLFWwindow, key_id int, scan_code int, action int, bit_filed int)

fn C.glfwSetKeyCallback(window &C.GLFWwindow, callback GLFWFnKey)
pub fn glfw_set_key_callback(window &C.GLFWwindow, callback GLFWFnKey) {
	C.glfwSetKeyCallback(window, callback)
}

fn C.glfwMakeContextCurrent(window &C.GLFWwindow)
pub fn glfw_make_context_current(window &C.GLFWwindow) {
	C.glfwMakeContextCurrent(window)
}

fn C.glfwVulkanSupported() int
pub fn glfw_is_vulkan_supported() bool {
	return C.glfwVulkanSupported() == glfw_true
}

fn C.glfwSetWindowShouldClose(window &C.GLFWwindow, value int)
pub fn glfw_set_should_close(window &C.GLFWwindow, flag int) {
	C.glfwSetWindowShouldClose(window, flag)
}

fn C.glfwWindowShouldClose(window &C.GLFWwindow) int
pub fn glfw_window_should_close(window &C.GLFWwindow) bool {
	return C.glfwWindowShouldClose(window) == glfw_true
}

fn C.glfwPollEvents()
pub fn glfw_poll_events() {
	C.glfwPollEvents()
}

fn C.glfwGetRequiredInstanceExtensions(count &u32) &&char
pub fn glfw_get_required_instance_extensions(count &u32) &&char {
	return C.glfwGetRequiredInstanceExtensions(count)
}

fn C.glfwCreateWindowSurface(C.Instance, &C.GLFWwindow, &vk.AllocationCallbacks, &C.SurfaceKHR) vk.Result
pub fn glfw_create_window_surface(instance C.Instance, window &C.GLFWwindow, allocator &vk.AllocationCallbacks, surface &C.SurfaceKHR) vk.Result {
	return C.glfwCreateWindowSurface(instance, window, allocator, surface)
}

fn C.glfwWindowHint(int, int)
pub fn glfw_window_hint(hint int, value int) {
	C.glfwWindowHint(hint, value)
}

fn C.glfwGetPhysicalDevicePresentationSupport(C.Instance, C.PhysicalDevice, u32) int
pub fn glfw_get_physical_device_presentation_support(instance C.Instance, device C.PhysicalDevice, queuefamily u32) bool {
	return C.glfwGetPhysicalDevicePresentationSupport(instance, device, queuefamily) == glfw_true
}
