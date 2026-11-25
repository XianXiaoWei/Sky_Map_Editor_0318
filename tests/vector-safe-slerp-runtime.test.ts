import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { vectorSafeSlerpCases, safeSlerpInput, evaluateSafeSlerp } from '../tools/vector-safe-slerp-cases';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('SafeSlerp whole original function matches aliases, opposing axes, math calls and XYZ/W bytes', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/vector-safe-slerp-native.json.gz')).toString()), cases = vectorSafeSlerpCases();
  assert.equal(fixture.cases.length, cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], row = fixture.cases[i]; assert.equal(c.label, row.input.label);
    assert.equal(sha(safeSlerpInput(c)), row.inputSha256, c.label);
    assert.equal(sha(evaluateSafeSlerp(c, Buffer.from(row.mathTrace, 'base64'))), row.nativeSha256, c.label);
  }
});
