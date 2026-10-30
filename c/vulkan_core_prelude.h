#pragma once

// Consumers such as GLFW must see the pinned core without function prototypes.
// Keep the Volk implementation and its CRT headers in the normal include phase.
#ifndef VK_NO_PROTOTYPES
#define VK_NO_PROTOTYPES
#endif
#include "vendor/include/vulkan/vulkan_core.h"
