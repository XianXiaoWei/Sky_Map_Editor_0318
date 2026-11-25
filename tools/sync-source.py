#!/usr/bin/env python3
"""Incrementally mirror development files without rebuilding release archives.

Never enters reference/ or release/. Android assets/Data and native payloads are included; no dependencies or removals.
"""
import hashlib
import json
import pathlib
import shutil
import sys

root = pathlib.Path(__file__).resolve().parent.parent
target = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else pathlib.Path('/storage/emulated/0/Download/地图编辑器/sky-map-editor')
target.mkdir(parents=True, exist_ok=True)
files = [root / n for n in ['package.json', 'package-lock.json', 'tsconfig.json', 'README.md', '.gitignore']]
for folder in ['src', 'native', 'tools', 'tests', 'docs', 'evidence', 'dist', 'android']:
    files.extend(p for p in (root / folder).rglob('*') if p.is_file() and '__pycache__' not in p.parts and p.name != 'ui-failure.png' and not (folder == 'android' and any(part in ['build', '.gradle', '.cxx'] for part in p.relative_to(root / folder).parts)))

def digest(file):
    with file.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').digest()

copied = 0
for file in files:
    dest = target / file.relative_to(root)
    if dest.is_file() and file.stat().st_size == dest.stat().st_size and digest(file) == digest(dest):
        continue
    dest.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(file, dest); copied += 1
print(json.dumps({'target': str(target), 'developmentFilesCopied': copied, 'releaseRepackaged': False, 'referenceChanged': False}, ensure_ascii=False))
