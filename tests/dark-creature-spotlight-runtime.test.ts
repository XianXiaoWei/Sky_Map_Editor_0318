import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { darkSpotlightCases, prepareDarkSpotlight, evaluateDarkSpotlight } from '../tools/dark-creature-spotlight-cases';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('DarkCreature original eye and searchlight phases match projection, target, color, radius and expiration', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/dark-creature-spotlight-native.json.gz')).toString()), cases = darkSpotlightCases();
  assert.equal(fixture.cases.length, cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], row = fixture.cases[i]; assert.equal(c.label, row.input.label);
    assert.equal(sha(prepareDarkSpotlight(c).b), row.inputSha256, c.label);
    assert.equal(sha(evaluateDarkSpotlight(c, row.nativeMath, fixture.nativeArithmetic)), row.nativeSha256, c.label);
  }
});
