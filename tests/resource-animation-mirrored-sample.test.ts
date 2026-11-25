import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationSampleRequest } from '../tools/resource-animation-sample-cases';
import { mirroredAnimationSamplingCases, prepareMirroredAnimationSampleOwner, mirroredAnimationSampleExpected } from '../tools/resource-animation-mirrored-sample-cases';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Original generated mirror maps and mirrored Pack.Sample match native static, dynamic and loop seam poses', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-mirrored-samples-native.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  let at = 0;
  for (const c of mirroredAnimationSamplingCases(data)) {
    const owner = prepareMirroredAnimationSampleOwner(c.pack, c.additive);
    for (let sample = 0; sample < c.samples.length; sample++) {
      const row = fixture.cases[at++]; assert.equal(c.source.id, row.resource); assert.equal(c.additive, row.additive); assert.equal(sample, row.sample);
      assert.equal(sha(c.source.bytes), row.sourceSha256); assert.equal(sha(animationSampleRequest(c.samples[sample])), row.requestSha256);
      assert.equal(sha(mirroredAnimationSampleExpected(c.pack, c.samples[sample], owner)), row.nativeSha256, `${c.source.id}:${c.additive}:${sample}`);
    }
  }
  assert.equal(at, fixture.cases.length);
});
