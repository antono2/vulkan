#pragma once

// V3 can concatenate this helper more than once into a generated C unit.
// Keep Volk's implementation idempotent while retaining a header-only bridge
// that works with stable V and all supported native compilers.
#ifndef V_VULKAN_VOLK_IMPLEMENTATION
#define V_VULKAN_VOLK_IMPLEMENTATION
#define VK_NO_PROTOTYPES
#define VOLK_IMPLEMENTATION
#include <volk.h>
#undef VOLK_IMPLEMENTATION
#endif
