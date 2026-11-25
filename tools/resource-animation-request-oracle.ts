import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { u32 } from '../src/core/binary';
import { animationRequestCases, animationRequestInput, animationRequestExpected } from './resource-animation-request-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const listBytes = fs.readFileSync(path.join(data, 'Meshes/Bin/AnimationList.dat')), list = readResourceAnimationList(listBytes);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-request-')), cases = animationRequestCases(data, list), failures: unknown[] = [], rows: unknown[] = []; let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-request-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 3) {
    const batch = cases.slice(start, start + 3), input = Buffer.concat([u32(listBytes.length), listBytes, u32(batch.length), ...batch.flatMap(c => [u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...c.requests.map(r => animationRequestInput(c.pack, r))])]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 30000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const count = run.stdout.readUInt32LE(at); at += 4; if (count !== c.requests.length) throw new Error('Native request count differs');
      for (const request of c.requests) {
        const expected = animationRequestExpected(c.pack, list, request), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
        if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ resource: c.source.id, request: request.id, mode: request.mode, name: request.name, differences }); }
        rows.push({ id: request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationRequestInput(c.pack, request)), nativeSha256: sha(native) });
      }
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, animationListSha256: sha(listBytes), resources: cases.length, comparedCases, comparedBytes, scope: 'Whole original PlayRange, debug-disabled PlayNamed, FindNamed, FindFile, range lookup and loop-sign consumers execute unmodified. Full controller bytes, all request pools, mask bytes, returned indices and original assertion ordering compared on real/synthetic resources. Original list/pack readers run; type tags, zero allocator, release, C-locale imports and absent pack finalization library are explicit preparation services. Does not claim skeleton allocation, AI, blend/events or complete classes.', failures };
fs.writeFileSync('docs/resource-animation-request-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-requests-native.json.gz', gzipSync(JSON.stringify({ executableSha256, animationListSha256: sha(listBytes), cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
