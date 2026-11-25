#!/usr/bin/env python3
"""Collect completed full-preview checks and bind the reviewed Windows payload."""
import hashlib
import json
import pathlib
import re

root = pathlib.Path(__file__).resolve().parent.parent
research = pathlib.Path('/root/sky-research')

def read(name):
    result = json.loads((root / 'docs' / name).read_text())
    assert result['passed'] is True, name
    return result

def sha(file):
    with file.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()

reference = read('full-preview-graph-check.json')
surface = read('full-preview-graph-surface-check.json')
ui = read('full-preview-ui-check.json')
shader = read('model-shader-bundle-verification.json')
odd = read('full-preview-odd-size-check.json')
odd_frames = odd['maps'][0]['frames']
assert len(odd_frames) == 6 and any(f['width'] == 193 and f['height'] == 109 for f in odd_frames)
assert all(f['differing'] == f['max'] == 0 for f in odd_frames)
for check in [reference, surface]:
    assert [row['level'] for row in check['maps']] == ['Dawn', 'SkyHub2', 'WorldEmpty']
    for row in check['maps']:
        assert row['sourceUnchanged'] and len(row['frames']) == 6
        for frame in row['frames']:
            assert frame['differing'] == frame['max'] == 0
            assert frame['referenceSha256'] == frame['residentSha256']
            assert frame['cache']['intermediateFrameReadbacks'] == 0
captures = [frame['surfacePixels'] for row in surface['maps'] for frame in row['frames'] if frame.get('surfacePixels')]
assert len(captures) == 12
assert all(frame['mismatchesOver2'] == 0 and frame['maxDifference'] <= 2 for frame in captures)
assert ui['fullEffectsOnly'] and ui['sourceHashesUnchanged'] and not ui['errors']
assert ui['transport']['surfaceFrames'] > 0 and ui['transport']['pixelBytes'] == 0
assert ui['interaction']['poseRequests'] > 0 and ui['interaction']['sceneReuploads'] == ui['interaction']['materialReuploads'] == 0
for row in ui['maps']:
    assert row['frames'] > 0 and row['cameraMoved']
    assert row['fullTransport']['gpuResident'] and row['fullTransport']['intermediateFrameReadbacks'] == 0
    assert row['sceneReuploads'] == row['materialReuploads'] == 0
log = (research / 'full-resident-project-tests-resume.log').read_text()
tests = int(re.search(r'^# tests (\d+)$', log, re.M)[1])
passed = int(re.search(r'^# pass (\d+)$', log, re.M)[1])
assert tests == passed and tests >= 472 and re.search(r'^# fail 0$', log, re.M)
assert not (research / 'full-resident-release-typecheck.log').read_text()
profiles = {}
for name in ['reference', 'resident']:
    profiles[name] = json.loads((research / f'full-preview-final-{name}.json').read_text())
    assert profiles[name]['passed']
assert profiles['resident']['readbackBytes'] == 320 * 180 * 4 * 2
assert profiles['reference']['readbackBytes'] > profiles['resident']['readbackBytes']
assert sha(research / 'full-preview-final-reference.png') == sha(research / 'full-preview-final-resident.png')
files = [root / 'dist' / name for name in ['main.cjs', 'preload.cjs', 'app.js', 'index.html', 'style.css', 'classes.json', 'native/sky-vulkan.exe']]
files += [p for p in (root / 'dist/vulkan-shaders').rglob('*') if p.is_file()]
original = pathlib.Path('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents')
original_sha = sha(original / 'MacOS/Sky')
assert original_sha == '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20'
report = {
    'passed': True, 'version': json.loads((root / 'package.json').read_text())['version'],
    'scope': 'Full-effects-only editor preview with recovered GLSL stages and GPU-resident attachments. CPU reference parity, XCB presentation and production Electron interaction on Linux software Vulkan; no original-game image equivalence, Windows runtime/FPS or first-load acceptance.',
    'projectTests': {'tests': tests, 'passed': passed, 'failed': 0}, 'typescriptPassed': True,
    'pixelReference': {'maps': 3, 'frames': 18, 'comparedBytes': sum(f['width'] * f['height'] * 4 for row in reference['maps'] for f in row['frames']), 'differences': 0},
    'oddResize': {'report': 'docs/full-preview-odd-size-check.json', 'frames': 6, 'width': 193, 'height': 109, 'differences': 0},
    'nativeWindow': {'maps': 3, 'frames': 18, 'captures': len(captures), 'maxDisplayDifference': max(f['maxDifference'] for f in captures), 'finalPixelPipeBytes': 0, 'frameStatusBytes': 32},
    'productionUI': {'report': 'docs/full-preview-ui-check.json', 'maps': ui['maps'], 'interaction': ui['interaction'], 'resizeAndDpi': ui['resizeAndDpi'], 'finalPixelPipeBytes': ui['transport']['pixelBytes']},
    'profiles': {name: {key: value for key, value in p.items() if key != 'viewport'} for name, p in profiles.items()},
    'profilePngSha256': sha(research / 'full-preview-final-resident.png'),
    'modelShadersWithoutSDK': {'levels': shader['levels'], 'requests': shader['requests'], 'programs': len(shader['modelPrograms'])},
    'buildPayloadSha256': {p.relative_to(root).as_posix(): sha(p) for p in files},
    'sourceSha256': {p.relative_to(root).as_posix(): sha(p) for folder in ['src', 'native'] for p in (root / folder).rglob('*') if p.is_file()},
    'originalExecutableSha256': original_sha, 'originalResourcesModified': False,
    'completeOriginalClasses': 0, 'completeOriginalObjects': 0, 'windowsHardwareFpsVerified': False,
    'remaining': ['Original GPU exposure feedback', 'Full water/fog-volume/bloom/motion-blur/lighting and shadow inputs', 'Model/Scene resource ownership, LOD/Visibility/RenderList lifecycle', 'First-load caching and Windows device performance'],
}
(root / 'docs/full-preview-verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({key: report[key] for key in ['passed', 'version', 'projectTests', 'pixelReference', 'nativeWindow']}, ensure_ascii=False))
