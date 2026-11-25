import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationUpdateCases, fishGroupAnimationUpdateCases, animationUpdateExpected, animationUpdateInput } from '../tools/resource-animation-update-cases';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');

test('Shared Animation.Update preserves consecutive controller, pose, cache, palette and effect results from the original executable', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-update-native.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  let at = 0, frames = 0;
  for (const c of animationUpdateCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++], result = animationUpdateExpected(c.pack, request, Buffer.from(row.powTrace, 'base64'));
    assert.equal(row.id, request.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationUpdateInput(c.pack, request, result.rsqrtInputs)), row.requestSha256);
    assert.equal(sha(result.output), row.nativeSha256, request.id);
    assert.deepEqual(result.frameOutputs.map(sha), row.frameSha256); frames += request.frames;
    const pairs = Buffer.from(row.rsqrtPairs, 'base64'); assert.equal(pairs.length, result.rsqrtInputs.length * 8);
    result.rsqrtInputs.forEach((input, i) => {
      assert.equal(input, pairs.readUInt32LE(i * 8));
      assert.equal(bits(1 / Math.fround(Math.sqrt(value(input)))), pairs.readUInt32LE(i * 8 + 4));
    });
  }
  assert.equal(at, fixture.cases.length); assert.equal(at, 3564); assert.equal(frames, 16632);
});

test('Five saved fish Disturb→SwimAround requests match 300 original shared-animation updates through action completion', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/fish-group-animation-update-native.json.gz')).toString());
  let at = 0;
  for (const c of fishGroupAnimationUpdateCases(data)) for (const request of c.requests) {
    const row = fixture.cases[at++], result = animationUpdateExpected(c.pack, request, Buffer.from(row.powTrace, 'base64'));
    assert.equal(row.id, request.id); assert.equal(sha(c.source.bytes), row.sourceSha256);
    assert.equal(sha(animationUpdateInput(c.pack, request, result.rsqrtInputs)), row.requestSha256);
    assert.equal(sha(result.output), row.nativeSha256, request.id); assert.deepEqual(result.frameOutputs.map(sha), row.frameSha256);
    assert.equal(result.frameOutputs.length, 60);
    // Original timed Disturb retires and compacts into its following Swim.
    assert.equal(result.m.read32(result.base + 12n), 2);
    const swimming = result.base + 0x4298n;
    assert.equal(result.m.read32(swimming + 0x24n), 0); assert.equal(result.m.read32(swimming + 0x28n), 60);
    // The original retains its delayed no-pack fallback after the live Swim.
    const fallback = swimming + 0x70n;
    assert.equal(result.m.read32(fallback + 12n) | 0, -1); assert.equal(result.m.read32(fallback + 0x14n), 0);
    const poseHash = (frame: Buffer) => {
      const nodesAt = 8 + 0x6300 + 0x1820, local: Buffer[] = [];
      for (let bone = 0; bone < c.pack.bones.length; bone++) {
        const node = nodesAt + (bone + 1) * 0xf0;
        local.push(frame.subarray(node, node + 12), frame.subarray(node + 0x20, node + 0x2c), frame.subarray(node + 0x30, node + 0x40));
      }
      return sha(Buffer.concat(local));
    };
    const poses = result.frameOutputs.map(poseHash);
    assert.notEqual(poses[0], poses[59]); assert.ok(new Set(poses).size > 20);
  }
  assert.equal(at, fixture.cases.length); assert.equal(at, 5);
});
