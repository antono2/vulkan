#!/usr/bin/env bash

set -euo pipefail

sdk_version="${1:?usage: setup-vulkan-ci.sh SDK_VERSION ARTIFACT_TAG}"
artifact_tag="${2:?usage: setup-vulkan-ci.sh SDK_VERSION ARTIFACT_TAG}"
install_root="${RUNNER_TEMP:?}"
install_root="${install_root//\\//}/vulkan-ci"

case "${RUNNER_OS:?}" in
	Linux)
		artifact_platform='ubuntu-20.04-x64'
		swiftshader_library='libvk_swiftshader.so'
		;;
	macOS)
		artifact_platform='macOS-13-x64'
		swiftshader_library='libvk_swiftshader.dylib'
		;;
	Windows)
		artifact_platform='windows-2022-x64'
		swiftshader_library='vk_swiftshader.dll'
		;;
	*)
		echo "unsupported runner OS: $RUNNER_OS" >&2
		exit 1
		;;
esac

sdk_archive="vulkanSDK-${sdk_version}-${artifact_platform}.zip"
swiftshader_archive="swiftshader-${artifact_platform}.zip"
download_base="https://github.com/NcStudios/VulkanCI/releases/download/${artifact_tag}"
sdk_root="$install_root/VulkanSDK"
swiftshader_root="$install_root/swiftshader"

mkdir -p "$sdk_root" "$swiftshader_root"
curl --fail --location --retry 5 --retry-all-errors --silent --show-error \
	"$download_base/$sdk_archive" --output "$install_root/$sdk_archive"
curl --fail --location --retry 5 --retry-all-errors --silent --show-error \
	"$download_base/$swiftshader_archive" --output "$install_root/$swiftshader_archive"
if command -v python3 >/dev/null 2>&1; then
	archive_python='python3'
elif command -v python >/dev/null 2>&1; then
	archive_python='python'
else
	echo 'Python is required to extract Vulkan CI artifacts' >&2
	exit 1
fi
"$archive_python" -m zipfile -e "$install_root/$sdk_archive" "$sdk_root"
"$archive_python" -m zipfile -e "$install_root/$swiftshader_archive" "$swiftshader_root"

sdk_path="$sdk_root/$sdk_version"
test -d "$sdk_path/include"
test -f "$swiftshader_root/$swiftshader_library"

driver_manifest="$swiftshader_root/vk_swiftshader_icd.json"
cat > "$driver_manifest" <<EOF
{
  "file_format_version": "1.0.0",
  "ICD": {
    "library_path": "$swiftshader_root/$swiftshader_library",
    "api_version": "1.0.5"
  }
}
EOF

{
	echo "VULKAN_SDK=$sdk_path"
	echo "VULKAN_SDK_VERSION=$sdk_version"
	echo "VK_DRIVER_FILES=$driver_manifest"
} >> "${GITHUB_ENV:?}"

case "$RUNNER_OS" in
	Linux)
		library_path="$sdk_path/lib:$swiftshader_root"
		if [[ -n "${LD_LIBRARY_PATH:-}" ]]; then
			library_path="$LD_LIBRARY_PATH:$library_path"
		fi
		{
			echo "VK_LAYER_PATH=$sdk_path/share/vulkan/explicit_layer.d"
			echo "LD_LIBRARY_PATH=$library_path"
		} >> "$GITHUB_ENV"
		;;
	macOS)
		library_path="$sdk_path/lib:$swiftshader_root"
		if [[ -n "${DYLD_LIBRARY_PATH:-}" ]]; then
			library_path="$DYLD_LIBRARY_PATH:$library_path"
		fi
		{
			echo "VK_LAYER_PATH=$sdk_path/share/vulkan/explicit_layer.d"
			echo "DYLD_LIBRARY_PATH=$library_path"
		} >> "$GITHUB_ENV"
		;;
	Windows)
		echo "VK_LAYER_PATH=$sdk_path/bin" >> "$GITHUB_ENV"
		echo "$sdk_path/bin" >> "${GITHUB_PATH:?}"
		;;
esac
