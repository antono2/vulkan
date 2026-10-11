"""Upgrades must keep declarations and immutable compiler pins in agreement."""
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from compatibility import resolve


class CompatibilityChecks(unittest.TestCase):
    def test_project_profile(self):
        root = Path(__file__).resolve().parents[1]
        pins = json.loads((root / 'compatibility.json').read_text())
        values = resolve(root)
        self.assertEqual(values['selected_v'], pins.get('v', pins.get('v_release', '')))
        if 'v3_v' in pins:
            self.assertEqual(resolve(root, 'v3')['selected_v'], pins['v3_v'])
        self.assertEqual(resolve(root, 'master')['selected_v'], 'master')

    def test_mutable_compiler_and_disagreement_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = Path(__file__).resolve().parents[1]
            shutil.copyfile(source / 'v.mod', root / 'v.mod')
            pins = json.loads((source / 'compatibility.json').read_text())
            pins['v'] = 'master'
            (root / 'compatibility.json').write_text(json.dumps(pins))
            with self.assertRaisesRegex(ValueError, 'immutable'):
                resolve(root)
            del pins['v']
            (root / 'v.mod').write_text("Module { dependencies: ['antono2.memory@v99.0.0'] }")
            pins['modules']['memory'] = 'v1.4.0'
            (root / 'compatibility.json').write_text(json.dumps(pins))
            with self.assertRaisesRegex(ValueError, 'disagree'):
                resolve(root)


if __name__ == '__main__':
    unittest.main()
