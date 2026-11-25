import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { playAnimationCases, playAnimationRequest, playAnimationExpected } from './play-animation-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-play-animation-')), cases = playAnimationCases(), rows: unknown[] = [], failures: unknown[] = []; let comparedBytes = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-play-animation-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input: Buffer.concat([u32(cases.length), ...cases.map(playAnimationRequest)]), timeout: 60000, maxBuffer: 20000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
  let at = 4;
  for (const c of cases) {
    const expected = playAnimationExpected(c), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length;
    if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ id: c.id, input: c, differences }); }
    rows.push({ id: c.id, requestSha256: sha(playAnimationRequest(c)), nativeSha256: sha(native) });
  }
  if (at !== run.stdout.length) throw new Error('Trailing native output');
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedBytes, scope: 'Whole original PlayAnimation.Update executes unmodified. All arena bytes, ordered controller callouts, string pointers/speed bits, assertions and completion flag compared. Includes live Clump mutation, short/long names, sequence conflicts, speed Float/nonfinite inputs and missing animation. Metadata cast, controller default/current/play/speed and Event.Start are explicit services; controller/Model ownership and full event graph integration remain pending.', failures };
fs.writeFileSync('docs/play-animation-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/play-animation-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
