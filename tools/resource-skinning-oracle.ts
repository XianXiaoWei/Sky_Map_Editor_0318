import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { resourceSkinningCases, resourceSkinRequest, resourceSkinExpected } from './resource-skinning-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = resourceSkinningCases(data), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-resource-skin-')), rows: unknown[] = [], failures: unknown[] = [], capabilities = new Map<number, number>();
let comparedBytes = 0, comparedCases = 0, vertices = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-msse4.1', 'tools/native-resource-skinning-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 8) {
    const batch = cases.slice(start, start + 8), run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input: Buffer.concat([u32(batch.length), ...batch.map(resourceSkinRequest)]), timeout: 60000, maxBuffer: 90000000 });
    if (run.status !== 0) throw new Error(`Batch ${start}: ${run.status}:${run.signal}:${run.stderr}`);
    if (run.stdout.readUInt32LE(0) !== batch.length) throw new Error('Native case count differs');
    let at = 4;
    for (const c of batch) {
      const count = c.lod.positions.length / 3, size = count * 52 + 64, native = run.stdout.subarray(at, at + size), pairs = run.stdout.subarray(at + size, at + size + count * 8); at += size + count * 8;
      try {
        const expected = resourceSkinExpected(c, pairs); comparedBytes += size; comparedCases++; vertices += count;
        if (!expected.equals(native)) { const differences = []; for (let i = 0; i < size && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ id: c.id, differences }); }
      } catch (e) { failures.push({ id: c.id, error: String(e) }); }
      rows.push({ id: c.id, sourceSha256: sha(c.source), requestSha256: sha(resourceSkinRequest(c)), nativeSha256: sha(native), rsqrtPairs: pairs.toString('base64') });
      if (c.id.endsWith(':default')) for (let i = 0; i < pairs.length; i += 8) { const x = pairs.readUInt32LE(i), y = pairs.readUInt32LE(i + 4); if (capabilities.has(x) && capabilities.get(x) !== y) throw new Error('Conflicting native RSQRT output'); capabilities.set(x, y); }
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output');
    if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedCases, comparedBytes, vertices, defaultNormalCapabilities: capabilities.size,
  scope: 'Original position-only and position+normal wrapper/consumer/helper machine code is unmodified. All valid XYZ, unchanged color and normal W bytes and output guards compared. Allocator/free are explicit services. RSQRT pairs execute on the same independent native CPU capability and scratch-only W lanes are zeroed. Embedded default and sampled palettes plus prepared identity palettes for stripped resources exercise every real animated LOD. Controller/AI/material/lifecycle integration is separate.', failures };
fs.writeFileSync('docs/resource-skinning-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) {
  fs.writeFileSync('tests/fixtures/resource-skinning-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
  const sorted = [...capabilities].sort((a, b) => a[0] - b[0]), table = Buffer.alloc(8 + sorted.length * 8); table.writeUInt32LE(0x52535154); table.writeUInt32LE(sorted.length, 4); sorted.forEach(([x, y], i) => { table.writeUInt32LE(x, 8 + i * 8); table.writeUInt32LE(y, 12 + i * 8); });
  fs.writeFileSync('docs/resource-skinning-rsqrt.bin', table); fs.writeFileSync('docs/resource-skinning-rsqrt.json', JSON.stringify({ executableSha256, binarySha256: sha(table), inputs: sorted.length, data: table.toString('base64'), scope: 'Only observed default-pose normal RSQRT inputs. Unknown inputs fail; this capability does not prescribe controller animation or CPU parity.' }, null, 2) + '\n');
}
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
