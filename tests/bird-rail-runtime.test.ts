import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {birdRailCases,evaluateBirdRail} from '../tools/bird-rail-cases';
for(const mode of [0,1,2])test('Original '+['bird rail selection','shared rail following','Rail.GetPoint'][mode]+' matches native memory, ordered services, thresholds, W, live mutations and assertions',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-rail-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.nativeArithmetic.length,16);const rows=fixture.cases.filter((row:any)=>row.input.mode===mode);assert.equal(rows.length,birdRailCases().filter(c=>c.mode===mode).length);
 for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateBirdRail(row.input,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
});
