import test from 'node:test';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import snapshot from '../src/core/original-animation-sequence-registry.json';
import { loadOriginalAnimationSequenceRegistry } from '../src/core/animation-sequence-registry';
import { PreparedEnvironmentObjectState } from '../src/core/environment-object-state';
import { resourceAnimationNameHash } from '../src/core/resource-animation-list';
test('Complete native initialized registry relocates all fields, names and shared records without changing order', () => {
  const state = new PreparedEnvironmentObjectState([]), m = state.runtimeMemory, registry = loadOriginalAnimationSequenceRegistry(m, n => state.allocate(n)), identities = new Map<string, bigint>(), raw: Buffer[] = [];
  const u32 = (n: number) => { const b = Buffer.alloc(4); b.writeUInt32LE(n); return b; }, address = (n: string) => { const b = Buffer.alloc(8); b.writeBigUInt64LE(BigInt(n)); return b; }, text = (n: string) => { const b = Buffer.from(n); return Buffer.concat([u32(b.length), b]); };
  const identity = (key: string, p: bigint) => { if (identities.has(key)) assert.equal(p, identities.get(key)); else identities.set(key, p); };
  assert.equal(m.read32(registry), 1201); raw.push(u32(1201));
  for (let i = 0; i < snapshot.records.length; i++) {
    const row = snapshot.records[i], native = Buffer.from(row.imageHex, 'hex'), p = m.read64(registry + 8n + BigInt(i * 8)), actual = Buffer.from(m.bytes(p, 0xa8)); identity(row.address, p);
    assert.equal(m.string(m.read64(p)), row.name); assert.equal(m.read64(p + 8n), BigInt('0x' + resourceAnimationNameHash(row.name)));
    actual.writeBigUInt64LE(native.readBigUInt64LE(), 0); raw.push(address(row.address), native, text(row.name));
    for (let j = 0; j < row.steps.length; j++) {
      const stepRow = row.steps[j], nativeStep = Buffer.from(stepRow.imageHex, 'hex'), step = m.read64(p + 0x20n + BigInt(j * 8)), actualStep = Buffer.from(m.bytes(step, 0x28)); identity(stepRow.address, step);
      assert.equal(m.string(m.read64(step + 8n)), stepRow.name); assert.equal(m.read64(step + 16n), BigInt('0x' + resourceAnimationNameHash(stepRow.name)));
      actualStep.writeBigUInt64LE(nativeStep.readBigUInt64LE(8), 8); assert.deepEqual(actualStep, nativeStep);
      actual.writeBigUInt64LE(BigInt(stepRow.address), 0x20 + j * 8); raw.push(address(stepRow.address), nativeStep, text(stepRow.name));
    }
    assert.deepEqual(actual, native);
  }
  const captured = Buffer.concat(raw); assert.equal(captured.length, snapshot.nativeOutputBytes); assert.equal(crypto.createHash('sha256').update(captured).digest('hex'), snapshot.nativeOutputSha256);
  assert.equal(snapshot.records[488].name, 'SwimAround'); assert.deepEqual(snapshot.records[489].steps.map(s => s.name), ['DayHubFishDisturb', 'DayHubFishSwimLoop']); state.dispose();
});
