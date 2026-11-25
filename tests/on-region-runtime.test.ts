import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { onRegionCases, prepareOnRegion, evaluateOnRegion } from '../tools/on-region-cases';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Whole OnRegion and PlayAnimation placement match original native arena and ordered services', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/on-region-native.json.gz')).toString()), cases = onRegionCases();
  assert.equal(fixture.cases.length, cases.length);
  for (let i = 0; i < cases.length; i++) { const c = cases[i], row = fixture.cases[i]; assert.equal(c.label, row.input.label); assert.equal(sha(prepareOnRegion(c).b), row.inputSha256, c.label); assert.equal(sha(evaluateOnRegion(c)), row.nativeSha256, c.label); }
});
