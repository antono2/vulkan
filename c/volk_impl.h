#pragma once

// V3 can concatenate this helper more than once into a generated C unit.
// Keep Volk's implementation idempotent while retaining a header-only bridge
// that works with stable V and all supported native compilers.
#ifndef V_VULKAN_VOLK_IMPLEMENTATION
#define V_VULKAN_VOLK_IMPLEMENTATION
#define VK_NO_PROTOTYPES
#include "vendor/include/vulkan/vulkan.h"
#define VOLK_IMPLEMENTATION
#include "vendor/volk/volk.h"
#undef VOLK_IMPLEMENTATION
#endif
