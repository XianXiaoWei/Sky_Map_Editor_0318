"""Bind partial eye/projection, rail control and whole SafeSlerp evidence."""
import datetime, gzip, hashlib, json, pathlib, re, struct, sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
logs = pathlib.Path('/root/sky-research')
def read(file): return json.loads((root/file).read_text())
def sha(file): return hashlib.sha256((root/file).read_bytes()).hexdigest()
def regression(file, command):
    text = (logs/file).read_text()
    counts = {}
    for key in ['tests', 'pass', 'fail', 'cancelled', 'skipped']:
        values = re.findall(r'^# '+key+r' (\d+)$', text, re.M)
        assert len(values) == 1, key
        counts[key] = int(values[0])
    assert counts['tests'] == counts['pass'] and not any(counts[k] for k in ['fail', 'cancelled', 'skipped'])
    return {'passed': True, 'tests': counts['tests'], 'command': command, 'log': str(logs/file)}
n = Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
old = read('docs/creature-continuation-verification.json')
phase_file = 'docs/creature-visual-verification.json'
same_phase = old.get('latestPhaseReport') == phase_file
reports = ['docs/dark-creature-spotlight-oracle.json', 'docs/move-object-along-rail-control-oracle.json', 'docs/vector-safe-slerp-oracle.json']
oracles = [read(f) for f in reports]
assert all(r['passed'] and not r['failures'] and r['executableSha256'] == n.digest for r in oracles)
assert [r['comparedCases'] for r in oracles] == [504, 338, 920]
assert oracles[0]['wholeEyeAndProjectionPhaseVerified'] and not oracles[0]['wholeDarkCreatureUpdateVerified']
assert not oracles[1]['wholeMoveUpdateVerified']
native = read('docs/dark-creature-spotlight-native.json')
start, end = int(native['start'], 16), int(native['end'], 16)
assert n.bounds(start) == (0x10026ddb0, 0x10026ffc0) and end == 0x10026f41e
assert hashlib.sha256(n.read(start, end-start)).hexdigest() == native['codeSha256']
assert (root/'evidence/dark-creature-update-reference.asm').read_text() == n.annotated(start)
assert (root/'evidence/vector-safe-slerp.asm').read_text() == n.annotated(0x100111b90)
assert n.bounds(0x100111b90) == (0x100111b90, 0x100111f30)
assert (root/'evidence/move-object-along-rail-update-reference.asm').read_text() == n.annotated(0x100484a90)
for file, count in [('dark-creature-spotlight-native', 504), ('move-object-along-rail-control-native', 338), ('vector-safe-slerp-native', 920)]:
    fixture = json.loads(gzip.decompress((root/f'tests/fixtures/{file}.json.gz').read_bytes()))
    assert fixture['executableSha256'] == n.digest and len(fixture['cases']) == count
focused = regression('creature-visual-focused-tests.log', './node_modules/.bin/tsx --test tests/dark-creature-spotlight-runtime.test.ts tests/vector-safe-slerp-runtime.test.ts tests/move-object-along-rail-control.test.ts tests/dark-creature-motion-runtime.test.ts tests/dark-creature-combat-runtime.test.ts tests/move-object-along-rail-runtime.test.ts')
project = regression('creature-visual-project-tests.log', './node_modules/.bin/tsx --test tests/*.test.ts')
assert focused['tests'] == 13 and project['tests'] == 704
assert not (logs/'creature-visual-final-types.log').read_text()
assert (logs/'creature-visual-windows-build.log').read_text().rstrip().endswith('Built dist/')
binary = (root/'dist/native/sky-vulkan.exe').read_bytes()
pe = struct.unpack_from('<I', binary, 0x3c)[0]
assert binary[pe:pe+4] == b'PE\0\0' and struct.unpack_from('<H', binary, pe+4)[0] == 0x8664
inventory = read('docs/Objects.level.bin类进度.json')
assert inventory['summary']['coreSubchainVerifiedClasses'] == 55
assert inventory['summary']['completeRuntimeClasses'] == inventory['summary']['brokenReferences'] == 0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
census = read('docs/生物物品环境类扫描.json')
assert census['summary']['nativeCreatureFamilyTypes'] == 52
assert census['eyeProjectionAndRailControlVerification']['cases'] == 1762
plan = read('docs/windows-source-plan.json')
assert not any(plan[k] for k in ['includesAndroidHost', 'buildOutputsIncluded', 'nodeModulesIncluded', 'cacheIncluded'])
artifacts = [
    'src/core/dark-creature-look-runtime.ts', 'src/core/dark-creature-spotlight-runtime.ts', 'src/core/dark-creature-visual-runtime.ts',
    'src/core/move-object-along-rail-update-runtime.ts', 'src/core/vector-safe-slerp-runtime.ts',
    'tools/dark-creature-spotlight-cases.ts', 'tools/dark-creature-spotlight-oracle.ts', 'tools/native-dark-creature-spotlight-oracle.c',
    'tools/reverse-dark-creature-spotlight.py', 'tools/verify-creature-visual.py',
    'tools/move-object-along-rail-control-cases.ts', 'tools/move-object-along-rail-control-oracle.ts', 'tools/native-move-object-along-rail-control-oracle.c',
    'tools/native-move-object-along-rail-oracle.c', 'tools/vector-safe-slerp-cases.ts', 'tools/vector-safe-slerp-oracle.ts', 'tools/native-vector-safe-slerp-oracle.c',
    'tests/dark-creature-spotlight-runtime.test.ts', 'tests/move-object-along-rail-control.test.ts', 'tests/vector-safe-slerp-runtime.test.ts',
    'tests/fixtures/dark-creature-spotlight-native.json.gz', 'tests/fixtures/move-object-along-rail-control-native.json.gz', 'tests/fixtures/vector-safe-slerp-native.json.gz',
    'docs/dark-creature-spotlight-native.json', *reports, 'docs/冥龙探照光圈与鱼群轨道控制续接.md',
    'tools/objects-class-progress-spec.json', 'tools/objects-category-census.py', 'docs/交付状态.json',
    'evidence/dark-creature-update-reference.asm', 'evidence/vector-safe-slerp.asm', 'evidence/move-object-along-rail-update-reference.asm',
]
remaining = [
    'DarkCreature 0x10026f41e..0x10026ffc0 interaction/audio remainder and full Update composition; eye/look/projection/radius/color/marker phase is now verified, real world/Model/rendering owners remain pending',
    'CharFishGroupAnim MoveObjectAlongRail.Update object loop from 0x100484fc0, dynamic Rail/cache ownership, real Model lifecycle and autonomous viewport; control prefix and whole SafeSlerp are now verified',
    *old['remaining'][2:],
]
now = datetime.datetime.now(datetime.timezone.utc).isoformat()
report = {
    'passed': True, 'updatedUtc': now, 'executableSha256': n.digest, 'nativeReports': reports,
    'newNativeCases': sum(r['comparedCases'] for r in oracles), 'newNativeComparedBytes': sum(r['comparedBytes'] for r in oracles),
    'newNativeServiceCalls': sum(r.get('serviceCalls', r.get('mathCalls', 0)) for r in oracles),
    'nativeScope': [r['scope'] for r in oracles], 'nativeCodeHashesBoundariesAndAssemblyVerified': True,
    'wholeDarkCreatureEyeProjectionPhaseVerified': True, 'wholeDarkCreatureOuterUpdateVerified': False,
    'fishGroupRailControlPrefixVerified': True, 'fishGroupWholeMotionUpdateVerified': False, 'wholeSafeSlerpVerified': True,
    'baselineRegression': old['baselineRegression'] if same_phase else old['projectRegression'], 'focusedRegression': focused, 'projectRegression': project,
    'typecheck': {'passed': True, 'command': './node_modules/.bin/tsc --noEmit', 'log': str(logs/'creature-visual-final-types.log')},
    'windowsBuild': {'passed': True, 'command': 'node tools/build.mjs --windows', 'log': str(logs/'creature-visual-windows-build.log'), 'machine': 'AMD64', 'binarySha256': hashlib.sha256(binary).hexdigest(), 'windowsMachineRuntimeTested': False},
    'inventory': {**old['inventory'], 'log': str(logs/'creature-visual-class-progress.log')},
    'categoryCensus': {**old['categoryCensus'], 'log': str(logs/'creature-visual-category-census.log')},
    'windowsSourcePlan': {**old['windowsSourcePlan'], 'log': str(logs/'creature-visual-windows-source-plan.log')},
    'completeCreatureClasses': 0, 'autonomousViewportCreatureAcceptancePassed': False,
    'newWindowsArchiveCreated': False, 'newSourceArchiveCreated': False, 'androidWorkPerformed': False,
    'remaining': remaining, 'packagingReadiness': '704 tests/typecheck/Windows AMD64 build pass. Eye and spotlight calculations are verified; real scene/resource/renderer ownership and remaining creature updates/families are incomplete. User requires all creatures completed before packaging; no completion archive created.',
    'artifactSha256': {f: sha(f) for f in artifacts},
}
(root/phase_file).write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
all_reports = list(dict.fromkeys([*old['nativeReports'], *reports]))
assert all(read(f)['passed'] and read(f)['executableSha256'] == n.digest for f in all_reports)
prior = old['priorSharedAnimationUpdatePhase'] if same_phase else {k: old[k] for k in ['updatedUtc', 'newNativeReports', 'newNativeCases', 'newNativeFrames', 'newNativeComparedBytes', 'newNativeServiceCalls', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild']}
all_artifacts = list(dict.fromkeys([*old['artifactSha256'], *artifacts, phase_file]))
updated = {**old, **{k: report[k] for k in ['updatedUtc', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'nativeScope', 'baselineRegression', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild', 'inventory', 'categoryCensus', 'windowsSourcePlan', 'remaining', 'packagingReadiness']},
    'nativeReports': all_reports, 'newNativeReports': reports, 'latestPhaseReport': phase_file, 'priorSharedAnimationUpdatePhase': prior,
    'wholeDarkCreatureEyeProjectionPhaseVerified': True, 'wholeDarkCreatureOuterUpdateVerified': False,
    'fishGroupRailControlPrefixVerified': True, 'fishGroupWholeMotionUpdateVerified': False, 'wholeSafeSlerpVerified': True,
    'nativeCasesExecutedThisPhaseIncludingSequenceRegression': report['newNativeCases'], 'newNativeFrames': 0,
    'artifactSha256': {f: sha(f) for f in all_artifacts},
}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({'passed': True, 'nativeCases': report['newNativeCases'], 'comparedBytes': report['newNativeComparedBytes'], 'serviceAndMathCalls': report['newNativeServiceCalls'], 'projectTests': project['tests'], 'focusedTests': focused['tests'], 'artifactHashes': len(all_artifacts), 'completeCreatureClasses': 0, 'newArchive': False}))
