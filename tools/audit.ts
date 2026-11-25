import fs from 'node:fs';
import path from 'node:path';
import { ObjectsDocument } from '../src/core/objects';
import { MeshesDocument } from '../src/core/meshes';
const data = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const report: Record<string, unknown>[] = []; let failed = 0;
for (const name of fs.readdirSync(path.join(data, 'Levels'))) {
  const dir = path.join(data, 'Levels', name); if (!fs.statSync(dir).isDirectory()) continue;
  const row: Record<string, unknown> = { level: name };
  for (const [filename, Codec] of [['Objects.level.bin', ObjectsDocument], ['BstBaked.meshes', MeshesDocument]] as const) {
    try { const source = fs.readFileSync(path.join(dir, filename)), d = new Codec(source); if (!source.equals(d.serialize())) throw new Error('无修改回写字节不一致'); row[filename] = d instanceof ObjectsDocument ? { bytes: source.length, classes: d.classes.length, objects: d.nodes.length, roundtrip: true } : { bytes: source.length, version: d.version, bakes: d.bakes.length, geometry: d.geometries.map(g => ({ kind: g.kind, vertices: g.vertexCount, indices: g.indexCount })), roundtrip: true }; console.log(name, filename, 'OK'); }
    catch (e) { row[filename] = { error: String(e) }; failed++; console.log(name, filename, String(e)); }
  }
  report.push(row);
}
fs.writeFileSync('docs/corpus-audit.json', JSON.stringify(report, null, 2)); process.exitCode = failed ? 1 : 0;
