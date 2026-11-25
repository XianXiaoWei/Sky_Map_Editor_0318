import test from 'node:test';
import assert from 'node:assert/strict';
import sortFixtures from './fixtures/cloud-card-sort-native.json';
import indexFixtures from './fixtures/cloud-card-index-native.json';
import drawFixtures from './fixtures/cloud-card-draw-native.json';
import { cloudCardGroupOrder, cloudCardDistanceOrder } from '../src/core/cloud-card-sort';
import { cloudCardIndexLayout } from '../src/core/cloud-card-indices';
import { cloudCardDrawPlan } from '../src/core/cloud-card-draw';
import type { CloudCardSphere } from '../src/core/cloud-card-layout';

test('CloudCard group and distance ordering preserve the exact original equal-key permutations', () => {
  for (const c of sortFixtures.cases) {
    const actual = c.mode ? cloudCardDistanceOrder(c.keys) : cloudCardGroupOrder(c.keys);
    assert.deepEqual(Array.from(actual), c.order, c.name);
  }
});

test('CloudCard group sort, cumulative offsets and complete shared indices match original load output', () => {
  for (const c of indexFixtures.cases) {
    const sources = c.cards.map(card => ({ world: card.world, bounds: card.bounds,
      mesh: { positions: Float32Array.from(card.positions), indices: Uint32Array.from(card.indices), normals: new Float32Array(0), colors: new Float32Array(0), uvs: new Float32Array(0), bakeVertexCount: 0 } }));
    const layout = cloudCardIndexLayout(sources);
    assert.deepEqual(layout.ranges, c.ranges, c.name);
    assert.deepEqual(Array.from(layout.indices), c.indices, c.name);
  }
});

test('CloudCard distance math, optional ordering and GPU draw ranges match original queue instructions', () => {
  for (const c of drawFixtures.cases) {
    const actual = cloudCardDrawPlan(c.spheres as CloudCardSphere[], c.ranges, c.visibleOrder, c.eye, c.sort);
    assert.deepEqual(actual.map(({ distanceSquared, indexOffset, indexCount }) => ({ distanceSquared, indexOffset, indexCount })), c.draws, c.name);
  }
});

test('CloudCard plans reject missing/duplicate visible cards, invalid indices and non-finite sort keys', () => {
  assert.throws(() => cloudCardGroupOrder([-1]));
  assert.throws(() => cloudCardDistanceOrder([Infinity]));
  const spheres: CloudCardSphere[] = [[0,0,0,1]];
  const ranges = [{ sourceIndex: 0, group: 0, vertexOffset: 0, indexOffset: 0, vertexCount: 3, indexCount: 3 }];
  assert.throws(() => cloudCardDrawPlan(spheres, ranges, [0,0], [0,0,0], true));
  assert.throws(() => cloudCardDrawPlan(spheres, [], [0], [0,0,0], true));
  assert.throws(() => cloudCardDrawPlan(spheres, ranges, [0], [NaN,0,0], true));
  const source = { world: [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1], bounds: [0,0,0,1,1,1],
    mesh: { positions: new Float32Array(9), indices: Uint32Array.from([0,1,3]), normals: new Float32Array(0), colors: new Float32Array(0), uvs: new Float32Array(0), bakeVertexCount: 0 } };
  assert.throws(() => cloudCardIndexLayout([source]));
});
