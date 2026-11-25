import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { gunzipSync } from 'node:zlib';
import { evaluateLevelDataBakeCase } from '../tools/level-data-bake-cases';
import { loadEditorLevelDataModelBakes, bindEditorLoadedModelBake, editorCloudCardBakeLighting } from '../src/core/level-data-bake-adapter';
import { loadLevelDataBakeLod } from '../src/core/level-data-bake-runtime';
import { MeshesDocument } from '../src/core/meshes';
import { readResourceMesh } from '../src/core/resources';
import { bindBake } from '../src/core/baking';
import { ObjectsDocument } from '../src/core/objects';
import { cloudCardLevelLayout, cloudCardLevelDynamic } from '../src/core/cloud-card-level';

test('GUID invalidation, LOD clearing, complete expansion and heap/serializer ordering match original instruction fixtures', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/level-data-bake-native.json.gz')).toString());
  for (const c of fixture.cases) assert.deepEqual(evaluateLevelDataBakeCase(c.input), Buffer.from(c.native, 'base64'), c.input.label);
});
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
test('Loaded table chooses first GUID regardless of name and preserves its source Mesh remap; first-LOD mismatch rejects', () => {
  const doc = new MeshesDocument(fs.readFileSync(`${data}/Levels/Dawn/BstBaked.meshes`));
  const cube = readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/Cube.mesh`));
  const original = doc.bakes.find(b => b.name === 'Cube')!;
  const duplicate = { ...original, id: 'duplicate', name: 'different-source-mesh' };
  doc.bakes = [original, duplicate];
  const lookup = loadEditorLevelDataModelBakes(doc, () => cube);
  const result = bindEditorLoadedModelBake(doc, lookup, { ...cube, name: 'different-requested-mesh', levels: [{ ...cube.levels[0], bakeRemap: Uint32Array.from(cube.levels[0].bakeRemap!).reverse() }, ...cube.levels.slice(1)] }, original.guid)!;
  assert.equal(result.stream.id, original.id);
  assert.deepEqual(result.bound, bindBake(cube.levels[0], doc.bakeData(original.id, 0)));
  assert.equal(bindEditorLoadedModelBake(doc, lookup, { ...cube, levels: [{ ...cube.levels[0], positions: new Float32Array(3) }] }, original.guid), null);
  const missing = loadEditorLevelDataModelBakes(doc, () => null).handle!.resource!.records;
  assert.ok(missing.every(r => r.guid === 0xffffffff && r.serializedGuid === original.guid));
  assert.ok(missing.every(r => r.lods.every(l => l.lighting === null && l.extra === null && l.extraByteCount === 0)));
});
test('Prepared loader propagates malformed resources and unsupported original unsafe inputs', () => {
  const doc = new MeshesDocument(fs.readFileSync(`${data}/Levels/Dawn/BstBaked.meshes`));
  assert.throws(() => loadEditorLevelDataModelBakes(doc, () => { throw new Error('malformed resource'); }), /malformed/);
  let read = 0;
  assert.throws(() => loadLevelDataBakeLod(true, null, { readUint32: () => { read++; return 0; }, readBytes: () => assert.fail(), allocate: () => { assert.fail(); }, freeTemporary: () => assert.fail() }), /uniform/);
  assert.equal(read, 2);
});

test('Actual CloudCard GUID bake enters its dynamic GPU stream as the first eight bytes per original remapped vertex', () => {
  const doc = new MeshesDocument(fs.readFileSync(`${data}/Levels/Dawn/BstBaked.meshes`));
  const nodes = new ObjectsDocument(fs.readFileSync(`${data}/Levels/Dawn/Objects.level.bin`)).nodes;
  const resources = new Map<string, ReturnType<typeof readResourceMesh>>();
  const resource = (name: string) => { if (!resources.has(name)) resources.set(name, readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`))); return resources.get(name)!; };
  const source = loadEditorLevelDataModelBakes(doc, name => { try { return resource(name); } catch (e) { if ((e as NodeJS.ErrnoException).code === 'ENOENT') return null; throw e; } });
  const bake = editorCloudCardBakeLighting(nodes, source, resource), layout = cloudCardLevelLayout(nodes, resource);
  assert.ok(bake.bakedCards > 0); assert.equal(bake.rejectedNodeIds.length, 0);
  const fallback = Uint8Array.from([128,128,128,255,128,255,128,0]);
  const rendered = cloudCardLevelDynamic(nodes, resource, [0,100,0], Array.from(layout.renderOrder), true, fallback, bake.lighting);
  for (const range of layout.ranges) {
    const card = layout.cards[range.sourceIndex], light = bake.lighting[card.nodeId];
    for (let v = 0; v < range.vertexCount; v++) assert.deepEqual(rendered.vertices.subarray((range.vertexOffset + v) * 28 + 20, (range.vertexOffset + v) * 28 + 28), light.subarray(v * 12, v * 12 + 8));
  }
});
