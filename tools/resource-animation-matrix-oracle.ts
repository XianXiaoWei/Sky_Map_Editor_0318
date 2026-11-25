import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { gzipSync } from 'node:zlib';
import { spawnSync } from 'node:child_process';
import { u32 } from '../src/core/binary';
import { animationMatrixCases, animationMatrixExpected, animationMatrixRequest } from './resource-animation-matrix-cases';
const exe = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex'), executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if (sha(fs.readFileSync(exe)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = animationMatrixCases(data), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-matrices-')), failures: unknown[] = [], rows: unknown[] = [];
let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-DANIMATION_MATRIX_ORACLE', 'tools/native-resource-animation-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 4) {
    const batch = cases.slice(start, start + 4), input = Buffer.concat([u32(batch.length), ...batch.flatMap(c => [u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...c.requests.map(animationMatrixRequest)])]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, exe], { input, timeout: 60000, maxBuffer: 40000000 });
    if (run.status !== 0) throw new Error(`Batch ${start}: ${run.status}: ${run.signal}: ${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const line = run.stdout.readUInt32LE(at), severity = run.stdout.readUInt32LE(at + 4), count = run.stdout.readUInt32LE(at + 8); at += 12;
      if (line || severity || count !== c.requests.length) throw new Error(`Native pack ${c.source.id}: ${line}:${severity}:${count}`);
      for (let i = 0; i < count; i++) {
        const expected = animationMatrixExpected(c.pack, c.requests[i]), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
        if (!expected.equals(native)) {
          const differences = []; for (let p = 0; p < expected.length && differences.length < 20; p++) if (expected[p] !== native[p]) differences.push({ at: p, actual: expected[p], native: native[p] });
          failures.push({ resource: c.source.id, request: i, differences });
        }
        rows.push({ resource: c.source.id, request: i, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationMatrixRequest(c.requests[i])), nativeSha256: sha(native) });
      }
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output');
    if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, resources: cases.length, comparedCases, comparedBytes,
  scope: 'Original AnimationPack read/sampler, Transform constructor/SetParent/world update/GetMatrix and full Matrix multiply run as unmodified machine code. All root and bone palette matrix bytes compared, including nonuniform/negative local and axis scales. Original bones, parent links and link matrices consumed. Pose assignment, root inputs, allocation and absent AnimationList are explicit services. Animation controller lifecycle/clock/blending, skinning streams and creature rendering remain separate.', failures };
fs.writeFileSync('docs/resource-animation-matrix-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-matrices-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
