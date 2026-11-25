import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationLifecycleCases, animationLifecycleInput, animationLifecycleExpected } from '../tools/resource-animation-lifecycle-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original animation construction and matrix/event flush preserve 3960 complete native arenas and ordered callouts', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-lifecycle-native.json.gz')).toString());
  let at = 0;
  for (const c of animationLifecycleCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++]; assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationLifecycleInput(c.pack, request)), row.requestSha256);
    assert.equal(sha(animationLifecycleExpected(c.pack, request)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
