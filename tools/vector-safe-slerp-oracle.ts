import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { vectorSafeSlerpCases, safeSlerpInput, evaluateSafeSlerp } from './vector-safe-slerp-cases';
import { u32 } from '../src/core/binary';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = vectorSafeSlerpCases(), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-safe-slerp-'));
const failures: unknown[] = [], rows: unknown[] = [];
let comparedBytes = 0, mathCalls = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-no-pie', 'tools/native-vector-safe-slerp-oracle.c', '-o', runner, '-lm']);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const input = Buffer.concat([u32(cases.length), ...cases.map(safeSlerpInput)]);
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 16000000 });
  if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
  if (run.stdout.readUInt32LE(0) !== cases.length) throw new Error('Native case count differs');
  let at = 4;
  for (const c of cases) {
    const calls = run.stdout.readUInt32LE(at + 8), length = 108 + calls * 12;
    const native = run.stdout.subarray(at, at + length), mathTrace = native.subarray(108); at += length;
    let expected: Buffer;
    try { expected = evaluateSafeSlerp(c, mathTrace); }
    catch (e) { failures.push({ input: c, error: String(e), mathTrace: mathTrace.toString('hex') }); break; }
    comparedBytes += length; mathCalls += calls;
    if (!native.equals(expected)) {
      const differences = []; for (let i = 0; i < Math.max(expected.length, native.length) && differences.length < 32; i++) if (expected[i] !== native[i]) differences.push({ at: i, expected: expected[i], native: native[i] });
      failures.push({ input: c, differences });
      fs.writeFileSync('/root/sky-research/safe-slerp-actual.bin', expected); fs.writeFileSync('/root/sky-research/safe-slerp-native.bin', native);
    }
    rows.push({ input: c, inputSha256: sha(safeSlerpInput(c)), nativeSha256: sha(native), mathTrace: mathTrace.toString('base64') });
    if (failures.length) break;
  }
  if (!failures.length && at !== run.stdout.length) throw new Error('Trailing native output');
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedCases: rows.length, comparedBytes, mathCalls, start: '0x100111b90', end: '0x100111f30', scope: 'Entire original TGCMath.SafeSlerp including opposing-vector axis selection and perturbation, finite-factor fallback, scalar math input/order, original XYZ normalization and distinct W lanes, output aliases and assertion paths. acosf/sinf results replay native Linux libc values; sinf caller-clobbered XMM0 W is explicitly supplied and compared. This verifies a shared vector helper, not complete MoveObjectAlongRail.Update or creature behavior.', failures };
fs.writeFileSync('docs/vector-safe-slerp-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/vector-safe-slerp-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
