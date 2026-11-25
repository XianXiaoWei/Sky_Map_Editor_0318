import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateDarkCreatureRail} from '../tools/dark-creature-rail-cases';
test('DarkCreature own patrol/cooldown switch matches native timer, phase, Rail calls and heading selection',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/dark-creature-rail-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateDarkCreatureRail(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
test('Patrol and cooldown select different rails; disabling direction selection skips samples',()=>{
 for(const cooldown of [0,1]){
  const out=evaluateDarkCreatureRail({seed:0,cooldown,direction:false,time:1.25,profile:0});
  assert.equal(out.readFloatLE(0x12d4),.25);assert.equal(out[0x12c6],1);assert.equal(out.readUInt32LE(0x8000),2);
  assert.equal(out.readBigUInt64LE(0x800c),cooldown?0x440006000n:0x440005000n);
  assert.equal(out.readUInt32LE(cooldown?0x117c:0x11a0),0);
 }
});
