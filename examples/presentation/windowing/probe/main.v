// Exercises the same window constructor as the presentation path, without GPU/codec prerequisites.
module main

import antono2.glfw
import examples.presentation.windowing

fn main() {
	if !glfw.initialize() { panic('GLFW initialization failed') }
	defer { glfw.terminate() }
	glfw.window_hint(glfw.client_api, glfw.no_api)
	window := windowing.create_windowed(640, 480, 'Window startup probe') or { panic(err) }
	defer { glfw.destroy_window(window) }
	assert glfw.get_window_attrib(window, glfw.visible) != 0
}
