module c

#flag linux -I$env('VULKAN_SDK')/include
#flag darwin -I$env('VULKAN_SDK')/include
#flag windows -I$env('VULKAN_SDK')/Include
#define VK_NO_PROTOTYPES
#define VOLK_IMPLEMENTATION
#include <volk/volk.h>
