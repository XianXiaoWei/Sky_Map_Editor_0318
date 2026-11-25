import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateRenderPipeline,type RenderPipelineCase} from '../tools/render-pipeline-cases';
import {BEAMO_RENDER_BYTES} from '../tools/beamo-render-cases';
import {uploadOriginalBeamoBarn} from '../src/core/beamo-upload-barn-runtime';
import {groupOriginalBeamoMaterials} from '../src/core/beamo-material-groups-runtime';

const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/render-pipeline-native.json.gz')).toString()) as {executableSha256:string;cases:{input:RenderPipelineCase;nativeSha256:string}[]};
test('Original shared render initialization, stream binding and lifecycle match whole native snapshots for all 33 material maps',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');let maps=0;
 for(const c of fixture.cases){assert.equal(crypto.createHash('sha256').update(evaluateRenderPipeline(c.input)).digest('hex'),c.nativeSha256,c.input.label);if(!c.input.label.startsWith('prepared/'))maps++;}assert.equal(maps,33);
});
test('Same Beamo mesh record passes all-LOD upload, grouping, original CPU pipeline initialization and ordered release',()=>{
 const c:RenderPipelineCase={label:'joined',input:{label:'joined',materials:[{shader:'Mesh',parameters:[{name:'u_texture',type:1,texture:'White'}]}],slots:Array(6).fill(0xffffffff),resources:[{kind:0,name:'Mesh',group:'Opaque'},{kind:1,name:'White'}]},uniformNames:[],textureNames:['u_texture'],uboSizes:[64],mapped:true};let uploads=0;
 const result=evaluateRenderPipeline(c,(m,base)=>{
  const record=base+0x1e0000n,mesh=base+0x1e1000n,lods=base+0x1e1100n,material=base+0xb2030n,context=base+0xc0000n;
  m.write32(base+0x20018n,1);m.write32(base+0x20010n,1);m.write64(base+0x20020n,record);m.write32(base+0x6c830n,0);
  m.write64(record+0x18n,mesh);m.write64(record+0x20n,0n);m.write64(record+0xd8n,material);m.write64(record+0xe0n,0n);m.write32(material+0xe0n,0);m.write32(mesh+0x40n,2);m.write64(mesh+0x48n,lods);
  for(let i=0;i<2;i++){m.write32(lods+BigInt(i)*0xb8n+0x34n,4);m.write32(lods+BigInt(i)*0xb8n+0x38n,6);}m.write8(base+0x6cc30n,0);
  uploadOriginalBeamoBarn(m,base,context,0n,{createVertexData:(address,name,count)=>{assert.equal(address,base+0x6c838n);assert.equal(name,'Beamos');assert.equal(count,8);},configureStream:()=>{},configureIndices:(_a,_s,_f,_u,count)=>assert.equal(count,36),mapBuffer:address=>address===base+0x6c980n?base+0x200000n:base+0x210000n,upload:(r,_b,_v,lod,_o,vertices,indices)=>{assert.equal(r,record);assert.equal(lod,uploads++);m.write32(vertices+BigInt(lod*4),0x12340000+lod);m.write32(indices+BigInt(lod*4),0x56780000+lod);return{vertices:4,primaryIndices:6,secondaryIndices:0,alphaIndices:0};},unmapBuffer:()=>{},finishVertexData:address=>m.write8(address+0x3f8n,1)});
  assert.equal(groupOriginalBeamoMaterials(m,base,base+0x1c0000n,1),1);assert.equal(m.read32(record+0xe8n),0);assert.equal(m.read32(record+0x10cn),4);assert.equal(m.read32(record+0x14cn),4);
 });
 assert.equal(result.readUInt32LE(0),0);assert.equal(uploads,2);
 const memory=result.subarray(result.length-BEAMO_RENDER_BYTES),calls=Array.from({length:result.readUInt32LE(8)},(_,i)=>Array.from({length:32},(_,j)=>result.readBigUInt64LE(20+i*256+j*8)));
 const indices=(kind:bigint)=>calls.flatMap((c,i)=>c[0]===kind?[i]:[]);
 assert.equal(indices(21n).length,1);assert.ok(indices(20n).length>0);
 assert.ok(indices(24n)[0]>indices(20n).at(-1)!);assert.ok(indices(26n)[0]>indices(24n)[0]);assert.ok(indices(19n)[0]>indices(26n)[0]);assert.ok(indices(27n)[0]>indices(19n)[0]);
 assert.equal(memory[0x6cc70+0x538],0);assert.equal(memory.readBigUInt64LE(0x6cc70),0n);assert.equal(memory.readUInt32LE(0x6cc70+0x270+0x164),0xffffffff);
 assert.equal(memory.readBigUInt64LE(0x6cc70+0x500),0x3a01d0010n);assert.equal(memory[0x6c838+0x3f8],0);
 for(const o of [0x148,0x170,0x198,0x1c0,0x1e8,0x210,0x248,0x280,0x2b8,0x2f0,0x328,0x360,0x398,0x3d0])assert.ok(memory.subarray(0x6c838+o,0x6c838+o+40).equals(Buffer.alloc(40)));
 assert.equal(memory.readUInt32LE(0x200004),0x12340001);assert.equal(memory.readBigUInt64LE(0xc00e0),0n);assert.equal(memory.readBigUInt64LE(0xc0090),0n);assert.equal(memory.readBigUInt64LE(0xd0040),0n);assert.equal(memory.readBigUInt64LE(0xd0440),0n);
});
