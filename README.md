
# Vulkan Bindings for Vlang
The bindings in`src/vulkan.v` were generated from the official [vk.xml](https://github.com/KhronosGroup/Vulkan-Docs/blob/main/xml/vk.xml) vulkan registry.

Vulkan Version 1.3.272

# Important
This is still work in progress.

## TODO
 - Create more advanced example
 - Test on Windows
 - Test StdVideo headers
 - Create tests
 - Create workflow to download and generate on new release
  
## Dependencies
You will need the `libvulkan.so.1` or `vulkan-1.dll` shared library from the [vulkan SDK](https://vulkan.lunarg.com/).

Make sure to add the path to your `LD_LIBRARY_PATH` environment variable, like

`export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"`

## Run
There is an app `vk_example.v`, which you can run with

```
git clone https://github.com/antono2/vulkan.git
cd vulkan
v run examples/vk_example.v
```
You can use the `VK_INSTANCE_LAYERS` environment variable, e.g. to dump information when running.

Explained [here](https://vulkan.lunarg.com/doc/view/latest/windows/layer_configuration.html) for different operating systems.

`export VK_INSTANCE_LAYERS=VK_LAYER_LUNARG_api_dump:VK_LAYER_KHRONOS_validation`

## LICENSE
SPDX-License-Identifier: `LGPL-2.1-only`

Basically, I want improvements back, but do as you wish otherwise.

# Thanks
Big thanks to @spytheman for fixing my bugs in times of need

