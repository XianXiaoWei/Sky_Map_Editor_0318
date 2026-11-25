import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {ObjectsDocument} from '../src/core/objects';
import {buildRailCache, railMarkerTransform, RAIL_MARKER_OBB, type RailMarkerInput, type RailCacheMath} from '../src/core/rail';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const f = Math.fround, identity = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
let seed = 318;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2 ** 32);
const scalar = () => f(random() * 20 - 10);
const rows: {level?: string; nodeId?: number; transform: number[]; looped: boolean; points: RailMarkerInput[]}[] = [];
for (let i = 0; i < 256; i++) {
  const transform = [...identity];if (i % 8) transform.splice(4, 3, scalar(), scalar(), scalar());
  const points = Array.from({length: 2 + i % 15}, (_, j) => ({position: [scalar(), scalar(), scalar()],
    quaternion: i < 16 ? [0, 0, f(Math.sin(j * .8)), f(Math.cos(j * .8))] : [scalar(), scalar(), scalar(), scalar()],
    scale: i % 8 === 0 ? [0, 1e-6, -2] : [scalar(), scalar(), scalar()]}));
  rows.push({transform, looped: i % 2 === 0, points});
}
const excluded: any[] = [];let totalRails = 0;
for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
  const file = path.join(data, 'Levels', level, 'Objects.level.bin');if (!fs.existsSync(file)) continue;
  const doc = new ObjectsDocument(fs.readFileSync(file));
  for (const node of doc.nodes.filter(n => n.className === 'Rail')) {
    totalRails++;
    const get = (name: string) => node.fields.find(v => v.name === name);
    const refs = get('dataPoints')?.children, transform = get('transform')?.value as number[] | undefined, flag = get('looped')?.value;
    const reasons: string[] = [], points: RailMarkerInput[] = [];
    if (!refs || refs.length < 2 || refs.length > 256) reasons.push('control-point count');
    if (!transform || flag === undefined) reasons.push('missing transform or loop flag');
    for (const ref of refs ?? []) {
      const marker = doc.nodes[Number(ref.value)];
      if (!marker || marker.className !== 'Marker') {reasons.push(`reference #${ref.value} is ${marker?.className ?? 'null'}`);continue;}
      const field = (name: string) => marker.fields.find(v => v.name === name)?.value as number[] | undefined;
      const position = field('pos'), quaternion = field('quat'), scale = field('scale');
      if (!position || !quaternion || !scale) {reasons.push(`Marker #${marker.id} needs defaults`);continue;}
      points.push({position: position.slice(0, 3), quaternion, scale: scale.slice(0, 3)});
    }
    if (reasons.length) excluded.push({level, nodeId: node.id, reasons});
    else rows.push({level, nodeId: node.id, transform: transform!, looped: Boolean(flag), points});
  }
}
const chunks: Buffer[] = [];
const uint = (v: number) => {const b = Buffer.alloc(4);b.writeUInt32LE(v >>> 0);chunks.push(b);};
const floats = (values: number[]) => {const b = Buffer.alloc(values.length * 4);values.forEach((v, i) => b.writeFloatLE(v, i * 4));chunks.push(b);};
uint(rows.length);
for (const row of rows) {
  uint(row.points.length);uint(Number(row.looped));floats(row.transform);
  row.points.forEach(p => floats([...p.position, 0, ...p.quaternion, ...p.scale, 0]));
}
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-rail-cache-'));
let raw: Buffer;
try {
  const runner = path.join(temporary, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-rail-cache-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 16e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`);
  raw = run.stdout;
} finally {fs.rmSync(temporary, {recursive: true, force: true});}
let at = 4;
const results = rows.map(row => {
  const native = row.points.map(() => {
    const bytes = raw.subarray(at, at + 92), trace = [0, 1, 2].map(j => raw.readFloatLE(at + 92 + j * 4));at += 104;
    return {nativeHex: bytes.toString('hex'), trace};
  });
  const worlds = row.points.map(railMarkerTransform), points = worlds.map(world => ({world, obb: RAIL_MARKER_OBB}));
  let index = 0;
  const traced: RailCacheMath = {atan2(y, x) {
    const trace = native[index++].trace;
    if (!Object.is(y, trace[0]) || !Object.is(x, trace[1])) throw new Error(`atan2 argument mismatch ${row.level ?? 'synthetic'} #${row.nodeId ?? index}`);
    return trace[2];
  }};
  const cache = buildRailCache(points, row.transform, row.looped, traced), jsCache = buildRailCache(points, row.transform, row.looped);
  const bytes = (cache: ReturnType<typeof buildRailCache>, i: number) => {
    const values = [...worlds[i], ...cache.positions[i], ...cache.scales.map(v => v[i]), cache.rolls[i]];
    const out = Buffer.alloc(92);values.forEach((v, j) => out.writeFloatLE(v, j * 4));return out;
  };
  return {...row, cache, native, passed: native.every((n, i) => bytes(cache, i).toString('hex') === n.nativeHex),
    jsPassed: native.every((n, i) => bytes(jsCache, i).toString('hex') === n.nativeHex)};
});
if (at !== raw.length) throw new Error('Invalid cache oracle output length');
const report = {passed: results.every(r => r.passed), executableSha256: hash, cases: rows.length,
  controlPoints: rows.reduce((v, r) => v + r.points.length, 0),
  exactFloat32Components: rows.reduce((v, r) => v + r.points.length * 23, 0),
  corpus: {totalRails, testedRails: rows.filter(r => r.level).length, excluded},
  functions: {cache: '0x10055cf30', markerWorld: '0x10043e2d0', markerObb: '0x10043e470', scale: '0x1004d2260', roll: '0x10078a710', matrix: '0x100076df0'},
  scope: 'Original Marker transform/OBB, generic scale/matrix/lengths, roll extraction and complete cache rebuild for non-null initialized control points with selfUpdating=false. Generic metadata GetTransform/GetObb dispatch explicitly bound to original Marker bodies. Original serialized Marker fields used when present; missing defaults and other classes excluded. Linux atan2f traced and JS Math.atan2 independently compared. Allocation/invalidation, arbitrary Object GetTransform/GetObb dispatch and macOS libm excluded.',
  jsMath: {passed: results.every(r => r.jsPassed), failureCases: results.filter(r => !r.jsPassed).length},
  failures: results.filter(r => !r.passed), jsFailures: results.filter(r => !r.jsPassed)};
fs.writeFileSync('docs/rail-cache-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (!report.passed) fs.writeFileSync(`docs/rail-cache-oracle-failure-${Date.now()}.json`, JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/rail-cache-native.json', JSON.stringify({scope: report.scope, cases: results.map(({passed, jsPassed, ...r}) => {
  const negativeZeroPaths: string[][] = [];
  const visit = (v: any, p: string[]) => {if (typeof v === 'number' && Object.is(v, -0)) negativeZeroPaths.push(p);
    else if (v && typeof v === 'object') for (const k of Object.keys(v)) visit(v[k], [...p, k]);};
  visit(r, []);return {...r, negativeZeroPaths};
})}, null, 2) + '\n');
console.log(JSON.stringify({...report, corpus: {...report.corpus, excluded: report.corpus.excluded.slice(0, 5)}, failures: report.failures.slice(0, 1), jsFailures: report.jsFailures.slice(0, 1)}));
if (!report.passed) process.exitCode = 1;
