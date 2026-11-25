import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { animationSkeletonCases, animationSkeletonInput, animationSkeletonExpected } from './resource-animation-skeleton-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-skeleton-')), cases = animationSkeletonCases(data), rows: unknown[] = [], failures: unknown[] = []; let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-skeleton-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (const c of cases) {
    const input = Buffer.concat([u32(c.requests.length), ...c.requests.map(request => animationSkeletonInput(c.pack, request))]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 120000000 }); if (run.status !== 0) throw new Error(`${c.source.id}:${run.status}:${run.signal}:${run.stderr}`);
    if (run.stdout.readUInt32LE(0) !== c.requests.length) throw new Error('Native skeleton count differs');
    let at = 4;
    for (const request of c.requests) {
      const expected = animationSkeletonExpected(c.pack, request), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
      if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ id: request.id, input: request, differences }); }
      rows.push({ id: request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationSkeletonInput(c.pack, request)), nativeSha256: sha(native) });
    }
    if (at !== run.stdout.length) throw new Error('Trailing skeleton output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, resources: cases.length, comparedCases, comparedBytes, scope: 'Unmodified InitializeSkeleton/InitializeMasks, uint16 name sort and helpers, Transform constructor/SetParent/MarkDirty and AnimationPack.MirrorRotation. RegisterPack also invokes the original InitializeSkeleton child without hooking it; pack finalization uses an absent animation library and does not claim map generation. All retained arena bytes, two global weight arrays, allocation order/size/alignment and assertion partial writes compared. Includes original stripped packs, duplicate names, byte prefixes, 0..256 bone limits, human masks, missing-name lower_bound and forward-parent descendant propagation, detach/reparent/sibling failures and dirty gates. Mirror rotation uses explicitly prepared map records to exercise additive, basis-corrected and reflection branches with original quaternion inputs; map generation/finalization remains separate. Allocation storage/tag, imported libc and diagnostic escape are explicit services; no shared Model/creature owner or dynamic viewport is claimed.', failures };
fs.writeFileSync('docs/resource-animation-skeleton-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-skeleton-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
