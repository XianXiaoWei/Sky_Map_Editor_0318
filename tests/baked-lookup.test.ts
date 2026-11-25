import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/baked-lookup-native.json';
import {findLoadedBake, beamoBakeCompatible, firstLodBakeCompatible} from '../src/core/baked-lookup';

test('loaded bake GUID lookup and three original acceptance slices match supplied map snapshots', () => {
  assert.equal(fixture.cases.filter(c => !c.level.startsWith('synthetic-')).length, 33);
  for (const group of fixture.cases) for (const query of group.queries) {
    const source = {handle: query.handle ? {resource: query.resource ? {loadIndex: query.loadIndex, records: group.records} : null} : null};
    const result = findLoadedBake(source, query.guid);
    const label = `${group.level} GUID ${query.guid}`;
    assert.equal(result !== null, query.native.found, label);
    assert.equal(result === null ? 0xffffffff : group.records.indexOf(result), query.native.index, label);
    assert.equal(beamoBakeCompatible(result, query.meshLodCount), query.native.beamoCompatible, label);
    assert.equal(firstLodBakeCompatible(result, query.meshFirstLodVertexCount), query.native.cloudCardCompatible, label);
    assert.equal(firstLodBakeCompatible(result, query.meshFirstLodVertexCount), query.native.modelCompatible, label);
  }
});

test('bake lookup retains first GUID match across names and exposes unsupported input states', () => {
  const group = fixture.cases.find(c => c.level === 'synthetic-2')!;
  const source = {handle: {resource: {loadIndex: 0, records: group.records}}};
  assert.equal(findLoadedBake(source, 7), group.records[0]);
  for (const guid of [-1, 2 ** 32, .5, NaN]) assert.throws(() => findLoadedBake(source, guid), /uint32/);
  assert.throws(() => findLoadedBake({handle: {resource: {loadIndex: 2 ** 31, records: []}}}, 0), /int32/);
  assert.throws(() => firstLodBakeCompatible({guid: 0, lods: []}, 0), /首个已展开 LOD/);
});
