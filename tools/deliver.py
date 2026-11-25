#!/usr/bin/env python3
"""Copy the built editor and review documents; never touch the reference assets."""
import hashlib, json, pathlib, shutil, sys, zipfile

root = pathlib.Path(__file__).resolve().parent.parent
target = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else pathlib.Path('/storage/emulated/0/Download/地图编辑器/sky-map-editor')
version = json.loads((root / 'package.json').read_text())['version']
release = root / 'release'
folders = ['src', 'tools', 'tests', 'docs', 'evidence']
files = ['package.json', 'package-lock.json', 'tsconfig.json', 'README.md', '.gitignore']
source = release / 'SkyMapEditor-源码.zip'
with zipfile.ZipFile(source, 'w', zipfile.ZIP_DEFLATED) as archive:
    for name in files:
        archive.write(root / name, 'sky-map-editor/' + name)
    for folder in folders:
        for file in sorted((root / folder).rglob('*')):
            if file.is_file() and file.name != 'ui-failure.png' and '__pycache__' not in file.parts:
                archive.write(file, 'sky-map-editor/' + file.relative_to(root).as_posix())

target.mkdir(parents=True, exist_ok=True)
for name in files:
    shutil.copy2(root / name, target / name)
for folder in folders + ['dist']:
    shutil.copytree(root / folder, target / folder, dirs_exist_ok=True, ignore=shutil.ignore_patterns('ui-failure.png', '__pycache__'))
out = target / 'release'
out.mkdir(exist_ok=True)
previous = target / 'package.json'
for name in ['SkyMapEditor-Windows-x64.zip', 'SkyMapEditor-源码.zip']:
    destination = out / name
    # Preserve the first delivered version when replacing the canonical download.
    old = destination.with_name(destination.stem + '-0.1.0' + destination.suffix)
    if destination.exists() and not old.exists():
        shutil.copy2(destination, old)
    shutil.copy2(release / name, destination)
shutil.copytree(release / 'SkyMapEditor-win32-x64', out / 'SkyMapEditor-win32-x64', dirs_exist_ok=True)
manifest = {'version': version, 'windowsRuntimeTested': False, 'originalGameTested': False, 'artifacts': {}}
for name in ['SkyMapEditor-Windows-x64.zip', 'SkyMapEditor-源码.zip']:
    file = out / name
    manifest['artifacts'][name] = {'bytes': file.stat().st_size, 'sha256': hashlib.file_digest(file.open('rb'), 'sha256').hexdigest()}
(out / '校验信息.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
shutil.copy2(out / '校验信息.json', release / '校验信息.json')
print(json.dumps({'target': str(target), **manifest}, ensure_ascii=False, indent=2))
