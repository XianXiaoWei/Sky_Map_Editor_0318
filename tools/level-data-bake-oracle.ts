import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { MeshesDocument } from '../src/core/meshes';
import { readResourceMesh } from '../src/core/resources';
import { evaluateLevelDataBakeCase, type LevelDataBakeCase } from './level-data-bake-cases';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const sha = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const executableSha256 = sha(fs.readFileSync(executable));
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const input: Buffer[] = [], expected: { label: string; bytes: Buffer }[] = [], fixtures: { input: LevelDataBakeCase; native: string }[] = [];
const uints = (values: number[]) => { const b = Buffer.alloc(values.length * 4); values.forEach((v, i) => b.writeUInt32LE(v >>> 0, i * 4)); return b; };
function add(c: LevelDataBakeCase, keep: boolean) {
  input.push(uints([c.guid, +c.exists, +c.usable, +c.uniform, c.lod, c.samples, c.extra.length, c.render, c.meshSamples]), uints(c.remap), Buffer.from(c.light), Buffer.from(c.extra));
  expected.push({ label: c.label, bytes: evaluateLevelDataBakeCase(c) });
  if (keep) fixtures.push({ input: c, native: '' });
}
let syntheticCases = 0;
for (const samples of [0, 1, 3, 24]) for (const render of [0, 1, 7]) for (const uniform of [false, true]) {
  if (uniform && samples === 0) continue;
  for (const mode of ['compatible', 'mismatch', 'missing', 'unloaded'] as const) for (const extraLength of [0, 1, 17]) {
    const c: LevelDataBakeCase = { label: `synthetic-${syntheticCases++}`, guid: [0, 7, 0x80000000, 0xffffffff][syntheticCases % 4],
      exists: mode !== 'missing', usable: mode !== 'missing' && mode !== 'unloaded', uniform, lod: syntheticCases % 4,
      samples, meshSamples: mode === 'mismatch' ? samples + 1 : samples, render: samples === 0 ? 0 : render,
      remap: Array.from({ length: samples === 0 ? 0 : render }, (_, i) => (i * 7 + 2) % samples),
      light: Array.from({ length: uniform ? 12 : samples * 12 }, (_, i) => (i * 113 + syntheticCases) & 255),
      extra: Array.from({ length: extraLength }, (_, i) => (i * 17 + syntheticCases) & 255) };
    add(c, true);
  }
}
let corpusLods = 0, missingLods = 0, mismatchLods = 0, uniformLods = 0;
const cache = new Map<string, ReturnType<typeof readResourceMesh> | null>();
const maps = fs.readdirSync(path.join(data, 'Levels')).filter(l => fs.existsSync(path.join(data, 'Levels', l, 'BstBaked.meshes'))).sort();
for (const level of maps) {
  const document = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level, 'BstBaked.meshes')));
  for (const record of document.bakes) {
    if (!cache.has(record.name)) { const file = path.join(data, 'Meshes/Bin', record.name + '.mesh'); cache.set(record.name, fs.existsSync(file) ? readResourceMesh(fs.readFileSync(file)) : null); }
    const mesh = cache.get(record.name);
    for (let lod = 0; lod < record.submeshes.length; lod++) {
      const stream = document.bakeData(record.id, lod), target = mesh?.levels[lod];
      if (mesh && !target) throw new Error(`${level}/${record.id}: unsupported original out-of-range LOD`);
      const c: LevelDataBakeCase = { label: `${level}/${record.id}/${lod}`, guid: record.guid, exists: !!mesh, usable: !!target,
        uniform: record.uniform, lod, samples: stream.count, meshSamples: target?.bakeVertexCount ?? 0,
        render: target ? target.positions.length / 3 : 0, remap: Array.from(target?.bakeRemap ?? new Uint32Array(target ? target.positions.length / 3 : 0)),
        light: Array.from(stream.light), extra: Array.from(stream.extra) };
      const mismatch = !!target && stream.count !== target.bakeVertexCount;
      add(c, !target || mismatch || (record.id === 'bake0' && lod === 0));
      corpusLods++; if (!target) missingLods++; if (mismatch) mismatchLods++; if (record.uniform) uniformLods++;
    }
  }
}
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-level-data-bake-'));
let native: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-level-data-bake-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable],
    { input: Buffer.concat([uints([expected.length]), ...input]), maxBuffer: 200e6, timeout: 120000 });
  if (run.status !== 0) throw new Error(`Native LevelData bake failed: ${run.status} ${run.stderr}`);
  native = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
if (native.readUInt32LE(0) !== expected.length) throw new Error('Invalid case count');
let offset = 4, fixtureIndex = 0;
const failures: { label: string; nativeHeader: string; expectedHeader: string }[] = [];
for (const c of expected) {
  const vc = native.readUInt32LE(offset + 4), extra = native.readUInt32LE(offset + 8), traces = native.readUInt32LE(offset + 24);
  const length = 28 + traces * 16 + vc * 12 + extra, output = native.subarray(offset, offset + length); offset += length;
  if (!output.equals(c.bytes)) failures.push({ label: c.label, nativeHeader: output.subarray(0, 200).toString('hex'), expectedHeader: c.bytes.subarray(0, 200).toString('hex') });
  if (fixtures[fixtureIndex]?.input.label === c.label) fixtures[fixtureIndex++].native = output.toString('base64');
}
if (offset !== native.length || fixtureIndex !== fixtures.length) throw new Error('Invalid output/fixture traversal');
const scope = 'Original instruction subchains 0x1003f4c63..0x1003f4c6e and 0x1003f4db5..0x1003f4f67, with return at 0x1003f4d99. Original conditional branches, 24-byte LOD clearing and 12-byte remap expansion execute unchanged. Serializer reads and heap alloc/free are explicit prepared services. Compare GUID, loaded counts, pointer presence, complete light/opaque bytes, consumed byte count and ordered service traces. All supplied LOD0 Mesh.bin records are used, including every embedded resource LOD. Does not execute full LevelData/ResourceManager/Model construction, async IO, invalid pointers, resource reload or original lighting bake generation.';
const report = { passed: failures.length === 0, executableSha256, scope, cases: expected.length, syntheticCases,
  maps: maps.length, corpusLods, missingResourceLods: missingLods, mismatchedSampleLods: mismatchLods,
  uniformLods, comparedBytes: native.length - 4, failures, fixtureCases: fixtures.length };
fs.writeFileSync('docs/level-data-bake-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/level-data-bake-native.json.gz', gzipSync(JSON.stringify({ scope, executableSha256, cases: fixtures })));
console.log(JSON.stringify(report));
if (!report.passed) process.exitCode = 1;
