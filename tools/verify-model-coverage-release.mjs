import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';

const read = async name => JSON.parse(await fs.readFile('docs/' + name, 'utf8'));
const [audit, smoke, gpu, shaders, classes] = await Promise.all([
  read('model-coverage-audit.json'), read('model-coverage-smoke.json'),
  read('model-material-coverage-gpu.json'), read('model-shader-bundle-verification.json'),
  read('Objects.level.bin类进度.json'),
]);
const summary = audit.summary;
assert.equal(summary.maps, 33);
assert.equal(summary.materialBindingsAvailable, summary.models);
assert.equal(summary.missingTextureBindings, 0);
assert.deepEqual(summary.materialBoundaries, {});
assert.equal(summary.beamoGeometryAvailable, summary.beamoInstances);
assert.deepEqual(summary.beamoPassBoundaries, {});
assert.equal(summary.poseAvailableAnimatedModels, summary.animatedModels);
assert.equal(summary.defaultAnimationAvailableModels, summary.animatedModels);
assert.equal(summary.automaticAnimationAvailableModels, summary.automaticAnimationRequestedModels);
assert.equal(smoke.passed, true);
assert.deepEqual(smoke.errors, []);
assert.equal(new Set(smoke.maps.map(m => m.level)).size, summary.maps);
assert.deepEqual(smoke.maps.map(m => m.level).sort(), classes.files.map(m => m.level).sort());
for (const map of smoke.maps) {
  assert.equal(map.sourceUnchanged, true);
  const moving = audit.rows.filter(r => r.level === map.level && r.savedVisible && r.autoAvailable && r.sampleChanged && !r.materialBoundary);
  assert.deepEqual(map.changedAnimatedNodeIds.slice().sort((a,b) => a-b), moving.map(r => r.id).sort((a,b) => a-b));
  assert.deepEqual(map.modelBoundaries, []);
}
assert.equal(gpu.passed, true);
assert.ok(gpu.cases.length >= 9);
for (const c of gpu.cases) {
  assert.equal(c.sourceUnchanged, true);
  assert.equal(c.nonfinitePixels, 0);
  assert.ok(c.visiblePixels > 10);
}
assert.equal(shaders.passed, true);
assert.equal(shaders.levels, summary.maps);
assert.equal(shaders.compilerExecutablesAvailable, false);
for (const name of ['WaterSim', 'WaterSimReset', 'Flower', 'Candle', 'ViewportWaterBackground', 'ViewportFlowerBackground']) assert.ok(shaders.effectPrograms.includes(name), name);
const testsFile = '/root/sky-research/model-coverage-scratch-tests.log';
const testLog = await fs.readFile(testsFile, 'utf8');
const total = Number(testLog.match(/^# tests (\d+)$/m)?.[1]);
assert.ok(total >= 588);
assert.equal(Number(testLog.match(/^# pass (\d+)$/m)?.[1]), total);
assert.match(testLog, /^# fail 0$/m);
assert.equal(await fs.readFile('/root/sky-research/model-coverage-current-types.log', 'utf8'), '');
const sha = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const buildPayloadSha256 = {};
for (const name of ['main.cjs', 'preload.cjs', 'app.js', 'index.html', 'style.css', 'classes.json', 'native/sky-vulkan.exe']) {
  const file = 'dist/' + name;
  buildPayloadSha256[file] = sha(await fs.readFile(file));
}
for (const key of await fs.readdir('dist/vulkan-shaders')) if (/^[0-9a-f]{64}$/.test(key)) for (const name of ['vert.spv', 'frag.spv', 'manifest.json']) {
  const file = path.posix.join('dist/vulkan-shaders', key, name);
  buildPayloadSha256[file] = sha(await fs.readFile(file));
}
for(const [file,digest] of Object.entries(smoke.testedBuildPayloadSha256 ?? {})) assert.equal(sha(await fs.readFile(file)),digest,'Integration build changed: '+file);
const evidenceSha256 = {};
for (const name of ['model-coverage-audit.json', 'model-coverage-smoke.json', 'model-material-coverage-gpu.json', 'model-shader-bundle-verification.json', 'Objects.level.bin类进度.json']) evidenceSha256['docs/' + name] = sha(await fs.readFile('docs/' + name));
const runMaps = [];
for (const run of smoke.runs ?? []) {
  assert.match(run.report, /^docs\/model-coverage-[\w-]+-smoke\.json$/);
  const bytes = await fs.readFile(run.report), result = JSON.parse(bytes);
  assert.equal(result.passed, true);
  assert.deepEqual(result.errors, []);
  assert.equal(sha(bytes), run.sha256);
  assert.deepEqual(result.maps.map(m => m.level), run.levels);
  runMaps.push(...result.maps);
  evidenceSha256[run.report] = run.sha256;
}
if (smoke.runs?.length) assert.deepEqual(runMaps, smoke.maps);
const report = {
  passed: true, verifiedAtUTC: new Date().toISOString(), version: JSON.parse(await fs.readFile('package.json', 'utf8')).version,
  scope: 'Saved LevelMesh/Beamo/BeamoDecal resource and material coverage, saved default model animation policy, all-map Electron/Vulkan integration, representative finite native material pixels, and bundled shaders without a compiler. Earlier display/performance reports describe historical builds. Full creature AI, original lifecycle, Metal pixel parity and Windows runtime remain separate.',
  summary, viewportMaps: smoke.maps.length, materialPixelCases: gpu.cases.length,
  tests: {passed: total, failed: 0, source: testsFile, reusedCompletedRegressionRun: false},
  typeCheckPassed: true, shadersVerifiedWithoutSDK: true,
  classProgress: classes.summary, windowsRuntimeVerified: false,
  buildPayloadSha256, evidenceSha256,
};
await fs.writeFile('docs/model-coverage-verification.json', JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify({passed: true, maps: smoke.maps.length, materialPixelCases: gpu.cases.length, tests: total}));
