import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { onRegionCases, prepareOnRegion, evaluateOnRegion, ON_REGION_ARENA, ON_REGION_ROW } from './on-region-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = sha(fs.readFileSync(executable));
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Original executable SHA differs');
const cases = onRegionCases(), rows: unknown[] = [], failures: unknown[] = [], temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-on-region-'));
let comparedBytes = 0, serviceCalls = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-mavx', '-Wall', '-Wextra', 'tools/native-on-region-oracle.c', '-o', runner]);
  fs.writeFileSync('/root/sky-research/on-region-native-build.log', build.stderr);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 8) {
    const batch = cases.slice(start, start + 8), header = Buffer.alloc(4); header.writeUInt32LE(batch.length);
    const input = Buffer.concat([header, ...batch.flatMap(c => { const mode = Buffer.alloc(4); mode.writeUInt32LE(c.mode); return [mode, prepareOnRegion(c).b]; })]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 32e6 });
    if (run.status !== 0) throw new Error(`batch ${start} ${batch.map(c => c.label)}: ${run.status} ${run.signal}: ${run.stderr}`);
    if (run.stdout.readUInt32LE() !== batch.length) throw new Error('Native count differs'); let at = 4;
    for (const c of batch) {
      const calls = run.stdout.readUInt32LE(at + 8), n = 16 + ON_REGION_ARENA + calls * ON_REGION_ROW, native = run.stdout.subarray(at, at + n); at += n;
      let actual: Buffer; try { actual = evaluateOnRegion(c); } catch (e) { failures.push({ input: c, error: String(e) }); break; }
      comparedBytes += n; serviceCalls += calls;
      if (!actual.equals(native)) {
        const differences = []; for (let i = 0; i < Math.max(actual.length, n) && differences.length < 24; i++) if (actual[i] !== native[i]) differences.push({ at: i, arena: i >= 16 && i < 16 + ON_REGION_ARENA ? '0x' + (i - 16).toString(16) : undefined, actual: actual[i], native: native[i] });
        failures.push({ input: c, actualBytes: actual.length, nativeBytes: n, differences });
        fs.writeFileSync('/root/sky-research/on-region-native-failure.bin', native); fs.writeFileSync('/root/sky-research/on-region-actual-failure.bin', actual);
      }
      rows.push({ input: c, inputSha256: sha(prepareOnRegion(c).b), nativeSha256: sha(native) }); if (failures.length) break;
    }
    if (failures.length) break; if (at !== run.stdout.length) throw new Error('Trailing native bytes');
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, comparedCases: rows.length, comparedBytes, serviceCalls, caseBreakdown: Object.fromEntries([0, 1, 2, 3, 4, 5].map(mode => [mode, cases.filter(c => c.mode === mode).length])), scope: 'Whole OnRegion constructor, Enable and Update and PlayAnimation placement with full arena and ordered boundary traces. Actual native matrix product is used in every Update case; actual tolerant point predicate is used in mode 1 and separately compared in mode 4. Barn, camera, metadata casts, transform/OBB virtuals, Clump enabling and Event.Start remain explicit external services. Covers flags, pair and distinct counts, SIMD reduction, signed thresholds, origin/NaN skip, remote avatar activation, private position W and callback rereads. Shared scene EventBarn/Model/viewport and rail movement are not accepted by this comparison.', failures };
fs.writeFileSync('docs/on-region-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/on-region-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
