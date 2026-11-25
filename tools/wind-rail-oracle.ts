import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {sampleWind, type WindSnapshot} from '../src/core/environment-wind';
import {railClosestPoint, type RailCache, type RailMath} from '../src/core/rail';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const f = Math.fround;
function restore(serialized: any) {const row = structuredClone(serialized);for (const p of row.negativeZeroPaths ?? []) {let owner = row;for (const k of p.slice(0, -1)) owner = owner[k];owner[p.at(-1)] = -0;}return row;}
const cacheRows = JSON.parse(fs.readFileSync('tests/fixtures/rail-cache-native.json', 'utf8')).cases.map(restore);
const evalRows = JSON.parse(fs.readFileSync('tests/fixtures/rail-native.json', 'utf8')).cases.map(restore);
const rows: {wind: WindSnapshot; position: number[]; level?: string; nodeId?: number}[] = [];
for (const [i, r] of evalRows.entries()) {
  rows.push({wind: {transform: r.cache.transform, enabled: i % 13 !== 0, fadeDist: [0, 1, 3, -1][i % 4],
    fadeTime: [0, 3][i % 2], timer: f([0, .1, 3, 6][i % 4]), intensity: f([0, .5, 5, -2][i % 4]), order: 0, rail: r.cache}, position: r.eye});
}
const inventory = JSON.parse(fs.readFileSync('docs/Objects与Avatar进度.json', 'utf8'));
const excluded: any[] = [];let railWinds = 0;
for (const level of inventory.levels) for (const node of level.interactionNodes.filter((n: any) => n.className === 'Wind')) {
  const ref = node.references.find((r: any) => r.className === 'Rail');
  if (!ref || ref.className !== 'Rail') continue;
  railWinds++;
  const cacheRow = cacheRows.find((r: any) => r.level === level.level && r.nodeId === ref.target);
  if (!cacheRow) {excluded.push({level: level.level, nodeId: node.id, reason: 'missing verified Rail cache'});continue;}
  const get = (name: string) => node.fields[name]?.value;
  const cache: RailCache = cacheRow.cache;
  const wind: WindSnapshot = {transform: get('transform'), enabled: Boolean(get('enabled')), fadeDist: get('fadeDist'), fadeTime: get('fadeTime'),
    timer: get('fadeTime'), intensity: get('intensity'), order: get('order'), rail: cache};
  for (const position of [cache.positions[0], cache.positions[Math.floor(cache.positions.length / 2)].map((v, i) => f(v + [1, -2, 3][i]))]) {
    try {railClosestPoint(cache, position);rows.push({wind, position, level: level.level, nodeId: node.id});}
    catch (error) {excluded.push({level: level.level, nodeId: node.id, position, reason: String(error)});}
  }
}
const chunks: Buffer[] = [];
const uint = (v: number) => {const b = Buffer.alloc(4);b.writeUInt32LE(v >>> 0);chunks.push(b);};
const floats = (v: number[]) => {const b = Buffer.alloc(v.length * 4);v.forEach((x, i) => b.writeFloatLE(x, i * 4));chunks.push(b);};
uint(rows.length);
for (const row of rows) {
  const w = row.wind, c = w.rail!;
  uint(Number(w.enabled));uint(w.order);floats([w.fadeDist, w.fadeTime, w.intensity, w.timer]);floats(w.transform);floats([...row.position, 0]);
  uint(c.positions.length);uint(Number(c.looped));floats(c.transform);c.positions.forEach(p => floats([...p, 1]));[...c.scales, c.rolls].forEach(floats);
}
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-wind-rail-'));
let raw: Buffer;
try {
  const runner = path.join(temporary, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-wind-rail-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 16e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`);raw = run.stdout;
} finally {fs.rmSync(temporary, {recursive: true, force: true});}
if (raw.length !== 4 + rows.length * 28) throw new Error('Invalid wind Rail output');
const results = rows.map((row, i) => {
  const native = raw.subarray(4 + i * 28, 4 + i * 28 + 16), trace = [0, 1, 2].map(j => raw.readFloatLE(4 + i * 28 + 16 + j * 4));
  const traced: RailMath = {sincos(angle) {if (angle !== trace[0]) throw new Error(`sincos argument mismatch ${i}`);return [trace[1], trace[2]];}};
  const bytes = (math?: RailMath) => {const r = sampleWind(row.wind, row.position, math), b = Buffer.alloc(16);[...r.vector, r.weight].forEach((v, j) => b.writeFloatLE(v, j * 4));return b;};
  return {...row, trace, nativeHex: native.toString('hex'), actualHex: bytes(traced).toString('hex'), passed: bytes(traced).equals(native), jsPassed: bytes().equals(native)};
});
const report = {passed: results.every(r => r.passed), executableSha256: hash, cases: rows.length, exactFloat32Components: rows.length * 4,
  corpus: {railWinds, testedRailWinds: new Set(rows.filter(r => r.level).map(r => `${r.level}/${r.nodeId}`)).size, excluded},
  functions: ['0x100328810', '0x10055d820', '0x100560b40', '0x1005609d0', '0x100789ac0', '0x100076df0'],
  scope: 'Original Wind -> original Rail nearest point -> original Rail transform -> original Wind radius/direction/fade; no Rail callbacks or replaced algorithm bodies. Initialized caches from separately verified original Marker/cache fixtures, explicit timer snapshot (actual-map cases use fadeTime), Linux fmodf/traced sincosf. Event enable, Wind/Environment construction/update/order and macOS libm remain separate.',
  jsMath: {passed: results.every(r => r.jsPassed), failureCases: results.filter(r => !r.jsPassed).length}, failures: results.filter(r => !r.passed), jsFailures: results.filter(r => !r.jsPassed)};
fs.writeFileSync('docs/wind-rail-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (!report.passed) fs.writeFileSync(`docs/wind-rail-oracle-failure-${Date.now()}.json`, JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/wind-rail-native.json', JSON.stringify({scope: report.scope, cases: results.map(({actualHex, passed, jsPassed, ...r}) => {
  const negativeZeroPaths: string[][] = [];
  const visit = (v: any, p: string[]) => {if (typeof v === 'number' && Object.is(v, -0)) negativeZeroPaths.push(p);
    else if (v && typeof v === 'object') for (const k of Object.keys(v)) visit(v[k], [...p, k]);};
  visit(r, []);return {...r, negativeZeroPaths};
})}, null, 2) + '\n');
console.log(JSON.stringify({...report, failures: report.failures.slice(0, 1), jsFailures: report.jsFailures.slice(0, 1)}));
if (!report.passed) process.exitCode = 1;
