import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {gzipSync} from 'node:zlib';
import {spawnSync} from 'node:child_process';
import {VisibilityRuntime,type VisibilityAllocation,type VisibilityGeometry,type VisibilityHeap} from '../src/core/visibility-runtime';
import {queryVisibilitySpheres} from '../src/core/visibility-spheres';
import {queryVisibilityAabbs} from '../src/core/visibility-aabbs';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {qemuVisibilityMax,visibilityDiv} from '../src/core/visibility-float';
import {MeshesDocument} from '../src/core/meshes';

const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
const identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
const projection=[1.73,0,0,0,0,2.3,0,0,0,0,-1.002,-1,0,0,-0.2002,0];
type Step={operation:number;flags:number;csr:number;device:Buffer;camera:Buffer;};
type Case={name:string;initial:Buffer;geometry:VisibilityGeometry;recordCount:number;spheres:Float32Array;minima:Float32Array;maxima:Float32Array;steps:Step[];save:boolean;};
const cases:Case[]=[];let seed=0x318f51ce;
const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
function camera(tag:number,translation=0) {
  const bytes=Buffer.alloc(0x300);for(let i=0;i<bytes.length;i++)bytes[i]=(i*17+tag*29)&255;
  const view=[...identity.slice(0,12),translation,0,-2,1];
  // Explicit stored CPU matrices. The general camera producer is not replaced
  // by a guessed automatic projection or inferred jitter in this oracle.
  const vp=projection.slice();vp[12]=Math.fround(projection[0]*translation);vp[14]=Math.fround(projection[10]*-2+projection[14]);vp[15]=2;
  for(const [offset,matrix] of [[0x140,view],[0x180,projection],[0x1c0,vp]] as const)matrix.forEach((v,i)=>bytes.writeFloatLE(v,offset+i*4));
  return bytes;
}
function step(operation:number,width=64,height=48,flags=4,tag=0,csr=0x1f80):Step {
  const device=Buffer.alloc(0x300,0xa5);device.writeFloatLE(width,0x284);device.writeFloatLE(height,0x288);device.writeFloatLE(0.1234567+tag*0.001,0x244);device.writeFloatLE(1.234567+tag*0.1,0x298);
  return {operation,flags,csr,device,camera:camera(tag,(tag%5-2)*0.05)};
}
function add(name:string,geometry:VisibilityGeometry,recordCount:number,width:number,height:number,mode:number,save=true) {
  const initial=Buffer.alloc(0x240);initial.writeFloatLE(10000,0x18);initial.writeUInt32LE(0x318faced,0x234);
  const spheres=Float32Array.from(Array.from({length:17},(_,i)=>[(i-8)*0.15,(i%5-2)*0.1,-0.25-i*0.2,i%3*0.1]).flat());
  const minima=Float32Array.from(Array.from({length:17},(_,i)=>[(i-8)*0.15-0.1,(i%5-2)*0.1-0.1,-0.35-i*0.2,123]).flat());
  const maxima=Float32Array.from(Array.from({length:17},(_,i)=>[(i-8)*0.15+0.1,(i%5-2)*0.1+0.1,-0.15-i*0.2,456]).flat());
  const flags=[4,0,1,2,6,5][mode%6],csr=mode%2?0xffc0:0x1f80;
  const steps=[step(0,width,height,4,1,csr),step(1,width,height,4,2,csr),step(2,width,height,flags,3,csr),step(3,width,height,flags&3|8,4,csr),
    step(1,width+1,height+1,4,5,csr),step(2,width,height,4,6,csr),step(3,width,height,8,7,csr),
    step(1,width+8,height+4,4,8,csr),step(2,width,height,0,9,csr),step(3,width,height,8,10,csr),
    step(1,width,height,4,11,csr),step(4,width,height,4,12,csr)];
  cases.push({name,initial,geometry,recordCount,spheres,minima,maxima,steps,save});
}
for(const n of [0,4,5,8,16,31,32,33,127,128,129])for(let mode=0;mode<6;mode++) {
  const vertices=Buffer.alloc(n*16);
  for(let i=0;i<n;i++){[(random()-0.5)*2,(random()-0.5)*2,-0.1-random()*2].forEach((v,j)=>vertices.writeFloatLE(v,i*16+j*4));for(let j=0;j<3;j++)vertices.writeInt8(mode%2?[-128,-1,0,1,127][(i+j)%5]:0,i*16+12+j);vertices[i*16+15]=i&255;}
  const indices=Uint16Array.from({length:n?mode%2?193:96:0},(_,i)=>i%n);
  add(`synthetic-${n}-${mode}`,{vertices,vertexCount:n,indices,indexCount:indices.length},mode%3,[64,68,72,128,132,256][mode],[48,52,60,96,100,144][mode],mode,n<=8);
}
// Same-size allocations with a different mip shape, repeated camera copies,
// no geometry, disable branches and ambient RTE/RTZ are all stateful inputs.
for(let run=0;run<128;run++)add(`empty-${run}`,{vertices:new Uint8Array(),vertexCount:0,indices:new Uint16Array(),indexCount:0},0,8+run%17*4,8+run%13*4,run,false);
const data=path.resolve(executable,'../../Data');let corpusMaps=0,corpusVertices=0,corpusIndices=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file)),g=doc.geometries.find(g=>g.kind==='occluder');if(!g)continue;
  const vertices=doc.lod.subarray(g.vertexOffset,g.vertexOffset+g.vertexCount*16),indices=Uint16Array.from(g.indices);
  add(`map-${level}`,{vertices,vertexCount:g.vertexCount,indices,indexCount:indices.length},1,128,96,0,false);corpusMaps++;corpusVertices+=g.vertexCount;corpusIndices+=indices.length;
}
const chunks:Buffer[]=[];
const uints=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));chunks.push(b);};
const rawFloats=(v:Float32Array)=>chunks.push(Buffer.from(v.buffer,v.byteOffset,v.byteLength));
uints([cases.length]);
for(const c of cases) {
  uints([c.steps.length,c.geometry.vertexCount,c.geometry.indexCount,c.recordCount,c.spheres.length/4,c.minima.length/4]);chunks.push(c.initial,Buffer.from(c.geometry.vertices),Buffer.from(c.geometry.indices.buffer));rawFloats(c.spheres);rawFloats(c.minima);rawFloats(c.maxima);
  for(const s of c.steps){uints([s.operation,s.flags,s.csr]);chunks.push(s.device,s.camera);}
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-lifecycle-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-lifecycle-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:128*1024*1024});
  if(run.status!==0){
    const failure=`docs/visibility-lifecycle-crash-${Date.now()}`;
    fs.writeFileSync(`${failure}.bin.gz`,gzipSync(Buffer.concat(chunks)));
    fs.writeFileSync(`${failure}.json`,JSON.stringify({executableSha256:hash,status:run.status,signal:run.signal,stderr:run.stderr.toString()},null,2)+'\n');
    throw new Error(`Original lifecycle failed (${run.status}): ${run.stderr}`);
  }raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0;const u32=()=>{const v=raw.readUInt32LE(at);at+=4;return v;},take=(size:number)=>{const v=raw.subarray(at,at+size);at+=size;return v;};
if(u32()!==cases.length)throw new Error('Invalid lifecycle groups');
let compared=0,failed=0;const failures:unknown[]=[],rows:unknown[]=[],saved:unknown[]=[],failedInputs:unknown[]=[];
for(const c of cases) {
  const allocations:{id:number;memory:Uint8Array;kind:number;bytes:number}[]=[],events:number[][]=[];
  const allocate=(bytes:number,align:number,kind:number)=>{
    const memory=new Uint8Array(bytes+128).fill(0xef),allocation={id:allocations.length+1,memory,kind,bytes};allocations.push(allocation);events.push([1,kind,bytes,align,allocation.id]);return allocation;
  };
  const release=(allocation:VisibilityAllocation,kind:number)=>{const a=allocations.find(a=>a.id===allocation.id)!;events.push([2,kind,a.bytes,0,a.id]);};
  const heap:VisibilityHeap={allocate(bytes,align){return allocate(bytes,align,1);},free(a){release(a,1);}};
  const scratch={allocate(bytes:number,align:number){return allocate(bytes,align,2).memory.subarray(0,bytes);},free(memory:Uint8Array){const a=allocations.find(a=>a.memory.buffer===memory.buffer)!;release(a,2);}};
  const runtime=new VisibilityRuntime(heap,scratch,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax,c.initial);
  const snapshots:unknown[]=[];let missed=0;
  for(const [stepIndex,s] of c.steps.entries()) {
    const expectedChanged=u32(),before=u32(),after=u32(),expectedState=take(0x240),hasCamera=u32(),expectedCamera=hasCamera?take(0x300):null,depthWords=u32(),expectedDepth=take(depthWords*4),eventCount=u32(),expectedEvents=Array.from({length:eventCount},()=>Array.from({length:5},u32)),linked=u32();
    const expectedSpheres=s.operation===3?Array.from({length:c.spheres.length/4+8},u32):[],expectedAabbs=s.operation===3?Array.from({length:c.minima.length/4+8},u32):[];
    let changed=true,sphereStatuses:Uint32Array|undefined,aabbStatuses:Uint32Array|undefined;
    if(s.operation===0)runtime.initialize(s.camera);
    else if(s.operation===1)changed=runtime.resize(s.device,s.camera,s.csr===0xffc0?visibilityDiv:(a,b)=>Math.fround(a/b));
    else if(s.operation===2)changed=runtime.update(s.camera,{acquire(){events.push([3,3,0,0,0]);return {records:c.recordCount?[c.geometry,...(c.recordCount===2?[{vertices:new Uint8Array(),vertexCount:0,indices:new Uint16Array(),indexCount:0}]:[])]:[],release(){events.push([4,3,0,0,0]);}};}},{disabled:!!(s.flags&1),frustumOnly:!!(s.flags&2),copyCamera:!!(s.flags&4)});
    else if(s.operation===3) {
      const state=runtime.queryState(!!(s.flags&1),!!(s.flags&2));sphereStatuses=new Uint32Array(c.spheres.length/4+8).fill(0x318faced);aabbStatuses=new Uint32Array(c.minima.length/4+8).fill(0x318faced);
      queryVisibilitySpheres(state,c.spheres,c.spheres.length/4,sphereStatuses,!!(s.flags&8),qemuVisibilityReciprocal,qemuVisibilityMax);queryVisibilityAabbs(state,c.minima,c.maxima,c.minima.length/4,aabbStatuses,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax);
    }else runtime.terminate();
    const check=(field:string,ok:boolean,details:unknown={})=>{compared++;if(!ok){missed++;if(failures.length<20)failures.push({case:c.name,step:stepIndex,operation:s.operation,field,...details as object});}};
    check('changed',Number(changed)===expectedChanged);check('MXCSR-control',(before&0xffc0)===(after&0xffc0));check('resource-ref-list',linked===0);
    const stateData=new DataView(runtime.raw.buffer),cameraId=Number(stateData.getBigUint64(0x10,true)>>32n),depthId=Number(stateData.getBigUint64(0x20,true)>>32n);
    const actualCamera=allocations.find(a=>a.id===cameraId)?.memory.subarray(0,0x300),actualDepth=allocations.find(a=>a.id===depthId)?.memory;
    const buffers=[{field:'state',expected:expectedState,actual:runtime.raw},{field:'camera',expected:expectedCamera??Buffer.alloc(0),actual:actualCamera??new Uint8Array()},{field:'depth',expected:expectedDepth,actual:actualDepth??new Uint8Array()}];
    for(const b of buffers) {
      check(b.field+'-length',b.expected.length===b.actual.length);
      const actual=Buffer.from(b.actual);for(let offset=0;offset<b.expected.length&&offset<actual.length;offset+=4) {
        const native=b.expected.readUInt32LE(offset),value=actual.readUInt32LE(offset);check(b.field,native===value,{offset,expected:native,actual:value});
      }
    }
    check('events',JSON.stringify(expectedEvents)===JSON.stringify(events),{expected:expectedEvents,actual:events.map(row=>row.slice())});
    check('sphere-status',JSON.stringify(expectedSpheres)===JSON.stringify(sphereStatuses?Array.from(sphereStatuses):[]),{expected:expectedSpheres,actual:sphereStatuses&&Array.from(sphereStatuses)});
    check('aabb-status',JSON.stringify(expectedAabbs)===JSON.stringify(aabbStatuses?Array.from(aabbStatuses):[]));
    snapshots.push({changed:expectedChanged,stateHex:expectedState.toString('hex'),cameraHex:expectedCamera?.toString('hex')??'',depthHex:expectedDepth.toString('hex'),events:expectedEvents,spheres:expectedSpheres,aabbs:expectedAabbs});
  }
  failed+=missed;rows.push({name:c.name,steps:c.steps.length,failed:missed,passed:!missed});
  const snapshot={name:c.name,initialHex:c.initial.toString('hex'),verticesHex:Buffer.from(c.geometry.vertices).toString('hex'),indices:Array.from(c.geometry.indices),recordCount:c.recordCount,spheresHex:Buffer.from(c.spheres.buffer).toString('hex'),minimaHex:Buffer.from(c.minima.buffer).toString('hex'),maximaHex:Buffer.from(c.maxima.buffer).toString('hex'),steps:c.steps.map((s,i)=>({operation:s.operation,flags:s.flags,csr:s.csr,deviceHex:s.device.toString('hex'),cameraHex:s.camera.toString('hex'),expected:snapshots[i]}))};
  if(c.save)saved.push(snapshot);if(missed&&failedInputs.length<2)failedInputs.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread lifecycle output');
const scope='Original complete Visibility Initialize/Resize/Update/Terminate methods, original camera constructor, loaded-resource name RB-tree/type lookup, metadata-ID dispatch and reference observe/release execute unmodified, followed by original geometry submission, clipping, mip generation and sphere/AABB queries. Two equal-name resource nodes have different explicit metadata types. External heap/scratch initial bytes plus 128 guard bytes, imported memcpy/memset/memset_pattern16/strcmp, resource virtual retain/release and stack cookie are explicit host services. Default Update executes original disabled debug-frustum branch without modifying the camera; explicit camera-copy flag and visibility/occlusion-disable paths included. Full raw state and camera padding, allocation IDs/offsets, depth guards, allocation/free/reference events and statuses checked. Inputs include all 33 real map occluder records with explicit stored camera matrices. Native class default state, global module scheduling, actual loaded resource loader/virtual implementations, original camera producer, enabled debug drawing, original hardware and game/GPU culling remain unverified.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,steps:cases.reduce((n,c)=>n+c.steps.length,0),corpusMaps,corpusVertices,corpusIndices,compared,failed,failures,rows};
fs.writeFileSync('docs/visibility-lifecycle-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/visibility-lifecycle-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/visibility-lifecycle-failure-${Date.now()}.json`,JSON.stringify({...report,failedInputs},null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
