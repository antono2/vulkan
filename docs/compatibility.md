# Tested compatibility and diagnostics

`compatibility.json` records the existing tested compiler, bootstrap, native and
module versions. CI resolves these values before dependency checkout and rejects
disagreement with `v.mod`. Advisory upstream-master lanes remain advisory.
Registry/version files owned by binding generators remain authoritative for
generated API contents; upstream update workflows deliberately select candidates
separately from the tested compiler profiles.

Upgrade the manifest and affected VPM declarations together. Run
`python scripts/test_compatibility.py` and the full project CI. Consumer application
compilation/runtime checks are also required before publishing a dependency upgrade.
The resolver's `--modules PATH` option verifies installed Git tags without fetching.

Run `python scripts/doctor.py --v PATH_TO_V --modules PATH_TO_MODULES` for read-only
compiler/tool/dependency diagnostics. Add `--json` for a support report and
`--runtime` for Vulkan device enumeration when Vulkan tools are available. Missing
or mismatched prerequisites include a recovery action; diagnostics never repair
caches or change the environment. Enumeration alone does not prove hardware video
decoding or OpenCL interoperability. Python 3.9 or newer is required for these tools.

Choose `--profile v3` for the pinned V3 compiler or `--profile release` for
the released compiler when the project defines multiple profiles.
