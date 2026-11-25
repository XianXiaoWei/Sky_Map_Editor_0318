import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {MeshesDocument} from '../src/core/meshes';
import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {buildSkirtBarnGeometry,dispatchSkirtBarnDraw,terminateSkirtBarn,appendSkirtDrawChunk,skirtVertexStreams,type LoadedSkirtRecord,type SkirtDrawChunk} from '../src/core/skirt-barn-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
interface Case {name:string;level:string;source:LoadedSkirtRecord[];initialIndexCount:number;fill:number;pending:boolean;initialMaterials:number;enabled:boolean;candidates:number[];save:boolean;}
const cases:Case[]=[];let seed=0x318b9000;
const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
for(const recordCount of [0,1,2,3,8,31])for(const fill of [0,0x55]){
 const source=Array.from({length:recordCount},(_,ordinal)=>{
   const vc=ordinal%5===0?0:ordinal%5===1?1:ordinal%5===2?3:ordinal%5===3?33:96,vertices=Buffer.alloc(vc*40);
   for(let i=0;i<vc;i++){
     for(let lane=0;lane<3;lane++)vertices.writeFloatLE((random()%10000)/64-80,i*40+lane*4);
     for(let b=12;b<40;b++)vertices[i*40+b]=random()&255;
     // Unknown IDs and nonzero slots after zero are intentional.
     vertices[i*40+16]=0;vertices[i*40+17]=nativeMaterialDefs('Dawn')[ordinal%30].materialId;
   }
   const ic=vc?ordinal%4===0?0:ordinal%4===1?3:ordinal%4===2?33:96:0;
   return {vertices,indices:Uint16Array.from({length:ic},()=>random()%vc)};
 });
 cases.push({name:`synthetic-${recordCount}-${fill}`,level:'Dawn',source,initialIndexCount:fill?5:0,fill,pending:false,initialMaterials:0,enabled:true,candidates:source.flatMap((_,i)=>[i%3?1:0,i%4?1:0]),save:true});
}
for(const kind of ['nan','signed-zero','large-index','disabled','pending']){
 const count=kind==='large-index'?65536:3,vertices=Buffer.alloc(count*40);
 for(let i=0;i<count;i++){vertices.writeFloatLE(kind==='nan'&&i===1?NaN:kind==='signed-zero'&&i===2?-0:i%128,i*40);vertices.writeFloatLE(i%32,i*40+4);vertices.writeFloatLE(-i%64,i*40+8);vertices[i*40+16]=1;vertices[i*40+19]=255;}
 const source=[{vertices,indices:Uint16Array.from([0,count-1,0])}];if(kind==='large-index')source.push({vertices:Buffer.from(vertices.subarray(0,120)),indices:Uint16Array.from([0,1,2])});
 cases.push({name:kind,level:'Dawn',source,initialIndexCount:7,fill:0xa5,pending:kind==='pending',initialMaterials:kind==='pending'?4:0,enabled:kind!=='disabled',candidates:source.flatMap(()=>[1,1]),save:kind!=='large-index'});
}
let corpusMaps=0,corpusRecords=0,corpusVertices=0,corpusIndices=0;
const data=path.resolve(executable,'../../Data/Levels');
for(const level of fs.readdirSync(data).sort()){
 const file=path.join(data,level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
 const doc=new MeshesDocument(fs.readFileSync(file)),source=doc.geometries.filter(g=>g.kind==='skirt').map(g=>({vertices:Buffer.from(doc.lod.subarray(g.vertexOffset,g.vertexOffset+g.vertexCount*40)),indices:Uint16Array.from(g.indices)}));
 corpusMaps++;corpusRecords+=source.length;corpusVertices+=source.reduce((n,s)=>n+s.vertices.length/40,0);corpusIndices+=source.reduce((n,s)=>n+s.indices.length,0);
 for(const fill of [0,0x55])cases.push({name:`map-${level}-${fill}`,level,source,initialIndexCount:0,fill,pending:false,initialMaterials:0,enabled:true,candidates:source.flatMap((_,i)=>[i%7?1:0,i%5?1:0]),save:false});
}
const bytes=(a:Uint8Array|Uint16Array|Uint32Array)=>Buffer.from(a.buffer,a.byteOffset,a.byteLength),u32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v,i*4));return b;};
const input=Buffer.concat([u32([cases.length]),...cases.flatMap(c=>{const name=Buffer.alloc(128);name.write(c.level);return [u32([c.source.length,c.initialIndexCount,c.fill,+c.pending,c.initialMaterials,+c.enabled]),name,u32(c.candidates),...c.source.flatMap(s=>[u32([s.vertices.length/40,s.indices.length]),bytes(s.vertices),bytes(s.indices)])];})]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-skirt-barn-')),cache='/root/sky-research/skirt-barn-native-output';
const inputSha256=crypto.createHash('sha256').update(input).update(fs.readFileSync('tools/native-skirt-barn-oracle.c')).update(hash).digest('hex');let raw:Buffer;
try{
 if(fs.existsSync(cache+'.json')&&JSON.parse(fs.readFileSync(cache+'.json','utf8')).inputSha256===inputSha256&&fs.existsSync(cache+'.bin'))raw=fs.readFileSync(cache+'.bin');
 else{
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-skirt-barn-oracle.c','-lm','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,timeout:180000,maxBuffer:256*1024*1024});
  if(run.status!==0){fs.writeFileSync(`docs/skirt-barn-runner-failure-${Date.now()}.json`,JSON.stringify({executableSha256:hash,status:run.status,signal:run.signal,error:run.error?.message,stderr:run.stderr.toString()},null,2)+'\n');throw new Error(`Original SkirtBarn failed (${run.status}): ${run.stderr}`);}
  raw=run.stdout;fs.mkdirSync(path.dirname(cache),{recursive:true});fs.writeFileSync(cache+'.bin',raw);fs.writeFileSync(cache+'.json',JSON.stringify({inputSha256,executableSha256:hash})+'\n');
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0,failed=0,compared=0,drawChunks=0;const failures:unknown[]=[],saved:unknown[]=[];
const take=(n:number)=>{if(at+n>raw.length)throw new Error('Truncated skirt output');const b=raw.subarray(at,at+n);at+=n;return b;},read32=()=>take(4).readUInt32LE(0),uints=(n:number)=>Array.from({length:n},read32);
function equal(name:string,field:string,actual:unknown,expected:unknown){compared++;if(JSON.stringify(actual)!==JSON.stringify(expected)){failed++;if(failures.length<20)failures.push({name,field,actual,expected});}}
function compare(name:string,field:string,actual:Buffer,expected:Buffer){if(actual.length!==expected.length)throw new Error(`Skirt storage size ${name}/${field}`);for(let i=0;i<actual.length;i++){if(field==='records'&&i<actual.length-64&&(i%48>=12&&i%48<16||i%48>=28&&i%48<32))continue;compared++;if(actual[i]!==expected[i]){failed++;if(failures.length<20)failures.push({name,field,offset:i,actual:actual[i],expected:expected[i]});}}}
type Event={kind:number;args:number[];text:string};
const event=(kind:number,a=0,b=0,c=0,d=0,text=''):Event=>({kind,args:[a,b,c,d,0,0,0],text});
const readEvents=()=>Array.from({length:read32()},()=>{const values=uints(8),str=take(96);return {kind:values[0],args:values.slice(1),text:str.subarray(0,str.indexOf(0)).toString()};});
equal('protocol','cases',read32(),cases.length);
for(const c of cases){
 const nativeState=uints(5),storage=Array.from({length:read32()},()=>{const n=read32();return take(n+64);}),streamArgs=uints(12),types=uints(21),attributes=uints(21),loadEvents=readEvents(),drawEvents=readEvents();
 const nativeChunks=Array.from({length:nativeState[3]},()=>Array.from({length:read32()},()=>{const [start,count,unknown]=uints(3);return {start,count,unknown};}));
 const terminated=uints(5),terminatedAgain=uints(5),termEvents=readEvents();
 const geometry=c.pending?null:buildSkirtBarnGeometry(c.source,nativeMaterialDefs(c.level),{initialIndexCount:c.initialIndexCount,allocationFill:c.fill});
 const state={skirtCount:geometry?.skirtCount??0,vertexCount:geometry?.vertexCount??0,indexCount:geometry?.indexCount??c.initialIndexCount,materialCount:geometry?.materialCount??c.initialMaterials,records:geometry?.records??null};
 equal(c.name,'loadedState',nativeState,[state.skirtCount,state.vertexCount,state.indexCount,state.materialCount,+!!state.records]);
 const expectedLoad=[event(0),event(1),event(2,1),event(3)];
 if(geometry){
  const arrays=[geometry.records,geometry.baseVertices,geometry.userData1,geometry.userData0,geometry.indices],alignments=[16,4,1,1,4];
  equal(c.name,'allocations',storage.length,5);
  arrays.forEach((s,i)=>{compare(c.name,i===0?'records':`storage-${i}`,Buffer.concat([bytes(s),Buffer.alloc(64,c.fill)]),storage[i]);expectedLoad.push(event(6,i,s.byteLength,i?2:1,alignments[i]));});
  expectedLoad.push(event(8,geometry.vertexCount,0,0,0,'Skirts'),...skirtVertexStreams.map(s=>event(9,s.slot,s.types.length,1,0)),event(10,0,9,1,geometry.indexCount),event(11),event(12));
  skirtVertexStreams.forEach((s,i)=>{equal(c.name,`stream-${i}`,streamArgs.slice(i*4,i*4+4),[s.slot,s.types.length,1,0]);equal(c.name,`types-${i}`,types.slice(i*7,i*7+s.types.length),s.types);equal(c.name,`attributes-${i}`,attributes.slice(i*7,i*7+s.attributes.length),s.attributes);});
  const bits=Buffer.alloc(4);bits.writeFloatLE(5);
  nativeMaterialDefs(c.level).forEach((d,i)=>expectedLoad.push(event(13,i,4,0,0,d.shaderName+'AlphaSkirt'),event(14,i,bits.readUInt32LE(0),0,0,'u_skirtDRange'),event(15,i)));
  for(const i of [4,3,2,1])expectedLoad.push(event(7,i,0,2));
 }
 expectedLoad.push(event(5));equal(c.name,'loadEvents',loadEvents,expectedLoad);
 const expectedDraw:Event[]=[],queues:SkirtDrawChunk[][]=Array.from({length:state.materialCount},()=>[]);
 dispatchSkirtBarnDraw(state,c.enabled,{clearMaterial:i=>{queues[i]=[];},inFrustum:(_min,_max,i)=>{expectedDraw.push(event(18,i,c.candidates[i*2]));return !!c.candidates[i*2];},cameraPosition:i=>{expectedDraw.push(event(19,i));},withinDistance:(_min,_max,i,limit)=>{const bits=Buffer.alloc(4);bits.writeFloatLE(limit);expectedDraw.push(event(20,i,c.candidates[i*2+1],bits.readUInt32LE(0)));return !!c.candidates[i*2+1];},append:(m,start,count)=>appendSkirtDrawChunk(queues[m],start,count),flushMaterial:i=>{expectedDraw.push(event(22,i,queues[i].length));}});
 equal(c.name,'drawEvents',drawEvents,expectedDraw);equal(c.name,'drawChunks',nativeChunks.map(q=>q.map(({start,count})=>({start,count}))),queues);drawChunks+=queues.reduce((n,q)=>n+q.length,0);
 const expectedTermination:Event[]=[];const services={terminateMaterial:(i:number)=>{expectedTermination.push(event(16,i));},terminateGeometry:()=>{expectedTermination.push(event(17));},releaseRecords:()=>{expectedTermination.push(event(7,0,0,1));}};
 terminateSkirtBarn(state,services);equal(c.name,'terminated',terminated,[state.skirtCount,0,0,0,0]);terminateSkirtBarn(state,services);equal(c.name,'terminatedAgain',terminatedAgain,[state.skirtCount,0,0,0,0]);equal(c.name,'terminationEvents',termEvents,expectedTermination);
 if(c.save)saved.push({name:c.name,level:c.level,initialIndexCount:c.initialIndexCount,fill:c.fill,pending:c.pending,initialMaterials:c.initialMaterials,enabled:c.enabled,candidates:c.candidates,source:c.source.map(s=>({verticesHex:bytes(s.vertices).toString('hex'),indices:Array.from(s.indices)})),nativeState,streamArgs,types,attributes,storageHex:storage.map(b=>b.toString('hex')),loadEvents,drawEvents,chunks:nativeChunks.map(q=>q.map(({start,count})=>({start,count}))),terminated,terminatedAgain,termEvents});
}
if(at!==raw.length)throw new Error('Unread skirt output');
const scope='Unmodified original SkirtBarn Initialize 0x1005abf50 normal found-resource and pending early-return bodies, Terminate 0x1005aca70 twice and draw driver 0x1005acaf0 execute continuously. Original MaterialDefBarn Initialize 0x10043fb70, lookup 0x100443560 and contiguous draw-chunk append 0x1007f6ae0 execute unmodified. Resource query/ref, allocator/scratch, imported libc, GPU/material/uniform upload and destruction are explicit host callbacks; draw frustum/Camera/distance queries use explicit per-record outcomes, not restored camera mathematics. Full corpus uses all 2533 records in 33 maps, two heap fills; original record positions are not transformed. CPU parity includes three streams (slot 2 never written), all relocated u32 indices including untouched initial-index-count tail, XYZ bounds, index count/material mask, untouched record tail/64-byte guards, stream descriptors, shader/uniform/dependency order, actual native draw chunks and repeated termination. Bounds W lanes inherit ambient SIMD values and are excluded; no W semantics claimed. Empty-queue FFFFFFFF chunk sentinel raw storage is rejected by the adapter and untested. Fallback resource lookup, failed-load assertions, exceptions, actual loader/ownership, GPU behavior, real visibility/distance sources, generated geometry, lighting/collision reconstruction and original hardware/game remain unresolved.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,compared,failed,failures,corpusMaps,corpusRecords,corpusVertices,corpusIndices,drawChunks,loadedGeometryAndDescriptorsVerified:true,normalTerminationDispatchVerified:true,drawDriverAndChunkAppendVerified:true,actualResourceLifecycleRestored:false,cameraAndVisibilityQueriesRestored:false,generationRestored:false,viewportIntegrated:false,originalHardwareVerified:false,originalGameVerified:false};
fs.writeFileSync('docs/skirt-barn-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/skirt-barn-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/skirt-barn-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
