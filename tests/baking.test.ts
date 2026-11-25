import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { MeshesDocument } from '../src/core/meshes';
import { readResourceMesh } from '../src/core/resources';
import { bindBake, decodeLight, type BakeStream } from '../src/core/baking';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const mesh = (name: string) => readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin', name + '.mesh')));
test('Original Cube remapping permutes lighting samples; it is not the opaque meshes byte block', () => {
  const resource = mesh('Cube'), lod = resource.levels[0]; assert.equal(lod.bakeVertexCount, 24); assert.deepEqual(Array.from(lod.bakeRemap!.slice(0, 6)), [2, 1, 0, 5, 4, 3]);
  const light = Uint8Array.from({ length: 24 * 12 }, (_, i) => Math.floor(i / 12)), stream: BakeStream = { id: 'test', guid: 1, name: 'Cube', lod: 0, uniform: false, count: 24, light, extra: new Uint8Array(12) };
  const bound = bindBake(lod, stream); assert.equal(bound.packed[0], 2); assert.equal(bound.packed[12], 1); assert.equal(bound.packed[24], 0);
  for (let i = 0; i < 24; i++) assert.equal(bound.channels[1][i * 4], Math.fround(lod.bakeRemap![i] / 255));
  const uniform = bindBake(lod, { ...stream, uniform: true, light: Uint8Array.from({ length: 12 }, (_, i) => i + 1) });
  for (let i = 0; i < 24; i++) assert.deepEqual(Array.from(uniform.packed.slice(i * 12, i * 12 + 12)), Array.from({ length: 12 }, (_, j) => j + 1));
});
test('A real Dawn bake sample patch changes exactly 12 LOD bytes and leaves its opaque block intact', () => {
  const source = fs.readFileSync(path.join(data, 'Levels/Dawn/BstBaked.meshes')), doc = new MeshesDocument(source), bake = doc.bakes.find(b => b.name === 'Cube')!, sub = bake.submeshes[0];
  const before = doc.bakeData(bake.id, 0), expected = Buffer.from(doc.lod), bytes = Array.from({ length: 12 }, (_, i) => 10 + i);
  expected.set(bytes, sub.lightOffset + 2 * 12); doc.editBakeSample(bake.id, 0, 2, bytes);
  assert.deepEqual(Array.from(doc.bakeData(bake.id, 0).light.slice(24, 36)), bytes);
  const reloaded = new MeshesDocument(doc.serialize()); assert.deepEqual(reloaded.lod, expected); assert.deepEqual(reloaded.bakeData(bake.id, 0).extra, before.extra);
  const bound = bindBake(mesh('Cube').levels[0], reloaded.bakeData(bake.id, 0)); assert.deepEqual(Array.from(bound.packed.slice(0, 12)), bytes);
  assert.throws(() => doc.editBakeSample(bake.id, 0, 24, bytes), /越界/); assert.throws(() => doc.editBakeSample(bake.id, 0, 0, [-1, ...bytes.slice(1)]), /byte/);
});
test('Missing or incompatible LOD mappings fail without inventing default lighting', () => {
  const lod = mesh('Cube').levels[0], stream: BakeStream = { id: 't', guid: 1, name: 'Cube', lod: 0, count: 24, uniform: false, light: new Uint8Array(288), extra: new Uint8Array() };
  assert.throws(() => bindBake(lod, { ...stream, count: 8 }), /不匹配/);
  assert.throws(() => bindBake({ ...lod, bakeRemap: undefined }, stream), /缺少/);
  assert.throws(() => bindBake({ ...lod, bakeRemap: Uint32Array.from({ length: 24 }, () => 24) }, stream), /越界/);
  assert.throws(() => bindBake(lod, { ...stream, light: new Uint8Array(12) }), /长度/);
});
test('Packed lighting decoder follows the original shader expressions, including non-finite zero divisors', () => {
  const result = decodeLight([255, 128, 0, 255, 128, 255, 128, 255, 128, 128, 255, 64]);
  assert.deepEqual(result.ambient, [1, (128 / 255) ** 2, 0]); assert.equal(result.skyMix, 128 / 255); assert.equal(result.sunVisibility, 1);
  assert.equal(result.pointLightScale, 1); assert.equal(result.direction[2], 2.007874 - 1.007874); assert.equal(result.directionAmount, 64 / 255);
  assert.ok(!Number.isFinite(decodeLight(new Uint8Array(12)).ambient[0]));
});
