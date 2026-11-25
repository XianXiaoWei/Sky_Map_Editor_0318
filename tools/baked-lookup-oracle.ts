import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {findLoadedBake, beamoBakeCompatible, firstLodBakeCompatible} from '../src/core/baked-lookup';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
interface Query {handle: boolean; resource: boolean; loadIndex: number; guid: number; meshLodCount: number; meshFirstLodVertexCount: number;}
interface Group {level: string; records: {guid: number; name: string; lods: {renderVertexCount: number}[]}[]; queries: Query[];}
const synthetic = [[], [0, 0xffffffff, 0, 0x80000000, 0xffffffff], [7, 7, 8, 7]].map((guids, i) => ({level: `synthetic-${i}`, records: guids.map((guid, j) => ({guid, name: `different-resource-${j}`, lods: Array.from({length: j % 4 + 1}, () => ({renderVertexCount: [0, 1, 0xffffffff, 128][j % 4]}))}))}));
const links = JSON.parse(fs.readFileSync('docs/meshes-object-links.json', 'utf8'));
const audit = JSON.parse(fs.readFileSync('docs/bake-audit.json', 'utf8'));
const inputs = [...synthetic, ...links.levels.map((level: any) => ({level: level.level, records: level.records.map((r: any) => {
  const lods = audit.levels.find((l: any) => l.level === level.level).records.filter((b: any) => b.guid === r.guid && b.name === r.resource);
  return {guid: r.guid, name: r.resource, lods: lods.map((l: any) => ({renderVertexCount: l.bound ? l.renderVertices : 0}))};
})}))];
const groups: Group[] = inputs.map(({level, records}) => {
  const guids = [...records.map((r: any) => r.guid), 0, 0xffffffff, 0x80000000, 0x318f01];
  const counts = (guid: number) => {const record = records.find((r: any) => r.guid === guid);return {meshLodCount: record?.lods.length ?? 0, meshFirstLodVertexCount: record?.lods[0]?.renderVertexCount ?? 0};};
  const queries: Query[] = guids.map(guid => ({handle: true, resource: true, loadIndex: 0, guid, ...counts(guid)}));
  for (const guid of [records[0]?.guid ?? 0, 0xffffffff]) for (const [handle, resource, loadIndex] of [[false, true, 0], [true, false, 0], [true, true, -1], [true, true, -0x80000000], [true, true, 0x7fffffff]] as const) queries.push({handle, resource, loadIndex, guid, ...counts(guid)});
  if (records.length) for (const meshLodCount of [0, 1, 4, 0xffffffff]) for (const meshFirstLodVertexCount of [0, 1, 128, 0xffffffff]) queries.push({handle: true, resource: true, loadIndex: 0, guid: records[0].guid, meshLodCount, meshFirstLodVertexCount});
  return {level, records, queries};
});
const chunks: Buffer[] = [];
const uints = (values: number[]) => {const bytes = Buffer.alloc(values.length * 4); values.forEach((v, i) => bytes.writeUInt32LE(v >>> 0, i * 4)); chunks.push(bytes);};
uints([groups.length]);
for (const group of groups) {
  uints([group.records.length, group.queries.length]);
  for (const r of group.records) uints([r.guid, r.lods.length, r.lods[0]?.renderVertexCount ?? 0]);
  for (const q of group.queries) uints([Number(q.handle), Number(q.resource), q.loadIndex, q.guid, q.meshLodCount, q.meshFirstLodVertexCount]);
}
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-baked-lookup-'));
let output: Buffer;
try {
  const runner = path.join(temporary, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-baked-lookup-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 4e6});
  if (run.status !== 0) throw new Error(`Native baked lookup failed: ${run.status} ${run.stderr}`);
  output = run.stdout;
} finally {fs.rmSync(temporary, {recursive: true, force: true});}
if (output.readUInt32LE(0) !== groups.length) throw new Error('Invalid lookup group count');
let offset = 4;
const cases = groups.map(group => ({...group, queries: group.queries.map(query => {
  const native = {found: output.readUInt32LE(offset) !== 0, index: output.readUInt32LE(offset + 4), outputUnchanged: output.readUInt32LE(offset + 8) !== 0,
    beamoCompatible: output.readUInt32LE(offset + 12) !== 0, cloudCardCompatible: output.readUInt32LE(offset + 16) !== 0, modelCompatible: output.readUInt32LE(offset + 20) !== 0}; offset += 24;
  const result = findLoadedBake({handle: query.handle ? {resource: query.resource ? {loadIndex: query.loadIndex, records: group.records} : null} : null}, query.guid);
  return {...query, native, passed: (result !== null) === native.found && (result === null ? 0xffffffff : group.records.indexOf(result)) === native.index && (result === null) === native.outputUnchanged
    && beamoBakeCompatible(result, query.meshLodCount) === native.beamoCompatible && firstLodBakeCompatible(result, query.meshFirstLodVertexCount) === native.cloudCardCompatible && native.cloudCardCompatible === native.modelCompatible};
})}));
if (offset !== output.length) throw new Error('Invalid lookup output length');
const scope = 'Unmodified original 0x1003f68d0 body plus original Beamo/CloudCard/model acceptance instruction slices with return trampolines at their continuations. Explicit table snapshots include all 10,653 serialized GUIDs; expanded counts use existing bake audit, unsuccessful expansions explicitly represented by zero. Native lookup does not consult names. Null handles/resources, signed load index, duplicates/first-match, unchanged output on failure and distinct count acceptance rules tested. This does not prove actual loaded state, invalid-GUID rewriting, arbitrary Object GUID dispatch, allocation, class lifecycle or game runtime.';
const report = {passed: cases.every(c => c.queries.every(q => q.passed)), executableSha256: hash, functions: {lookup: '0x1003f68d0', beamoAcceptance: '0x100195427', cloudCardAcceptance: '0x10021fc86', modelAcceptance: '0x10045fb24'}, scope,
  groups: cases.length, corpusMaps: links.levels.length, corpusRecords: links.summary.bakeRecords, queries: cases.reduce((n, c) => n + c.queries.length, 0),
  failures: cases.flatMap(c => c.queries.filter(q => !q.passed).map(q => ({level: c.level, records: c.records, ...q})))};
fs.writeFileSync('docs/baked-lookup-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/baked-lookup-native.json', JSON.stringify({scope, executableSha256: hash, cases}) + '\n');
console.log(JSON.stringify(report));
if (!report.passed) process.exitCode = 1;
