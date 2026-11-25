import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationFinalizeCases, animationFinalizeInput, animationFinalizeExpected } from '../tools/resource-animation-finalize-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original mirror maps, finalization and RegisterPack child ownership match native retained arenas', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-finalize-native.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  let at = 0;
  for (const c of animationFinalizeCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++]; assert.equal(request.id, row.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationFinalizeInput(c.pack, request, c.realList)), row.requestSha256);
    assert.equal(sha(animationFinalizeExpected(c.pack, request, c.realList)), row.nativeSha256, request.id);
  }
  assert.equal(at, fixture.cases.length);
});
