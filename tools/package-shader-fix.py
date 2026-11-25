#!/usr/bin/env python3
"""Package precompiled shader resources for the existing Windows application."""
import hashlib
import json
import pathlib
import time
import zipfile

root = pathlib.Path(__file__).resolve().parent.parent
verified = json.loads((root / 'docs/viewport-shader-bundle-verification.json').read_text())
assert verified['passed'] and len(verified['maps']) == 33 and not verified['misses']
assert not verified['compilerExecutablesAvailable'] and verified['profileRemainedEmpty']
bundle = json.loads((root / 'docs/viewport-shader-bundle.json').read_text())
files = [(root / 'dist/vulkan-shaders' / key / name, f'resources/vulkan-shaders/{key}/{name}')
         for key in bundle['keys'] for name in ['vert.spv', 'frag.spv', 'manifest.json']]
files.append((root / 'docs/着色器缺失修复.md', '着色器补丁说明.md'))
digests = {name: hashlib.sha256(file.read_bytes()).hexdigest() for file, name in files}
manifest = {'kind': 'precompiled-shader-fix', 'cacheEntries': len(bundle['keys']),
            'mapsVerified': len(verified['maps']), 'requestsVerified': verified['requests'],
            'replacesApplication': False, 'requiresCompilerTools': False, 'payloadSha256': digests}
output = root / 'release' / ('SkyMapEditor-ShaderFix-' + time.strftime('%Y%m%d-%H%M%S', time.gmtime()) + '.zip')
with zipfile.ZipFile(output, 'x', zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
    for file, name in files:
        archive.write(file, name)
    archive.writestr('shader-fix-manifest.json', json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
with zipfile.ZipFile(output) as archive:
    assert archive.testzip() is None
    assert len(archive.namelist()) == len(set(archive.namelist()))
    for name, digest in digests.items():
        assert hashlib.sha256(archive.read(name)).hexdigest() == digest, name
checksum = hashlib.sha256(output.read_bytes()).hexdigest()
output.with_suffix('.zip.sha256').write_text(checksum + '  ' + output.name + '\n')
report = {**manifest, 'archive': str(output), 'archiveBytes': output.stat().st_size,
          'archiveSha256': checksum, 'zipIntegrityVerified': True, 'payloadSha256Verified': True}
(root / 'docs/shader-fix-package.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({key: value for key, value in report.items() if key != 'payloadSha256'}, ensure_ascii=False))
