import test from 'node:test';
import assert from 'node:assert/strict';
import fixtures from './fixtures/cloud-card-layout-native.json';
import { cloudCardSphere, cloudCardOverlapGroups } from '../src/core/cloud-card-layout';

test('CloudCard world spheres and transitive overlap groups match original load instructions byte for byte', () => {
  for (const c of fixtures.cases) {
    const spheres = c.cards.map(card => {
      const mesh = { positions: Float32Array.from(card.positions), normals: new Float32Array(0), colors: new Float32Array(0), uvs: new Float32Array(0), indices: new Uint32Array(0), bakeVertexCount: 0 };
      const sphere = cloudCardSphere({ mesh, bounds: card.bounds, world: card.world });
      const bytes = Buffer.alloc(16);sphere.forEach((v, i) => bytes.writeFloatLE(v, i*4));
      assert.equal(bytes.toString('hex'), card.sphereHex, c.name);
      return sphere;
    });
    assert.deepEqual(Array.from(cloudCardOverlapGroups(spheres).groups), c.cards.map(card => card.group), c.name);
  }
});

test('CloudCard layout rejects invalid world spheres and the original 512-card capacity overflow', () => {
  assert.throws(() => cloudCardOverlapGroups([[0,0,0,-1]]));
  assert.throws(() => cloudCardOverlapGroups([[NaN,0,0,1]]));
  assert.throws(() => cloudCardOverlapGroups(Array.from({ length: 513 }, () => [0,0,0,1])));
});
