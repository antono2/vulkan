#pragma once

// Keep initialization and validation in the translation unit that owns Volk's
// global dispatch table. Some Linux loader/SDK combinations report success from
// volkInitialize() while leaving vkCreateInstance unresolved.
#if defined(__TINYC__) && defined(__linux__) && !defined(RTLD_DEEPBIND)
#define RTLD_DEEPBIND 0x00008
#endif

static VkResult v_vulkan_initialize_loader(void) {
#if defined(__TINYC__) && defined(__linux__) && defined(RTLD_DEEPBIND)
	// TinyCC exports Volk's global function-pointer variables from the main
	// executable. Without deep binding, the Vulkan loader can resolve names
	// such as vkCreateInstance back to those variables instead of its own
	// entry points. Load the ICD-facing loader in its own symbol scope and give
	// Volk the unambiguous vkGetInstanceProcAddr address.
	void *loader = dlopen("libvulkan.so.1", RTLD_NOW | RTLD_LOCAL | RTLD_DEEPBIND);
	if (loader == NULL) {
		loader = dlopen("libvulkan.so", RTLD_NOW | RTLD_LOCAL | RTLD_DEEPBIND);
	}
	if (loader == NULL) {
		return VK_ERROR_INITIALIZATION_FAILED;
	}
	PFN_vkGetInstanceProcAddr get_instance_proc_addr =
		(PFN_vkGetInstanceProcAddr)dlsym(loader, "vkGetInstanceProcAddr");
	if (get_instance_proc_addr == NULL) {
		return VK_ERROR_INITIALIZATION_FAILED;
	}
	volkInitializeCustom(get_instance_proc_addr);
	return vkCreateInstance != NULL ? VK_SUCCESS : VK_ERROR_INITIALIZATION_FAILED;
#else
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
#endif
}
