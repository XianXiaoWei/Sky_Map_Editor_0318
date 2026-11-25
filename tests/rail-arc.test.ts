import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/rail-arc-native.json';
import {buildRailArcTable, railArcLength, railDistanceAtParameter, railParameterAtDistance} from '../src/core/rail-arc';

function restore(serialized: any) {
  const row = structuredClone(serialized);
  for (const p of row.negativeZeroPaths) {
    let owner = row;
    for (const key of p.slice(0, -1)) owner = owner[key];
    owner[p.at(-1)] = -0;
  }
  return row;
}
function bytes(values: number[]) {
  const result = Buffer.alloc(values.length * 4);
  values.forEach((value, i) => result.writeFloatLE(value, i * 4));
  return result;
}

test('original Rail arc intervals, complete tables and both lazy conversions match all 402 map rails', () => {
  assert.equal(fixture.cases.filter(row => row.level).length, 402);
  for (const serialized of fixture.cases) {
    const row = restore(serialized), native = Buffer.from(row.nativeHex, 'hex');
    const table = buildRailArcTable(row.cache, row.subdivisions, row.size);
    const label = `${row.level ?? 'synthetic'} #${row.nodeId ?? ''}`;
    assert.deepEqual(bytes([...table.pairs.flat(), table.totalLength]), native.subarray(0, row.size * 8 + 4), label);
    const results = [railArcLength(row.cache, row.from, row.to, row.subdivisions), railDistanceAtParameter(table, row.cache, row.parameter)];
    const convert = (bit: number) => {
      if (row.skipped & bit) {
        assert.throws(() => railParameterAtDistance(table, row.cache, row.distance), /查询越出弧长表/, label);
        return 0; // Native harness omits unsafe scan/diagnostic, records this sentinel.
      }
      return railParameterAtDistance(table, row.cache, row.distance);
    };
    results.push(convert(1));
    table.dirty = row.dirty;
    table.totalLength = row.oldLength;
    results.push(convert(2));
    table.dirty = row.dirty;
    table.totalLength = row.oldLength;
    results.push(railDistanceAtParameter(table, row.cache, row.parameter));
    const offset = row.size * 8 + 4;
    assert.deepEqual(bytes(results), native.subarray(offset, offset + 20), label);
    assert.deepEqual(bytes(table.pairs.flat()), native.subarray(offset + 20, offset + 20 + row.size * 8), label);
    const state = offset + 20 + row.size * 8;
    assert.equal(table.subdivisions, native.readUInt32LE(state), label);
    assert.deepEqual(bytes([table.totalLength]), native.subarray(state + 4, state + 8), label);
    assert.equal(Number(table.dirty), native.readUInt32LE(state + 8), label);
  }
});

test('Rail arc preserves negative zero and explicitly rejects unsupported query domains', () => {
  const row = restore(fixture.cases.find(row => row.parameter === 0 && row.negativeZeroPaths.some(p => p.join('.') === 'parameter')));
  const table = buildRailArcTable(row.cache, row.subdivisions, row.size);
  assert.ok(Object.is(railDistanceAtParameter(table, row.cache, -0), -0));
  for (const t of [-.1, 1.1, NaN, Infinity]) assert.throws(() => railDistanceAtParameter(table, row.cache, t));
  assert.throws(() => railParameterAtDistance(table, row.cache, Infinity));
  assert.throws(() => buildRailArcTable(row.cache, 16, 1));
  assert.throws(() => railArcLength(row.cache, 0, 1, -1));
});
