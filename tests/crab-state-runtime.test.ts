import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {createHash} from 'node:crypto';
import {evaluateCrabBehavior,type CrabBehaviorCase} from '../tools/crab-behavior-cases';

test('Original Crab state selection matches complete native memory and ordered scoring/cast/target services',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/crab-state-native.json.gz')).toString(),(_key,v)=>v==='-0'?-0:v==='NaN'?NaN:v==='Infinity'?Infinity:v==='-Infinity'?-Infinity:v) as {executableSha256:string;cases:{input:CrabBehaviorCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.ok(fixture.cases.length>=87);
 assert.ok(fixture.cases.some(c=>c.input.current===11),'must check detaching the previously followed Crab');
 assert.ok(fixture.cases.some(c=>c.input.actorIds?.length===17),'must cover vectorized list scanning and its remainder');
 assert.ok(fixture.cases.some(c=>c.input.stackWord===0x7fc00000),'must retain unwritten native SIMD W storage');
 for(const c of fixture.cases){
  assert.equal(c.input.mode,5);
  assert.equal(createHash('sha256').update(evaluateCrabBehavior(c.input)).digest('hex'),c.nativeSha256,JSON.stringify(c.input));
 }
});
