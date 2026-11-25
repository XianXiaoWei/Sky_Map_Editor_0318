import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {stepEnvironmentGust, type GustMath} from '../src/core/environment-gust';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original supplied executable');
let seed = 318;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2 ** 32);
const f = Math.fround;
const rows = Array.from({length: 256}, (_, i) => ({state: {
  ambient: f(i < 8 ? 0 : random() * 8.5), phase0: f(i < 8 ? 0 : random() * 43200), phase1: f(i < 8 ? 0 : random() * 43200),
  smoothedWind: [f(random() * 10), 0, f(random() * 10)]}, input: {
  time: f(i < 8 ? [0, .001, 1, 29.999, 30, 300, 43199.9, 43200][i] : random() * 43200),
  scaledDelta: f([.0001, 1 / 60, .05, .266][i % 4]), ambientTarget: f([1.5, 8.5, 0, 5][i % 4]),
  boundaryForce: [f(random() * 4), f(random() * 4), f(random() * 4)],
  ...(i % 5 === 0 ? {overrideWind: [f(random() * 6), f(random() * 6), f(random() * 6)]} : {})}}));
const wire = Buffer.alloc(4 + rows.length * 72); wire.writeUInt32LE(rows.length); let at = 4;
for (const row of rows) {
  for (const v of [row.state.ambient, row.state.phase0, row.state.phase1, ...row.state.smoothedWind,
    row.input.time, row.input.scaledDelta, row.input.ambientTarget]) {wire.writeFloatLE(v, at); at += 4;}
  wire.writeUInt32LE(Number(Boolean(row.input.overrideWind)), at); at += 4;
  for (const v of [...row.input.boundaryForce, 0, ...(row.input.overrideWind ?? [0, 0, 0]), 0]) {wire.writeFloatLE(v, at); at += 4;}
}
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-environment-gust-')); let raw: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-environment-gust-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input: wire, timeout: 60000, maxBuffer: 4e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`); raw = run.stdout;
} finally {fs.rmSync(temp, {recursive: true, force: true});}
at = 4;
const bytes = (v: ReturnType<typeof stepEnvironmentGust>) => {
  const b = Buffer.alloc(36); [v.ambient, v.phase0, v.phase1, ...v.smoothedWind, ...v.globalWind].forEach((x, i) => b.writeFloatLE(x, i * 4)); return b;
};
const results = rows.map(row => {
  const native = raw.subarray(at, at + 36); at += 36;
  const count = raw.readUInt32LE(at); at += 4;
  const mathTrace = Array.from({length: count}, (_, i) => raw.readFloatLE(at + i * 4)); at += count * 4;
  let cursor = 0;
  const take = (x: number) => {
    const expected = mathTrace[cursor++]; if (expected !== f(x)) throw new Error(`Native math argument mismatch ${expected} != ${x}`);
    return mathTrace[cursor++];
  };
  const math: GustMath = {cos: take, exp: take, sincos: x => [take(x), mathTrace[cursor++]]};
  const actual = bytes(stepEnvironmentGust(row.state, row.input, math));
  if (cursor !== count) throw new Error('Native math trace not fully consumed');
  const preview = bytes(stepEnvironmentGust(row.state, row.input));
  return {...row, mathTrace, nativeHex: native.toString('hex'), actualHex: actual.toString('hex'),
    passed: actual.equals(native), previewPassed: preview.equals(native), previewHex: preview.toString('hex')};
});
if (at !== raw.length) throw new Error('Native output not fully consumed');
const report = {passed: results.every(r => r.passed), cases: results.length, exactFloat32Components: results.length * 9,
  executableSha256: hash, function: '0x100324a80', span: '0x100326666..0x1003273b6',
  scope: 'Original global gust instruction span, original RIP and branch control, explicit entry/RET exit harness. Initialized state/time/delta, selected ambient target and preceding boundary force are explicit. libm cosf/expf/sincosf calls bind Linux libc and are traced; trace-return production arithmetic is compared exactly. Full Update/lifecycle/SetWind events, macOS libm, scratch W, Vulkan integration and game acceptance are excluded.',
  previewMath: {passed: results.every(r => r.previewPassed), failures: results.filter(r => !r.previewPassed).map(({actualHex, passed, ...r}) => r), scope: 'float32-rounded JavaScript Math against Linux libc callbacks; macOS libm remains unverified'},
  failures: results.filter(r => !r.passed)};
fs.writeFileSync('docs/environment-gust-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/environment-gust-native.json', JSON.stringify({scope: report.scope,
  cases: results.map(({actualHex, passed, previewPassed, previewHex, ...r}) => r)}) + '\n');
console.log(JSON.stringify({...report, failures: report.failures.slice(0, 2), previewMath: {...report.previewMath, failures: report.previewMath.failures.length}}));
if (!report.passed) process.exitCode = 1;
