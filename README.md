

# Vulkan Bindings for [V](https://vlang.io/)
`src/vulkan.v` and `src/vulkan_video.v` were generated using the current [KhronosGroup](https://github.com/KhronosGroup/) [API description](https://github.com/KhronosGroup/Vulkan-Docs/blob/main/xml/vk.xml).

## Dependencies
Please install the [Vulkan SDK](https://vulkan.lunarg.com/sdk/home) and set the [environment variables](https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html).

## Install
 Download this repository to your local .vmodules
```
v install https://github.com/antono2/vulkan
```

## Examples
An example can be found at  [antono2/v_vulkan_bindings/test](https://github.com/antono2/v_vulkan_bindings/tree/master/test).
A video decode app using `vulkan_video.v` can be found at [antono2/v_vulkan_video](https://github.com/antono2/v_vulkan_video).

## Generate
The generator is located at [antono2/v_vulkan_bindings](https://github.com/antono2/v_vulkan_bindings).

# Thanks
Big thanks to [@spytheman](https://github.com/spytheman) for fixing my bugs in times of need.</br>
To [@JalonSolov](https://github.com/JalonSolov) for quick and solid answers to obscure questions.</br>
The awesome team at [V](https://vlang.io/) for making this possible.

## LICENSE

```
MIT License

Copyright Anton Oreskin | https://gosudev.de


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

