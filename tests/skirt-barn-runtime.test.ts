import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {nativeMaterialDefs,skirtSurfaces} from '../src/core/mesh-surfaces';
import {buildSkirtBarnGeometry,dispatchSkirtBarnDraw,terminateSkirtBarn,appendSkirtDrawChunk,skirtVertexStreams,type SkirtDrawChunk} from '../src/core/skirt-barn-runtime';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/skirt-barn-native.json.gz')).toString());
const bytes=(a:Uint8Array|Uint32Array)=>Buffer.from(a.buffer,a.byteOffset,a.byteLength);
const source=(c:any)=>c.source.map((s:any)=>({vertices:Buffer.from(s.verticesHex,'hex'),indices:Uint16Array.from(s.indices)}));
const geometry=(c:any)=>buildSkirtBarnGeometry(source(c),nativeMaterialDefs(c.level),{initialIndexCount:c.initialIndexCount,allocationFill:c.fill});

test('SkirtBarn CPU streams, bounds, masks and relocated indices match original full-load fixtures',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const c of fixture.cases.filter((c:any)=>!c.pending)){
  const g=geometry(c);
  assert.deepEqual([g.skirtCount,g.vertexCount,g.indexCount,g.materialCount,1],c.nativeState,c.name);
  for(const [i,s] of [g.records,g.baseVertices,g.userData1,g.userData0,g.indices].entries()){
   const expected=Buffer.from(c.storageHex[i],'hex').subarray(0,s.byteLength),actual=bytes(s);
   if(i===0){for(let at=0;at<actual.length;at++)if(!(at%48>=12&&at%48<16||at%48>=28&&at%48<32))assert.equal(actual[at],expected[at],`${c.name}/records/${at}`);}
   else assert.deepEqual(actual,expected,`${c.name}/stream/${i}`);
  }
 }
});
test('SkirtBarn original stream descriptors preserve allocated unwritten slot 2',()=>{
 for(const c of fixture.cases.filter((c:any)=>!c.pending)){
  skirtVertexStreams.forEach((s,i)=>{
   assert.deepEqual(c.streamArgs.slice(i*4,i*4+4),[s.slot,s.types.length,1,0]);
   assert.deepEqual(c.types.slice(i*7,i*7+s.types.length),s.types);
   assert.deepEqual(c.attributes.slice(i*7,i*7+s.attributes.length),s.attributes);
  });
  assert.ok(geometry(c).userData0.every(v=>v===c.fill));
 }
});
test('Viewport skirt batches match original record masks including unknown IDs and zero weights',()=>{
 let checked=0;
 for(const c of fixture.cases.filter((c:any)=>!c.pending)){
  const defs=nativeMaterialDefs(c.level),records=Buffer.from(c.storageHex[0],'hex');
  source(c).forEach((s:{vertices:Buffer;indices:Uint16Array},i:number)=>{
   if(s.indices.length%3||!s.indices.length)return;
   const vertexCount=s.vertices.length/40,materialIds=new Uint8Array(vertexCount*4),weights=new Uint8Array(vertexCount*4);
   for(let v=0;v<vertexCount;v++){materialIds.set(s.vertices.subarray(v*40+16,v*40+20),v*4);weights.set(s.vertices.subarray(v*40+20,v*40+24),v*4);}
   const plan=skirtSurfaces({vertexCount,indices:Uint32Array.from(s.indices),materialIds,weights},defs);
   const mask=plan.batches.reduce((mask,b)=>mask|1<<b.materialIndex,0)>>>0;
   assert.equal(mask,records.readUInt32LE(i*48+36),`${c.name}/record/${i}`);checked++;
  });
 }
 assert.ok(checked>50);
});
test('SkirtBarn original draw driver and native chunk merging match candidate fixtures',()=>{
 for(const c of fixture.cases){
  const g=c.pending?null:geometry(c),state=g??{skirtCount:0,vertexCount:0,indexCount:c.initialIndexCount,materialCount:c.initialMaterials,records:null};
  const queues:SkirtDrawChunk[][]=Array.from({length:state.materialCount},()=>[]),events:any[]=[];
  const event=(kind:number,a=0,b=0,d=0)=>({kind,args:[a,b,d,0,0,0,0],text:''});
  dispatchSkirtBarnDraw(state,c.enabled,{clearMaterial:i=>{queues[i]=[];},inFrustum:(_min,_max,i)=>{events.push(event(18,i,c.candidates[i*2]));return !!c.candidates[i*2];},cameraPosition:i=>{events.push(event(19,i));},withinDistance:(_min,_max,i,limit)=>{assert.equal(limit,40);events.push(event(20,i,c.candidates[i*2+1],0x42200000));return !!c.candidates[i*2+1];},append:(m,start,count)=>appendSkirtDrawChunk(queues[m],start,count),flushMaterial:i=>{events.push(event(22,i,queues[i].length));}});
  assert.deepEqual(events,c.drawEvents,c.name);assert.deepEqual(queues,c.chunks,c.name);
 }
});
test('SkirtBarn normal and repeated termination follow original dependency order and retained count',()=>{
 for(const c of fixture.cases){
  const g=c.pending?null:geometry(c),state=g??{skirtCount:0,vertexCount:0,indexCount:c.initialIndexCount,materialCount:c.initialMaterials,records:null},events:any[]=[];
  const event=(kind:number,a=0,b=0,d=0)=>({kind,args:[a,b,d,0,0,0,0],text:''});
  const services={terminateMaterial:(i:number)=>{events.push(event(16,i));},terminateGeometry:()=>{events.push(event(17));},releaseRecords:()=>{events.push(event(7,0,0,1));}};
  const snapshot=()=>[state.skirtCount,state.vertexCount,state.indexCount,state.materialCount,+!!state.records];
  terminateSkirtBarn(state,services);assert.deepEqual(snapshot(),c.terminated,c.name);
  terminateSkirtBarn(state,services);assert.deepEqual(snapshot(),c.terminatedAgain,c.name);assert.deepEqual(events,c.termEvents,c.name);
 }
});
