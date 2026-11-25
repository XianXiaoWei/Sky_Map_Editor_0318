import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationMatrixCases, animationMatrixExpected, animationMatrixRequest } from '../tools/resource-animation-matrix-cases';
import { identityResourceSkeletonRoot, resourceAnimationBoneMatrices } from '../src/core/resource-animation-matrices';
import { readResourceMesh } from '../src/core/resources';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('All 891 sampled original skeleton palettes match native Transform hierarchy and matrix multiplication bytes', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-matrices-native.json.gz')).toString()); let at = 0;
  for (const c of animationMatrixCases(data)) for (let i = 0; i < c.requests.length; i++) {
    const row = fixture.cases[at++]; assert.equal(row.resource, c.source.id); assert.equal(row.request, i);
    assert.equal(sha(c.source.bytes), row.sourceSha256); assert.equal(sha(animationMatrixRequest(c.requests[i])), row.requestSha256);
    assert.equal(sha(animationMatrixExpected(c.pack, c.requests[i])), row.nativeSha256, `${c.source.id}:${i}`);
  }
  assert.equal(at, fixture.cases.length);
});
test('Invalid/cyclic parent links and stripped bind matrices fail before constructing a usable palette', () => {
  const pack = readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/CharBirdAnim.mesh`)).animation!, pose = pack.defaultPose;
  assert.throws(() => resourceAnimationBoneMatrices({ ...pack, bones: pack.bones.map((b, i) => i ? b : { ...b, parentLink: 1 }) }, pose), /循环/);
  assert.throws(() => resourceAnimationBoneMatrices({ ...pack, bones: pack.bones.map((b, i) => i ? b : { ...b, parentLink: 1000 }) }, pose), /越界/);
  assert.throws(() => resourceAnimationBoneMatrices({ ...pack, bones: pack.bones.map(b => ({ ...b, linkMatrix: null })) }, pose), /链接矩阵/);
  assert.throws(() => resourceAnimationBoneMatrices(pack, pose.slice(0, 12)), /姿态/);
  const root = identityResourceSkeletonRoot(); root.pose[0] = Infinity;
  assert.throws(() => resourceAnimationBoneMatrices(pack, pose, root), /无效/);
});
