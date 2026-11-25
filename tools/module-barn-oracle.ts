import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import zlib from 'node:zlib';
import { spawnSync } from 'node:child_process';
import { moduleDispatchCases, moduleFunctionNames, moduleMemory } from './module-barn-cases';
import { evaluateModuleDispatch } from './module-barn-evaluate';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex'), executableSha256 = digest(fs.readFileSync(executable));
assert.equal(executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases = moduleDispatchCases(), uints = (values: number[]) => { const b = Buffer.alloc(values.length * 4); values.forEach((v, i) => b.writeUInt32LE(v >>> 0, i * 4)); return b; };
const input = Buffer.concat([uints([cases.length]), ...cases.flatMap(c => [uints([Buffer.byteLength(c.functionName), c.modeMask, Number(c.reverse), c.repeats, c.mutationAt, c.newCount, Number(c.replaceOverride), c.castFailsAt, Math.max(0, moduleFunctionNames.indexOf(c.functionName)), c.entries.length]), Buffer.from(c.functionName), moduleMemory(c)])]);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-module-dispatch-')); let output: Buffer;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-module-barn-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, maxBuffer: 64e6, timeout: 180000 });
  if (run.status !== 0) throw new Error(`${run.status}/${run.signal}: ${run.stderr}`); output = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
let at = 0; const u32 = () => { const value = output.readUInt32LE(at); at += 4; return value; }; assert.equal(u32(), cases.length);
const rows = [], failures = [];
for (const input of cases) {
  const line = u32(), severity = u32(), count = u32(), services = Array.from({ length: count }, () => [u32(), u32(), u32(), u32()]);
  const memorySha256 = digest(output.subarray(at, at + 0x10000)); at += 0x10000;
  const native = { line, severity, services, memorySha256 }, actual = evaluateModuleDispatch(input);
  try { assert.deepEqual(actual, native); } catch { failures.push({ name: input.name, actual, native }); }
  rows.push({ input, native });
}
assert.equal(at, output.length);
const scope = 'Unmodified whole ModuleBarn::Dispatch 0x1007b1b40: binary function-name lookup, forward/reverse entry order, mode filtering, reflected signatures/argument addresses, receiver cast failure, one-shot overrides and post-callback count reload. Repeated dispatch verifies cleared overrides fall through to reflected calls. Callback services mutate real count and override fields. Registered table construction, actual class reflection/casts/override implementations and game phase effects remain explicit dependencies. Defined C strings up to 31 bytes only; longer native stack-buffer inputs excluded. This is a dispatcher subchain, not full game loading or Avatar/UI behavior.';
const report = { passed: failures.length === 0, executableSha256, routineCount: 1, cases: cases.length, comparedBytes: cases.length * 0x10000, scope,
  mutationCases: cases.filter(c => c.mutationAt !== 0xffffffff).length, reverseCases: cases.filter(c => c.reverse).length, completeOriginalGameRuntime: false, failures };
fs.writeFileSync('docs/module-barn-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/module-barn-native.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256, scope, cases: rows }), { level: 9 }));
console.log(JSON.stringify({ ...report, failures: failures.slice(0, 2) })); if (!report.passed) process.exitCode = 1;
