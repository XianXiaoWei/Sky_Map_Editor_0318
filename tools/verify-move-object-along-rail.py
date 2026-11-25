"""Audit this phase and refresh the cumulative continuation ledger."""
import collections, datetime, gzip, hashlib, json, pathlib, re, struct, sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
logs = pathlib.Path('/root/sky-research')
def read(file): return json.loads((root/file).read_text())
def sha(file): return hashlib.sha256((root/file).read_bytes()).hexdigest()
def test_log(name, command):
    text = (logs/name).read_text()
    def count(key):
        rows = re.findall(r'^# '+key+r' (\d+)$', text, re.M); assert len(rows) == 1; return int(rows[0])
    total = count('tests'); assert total == count('pass') and count('fail') == count('cancelled') == count('skipped') == 0
    return {'passed': True, 'tests': total, 'command': command, 'log': str(logs/name)}
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
old = read('docs/creature-continuation-verification.json')
same_phase = old.get('latestPhaseReport') == 'docs/move-object-along-rail-verification.json'
baseline = old['baselineRegression'] if same_phase else old['projectRegression']
evidence = read('docs/move-object-along-rail-native.json'); oracle = read('docs/move-object-along-rail-oracle.json')
defaults = read('docs/move-object-along-rail-defaults.json')
inputs = read('tests/fixtures/fish-group-rail-lifecycle-inputs.json')
for record in [old, evidence, oracle, defaults]: assert record['executableSha256'] == n.digest
assert oracle['passed'] and oracle['comparedCases'] == 193 and not oracle['failures']
assert evidence['storageBytes'] == 248 and sum(f['wholeFunctionRestored'] for f in evidence['functions'].values()) == 5
assert not evidence['functions']['Update.reference']['wholeFunctionRestored']
for f in evidence['functions'].values():
    start, end = int(f['start'], 16), int(f['end'], 16); assert n.bounds(start) == (start, end)
    assert hashlib.sha256(n.read(start, end-start)).hexdigest() == f['codeSha256']
    assert (root/f['assembly']).read_text() == n.annotated(start)
    assert len(n.instructions(start)) == f['instructions']
for c in evidence['constants'].values(): assert int.from_bytes(n.read(int(c['address'],16), 4), 'little') == c['bits']
fixture = json.loads(gzip.decompress((root/'tests/fixtures/move-object-along-rail-native.json.gz').read_bytes()))
modes = collections.Counter(r['input']['mode'] for r in fixture['cases'])
assert fixture['executableSha256'] == n.digest and len(fixture['cases']) == 193
assert oracle['caseBreakdown'] == {str(k): v for k, v in modes.items()}
assert inputs['passed'] and len(inputs['groups']) == len(inputs['cases']) == modes[6] == 5
assert json.loads((logs/'move-rail-real-inputs-check.log').read_text())['passed']
for group in inputs['groups']:
    source = pathlib.Path('/root/sky-research/original-runtime-corpus/Levels')/group['level']/'Objects.level.bin'
    assert hashlib.sha256(source.read_bytes()).hexdigest() == group['sourceSha256']
    assert group['originalSourceUnchanged'] and not group['runtimeUpdateAvailable'] and len(group['markerIds']) == 6
objects_default = defaults['classes']['MoveObjectAlongRail']['objects']
assert objects_default['text'] == 'nullptr' and objects_default['encodedHex'] is None and not objects_default['defaultConversionResolved']
focused = test_log('move-rail-focused-tests.log', './node_modules/.bin/tsx --test tests/move-object-along-rail-runtime.test.ts tests/fish-group-scene-events.test.ts tests/on-region-runtime.test.ts')
project = test_log('move-rail-project-tests.log', './node_modules/.bin/tsx --test tests/*.test.ts')
assert (logs/'move-rail-final-types.log').read_text() == ''
assert (logs/'move-rail-windows-build.log').read_text().rstrip().endswith('Built dist/')
code = (root/'dist/native/sky-vulkan.exe').read_bytes(); pe = struct.unpack_from('<I',code,0x3c)[0]
assert code[pe:pe+4] == b'PE\0\0' and struct.unpack_from('<H',code,pe+4)[0] == 0x8664
inventory = read('docs/Objects.level.bin类进度.json')
assert inventory['summary']['coreSubchainVerifiedClasses'] == 55
assert inventory['summary']['completeRuntimeClasses'] == inventory['summary']['brokenReferences'] == 0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
move_class = next(c for c in inventory['classes'] if c['name'] == 'MoveObjectAlongRail')
assert move_class['coreSubchainVerified'] and not move_class['completeClassRuntimeVerified']
required = ['src/core/move-object-along-rail-runtime.ts', 'src/core/scene-event-construction.ts', 'src/core/environment-object-state.ts', 'src/core/environment-event-owner.ts', 'tools/native-move-object-along-rail-oracle.c', 'tools/move-object-along-rail-cases.ts', 'tools/move-object-along-rail-oracle.ts', 'tools/reverse-move-object-along-rail.py', 'tools/reverse-environment-defaults.py', 'tools/capture-fish-group-rail-lifecycle.ts', 'tools/verify-move-object-along-rail.py', 'tests/move-object-along-rail-runtime.test.ts', 'tests/fixtures/move-object-along-rail-native.json.gz', 'tests/fixtures/fish-group-rail-lifecycle-inputs.json', 'docs/move-object-along-rail-native.json', 'docs/move-object-along-rail-oracle.json', 'docs/move-object-along-rail-defaults.json', 'docs/鱼群轨道生命周期续接.md', 'tools/objects-class-progress-spec.json']
artifacts = required + [f['assembly'] for f in evidence['functions'].values()]
remaining = ['CharFishGroupAnim whole MoveObjectAlongRail.Update 0x100484a90..0x100486690; dynamic Rail ownership/cache invalidation; real Model resource lifecycle, animation update and pose mixing, shared EventBarn motion and viewport', 'DarkCreature outer Update remainder 0x10026e7da..0x10026ffc0 and real world/resource owners', 'Crab whole outer Update 0x10025bc10 and ground/world/interaction/resource owners', 'FishV2 real world/collision/Avatar/OBB/rail/resource/Model/animation/audio/particle and Barn lifecycle', 'Full creature scene behavior, repeated load/unload, stopping, level switching and Windows hardware acceptance']
now = datetime.datetime.now(datetime.timezone.utc).isoformat()
report = {'passed': True, 'updatedUtc': now, 'executableSha256': n.digest, 'nativeReports': ['docs/move-object-along-rail-oracle.json'], 'newNativeCases': oracle['comparedCases'], 'newNativeComparedBytes': oracle['comparedBytes'], 'newNativeServiceCalls': oracle['serviceCalls'], 'nativeScope': oracle['scope'], 'nativeCodeHashesBoundariesAssemblyAndConstantsVerified': True, 'wholeLifecycleFunctions': 5, 'actualFishLifecycleConfigurations': 5, 'actualFishLifecycleQueryNativeCombinationCompared': True, 'actualFishWholeUpdateVerified': False, 'actualInputsCaptureReproduced': True, 'projectRegression': project, 'focusedRegression': focused, 'baselineRegression': baseline, 'typecheck': {'passed': True, 'command': './node_modules/.bin/tsc --noEmit', 'log': str(logs/'move-rail-final-types.log')}, 'windowsBuild': {'passed': True, 'command': 'node tools/build.mjs --windows', 'log': str(logs/'move-rail-windows-build.log'), 'machine': 'AMD64', 'binarySha256': hashlib.sha256(code).hexdigest(), 'windowsMachineRuntimeTested': False}, 'inventory': {**old['inventory'], 'coreSubchainVerifiedClasses': 55, 'log': str(logs/'move-rail-class-progress.log')}, 'categoryCensus': {**old['categoryCensus'], 'log': str(logs/'move-rail-category-census.log')}, 'windowsSourcePlan': {**old['windowsSourcePlan'], 'log': str(logs/'move-rail-windows-source-plan.log')}, 'completeCreatureClasses': 0, 'autonomousViewportCreatureAcceptancePassed': False, 'newWindowsArchiveCreated': False, 'newSourceArchiveCreated': False, 'androidWorkPerformed': False, 'packagingReadiness': 'Windows build passes. Five fish lifecycle/query configurations are independently compared; their whole Update, Model/pose/rendering and Windows scene acceptance remain pending. No new archive or packaging date.', 'remaining': remaining, 'artifactSha256': {f: sha(f) for f in artifacts}}
(root/'docs/move-object-along-rail-verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
reports = list(dict.fromkeys(old['nativeReports'] + report['nativeReports']))
assert all(read(f)['passed'] and read(f)['executableSha256'] == n.digest for f in reports)
all_artifacts = list(dict.fromkeys(list(old['artifactSha256']) + artifacts + ['docs/move-object-along-rail-verification.json']))
previous = old['priorFishGroupEventsPhase'] if same_phase else {key: old[key] for key in ['updatedUtc', 'newNativeReports', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild']}
updated = {**old, **{key: report[key] for key in ['updatedUtc', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'nativeScope', 'baselineRegression', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild', 'inventory', 'categoryCensus', 'windowsSourcePlan', 'remaining', 'packagingReadiness']}, 'priorFishGroupEventsPhase': previous, 'nativeReports': reports, 'newNativeReports': report['nativeReports'], 'nativeCasesExecutedThisPhaseIncludingSequenceRegression': 193, 'latestPhaseReport': 'docs/move-object-along-rail-verification.json', 'fishGroupRailLifecycleAndQueriesVerified': True, 'fishGroupWholeMotionUpdateVerified': False, 'fishGroupCompleteSceneBehaviorVerified': False, 'artifactSha256': {f: sha(f) for f in all_artifacts}}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({'passed': True, 'nativeCases':193, 'actualFishLifecycleConfigurations':5, 'projectTests':project['tests'], 'focusedTests':focused['tests'], 'coreClasses':55, 'completeCreatureClasses':0, 'newArchive':False}))
