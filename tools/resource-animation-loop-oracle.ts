import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { animationLoopCases, animationLoopRequest, animationLoopExpected } from './resource-animation-loop-cases';
import { u32 } from '../src/core/binary';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-loop-')), cases = animationLoopCases(data), failures: unknown[] = [], rows: unknown[] = []; let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-DANIMATION_LOOP_ORACLE', 'tools/native-resource-animation-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 4) {
    const batch = cases.slice(start, start + 4), input = Buffer.concat([u32(batch.length), ...batch.flatMap(c => [u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...c.requests.map(animationLoopRequest)])]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 4000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const line = run.stdout.readUInt32LE(at), severity = run.stdout.readUInt32LE(at + 4), count = run.stdout.readUInt32LE(at + 8); at += 12; if (line || severity || count !== c.requests.length) throw new Error(`${c.source.id}: original assertion ${line}:${severity}`);
      for (let i = 0; i < count; i++) { const expected = animationLoopExpected(c.pack, c.requests[i]), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
        if (!expected.equals(native)) failures.push({ resource: c.source.id, request: i, actual: expected.toString('hex'), native: native.toString('hex') });
        rows.push({ resource: c.source.id, request: i, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationLoopRequest(c.requests[i])), nativeSha256: sha(native) });
      }
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, resources: cases.length, comparedCases, comparedBytes, scope: 'Whole original loop quaternion sign function and its original readers/endpoint sampler run unmodified. All mask bytes, unused trailing mask bits and negative counts compared over full and partial real/synthetic clips. Allocation/free/stack guard and absent AnimationList are explicit services; controller binding remains separate.', failures };
fs.writeFileSync('docs/resource-animation-loop-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-loops-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
