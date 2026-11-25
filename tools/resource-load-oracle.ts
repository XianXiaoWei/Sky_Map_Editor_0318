import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import zlib from 'node:zlib';
import { spawnSync } from 'node:child_process';
import { resourceLoadCases, resourceLoadMemory } from './resource-load-cases';
import { evaluateResourceLoad } from './resource-load-evaluate';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex'), executableSha256 = digest(fs.readFileSync(executable));
assert.equal(executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases = resourceLoadCases(), uints = (values: number[]) => { const b = Buffer.alloc(values.length * 4); values.forEach((v, i) => b.writeUInt32LE(v >>> 0, i * 4)); return b; };
const input = Buffer.concat([uints([cases.length]), ...cases.flatMap(c => [uints([c.count, c.repeats, Number(c.allowAsync), c.flag28, c.busyLoads, c.busyByte, 0, Number(c.heapMissing), Number(c.registerClearsHeap), Number(c.registerAddsQueued), Number(c.mutateContext), c.firstLoadTurn, Number(c.methodSequence), c.initialLoadCount, c.referenceCycles]), resourceLoadMemory(c)])]);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-resource-load-')); let output: Buffer;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-load-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, maxBuffer: 32e6, timeout: 60000 });
  if (run.status !== 0) throw new Error(`${run.status}/${run.signal}: ${run.stderr}`); output = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
let at = 0; const u32 = () => { const value = output.readUInt32LE(at); at += 4; return value; }; assert.equal(u32(), cases.length);
const rows = [], failures = [];
for (const input of cases) {
  const line = u32(), severity = u32(), count = u32(), services = Array.from({ length: count }, () => [u32(), u32(), u32(), u32()]);
  const memorySha256 = digest(output.subarray(at, at + 0x8000)); at += 0x8000;
  const native = { line, severity, services, memorySha256 }, actual = evaluateResourceLoad(input);
  try { assert.deepEqual(actual, native); } catch { failures.push({ name: input.name, actual, native }); }
  rows.push({ input, native });
}
assert.equal(at, output.length);
const scope = 'Six unmodified whole routines: AddToLoadList 0x1007c2230, AddToUnloadList 0x1007c2250, Inc/Dec/GetLoadCount 0x1007c1b40/50/60, LoadNext 0x1007c3d20. Includes prepend -> FIFO tail removal -> register -> status reset -> virtual load -> count decrement -> unregister -> separate +0x68 unload linkage, uint32 wrapping, async and synchronous branches, callback queue/status/heap/context mutations and assertion snapshots. Registration/unregistration internals and actual virtual loaders/async completion/game phases remain boundary dependencies.';
const report = { passed: failures.length === 0, executableSha256, routineCount: 6, cases: cases.length, publicMethodSequenceCases: cases.filter(c => c.methodSequence).length, comparedBytes: cases.length * 0x8000, scope, completeOriginalGameRuntime: false, failures };
fs.writeFileSync('docs/resource-load-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/resource-load-native.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256, scope, cases: rows }), { level: 9 }));
console.log(JSON.stringify({ ...report, failures: failures.slice(0, 2) })); if (!report.passed) process.exitCode = 1;
