import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/camera-jitter-native.json';
import { cameraSampling, jitterViewProjection, temporalGaussianKernel, correctPreviousViewProjection } from '../src/core/camera-sampling';

test('Original camera sampling, Gaussian weights, history writes and matrix multiply match native bytes', () => {
  const bytes = (values: number[]) => { const out = Buffer.alloc(values.length * 4); values.forEach((v, i) => out.writeFloatLE(v, i * 4)); return out; };
  assert.equal(fixture.cases.length, 512);
  for (const c of fixture.cases) {
    const s = cameraSampling(c.frame, c.size[0], c.size[1], c.previous, c.centeredProjection);
    const native = Buffer.from(c.nativeHex, 'hex');
    assert.deepEqual(bytes([...s.u_aaCornerUvs0, ...s.u_aaCornerUvs1, ...s.u_aaCornerWeights, s.u_aaCenterWeight]), native.subarray(0, 52));
    assert.deepEqual(bytes([...s.jitter, 0, 0, ...s.jitterHalf, 0, 0, ...s.jitterOld, 0, 0, ...s.jitterHalfOld, 0, 0]), native.subarray(52, 116));
    assert.deepEqual(bytes([...s.projectionShift, ...s.previousProjectionShift]), native.subarray(116, 132));
    assert.deepEqual(bytes(s.arguments.flatMap((v, i) => [v, s.rawWeights[i]])), native.subarray(132, 204));
    assert.deepEqual(bytes(jitterViewProjection(c.matrix, s.projectionShift)), native.subarray(204, 268));
    assert.deepEqual(bytes(correctPreviousViewProjection(c.matrix, s.projectionShift, s.previousProjectionShift)), native.subarray(268));
  }
  assert.throws(() => cameraSampling(-1, 320, 180));
  assert.throws(() => cameraSampling(0, 0, 180));
  assert.throws(() => temporalGaussianKernel(320, 180, [1, 0]));
});
