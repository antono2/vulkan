// Uses the pinned GLFW module while sharing the bounded Linux startup helper.
module windowing

import antono2.glfw

#flag -I @VMODROOT/examples/presentation/windowing
#flag linux -ldl
#include "window_startup.h"

fn C.a2_glfw_show_startup(&glfw.Window, &char, usize) int

pub fn create_windowed(width i32, height i32, title string) !&glfw.Window {
	$if linux { glfw.window_hint(glfw.visible, 0) }
	window := glfw.create_windowed(width, height, title)!
	$if linux {
		mut message := [256]char{}
		if C.a2_glfw_show_startup(window, &message[0], usize(message.len)) == 0 {
			glfw.destroy_window(window)
			return error(unsafe { cstring_to_vstring(&message[0]) }.clone())
		}
	}
	return window
}
