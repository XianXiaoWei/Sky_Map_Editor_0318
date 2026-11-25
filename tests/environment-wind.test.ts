import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/environment-wind-native.json';
import {sampleWind, sampleEnvironmentWind, windBoxDistance, advanceWindTimer, type EnvironmentWindInput} from '../src/core/environment-wind';

test('Wind spatial/fade/direction and original field priority/force selection match native corpus', () => {
  for (const serialized of fixture.cases as any[]) {
    const row = structuredClone(serialized);
    for (const path of row.negativeZeroPaths) {
      let owner = row; for (const key of path.slice(0, -1)) owner = owner[key];
      owner[path.at(-1)] = -0;
    }
    let result;
    if (row.mode === 0) result = sampleWind(row.wind, row.position);
    else if (row.mode === 1) {
      const input: EnvironmentWindInput = {globalWind: row.globalWind, winds: row.winds,
        forces: Array.from({length: 32}, () => ({a: {enabled: false, vector: [0, 0, 0]}, b: {enabled: false, vector: [0, 0, 0]}}))};
      for (const force of row.forces) (input.forces[force.slot] as any)[force.side] = force;
      result = {vector: sampleEnvironmentWind(input, row.position), weight: 0};
    } else result = {vector: [advanceWindTimer(row.timer, row.fadeTime, row.enabled, row.delta), 0, 0], weight: 0};
    const bytes = Buffer.alloc(16);
    [...result.vector, result.weight].forEach((v, i) => bytes.writeFloatLE(v, i * 4));
    assert.equal(bytes.toString('hex'), row.nativeHex, `Wind mode ${row.mode}, map ${row.level ?? 'synthetic'}`);
  }
});
test('Wind refuses incomplete runtime inputs and preserves native boundary inclusion', () => {
  const transform = [2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1];
  const w = {transform, enabled: true, fadeDist: 0, fadeTime: 0, timer: 0, intensity: 2, order: 0};
  assert.equal(sampleWind(w, [1, 0, 0]).weight, 1);
  assert.equal(sampleWind(w, [1.0001, 0, 0]).weight, 0);
  assert.equal(windBoxDistance(transform, [2, 0, 0]), 0);
  assert.throws(() => sampleWind({...w, transform: []}, [0, 0, 0]));
  assert.throws(() => sampleEnvironmentWind({winds: [], globalWind: [0, 0, 0], forces: []}, [0, 0, 0]));
});
