import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { animationLoadCases, animationLoadInput, animationLoadExpected } from './resource-animation-load-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-load-')), cases = animationLoadCases(data), rows: unknown[] = [], failures: unknown[] = []; let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-load-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (const c of cases) {
    const input = Buffer.concat([u32(c.requests.length), ...c.requests.map(request => animationLoadInput(c.pack, request, c.realList))]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 120000000 }); if (run.status !== 0) throw new Error(`${c.source.id}:${run.status}:${run.signal}:${run.stderr}`);
    if (run.stdout.readUInt32LE(0) !== c.requests.length) throw new Error('Native load count differs');
    let at = 4;
    for (const request of c.requests) {
      const expected = animationLoadExpected(c.pack, request, c.realList), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
      if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ id: request.id, input: request, differences }); }
      rows.push({ id: request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationLoadInput(c.pack, request, c.realList)), nativeSha256: sha(native) });
    }
    if (at !== run.stdout.length) throw new Error('Trailing load output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, resources: cases.length, comparedCases, comparedBytes, scope: 'Complete unmodified Animation.Load/LoadPack, with original RegisterPack/Skeleton/Masks/Transform/Finalize/MirrorMap/Matrix child bodies and original AnimationList reader. ResourceRef constructor/Observe/destructor execute PC-independent instruction-aligned prefixes followed by original tails; stack identities and retained padding are normalized to supplied scratch slots. All retained arena bytes, resource handle lists, reference snapshots, resource lookup/callback order, registration allocation tags/order and returned processed-name counts compared. Registry arrays, manager/type lookups and resource virtual callbacks are explicit owner inputs, not a claim of registry loading or full Model constructor. Covers mesh-only/external-only/both/neither, observed failures, missing embedded pack, zero-bone and mismatched-bone failures, empty/missing/case-sensitive/duplicate/multiple-name groups and mirrored finalization. Actual Model creation, dynamic viewport, creature AI and exception unwind remain pending', failures };
fs.writeFileSync('docs/resource-animation-load-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-load-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
