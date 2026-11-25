import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { darkSpotlightCases, prepareDarkSpotlight, evaluateDarkSpotlight, SPOT_SIZE, SPOT_ROW } from './dark-creature-spotlight-cases';
import evidence from '../docs/dark-creature-spotlight-native.json';
import { u32 } from '../src/core/binary';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== evidence.executableSha256) throw new Error('Original executable SHA differs');
const cases = darkSpotlightCases(), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-dark-spotlight-')), rows: unknown[] = [], failures: unknown[] = [];
let comparedBytes = 0, serviceCalls = 0, nativeArithmetic: number[][] = [];
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', '-no-pie', 'tools/native-dark-creature-spotlight-oracle.c', '-o', runner, '-lm']);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let first = 0; first < cases.length; first += 32) {
    const batch = cases.slice(first, first + 32), input = Buffer.concat([u32(batch.length), ...batch.map(c => prepareDarkSpotlight(c).b)]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 50000000 });
    if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    if (run.stdout.readUInt32LE(0) !== batch.length) throw new Error('Native spotlight count differs');
    let at = 8; const probes = Array.from({ length: run.stdout.readUInt32LE(4) }, () => { const r = [0, 4, 8, 12].map(i => run.stdout.readUInt32LE(at + i)); at += 16; return r; });
    if (nativeArithmetic.length && JSON.stringify(nativeArithmetic) !== JSON.stringify(probes)) throw new Error('Native arithmetic probe differs'); nativeArithmetic = probes;
    for (const c of batch) {
      const calls = run.stdout.readUInt32LE(at), length = 4 + SPOT_SIZE + calls * SPOT_ROW, native = run.stdout.subarray(at, at + length); at += length;
      const nativeMath: number[][] = [];
      for (let i = 0; i < calls; i++) { const r = native.subarray(4 + SPOT_SIZE + i * SPOT_ROW), kind = Number(r.readBigUInt64LE(0)); if ([1, 2, 10, 11].includes(kind)) nativeMath.push([kind, Number(r.readBigUInt64LE(8)), ...Array.from({ length: kind === 1 ? 4 : 1 }, (_, j) => r.readUInt32LE(32 + j * 4))]); }
      let expected: Buffer;
      try { expected = evaluateDarkSpotlight(c, nativeMath, nativeArithmetic); }
      catch (e) { failures.push({ input: c, error: String(e), nativeMath }); break; }
      comparedBytes += length; serviceCalls += calls;
      if (!native.equals(expected)) {
        const differences = []; for (let i = 0; i < Math.max(length, expected.length) && differences.length < 32; i++) if (native[i] !== expected[i]) differences.push({ at: i, expected: expected[i], native: native[i] });
        failures.push({ input: c, differences }); fs.writeFileSync('/root/sky-research/spotlight-actual.bin', expected); fs.writeFileSync('/root/sky-research/spotlight-native.bin', native);
      }
      rows.push({ input: c, inputSha256: sha(prepareDarkSpotlight(c).b), nativeSha256: sha(native), nativeMath });
      if (failures.length) break;
    }
    if (!failures.length && at !== run.stdout.length) throw new Error('Trailing native spotlight output');
    if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256: evidence.executableSha256, cases: cases.length, comparedCases: rows.length, projectionOnlyCases: cases.filter(c => !c.look).length, combinedEyeAndProjectionCases: cases.filter(c => c.look).length, comparedBytes, serviceCalls, nativeArithmeticProbes: nativeArithmetic.length, start: evidence.start, projectionStart: evidence.projectionStart, end: evidence.end, wholeDarkCreatureUpdateVerified: false, wholeEyeAndProjectionPhaseVerified: !failures.length, scope: evidence.scope + ' Original instruction slices execute unchanged with an explicit native stack frame. Full caller arena and ordered head/ray/avatar/bird/color/eye/Marker services compare across consecutive frames, patrol/chase/alert eye basis/quaternion smoothing, missing targets, fixed 64-bird cap, radius and expiration thresholds, query padding, callback mutations, signed zero/NaN and scalar acos/sin/sincos/exp inputs. Linux native libc results and explicitly supplied sincos upper lanes are replayed; no macOS/JS math or complete rendered creature equivalence claim.', failures };
fs.writeFileSync('docs/dark-creature-spotlight-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/dark-creature-spotlight-native.json.gz', gzipSync(JSON.stringify({ executableSha256: evidence.executableSha256, nativeArithmetic, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
