import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import { PreparedEnvironmentObjectState } from '../src/core/environment-object-state';
import { PreparedEnvironmentEventOwner } from '../src/core/environment-event-owner';
import { EnvironmentRuntime } from '../src/core/environment-runtime';
import { buildRailCache, RAIL_MARKER_OBB } from '../src/core/rail';
import audit from '../docs/fish-group-map-audit.json';
import nativeCache from '../tests/fixtures/rail-cache-native.json';
import properties from '../docs/native-properties.json';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', cases = [], rows = [];
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
for (const group of audit.groups) {
  const file = path.join(data, 'Levels', group.level, 'Objects.level.bin'), source = fs.readFileSync(file), doc = new ObjectsDocument(source), movement = group.movement[0];
  const ids = new Set<number>(), visit = (id: number) => {
    if (ids.has(id)) return; ids.add(id); const node = doc.nodes[id]; assert.ok(node);
    const fields = (fs: typeof node.fields) => { for (const f of fs) { if (f.kind === 'reference' && f.value !== 0xffffffff) visit(Number(f.value)); fields(f.children ?? []); } }; fields(node.fields);
  }; visit(movement.event.id);
  const nodes = doc.nodes.filter(n => ids.has(n.id)), state = new PreparedEnvironmentObjectState(nodes), event = state.require(movement.event.id), rail = state.require(movement.rail.id);
  const archived: any = structuredClone(nativeCache.cases.find((r: any) => r.level === group.level && r.nodeId === movement.rail.id)); assert.ok(archived);
  for (const p of archived.negativeZeroPaths) { let owner = archived; for (const k of p.slice(0, -1)) owner = owner[k]; owner[p.at(-1)] = -0; }
  const matrix = (b: Uint8Array) => { const v = new DataView(b.buffer, b.byteOffset, b.length); return Array.from({ length: 16 }, (_, i) => v.getFloat32(i * 4, true)); };
  const markerIds = rail.node.fields.find(f => f.name === 'dataPoints')!.children!.map(f => Number(f.value));
  let index = 0;
  const cache = buildRailCache(markerIds.map(id => ({ world: matrix(state.transform(id)), obb: RAIL_MARKER_OBB })), matrix(state.transform(rail.node.id)), Boolean(rail.node.fields.find(f => f.name === 'looped')!.value), { atan2: (y, x) => { const t = archived.native[index++].trace; assert.ok(Object.is(y, t[0]) && Object.is(x, t[1])); return t[2]; } });
  assert.deepEqual(cache, archived.cache); assert.equal(markerIds.length, 6);
  const words: [number, number][] = [[0x4010, 1]], bytes: [number, number][] = [], v = new DataView(event.bytes.buffer, event.bytes.byteOffset, event.bytes.length);
  const fields: any = properties.MoveObjectAlongRail;
  for (const f of event.node.fields) {
    const offset = f.name === 'autoStart' ? 12 : fields[f.name]?.nativeOffset; if (offset === undefined || f.kind === 'reference') continue;
    if (f.raw.length === 8) words.push([0x1000 + offset, v.getUint32(offset, true)]);
    else if (f.raw.length === 2) bytes.push([0x1000 + offset, v.getUint8(offset)]);
    else throw new Error('Unexpected saved movement scalar');
  }
  const transform = state.transform(group.fish.id), fv = new DataView(transform.buffer, transform.byteOffset, transform.length), transformBits = Array.from({ length: 16 }, (_, i) => fv.getUint32(i * 4, true));
  cases.push({ label: `actual fish lifecycle ${group.level} fish ${group.fish.id} move ${event.node.id}`, mode: 6, steps: 2, words, bytes, railCache: cache, vectors: [[0x5080, transformBits]] });
  const owner = new PreparedEnvironmentEventOwner(new EnvironmentRuntime([{ name: 'RailPreparationVerification', fields: [], output: {} }], []), nodes, group.level);
  assert.equal(owner.info().find(e => e.id === event.node.id)?.available, false); owner.dispose();
  assert.deepEqual(doc.serialize(), source); assert.equal(sha(fs.readFileSync(file)), sha(source));
  rows.push({ level: group.level, fishId: group.fish.id, eventId: event.node.id, railId: rail.node.id, markerIds, sourceSha256: sha(source), eventStorageBytes: event.bytes.length, savedFieldsLoaded: event.fieldsLoaded, defaultsApplied: event.defaultsApplied, originalSourceUnchanged: true, runtimeUpdateAvailable: false }); state.dispose();
}
const report = { passed: true, cases, groups: rows, scope: 'Actual saved MoveObjectAlongRail/Clump/Rail/Marker fields prepared in shared native object storage. Rail caches reconstructed from six original Markers with archived native atan2 replay. Saved LevelMesh transforms are read through the existing native getter; Model resource owners remain unloaded. These become independent whole lifecycle/native real-rail-query inputs; Update, Model resource loading, EventBarn motion and viewport remain pending.' };
const output = 'tests/fixtures/fish-group-rail-lifecycle-inputs.json';
if (process.argv.includes('--check')) assert.deepEqual(JSON.parse(fs.readFileSync(output, 'utf8')), JSON.parse(JSON.stringify(report)));
else fs.writeFileSync(output, JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify({ passed: true, groups: rows.length, cases: cases.length, updateAvailable: false }));
