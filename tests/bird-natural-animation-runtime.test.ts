import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import {createHash} from 'node:crypto';
import {evaluateBirdNatural,type BirdNaturalCase} from '../tools/bird-natural-animation-cases';
test('Original bird takeoff selection and real sequence lookup/validation bodies match full native memory and calls',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-natural-animation-native.json.gz')).toString(),(_key,v)=>v==='NaN'?NaN:v==='Infinity'?Infinity:v==='-Infinity'?-Infinity:v) as {executableSha256:string;cases:{input:BirdNaturalCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>100);
 for(const c of fixture.cases)assert.equal(createHash('sha256').update(evaluateBirdNatural(c.input)).digest('hex'),c.nativeSha256,JSON.stringify(c.input));
});
