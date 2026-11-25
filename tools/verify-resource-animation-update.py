"""Audit shared animation evidence and advance the continuation ledger."""
import datetime, gzip, hashlib, json, pathlib, re, struct, sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
logs = pathlib.Path('/root/sky-research')
def read(file): return json.loads((root/file).read_text())
def sha(file): return hashlib.sha256((root/file).read_bytes()).hexdigest()
def regression(name, command):
    text = (logs/name).read_text()
    def count(key):
        rows = re.findall(r'^# '+key+r' (\d+)$', text, re.M)
        assert len(rows) == 1
        return int(rows[0])
    total = count('tests')
    assert total == count('pass') and count('fail') == count('cancelled') == count('skipped') == 0
    return {'passed': True, 'tests': total, 'command': command, 'log': str(logs/name)}

n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
old = read('docs/creature-continuation-verification.json')
phase_file = 'docs/resource-animation-update-verification.json'
same_phase = old.get('latestPhaseReport') == phase_file
baseline = old['baselineRegression'] if same_phase else old['projectRegression']
native = read('docs/resource-animation-update-native.json')
reports = ['docs/resource-animation-update-oracle.json', 'docs/fish-group-animation-update-oracle.json']
oracles = [read(f) for f in reports]
for report in [old, native, *oracles]: assert report['executableSha256'] == n.digest
for report in oracles:
    assert report['passed'] and not report['failures']
    assert report['wholeAnimationUpdateVerified'] and report['wholeTransformWorldCacheVerified']
    assert report['completeCreatureClasses'] == 0
assert oracles[0]['resources'] == 99 and oracles[0]['comparedCases'] == 3564 and oracles[0]['comparedFrames'] == 16632
assert oracles[1]['comparedCases'] == 5 and oracles[1]['comparedFrames'] == 300
for function in native['functions'].values():
    start, end, code_end = (int(function[k], 16) for k in ['start', 'end', 'codeEnd'])
    assert n.bounds(start) == (start, end)
    assert hashlib.sha256(n.read(start, end-start)).hexdigest() == function['codeSha256']
    explicit_end = code_end if code_end != end else None
    assert len(n.instructions(start, explicit_end)) == function['instructions']
    assert (root/function['assembly']).read_text() == n.annotated(start, explicit_end)
for fixture_file, count in [('resource-animation-update-native', 3564), ('fish-group-animation-update-native', 5)]:
    fixture = json.loads(gzip.decompress((root/f'tests/fixtures/{fixture_file}.json.gz').read_bytes()))
    assert fixture['executableSha256'] == n.digest and len(fixture['cases']) == count
inputs = read('tests/fixtures/fish-group-animation-update-inputs.json')
assert inputs['passed'] and len(inputs['groups']) == 5 and inputs['executableSha256'] == n.digest
assert json.loads((logs/'animation-update-real-inputs-check.log').read_text())['passed']
for group in inputs['groups']:
    source = pathlib.Path('/root/sky-research/original-runtime-corpus/Levels')/group['level']/'Objects.level.bin'
    assert hashlib.sha256(source.read_bytes()).hexdigest() == group['sourceSha256']
    assert len(group['requests']) in [3, 5]
    for request in group['requests']:
        raw = bytes.fromhex(request['bytesHex'])
        assert len(raw) == 0x70 and raw[0x68:] == bytes(8)
        assert len(bytes.fromhex(request['maskHex'])) == 3
focused = regression('animation-update-focused-tests.log', './node_modules/.bin/tsx --test tests/resource-animation-update.test.ts tests/resource-animation-matrices.test.ts tests/resource-animation-secondary.test.ts tests/resource-animation-clock.test.ts tests/fish-group-scene-events.test.ts')
project = regression('animation-update-project-tests.log', './node_modules/.bin/tsx --test tests/*.test.ts')
assert focused['tests'] == 8 and project['tests'] == 701
assert (logs/'animation-update-final-types.log').read_text() == ''
assert (logs/'animation-update-windows-build.log').read_text().rstrip().endswith('Built dist/')
binary = (root/'dist/native/sky-vulkan.exe').read_bytes()
pe = struct.unpack_from('<I', binary, 0x3c)[0]
assert binary[pe:pe+4] == b'PE\0\0' and struct.unpack_from('<H', binary, pe+4)[0] == 0x8664
inventory = read('docs/Objects.level.bin类进度.json')
assert inventory['summary']['coreSubchainVerifiedClasses'] == 55
assert inventory['summary']['completeRuntimeClasses'] == inventory['summary']['brokenReferences'] == 0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
census = read('docs/生物物品环境类扫描.json')
assert census['summary']['nativeCreatureFamilyTypes'] == 52
assert census['sharedAnimationDependencyVerification']['frames'] == 16932

artifacts = [
    'src/core/resource-animation-update.ts', 'src/core/resource-animation-secondary.ts',
    'src/core/resource-animation-clock.ts', 'src/core/resource-animation-matrices.ts',
    'src/core/transform-node-runtime.ts', 'tools/resource-animation-update-cases.ts',
    'tools/resource-animation-update-oracle.ts', 'tools/native-resource-animation-update-oracle.c',
    'tools/reverse-resource-animation-update.py', 'tools/verify-resource-animation-update.py',
    'tools/fish-group-scene-cases.ts', 'tools/capture-fish-group-animation-update.ts',
    'tools/reverse-resource-animation.py', 'tools/objects-category-census.py',
    'tools/objects-class-progress-spec.json', 'tests/resource-animation-update.test.ts',
    'tests/fixtures/resource-animation-update-native.json.gz', 'tests/fixtures/fish-group-animation-update-native.json.gz',
    'tests/fixtures/fish-group-animation-update-inputs.json', 'docs/resource-animation-update-native.json',
    *reports, 'docs/resource-animation-native.json', 'docs/生物共用动画整链续接.md', 'docs/生物骨骼动画续接.md', 'docs/交付状态.json',
    *[f['assembly'] for f in native['functions'].values()],
]
remaining = [
    'CharFishGroupAnim whole MoveObjectAlongRail.Update 0x100484a90..0x100486690, dynamic Rail/cache ownership, real Model resource lifecycle and shared EventBarn motion/viewport; shared Animation.Update and captured actual request/pose transitions are now verified',
    'DarkCreature outer Update remainder 0x10026e7da..0x10026ffc0 and real eye/light/audio/world/resource owners',
    'Crab whole outer Update 0x10025bc10..0x10025e590 and ground/world/interaction/Model/resource owners',
    'BirdFlock whole child Update 0x10019bdc0..0x10019dbf0, Buddy, CritterV2/SimpleBird/WhaleFairy and remaining constructors/managers/messages/authority paths',
    'FishV2 and BirdV2 real world/collision/Avatar/OBB/rail/resource/Model/animation/audio/particle and Barn ownership',
    'All 52 reviewed biological family types, repeated load/unload, stopping, level switching, full scene behavior and Windows acceptance',
]
now = datetime.datetime.now(datetime.timezone.utc).isoformat()
report = {
    'passed': True, 'updatedUtc': now, 'executableSha256': n.digest,
    'nativeReports': reports,
    'newNativeCases': sum(r['comparedCases'] for r in oracles),
    'newNativeFrames': sum(r['comparedFrames'] for r in oracles),
    'newNativeComparedBytes': sum(r['comparedBytes'] for r in oracles),
    'newNativeServiceCalls': sum(r['serviceCalls'] for r in oracles),
    'nativeScope': [r['scope'] for r in oracles],
    'nativeCodeHashesBoundariesAndAssemblyVerified': True,
    'wholeSharedAnimationUpdateVerified': True, 'wholeTransformWorldCacheVerified': True,
    'actualFishAnimationConfigurations': 5, 'actualFishRequestPoseTransitionsVerified': True,
    'zeroDelayNegativeZeroFadeCorrectionVerified': True, 'actualInputsCaptureReproduced': True,
    'baselineRegression': baseline, 'focusedRegression': focused, 'projectRegression': project,
    'typecheck': {'passed': True, 'command': './node_modules/.bin/tsc --noEmit', 'log': str(logs/'animation-update-final-types.log')},
    'windowsBuild': {'passed': True, 'command': 'node tools/build.mjs --windows', 'log': str(logs/'animation-update-windows-build.log'), 'machine': 'AMD64', 'binarySha256': hashlib.sha256(binary).hexdigest(), 'windowsMachineRuntimeTested': False},
    'inventory': {**old['inventory'], 'log': str(logs/'animation-update-class-progress.log')},
    'categoryCensus': {**old['categoryCensus'], 'log': str(logs/'animation-update-category-census.log')},
    'windowsSourcePlan': {**old['windowsSourcePlan'], 'log': str(logs/'animation-update-windows-source-plan.log')},
    'completeCreatureClasses': 0, 'autonomousViewportCreatureAcceptancePassed': False,
    'newWindowsArchiveCreated': False, 'newSourceArchiveCreated': False, 'androidWorkPerformed': False,
    'packagingReadiness': 'Shared Animation.Update and actual fish request/pose transitions pass; Windows AMD64 build passes. All-creature completion condition remains unmet: motion/interaction/resource/scene owners and remaining families are unfinished. No completion archive created.',
    'remaining': remaining, 'artifactSha256': {f: sha(f) for f in artifacts},
}
(root/phase_file).write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
all_reports = list(dict.fromkeys(old['nativeReports'] + reports))
assert all(read(f)['passed'] and read(f)['executableSha256'] == n.digest for f in all_reports)
prior = old['priorMoveObjectAlongRailPhase'] if same_phase else {key: old[key] for key in ['updatedUtc', 'newNativeReports', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild']}
all_artifacts = list(dict.fromkeys([*old['artifactSha256'], *artifacts, phase_file]))
updated = {**old, **{key: report[key] for key in ['updatedUtc', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'nativeScope', 'baselineRegression', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild', 'inventory', 'categoryCensus', 'windowsSourcePlan', 'remaining', 'packagingReadiness']},
    'priorMoveObjectAlongRailPhase': prior, 'nativeReports': all_reports, 'newNativeReports': reports,
    'newNativeFrames': report['newNativeFrames'], 'latestPhaseReport': phase_file,
    'wholeSharedAnimationUpdateVerified': True, 'wholeTransformWorldCacheVerified': True,
    'fishGroupAnimationRequestPoseTransitionsVerified': True,
    'fishGroupWholeMotionUpdateVerified': False, 'fishGroupCompleteSceneBehaviorVerified': False,
    'nativeCasesExecutedThisPhaseIncludingSequenceRegression': report['newNativeCases'],
    'artifactSha256': {f: sha(f) for f in all_artifacts},
}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({'passed': True, 'nativeCases': report['newNativeCases'], 'nativeFrames': report['newNativeFrames'], 'comparedBytes': report['newNativeComparedBytes'], 'projectTests': project['tests'], 'focusedTests': focused['tests'], 'artifactHashes': len(all_artifacts), 'completeCreatureClasses': 0, 'newArchive': False}))
