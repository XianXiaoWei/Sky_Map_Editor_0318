import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { animationRequestCases, animationRequestInput, animationRequestExpected, prepareAnimationRequest } from '../tools/resource-animation-request-cases';
import { findOriginalResourceAnimationAction, createOriginalNamedAnimationRequest } from '../src/core/resource-animation-request';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original named/range requests, all three pools, lookup failures and loop masks match 3194 whole native controller records', () => {
  const source = fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`), list = readResourceAnimationList(source);
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-requests-native.json.gz')).toString()); assert.equal(sha(source), fixture.animationListSha256);
  let at = 0;
  for (const c of animationRequestCases(data, list)) for (const request of c.requests) {
    const row = fixture.cases[at++]; assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256); assert.equal(sha(animationRequestInput(c.pack, request)), row.requestSha256); assert.equal(sha(animationRequestExpected(c.pack, list, request)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
test('Bird, ray, crab and flower names bind original inclusive subranges without altering saved metadata', () => {
  const list = readResourceAnimationList(fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`)), before = JSON.stringify(list);
  const cases = animationRequestCases(data, list);
  for (const [resource, name, range] of [['CharBirdAnim.mesh', 'critterMove', [0, 9]], ['CharSkyRayCAnim.mesh', 'critterIdle', [30, 59]], ['CharCrabAAnim.mesh', 'run', [10, 19]], ['CharEnvFlowerAnim.mesh', 'openUp', [30, 59]]] as const) {
    const c = cases.find(c => c.source.id === resource)!, request = c.requests.find(r => r.name === name && r.mode === 1)!;
    const { b, m, base, services } = prepareAnimationRequest(c.pack, request), index = createOriginalNamedAnimationRequest(m, base, list, [c.pack], name, 0.5, services);
    const at = index < 152 ? 0x18 + index * 0x70 : 0x4298 + (index - 152) * 0x70;
    assert.equal(b.readInt32LE(at + 36), range[0]); assert.equal(b.readInt32LE(at + 40), range[1] - range[0] + 1);
    assert.equal(b.readFloatLE(at + 20), 0.5); assert.equal(b[at + 0x4f], 0);
    assert.equal(findOriginalResourceAnimationAction(list, [c.pack], name.toUpperCase()), null);
    assert.equal(findOriginalResourceAnimationAction(list, [c.pack, c.pack], name)?.packIndex, 0);
  }
  assert.equal(JSON.stringify(list), before);
});
