import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationAdditiveCases, animationAdditiveExpected, animationAdditiveInput } from '../tools/resource-animation-additive-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Additive clocks, linear SIMD scales, powf tails and ordered delta quaternions match 8910 original updates', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-additive-native.json.gz')).toString()); let at = 0;
  for (const c of animationAdditiveCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++], result = animationAdditiveExpected(c.pack, request, Buffer.from(row.powTrace, 'base64'));
    assert.equal(row.id, request.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationAdditiveInput(c.pack, request, result.rsqrtInputs)), row.requestSha256);
    assert.equal(sha(result.output), row.nativeSha256, request.id);
    const pairs = Buffer.from(row.rsqrtPairs, 'base64'); assert.equal(pairs.length, result.rsqrtInputs.length * 8);
    result.rsqrtInputs.forEach((input, i) => assert.equal(input, pairs.readUInt32LE(i * 8)));
  }
  assert.equal(at, fixture.cases.length);
});
