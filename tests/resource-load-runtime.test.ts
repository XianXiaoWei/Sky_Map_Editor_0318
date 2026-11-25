import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { resourceLoadCases } from '../tools/resource-load-cases';
import { evaluateResourceLoad } from '../tools/resource-load-evaluate';
test('Resource queue and loading match the original full LoadNext routine', () => {
  const fixture = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/resource-load-native.json.gz')).toString());
  assert.equal(fixture.executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  assert.deepEqual(fixture.cases.map((row: { input: unknown }) => row.input), resourceLoadCases());
  for (const row of fixture.cases) assert.deepEqual(evaluateResourceLoad(row.input), row.native, row.input.name);
});
