import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {railClosestPoint, railPosition, railScalar, railTransform, railSegmentDistanceSquared, type RailCache, type RailMath} from '../src/core/rail';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const f = Math.fround;
let seed = 318;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2 ** 32);
const scalar = () => f(random() * 200 - 100);
const identity = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
const rows: {cache: RailCache; parameter: number; eye: number[]; level?: string; nodeId?: number}[] = [];
const parameters = [0, -0, 1, -1, 2, -.5, .5, .000001, .999999, 1.000001, .25, .75];
for (let i = 0; i < 384; i++) {
  const count = 2 + i % 15;
  const positions = Array.from({length: count}, (_, j) => i < 24 ? [f(j * 2), 0, 0] : [scalar(), scalar(), scalar()]);
  const scales = [0, 1, 2].map(() => Array.from({length: count}, () => f(random() * 10))) as RailCache['scales'];
  const rolls = Array.from({length: count}, () => i < 24 ? 0 : f(random() * 12 - 6));
  const transform = [...identity];
  if (i >= 24) transform.splice(4, 3, ...[scalar(), scalar(), scalar()]);
  const eye = i % 8 === 0 ? positions[0] : i % 8 === 1 ? positions[count - 1] : [scalar(), scalar(), scalar()];
  rows.push({cache: {positions, scales, rolls, transform, looped: i % 2 === 0}, parameter: parameters[i % parameters.length], eye});
}
const cacheCorpus = JSON.parse(fs.readFileSync('tests/fixtures/rail-cache-native.json', 'utf8'));
const excluded: any[] = [];
for (const serialized of cacheCorpus.cases.filter((r: any) => r.level)) {
  const row = structuredClone(serialized);
  for (const p of row.negativeZeroPaths) {let owner = row;for (const k of p.slice(0, -1)) owner = owner[k];owner[p.at(-1)] = -0;}
  const cache: RailCache = row.cache, n = cache.positions.length;
  for (const [i, parameter] of [0, .37, 1].entries()) {
    const eye = i === 0 ? cache.positions[0] : i === 2 ? cache.positions[n - 1] : cache.positions[Math.floor(n / 2)].map((v, a) => f(v + [1, 3, -2][a]));
    try {railClosestPoint(cache, eye);rows.push({cache, parameter: f(parameter), eye, level: row.level, nodeId: row.nodeId});}
    catch (error) {excluded.push({level: row.level, nodeId: row.nodeId, parameter, eye, reason: String(error)});}
  }
}
const chunks: Buffer[] = [];
const uint = (v: number) => {const b = Buffer.alloc(4);b.writeUInt32LE(v >>> 0);chunks.push(b);};
const floats = (values: number[]) => {const b = Buffer.alloc(values.length * 4);values.forEach((v, i) => b.writeFloatLE(v, i * 4));chunks.push(b);};
uint(rows.length);
for (const row of rows) {
  const c = row.cache;
  uint(c.positions.length);uint(Number(c.looped));floats([row.parameter]);floats([...row.eye, 0]);floats(c.transform);
  c.positions.forEach(p => floats([...p, 1]));[...c.scales, c.rolls].forEach(floats);
}
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-rail-'));
let raw: Buffer;
try {
  const runner = path.join(temporary, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-rail-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 8e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`);
  raw = run.stdout;
} finally {fs.rmSync(temporary, {recursive: true, force: true});}
if (raw.length !== 4 + rows.length * 128) throw new Error('Invalid native output');
function evaluateRail(row: typeof rows[number], math?: RailMath) {
  const {cache, parameter, eye} = row, closest = railClosestPoint(cache, eye);
  const values = [closest.parameter, ...closest.position, ...railPosition(cache, parameter), 0,
    ...[...cache.scales, cache.rolls].map(v => railScalar(v, cache.looped, parameter)),
    ...railTransform(cache, parameter, math), railSegmentDistanceSquared(eye, cache.positions[0], cache.positions[1])];
  const bytes = Buffer.alloc(values.length * 4);values.forEach((v, i) => bytes.writeFloatLE(v, i * 4));return bytes;
}
const results = rows.map((row, i) => {
  const native = raw.subarray(4 + i * 128, 4 + i * 128 + 116), trace = [0, 1, 2].map(j => raw.readFloatLE(4 + i * 128 + 116 + j * 4));
  const traced: RailMath = {sincos(angle) {if (f(angle) !== trace[0]) throw new Error(`sincos argument mismatch ${i}`);return [trace[1], trace[2]];}};
  const bytes = evaluateRail(row, traced), jsBytes = evaluateRail(row);
  const mismatches = Array.from({length: 29}, (_, j) => j).filter(j => !bytes.subarray(j * 4, j * 4 + 4).equals(native.subarray(j * 4, j * 4 + 4)));
  return {...row, nativeHex: native.toString('hex'), actualHex: bytes.toString('hex'), trace, passed: bytes.equals(native), jsPassed: jsBytes.equals(native), mismatches};
});
const report = {passed: results.every(r => r.passed), executableSha256: hash, cases: rows.length,
  exactFloat32Components: rows.length * 28, functions: {closest: '0x10055d820', position: '0x10055e420', scalar: '0x1005609d0', transform: '0x100560b40', segmentDistance: '0x100789ac0', matrix: '0x100076df0'},
  corpus: {testedRails: new Set(rows.filter(r => r.level).map(r => `${r.level}/${r.nodeId}`)).size, cases: rows.filter(r => r.level).length, excluded},
  scope: 'Complete original cached Rail closest-point, position, scalar, transform and segment-distance bodies, original matrix products; explicitly initialized arrays. Linux fmodf and traced Linux sincosf imports; JS sincos independently compared. SIMD position W excluded. Cache construction/getters, lifecycle, actual event execution and macOS libm are not included.',
  jsMath: {passed: results.every(r => r.jsPassed), failureCases: results.filter(r => !r.jsPassed).length},
  failures: results.filter(r => !r.passed), jsFailures: results.filter(r => !r.jsPassed)};
fs.writeFileSync('docs/rail-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (!report.passed) fs.writeFileSync(`docs/rail-oracle-failure-${Date.now()}.json`, JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/rail-native.json', JSON.stringify({scope: report.scope, cases: results.map(({actualHex, passed, jsPassed, mismatches, ...r}) => {
  const negativeZeroPaths: string[][] = [];
  const visit = (v: any, p: string[]) => {if (typeof v === 'number' && Object.is(v, -0)) negativeZeroPaths.push(p);
    else if (v && typeof v === 'object') for (const k of Object.keys(v)) visit(v[k], [...p, k]);};
  visit(r, []);return {...r, negativeZeroPaths};
})}, null, 2) + '\n');
console.log(JSON.stringify({...report, corpus: {...report.corpus, excluded: report.corpus.excluded.slice(0, 5)}, failures: report.failures.slice(0, 3), jsFailures: report.jsFailures.slice(0, 1)}));
if (!report.passed) process.exitCode = 1;
