import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import {createHash} from 'node:crypto';
import {evaluateCrabBehavior,type CrabBehaviorCase} from '../tools/crab-behavior-cases';
test('Original Crab scoring, candidate comparison, metric update and motion reader match native bits, memory and service order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/crab-behavior-native.json.gz')).toString(),(_key,v)=>v==='-0'?-0:v==='NaN'?NaN:v==='Infinity'?Infinity:v==='-Infinity'?-Infinity:v) as {executableSha256:string;cases:{input:CrabBehaviorCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>=408);
 assert.deepEqual([...new Set(fixture.cases.map(c=>c.input.mode))].sort(),[0,1,2,3]);
 assert.ok(fixture.cases.some(c=>Object.is(c.input.duration,-0)), 'native fixture must preserve signed zero');
 for(const c of fixture.cases)assert.equal(createHash('sha256').update(evaluateCrabBehavior(c.input)).digest('hex'),c.nativeSha256,JSON.stringify(c.input));
});
