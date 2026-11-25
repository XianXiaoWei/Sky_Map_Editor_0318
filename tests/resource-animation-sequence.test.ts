import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationSequenceCases, animationSequenceInput, animationSequenceExpected, sequenceTestList } from '../tools/resource-animation-sequence-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original sequence timing, ID wrap, capacity eviction and fade suppression match native controllers and masks', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-sequence-native.json.gz')).toString());
  const { bytes, list } = sequenceTestList(data); assert.equal(sha(bytes), fixture.animationListSha256);
  let at = 0;
  for (const c of animationSequenceCases(data, list)) for (const request of c.requests) {
    const row = fixture.cases[at++]; assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationSequenceInput(c.pack, list, request)), row.requestSha256);
    assert.equal(sha(animationSequenceExpected(c.pack, list, request)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
