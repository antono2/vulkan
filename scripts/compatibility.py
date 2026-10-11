#!/usr/bin/env python3
"""Resolve tested compiler/native/module profiles and validate VPM declarations."""
import argparse
import json
from pathlib import Path
import re
import subprocess


def resolve(root, profile='stable'):
    pins = json.loads((root / 'compatibility.json').read_text())
    if pins.get('schema_version') != 1:
        raise ValueError('Unsupported compatibility schema_version')
    if 'v_release' in pins and not re.fullmatch(r'[0-9]+\.[0-9]+\.[0-9]+', pins['v_release']):
        raise ValueError('v_release must be a released compiler version')
    upstream = root / 'third_party/upstream.json'
    if upstream.is_file() and pins.get('glfw') != json.loads(upstream.read_text())['version']:
        raise ValueError('Native GLFW version and compatibility.json disagree')
    for key, value in pins.items():
        if key in ['v', 'vc', 'tcc', 'volk', 'generator'] or key.endswith(('_v', '_vc', '_tcc')):
            if not re.fullmatch('[0-9a-f]{40}', value):
                raise ValueError(f'{key} must be an immutable Git commit')
    declared = dict(re.findall(r"'antono2\.([a-z0-9_]+)@([^']+)'", (root / 'v.mod').read_text()))
    for name, tag in declared.items():
        if pins.get('modules', {}).get(name) != tag:
            raise ValueError(f'v.mod and compatibility.json disagree for {name}')
    outputs = {key: value for key, value in pins.items() if isinstance(value, str)}
    for name, tag in pins.get('modules', {}).items():
        if not re.fullmatch('[a-z0-9_]+', name) or not re.fullmatch(r'v[0-9]+\.[0-9]+\.[0-9]+(?:-standard)?', tag):
            raise ValueError(f'Invalid module pin: {name}={tag}')
        outputs['module_' + name] = tag
    outputs['selected_v'] = 'master' if profile == 'master' else (pins['v3_v'] if profile == 'v3' else pins.get('v', pins.get('v_release', '')))
    for key, value in outputs.items():
        if not re.fullmatch('[a-z0-9_]+', key) or '\n' in value or '\r' in value:
            raise ValueError(f'Unsafe compatibility output: {key}')
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--profile', choices=['stable', 'v3', 'master'], default='stable')
    parser.add_argument('--github-output', type=Path)
    parser.add_argument('--get')
    parser.add_argument('--modules', type=Path)
    args = parser.parse_args()
    outputs = resolve(args.root, args.profile)
    if args.modules:
        for key, tag in outputs.items():
            if not key.startswith('module_'):
                continue
            checkout = args.modules / 'antono2' / key[len('module_'):]
            def revision(ref):
                return subprocess.check_output(['git', '-C', str(checkout), 'rev-parse', '--verify', ref], text=True).strip()
            if revision('HEAD') != revision(f'refs/tags/{tag}^{{commit}}'):
                raise ValueError(f'Installed module does not match {tag}: {checkout}')
    if args.github_output:
        with args.github_output.open('a', encoding='utf-8') as output:
            for key, value in outputs.items():
                output.write(f'{key}={value}\n')
    print(outputs[args.get] if args.get else json.dumps(outputs, indent=2))


if __name__ == '__main__':
    main()
