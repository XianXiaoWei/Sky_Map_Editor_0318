import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import { readResourceManifest, readResourceDeclarations } from '../src/core/resource-manifest';
import { describeLevelResourcePlan } from '../src/core/level-resource-plan';
import { AssetCatalog } from '../src/main/assets';
import { ResourceScriptRuntime } from '../src/core/resource-script-runtime';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
test('Resource DSL preserves ordered layers, definitions and references while retaining expression gaps', () => {
  const entries = readResourceManifest(`-- resourceref "Image" "Fake"
local text = [=[resource "Mesh" "Fake" { source="x" }]=]
resourcedef "Image" "Black" { source = "Black.png", srgb = false }
resourceref "Image" "Black"
resource "LevelObjects" "Test" { source="Levels/Test/Objects.level", sourcesCount=2,
 sources={"Levels/Test/Objects.level", "Levels/Test/Art.level"}, unknown=run("x", {a=1}),
 mixed={"valid", getSource()}, options={ flag=true, count=3 }, after=7 }
`);
  assert.deepEqual(entries.map(e => e.directive), ['resourcedef', 'resourceref', 'resource']);
  assert.deepEqual(entries[2].parameters.sources, ['Levels/Test/Objects.level', 'Levels/Test/Art.level']);
  assert.deepEqual(entries[2].unresolvedFields, ['unknown', 'mixed']); assert.equal(entries[2].parameters.after, 7);
  assert.equal((entries[2].parameters.options as Record<string, unknown>).flag, true);
  assert.equal(readResourceDeclarations('resourceref "Image" "Black"').length, 0);
});
test('All 33 original level manifests connect Objects.level.bin and BstBaked.meshes', () => {
  let count = 0;
  for (const level of fs.readdirSync(path.join(data, 'Levels'))) {
    const directory = path.join(data, 'Levels', level); if (!fs.existsSync(path.join(directory, 'Resources.lua'))) continue;
    const entries = readResourceManifest(fs.readFileSync(path.join(directory, 'Resources.lua'), 'utf8')), plan = describeLevelResourcePlan(level, entries);
    assert.equal(plan.objects.compiledSource, `Levels/${level}/Objects.level.bin`); assert.equal(plan.baked.source, `Levels/${level}/BstBaked.meshes`);
    assert.equal(plan.baked.lodToLoad, 0); assert.ok(fs.existsSync(path.join(data, plan.objects.compiledSource))); assert.ok(fs.existsSync(path.join(data, plan.baked.source))); count++;
  }
  assert.equal(count, 33);
  const dawn = describeLevelResourcePlan('Dawn', readResourceManifest(fs.readFileSync(path.join(data, 'Levels/Dawn/Resources.lua'), 'utf8')));
  assert.equal(dawn.objects.sources?.length, 24);
});
test('Image references resolve to the original definition without erasing texture parameters', () => {
  const catalog = new AssetCatalog(data, 'Dawn'), definition = catalog.resourceDefinition('Image', 'Black');
  assert.equal(definition?.entry.directive, 'resourcedef'); assert.equal(definition?.origin, 'Resources/ImageDefs.lua');
  assert.ok(catalog.resourceReferences().some(ref => ref.origin === 'Levels/Dawn/Resources.lua' && ref.entry.name === 'Black' && ref.definition?.entry === definition?.entry));
  assert.equal(catalog.resourceDefinition('Mesh', 'Black'), null);
  assert.ok(catalog.resourceDefinition('LevelObjects', 'Dawn')?.entry.parameters.sources);
});
test('All original resource files match embedded Lua, including sound sugar and atlas UV constants', () => {
  const fixture = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/resource-manifests-original.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  assert.equal(fixture.files.length, 37);
  const runtime = new ResourceScriptRuntime();
  const sorted = (entries: any[]) => entries.slice().sort((a,b) => (a.class + '_' + a.name).localeCompare(b.class + '_' + b.name));
  for (const { origin, sourceSha256, native } of fixture.files) {
    const bytes = fs.readFileSync(path.join(data, origin));
    assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'), sourceSha256);
    runtime.clearResources(); runtime.errorCode = 0; const warnings: string[] = []; runtime.warning = warning => warnings.push(warning);
    const previous = new Map(runtime.definitions); runtime.apply(readResourceManifest(bytes.toString()));
    const actual = { origin, resources: runtime.resources, definitions: [...runtime.definitions].filter(([key, value]) => previous.get(key) !== value).map(([,value]) => value), warnings, errorCode: runtime.errorCode };
    const normalize = (row: any) => JSON.parse(JSON.stringify({ ...row, resources: origin === 'Resources/SoundDefs.lua' ? sorted(row.resources) : row.resources, definitions: sorted(row.definitions) }));
    assert.deepEqual(normalize(actual), normalize(native), origin);
  }
});
