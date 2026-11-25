import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {creatureForceCases,evaluateCreatureForce} from '../tools/creature-force-cases';
for(const mode of [0,1,2])test('Original '+['raw Wander','accumulating Wander','Flee'][mode]+' matches native memory, random order, float/W, aliases and assertion boundaries',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/creature-force-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.nativeArithmetic.length,16);const rows=fixture.cases.filter((row:any)=>row.input.mode===mode);assert.equal(rows.length,creatureForceCases().filter(c=>c.mode===mode).length);
 for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateCreatureForce(row.input,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
});
