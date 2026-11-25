import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { Reader, lz4Decode } from '../src/core/binary';
import { readResourceAnimationPack, readResourceAnimationTracks } from '../src/core/resource-animation';
import { readResourceMesh } from '../src/core/resources';
import { animationResourceCases, nativeAnimationExpected, preparedAnimationPack } from '../tools/resource-animation-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const hash = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
test('All 201 original embedded packs and prepared multi-clip variants match unmodified native reader outputs', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-native.json.gz')).toString());
  const cases = animationResourceCases(data); assert.equal(cases.length, fixture.cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], expected = fixture.cases[i]; assert.equal(c.id, expected.id);
    assert.equal(hash(c.bytes), expected.sourceSha256, c.id); assert.equal(hash(nativeAnimationExpected(c.bytes)), expected.nativeSha256, c.id);
  }
});
test('Bird, rays, crab, dragon and flower meshes retain every LOD skin byte and expose original skeleton/clip resources', () => {
  const examples: [string, number, number][] = [['CharBirdAnim', 14, 40], ['CharBirdLowAnim', 13, 40], ['CharSkyRayCAnim', 14, 120], ['CharCrabAAnim', 10, 50], ['CharDarkCreatureAnim_CompOcc_CompEdges', 67, 60], ['CharEnvFlowerAnim', 5, 120]];
  for (const [name, bones, frames] of examples) {
    const bytes = fs.readFileSync(path.join(data, 'Meshes/Bin', name + '.mesh')), mesh = readResourceMesh(bytes), pack = mesh.animation!;
    assert.equal(mesh.animated, true); assert.equal(pack.bones.length, bones); assert.equal(pack.frameCount, frames); assert.equal(pack.sampleRate, 30);
    assert.equal(pack.tracks!.clips[0].endFrame, frames - 1); assert.equal(pack.defaultPose.length, bones * 12);
    const lod = new Reader(lz4Decode(bytes.subarray(86, 86 + bytes.readUInt32LE(78))));
    for (const level of mesh.levels) {
      lod.take(52); const vc = lod.u32(), ic = lod.u32(), counts = Array.from({ length: 5 }, () => lod.u32()); lod.take(16 + vc * 36);
      assert.deepEqual(level.packedSkin, Uint8Array.from(lod.take(vc * 8)), name); assert.equal(level.packedSkin!.length, vc * 8);
      lod.take(ic * 8 + (counts[0] ? vc * 4 : 0) + (counts[1] ? vc * 4 : 0) + counts[2] * 4 + counts[3] * 4 + counts[4] * 8);
    }
  }
});
test('Stripped meshes retain bone links without inventing missing bind matrices or clips', () => {
  const mesh = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin/CharSkyKid_Body_Perfect_StripAnim_CompOcc_CompEdges.mesh'))), pack = mesh.animation!;
  assert.equal(pack.frameCount, 0); assert.equal(pack.bones.length, 124); assert.equal(pack.tracks, null); assert.equal(pack.defaultPose.length, 0);
  assert.ok(pack.bones.every(b => b.linkMatrix === null)); assert.ok(mesh.packedSkin!.length > 0);
});
test('Original pose channel identities are scale, rotation, position, following native Transform consumption', () => {
  const pack = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin/CharBirdAnim.mesh'))).animation!;
  assert.deepEqual(Array.from(pack.defaultPose.slice(0, 3)), [1, 1, 1]);
  assert.deepEqual(Array.from(pack.tracks!.scales.slice(0, 3)), [1, 1, 1]);
  assert.deepEqual(Array.from(pack.tracks!.positions.slice(0, 3)), Array.from(pack.defaultPose.slice(8, 11)));
  assert.equal(pack.tracks!.clips[0].scaleCount, 10); assert.equal(pack.tracks!.clips[0].positionCount, 2);
});
test('Inclusive multi-clip ranges preserve static/dynamic offsets, generated bone IDs and unused SIMD lanes', () => {
  const pack = readResourceAnimationPack(new Reader(preparedAnimationPack(9, true))), tracks = pack.tracks!, [a, b] = tracks.clips;
  assert.deepEqual([a.startFrame, a.endFrame, b.startFrame, b.endFrame], [4, 5, 10, 12]);
  assert.deepEqual([a.scaleOffset, b.staticScaleOffset, b.scaleOffset], [1, 3, 4]);
  assert.deepEqual(Array.from(tracks.flags.slice(a.staticScaleIndex, a.staticScaleIndex + 6)), [0, 1, 2, 0, 1, 2]);
  assert.deepEqual(Array.from(tracks.scales), [10, 20, 30, 0, 1, 2, 1, 2, 3, 11, 20, 30, 1, 1, 2, 2, 2, 3, 3, 3, 4]);
  for (let i = 0; i < 3; i++) { assert.equal(tracks.referencePose[i * 12 + 3], 0); assert.equal(tracks.referencePose[i * 12 + 11], 0); }
});
test('Truncation, inverted ranges, false key counts, non-finite poses and unknown versions fail explicitly', () => {
  const good = preparedAnimationPack(9, false), tracksAt = 81 + 3 * 172;
  for (const length of [0, 80, 81, tracksAt, good.length - 1]) assert.throws(() => readResourceAnimationPack(new Reader(good.subarray(0, length))));
  const change = (at: number, value: number) => { const b = Buffer.from(good); b.writeUInt32LE(value, at); return b; };
  assert.throws(() => readResourceAnimationPack(new Reader(change(0, 10))), /版本/);
  assert.throws(() => readResourceAnimationPack(new Reader(change(tracksAt + 4, 0xffffffff))), /超限/);
  assert.throws(() => readResourceAnimationPack(new Reader(change(tracksAt + 20 + 120 + 4, 0))), /倒置/);
  assert.throws(() => readResourceAnimationPack(new Reader(change(81 + 3 * 132, 0x7fc00000))), /非有限/);
  const fewer = change(tracksAt + 4, 6); assert.throws(() => readResourceAnimationPack(new Reader(fewer)), /容量|数量/);
  assert.throws(() => readResourceAnimationTracks(new Reader(Buffer.alloc(0)), 257, 9), /骨骼/);
});
test('Static mesh resource loading remains independent of animation data', () => {
  const mesh = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin/Cube.mesh')));
  assert.equal(mesh.animated, false); assert.equal(mesh.animation, undefined); assert.equal(mesh.packedSkin, undefined); assert.ok(mesh.indices.length > 0);
});
