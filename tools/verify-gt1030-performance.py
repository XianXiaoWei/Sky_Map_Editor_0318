#!/usr/bin/env python3
"""Bind completed checks to the reviewed Windows performance payload."""
import datetime, hashlib, json, pathlib, re, shutil, statistics, struct

root = pathlib.Path(__file__).resolve().parent.parent
research = pathlib.Path('/root/sky-research')

def read(file):
    value = json.loads(file.read_text())
    assert value['passed'], str(file)
    return value

def sha(file):
    with file.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()

transfer = read(research / 'fps-final-compute-validation.json')
cloud = read(research / 'fps-hardware-cloud-graph.json')
validation = read(root / 'docs/gt1030-vulkan-validation.json')
validated_graph = read(research / 'fps-per-process-validation-graph.json')
canvas = read(research / 'fps-final-canvas.json')
filter_check = read(root / 'docs/cloud-hardware-filter-check.json')
cloud_bundle = read(root / 'docs/cloud-shader-bundle-verification.json')
model_bundle = read(root / 'docs/model-shader-bundle-verification.json')

def graph_summary(check):
    assert [m['level'] for m in check['maps']] == ['Dawn', 'SkyHub2', 'WorldEmpty']
    for row in check['maps']:
        assert row['sourceUnchanged'] and len(row['frames']) == 6
        assert all(f['differing'] == f['max'] == 0 for f in row['frames'])
        assert all(f['referenceSha256'] == f['residentSha256'] for f in row['frames'])
    return {'maps': 3, 'frames': 18, 'differences': 0,
            'comparedBytes': sum(f['width'] * f['height'] * 4 for m in check['maps'] for f in m['frames'])}

compute_summary, cloud_summary = graph_summary(transfer), graph_summary(cloud)
graph_summary(validated_graph)
assert validation['rendererProcesses'] >= 8 and not validation['warningsAndErrors']
assert canvas['sourceHashesUnchanged'] and canvas['fullEffectsOnly'] and not canvas['errors']
assert canvas['window']['count'] == 1 and canvas['transport']['surfaceFrames'] == 0
assert canvas['interaction']['poseRequests'] and canvas['interaction']['sceneReuploads'] == canvas['interaction']['materialReuploads'] == 0
assert all(m['canvas']['opaqueFraction'] == 1 and m['canvas']['whiteFraction'] < .95 for m in canvas['maps'])
assert all(c['nativeAdapterDifferences'] == 0 for c in filter_check['cases'])
assert model_bundle['compilerExecutablesAvailable'] is False and cloud_bundle['compilerExecutablesAvailable'] is False

def tests(file):
    text = file.read_text()
    total = int(re.search(r'^# tests (\d+)$', text, re.M)[1])
    assert total == int(re.search(r'^# pass (\d+)$', text, re.M)[1]) and re.search(r'^# fail 0$', text, re.M)
    return total

project_tests = tests(research / 'fps-release-project-tests.log')
focused_tests = tests(research / 'fps-post-resize-tests.log')
assert project_tests >= 479 and focused_tests >= 27
assert not (research / 'fps-final-reviewed-typecheck.log').read_text()

windows = root / 'dist/native/sky-vulkan.exe'
pe = windows.read_bytes(); offset = struct.unpack_from('<I', pe, 0x3c)[0]
assert pe[:2] == b'MZ' and pe[offset:offset+4] == b'PE\0\0' and struct.unpack_from('<H', pe, offset+4)[0] == 0x8664
original = pathlib.Path('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
assert sha(original) == '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20'

for source, target in [(research/'fps-final-compute-validation.json', 'gt1030-transfer-graph-check.json'),
                       (research/'fps-hardware-cloud-graph.json', 'gt1030-hardware-cloud-graph-check.json'),
                       (research/'fps-final-canvas.json', 'gt1030-canvas-check.json')]:
    shutil.copy2(source, root/'docs'/target)

files = [root/'dist'/name for name in ['main.cjs', 'preload.cjs', 'app.js', 'index.html', 'style.css', 'classes.json', 'native/sky-vulkan.exe']]
files += sorted(p for p in (root/'dist/vulkan-shaders').rglob('*') if p.is_file())
same_size = []
for row in transfer['maps']:
    steady = [f for f in row['frames'] if f['step'] in (1, 2, 4)]
    same_size.append({'level': row['level'], 'width': 256, 'height': 144,
                      'conservativeMedianMs': statistics.median(f['referenceMs'] for f in steady),
                      'optimizedMedianMs': statistics.median(f['residentMs'] for f in steady)})

report = {
    'passed': True, 'version': json.loads((root/'package.json').read_text())['version'],
    'verifiedAtUTC': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'scope': 'Verified implementation and Windows AMD64 package payload. Linux software Vulkan pixel/sampler/synchronization checks and actual Electron canvas interaction; no Windows GT 1030 runtime/FPS or original-game image-parity acceptance.',
    'userReportedDevice': 'Hardware Vulkan, approximately NVIDIA GT 1030',
    'userFrameCosts': [{'resolution': [500,500], 'milliseconds': 200, 'fps': 5}, {'resolution': [800,800], 'milliseconds': 500, 'fps': 2}],
    'tests': {'fullProjectPassed': project_tests, 'fullProjectFailed': 0, 'postResizeFocusedPassed': focused_tests, 'typecheckPassed': True},
    'computePixelReference': compute_summary, 'hardwareCloudPixelReference': cloud_summary,
    'nativeSamplerCheck': {'report': 'docs/cloud-hardware-filter-check.json', 'queries': sum(c['samples'] for c in filter_check['cases']), 'directNativeDifferences': 0, 'maxAnalyticalDifference': max(c['maxAnalyticalDifference'] for c in filter_check['cases'])},
    'vulkanValidation': validation,
    'sameResolutionMeasurements': {'scope': 'Forced hardware compute paths on software Vulkan with LLVM optimization disabled, excludes uploads/restarts/resize; no frame-time improvement demonstrated and no Windows FPS inference.', 'rows': same_size},
    'productionCanvas': {'report': 'docs/gt1030-canvas-check.json', 'maps': canvas['maps'], 'interaction': canvas['interaction'], 'resizeAndDpi': canvas['resizeAndDpi'], 'retainsFrameDuringAdaptiveResize': True},
    'shaderBundles': {'entries': json.loads((root/'docs/viewport-shader-bundle.json').read_text())['cacheEntries'], 'cloudRequestsWithoutCompiler': len(cloud_bundle['requests']), 'modelRequestsWithoutCompiler': model_bundle['requests']},
    'optimization': {'fullEffectsOnly': True, 'defaultPresentation': 'opaque Electron/Canvas2D', 'gt1030TargetBudgetMs': 1000/60, 'gt1030LongEdge': [384,1600], 'gt1030InitialLongEdge': 960, 'finalHardwareReadbackBytesPerPixelBefore': 16, 'finalHardwareReadbackBytesPerPixelAfter': 4, 'hardwareCloudFiltering': True, 'gpuExposureGather': True, 'gpuStageTiming': True, 'maxConcurrentFrameRequests': 1},
    'buildPayloadSha256': {p.relative_to(root).as_posix(): sha(p) for p in files},
    'sourceSha256': {p.relative_to(root).as_posix(): sha(p) for folder in ['src','native'] for p in (root/folder).rglob('*') if p.is_file()},
    'windowsNativeAMD64PEVerified': True, 'windowsRuntimeTested': False, 'windowsHardwareFpsVerified': False,
    'highFrameRateTargetAchieved': False, 'originalResourcesModified': False, 'originalExecutableSha256': sha(original),
    'completeOriginalClasses': 0, 'completeOriginalObjects': 0,
}
(root/'docs/gt1030-performance-verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({key: report[key] for key in ['passed','version','tests','computePixelReference','hardwareCloudPixelReference','windowsHardwareFpsVerified']}, ensure_ascii=False))
