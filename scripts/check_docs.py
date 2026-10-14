#!/usr/bin/env python3
"""Ensure first-use snippets are exact copies of the examples exercised by CI."""
from pathlib import Path
import re
root = Path(__file__).resolve().parents[1]
readme = root / 'packaging/published_README.md'
if not readme.exists():
    readme = root / 'README.md'
blocks = re.findall(r'<!-- example: (.*?) -->\s*```v\n(.*?)\n```', readme.read_text(), re.S)
assert blocks, 'README needs a tested first-use example'
for path, snippet in blocks:
    assert (root / path).read_text().strip() == snippet.strip(), f'Readme example drift: {path}'
print(f'{len(blocks)} README example(s) match tested source.')
