import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { evaluateResourceScript, resourceScriptCases } from '../tools/resource-script-cases';
test('Resource declarations and lifecycle match the original embedded Lua', () => {
  const fixture = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/resource-script-original.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  assert.deepEqual(fixture.cases.map((row: { input: unknown }) => row.input), resourceScriptCases());
  for (const row of fixture.cases) assert.deepEqual(evaluateResourceScript(row.input), row.native, row.input.name);
});
