import fs from 'node:fs';
import path from 'node:path';
import { MeshesDocument } from '../src/core/meshes';
import { readResourceMesh, type ResourceMesh } from '../src/core/resources';
import { bindBake } from '../src/core/baking';

const data = process.argv[2] ?? process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const cache = new Map<string, ResourceMesh>(); let totalResourceLODs = 0;
for (const file of fs.readdirSync(path.join(data, 'Meshes/Bin')).filter(f => f.endsWith('.mesh'))) { const mesh = readResourceMesh(fs.readFileSync(path.join(data, 'Meshes/Bin', file))); totalResourceLODs += mesh.lods; cache.set(file.slice(0, -5), mesh); }
const levels = fs.readdirSync(path.join(data, 'Levels')).map(level => {
  const doc = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level, 'BstBaked.meshes')));
  const records = doc.bakes.flatMap(b => b.submeshes.map((s, lod) => {
    try { const mesh = cache.get(b.name); if (!mesh?.levels[lod]) throw new Error('资源或 LOD 不存在'); const stream = doc.bakeData(b.id, lod), bound = bindBake(mesh.levels[lod], stream);
      return { name: b.name, guid: b.guid, lod, uniform: b.uniform, samples: s.count, renderVertices: bound.vertexCount, extraBytes: stream.extra.length, bound: true };
    } catch (e) { return { name: b.name, guid: b.guid, lod, uniform: b.uniform, samples: s.count, bound: false, error: String(e) }; }
  }));
  return { level, records };
});
const records = levels.flatMap(l => l.records), summary = { resources: cache.size, resourceLODs: totalResourceLODs, levels: levels.length, bakeLODs: records.length, mappedLODs: records.filter(r => r.bound).length, uniformLODs: records.filter(r => r.uniform).length, unmatched: records.filter(r => !r.bound).length };
fs.writeFileSync('docs/bake-audit.json', JSON.stringify({ summary, scope: 'Every Mesh v28 LOD decoded and mapped according to original loader. No GPU drawing or new lighting bake is verified.', levels }, null, 2));
console.log(JSON.stringify(summary, null, 2));
console.log(JSON.stringify(records.filter(r => !r.bound).slice(0, 8), null, 2));
