import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { animationListCases, animationListExpected } from './resource-animation-list-cases';
import { u32 } from '../src/core/binary';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-list-')), cases = animationListCases(data), failures: unknown[] = [], rows: unknown[] = [];
let comparedBytes = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-list-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input: Buffer.concat([u32(cases.length), ...cases.flatMap(c => [u32(c.bytes.length), c.bytes])]), timeout: 60000, maxBuffer: 10000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
  let at = 4;
  for (const c of cases) { const expected = animationListExpected(c.bytes), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length;
    if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ id: c.id, differences }); }
    rows.push({ id: c.id, sourceSha256: sha(c.bytes), nativeSha256: sha(native) });
  }
  if (at !== run.stdout.length) throw new Error(`Trailing native output ${at}/${run.stdout.length}`);
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, cases: cases.length, comparedBytes, scope: 'Complete original AnimationList.Read, fixed-name/std-string growth and BinaryStream readers execute unmodified. Full file/metadata order, signed-char FNV64 hashes, numeric/boolean fields, all sound/emitter data and consumed cursor compared; constructor type tags and allocation/free are explicit services. Names normalized after first NUL; unused object padding and pointers excluded. Actual v3 table plus v1/v2/v3 UTF8/effect prepared cases. Range conversion, resource/controller lookup and effect runtime integration are separate.', failures };
fs.writeFileSync('docs/resource-animation-list-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-list-native.json.gz', gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
