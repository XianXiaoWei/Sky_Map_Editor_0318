import test from 'node:test';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import * as THREE from 'three';
import fixtures from './fixtures/cloud-native.json';
import corpus from '../docs/cloud-oracle.json';
import { decodeCloudVolume, sampleCloudDistance, type CloudVolumeSource } from '../src/core/cloud-volume';
import { MeshesDocument } from '../src/core/meshes';
import { createCloudTextures } from '../src/renderer/cloud-renderer';
import { AssetCatalog } from '../src/main/assets';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const source = (i = 0): CloudVolumeSource => {
  const src = fixtures.fixtures[i].source;
  return { ...src, sparse: Uint8Array.from(src.sparse), coordinates: Int16Array.from(src.coordinates), compressed: src.compressed.map(b => Buffer.from(b, 'base64')) };
};
const sha256 = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Sparse atlas faces, edges, corners and inactive fallback match original machine code', () => {
  for (const [i, fixture] of fixtures.fixtures.entries()) {
    const v = decodeCloudVolume(source(i));
    for (const [j, t] of v.textures.entries()) { assert.deepEqual(t.dimensions, fixture.textures[j].dimensions); assert.equal(sha256(t.data), fixture.textures[j].sha256, `${fixture.name}/${t.name}`); }
    for (const p of fixture.distances) assert.equal(sampleCloudDistance(v, p.position), p.native, `${fixture.name}: ${p.position}`);
  }
});
test('All 27 real cloud fields decode to the five original texture uploads', () => {
  for (const level of corpus.levels) {
    const doc = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level.name, 'BstBaked.meshes'))), v = doc.cloudVolume()!;
    assert.equal(doc.cloud!.distanceResolution, level.distanceResolution); assert.equal(doc.cloud!.ambienceResolution, level.ambienceResolution);
    for (const [i, t] of v.textures.entries()) { assert.deepEqual(t.dimensions, level.textures[i].dimensions); assert.equal(sha256(t.data), level.textures[i].sha256, `${level.name}/${t.name}`); }
  }
  const empty = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels/WorldEmpty/BstBaked.meshes'))); assert.equal(empty.cloudVolume(), undefined);
});
test('Cloud decoder refuses invalid sizes, duplicate/outside coordinates and truncated decompression', () => {
  const src = source(1);
  assert.throws(() => decodeCloudVolume({ ...src, dimensions: [2, 2, 0] }), /尺寸/);
  assert.throws(() => decodeCloudVolume({ ...src, sparse: new Uint8Array(1) }), /数量/);
  assert.throws(() => decodeCloudVolume({ ...src, coordinates: Int16Array.from([0, 0, 0, 0, 0, 0]) }), /重复/);
  assert.throws(() => decodeCloudVolume({ ...src, coordinates: Int16Array.from([0, 0, 0, -1, 0, 0]) }), /越界/);
  assert.throws(() => decodeCloudVolume({ ...src, compressed: [Buffer.from([0]), ...src.compressed.slice(1)] }), /长度/);
  assert.throws(() => sampleCloudDistance(decodeCloudVolume(src), [0, Infinity, 0]), /有限/);
});
test('Cloud material scalar edit preserves spatial fields and rejects incomplete origin edits atomically', () => {
  const d = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels/CarryLand/BstBaked.meshes'))), c = d.cloud!;
  assert.throws(() => d.editCloud(c.origin.map(n => n + 1), 2), /代理/); assert.equal(d.patches.size, 0);
  assert.throws(() => d.editCloud(c.origin, Infinity)); assert.equal(d.patches.size, 0);
  d.editCloud(c.origin, 2.5); const out = new MeshesDocument(d.serialize()); assert.equal(out.cloud!.sunOcclusionScale, 2.5);
  for (let i = 0; i < d.lod.length; i++) if (i < c.materialScalarOffset || i >= c.materialScalarOffset + 4) assert.equal(out.lod[i], d.lod[i]);
});
test('Cloud proxy movement cannot leave a modified proxy detached from its field or disturb pending scalar edits', () => {
  const source = fs.readFileSync(path.join(data, 'Levels/Dawn/BstBaked.meshes')), d = new MeshesDocument(source), c = d.cloud!, proxy = c.proxy!;
  assert.ok(proxy.vertexCount); const positions = d.geometryView(proxy).positions; positions[0] += 16;
  assert.throws(() => d.editGeometry(proxy.id, positions), /距离场与碰撞/); assert.equal(d.patches.size, 0); assert.deepEqual(d.serialize(), source);
  d.editCloud(c.origin, 2.5); const saved = d.serialize(), patches = [...d.patches];
  assert.throws(() => d.editGeometry(proxy.id, positions), /距离场与碰撞/); assert.deepEqual([...d.patches], patches); assert.deepEqual(d.serialize(), saved);
});
test('All native cloud proxy descriptors expose the original SNORM4 normal bytes', () => {
  let vertices = 0;
  for (const level of corpus.levels) {
    const d = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level.name, 'BstBaked.meshes'))), proxy = d.cloud!.proxy!, view = d.geometryView(proxy);
    assert.equal(proxy.stride, 16); assert.equal(view.packedNormals.length, proxy.vertexCount * 4);
    assert.ok(level.proxyFormat.attributes.some(a => a.semantic === 3 && a.format === 24 && a.offset === 12));
    for (let v = 0; v < proxy.vertexCount; v++) for (let c = 0; c < 4; c++) {
      const raw = d.lod.readInt8(proxy.vertexOffset + v * 16 + 12 + c); assert.equal(view.packedNormals[v * 4 + c], raw);
      if (c < 3) assert.equal(view.normals[v * 3 + c], Math.fround(Math.max(-1, raw / 127)));
    }
    vertices += proxy.vertexCount;
  }
  assert.ok(vertices > 0);
});
test('Production 3D textures preserve original bytes, channel formats and nearest/linear clamp sampling', () => {
  const v = decodeCloudVolume(source()), resources = createCloudTextures(v);
  assert.equal(Object.keys(resources.textures).length, 5);
  for (const t of Object.values(resources.textures)) {
    assert.equal(t.wrapS, THREE.ClampToEdgeWrapping); assert.equal(t.wrapT, THREE.ClampToEdgeWrapping); assert.equal(t.wrapR, THREE.ClampToEdgeWrapping);
    assert.equal(t.minFilter, t.name === 'CloudSparseGrid' ? THREE.NearestFilter : THREE.LinearFilter);
    assert.equal(t.magFilter, t.minFilter); assert.equal(t.generateMipmaps, false); assert.equal(t.colorSpace, THREE.NoColorSpace); assert.equal(t.unpackAlignment, 1); assert.equal(t.flipY, false);
    const original = v.textures.find(f => f.name === t.name)!; assert.deepEqual(t.image.data, original.data);
    assert.equal(t.format, original.channels === 4 ? THREE.RGBAFormat : THREE.RedFormat);
  }
  let disposed = 0; Object.values(resources.textures).forEach(t => t.addEventListener('dispose', () => disposed++)); resources.dispose(); assert.equal(disposed, 5);
});
test('Boot shader declarations resolve original cloud super coarse, coarse and final programs', () => {
  const catalog = new AssetCatalog(data);
  for (const [name, hash] of [['CloudFluffySuperCoarse', 54734], ['CloudFluffyCoarse', 62865], ['CloudFluffy', 0]] as const) {
    const p = catalog.program(name); assert.equal(p.definition.hash, hash); assert.equal(p.definition.source, 'Resources/Boot.lua');
    assert.ok(p.variables.some(v => v.name === 'u_cloudSparse' && v.type === 'sampler3D'));
  }
});
