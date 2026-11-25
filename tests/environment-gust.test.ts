import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/environment-gust-native.json';
import {stepEnvironmentGust, type GustMath} from '../src/core/environment-gust';

test('Global wind noise, ambient phases, override and smoothing match original instruction span', () => {
  for (const row of fixture.cases) {
    let cursor = 0;
    const scalar = (x: number) => {
      assert.equal(x, row.mathTrace[cursor++], 'native transcendental argument');
      return row.mathTrace[cursor++];
    };
    const math: GustMath = {cos: scalar, exp: scalar, sincos: x => [scalar(x), row.mathTrace[cursor++]]};
    const result = stepEnvironmentGust(row.state, row.input, math), bytes = Buffer.alloc(36);
    [result.ambient, result.phase0, result.phase1, ...result.smoothedWind, ...result.globalWind].forEach((v, i) => bytes.writeFloatLE(v, i * 4));
    assert.equal(bytes.toString('hex'), row.nativeHex);
    assert.equal(cursor, row.mathTrace.length);
  }
});
test('Explicit SetWind snapshot bypasses noise phases and rejects unsupported input', () => {
  const state = {ambient: 2, phase0: 3, phase1: 4, smoothedWind: [1, 2, 3]};
  const input = {time: 20, scaledDelta: .01, ambientTarget: 8.5, boundaryForce: [0, 0, 0], overrideWind: [0, 1, 0]};
  const result = stepEnvironmentGust(state, input);
  assert.equal(result.ambient, state.ambient);
  assert.equal(result.phase0, state.phase0);
  assert.equal(result.phase1, state.phase1);
  assert.notDeepEqual(result.smoothedWind, state.smoothedWind);
  assert.deepEqual(state.smoothedWind, [1, 2, 3]);
  assert.throws(() => stepEnvironmentGust(state, {...input, time: -1}));
  assert.throws(() => stepEnvironmentGust(state, {...input, overrideWind: []}));
});
