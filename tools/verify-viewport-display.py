#!/usr/bin/env python3
"""Bind display/skirt checks to the current JS and unchanged native payload."""
import datetime, hashlib, json, pathlib, re

root = pathlib.Path(__file__).resolve().parent.parent
research = pathlib.Path('/root/sky-research')
def sha(p):
    with p.open('rb') as f:
        return hashlib.file_digest(f, 'sha256').hexdigest()
def report(name):
    d = json.loads((root/'docs'/name).read_text())
    assert d['passed'], name
    return d

skirt = report('skirt-render-check.json')
ui = report('viewport-display-smoke.json')
assert len(skirt['maps']) == 33 and sum(m['skirts'] for m in skirt['maps']) == 2533
assert all(m['sourceUnchanged'] for m in skirt['maps'])
assert skirt['attributeFetch']['storedByteCases'] == 256 and skirt['attributeFetch']['maxError'] < 1e-7
assert len(skirt['shaders']) == 6 and all(s['maxAlphaError'] < 1e-6 for s in skirt['shaders'])
assert [m['mode'] for m in ui['modes']] == ['smooth', 'balanced', 'native']
assert all(m['quality'] == 'full' and m['opaqueFraction'] == 1 and m['whiteFraction'] < .95 for m in ui['modes'])
assert ui['selectionPersisted'] and not ui['errors']
assert ui['staticAntialiasing']['additionalFrames'] >= 8 and ui['staticAntialiasing']['settlesAndStops']
assert ui['modes'][1]['scale'] >= 66 and ui['modes'][2]['scale'] == 100
text = (research/'display-project-tests.log').read_text()
tests = int(re.search(r'^# tests (\d+)$', text, re.M)[1])
assert tests == int(re.search(r'^# pass (\d+)$', text, re.M)[1])
assert re.search(r'^# fail 0$', text, re.M) and tests >= 482
focused_text = (research/'display-final-focused.log').read_text()
focused_tests = int(re.search(r'^# tests (\d+)$', focused_text, re.M)[1])
assert focused_tests == int(re.search(r'^# pass (\d+)$', focused_text, re.M)[1])
assert re.search(r'^# fail 0$', focused_text, re.M) and focused_tests >= 20
assert not (research/'display-typecheck.log').read_text()
previous = json.loads((research/'clarity-before/docs/gt1030-performance-verification.json').read_text())
for name, expected in previous['buildPayloadSha256'].items():
    if name.startswith('dist/native/') or name.startswith('dist/vulkan-shaders/'):
        assert sha(root/name) == expected, name
files = [root/'dist'/n for n in ['main.cjs','preload.cjs','app.js','index.html','style.css','classes.json','native/sky-vulkan.exe']]
files += sorted(p for p in (root/'dist/vulkan-shaders').rglob('*') if p.is_file())
verified = {
    'passed': True, 'version': json.loads((root/'package.json').read_text())['version'],
    'verifiedAtUTC': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'scope': 'Three display presets and original skirt packed format; current JS/UI checks and inherited unchanged native/shader payload. Windows GT 1030 FPS not verified.',
    'tests': {'fullProjectPassed': tests, 'finalFocusedPassed': focused_tests, 'failed': 0, 'typecheckPassed': True},
    'skirt': {'maps': 33, 'records': 2533, 'vertices': sum(m['vertices'] for m in skirt['maps']), 'shaderPairs': 6, 'byteCases': 256, 'originalFilesUnchanged': True},
    'display': {'defaultDesktopMode': 'balanced', 'balancedScale': [.67,1], 'nativeScale': 1, 'nativeAdaptive': False, 'selectionPersisted': True, 'staticAntialiasing': ui['staticAntialiasing'], 'uiReport': 'docs/viewport-display-smoke.json'},
    'buildPayloadSha256': {p.relative_to(root).as_posix(): sha(p) for p in files},
    'sourceSha256': {p.relative_to(root).as_posix(): sha(p) for folder in ['src','native'] for p in (root/folder).rglob('*') if p.is_file()},
    'nativeAndShadersUnchangedFromVerified036': True,
    'requestedFps': 'at least 60–70 in all three presets', 'windowsRuntimeTested': False, 'windowsHardwareFpsVerified': False, 'highFrameRateTargetAchieved': False,
}
(root/'docs/viewport-display-verification.json').write_text(json.dumps(verified, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({k: verified[k] for k in ['passed','version','tests','skirt','highFrameRateTargetAchieved']}, ensure_ascii=False))
