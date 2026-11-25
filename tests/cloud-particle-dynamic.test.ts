import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-particle-pack-native.json';
import lifeFixture from './fixtures/cloud-particle-life-native.json';
import sortFixture from './fixtures/cloud-particle-sort-native.json';
import {cloudParticlePackedInstances, cloudParticleDrawInstances, stepCloudParticleLife} from '../src/core/cloud-particle-dynamic';
import {cloudParticleDepthOrder} from '../src/core/cloud-card-sort';

test('Cloud particles match original 32-byte instance and depth bytes after physics, including zero-size boundaries', () => {
  for (const c of fixture.cases) {
    const result = cloudParticlePackedInstances(c.particles, c.camera, c.time, new Uint8Array(c.particles.length * 32).fill(0xa5));
    assert.equal(Buffer.from(result.instances).toString('hex'), c.nativeHex, c.name);
    assert.equal(Buffer.from(result.depths.buffer).toString('hex'), c.nativeDepthHex, c.name);
    assert.ok(result.instances.filter((_, i) => i % 32 === 31).every(v => v === 0xa5));
  }
});

test('Cloud particle packing checks capacity before allocation and preserves the original unwritten byte', () => {
  const c = fixture.cases[0];
  assert.throws(() => cloudParticlePackedInstances(Array(1025).fill(c.particles[0]), c.camera, c.time));
  assert.throws(() => cloudParticlePackedInstances(c.particles, c.camera, c.time, new Uint8Array(31)));
  assert.throws(() => cloudParticlePackedInstances([{...c.particles[0], vector: [Infinity, 0, 0]}], c.camera, c.time));
  assert.equal(cloudParticlePackedInstances([], c.camera, c.time).instances.length, 0);
  const target = new Uint8Array(32).fill(17), output = cloudParticlePackedInstances(c.particles, c.camera, c.time, target);
  assert.equal(output.instances, target);
  assert.equal(target[31], 17);
});

test('Cloud particle life counts expired ring slots and advances head without filtering or compacting the survivors', () => {
  for (const c of lifeFixture.cases) {
    const result = stepCloudParticleLife({...c, life: Float32Array.from(c.life)}, c.delta), actual = Buffer.alloc(4104);
    actual.writeUInt32LE(result.head); actual.writeUInt32LE(result.count, 4); Buffer.from(result.life.buffer).copy(actual, 8);
    assert.equal(actual.toString('hex'), c.nativeHex);
  }
  const life = new Float32Array(1024).fill(99);
  life[1023] = 1; life[0] = 0; life[1] = .5;
  const result = stepCloudParticleLife({life, head: 1023, count: 3}, .15);
  assert.equal(result.head, 0); assert.equal(result.count, 2);
  assert.ok(result.life[0] < 0); // Native queue invariant; no invented filter.
  assert.equal(life[0], 0); assert.equal(result.life[2], 99);
  assert.equal(stepCloudParticleLife({life, head: 1023, count: 0}, .1).head, 1023);
  assert.throws(() => stepCloudParticleLife({life, head: 1024, count: 0}, .1));
});

test('Cloud particle depth order preserves native equal-key permutations and the 1000/1024 median branch', () => {
  for (const c of sortFixture.cases) assert.equal(Buffer.from(cloudParticleDepthOrder(c.depths).buffer).toString('hex'), c.nativeHex, c.name);
  assert.throws(() => cloudParticleDepthOrder([Infinity]));
  assert.throws(() => cloudParticleDepthOrder(new Float32Array(1025)));
  const c = fixture.cases[3], packed = cloudParticlePackedInstances(c.particles, c.camera, c.time), draw = cloudParticleDrawInstances(c.particles, c.camera, c.time);
  draw.order.forEach((source, destination) => assert.deepEqual(draw.instances.slice(destination * 32, destination * 32 + 32), packed.instances.slice(source * 32, source * 32 + 32)));
});
