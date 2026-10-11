#!/usr/bin/env python3
"""Read-only build/runtime diagnostics; use --json for a support report."""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess


def probe(command, timeout=15):
    try:
        result = subprocess.run(command, capture_output=True, text=True, errors='replace', timeout=timeout)
        return result.returncode == 0, (result.stdout + result.stderr).strip()
    except (OSError, subprocess.TimeoutExpired) as error:
        return False, str(error)


def diagnose(root, compiler=None, modules=None, sdk=None, runtime=False):
    checks = []
    def check(name, passed, detail, action, optional=False):
        checks.append({'name': name, 'status': 'pass' if passed else ('warn' if optional else 'fail'),
                       'detail': detail, 'action': '' if passed else action})
    try:
        pins = json.loads((root / 'compatibility.json').read_text())
        if pins.get('schema_version') != 1:
            raise ValueError('Unsupported schema_version')
    except (OSError, ValueError) as error:
        check('Compatibility manifest', False, str(error), 'Restore compatibility.json from this project revision.')
        return {'checks': checks}
    declared = dict(re.findall(r"'antono2\.([a-z0-9_]+)@([^']+)'", (root / 'v.mod').read_text()))
    disagreement = [name for name, tag in declared.items() if pins.get('modules', {}).get(name) != tag]
    check('Declared dependencies', not disagreement, ', '.join(disagreement) or 'Manifest agrees with v.mod',
          'Update compatibility.json and v.mod together; use the tested dependency versions.')
    for tool in pins.get('build_tools', ['git', 'cmake']):
        location = shutil.which(tool)
        check(tool, bool(location), location or 'Not found on PATH', f'Install {tool}, reopen your shell and rerun diagnostics.')
    compiler = str(compiler) if compiler else (os.environ.get('VEXE') or shutil.which('v'))
    if compiler:
        passed, detail = probe([compiler, '-version'])
        expected = pins.get('v', '')[:7] or pins.get('v_release', '')
        matches = passed and (not expected or expected in detail)
        check('V compiler', matches, detail, 'Select the tested V compiler from compatibility.json or rerun the setup helper.')
    else:
        check('V compiler', False, 'No V compiler found', 'Run the project setup helper, or pass --v with the tested compiler path.')
    modules = modules or os.environ.get('VMODULES')
    if modules:
        for name, tag in pins.get('modules', {}).items():
            checkout = Path(modules) / 'antono2' / name
            head_ok, head = probe(['git', '-C', str(checkout), 'rev-parse', '--verify', 'HEAD'])
            tag_ok, wanted = probe(['git', '-C', str(checkout), 'rev-parse', '--verify', f'refs/tags/{tag}^{{commit}}'])
            check('Module ' + name, head_ok and tag_ok and head == wanted, f'{checkout}: expected {tag}',
                  'Preserve local changes and use a fresh module/cache directory with the declared releases.')
    else:
        check('Installed modules', False, 'VMODULES is not set', 'Pass --modules with the module directory used by setup.', optional=True)
    sdk = sdk or os.environ.get('VULKAN_SDK')
    needs_vulkan = 'ci_sdk' in pins or 'vulkan' in pins.get('modules', {})
    if needs_vulkan and os.name == 'nt':
        available = bool(sdk) and (Path(sdk) / 'Lib/vulkan-1.lib').is_file()
        check('Vulkan SDK', available, str(sdk or 'Not configured'), 'Install the Vulkan SDK or pass --sdk with its directory.')
    if runtime and needs_vulkan:
        executable = shutil.which('vulkaninfo')
        if not executable and sdk:
            candidate = Path(sdk) / ('Bin/vulkaninfo.exe' if os.name == 'nt' else 'bin/vulkaninfo')
            if candidate.is_file():
                executable = str(candidate)
        passed, detail = probe([executable, '--summary'], timeout=30) if executable else (False, 'vulkaninfo is unavailable')
        check('Vulkan devices', passed, detail, 'Install Vulkan runtime tools and a compatible graphics driver; rerun --runtime.', optional=True)
    return {'project': root.name, 'platform': os.name, 'compatibility': pins, 'checks': checks,
            'hardware_note': 'Device enumeration does not validate hardware video decoding or OpenCL interoperability.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--v', type=Path, help='Tested V compiler executable')
    parser.add_argument('--modules', type=Path)
    parser.add_argument('--sdk', type=Path)
    parser.add_argument('--runtime', action='store_true', help='Also enumerate Vulkan devices, when tools are available')
    parser.add_argument('--json', action='store_true', help='Emit JSON without modifying the environment or caches')
    args = parser.parse_args()
    report = diagnose(Path(__file__).resolve().parents[1], args.v, args.modules, args.sdk, args.runtime)
    if args.json:
        print(json.dumps(report, indent=2))
    else:
        for item in report['checks']:
            print(f"{item['status'].upper()}: {item['name']}: {item['detail']}")
            if item['action']:
                print('  Next: ' + item['action'])
    raise SystemExit(1 if any(item['status'] == 'fail' for item in report['checks']) else 0)


if __name__ == '__main__':
    main()
