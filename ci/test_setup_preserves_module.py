"""Exercise installation with fake package commands and an existing release pin."""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--v', default='v')
args = parser.parse_args()
if not __import__('sys').platform.startswith('linux'):
    raise SystemExit('Linux package-command fixture only')
root = Path(__file__).resolve().parents[1]
compiler = shutil.which(args.v) or str(Path(args.v).resolve())
with tempfile.TemporaryDirectory(prefix='vulkan pinned module ') as temporary:
    work = Path(temporary)
    modules = work / 'modules'
    package = modules / 'antono2/vulkan'
    package.mkdir(parents=True)
    pin = "Module { name: 'antono2.vulkan' version: '1.2.3' }\n"
    (package / 'v.mod').write_text(pin)
    source = work / 'fixture.v'
    source.write_text('''import os
fn main() {
 if os.file_name(os.executable()) == 'v' {
  os.write_file(os.getenv('INSTALL_MARKER'), os.args.join(' ')) or { panic(err) }
  exit(88)
 }
}
''')
    stub = work / 'sudo'
    subprocess.run([compiler, '-cc', 'gcc', '-o', str(stub), str(source)], check=True)
    shutil.copy2(stub, work / 'v')
    marker = work / 'unexpected-install.txt'
    env = dict(os.environ, VMODULES=str(modules), PATH=str(work) + os.pathsep + os.environ['PATH'], INSTALL_MARKER=str(marker))
    result = subprocess.run([compiler, 'run', str(root / 'setup.vsh'), '--install'], env=env, capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    assert not marker.exists(), 'setup attempted an unpinned module install'
    assert (package / 'v.mod').read_text() == pin
print('Existing module pin preserved; package commands were mocked.')
