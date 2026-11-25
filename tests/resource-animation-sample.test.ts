import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { readResourceMesh } from '../src/core/resources';
import { resourceAnimationSample, sampleResourceAnimation } from '../src/core/resource-animation-sample';
import { animationSamplingCases, animationSampleExpected, animationSampleRequest } from '../tools/resource-animation-sample-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original sampler weights, frame/clip indices, loop-sign branches and poses match all 1995 native snapshots', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-samples-native.json.gz')).toString());
  let at = 0;
  for (const c of animationSamplingCases(data)) for (let i = 0; i < c.samples.length; i++) {
    const row = fixture.cases[at++]; assert.equal(c.source.id, row.resource); assert.equal(i, row.sample);
    assert.equal(sha(c.source.bytes), row.sourceSha256, c.source.id); assert.equal(sha(animationSampleRequest(c.samples[i])), row.requestSha256, c.source.id);
    assert.equal(sha(animationSampleExpected(c.pack, c.samples[i])), row.nativeSha256, `${c.source.id}:${i}`);
  }
  assert.equal(at, fixture.cases.length);
});
test('Sampling actual creature resources changes original animated channels and keeps unused pose lanes zero', () => {
  for (const name of ['CharBirdAnim', 'CharSkyRayCAnim', 'CharCrabAAnim', 'CharDarkCreatureAnim_CompOcc_CompEdges', 'CharEnvFlowerAnim']) {
    const pack = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin', name + '.mesh'))).animation!;
    const a = sampleResourceAnimation(pack, resourceAnimationSample(pack, [0, 1, 2, 3], 0));
    const b = sampleResourceAnimation(pack, resourceAnimationSample(pack, [0, 1, 2, 3], 0.5));
    assert.notDeepEqual(a, b, name); assert.equal(a.length, pack.bones.length * 12);
    for (let i = 0; i < pack.bones.length; i++) { assert.equal(b[i * 12 + 3], 0); assert.equal(b[i * 12 + 11], 0); }
  }
});
test('Invalid frames, missing tracks, invalid float inputs and missing loop masks fail before reading key arrays', () => {
  const mesh = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin/CharBirdAnim.mesh'))), pack = mesh.animation!;
  assert.throws(() => resourceAnimationSample(pack, [0, 1, 2, 40], 0.5), /超出/);
  assert.throws(() => resourceAnimationSample(pack, [0, 1, 2, 3], Infinity), /有限/);
  assert.throws(() => resourceAnimationSample({ ...pack, tracks: null }, [0, 1, 2, 3], 0.5), /轨道/);
  const state = resourceAnimationSample(pack, [38, 39, 0, 1], 0.5, 0, true);
  assert.throws(() => sampleResourceAnimation(pack, state), /掩码/);
  assert.throws(() => sampleResourceAnimation(pack, { ...state, frames: [0, 1, 2, 100] }, Uint8Array.of(0, 0)), /状态/);
  // Original single-clip sample-state construction ignores the requested index.
  assert.equal(resourceAnimationSample(pack, [0, 1, 2, 3], 0.5, -1).clipIndex, 0);
});
