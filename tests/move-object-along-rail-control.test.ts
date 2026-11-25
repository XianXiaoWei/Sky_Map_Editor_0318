import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { moveRailControlCases, prepareMoveRailControl, evaluateMoveRailControl } from '../tools/move-object-along-rail-control-cases';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('MoveObjectAlongRail original control prefix matches clock, network, smoothing and finish paths', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/move-object-along-rail-control-native.json.gz')).toString()), cases = moveRailControlCases();
  assert.equal(fixture.cases.length, cases.length);
  for (let i = 0; i < cases.length; i++) {
    const c = cases[i], row = fixture.cases[i]; assert.equal(c.label, row.input.label);
    assert.equal(sha(prepareMoveRailControl(c).b), row.inputSha256, c.label);
    assert.equal(sha(evaluateMoveRailControl(c, Buffer.from(row.expTrace, 'base64'))), row.nativeSha256, c.label);
  }
});
