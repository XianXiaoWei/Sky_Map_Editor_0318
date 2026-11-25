import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { readResourceManifest } from '../src/core/resource-manifest';
import { ResourceScriptRuntime } from '../src/core/resource-script-runtime';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const original = fs.readFileSync(executable), executableSha256 = digest(original);
assert.equal(executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
assert.deepEqual(fs.readFileSync('evidence/original-resource-dsl.lua'), original.subarray(0xadb9c0, 0xae089a));
const files = ['Resources/ImageDefs.lua', 'Resources/SoundDefs.lua', 'Resources/Boot.lua', 'Levels/TitleWater/Resources.lua', 'Resources/Persistent.lua',
  ...fs.readdirSync(path.join(data, 'Levels')).sort().filter(level => level !== 'TitleWater' && fs.existsSync(path.join(data, 'Levels', level, 'Resources.lua'))).map(level => `Levels/${level}/Resources.lua`)];
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-resource-manifests-')); let outputs: any[];
const quote = (text: string) => '"' + text.replace(/\\/g, '\\\\').replace(/"/g, '\\"') + '"';
try {
  const input = path.join(temp, 'input.lua'); fs.writeFileSync(input, `return {data=${quote(data)},files={${files.map(quote).join(',')}}}`);
  const run = spawnSync('lua5.1', ['tools/resource-manifest-original.lua', 'evidence/original-resource-dsl.lua', input], { maxBuffer: 32e6, timeout: 60000 });
  if (run.status !== 0) throw new Error(run.stderr.toString());
  outputs = run.stdout.toString().trim().split('\n').map(line => JSON.parse(line));
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
assert.equal(outputs.length, files.length);
const runtime = new ResourceScriptRuntime(), failures: unknown[] = [], fixture = [];
let definitions = 0, resources = 0, sounds = 0;
function sorted(values: any[]) { return values.slice().sort((a,b) => (a.class + '_' + a.name).localeCompare(b.class + '_' + b.name)); }
for (const [i, origin] of files.entries()) {
  runtime.clearResources(); runtime.errorCode = 0; const warnings: string[] = []; runtime.warning = message => warnings.push(message);
  const source = fs.readFileSync(path.join(data, origin)), entries = readResourceManifest(source.toString()), previous = new Map(runtime.definitions);
  runtime.apply(entries);
  const defs = [...runtime.definitions].filter(([key, value]) => previous.get(key) !== value).map(([, value]) => value);
  const native = outputs[i]; for (const key of ['resources', 'definitions', 'warnings']) if (!Array.isArray(native[key])) native[key] = [];
  const actual = { origin, resources: runtime.resources, definitions: defs, warnings, errorCode: runtime.errorCode };
  // Sound sugar iterates a hash table with pairs(); compare this manifest's
  // constructors by type/name. Other resource files retain exact Lua order.
  const compare = (row: any) => JSON.parse(JSON.stringify({ ...row, resources: origin === 'Resources/SoundDefs.lua' ? sorted(row.resources) : row.resources, definitions: sorted(row.definitions) }));
  try { assert.deepEqual(compare(actual), compare(native)); } catch { failures.push({ origin, actual: compare(actual), native: compare(native) }); }
  definitions += defs.length; resources += runtime.resources.length; sounds += runtime.resources.filter(r => r.class === 'SoundDef').length;
  fixture.push({ origin, sourceSha256: digest(source), native });
}
const report = { passed: failures.length === 0, executableSha256, files: files.length, levels: 33, definitions, queuedConstructors: resources, soundDefinitions: sounds,
  scope: 'Static literal parser + resource aggregation compared against the original embedded Lua on ImageDefs, SoundDefs, Boot, initial TitleWater, Persistent and the other 32 level manifests. Constructor contents, references, definition persistence, warnings and non-sound resource order compared. soundDefResources pairs() ordering excluded; no loader or declared autoRun script executed. This collection order audits coverage, not a claim that all levels are loaded sequentially by the game.', failures };
fs.writeFileSync('docs/resource-manifest-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed) fs.writeFileSync('tests/fixtures/resource-manifests-original.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256, scope: report.scope, files: fixture }), { level: 9 }));
console.log(JSON.stringify({ ...report, failures: failures.map((x: any) => ({ origin: x.origin, actualResources: x.actual.resources.length, nativeResources: x.native.resources.length })) }));
if (!report.passed) process.exitCode = 1;
