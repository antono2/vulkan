module ergonomic

import antono2.vulkan as vk

// ExtensionInfo is an owned snapshot of one advertised Vulkan extension.
pub struct ExtensionInfo {
pub:
	name         string
	spec_version u32
}

// LayerInfo is an owned snapshot of one advertised Vulkan instance layer.
pub struct LayerInfo {
pub:
	name                   string
	description            string
	spec_version           u32
	implementation_version u32
}

fn extension_infos(properties []vk.ExtensionProperties) []ExtensionInfo {
	mut result := []ExtensionInfo{cap: properties.len}
	for property in properties {
		result << ExtensionInfo{
			name: unsafe { cstring_to_vstring(&property.extensionName[0]) }.clone()
			spec_version: property.specVersion
		}
	}
	return result
}

fn layer_infos(properties []vk.LayerProperties) []LayerInfo {
	mut result := []LayerInfo{cap: properties.len}
	for property in properties {
		result << LayerInfo{
			name: unsafe { cstring_to_vstring(&property.layerName[0]) }.clone()
			description: unsafe { cstring_to_vstring(&property.description[0]) }.clone()
			spec_version: property.specVersion
			implementation_version: property.implementationVersion
		}
	}
	return result
}

// instance_extensions enumerates global instance extensions and returns owned
// names which remain valid after the raw property array is released.
pub fn instance_extensions() ![]ExtensionInfo {
	require_success(vk.initialize_loader(), 'volkInitialize')!
	for {
		mut count := u32(0)
		mut no_properties := unsafe { nil }
		require_success(vk.enumerate_instance_extension_properties(unsafe { nil }, &count, mut no_properties), 'vkEnumerateInstanceExtensionProperties(count)')!
		if count == 0 {
			return []ExtensionInfo{}
		}
		mut properties := []vk.ExtensionProperties{len: int(count)}
		result := vk.enumerate_instance_extension_properties(unsafe { nil }, &count, mut properties[0])
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkEnumerateInstanceExtensionProperties(values)')!
		return extension_infos(properties[..int(count)])
	}
	return []ExtensionInfo{}
}

// instance_layers enumerates available instance layers and returns owned names
// and descriptions.
pub fn instance_layers() ![]LayerInfo {
	require_success(vk.initialize_loader(), 'volkInitialize')!
	for {
		mut count := u32(0)
		mut no_properties := unsafe { nil }
		require_success(vk.enumerate_instance_layer_properties(&count, mut no_properties), 'vkEnumerateInstanceLayerProperties(count)')!
		if count == 0 {
			return []LayerInfo{}
		}
		mut properties := []vk.LayerProperties{len: int(count)}
		result := vk.enumerate_instance_layer_properties(&count, mut properties[0])
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkEnumerateInstanceLayerProperties(values)')!
		return layer_infos(properties[..int(count)])
	}
	return []LayerInfo{}
}

// extensions enumerates extensions supported by this physical device.
pub fn (device PhysicalDevice) extensions() ![]ExtensionInfo {
	for {
		mut count := u32(0)
		mut no_properties := unsafe { nil }
		require_success(vk.enumerate_device_extension_properties(device.handle, unsafe { nil }, &count, mut no_properties), 'vkEnumerateDeviceExtensionProperties(count)')!
		if count == 0 {
			return []ExtensionInfo{}
		}
		mut properties := []vk.ExtensionProperties{len: int(count)}
		result := vk.enumerate_device_extension_properties(device.handle, unsafe { nil }, &count, mut properties[0])
		if result == .incomplete {
			continue
		}
		require_success(result, 'vkEnumerateDeviceExtensionProperties(values)')!
		return extension_infos(properties[..int(count)])
	}
	return []ExtensionInfo{}
}

fn missing_names(requested []string, available []string) []string {
	mut result := []string{}
	for name in requested {
		if name !in available && name !in result {
			result << name
		}
	}
	return result
}

fn validate_requested_names(kind string, requested []string, available []string) ! {
	for name in requested {
		if name.len == 0 || name.contains_u8(0) {
			return error('${kind} names must be non-empty and contain no NUL bytes')
		}
	}
	missing := missing_names(requested, available)
	if missing.len > 0 {
		return error('unsupported ${kind}: ${missing.join(', ')}')
	}
}

fn extension_names(infos []ExtensionInfo) []string {
	return infos.map(it.name)
}

fn layer_names(infos []LayerInfo) []string {
	return infos.map(it.name)
}
