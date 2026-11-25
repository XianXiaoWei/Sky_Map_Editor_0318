import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { materialCases, type MaterialCase } from './level-material-cases';
import { evaluateMaterial, type MaterialResult } from './level-material-evaluate';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
assert.equal(hash, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases = materialCases(), chunks: Buffer[] = [];
const uints = (ns: number[]) => { const b = Buffer.alloc(ns.length * 4); ns.forEach((n, i) => b.writeUInt32LE(n >>> 0, i * 4)); chunks.push(b); };
uints([cases.length]);
for (const c of cases) {
  const memory = Buffer.from(c.memoryHex, 'hex'); uints([c.kind, memory.length, c.a, c.b, c.c, c.initialStrings.length, c.tableStrings.length, 0]);
  chunks.push(Buffer.from(c.colorHex, 'hex'), memory); if (c.kind === 7 || c.kind === 8) chunks.push(Buffer.from(c.tableHex!, 'hex'));
  for (const str of [...c.initialStrings, ...c.tableStrings]) { const b = Buffer.from(str.value); uints([str.at, b.length]); chunks.push(b); }
}
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-level-material-')); let output: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-level-material-oracle.c', '-o', runner]);
  if (build.status) throw new Error(build.stderr.toString());
  if (build.stderr.length) fs.writeFileSync('/root/sky-research/level-material-native-build.log', build.stderr);
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input: Buffer.concat(chunks), timeout: 180000, maxBuffer: 180e6 });
  if (run.status !== 0) throw new Error(`${run.status} ${run.stderr}`); output = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
let at = 0; const u32 = () => { const n = output.readUInt32LE(at); at += 4; return n; }, u64 = () => { const n = output.readBigUInt64LE(at).toString(); at += 8; return n; };
assert.equal(u32(), cases.length);
let comparedBytes = 0, maskedBytes = 0, stringBytes = 0; const rows: { input: MaterialCase; native: MaterialResult }[] = [], failures: unknown[] = [];
for (const c of cases) {
  const [errors, line, severity, result, rebuilds, updateCount, length, stringCount] = Array.from({ length: 8 }, u32), rebuildPointer = u64(), updates = Array.from({ length: updateCount }, u64);
  const memoryHex = output.subarray(at, at + length).toString('hex'); at += length; const masked = u32(), strings = [];
  for (let i = 0; i < stringCount; i++) { const offset = u32(), n = u32(); strings.push({ at: offset, value: output.subarray(at, at + n).toString('utf8') }); at += n; stringBytes += n; }
  const native: MaterialResult = { errors, line, severity, result, rebuilds, updates, rebuildPointer, memoryHex, maskedBytes: masked, strings }, actual = evaluateMaterial(c);
  try { assert.deepEqual(actual, native); }
  catch (error) {
    let firstByte = -1; const a = Buffer.from(actual.memoryHex, 'hex'), b = Buffer.from(native.memoryHex, 'hex');
    for (let i = 0; i < a.length; i++) if (a[i] !== b[i]) { firstByte = i; break; }
    failures.push({ name: c.name, firstByte, actual: { ...actual, memoryHex: firstByte < 0 ? 'equal' : actual.memoryHex.slice(firstByte * 2, firstByte * 2 + 64) }, native: { ...native, memoryHex: firstByte < 0 ? 'equal' : native.memoryHex.slice(firstByte * 2, firstByte * 2 + 64) } });
  }
  comparedBytes += length - masked; maskedBytes += masked; rows.push({ input: c, native });
}
assert.equal(at, output.length);
const scope = '13 unmodified original class/Barn/MaterialDef bodies. Constructor metadata/baseColor and heap/libc/assert/fatal/Object-vtable-repair/Beamo-rebuild are explicit services. Standalone uniform generator compares every output byte including retained padding/tails and writes before capacity assert. Default-material replay compares defined state plus full short/long string contents; std::string heap representation and caller stack lanes that were never written are excluded (separately counted), while full vec4 copy semantics are recovered in code. Actual LevelMaterial configuration cases use original corpus; custom cases test skip/preservation, not GPU upload. No complete model creation, shader upload, animation, Beamo rebuild body or original game runtime claim.';
const report = { passed: failures.length === 0, executableSha256: hash, routineCount: 13, cases: cases.length, comparedBytes, defaultUninitializedLaneBytesExcluded: maskedBytes, stringContentBytesCompared: stringBytes, scope,
  byKind: Object.fromEntries([...new Set(cases.map(c => c.kind))].map(k => [k, cases.filter(c => c.kind === k).length])), corpusMaterials: cases.filter(c => c.kind === 8 && c.name.startsWith('corpus-')).length, corpusGuidQueries: cases.filter(c => c.name.startsWith('corpus-guid-')).length, failures };
fs.writeFileSync('docs/level-material-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/level-material-native.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256: hash, scope, cases: rows }), { level: 9 }));
console.log(JSON.stringify({ ...report, failures: failures.slice(0, 3) })); if (!report.passed) process.exitCode = 1;
