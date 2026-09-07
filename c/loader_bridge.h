#pragma once

// Keep initialization and validation in the translation unit that owns Volk's
// global dispatch table. Some Linux loader/SDK combinations report success from
// volkInitialize() while leaving vkCreateInstance unresolved.
static VkResult v_vulkan_initialize_loader(void) {
	VkResult result = volkInitialize();
	if (result != VK_SUCCESS || vkCreateInstance != NULL) {
		return result;
	}

#if defined(__linux__)
	void *loader = dlopen("libvulkan.so.1", RTLD_NOW | RTLD_LOCAL);
	if (loader == NULL) {
		loader = dlopen("libvulkan.so", RTLD_NOW | RTLD_LOCAL);
	}
	if (loader != NULL) {
		vkCreateInstance = (PFN_vkCreateInstance)dlsym(loader, "vkCreateInstance");
	}
#endif

	return vkCreateInstance != NULL ? VK_SUCCESS : VK_ERROR_INITIALIZATION_FAILED;
}
