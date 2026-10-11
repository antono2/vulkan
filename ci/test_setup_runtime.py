"""Exercise setup's runtime probe without depending on a GPU or installed SDK."""

import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--v', default=os.environ.get('VEXE', 'v'))
    parser.add_argument('--cc', default='msvc' if os.name == 'nt' else 'gcc')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    compiler = shutil.which(args.v) or str(Path(args.v).resolve())
    suffix = '.exe' if os.name == 'nt' else ''
    with tempfile.TemporaryDirectory(prefix='vulkan setup with spaces ') as temporary:
        work = Path(temporary)
        probe_source = work / 'probe.v'
        probe_source.write_text('''import os
fn main() {
    assert os.args[1..] == ['--summary']
    os.write_file(os.getenv('PROBE_MARKER'), os.getwd()) or { panic(err) }
    if os.getenv('PROBE_FAIL') == '1' { exit(23) }
    println('GPU0: fixture')
}
''', encoding='utf-8')
        probe = work / ('vulkaninfo' + suffix)
        subprocess.run([compiler, '-cc', args.cc, '-o', str(probe), str(probe_source)],
                       check=True, cwd=root)
        marker = work / 'ran.txt'
        env = dict(os.environ, PATH=str(work) + os.pathsep + os.environ['PATH'],
                   PROBE_MARKER=str(marker))
        for failure in ['0', '1']:
            env['PROBE_FAIL'] = failure
            result = subprocess.run([compiler, '-cc', args.cc, 'run', str(root / 'setup.vsh'),
                                     '--check'], cwd=root, env=env,
                                    capture_output=True, text=True, check=True)
            print(result.stdout)
            assert marker.is_file(), 'vulkaninfo never ran'
            assert Path(marker.read_text()).resolve() == Path(tempfile.gettempdir()).resolve()
            expected = ('[ok]       Vulkan loader enumerated a physical device' if failure == '0'
                        else '[warning]  vulkaninfo is installed, but no usable device was enumerated')
            assert expected in result.stdout, result.stdout + result.stderr
            marker.unlink()
    print('Setup runtime probe tests passed.')


if __name__ == '__main__':
    main()
