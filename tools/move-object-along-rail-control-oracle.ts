import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { moveRailControlCases, prepareMoveRailControl, evaluateMoveRailControl } from './move-object-along-rail-control-cases';
import { MOVE_RAIL_ARENA, MOVE_RAIL_ROW } from './move-object-along-rail-cases';
import { u32 } from '../src/core/binary';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const cases = moveRailControlCases(), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-move-control-'));
const failures: unknown[] = [], rows: unknown[] = [];
let comparedBytes = 0, serviceCalls = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-no-pie', 'tools/native-move-object-along-rail-control-oracle.c', '-o', runner, '-lm']);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const input = Buffer.concat([u32(cases.length), ...cases.flatMap(c => [u32(c.mode), prepareMoveRailControl(c).b])]);
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 240000000 });
  if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
  if (run.stdout.readUInt32LE(0) !== cases.length) throw new Error('Native case count differs');
  let at = 4;
  for (const c of cases) {
    const calls = run.stdout.readUInt32LE(at + 8), length = 16 + MOVE_RAIL_ARENA + calls * MOVE_RAIL_ROW;
    const native = run.stdout.subarray(at, at + length); at += length;
    const count = run.stdout.readUInt32LE(at); at += 4;
    const expTrace = run.stdout.subarray(at, at + count * 8); at += expTrace.length;
    const expected = evaluateMoveRailControl(c, expTrace); comparedBytes += expected.length; serviceCalls += calls;
    if (!native.equals(expected)) {
      const differences = []; for (let i = 0; i < Math.max(expected.length, native.length) && differences.length < 32; i++) if (expected[i] !== native[i]) differences.push({ at: i, expected: expected[i], native: native[i] });
      failures.push({ input: c, expectedLength: expected.length, nativeLength: native.length, differences });
      fs.writeFileSync('/root/sky-research/move-control-failure-actual.bin', expected); fs.writeFileSync('/root/sky-research/move-control-failure-native.bin', native);
    }
    rows.push({ input: c, inputSha256: sha(prepareMoveRailControl(c).b), nativeSha256: sha(native), expTrace: expTrace.toString('base64') });
    if (failures.length) break;
  }
  if (!failures.length && at !== run.stdout.length) throw new Error('Trailing native output');
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedCases: rows.length, comparedBytes, serviceCalls, start: '0x100484a90', objectPhaseBoundary: '0x100484fc0', wholeFunctionEnd: '0x100486690', wholeMoveUpdateVerified: false, scope: 'Original MoveObjectAlongRail.Update control flow executes until its first object-loop boundary, including original out-of-line clock/assertion paths and complete empty/disabled return paths. Entire arena and ordered metadata/rail/session/objective/avatar/network/finish services are compared for live rereads, double-clock selection, tracking bounds, native quintic easing, progress smoothing/loop clamps and counter/finish gating. expf is a traced native libc service with verified input/order. Positive-object cases stop before movement/turn/sway/Model transforms and must not be counted as complete Update or creature playback. Resource/world ownership and full scene behavior remain pending.', failures };
fs.writeFileSync('docs/move-object-along-rail-control-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/move-object-along-rail-control-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
