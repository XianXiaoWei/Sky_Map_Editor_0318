import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import oracle from '../docs/volu-oracle.json';
import { readVolumeTexture, cloudNoiseTexture, sampleCloudNoise } from '../src/core/volu';
import { AssetCatalog } from '../src/main/assets';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('VOLU signed float samples and cloud normalization/axis order match unchanged original machine code', () => {
  for (const row of oracle.files) {
    const source = fs.readFileSync(path.join(data, 'Tex3D', row.file)), before = Buffer.from(source), v = readVolumeTexture(source);
    assert.equal(v.name, row.name); assert.equal(v.resolution, row.resolution);
    assert.equal(sha(new Uint8Array(v.samples.buffer)), row.samplesSha256);
    assert.equal(v.voxels.length, row.voxels); assert.deepEqual(source, before);
  }
  const catalog = new AssetCatalog(data), texture = catalog.cloudNoise();
  assert.equal(sha(texture.data), oracle.cloudNoise.sha256);
  assert.deepEqual(texture.dimensions, oracle.cloudNoise.dimensions);
  assert.equal(texture.format, 'r8'); assert.equal(texture.linear, true); assert.equal(texture.repeat, true);
  for (const sample of oracle.cpuNoise.samples) assert.equal(sampleCloudNoise(texture, sample.position), sample.native);
});
test('VOLU rejects truncated and unsupported files while ignoring opaque exporter header bytes', () => {
  const original = fs.readFileSync(path.join(data, 'Tex3D/CloudFluffy.vol'));
  const change = (offset: number, value: number) => { const b = Buffer.from(original); b.writeUInt32LE(value, offset); return b; };
  assert.throws(() => readVolumeTexture(original.subarray(0, 4095)), /截断/);
  assert.throws(() => readVolumeTexture(original.subarray(0, -1)), /长度/);
  assert.throws(() => readVolumeTexture(change(4, 5)), /版本/);
  assert.throws(() => readVolumeTexture(change(0x110, 2)), /格式/);
  assert.throws(() => readVolumeTexture(change(0x114, 4)), /通道/);
  assert.throws(() => readVolumeTexture(change(0x10c, 0xffffffff)), /尺寸/);
  const opaque = Buffer.from(original); opaque.fill(0xa7, 0x118, 4096);
  assert.equal(sha(new Uint8Array(readVolumeTexture(opaque).samples.buffer)), sha(new Uint8Array(readVolumeTexture(original).samples.buffer)));
  const constant = Buffer.from(original); constant.fill(127, 4096);
  assert.ok(cloudNoiseTexture(readVolumeTexture(constant)).data.every(b => b === 255));
  assert.throws(() => cloudNoiseTexture(readVolumeTexture(fs.readFileSync(path.join(data, 'Tex3D/PerlinNoise.vol')))), /64/);
});
