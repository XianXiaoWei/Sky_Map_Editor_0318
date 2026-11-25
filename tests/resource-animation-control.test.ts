import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { animationControlCases, animationControlInput, animationControlExpected } from '../tools/resource-animation-control-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original default/current/speed/pack-registration controls preserve 11856 native controller records', () => {
  const source = fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`), list = readResourceAnimationList(source);
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-control-native.json.gz')).toString());
  assert.equal(sha(source), fixture.animationListSha256);
  let at = 0;
  for (const c of animationControlCases(data, list)) for (const request of c.requests) {
    const row = fixture.cases[at++];
    assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationControlInput(c.pack, request)), row.requestSha256);
    assert.equal(sha(animationControlExpected(c.pack, list, request)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
