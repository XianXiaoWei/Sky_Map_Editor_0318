import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationClockCases, animationClockRequest, animationClockExpected } from '../tools/resource-animation-clock-cases';
import { updateResourceAnimationClock } from '../src/core/resource-animation-clock';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('All 4320 complete request clock records match original machine code with recorded powf callouts', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-clock-native.json.gz')).toString()), cases = animationClockCases(); assert.equal(cases.length, fixture.cases.length);
  cases.forEach((c, i) => { const row = fixture.cases[i]; assert.equal(row.id, c.id); assert.equal(sha(animationClockRequest(c)), row.requestSha256); assert.equal(sha(animationClockExpected(c, Buffer.from(row.powTrace, 'base64'))), row.nativeSha256, c.id); });
});
test('Clock preserves its caller record and requires arithmetic only for consumed nonlinear easing', () => {
  const c = animationClockCases().find(c => c.id.startsWith('40:0:0:0:'))!, input = c.state.slice(); new DataView(input.buffer).setFloat32(0x20, 30, true);
  const original = input.slice(), result = updateResourceAnimationClock(input, 1 / 30, 0);
  assert.deepEqual(input, original); const view = new DataView(result.state.buffer), before = new DataView(original.buffer), start = before.getInt32(0x24, true);
  const buffer = Buffer.from(original); updateResourceAnimationClock(buffer, 1 / 30, 0); assert.deepEqual(buffer, Buffer.from(original));
  assert.equal(view.getFloat32(0x1c, true), Math.fround(1 / 40)); assert.equal(view.getInt32(0x38, true), start); assert.equal(view.getInt32(0x3c, true), start + 1); assert.equal(view.getInt32(0x40, true), start + 2); assert.equal(view.getInt32(0x44, true), start + 3);
  assert.equal(view.getInt32(0x34, true), before.getInt32(0x3c, true));
  const eased = original.slice(); new DataView(eased.buffer).setInt32(0x2c, 3, true); assert.throws(() => updateResourceAnimationClock(eased, 1 / 30, 0), /powf/);
  const single = eased.slice(); new DataView(single.buffer).setInt32(0x28, 1, true); assert.doesNotThrow(() => updateResourceAnimationClock(single, 1 / 30, 0));
  assert.throws(() => updateResourceAnimationClock(original.slice(0, 100), 0.1, 0), /输入无效/); assert.throws(() => updateResourceAnimationClock(original, Infinity, 0), /输入无效/);
});
