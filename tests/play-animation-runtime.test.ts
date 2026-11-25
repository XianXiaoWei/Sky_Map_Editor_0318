import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { playAnimationCases, playAnimationRequest, playAnimationExpected } from '../tools/play-animation-cases';

const sha = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
test('PlayAnimation preserves the original live target iteration, playback branches, speed and completion in 107 native executions', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/play-animation-native.json.gz')).toString());
  const cases = playAnimationCases();
  assert.equal(cases.length, fixture.cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], row = fixture.cases[i];
    assert.equal(c.id, row.id);
    assert.equal(sha(playAnimationRequest(c)), row.requestSha256, c.id);
    assert.equal(sha(playAnimationExpected(c)), row.nativeSha256, c.id);
  }
});
