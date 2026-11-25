import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-card-visibility-native.json';
import draws from './fixtures/cloud-card-draw-native.json';
import { cloudCardFrustumPlanes, cloudCardVisibilityPlan } from '../src/core/cloud-card-visibility';
import { cloudCardDrawPlan } from '../src/core/cloud-card-draw';
import type { CloudCardSphere } from '../src/core/cloud-card-layout';

function hex(values: number[]) {
  const bytes = Buffer.alloc(values.length*4); values.forEach((v,i)=>bytes.writeFloatLE(v,i*4)); return bytes.toString('hex');
}

test('CloudCard six planes, sphere candidates and all compacted fields match original instructions bit for bit', () => {
  for (const c of fixture.cases) {
    const actual = cloudCardVisibilityPlan(c.spheres as CloudCardSphere[], c.renderOrder, c.viewProjection, c.visibilityStatuses, c.enabled);
    assert.equal(hex(actual.planes.flat()), c.planesHex, c.name);
    assert.deepEqual(actual.candidateOrder, c.candidateOrder, c.name);
    assert.equal(hex(actual.candidateOrder.flatMap(i=>c.spheres[i])), c.candidateSpheresHex, c.name);
    assert.deepEqual(actual.visibleOrder, c.visibleOrder, c.name);
    assert.deepEqual(actual.visibleStatuses, c.visibleStatuses, c.name);
    assert.equal(hex(actual.visibleSpheres.flat()), c.visibleSpheresHex, c.name);
  }
});

test('CloudCard original visibility and optional distance draw queue compose without losing source/range identity', () => {
  const cases = draws.cases.filter(c=>c.name.startsWith('visibility-'));
  assert.ok(cases.length);
  for (const c of cases) {
    const visibility = fixture.cases.find(v=>c.name.startsWith(`visibility-${v.name}-`))!;
    assert.ok(visibility, c.name);
    const plan = cloudCardVisibilityPlan(visibility.spheres as CloudCardSphere[], visibility.renderOrder, visibility.viewProjection, visibility.visibilityStatuses, visibility.enabled);
    const actual = cloudCardDrawPlan(c.spheres as CloudCardSphere[], c.ranges, plan.visibleOrder, c.eye, c.sort);
    assert.deepEqual(actual.map(({distanceSquared,indexOffset,indexCount})=>({distanceSquared,indexOffset,indexCount})), c.draws, c.name);
  }
});

test('CloudCard visibility requires explicit classification, complete unique source order and finite float32 inputs', () => {
  const spheres: CloudCardSphere[] = [[0,0,0,1]], matrix = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  assert.throws(()=>cloudCardVisibilityPlan(spheres,[0],matrix,[],true));
  assert.throws(()=>cloudCardVisibilityPlan(spheres,[0],matrix,[-1],true));
  assert.throws(()=>cloudCardVisibilityPlan(spheres,[0],matrix,[2**32],true));
  assert.throws(()=>cloudCardVisibilityPlan(spheres,[1],matrix,[1],true));
  assert.throws(()=>cloudCardVisibilityPlan([...spheres,...spheres],[0,0],matrix,[1,1],true));
  assert.throws(()=>cloudCardVisibilityPlan(spheres,[0],[],[1],true));
  assert.throws(()=>cloudCardVisibilityPlan([[1e40,0,0,1]],[0],matrix,[1],true));
  assert.throws(()=>cloudCardVisibilityPlan([[0,0,0,-1]],[0],matrix,[1],true));
  assert.throws(()=>cloudCardFrustumPlanes(new Array(16).fill(NaN)));
  assert.deepEqual(cloudCardVisibilityPlan(spheres,[0],[],[1],false).planes, []);
  assert.deepEqual(cloudCardVisibilityPlan([],[],[],[],true).visibleOrder, []);
});
