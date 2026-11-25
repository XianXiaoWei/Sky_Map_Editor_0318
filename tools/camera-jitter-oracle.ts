import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { cameraSampling, temporalGaussianKernel, jitterViewProjection, correctPreviousViewProjection } from '../src/core/camera-sampling';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha256 = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (sha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original executable');
const sizes = [[1, 1], [320, 180], [127, 95], [1920, 1080], [16384, 1], [1, 16384], [641, 359], [256, 256]];
const cases = sizes.flatMap(size => [false, true].flatMap(centeredProjection => Array.from({ length: 32 }, (_, frame) => {
  const previous = { jitter: [Math.fround((frame - 11) / 1234), Math.fround((frame + 2) / -789)], jitterHalf: [Math.fround((frame + 4) / 5432), Math.fround((frame - 9) / 9876)] };
  const matrix = Array.from({ length: 16 }, (_, i) => Math.fround(Math.sin((frame + 3) * (i + 1)) * (i > 11 ? 1000 : 2)));
  return { frame, size, centeredProjection, previous, matrix };
})));
const input = Buffer.alloc(4 + cases.length * 96); input.writeUInt32LE(cases.length);
cases.forEach((c, i) => {
  const at = 4 + i * 96;
  input.writeUInt32LE(c.frame, at); input.writeUInt32LE(c.size[0], at + 4); input.writeUInt32LE(c.size[1], at + 8); input.writeUInt32LE(Number(c.centeredProjection), at + 12);
  [...c.previous.jitter, ...c.previous.jitterHalf, ...c.matrix].forEach((v, j) => input.writeFloatLE(v, at + 16 + j * 4));
});
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-camera-jitter-')); let raw: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-camera-jitter-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(String(build.stderr));
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, maxBuffer: 1e6, timeout: 60000 });
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`); raw = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const stride = 332;
if (raw.length !== 4 + cases.length * stride || raw.readUInt32LE() !== cases.length) throw new Error('Invalid native output');
const bytes = (values: number[]) => { const out = Buffer.alloc(values.length * 4); values.forEach((v, i) => out.writeFloatLE(v, i * 4)); return out; };
const rows = cases.map((c, i) => {
  const native = raw.subarray(4 + i * stride, 4 + (i + 1) * stride);
  const s = cameraSampling(c.frame, c.size[0], c.size[1], c.previous, c.centeredProjection);
  const exponentials = Array.from({ length: 9 }, (_, j) => [native.readFloatLE(132 + j * 8), native.readFloatLE(136 + j * 8)]);
  let next = 0, argumentsExact = true;
  const captured = temporalGaussianKernel(c.size[0], c.size[1], s.pixelOffset, argument => {
    const pair = exponentials[next++]; argumentsExact &&= bytes([argument]).equals(bytes([pair[0]])); return pair[1];
  });
  const kernelBytes = (k: typeof captured) => bytes([...k.u_aaCornerUvs0, ...k.u_aaCornerUvs1, ...k.u_aaCornerWeights, k.u_aaCenterWeight]);
  const jitterBytes = bytes([...s.jitter, 0, 0, ...s.jitterHalf, 0, 0, ...s.jitterOld, 0, 0, ...s.jitterHalfOld, 0, 0]);
  const shiftBytes = bytes([...s.projectionShift, ...s.previousProjectionShift]);
  const projectionBytes = bytes(jitterViewProjection(c.matrix, s.projectionShift));
  return { ...c, exponentials, nativeHex: native.toString('hex'), argumentsExact,
    capturedKernelExact: kernelBytes(captured).equals(native.subarray(0, 52)), productionKernelExact: kernelBytes(s).equals(native.subarray(0, 52)),
    jitterExact: jitterBytes.equals(native.subarray(52, 116)), projectionShiftExact: shiftBytes.equals(native.subarray(116, 132)),
    projectionMultiplyExact: projectionBytes.equals(native.subarray(204, 268)),
    previousProjectionCorrectionExact: bytes(correctPreviousViewProjection(c.matrix, s.projectionShift, s.previousProjectionShift)).equals(native.subarray(268, 332)) };
});
const checks = ['argumentsExact', 'capturedKernelExact', 'productionKernelExact', 'jitterExact', 'projectionShiftExact', 'projectionMultiplyExact', 'previousProjectionCorrectionExact'] as const;
const report = { passed: rows.every(r => checks.every(k => r[k])), cases: rows.length, components: rows.length * 83,
  executableSha256: sha256, checks: Object.fromEntries(checks.map(k => [k, { passed: rows.every(r => r[k]), failures: rows.filter(r => !r[k]).length }])),
  scope: 'Unmodified native CameraSystem Gaussian reconstruction, literal eight-phase full and 32-phase half sequence, current/old uniform writes, original clip translation matrix multiply and current-translation/inverse-previous-translation/previous-projection chain. Frame number and centered-projection flag are explicit inputs. expf import is bound to Linux libm with arguments/returns captured; production Math.exp float32 is separately compared. Stop before unrelated near/far, complete camera lifecycle and game render scheduling. Darwin/macOS libm and Metal parity excluded.',
  failures: rows.filter(r => checks.some(k => !r[k])) };
fs.writeFileSync('docs/camera-jitter-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/camera-jitter-native.json', JSON.stringify({ scope: report.scope, cases: rows.map(({ argumentsExact, capturedKernelExact, productionKernelExact, jitterExact, projectionShiftExact, projectionMultiplyExact, previousProjectionCorrectionExact, ...r }) => r) }) + '\n');
console.log(JSON.stringify({ ...report, failures: report.failures.slice(0, 2) })); if (!report.passed) process.exitCode = 1;
