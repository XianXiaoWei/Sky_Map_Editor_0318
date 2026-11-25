import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { evaluateMaterial, type MaterialResult } from '../tools/level-material-evaluate';
import type { MaterialCase } from '../tools/level-material-cases';
const fixture: { cases: { input: MaterialCase; native: MaterialResult }[] } = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/level-material-native.json.gz')).toString());
for (const [kind, role] of ['constructor retained bytes and 16 inline parameters', 'allocation capacity/fatal and ownership', 'GUID first-match/null', 'count assertion and retained storage', 'Barn initialization dependencies', 'reset retains slots', 'uniform ordering, partial writes and capacity assertion', 'MaterialDef lookup/fatal', 'default material, short/long strings, refresh ordering and actual corpus', 'dynamic model count and null/subobject vtable repair'].entries()) {
  test(`Original LevelMaterial ${role}`, () => {
    const cases = fixture.cases.filter(c => c.input.kind === kind); assert.ok(cases.length);
    for (const c of cases) assert.deepEqual(evaluateMaterial(c.input), c.native, c.input.name);
  });
}
