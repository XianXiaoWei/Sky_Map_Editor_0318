import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { moveObjectAlongRailCases, prepareMoveObjectAlongRail, evaluateMoveObjectAlongRail, MOVE_RAIL_ARENA, MOVE_RAIL_ROW } from './move-object-along-rail-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = sha(fs.readFileSync(executable));
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Original executable SHA differs');
const cases = moveObjectAlongRailCases(), rows: unknown[] = [], failures: unknown[] = [], temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-move-object-along-rail-'));
let comparedBytes = 0, serviceCalls = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-mavx', '-Wall', '-Wextra', 'tools/native-move-object-along-rail-oracle.c', '-lm', '-o', runner]);
  fs.writeFileSync('/root/sky-research/move-object-along-rail-native-build.log', build.stderr);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 8) {
    const batch = cases.slice(start, start + 8), header = Buffer.alloc(4); header.writeUInt32LE(batch.length);
    const input = Buffer.concat([header, ...batch.flatMap(c => { const mode = Buffer.alloc(4); mode.writeUInt32LE(c.mode); return [mode, prepareMoveObjectAlongRail(c).b]; })]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 32e6 });
    if (run.status !== 0) throw new Error(`batch ${start} ${batch.map(c => c.label)}: ${run.status} ${run.signal}: ${run.stderr}`);
    if (run.stdout.readUInt32LE() !== batch.length) throw new Error('Native count differs'); let at = 4;
    for (const c of batch) {
      const calls = run.stdout.readUInt32LE(at + 8), n = 16 + MOVE_RAIL_ARENA + calls * MOVE_RAIL_ROW, native = run.stdout.subarray(at, at + n); at += n;
      let actual: Buffer; try { actual = evaluateMoveObjectAlongRail(c); } catch (e) { failures.push({ input: c, error: String(e) }); break; }
      comparedBytes += n; serviceCalls += calls;
      if (!actual.equals(native)) {
        const differences = []; for (let i = 0; i < Math.max(actual.length, n) && differences.length < 24; i++) if (actual[i] !== native[i]) differences.push({ at: i, arena: i >= 16 && i < 16 + MOVE_RAIL_ARENA ? '0x' + (i - 16).toString(16) : undefined, actual: actual[i], native: native[i] });
        failures.push({ input: c, actualBytes: actual.length, nativeBytes: n, differences });
        fs.writeFileSync('/root/sky-research/move-object-along-rail-native-failure.bin', native); fs.writeFileSync('/root/sky-research/move-object-along-rail-actual-failure.bin', actual);
      }
      rows.push({ input: c, inputSha256: sha(prepareMoveObjectAlongRail(c).b), nativeSha256: sha(native) }); if (failures.length) break;
    }
    if (failures.length) break; if (at !== run.stdout.length) throw new Error('Trailing native bytes');
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, comparedCases: rows.length, comparedBytes, serviceCalls, caseBreakdown: Object.fromEntries([0, 1, 2, 3, 4, 5, 6].map(mode => [mode, cases.filter(c => c.mode === mode).length])), scope: 'Whole MoveObjectAlongRail placement, Load, Enable, Finish and Unload with full arena and ordered traces. Heap, metadata casts, Object transform, Rail nearest/distance and random are explicit services. The original Enable body is untouched; its caller supplies the unwritten scale W. Sway phase Z/W are cleared by native VMOVSS/VINSERTPS. Covers network allocation/assertions, null/repeated release, record padding, native time/speed clamps, XYZ normalization versus four-lane scales, NaN and callback rereads. Mode 6 also executes untouched original Rail nearest and distance-at-parameter against five actual fish configurations, six-Marker caches and 32-subdivision arc tables. Original caches use archived native atan2 replay. Full Rail lifecycle, Update, Model/EventBarn motion, rendering and complete creature acceptance remain pending', failures };
fs.writeFileSync('docs/move-object-along-rail-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/move-object-along-rail-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
