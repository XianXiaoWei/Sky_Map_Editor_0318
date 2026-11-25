import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateBirdLoad} from '../tools/bird-load-cases';

test('BirdV2 whole Load matches native transforms, own animation requests, optional bones, effects and Barn assertions',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-load-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBirdLoad(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});

test('Wing emitter direction overwrites the native matrix column while retaining translation and separate wings',()=>{
 const result=evaluateBirdLoad({seed:7,region:true,animation:true,profile:1,struggle:false,effects:true,emitters:true,wind:true,count:0});
 const count=result.readUInt32LE(8+0x8000),emitters:Buffer[]=[];
 for(let i=0;i<count;i++){const call=result.subarray(12+0x8000+i*160,12+0x8000+(i+1)*160);if(call.readBigUInt64LE()===15n)emitters.push(call);}
 assert.equal(emitters.length,2);
 for(const call of emitters){
  assert.deepEqual(Array.from({length:4},(_,i)=>call.readFloatLE(64+i*4)),[0,0,-1,0]);
  assert.deepEqual(Array.from({length:4},(_,i)=>call.readFloatLE(80+i*4)),[5,6,7,1]);
  assert.deepEqual(call.subarray(64,76),call.subarray(96,108));
 }
});
