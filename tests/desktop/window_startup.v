#!/usr/bin/env -S v run

// Linux-only native regression: a private X11 manager deliberately drops a map
// request. Run against a built demo; no input is sent to the user's desktop.
module main

import os
import time

#flag -lX11
#include <X11/Xlib.h>

struct C.Display {}

@[typedef]
struct C.XMapRequestEvent {
	window usize
}

@[typedef]
struct C.XEvent {
	xmaprequest C.XMapRequestEvent
}

fn C.XOpenDisplay(&char) &C.Display
fn C.XDefaultRootWindow(&C.Display) usize
fn C.XSelectInput(&C.Display, usize, i64) int
fn C.XSync(&C.Display, int) int
fn C.XCheckTypedEvent(&C.Display, int, &C.XEvent) int
fn C.XMapWindow(&C.Display, usize) int
fn C.XFlush(&C.Display) int
fn C.XCloseDisplay(&C.Display) int
fn C.XInternAtom(&C.Display, &char, int) usize
fn C.XChangeProperty(&C.Display, usize, usize, usize, int, int, &u8, int) int

fn manager(mode string, log string, ready string) ! {
	display := C.XOpenDisplay(unsafe { nil })
	if isnil(display) { return error('Cannot open private X11 display') }
	mut close_display := true
	defer {
		if close_display { C.XCloseDisplay(display) }
	}
	// SubstructureRedirectMask: map requests are delivered to this manager.
	C.XSelectInput(display, C.XDefaultRootWindow(display), i64(1 << 20))
	C.XSync(display, 0)
	os.write_file(ready, 'ready\n')!
	mut count := 0
	mut events := ''
	for {
		mut event := C.XEvent{}
		if C.XCheckTypedEvent(display, 20, &event) == 0 {
			time.sleep(time.millisecond)
			continue
		}
		count++
		events += 'MapRequest ${count} window=${event.xmaprequest.window}\n'
		os.write_file(log, events)!
		if mode == 'handover' {
			// Exit after receiving the map request, then replace this process
			// with a real manager. The old request is not replayed by X11.
			C.XCloseDisplay(display)
			close_display = false
			os.execvp('openbox', ['--sm-disable'])!
			return
		}
		if mode == 'minimized' {
			state := [usize(3), 0] // ICCCM IconicState and no icon window.
			atom := C.XInternAtom(display, c'WM_STATE', 0)
			C.XChangeProperty(display, event.xmaprequest.window, atom, atom, 32, 0,
				unsafe { &u8(state.data) }, state.len)
			C.XFlush(display)
			continue
		}
		if mode == 'never-map' || (mode == 'drop-first' && count == 1) {
			continue
		}
		C.XMapWindow(display, event.xmaprequest.window)
		C.XFlush(display)
	}
}

fn scenario(binary string, logs string, mode string, args []string) ! {
	ready := os.join_path(logs, '${mode}.ready')
	log := os.join_path(logs, '${mode}-manager.log')
	if os.exists(ready) { os.rm(ready)! }
	if os.exists(log) { os.rm(log)! }
	mut wm := os.new_process(os.executable())
	wm.set_args(['--manager', mode, log, ready])
	wm.set_redirect_stdio()
	wm.run()
	defer {
		wm.signal_kill()
		wm.wait()
		os.write_file(os.join_path(logs, '${mode}-manager-stderr.log'), wm.stderr_slurp()) or {}
	}
	mut prepared := false
	for _ in 0 .. 500 {
		if os.exists(ready) {
			prepared = true
			break
		}
		if !wm.is_alive() {
			break
		}
		time.sleep(10 * time.millisecond)
	}
	if !prepared { return error('${mode}: private manager did not start') }
	start := time.ticks()
	result := os.execute('timeout --kill-after=2s 30s ' + os.quoted_path(binary) + ' ' +
		args.map(os.quoted_path(it)).join(' '))
	elapsed := time.ticks() - start
	os.write_file(os.join_path(logs, '${mode}-demo.log'), result.output)!
	requests := os.read_file(log) or { return error('${mode}: no map requests: ${result.output}') }
	count := requests.split_into_lines().len
	println('${mode}: exit=${result.exit_code}, fixture requests=${count}, elapsed=${elapsed}ms')
	if mode in ['never-map', 'minimized'] {
		if result.exit_code in [0, 124, 137]
			|| !result.output.contains('Window did not become visible within 5 seconds') {
			return error('${mode}: expected the bounded visibility failure, got ${result.output}')
		}
		if mode == 'minimized' {
			if count != 1 || !result.output.contains('iconified=1') {
				return error('${mode}: an explicitly minimized window must not be remapped: ${requests}${result.output}')
			}
		} else if count < 2 || count > 25 {
			return error('${mode}: retries must be bounded: ${requests}')
		}
	} else {
		if result.exit_code != 0 { return error('${mode}: demo startup failed: ${result.output}') }
		expected := if mode == 'drop-first' { 2 } else { 1 }
		if count != expected {
			return error('${mode}: expected ${expected} map requests: ${requests}')
		}
		if result.output.to_lower().contains('validation error') || result.output.contains('VUID-') {
			return error('${mode}: Vulkan validation failed: ${result.output}')
		}
	}
}

fn session(binary string, logs string, args []string) ! {
	os.mkdir_all(logs)!
	if os.getenv('VIMGUI_STARTUP_LOCAL_XLIB') == '1' {
		// Verify the modern GLFW lane is not masked by accessibility or other
		// link dependencies that make Xlib globally visible to the demo.
		linkage := os.execute('ldd ${os.quoted_path(binary)}')
		os.write_file(os.join_path(logs, 'linkage.log'), linkage.output)!
		if linkage.exit_code != 0 || linkage.output.contains('libX11') {
			return error('The local-Xlib regression requires a demo without linked Xlib: ${linkage.output}')
		}
		println('Verified demo has no linked Xlib dependency')
	}
	// Keep GLFW 3.4's backend selection inside this private X11 session.
	os.unsetenv('WAYLAND_DISPLAY')
	os.setenv('XDG_SESSION_TYPE', 'x11', true)
	icds := os.glob('/usr/share/vulkan/icd.d/lvp_icd*.json')!
	if icds.len == 0 { return error('Lavapipe is required for isolated startup tests') }
	os.setenv('VK_DRIVER_FILES', icds[0], true)
	os.setenv('VK_ICD_FILENAMES', icds[0], true)
	os.setenv('VK_INSTANCE_LAYERS', 'VK_LAYER_KHRONOS_validation', true)
	os.setenv('LP_NUM_THREADS', '1', true)
	os.setenv('VIMGUI_SMOKE_FRAMES', '3', true)
	os.setenv('TT_PIPELINE_CACHE_FILE', os.join_path(logs, 'pipelines.cache'), true)
	for mode in ['normal', 'handover', 'drop-first', 'never-map', 'minimized'] {
		scenario(binary, logs, mode, args)!
	}
	println('PASS: normal mapping, dropped-request recovery, bounded failure and minimized-window handling')
}

fn main() {
	if os.args.len == 5 && os.args[1] == '--manager' {
		manager(os.args[2], os.args[3], os.args[4]) or {
			eprintln(err)
			exit(1)
		}
		return
	}
	if os.args.len >= 4 && os.args[1] == '--session' {
		session(os.args[2], os.args[3], os.args[4..]) or {
			eprintln(err)
			exit(1)
		}
		return
	}
	if os.args.len < 3 {
		eprintln('Usage: window_startup.v binary log-directory [app arguments...]')
		exit(2)
	}
	binary := os.real_path(os.args[1])
	logs := os.abs_path(os.args[2])
	mut child := os.new_process('xvfb-run')
	mut args := ['-a', '-s', '-screen 0 1600x1000x24', os.executable(), '--session', binary, logs]
	args << os.args[3..]
	child.set_args(args)
	child.run()
	child.wait()
	exit(child.code)
}
