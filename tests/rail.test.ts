import test from 'node:test';
import assert from 'node:assert/strict';
import railFixture from './fixtures/rail-native.json';
import cacheFixture from './fixtures/rail-cache-native.json';
import windFixture from './fixtures/wind-rail-native.json';
import {buildRailCache, railMarkerTransform, RAIL_MARKER_OBB, railClosestPoint, railPosition, railScalar, railTransform, railSegmentDistanceSquared, type RailCache, type RailMath} from '../src/core/rail';
import {sampleWind} from '../src/core/environment-wind';

function restore(serialized: any) {
  const row = structuredClone(serialized);
  for (const p of row.negativeZeroPaths) {let owner = row;for (const k of p.slice(0, -1)) owner = owner[k];owner[p.at(-1)] = -0;}
  return row;
}
function bytes(values: number[]) {const b = Buffer.alloc(values.length * 4);values.forEach((v, i) => b.writeFloatLE(v, i * 4));return b.toString('hex');}
test('original Marker getters and Rail caches match all 402 maps rails and boundary controls', () => {
  for (const serialized of cacheFixture.cases) {
    const row = restore(serialized), worlds = row.points.map(railMarkerTransform);
    let index = 0;
    const cache = buildRailCache(worlds.map((world: number[]) => ({world, obb: RAIL_MARKER_OBB})), row.transform, row.looped, {atan2(y, x) {
      const trace = row.native[index++].trace;assert.ok(Object.is(y, trace[0]));assert.ok(Object.is(x, trace[1]));return trace[2];
    }});
    row.native.forEach((n: any, i: number) => assert.equal(bytes([...worlds[i], ...cache.positions[i], ...cache.scales.map(v => v[i]), cache.rolls[i]]), n.nativeHex, `cache ${row.level ?? 'synthetic'} #${row.nodeId ?? ''} point ${i}`));
  }
});
test('original Rail spline, closest point and transform match float32 corpus', () => {
  for (const serialized of railFixture.cases) {
    const row = restore(serialized), cache: RailCache = row.cache, closest = railClosestPoint(cache, row.eye);
    const math: RailMath = {sincos(a) {assert.equal(a, row.trace[0]);return [row.trace[1], row.trace[2]];}};
    const actual = bytes([closest.parameter, ...closest.position, ...railPosition(cache, row.parameter), 0,
      ...[...cache.scales, cache.rolls].map(v => railScalar(v, cache.looped, row.parameter)),
      ...railTransform(cache, row.parameter, math), railSegmentDistanceSquared(row.eye, cache.positions[0], cache.positions[1])]);
    assert.equal(actual, row.nativeHex, `Rail ${row.level ?? 'synthetic'} #${row.nodeId ?? ''} t=${row.parameter}`);
  }
});
test('original Wind -> Rail nearest point -> Rail transform chain matches native without callbacks', () => {
  for (const serialized of windFixture.cases) {
    const row = restore(serialized), r = sampleWind(row.wind, row.position, {sincos(a) {assert.equal(a, row.trace[0]);return [row.trace[1], row.trace[2]];}});
    assert.equal(bytes([...r.vector, r.weight]), row.nativeHex);
  }
});
test('Rail exposes unsupported original degenerate and out-of-range cache cases', () => {
  assert.throws(() => railScalar([1], false, .5));
  assert.throws(() => railScalar([1, 2], true, -1e-9), /越出缓存/);
  assert.throws(() => buildRailCache([], [], false));
  const cache: RailCache = {positions: [[0, 0, 0], [0, 0, 0]], scales: [[1, 1], [1, 1], [1, 1]], rolls: [0, 0], looped: false,
    transform: [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]};
  assert.throws(() => railClosestPoint(cache, [0, 0, 0]), /退化线段/);
  // Original disabled Wind does not evaluate a malformed/degenerate Rail.
  assert.deepEqual(sampleWind({transform: cache.transform, enabled: false, timer: 0, fadeTime: 0, fadeDist: 0, intensity: 1, order: 0, rail: cache}, [0, 0, 0]), {vector: [0, 0, 0], weight: 0});
});
