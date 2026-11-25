import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationLoopCases, animationLoopRequest, animationLoopExpected } from '../tools/resource-animation-loop-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original loop quaternion dot order, partial ranges and spare mask bits match all 1260 native masks', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-loops-native.json.gz')).toString()); let at = 0;
  for (const c of animationLoopCases(data)) for (let i = 0; i < c.requests.length; i++) {
    const row = fixture.cases[at++]; assert.equal(row.resource, c.source.id); assert.equal(row.request, i); assert.equal(sha(c.source.bytes), row.sourceSha256); assert.equal(sha(animationLoopRequest(c.requests[i])), row.requestSha256); assert.equal(sha(animationLoopExpected(c.pack, c.requests[i])), row.nativeSha256);
  }
  assert.equal(at, fixture.cases.length);
});
