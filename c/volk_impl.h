#pragma once

// V3 can concatenate this helper more than once into a generated C unit.
// Keep Volk's implementation idempotent while retaining a header-only bridge
// that works with stable V and all supported native compilers.
#ifndef V_VULKAN_VOLK_IMPLEMENTATION
#define V_VULKAN_VOLK_IMPLEMENTATION
#define VK_NO_PROTOTYPES
// Include the pinned core first, then let Volk supply platform declarations.
// Volk forward-declares Xlib/Win32 types without requiring their full headers.
#include "vendor/include/vulkan/vulkan_core.h"
#define VOLK_IMPLEMENTATION
#include "vendor/volk/volk.h"
#undef VOLK_IMPLEMENTATION
#endif
