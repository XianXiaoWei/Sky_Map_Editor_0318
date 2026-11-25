import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationSkeletonCases, animationSkeletonInput, animationSkeletonExpected } from '../tools/resource-animation-skeleton-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original skeleton ownership, human masks, duplicate-name sorting, Transform links and mirror rotations match native arenas', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-skeleton-native.json.gz')).toString());
  let at = 0;
  for (const c of animationSkeletonCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++]; assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationSkeletonInput(c.pack, request)), row.requestSha256);
    assert.equal(sha(animationSkeletonExpected(c.pack, request)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
