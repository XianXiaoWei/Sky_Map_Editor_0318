import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {createHash} from 'node:crypto';
import {evaluateCrabBehavior,type CrabBehaviorCase} from '../tools/crab-behavior-cases';

test('Original Crab AI Update matches native targets, steering, timers, speed/turn and service order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/crab-ai-update-native.json.gz')).toString(),(_key,v)=>v==='-0'?-0:v==='NaN'?NaN:v==='Infinity'?Infinity:v==='-Infinity'?-Infinity:v) as {executableSha256:string;cases:{input:CrabBehaviorCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.ok(fixture.cases.length>=139);
 assert.ok(fixture.cases.some(c=>Number.isNaN(c.input.queryTimer)),'NaN timer must retain the native branch');
 assert.ok(fixture.cases.some(c=>c.input.current===9&&c.input.actorLookup===false&&c.input.flameLookup===false),'must cover target lookup fallback');
 assert.ok(fixture.cases.some(c=>c.input.pathReady===false),'must cover collision-probe path diversion');
 assert.ok(fixture.cases.some(c=>c.input.frames===9&&c.input.flockPositions?.length),'must cover flock cache expiry across frames');
 for(const c of fixture.cases){
  assert.equal(c.input.mode,6);
  assert.equal(createHash('sha256').update(evaluateCrabBehavior(c.input)).digest('hex'),c.nativeSha256,JSON.stringify(c.input));
 }
});
