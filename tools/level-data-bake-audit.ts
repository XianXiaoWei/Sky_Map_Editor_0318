import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import { MeshesDocument } from '../src/core/meshes';
import { ObjectsDocument } from '../src/core/objects';
import { readResourceMesh } from '../src/core/resources';
import { bindBake } from '../src/core/baking';
import { findLoadedBake, firstLodBakeCompatible, beamoBakeCompatible } from '../src/core/baked-lookup';
import { loadEditorLevelDataModelBakes, editorCloudCardBakeLighting } from '../src/core/level-data-bake-adapter';
import { objectScalar, objectText } from '../src/core/model-material-index';
import { selectEditorBeamoBake } from '../src/core/beamo-bake-adapter';

const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const cache = new Map<string, ReturnType<typeof readResourceMesh> | null>();
const sha = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const resolve = (name: string) => {
  if (!cache.has(name)) { const file = path.join(data, 'Meshes/Bin', name + '.mesh'); cache.set(name, fs.existsSync(file) ? readResourceMesh(fs.readFileSync(file)) : null); }
  return cache.get(name)!;
};
const names = ['LevelMesh', 'Beamo', 'BeamoDecal', 'CloudCard'];
const summary = { maps: 0, records: 0, invalidatedRecords: 0, lods: 0, loadedLods: 0, clearedLods: 0, unchangedLightingLods: 0, cloudCardsUsingOriginalBake: 0 };
const classes = Object.fromEntries(names.map(name => [name, { instances: 0, resourcePresent: 0, serializedAssociations: 0, loadedGuidFound: 0, originalAcceptanceSatisfied: 0, loadedLightingReady: 0, lodCountOnlySatisfied:0, originalAcceptanceRule: name === 'BeamoDecal' ? 'LOD count + first two available LOD extra pointers/render counts' : name === 'Beamo' ? 'LOD count + saved enabled first/two LOD extra pointers/render counts' : 'first expanded LOD render vertex count', completeOriginalClass: false, completeOriginalInstances: 0 }]));
const foundationalCounts = { Clump: 0, Marker: 0, Rail: 0 };
const maps: unknown[] = [], differences: unknown[] = [];
for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
  const folder = path.join(data, 'Levels', level);
  if (!fs.existsSync(path.join(folder, 'BstBaked.meshes')) || !fs.existsSync(path.join(folder, 'Objects.level.bin'))) continue;
  const bakedBytes = fs.readFileSync(path.join(folder, 'BstBaked.meshes')), objectBytes = fs.readFileSync(path.join(folder, 'Objects.level.bin'));
  const document = new MeshesDocument(bakedBytes), nodes = new ObjectsDocument(objectBytes).nodes;
  const source = loadEditorLevelDataModelBakes(document, resolve), records = source.handle!.resource!.records;
  summary.maps++; summary.records += records.length;
  for (const cls of Object.keys(foundationalCounts) as (keyof typeof foundationalCounts)[]) foundationalCounts[cls] += nodes.filter(n => n.className === cls).length;
  for (const record of records) {
    if (record.guid !== record.serializedGuid) summary.invalidatedRecords++;
    for (const [lod, loaded] of record.lods.entries()) {
      summary.lods++;
      if (!loaded.lighting) { summary.clearedLods++; continue; }
      summary.loadedLods++;
      const old = bindBake(resolve(record.name)!.levels[lod], document.bakeData(record.id, lod));
      assert.deepEqual(loaded.lighting.packed, old.packed, `${level}/${record.id}/${lod}: baseline lighting`);
      assert.deepEqual(loaded.extra, document.bakeData(record.id, lod).extra);
      summary.unchangedLightingLods++;
    }
  }
  for (const node of nodes.filter(n => names.includes(n.className))) {
    const cls = classes[node.className], name = objectText(node, node.className === 'LevelMesh' ? 'resourceName' : 'meshName'), guid = objectScalar(node, 'bstGuid');
    cls.instances++;
    const resource = name ? resolve(name) : null;
    if (resource) cls.resourcePresent++;
    const serialized = document.bakes.find(b => b.guid === guid && b.name === name);
    if (serialized) cls.serializedAssociations++;
    const loaded = findLoadedBake(source, guid);
    if (loaded) cls.loadedGuidFound++;
    if(resource&&beamoBakeCompatible(loaded,resource.levels.length))cls.lodCountOnlySatisfied++;
    const beamo=['Beamo','BeamoDecal'].includes(node.className);
    // Native Beamo/Decal lookup falls back to UnitCube for a missing Mesh.
    const effective=resource??(beamo?resolve('UnitCube'):null);
    const accepted = !!effective && (beamo ? selectEditorBeamoBake(node,effective,loaded).accepted
      : firstLodBakeCompatible(loaded,effective.levels[0].positions.length/3));
    if (accepted) cls.originalAcceptanceSatisfied++;
    if (accepted && loaded!.lods[0]?.lighting) cls.loadedLightingReady++;
    if ((serialized?.id ?? null) !== (loaded?.id ?? null)) differences.push({ level, nodeId: node.id, className: node.className, name, guid, serialized: serialized?.id ?? null, loaded: loaded?.id ?? null });
  }
  const cards = editorCloudCardBakeLighting(nodes, source, name => { const mesh = resolve(name); if (!mesh) throw new Error(`${name}: CloudCard mesh missing`); return mesh; });
  summary.cloudCardsUsingOriginalBake += cards.bakedCards;
  assert.equal(sha(fs.readFileSync(path.join(folder, 'Objects.level.bin'))), sha(objectBytes));
  assert.equal(sha(fs.readFileSync(path.join(folder, 'BstBaked.meshes'))), sha(bakedBytes));
  maps.push({ level, objectSha256: sha(objectBytes), bakeSha256: sha(bakedBytes), records: records.length, invalidated: records.filter(r => r.guid !== r.serializedGuid).map(r => ({ id: r.id, name: r.name, guid: r.serializedGuid })), cleared: records.flatMap(r => r.lods.flatMap((l, lod) => l.lighting ? [] : [{ id: r.id, name: r.name, lod }])), cloudBakedCards: cards.bakedCards, cloudUnbakedNodeIds: cards.rejectedNodeIds });
}
const report = { passed: true, dateUTC: new Date().toISOString(), scope: 'All original files preserved. Named resource existence/LOD input and synchronous loadIndex=0 are editor services. Original GUID invalidation, first-match selection and loaded LOD expansion used. Beamo/BeamoDecal now use the independently executed original shared loader branches and check +16 opaque pointer, not +8 ordinary light pointer. Original acceptance is separate from bytes ready, full creation, enabled/default visibility, render lists or full class/game completion. No new lighting bake is generated.', summary, classes, foundationalCounts, selectionDifferences: differences, maps, completeOriginalGameRuntime: false };
fs.writeFileSync(process.argv.includes('--beamo')?'docs/beamo-bake-bindings.json':'docs/level-data-bake-audit.json', JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify({ passed: true, summary, classes, foundationalCounts, selectionDifferences: differences.length }));
