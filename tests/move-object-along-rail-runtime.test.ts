import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { moveObjectAlongRailCases, prepareMoveObjectAlongRail, evaluateMoveObjectAlongRail } from '../tools/move-object-along-rail-cases';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('MoveObjectAlongRail whole lifecycle matches original arena and ordered boundary calls', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/move-object-along-rail-native.json.gz')).toString()), cases = moveObjectAlongRailCases();
  assert.equal(fixture.cases.length, cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], row = fixture.cases[i]; assert.equal(c.label, row.input.label); assert.equal(sha(prepareMoveObjectAlongRail(c).b), row.inputSha256, c.label); assert.equal(sha(evaluateMoveObjectAlongRail(c)), row.nativeSha256, c.label);
  }
});
