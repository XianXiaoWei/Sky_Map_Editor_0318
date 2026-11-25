import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
import { animationAdditiveCases, animationAdditiveInput, animationAdditiveExpected } from './resource-animation-additive-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-additive-')), cases = animationAdditiveCases(data), failures: unknown[] = [], rows: unknown[] = [], reciprocals = new Map<number, number>(); let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-additive-oracle.c', '-o', runner, '-lm']); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (const c of cases) {
    const prepared = c.requests.map(r => ({ request: r, expected: animationAdditiveExpected(c.pack, r) }));
    const input = Buffer.concat([u32(1), u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...prepared.map(p => animationAdditiveInput(c.pack, p.request, p.expected.rsqrtInputs))]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 40000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    let at = 8;
    for (const p of prepared) {
      const native = run.stdout.subarray(at, at + p.expected.output.length); at += p.expected.output.length;
      const powCount = run.stdout.readUInt32LE(at); at += 4; const powTrace = run.stdout.subarray(at, at + powCount * 12); at += powTrace.length;
      const replay = animationAdditiveExpected(c.pack, p.request, powTrace), expected = replay.output;
      if (JSON.stringify(replay.rsqrtInputs) !== JSON.stringify(p.expected.rsqrtInputs)) throw new Error('Scale powf affected quaternion reciprocal inputs');
      comparedBytes += expected.length; comparedCases++;
      if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ resource: c.source.id, request: p.request.id, input: p.request, differences }); }
      const count = run.stdout.readUInt32LE(at); at += 4; if (count !== p.expected.rsqrtInputs.length) throw new Error('Reciprocal count differs');
      const pairs = run.stdout.subarray(at, at + count * 8); at += count * 8;
      for (let i = 0; i < count; i++) {
        const inputBits = pairs.readUInt32LE(i * 8), outputBits = pairs.readUInt32LE(i * 8 + 4), proposed = bits(1 / Math.fround(Math.sqrt(value(inputBits))));
        if (inputBits !== p.expected.rsqrtInputs[i] || proposed !== outputBits) failures.push({ id: p.request.id, reciprocal: { inputBits, outputBits, proposed } });
        reciprocals.set(inputBits, outputBits);
      }
      rows.push({ id: p.request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationAdditiveInput(c.pack, p.request, p.expected.rsqrtInputs)), nativeSha256: sha(native), powTrace: powTrace.toString('base64'), rsqrtPairs: pairs.toString('base64') });
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output'); if (failures.length) break;
    console.log(`checked ${c.source.id}: ${c.requests.length} additive updates`);
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, resources: cases.length, comparedCases, comparedBytes, reciprocalInputs: reciprocals.size, scope: 'Whole original additive update, request clock and non-mirrored pack sample execute unmodified. Controller/masks and Transform-node bytes compared for reverse clocks, forward additions, root-motion gates, timed actions and no-op paths. SIMD groups use linear scale factors and refined RSQRTPS; scalar tails use powf, SQRTSS and a separate quaternion multiplication order. Native libc powf is an explicit traced and replayed service; all proposed inputs/order are checked. RSQRTPS inputs execute separately on QEMU reference CPU, without a claim of Intel/AMD approximation parity. Pack finalization/reference and mirror maps, skeleton/Model ownership, full effect consumers and creature AI remain pending.', failures };
fs.writeFileSync('docs/resource-animation-additive-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-additive-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
