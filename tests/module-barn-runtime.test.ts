import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { evaluateModuleDispatch, type ModuleDispatchResult } from '../tools/module-barn-evaluate';
import type { ModuleDispatchCase } from '../tools/module-barn-cases';
const fixture: { cases: { input: ModuleDispatchCase; native: ModuleDispatchResult }[] } = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/module-barn-native.json.gz')).toString());
for (const [name, select] of [
  ['function lookup, phase names, directions and mode masks', (c: ModuleDispatchCase) => c.name.startsWith('dispatch-') && !/count|mutation|failure/.test(c.name)],
  ['empty and repeated dispatch, one-shot overrides and reflected arguments', (c: ModuleDispatchCase) => c.name.startsWith('dispatch-count-')],
  ['callback count mutation and replaced override clearing', (c: ModuleDispatchCase) => c.name.startsWith('dispatch-mutation-')],
  ['receiver cast failure in both directions', (c: ModuleDispatchCase) => c.name.startsWith('dispatch-cast-failure-')],
] as const) test(`Original ModuleBarn: ${name}`, () => {
  const rows = fixture.cases.filter(row => select(row.input)); assert.ok(rows.length);
  for (const row of rows) assert.deepEqual(evaluateModuleDispatch(row.input), row.native, row.input.name);
});
