#!/usr/bin/env python3
"""Bind this continuation's native, resource, GPU and UI evidence to its build."""
import datetime,hashlib,json,pathlib,re
root=pathlib.Path(__file__).resolve().parent.parent
research=pathlib.Path('/root/sky-research')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def report(name):
 d=json.loads((root/'docs'/name).read_text());assert d['passed'],name;return d
def tests(name):
 text=(research/name).read_text();count=int(re.search(r'^# tests (\d+)$',text,re.M)[1]);passed=int(re.search(r'^# pass (\d+)$',text,re.M)[1]);assert count==passed and re.search(r'^# fail 0$',text,re.M);return count
native=report('object-effects-oracle.json');audit=report('objects-environment-items-audit.json');gpu=report('image-alias-gpu-check.json');ui=report('objects-environment-items-smoke.json')
assert native['comparedCases']==1216 and native['savedCandleTransforms']==1077 and not native['failures']
assert audit['summary']['maps']==33 and audit['summary']['sharedFlowerAndWaterSlots']==620
assert audit['modelTextureFix']['additionalAvailable']==76 and all(f['sourceUnchanged'] for f in audit['files'])
assert len(gpu['cases'])==4 and all(c['coveredPixels']>10 and c['sourceUnchanged'] for c in gpu['cases'])
assert len(ui['maps'])==4 and all(m['quality']=='full' and m['opaqueFraction']==1 and m['whiteFraction']<.95 and m['sourceUnchanged'] for m in ui['maps'])
assert len(ui['aliases'])==4 and all(a['ipcBytesMatch'] for a in ui['aliases']) and not ui['errors']
for case in gpu['cases']+ui['maps']:
 assert sha(root/case['screenshot'])==case['screenshotSha256'],case['screenshot']
full=tests('object-effects-project-tests.log');focused=tests('object-effects-final-focused.log');assert full>=486 and focused>=15
assert not (research/'object-effects-typecheck.log').read_text()
old=json.loads((research/'object-effects-before/viewport-display-verification.json').read_text());assert old['passed'] and old['version']=='0.3.7'
for name,digest in old['buildPayloadSha256'].items():
 if name.startswith('dist/native/') or name.startswith('dist/vulkan-shaders/'):assert sha(root/name)==digest,name
# Display controls, temporal settling and packed skirt input are unchanged.
for name in ['src/renderer/vulkan-viewport.ts','src/renderer/viewport-resolution.ts','src/renderer/baked-renderer.ts']:
 if name in old['sourceSha256']:assert sha(root/name)==old['sourceSha256'][name],name
files=[root/'dist'/n for n in ['main.cjs','preload.cjs','app.js','index.html','style.css','classes.json','native/sky-vulkan.exe']]
files+=sorted(p for p in (root/'dist/vulkan-shaders').rglob('*') if p.is_file())
verified={'passed':True,'version':json.loads((root/'package.json').read_text())['version'],'verifiedAtUTC':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'scope':'Original Objects effect factory kernels, shared FlowerPatch/Water native slots and Image source fix. Four current production GPU cases and four actual full canvas maps. Complete effect classes/drawing and Windows GT 1030 FPS remain pending.',
 'tests':{'fullProjectPassed':full,'finalFocusedPassed':focused,'failed':0,'typecheckPassed':True},
 'objectEffects':{'originalKernelCases':1216,'savedCandleTransforms':1077,'sharedMapSlots':620,'additionalModelTextureDependencies':76,'currentGpuCases':4,'currentUiMaps':4,'fullyRestoredClasses':0,'fullyRestoredObjects':0},
 'nativeAndShadersUnchangedFromVerified037':True,
 'buildPayloadSha256':{p.relative_to(root).as_posix():sha(p) for p in files},
 'sourceSha256':{p.relative_to(root).as_posix():sha(p) for folder in ['src','native'] for p in (root/folder).rglob('*') if p.is_file()},
 'evidenceSha256':{name:sha(root/name) for name in ['docs/object-effects-oracle.json','docs/object-effects-native.json','docs/objects-environment-items-audit.json','docs/image-alias-gpu-check.json','docs/objects-environment-items-smoke.json']+[case['screenshot'] for case in gpu['cases']+ui['maps']]},
 'windowsRuntimeTested':False,'windowsHardwareFpsVerified':False,'highFrameRateTargetAchieved':False}
(root/'docs/object-effects-verification.json').write_text(json.dumps(verified,ensure_ascii=False,indent=2)+'\n')
# Retain 0.3.7 display/skirt proof with explicit inheritance, while binding
# the current development payload and full canvas map checks. Do not claim re-running
# the old three-preset/skirt GPU suite or native Windows runtime here.
display={**old,**{k:verified[k] for k in ['version','verifiedAtUTC','tests','buildPayloadSha256','sourceSha256']},
 'scope':'Inherited unchanged display controls/skirt algorithms and native/shaders from verified 0.3.7; current full canvas map checks plus Image source and object allocation continuation.',
 'displayAndSkirtSuiteInheritedFromVerified037':True,'currentCanvasReport':'docs/objects-environment-items-smoke.json','currentContinuationReport':'docs/object-effects-verification.json'}
(root/'docs/viewport-display-verification.json').write_text(json.dumps(display,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:verified[k] for k in ['passed','version','tests','objectEffects']},ensure_ascii=False))
