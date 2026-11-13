#ifndef ANTONO2_GLFW_WINDOW_STARTUP_H
#define ANTONO2_GLFW_WINDOW_STARTUP_H

/* Maintained in antono2/glfw/c/window_startup.h. Consumers with unchanged
 * released module pins carry an identical snapshot of this opt-in helper. */
#include <GLFW/glfw3.h>
#include <stddef.h>
#include <stdio.h>
#if defined(__linux__)
#include <dlfcn.h>

static inline int a2_glfw_request_x11_mapping(GLFWwindow *window) {
    typedef int (*PlatformFn)(void);
    typedef void *(*DisplayFn)(void);
    typedef unsigned long (*WindowFn)(GLFWwindow *);
    typedef int (*MapFn)(void *, unsigned long);
    typedef int (*FlushFn)(void *);
    PlatformFn platform = (PlatformFn)dlsym(NULL, "glfwGetPlatform");
    /* GLFW_PLATFORM_X11, including builds using GLFW 3.3 headers. */
    if (platform && platform() != 0x00060004) return 0;
    DisplayFn get_display = (DisplayFn)dlsym(NULL, "glfwGetX11Display");
    WindowFn get_window = (WindowFn)dlsym(NULL, "glfwGetX11Window");
    if (!get_display || !get_window) return 0;
    void *display = get_display();
    unsigned long handle = get_window(window);
    if (!display || !handle) return 0;
    MapFn map = (MapFn)dlsym(NULL, "XMapWindow");
    FlushFn flush = (FlushFn)dlsym(NULL, "XFlush");
    void *xlib = NULL;
    if (!map || !flush) {
        /* GLFW 3.4 loads Xlib locally. Borrow its existing module rather than
         * depending on accessibility libraries exposing Xlib globally. */
        int flags = RTLD_LAZY;
#ifdef RTLD_NOLOAD
        flags |= RTLD_NOLOAD;
#endif
        xlib = dlopen("libX11.so.6", flags);
        if (!xlib) return 0;
        map = (MapFn)dlsym(xlib, "XMapWindow");
        flush = (FlushFn)dlsym(xlib, "XFlush");
    }
    if (!map || !flush) {
        if (xlib) dlclose(xlib);
        return 0;
    }
    map(display, handle);
    flush(display);
    if (xlib) dlclose(xlib);
    return 1;
}
#endif

/* Create hidden before calling this: GLFW's implicit show during creation can
 * otherwise block before this deadline starts. Call on GLFW's main thread. */
static inline int a2_glfw_show_startup(GLFWwindow *window, char *error, size_t capacity) {
    if (!window) {
        snprintf(error, capacity, "Cannot show a null GLFW window");
        return 0;
    }
    glfwPollEvents();
    int asynchronous = 0;
#if defined(__linux__)
    asynchronous = a2_glfw_request_x11_mapping(window);
#endif
    if (!asynchronous) glfwShowWindow(window);
    const double deadline = glfwGetTime() + 5.0;
    double next_request = glfwGetTime() + 0.25;
    int requests = 1;
    while (!glfwGetWindowAttrib(window, GLFW_VISIBLE)) {
        if (glfwWindowShouldClose(window)) {
            snprintf(error, capacity, "Window closed before becoming visible");
            return 0;
        }
        if (glfwGetTime() >= deadline) {
            snprintf(error, capacity,
                "Window did not become visible within 5 seconds (show requests=%d, iconified=%d)",
                requests, glfwGetWindowAttrib(window, GLFW_ICONIFIED));
            return 0;
        }
        glfwWaitEventsTimeout(0.01);
#if defined(__linux__)
        if (asynchronous && glfwGetTime() >= next_request && glfwGetTime() < deadline) {
            glfwPollEvents();
            if (!glfwGetWindowAttrib(window, GLFW_VISIBLE) &&
                !glfwGetWindowAttrib(window, GLFW_ICONIFIED)) {
                a2_glfw_request_x11_mapping(window);
                ++requests;
            }
            next_request = glfwGetTime() + 0.25;
        }
#endif
    }
    if (asynchronous) {
#ifdef GLFW_FOCUS_ON_SHOW
        if (glfwGetWindowAttrib(window, GLFW_FOCUS_ON_SHOW))
#endif
            glfwFocusWindow(window);
    }
    return 1;
}
#endif
