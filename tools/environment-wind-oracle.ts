import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {sampleWind, sampleEnvironmentWind, advanceWindTimer, type WindSnapshot, type EnvironmentWindInput} from '../src/core/environment-wind';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original supplied executable');
let seed = 318;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2 ** 32);
const scalar = () => Math.fround(random() * 20 - 10);
const identity = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
const wind = (i: number): WindSnapshot => {
  const angle = random() * Math.PI * 2, scale = [0, 1e-6, 2, 10, 100][i % 5];
  const c = Math.fround(Math.cos(angle) * scale), s = Math.fround(Math.sin(angle) * scale);
  return {transform: [c, 0, s, 0, 0, scale, 0, 0, -s, 0, c, 0, scalar(), scalar(), scalar(), 1],
    enabled: i % 7 !== 0, fadeDist: [0, .000001, 1, 4, -2][i % 5],
    fadeTime: [0, 3, 4][i % 3], timer: Math.fround([0, .001, .5, 3, 6, -1][i % 6]),
    intensity: Math.fround([0, .001, 2, 4, -3][i % 5]), order: [-2, 0, 1, 2, 4][i % 5]};
};
const rows: any[] = [];
for (let i = 0; i < 256; i++) rows.push({mode: 2, enabled: i % 2 === 0,
  timer: Math.fround([0, 1e-6, .5, 3, 5, -1][i % 6]), fadeTime: [0, .5, 3, -1][i % 4],
  delta: Math.fround([0, .0001, 1 / 60, .5][i % 4])});
for (let i = 0; i < 384; i++) {
  const w = wind(i), center = w.transform.slice(12, 15);
  rows.push({mode: 0, wind: w, position: i % 4 === 0 ? center : center.map(v => Math.fround(v + scalar()))});
}
for (let i = 0; i < 128; i++) {
  const w = {...wind(i), enabled: true, fadeTime: 0, intensity: 3};
  const railMatrix = wind(i + 3).transform;
  rows.push({mode: 0, wind: {...w, railSample: {closestPosition: [scalar(), scalar(), scalar()], transform: railMatrix}},
    position: [scalar(), scalar(), scalar()]});
  const boxes = Array.from({length: i % 5}, (_, j) => wind(i + j + 2).transform);
  rows.push({mode: 0, wind: {...w, additionalBoxes: boxes}, position: i % 2 ? [scalar(), scalar(), scalar()] : boxes[0]?.slice(12, 15) ?? [0, 0, 0]});
}
// Original map matrices/scalars, explicit runtime timer, no fabricated rail or
// additional Marker evaluation. Cases with those references are inventoried.
const inventory = JSON.parse(fs.readFileSync('docs/Objects与Avatar进度.json', 'utf8'));
let corpusWind = 0, excluded = 0;
for (const level of inventory.levels) for (const node of level.interactionNodes) {
  if (node.className !== 'Wind') continue;
  const fields = node.fields;
  if (node.references.length) { excluded++; continue; }
  const val = (name: string) => fields[name]?.value;
  const w: WindSnapshot = {transform: val('transform'), enabled: Boolean(val('enabled')),
    fadeDist: val('fadeDist'), fadeTime: val('fadeTime'), timer: val('fadeTime'),
    intensity: val('intensity'), order: val('order')};
  corpusWind++;
  for (const position of [w.transform.slice(12, 15), [0, 0, 0], w.transform.slice(12, 15).map((v, i) => Math.fround(v + w.transform[i] / 2))]) {
    rows.push({mode: 0, level: level.level, nodeId: node.id, wind: w, position});
  }
}
const active = (w: WindSnapshot, order: number) => ({...w, enabled: true, fadeTime: 0, fadeDist: 0,
  transform: identity.map((v, i) => i === 0 || i === 5 || i === 10 ? 100 : v), intensity: 2, order});
const orders = [[4, 1], [1, 4], [0, 0], [4, 1, 3], [1, 3, 4], [4, 3, 1], [-1, 0, 1], [2, 2, 0], [0, -2], [1, 0, 2, 0]];
for (let i = 0; i < 256; i++) {
  const winds = i < orders.length ? orders[i].map(order => active(wind(i), order))
    : Array.from({length: i % 33}, (_, j) => wind(i + j));
  const forces = Array.from({length: i % 6}, (_, j) => ({slot: (j * 7) % 32, side: j % 2 ? 'b' : 'a', enabled: j % 3 !== 0,
    vector: i < 16 ? [3, 4, 0] : [scalar(), scalar(), scalar()]}));
  rows.push({mode: 1, winds, forces, globalWind: [scalar(), scalar(), scalar()], position: i < orders.length ? [0, 0, 0] : [scalar(), scalar(), scalar()]});
}
const chunks: Buffer[] = [];
const uint = (v: number) => {const b = Buffer.alloc(4); b.writeUInt32LE(v >>> 0); chunks.push(b);};
const floats = (v: number[]) => {const b = Buffer.alloc(v.length * 4); v.forEach((x, i) => b.writeFloatLE(x, i * 4)); chunks.push(b);};
const emitWind = (w: WindSnapshot) => {uint(Number(w.enabled)); uint(w.order); floats([w.fadeDist, w.fadeTime, w.intensity, w.timer]); floats(w.transform);};
function input(row: any): EnvironmentWindInput {
  const forces = Array.from({length: 32}, () => ({a: {enabled: false, vector: [0, 0, 0]}, b: {enabled: false, vector: [0, 0, 0]}}));
  for (const force of row.forces) (forces[force.slot] as any)[force.side] = force;
  return {globalWind: row.globalWind, winds: row.winds, forces};
}
uint(rows.length);
for (const row of rows) {
  uint(row.mode); floats([...(row.position ?? [0, 0, 0]), 0]);
  if (row.mode === 0) {
    emitWind(row.wind); uint(Number(Boolean(row.wind.railSample)));
    if (row.wind.railSample) {floats(row.wind.railSample.transform); floats([...row.wind.railSample.closestPosition, 0]);}
    uint(row.wind.additionalBoxes?.length ?? 0); row.wind.additionalBoxes?.forEach(floats);
  }
  else if (row.mode === 1) {
    floats([...row.globalWind, 0]); uint(row.winds.length); row.winds.forEach(emitWind);
    for (const pair of input(row).forces) for (const force of [pair.a, pair.b]) {uint(Number(force.enabled)); floats([...force.vector, 0]);}
  } else {uint(Number(row.enabled)); floats([row.timer, row.fadeTime, row.delta]);}
}
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-environment-wind-'));
let raw: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-environment-wind-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 4e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`);
  raw = run.stdout;
} finally {fs.rmSync(temp, {recursive: true, force: true});}
if (raw.length !== 4 + rows.length * 16) throw new Error('Invalid native output');
let compared = 0;
const results = rows.map((row, i) => {
  const result = row.mode === 0 ? sampleWind(row.wind, row.position) : row.mode === 1
    ? {vector: sampleEnvironmentWind(input(row), row.position), weight: 0}
    : {vector: [advanceWindTimer(row.timer, row.fadeTime, row.enabled, row.delta), 0, 0], weight: 0};
  const bytes = Buffer.alloc(16); [...result.vector, result.weight].forEach((v, j) => bytes.writeFloatLE(v, j * 4));
  const native = raw.subarray(4 + i * 16, 4 + (i + 1) * 16);
  compared += row.mode === 0 ? 4 : row.mode === 1 ? 3 : 1;
  return {...row, nativeHex: native.toString('hex'), actualHex: bytes.toString('hex'), passed: bytes.equals(native)};
});
const report = {passed: results.every(r => r.passed), executableSha256: hash, cases: rows.length,
  exactFloat32Components: compared, volumeCases: rows.filter(r => r.mode === 0).length,
  aggregateCases: rows.filter(r => r.mode === 1).length, timerCases: rows.filter(r => r.mode === 2).length, corpusWindObjects: corpusWind, excludedReferencedWindObjects: excluded,
  functions: {volume: '0x100328810', aggregate: '0x100328200', matrixProduct: '0x100076df0', boxDistance: '0x10078ce10', timerSpan: '0x100324b62..0x100324b8d'},
  scope: 'Unmodified original Wind sample (real matrix multiplication, OBB distance, additional Marker cast/minimum distance and rail-radius/direction/fade branches) and complete EnvironmentForces sampling control flow; original timer instruction span at original RIP with explicit entry/RET exit harness. Explicit initialized timers/global wind, Marker virtual matrix getter outputs, rail closest-position/transform callbacks and interaction-force samples. xyz, volume weight and timer are compared exactly. SIMD scratch W, full update/lifecycle, actual rail nearest-point/getter bodies, automatic force sources and game/Metal acceptance are excluded.',
  failures: results.filter(r => !r.passed)};
fs.writeFileSync('docs/environment-wind-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/environment-wind-native.json', JSON.stringify({scope: report.scope, cases: results.map(({actualHex, passed, ...r}) => {
  // JSON numbers erase -0. Preserve its input paths for bit-exact regression.
  const negativeZeroPaths: string[][] = [];
  const visit = (v: any, p: string[]) => {
    if (typeof v === 'number' && Object.is(v, -0)) negativeZeroPaths.push(p);
    else if (v && typeof v === 'object') for (const k of Object.keys(v)) visit(v[k], [...p, k]);
  };
  visit(r, []); return {...r, negativeZeroPaths};
})}) + '\n');
console.log(JSON.stringify({...report, failures: report.failures.slice(0, 4)}));
if (!report.passed) process.exitCode = 1;
