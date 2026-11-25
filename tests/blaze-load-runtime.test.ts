import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateBlazeLoad,type BlazeLoadCase} from '../tools/blaze-load-cases';
const meshCase:BlazeLoadCase={seed:7,mesh:true,root:true,small:false,ancestor:false,friend:false,alpha:1,missing:0};
test('Blaze whole Load matches native saved mesh, generated models, texture references and composed Flame setup',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/blaze-load-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBlazeLoad(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
test('Saved Blaze mesh clone preserves native asymmetric shrink and owns no generated candle Flame',()=>{
 for(const [small,scale] of [[false,[4,1.5,12,0]],[true,[.5,.375,6,0]]] as const){
  const out=evaluateBlazeLoad({...meshCase,small});assert.deepEqual(Array.from({length:4},(_,i)=>out.readFloatLE(0x10f0+i*4)),scale);
  assert.equal(out.readBigUInt64LE(0x10e0),0x440004800n);assert.equal(out.readBigUInt64LE(0x1110),0n);assert.equal(out[0x1098],0);assert.equal(out[0x10ca],1);
 }
});
test('Missing shaft texture retains the preceding footprint observation and is released once',()=>{
 const out=evaluateBlazeLoad({...meshCase,mesh:false,root:false,missing:2}),count=out.readUInt32LE(0x10000),textures:bigint[]=[],released:bigint[]=[];
 for(let i=0;i<count;i++){const row=out.subarray(0x10004+i*256,0x10004+(i+1)*256);if(row.readBigUInt64LE()===12n)textures.push(row.readBigUInt64LE(24));if(row.readBigUInt64LE()===17n)released.push(row.readBigUInt64LE(8));}
 assert.deepEqual(textures,[0x4400056b0n,0x4400056b0n]);assert.deepEqual(released,[0x440005100n]);
});
