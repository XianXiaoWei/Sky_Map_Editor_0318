import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { gzipSync } from 'node:zlib';
import { spawnSync } from 'node:child_process';
import { animationResourceCases, nativeAnimationExpected } from './resource-animation-cases';
const exe = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if (sha(fs.readFileSync(exe)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = animationResourceCases(data), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-resource-animation-'));
const rows: unknown[] = [], failures: unknown[] = []; let comparedBytes = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 8) {
    const batch = cases.slice(start, start + 8), count = Buffer.alloc(4); count.writeUInt32LE(batch.length);
    const input = Buffer.concat([count, ...batch.flatMap(c => { const n = Buffer.alloc(4); n.writeUInt32LE(c.bytes.length); return [n, c.bytes]; })]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, exe], { input, timeout: 60000, maxBuffer: 40000000 });
    if (run.status !== 0) throw new Error(`Batch ${start}: ${run.status}: ${run.signal}: ${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const expected = nativeAnimationExpected(c.bytes), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length;
      if (!expected.equals(native)) {
        const differences = []; for (let i = 0; i < Math.min(native.length, expected.length) && differences.length < 20; i++) if (native[i] !== expected[i]) differences.push({ at: i, actual: expected[i], native: native[i] });
        failures.push({ id: c.id, expectedBytes: expected.length, nativeBytes: native.length, differences });
      }
      rows.push({ id: c.id, sourceSha256: sha(c.bytes), nativeSha256: sha(native) });
    }
    if (at !== run.stdout.length) failures.push({ start, trailingBytes: run.stdout.length - at });
    if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedCases: rows.length, comparedBytes,
  scope: 'Unmodified AnimationPack.Read, track/clip readers, bone-index finalization, BinaryStream read/NaN checks and original LZ4 decompression. Names normalized only after first NUL; all matrices, poses, key arrays, 128-byte clip records, flag/index bytes and original stream cursor compared. Zeroed allocator/free/scratch and absent AnimationList are explicit services. Playback, AnimationList retargeting, skinning and creature AI/drawing remain separate.', failures };
fs.writeFileSync('docs/resource-animation-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
