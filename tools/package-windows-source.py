#!/usr/bin/env python3
"""Archive clean, buildable Windows source without original game Data.

No Android host, build outputs, node_modules, caches, signing keys or releases.
"""
import argparse
import hashlib
import json
import pathlib
import time
import zipfile

root = pathlib.Path(__file__).resolve().parent.parent
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--plan', action='store_true', help='Verify and list source inputs without creating a ZIP')
args = parser.parse_args()
files = [(root / name, name) for name in ['package.json', 'package-lock.json', 'tsconfig.json', 'README.md', '.gitignore', 'GitHub声明.md', 'LICENSE.md']]
excluded_dirs = {'node_modules', 'dist', 'release', 'build', '.git', '.gradle', '.cxx', '__pycache__', 'data', 'reference'}
excluded_suffixes = {'.bak', '.tmp', '.log', '.pyc', '.pyo', '.keystore', '.jks', '.apk', '.aab', '.exe', '.dll', '.so', '.dylib', '.o', '.obj', '.a', '.lib', '.spv', '.asar', '.zip', '.bin', '.png'}
# This numeric lookup table and author image are source/runtime inputs, not
# original maps/models/textures or compiled executables.
required_assets = {'docs/beamo-rsqrt-capability.bin', 'src/renderer/author-appreciation.png'}
# Keep the README showcase images in source packages.
required_assets.update(file.relative_to(root).as_posix()
                       for file in (root / 'docs/screenshots').glob('*.png') if file.is_file())
for folder in ['src', 'native', 'tools', 'tests', 'docs', 'evidence']:
    for file in (root / folder).rglob('*'):
        if not file.is_file():
            continue
        relative = file.relative_to(root)
        if any(part.lower() in excluded_dirs for part in relative.parts):
            continue
        if file.name == 'windows-source-plan.json':
            continue
        if 'android' in file.name.lower() or relative.parts[:2] == ('src', 'android'):
            continue
        if (file.suffix.lower() in excluded_suffixes or file.name.endswith('.bin.gz')) and relative.as_posix() not in required_assets:
            continue
        files.append((file, relative.as_posix()))
paths = [relative for _, relative in files]
if len(paths) != len(set(paths)):
    raise RuntimeError('Duplicate source archive paths')
for relative in paths:
    if any(part.lower() in excluded_dirs for part in pathlib.PurePosixPath(relative).parts) or (pathlib.PurePosixPath(relative).suffix.lower() in excluded_suffixes and relative not in required_assets):
        raise RuntimeError('Unclean source archive entry: ' + relative)
if args.plan:
    plan = {'platform': 'win32', 'files': len(files), 'bytes': sum(file.stat().st_size for file, _ in files),
            'includesData': False, 'includesOriginalOracleExecutable': False, 'includesPreparedDesktopBinaries': False, 'includesAndroidHost': False,
            'buildOutputsIncluded': False, 'nodeModulesIncluded': False, 'cacheIncluded': False,
            'entries': [{'path': relative, 'bytes': file.stat().st_size} for file, relative in sorted(files, key=lambda item: item[1])]}
    (root / 'docs/windows-source-plan.json').write_text(json.dumps(plan, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({key: value for key, value in plan.items() if key != 'entries'}, ensure_ascii=False))
    raise SystemExit(0)
release = root / 'release'
release.mkdir(exist_ok=True)
output = release / ('SkyMapEditor-Windows-clean-source-' + time.strftime('%Y%m%d-%H%M%S', time.gmtime()) + '.zip')
prefix = 'SkyMapEditor-Windows-source/'
manifest = []
with zipfile.ZipFile(output, 'x', zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
    for index, (file, relative) in enumerate(sorted(files, key=lambda item: item[1]), 1):
        digest = hashlib.sha256()
        with file.open('rb') as source, archive.open(prefix + relative, 'w', force_zip64=True) as target:
            while block := source.read(1024 * 1024):
                digest.update(block)
                target.write(block)
        manifest.append({'path': relative, 'bytes': file.stat().st_size, 'sha256': digest.hexdigest()})
        if index % 1000 == 0:
            print('Archived', index, 'files', flush=True)
    archive.writestr(prefix + 'source-manifest.json', json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
with zipfile.ZipFile(output) as archive:
    names = archive.namelist()
    if len(names) != len(set(names)):
        raise RuntimeError('Duplicate source archive paths')
    if json.loads(archive.read(prefix + 'source-manifest.json')) != manifest:
        raise RuntimeError('Source ZIP manifest differs')
    for entry in manifest:
        digest = hashlib.sha256()
        with archive.open(prefix + entry['path']) as source:
            while block := source.read(1024 * 1024):
                digest.update(block)
        if digest.hexdigest() != entry['sha256']:
            raise RuntimeError('Source ZIP payload differs: ' + entry['path'])
with output.open('rb') as stream:
    checksum = hashlib.file_digest(stream, 'sha256').hexdigest()
report = {'zip': str(output), 'bytes': output.stat().st_size, 'sha256': checksum,
          'files': len(files), 'includesData': False, 'dataPath': None,
          'includesPreparedDesktopBinaries': False, 'includesAndroidHost': False, 'buildOutputsIncluded': False, 'cacheIncluded': False, 'includesNativeLibrarySource': True,
          'includesOriginalOracleExecutable': False, 'originalReferenceModified': False,
          'sourcePayloadSha256Verified': True, 'crcVerified': True,
          'nodeModulesIncluded': False, 'signingKeyIncluded': False}
output.with_suffix('.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
output.with_suffix('.zip.sha256').write_text(checksum + '  ' + output.name + '\n')
print(json.dumps(report, ensure_ascii=False), flush=True)
