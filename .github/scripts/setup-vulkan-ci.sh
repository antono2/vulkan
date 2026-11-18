#!/bin/sh
# Compatibility entry point for the checkout's V Vulkan SDK installer.
set -eu
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
if [ ! -f "$script_dir/setup-vulkan-ci.vsh" ]; then
    printf '%s\n' 'The SDK setup script needs a Vulkan checkout. GitHub Actions can use .github/actions/setup-vulkan-ci.' >&2
    exit 2
fi
exec "${V_BIN:-v}" run "$script_dir/setup-vulkan-ci.vsh" "$@"
