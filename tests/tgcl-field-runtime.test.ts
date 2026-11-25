import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { tgclFieldCases } from '../tools/tgcl-field-cases';
import { evaluateTgclFields } from '../tools/tgcl-field-evaluate';
test('TGCL loading fields, deferred references and cached defaults match original execution',()=>{
 const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/tgcl-field-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.deepEqual(fixture.cases.map((row:any)=>row.input),tgclFieldCases());
 for(const row of fixture.cases)assert.deepEqual(evaluateTgclFields(row.input),row.native,row.input.name);
});
