import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { resourceScriptCases, evaluateResourceScript } from './resource-script-cases';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const original = fs.readFileSync(executable), executableSha256 = hash(original);
assert.equal(executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const source = fs.readFileSync('evidence/original-resource-dsl.lua');
assert.deepEqual(source, original.subarray(0xadb9c0, 0xae089a));
function lua(value: unknown): string {
  if (value === null) return 'nil';
  if (Array.isArray(value)) return '{' + value.map(lua).join(',') + '}';
  if (typeof value === 'object') return '{' + Object.entries(value!).map(([key, v]) => '[' + lua(key) + ']=' + lua(v)).join(',') + '}';
  if (typeof value === 'string') return '"' + value.replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\n/g, '\\n') + '"';
  return String(value);
}
const cases = resourceScriptCases(), temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-resource-script-')); let results: unknown[];
try {
  const input = path.join(temp, 'cases.lua'); fs.writeFileSync(input, 'return ' + lua(cases));
  const run = spawnSync('lua5.1', ['tools/resource-script-oracle.lua', 'evidence/original-resource-dsl.lua', input], { maxBuffer: 16e6, timeout: 60000 });
  if (run.status !== 0) throw new Error(run.stderr.toString());
  results = run.stdout.toString().trim().split('\n').map(line => JSON.parse(line));
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
assert.equal(results.length, cases.length);
// The tiny Lua JSON encoder emits {} for an empty table. Convert only known
// sequence paths; empty reflected field maps must remain objects.
function sequences(row: any) {
  for (const key of ['planned', 'warnings', 'errors', 'definitionSources', 'allocated', 'pending', 'unloaded', 'events']) if (!Array.isArray(row[key])) row[key] = [];
  for (const r of row.allocated) if (!Array.isArray(r.sources)) r.sources = [];
  return row;
}
const failures: unknown[] = [], rows = cases.map((input, i) => {
  const native = sequences(results[i]), actual = evaluateResourceScript(input);
  try { assert.deepEqual(actual, native); } catch { failures.push({ name: input.name, actual, native }); }
  return { input, native };
});
const scope = 'Original embedded resource DSL executed under stock Lua 5.1, compared with TypeScript constructor/locale/filter/reference aggregation, shared constructor identity, reflection scalars and zero-based array setters, load counts, unpublished load lists, configuration mismatch, unload-to-zero and missing-ref error code. Reflected metadata, manager lookup/registration and allocator are supplied boundary services; no native userdata metamethod or actual Lua VM integration is claimed. Field pairs() order excluded.';
const report = { passed: failures.length === 0, executableSha256, embeddedSourceSha256: hash(source), cases: cases.length, scope, completeOriginalGameRuntime: false, failures };
fs.writeFileSync('docs/resource-script-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/resource-script-original.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256, scope, cases: rows }), { level: 9 }));
console.log(JSON.stringify({ ...report, failures: failures.slice(0, 2) })); if (!report.passed) process.exitCode = 1;
