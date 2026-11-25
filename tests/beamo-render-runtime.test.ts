import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateBeamoRender,BEAMO_RENDER_BYTES,type BeamoRenderCase} from '../tools/beamo-render-cases';
import {uploadOriginalBeamoBarn} from '../src/core/beamo-upload-barn-runtime';
import {groupOriginalBeamoMaterials} from '../src/core/beamo-material-groups-runtime';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-render-native.json.gz')).toString()) as {executableSha256:string;cases:{input:BeamoRenderCase;nativeSha256:string}[]};
test('Whole Beamo material loop, shared Vertex initializers, ResourceRef bodies and 23 Scene lists match original snapshots',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');let maps=0;
 for(const c of fixture.cases){assert.equal(crypto.createHash('sha256').update(evaluateBeamoRender(c.input)).digest('hex'),c.nativeSha256,c.input.label);if(!c.input.label.startsWith('prepared/'))maps++;}assert.equal(maps,33);
});
test('Same Beamo record and VertexData pass all-LOD upload, material grouping, render initialization and resource cleanup',()=>{
 const c:BeamoRenderCase={label:'joined',materials:[{shader:'Mesh',parameters:[{name:'u_texture',type:1,texture:'White'}]}],slots:Array(6).fill(0xffffffff),resources:[{kind:0,name:'Mesh',group:'Opaque'},{kind:1,name:'White'}]};let uploads=0;
 const result=evaluateBeamoRender(c,(m,base)=>{
  const record=base+0x1e0000n,mesh=base+0x1e1000n,lods=base+0x1e1100n,material=base+0xb2030n,context=base+0xc0000n;
  m.write32(base+0x20018n,1);m.write32(base+0x20010n,1);m.write64(base+0x20020n,record);m.write32(base+0x6c830n,0);
  m.write64(record+0x18n,mesh);m.write64(record+0x20n,0n);m.write64(record+0xd8n,material);m.write64(record+0xe0n,0n);m.write32(material+0xe0n,0);m.write32(mesh+0x40n,2);m.write64(mesh+0x48n,lods);
  for(let i=0;i<2;i++){m.write32(lods+BigInt(i)*0xb8n+0x34n,4);m.write32(lods+BigInt(i)*0xb8n+0x38n,6);}
  m.write8(base+0x6cc30n,0);
  uploadOriginalBeamoBarn(m,base,context,0n,{createVertexData:(address,name,count)=>{assert.equal(address,base+0x6c838n);assert.equal(name,'Beamos');assert.equal(count,8);},configureStream:()=>{},configureIndices:(_a,_s,_f,_u,count)=>assert.equal(count,36),mapBuffer:address=>address===base+0x6c980n?base+0x200000n:base+0x210000n,upload:(r,_b,_v,lod,_o,vertices,indices)=>{assert.equal(r,record);assert.equal(lod,uploads++);m.write32(vertices+BigInt(lod*4),0x12340000+lod);m.write32(indices+BigInt(lod*4),0x56780000+lod);return{vertices:4,primaryIndices:6,secondaryIndices:0,alphaIndices:0};},unmapBuffer:()=>{},finishVertexData:address=>m.write8(address+0x3f8n,1)});
  assert.equal(groupOriginalBeamoMaterials(m,base,base+0x1c0000n,1),1);assert.equal(m.read32(record+0xe8n),0);assert.equal(m.read32(record+0x10cn),4);assert.equal(m.read32(record+0x14cn),4);
 });
 const memory=result.subarray(result.length-BEAMO_RENDER_BYTES);assert.equal(uploads,2);assert.equal(memory[0x6cc70+0x538],1);assert.equal(memory.readBigUInt64LE(0x6cc70),0x3a006c838n);assert.equal(memory.readUInt32LE(0x200004),0x12340001);
 assert.equal(memory.readBigUInt64LE(0xc00e0),0n);assert.equal(memory.readBigUInt64LE(0xc0090),0n);assert.equal(memory.readBigUInt64LE(0xd0040),0n);assert.equal(memory.readBigUInt64LE(0xd0440),0n);
 assert.equal(memory.readBigUInt64LE(0x6cc70+0x270+0x40),0x3a00d04b0n);
});
