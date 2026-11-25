"""Verify phase evidence and refresh the creature continuation ledger."""
import collections, datetime, gzip, hashlib, json, pathlib, re, struct, sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
logs = pathlib.Path('/root/sky-research')
def read(file): return json.loads((root/file).read_text())
def sha(file): return hashlib.sha256((root/file).read_bytes()).hexdigest()
def tests(file, command):
    text = (logs/file).read_text()
    def count(key):
        rows = re.findall(r'^# '+key+r' (\d+)$', text, re.M); assert len(rows) == 1; return int(rows[0])
    total = count('tests'); assert total == count('pass') and count('fail') == count('cancelled') == count('skipped') == 0
    return {'passed': True, 'tests': total, 'command': command, 'log': str(logs/file)}
project = tests('fish-group-project-tests.log', './node_modules/.bin/tsx --test tests/*.test.ts')
focused = tests('fish-group-focused-tests.log', './node_modules/.bin/tsx --test tests/on-region-runtime.test.ts tests/animation-sequence-registry.test.ts tests/fish-group-scene-events.test.ts tests/resource-animation-sequence.test.ts')
assert (logs/'fish-group-final-types.log').read_text() == ''
assert (logs/'fish-group-windows-build.log').read_text().rstrip().endswith('Built dist/')
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
old = read('docs/creature-continuation-verification.json'); evidence = read('docs/on-region-native.json'); region = read('docs/on-region-oracle.json'); sequences = read('docs/resource-animation-sequence-oracle.json'); scene = read('docs/fish-group-scene-events.json'); snapshot = read('src/core/original-animation-sequence-registry.json')
assert region['passed'] and region['comparedCases'] == 373 and not region['failures']
assert sequences['passed'] and sequences['originalRegistryCases'] == 32 and not sequences['failures']
assert scene['passed'] and scene['groups'] == 5 and scene['completeCreatureClasses'] == scene['newArchives'] == 0
for record in [old, evidence, region, sequences, snapshot]: assert record['executableSha256'] == n.digest
for f in evidence['functions'].values():
    start, end = int(f['start'], 16), int(f['end'], 16); assert n.bounds(start) == (start, end)
    assert hashlib.sha256(n.read(start, end-start)).hexdigest() == f['codeSha256']
    assert (root/f['assembly']).read_text() == n.annotated(start)
    assert len(n.instructions(start)) == f['instructions']
initializer = snapshot['initializer']; start, end = int(initializer['start'], 16), int(initializer['end'], 16)
assert n.bounds(start) == (start, end) and hashlib.sha256(n.read(start, end-start)).hexdigest() == initializer['codeSha256']
assert initializer['wholeNativeInitializerExecuted'] and snapshot['nativeOutputSha256'] == hashlib.sha256((logs/'animation-sequence-registry-native.bin').read_bytes()).hexdigest()
assert (logs/'fish-group-registry-check.log').read_text().startswith('{')
assert len(snapshot['records']) == 1201 and sum(len(r['steps']) for r in snapshot['records']) == 1966
fixture = json.loads(gzip.decompress((root/'tests/fixtures/on-region-native.json.gz').read_bytes())); modes = collections.Counter(r['input']['mode'] for r in fixture['cases'])
assert len(fixture['cases']) == 373 and region['caseBreakdown'] == {str(k): v for k, v in modes.items()}
sequence_fixture = json.loads(gzip.decompress((root/'tests/fixtures/resource-animation-sequence-native.json.gz').read_bytes()))
assert len(sequence_fixture['cases']) == sequences['comparedCases'] == 5130
code = (root/'dist/native/sky-vulkan.exe').read_bytes(); pe = struct.unpack_from('<I', code, 0x3c)[0]
assert code[pe:pe+4] == b'PE\0\0' and struct.unpack_from('<H', code, pe+4)[0] == 0x8664
inventory = read('docs/Objects.level.bin类进度.json'); assert inventory['summary']['completeRuntimeClasses'] == inventory['summary']['brokenReferences'] == 0
assert all(f['fullParseAndUnchangedRoundTrip'] for f in inventory['files'])
source = read('docs/windows-source-plan.json'); paths = {e['path'] for e in source['entries']}
required = ['src/core/on-region-runtime.ts', 'src/core/animation-sequence-registry.ts', 'src/core/original-animation-sequence-registry.json', 'src/core/scene-event-construction.ts', 'src/core/environment-object-state.ts', 'src/core/environment-event-owner.ts', 'src/core/environment-event-types.ts', 'src/core/play-animation-runtime.ts', 'tools/native-animation-sequence-registry.c', 'tools/extract-animation-sequence-registry.py', 'tools/native-on-region-oracle.c', 'tools/on-region-cases.ts', 'tools/on-region-oracle.ts', 'tools/reverse-on-region.py', 'tools/fish-group-scene-cases.ts', 'tools/verify-fish-group-scene-events.ts', 'tools/verify-fish-group-events.py', 'tools/reverse-environment-defaults.py', 'tools/resource-animation-sequence-cases.ts', 'tools/resource-animation-sequence-oracle.ts', 'tools/native-resource-animation-sequence-oracle.c', 'tests/on-region-runtime.test.ts', 'tests/animation-sequence-registry.test.ts', 'tests/fish-group-scene-events.test.ts', 'tests/fixtures/on-region-native.json.gz', 'tests/fixtures/resource-animation-sequence-native.json.gz', 'docs/on-region-native.json', 'docs/on-region-oracle.json', 'docs/scene-event-defaults.json', 'docs/resource-animation-sequence-oracle.json', 'docs/fish-group-scene-events.json', 'docs/鱼群区域事件与原序列表续接.md', 'tools/objects-class-progress-spec.json']
assert set(required) <= paths
for key in ['includesAndroidHost', 'buildOutputsIncluded', 'nodeModulesIncluded', 'cacheIncluded']: assert source[key] is False
remaining = ['CharFishGroupAnim MoveObjectAlongRail load/enable/Update, real Model resource lifecycle, animation update and pose mixing, autonomous viewport behavior', 'DarkCreature outer Update remainder 0x10026e7da..0x10026ffc0 and real world/resource owners', 'Crab whole outer Update 0x10025bc10 and ground/world/interaction/resource owners', 'FishV2 real collision/avoidance, metadata/Avatar/OBB/rail geometry, Model/animation/light/surface/audio/particle/player and Barn lifecycle', 'Full creature scene behavior, repeated load/unload, stopping, level switching and Windows hardware acceptance']
now = datetime.datetime.now(datetime.timezone.utc).isoformat()
artifacts = required + [f['assembly'] for f in evidence['functions'].values()]
report = {'passed': True, 'updatedUtc': now, 'executableSha256': n.digest, 'nativeReports': ['docs/on-region-oracle.json', 'docs/resource-animation-sequence-oracle.json'], 'onRegionNativeCases': 373, 'onRegionNativeComparedBytes': region['comparedBytes'], 'onRegionNativeServiceCalls': region['serviceCalls'], 'sequenceNativeCasesIncludingRegression': 5130, 'sequenceNewOriginalRegistryCases': 32, 'sequenceNativeComparedBytesIncludingRegression': sequences['comparedBytes'], 'originalRegistrySequences': 1201, 'originalRegistrySteps': 1966, 'wholeNativeInitializerCaptureReproduced': True, 'nativeCodeHashesBoundariesAndAssemblyVerified': True, 'sceneEventGraphs': scene['groups'], 'sceneEventGraphScope': scene['scope'], 'sceneEventGraphNativeCombinationCompared': False, 'projectRegression': project, 'focusedRegression': focused, 'baselineRegression': old['projectRegression'], 'typecheck': {'passed': True, 'command': './node_modules/.bin/tsc --noEmit', 'log': str(logs/'fish-group-final-types.log')}, 'windowsBuild': {'passed': True, 'command': 'node tools/build.mjs --windows', 'log': str(logs/'fish-group-windows-build.log'), 'machine': 'AMD64', 'binarySha256': hashlib.sha256(code).hexdigest(), 'windowsMachineRuntimeTested': False}, 'inventory': {**old['inventory'], 'coreSubchainVerifiedClasses': inventory['summary']['coreSubchainVerifiedClasses'], 'log': str(logs/'fish-group-class-progress.log')}, 'categoryCensus': {**old['categoryCensus'], 'log': str(logs/'fish-group-category-census.log')}, 'windowsSourcePlan': {**old['windowsSourcePlan'], 'log': str(logs/'fish-group-windows-source-plan.log')}, 'completeCreatureClasses': 0, 'autonomousViewportCreatureAcceptancePassed': False, 'newWindowsArchiveCreated': False, 'newSourceArchiveCreated': False, 'androidWorkPerformed': False, 'packagingReadiness': 'Windows build passes. All five saved FishGroup event graphs schedule actual original Disturb/Swim requests and re-enable OnRegion through Delay. Prepared Avatar/Model allocation, rail movement, pose mixing, viewport and complete creature/Windows hardware acceptance remain pending. No new archive or packaging date.', 'remaining': remaining, 'artifactSha256': {f: sha(f) for f in artifacts}}
(root/'docs/fish-group-events-verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
reports = list(dict.fromkeys(old['nativeReports'] + report['nativeReports']))
assert all(read(f)['passed'] and read(f)['executableSha256'] == n.digest for f in reports)
all_artifacts = list(dict.fromkeys(list(old['artifactSha256']) + artifacts + ['docs/fish-group-events-verification.json']))
updated = {**old, 'updatedUtc': now, 'priorFishAiPhase': {key: old[key] for key in ['updatedUtc', 'newNativeReports', 'newNativeCases', 'newNativeComparedBytes', 'newNativeServiceCalls', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild']}, 'nativeReports': reports, 'newNativeReports': report['nativeReports'], 'newNativeCases': 405, 'nativeCasesExecutedThisPhaseIncludingSequenceRegression': 5503, 'newNativeComparedBytes': region['comparedBytes'] + 32*(sequences['comparedBytes']//sequences['comparedCases']), 'newNativeServiceCalls': region['serviceCalls'], 'nativeScope': region['scope']+' '+sequences['scope'], 'latestPhaseReport': 'docs/fish-group-events-verification.json', 'originalSequenceRegistryLoaded': True, 'fishGroupSceneEventGraphsVerified': True, 'fishGroupCompleteSceneBehaviorVerified': False, **{key: report[key] for key in ['baselineRegression', 'focusedRegression', 'projectRegression', 'typecheck', 'windowsBuild', 'windowsSourcePlan', 'inventory', 'categoryCensus', 'remaining', 'packagingReadiness']}, 'artifactSha256': {f: sha(f) for f in all_artifacts}}
(root/'docs/creature-continuation-verification.json').write_text(json.dumps(updated, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({'passed': True, 'newNativeCases': 405, 'sceneEventGraphs': 5, 'projectTests': project['tests'], 'focusedTests': focused['tests'], 'completeCreatureClasses': 0, 'newArchive': False}))
