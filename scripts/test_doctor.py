"""Diagnostics must identify mismatches without repairing or changing caches."""
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from doctor import diagnose


class DoctorChecks(unittest.TestCase):
    def fixture(self, root):
        (root / 'compatibility.json').write_text(json.dumps({'schema_version': 1,
            'v': 'a' * 40, 'modules': {'memory': 'v1.4.0'}, 'build_tools': ['git']}))
        (root / 'v.mod').write_text("Module { dependencies: ['antono2.memory@v1.4.0'] }")

    def test_missing_tools_are_actionable_and_read_only(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.fixture(root)
            before = {p.name: p.read_bytes() for p in root.iterdir()}
            with patch('doctor.shutil.which', return_value=None), patch.dict('os.environ', {}, clear=True):
                report = diagnose(root)
            failed = [item for item in report['checks'] if item['status'] == 'fail']
            self.assertEqual({item['name'] for item in failed}, {'git', 'V compiler'})
            self.assertTrue(all(item['action'] for item in failed))
            self.assertEqual(before, {p.name: p.read_bytes() for p in root.iterdir()})

    def test_wrong_compiler_and_dependency_are_reported(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.fixture(root)
            (root / 'v.mod').write_text("Module { dependencies: ['antono2.memory@v99.0.0'] }")
            with patch('doctor.shutil.which', return_value='git'), patch('doctor.probe', return_value=(True, 'V wrong-revision')):
                report = diagnose(root, compiler='fixture-v')
            failed = {item['name'] for item in report['checks'] if item['status'] == 'fail'}
            self.assertIn('V compiler', failed)
            self.assertIn('Declared dependencies', failed)


if __name__ == '__main__':
    unittest.main()
