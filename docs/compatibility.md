# Tested compatibility and diagnostics

`compatibility.json` records the existing tested compiler, bootstrap, native and
module versions. CI resolves these values before dependency checkout and rejects
disagreement with `v.mod`. Advisory upstream-master lanes remain advisory.
Registry/version files owned by binding generators remain authoritative for
generated API contents; upstream update workflows deliberately select candidates
separately from the tested compiler profiles.

Upgrade the manifest and affected VPM declarations together. Run
`v run scripts/compatibility.vsh --self-test` and the full project CI. Consumer application
compilation/runtime checks are also required before publishing a dependency upgrade.
The resolver's `--modules PATH` option verifies installed Git tags without fetching.

Run `v run scripts/doctor.vsh --v PATH_TO_V --modules PATH_TO_MODULES` for read-only
compiler/tool/dependency diagnostics. Add `--json` for a support report and
`--runtime` for Vulkan device enumeration when Vulkan tools are available. Missing
or mismatched prerequisites include a recovery action; diagnostics never repair
caches or change the environment. Enumeration alone does not prove hardware video
decoding or OpenCL interoperability. Use the tested V compiler from `compatibility.json` to run these tools.

Choose `--profile v3` for the pinned V3 compiler or `--profile release` for
the released compiler when the project defines multiple profiles.

## Vulkan SDK setup in GitHub Actions

After installing V on the runner, use the SDK setup action with the VulkanCI
release that matches the native test suite. Pin the action to a commit.

```yaml
- uses: antono2/vulkan/.github/actions/setup-vulkan-ci@COMMIT_SHA
  with:
    sdk-version: '1.4.309.0'
    artifact-tag: 'v1.2'
```

The action configures `VULKAN_SDK`, `VULKAN_SDK_VERSION`, `VK_DRIVER_FILES`,
and the runner paths for the SDK and SwiftShader. Applications can choose
their bindings revision independently of the SDK setup action.
