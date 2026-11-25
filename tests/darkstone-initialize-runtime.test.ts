import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateDarkstoneInitialize} from '../tools/darkstone-initialize-cases';import {initialDarkstonePreviewMaterial,savedDarkstoneMeshes} from '../src/core/darkstone-material';import {ObjectsDocument} from '../src/core/objects';import {effectiveLevelMeshMaterial} from '../src/core/model-draw';
test('Whole ordinary Darkstone initialization matches independent original machine code memory and material calls',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-initialize-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateDarkstoneInitialize(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
test('Owned plant preview parameters reproduce original initialization calls and retain serialized fields',()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',source=fs.readFileSync(data+'/Levels/SkyHub2/Objects.level.bin'),d=new ObjectsDocument(source),owned=savedDarkstoneMeshes(d.nodes),node=d.nodes[23];
 assert.ok(owned.has(node.id));assert.ok(!owned.has(137));
 const saved=effectiveLevelMeshMaterial(node,'SkyHub2'),projected=initialDarkstonePreviewMaterial(saved),out=evaluateDarkstoneInitialize({label:'original static material color',seed:0,shader:'DarkStone',owner:true,enabled:1,originalColors:true}),calls=out.readUInt32LE(0x60000);
 for(let i=0;i<calls;i++){
  const row=out.subarray(0x60004+i*96,0x60004+(i+1)*96),kind=row.readBigUInt64LE();if(kind!==5n&&kind!==6n)continue;
  const name=row.toString('utf8',16,row.indexOf(0,16)),p=projected.parameters.find(p=>p.name===name)!;assert.ok(p,name);
  if(kind===6n)assert.equal(p.texture,row.toString('utf8',48,row.indexOf(0,48)));
  else assert.deepEqual(p.vector,Array.from({length:4},(_,j)=>row.readFloatLE(48+j*4)));
 }
 assert.equal(saved.parameters.find(p=>p.name==='u_normal')?.texture,'Black');assert.deepEqual(d.serialize(),source);
});
