# Linux window startup

Linux startup creates the window hidden before mapping it. This avoids GLFW's
synchronous X11 visibility wait during creation. The helper requests mapping
asynchronously, retries hidden non-minimized windows every 250 ms, and reports
failure after five seconds. It never restores a window marked as minimized.

The canonical helper is `antono2/glfw/c/window_startup.h`. Consumer snapshots
remain identical so existing released dependency pins can stay unchanged.
When updating the helper, update and test the snapshots together. GLFW 3.4+
may load Xlib locally: the helper borrows that existing module rather than
requiring Xlib to be globally visible through another dependency.

The V regression fixture runs in a private Xvfb display. It checks ordinary
mapping, window-manager handover, a dropped first map request, a manager that
never maps, and an explicitly minimized window. No input reaches the user's
desktop. Install `xvfb`, `xauth`, `openbox`, `libx11-dev`, Lavapipe and the Vulkan
validation layers before running it. Use the supported V release with GCC and
TinyCC. For the CI entry point, set `VMODULES` to a fresh module directory
containing this checkout as `antono2/vulkan`, and pass a GLFW v2.0.1 checkout.

```sh
v run ci/linux_checks.vsh presentation /tmp/vulkan-presentation /path/to/glfw
```

The driver checks startup and the first rendered frames with the fixture's
minimal manager, then runs the complete two-generation presentation check. Both
sets of logs go in the scratch directory.
