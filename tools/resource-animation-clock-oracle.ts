import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { animationClockCases, animationClockRequest, animationClockExpected } from './resource-animation-clock-cases';
const exe = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(exe)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = animationClockCases(), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-clock-')), failures: unknown[] = [], rows: unknown[] = [];
let comparedBytes = 0, comparedCases = 0, powCalls = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-clock-oracle.c', '-o', runner, '-lm']); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 2000) {
    const batch = cases.slice(start, start + 2000), run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, exe], { input: Buffer.concat([u32(batch.length), ...batch.map(animationClockRequest)]), timeout: 60000, maxBuffer: 20000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const native = run.stdout.subarray(at, at + 116), calls = run.stdout.readUInt32LE(at + 116), trace = run.stdout.subarray(at + 120, at + 120 + calls * 12); at += 120 + calls * 12;
      try { const expected = animationClockExpected(c, trace); comparedBytes += expected.length; comparedCases++; powCalls += calls;
        if (!expected.equals(native)) { const differences = []; for (let p = 0; p < expected.length && differences.length < 20; p++) if (expected[p] !== native[p]) differences.push({ at: p, actual: expected[p], native: native[p] }); failures.push({ id: c.id, differences }); }
      } catch (error) { failures.push({ id: c.id, error: String(error) }); }
      rows.push({ id: c.id, requestSha256: sha(animationClockRequest(c)), nativeSha256: sha(native), powTrace: trace.toString('base64') });
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedCases, comparedBytes, powCalls, scope: 'Whole original Animation request clock with no machine code edits; full 0x70-byte state and accumulated weight compared. Prepared request fields exercise single frames, wrapping, negative rates/deltas, all easing branches, action fade/retirement and prior accumulated weights. powf is an explicit recorded Linux float math service, not a restored Darwin import. Controller ordering/request binding/animation metadata integration remains separate.', failures };
fs.writeFileSync('docs/resource-animation-clock-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-clock-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
