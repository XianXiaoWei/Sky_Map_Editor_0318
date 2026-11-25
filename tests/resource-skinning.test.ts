import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { resourceSkinningCases, resourceSkinRequest, resourceSkinExpected } from '../tools/resource-skinning-cases';
import { skinResourcePositions, skinResourcePositionsAndNormals } from '../src/core/resource-skinning';
import { readResourceMesh } from '../src/core/resources';
import { resourceAnimationBoneMatrices } from '../src/core/resource-animation-matrices';
import { defaultResourceModelPose } from '../src/core/resource-model-pose';
import { resourceModelGeometry, exportResourceModel } from '../src/renderer/resource-model-renderer';
import * as THREE from 'three';
import evidence from '../docs/resource-skinning-rsqrt.json';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Every animated LOD position/normal consumer matches the original machine code including guards and caller-owned bytes', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-skinning-native.json.gz')).toString()), cases = resourceSkinningCases(data);
  assert.equal(cases.length, fixture.cases.length);
  cases.forEach((c, i) => { const row = fixture.cases[i]; assert.equal(row.id, c.id); assert.equal(sha(c.source), row.sourceSha256); assert.equal(sha(resourceSkinRequest(c)), row.requestSha256); assert.equal(sha(resourceSkinExpected(c, Buffer.from(row.rsqrtPairs, 'base64'))), row.nativeSha256, c.id); });
});
test('Both skin branches reject corrupt groups, missing streams, palette indices and unknown arithmetic before exporting geometry', () => {
  const mesh = readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/CharBirdAnim.mesh`)), palette = resourceAnimationBoneMatrices(mesh.animation!, mesh.animation!.defaultPose);
  assert.throws(() => skinResourcePositions({ ...mesh, skinCounts: [0, 0, 0, 0] }, palette), /分组/);
  assert.throws(() => skinResourcePositions({ ...mesh, packedSkin: undefined }, palette), /顶点流/);
  assert.throws(() => skinResourcePositions(mesh, palette.slice(0, 16)), /索引越界/);
  assert.throws(() => skinResourcePositionsAndNormals(mesh, palette, { rsqrt: () => { throw new Error('Unobserved native RSQRTSS input'); } }), /Unobserved/);
  assert.throws(() => skinResourcePositionsAndNormals({ ...mesh, packedNormals: undefined }, palette, { rsqrt: () => 0 }), /顶点流/);
});
test('Default-pose projection reaches the renderer/exporter with original UV/color bytes and leaves external skeletons blocked', () => {
  const table = Buffer.from(evidence.data, 'base64'); assert.equal(sha(table), evidence.binarySha256); assert.deepEqual(table, fs.readFileSync('docs/resource-skinning-rsqrt.bin'));
  for (const name of ['CharBirdAnim', 'CharBirdLowAnim', 'CharSkyRayCAnim', 'CharSkyRayMotherAnim', 'CharCrabAAnim', 'CharDarkCreatureAnim_CompOcc_CompEdges', 'CharEnvFlowerAnim']) {
    const source = fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`), mesh = readResourceMesh(source), raw = sha(mesh.packedPositions!), posed = defaultResourceModelPose(mesh), geometry = resourceModelGeometry(mesh);
    assert.equal(geometry.userData.nativeAnimated, false); assert.equal(geometry.userData.nativeSkinPose, 'default');
    assert.deepEqual(geometry.getAttribute('position').array, posed.positions);
    const material = new THREE.MeshStandardMaterial(); material.userData.nativeModel = { shader: 'Diffuse', group: 'Opaque' }; const object = new THREE.Mesh(geometry, material); object.userData.nodeId = 123;
    const draw = exportResourceModel(object, material, 0, mesh.indices.length);
    for (let i = 0; i < mesh.positions.length / 3; i++) { assert.deepEqual(draw.vertices.subarray(i * 48, i * 48 + 16), posed.packedPositions!.subarray(i * 16, i * 16 + 16)); assert.deepEqual(draw.vertices.subarray(i * 48 + 16, i * 48 + 20), new Uint8Array(posed.packedNormals!.buffer, i * 4, 4)); assert.deepEqual(draw.vertices.subarray(i * 48 + 20, i * 48 + 36), mesh.packedUvs!.subarray(i * 16, i * 16 + 16)); }
    assert.equal(sha(mesh.packedPositions!), raw); assert.equal(sha(fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`)), sha(source)); geometry.dispose(); material.dispose();
  }
  const stripped = readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/CharSkyKid_Body_Perfect_StripAnim_CompOcc_CompEdges.mesh`));
  assert.throws(() => defaultResourceModelPose(stripped), /外部骨骼/); const blocked = resourceModelGeometry(stripped); assert.equal(blocked.userData.nativeAnimated, true); assert.match(blocked.userData.nativeSkinBoundary, /外部骨骼/); blocked.dispose();
});
