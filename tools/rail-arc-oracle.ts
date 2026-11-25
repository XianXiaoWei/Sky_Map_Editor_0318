import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import type {RailCache} from '../src/core/rail';
import {railArcLength, buildRailArcTable, railDistanceAtParameter, railParameterAtDistance} from '../src/core/rail-arc';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const f = Math.fround;
let seed = 318;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2 ** 32);
const scalar = () => f(random() * 100 - 50);
interface Row {level?: string; nodeId?: number; cache: RailCache; size: number; subdivisions: number; from: number; to: number; parameter: number; distance: number; dirty: boolean; oldLength: number;}
const rows: Row[] = [];
function make(cache: RailCache, i: number, level?: string, nodeId?: number): Row {
  const subdivisions = level ? 32 : [0, 1, 2, 16, 32, 64][i % 6], size = level ? cache.positions.length * 16 : [2, 17, 32, cache.positions.length * 16][i % 4];
  const table = buildRailArcTable(cache, subdivisions, size), length = table.totalLength;
  return {cache, size, subdivisions, level, nodeId, from: level ? 0 : [0, -.5, .13, .999, 2][i % 5], to: level ? 1 : [1, .4, .75, 2, 0][i % 5],
    parameter: f([0, -0, .1, .37, .75, .99999, 1][i % 7]), distance: f([0, -0, .1, .37, 1, 2, -.3][i % 7] * length),
    dirty: i % 2 === 0, oldLength: f(length * (i % 3 === 0 ? .5 : 1))};
}
for (let i = 0; i < 192; i++) {
  const n = 2 + i % 17;
  const positions = Array.from({length: n}, (_, j) => i < 12 ? [i === 0 ? 0 : f(j * .000001), 0, 0] : [scalar(), scalar(), scalar()]);
  const cache: RailCache = {positions, looped: i % 2 === 0, scales: [[], [], []], rolls: [], transform: []};
  rows.push(make(cache, i));
}
const corpus = JSON.parse(fs.readFileSync('tests/fixtures/rail-cache-native.json', 'utf8'));
for (const serialized of corpus.cases.filter((r: any) => r.level)) {
  const r = structuredClone(serialized);
  for (const p of r.negativeZeroPaths) {let owner = r;for (const k of p.slice(0, -1)) owner = owner[k];owner[p.at(-1)] = -0;}
  const cache: RailCache = {positions: r.cache.positions, looped: r.cache.looped, scales: [[], [], []], rolls: [], transform: []};
  rows.push(make(cache, rows.length, r.level, r.nodeId));
}
const chunks: Buffer[] = [];
const uint = (v: number) => {const b = Buffer.alloc(4);b.writeUInt32LE(v >>> 0);chunks.push(b);};
const floats = (v: number[]) => {const b = Buffer.alloc(v.length * 4);v.forEach((x, i) => b.writeFloatLE(x, i * 4));chunks.push(b);};
uint(rows.length);
for (const row of rows) {
  uint(row.cache.positions.length);uint(Number(row.cache.looped));uint(row.size);uint(row.subdivisions);
  floats([row.from, row.to, row.parameter, row.distance, row.oldLength]);row.cache.positions.forEach(p => floats([...p, 1]));uint(Number(row.dirty));
}
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-rail-arc-'));
let raw: Buffer;
try {
  const runner = path.join(temporary, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-rail-arc-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: Buffer.concat(chunks), timeout: 60000, maxBuffer: 16e6});
  if (run.status !== 0) {
    const stderr = run.stderr.toString(), match = [...stderr.matchAll(/case (\d+) ([^\n]*)/g)].at(-1);
    const report = {passed: false, scope: 'Native harness failure; no passing arc claim. Preserve last case and native diagnostic stage.', executableSha256: hash,
      status: run.status, signal: run.signal, stdoutBytes: run.stdout.length, stderrTail: stderr.split('\n').slice(-8),
      lastStage: match?.[2], lastCase: match ? rows[Number(match[1])] : null};
    fs.writeFileSync(`docs/rail-arc-native-failure-${Date.now()}.json`, JSON.stringify(report, null, 2) + '\n');
    throw new Error(JSON.stringify(report));
  }raw = run.stdout;
} finally {fs.rmSync(temporary, {recursive: true, force: true});}
let at = 4;
if (raw.readUInt32LE(0) !== rows.length) throw new Error('Invalid arc oracle case count');
const results = rows.map(row => {
  const byteCount = row.size * 16 + 40, native = raw.subarray(at, at + byteCount);
  if (native.length !== byteCount) throw new Error('Truncated arc oracle output');
  at += byteCount;
  const skipped = native.readUInt32LE(byteCount - 4), excluded: {stage: string; reason: string}[] = [];
  const query = (table: ReturnType<typeof buildRailArcTable>, bit: number, stage: string) => {
    try {
      const value = railParameterAtDistance(table, row.cache, row.distance);
      if (skipped & bit) throw new Error('JS accepted a native out-of-table distance');
      return value;
    } catch (error) {
      if (!(skipped & bit) || !(error instanceof Error) || !error.message.includes('查询越出弧长表')) throw error;
      excluded.push({stage, reason: 'Original distance normalized against old total exceeds rebuilt final entry; original unbounded scan and macOS diagnostic/assert path excluded. JS rejects after preserving original rebuild.'});
      return 0;
    }
  };
  const table = buildRailArcTable(row.cache, row.subdivisions, row.size), values = [...table.pairs.flat(), table.totalLength];
  values.push(railArcLength(row.cache, row.from, row.to, row.subdivisions), railDistanceAtParameter(table, row.cache, row.parameter), query(table, 1, 'distance'));
  table.dirty = row.dirty;table.totalLength = row.oldLength;
  values.push(query(table, 2, 'dirty distance'));
  table.dirty = row.dirty;table.totalLength = row.oldLength;
  values.push(railDistanceAtParameter(table, row.cache, row.parameter), ...table.pairs.flat());
  const bytes = Buffer.alloc(byteCount);values.forEach((v, i) => bytes.writeFloatLE(v, i * 4));
  bytes.writeUInt32LE(table.subdivisions, values.length * 4);bytes.writeFloatLE(table.totalLength, values.length * 4 + 4);bytes.writeUInt32LE(Number(table.dirty), values.length * 4 + 8);
  bytes.writeUInt32LE(skipped, values.length * 4 + 12);
  const mismatches = Array.from({length: bytes.length / 4}, (_, i) => i).filter(i => !bytes.subarray(i * 4, i * 4 + 4).equals(native.subarray(i * 4, i * 4 + 4)));
  return {...row, excluded, skipped, passed: bytes.equals(native), nativeHex: native.toString('hex'), actualHex: bytes.toString('hex'), mismatches};
});
if (at !== raw.length) throw new Error('Invalid arc oracle output');
const report = {passed: results.every(r => r.passed), executableSha256: hash, cases: rows.length,
  exactFloat32Components: rows.reduce((v, r) => v + r.size * 4 + 7, 0) - results.reduce((n, r) => n + r.excluded.length, 0),
  excludedQueries: results.flatMap(r => r.excluded.map(e => ({level: r.level, nodeId: r.nodeId, distance: r.distance, oldLength: r.oldLength, ...e}))),
  corpusRails: rows.filter(r => r.level).length, functions: {length: '0x10055c6a0', table: '0x10055b560', parameterToDistance: '0x10055d410', distanceToParameter: '0x10055d4e0', levelLoad: '0x10055bc50'},
  scope: 'Original arc interval sampler, table build and both conversion bodies on initialized position/table snapshots, Linux fmodf; lazy 16-subdivision rebuild in both conversion bodies and resulting table/length/subdivision/dirty state compared exactly. Actual 402 Rail cached positions supplied. Query-specific unsafe old-length endpoints reported and excluded using native-built preview table; original sampler/build/conversion bodies unmodified. Allocation, automatic Barn registration/level-load dispatch, dynamic getter/state updates, diagnostic/exception paths, generic movement events and game runtime excluded.',
  failures: results.filter(r => !r.passed)};
fs.writeFileSync('docs/rail-arc-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (!report.passed) fs.writeFileSync(`docs/rail-arc-oracle-failure-${Date.now()}.json`, JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/rail-arc-native.json', JSON.stringify({scope: report.scope, cases: results.map(({actualHex, passed, mismatches, ...r}) => {
  const negativeZeroPaths: string[][] = [];
  const visit = (v: any, p: string[]) => {if (typeof v === 'number' && Object.is(v, -0)) negativeZeroPaths.push(p);
    else if (v && typeof v === 'object') for (const k of Object.keys(v)) visit(v[k], [...p, k]);};visit(r, []);return {...r, negativeZeroPaths};
})}) + '\n');
console.log(JSON.stringify({...report, failures: report.failures.slice(0, 1)}));
if (!report.passed) process.exitCode = 1;
