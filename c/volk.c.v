module c

#flag linux -I$env('VULKAN_SDK')/include
#flag linux -I$env('VULKAN_SDK')/include/volk
#flag darwin -I$env('VULKAN_SDK')/include
#flag darwin -I$env('VULKAN_SDK')/include/volk
#flag windows -I$env('VULKAN_SDK')/Include
#flag windows -I$env('VULKAN_SDK')/Include/volk
#define VK_NO_PROTOTYPES
#define VOLK_IMPLEMENTATION
#include <volk.h>
#include "loader_bridge.h"
