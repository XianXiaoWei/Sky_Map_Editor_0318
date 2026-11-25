import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {MeshesDocument} from '../src/core/meshes';
import {visibilityFloatBits as bits,visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';
import {qemuVisibilityReciprocal,transformVisibilityVertices} from '../src/core/visibility-transform';
import {qemuVisibilityMin,rasterVisibilityTriangles} from '../src/core/visibility-raster';

const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied original executable');
let seed=0x3187beef;
const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
interface Case {name:string;width:number;height:number;vertices:Float32Array;indices:Uint16Array;depth:Float32Array;selected:Uint32Array;selectedCount:number;enabled:boolean;save:boolean;}
const cases:Case[]=[];
function add(name:string,width:number,height:number,vertices:Float32Array,indices:Uint16Array,enabled:boolean,capacity:number,selectedCount=0,save=true) {
  const depth=new Float32Array(width*height+Math.max(32,width+4)).fill(1),selected=new Uint32Array(capacity).fill(0x318faced);
  for(let i=0;i<depth.length;i++)if(i%17===0)depth[i]=[0,-0,0.25,2,-1,fromBits(1),fromBits(0x80000001),NaN,Infinity][i%9];
  const words=new Uint32Array(depth.buffer);for(let i=0;i<words.length;i+=41)words[i]=[0x7fc00001,0xffc03180,0x7fa03180][Math.floor(i/41)%3];
  cases.push({name,width,height,vertices,indices,depth,selected,selectedCount,enabled,save});
}
for(const width of [3,4,7,8,15,16,31])for(const height of [3,4,7,8,15,16]) {
  const vertices=new Float32Array(16*4);
  for(let i=0;i<16;i++) {
    vertices.set([(random()*3-1)*width,(random()*3-1)*height,[0,0.125,0.25,0.75,1,-0.5,fromBits(1),-0,NaN][i%9],-999],i*4);
  }
  for(const n of [0,3,9,11,12,13,15,24,25,36])for(const [enabled,capacity,selectedCount] of [[false,0,0],[true,0,0],[true,1,0],[true,4,0],[true,4,4]] as const) {
    const indices=Uint16Array.from({length:n},(_,i)=>i%16);
    add(`random-${width}-${height}-${n}-${Number(enabled)}-${capacity}-${selectedCount}`,width,height,vertices,indices,enabled,capacity,selectedCount,width<=8&&height<=8&&[12,13,24].includes(n));
  }
}
// Shared edges, winding, half-pixel conversion, integer overflow and out-of-view boxes.
const positions=[
  [[0,0,0.1],[8,0,0.3],[0,8,0.5]],[[0,0,0.1],[0,8,0.5],[8,0,0.3]],
  [[0.5,0.5,0.1],[7.5,0.5,0.3],[0.5,7.5,0.5]],[[1,1,-0.1],[7,1,0.3],[1,7,0.5]],
  [[-80000,-80000,0.1],[80000,1,0.3],[1,80000,0.5]],[[20,20,0.1],[30,20,0.3],[20,30,0.5]],
  [[0,0,0.1],[0,0,0.3],[0,0,0.5]],[[0,0,0.1],[2**31,0,0.3],[0,2**31,0.5]],
  [[0,0,fromBits(1)],[8,0,0.3],[0,8,0.5]]
];
for(let i=0;i<positions.length;i++) {
  const vertices=Float32Array.from(Array.from({length:4},()=>positions[i].flatMap(v=>[...v,-999])).flat());
  for(const enabled of [false,true])add(`edge-${i}-${Number(enabled)}`,8,8,vertices,Uint16Array.from({length:12},(_,j)=>j),enabled,8);
}
const data=path.resolve(executable,'../../Data');
for(const level of fs.readdirSync(path.join(data,'Levels'))) {
  const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file));
  for(const record of doc.geometries.filter(g=>g.kind==='occluder')) {
    const vertices=new Float32Array(record.vertexCount*4),matrix=[0.02,0,0,0,0,0.02,0,0,0,0,0.02,0,32,24,0.5,1];
    transformVisibilityVertices(doc.lod.subarray(record.vertexOffset,record.vertexOffset+record.vertexCount*16),record.vertexCount,matrix,vertices,qemuVisibilityReciprocal);
    const indices=Uint16Array.from(record.indices.subarray(0,Math.min(120,record.indexCount)));
    add(`map-${level}`,64,48,vertices,indices,true,40,0,false);
  }
}
const chunks:Buffer[]=[];
function uints(values:number[]){const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));chunks.push(b);}
uints([cases.length]);
for(const c of cases){uints([4,c.vertices.length/4]);uints([c.width,c.height,c.indices.length,c.selected.length,c.selectedCount,Number(c.enabled),c.depth.length]);chunks.push(Buffer.from(c.vertices.buffer),Buffer.from(c.indices.buffer),Buffer.from(c.depth.buffer),Buffer.from(c.selected.buffer));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-raster-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:64*1024*1024});
  if(run.status!==0)throw new Error(`Original raster failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid group count');let at=4,compared=0,failed=0;
const rows:unknown[]=[],failures:unknown[]=[],saved:unknown[]=[],failedInputs:unknown[]=[];
for(const c of cases) {
  const count=raw.readUInt32LE(at);at+=4;
  const selected=raw.subarray(at,at+c.selected.byteLength);at+=c.selected.byteLength;
  const depth=raw.subarray(at,at+c.depth.byteLength);at+=c.depth.byteLength;
  const observed=c.depth.slice(),selection=c.enabled?{triangles:c.selected.slice(),count:c.selectedCount}:null;
  try {rasterVisibilityTriangles(observed,c.width,c.height,c.vertices,c.indices,c.indices.length,selection,qemuVisibilityReciprocal,qemuVisibilityMin);}
  catch(error) {
    fs.writeFileSync(`docs/visibility-raster-range-failure-${Date.now()}.json`,JSON.stringify({name:c.name,error:String(error),width:c.width,height:c.height,verticesHex:Buffer.from(c.vertices.buffer).toString('hex'),indicesHex:Buffer.from(c.indices.buffer).toString('hex'),depthHex:Buffer.from(c.depth.buffer).toString('hex'),nativeDepthHex:depth.toString('hex')},null,2)+'\n');
    console.error(c.name);throw error;
  }
  const observedSelected=selection?.triangles??c.selected;let missed=0;
  compared++;if((selection?.count??c.selectedCount)!==count)missed++;
  const checks=[[selected,Buffer.from(observedSelected.buffer)],[depth,Buffer.from(observed.buffer)]];
  for(let field=0;field<checks.length;field++) {
    const [expected,actual]=checks[field];for(let i=0;i<expected.length;i+=4){compared++;if(expected.readUInt32LE(i)!==actual.readUInt32LE(i)){missed++;if(failures.length<20)failures.push({name:c.name,field,index:i/4,expected:expected.readUInt32LE(i),actual:actual.readUInt32LE(i)});}}
  }
  failed+=missed;rows.push({name:c.name,indices:c.indices.length,visitedTriangles:Math.floor(c.indices.length/12)*4,selectedCount:count,failed:missed,passed:missed===0});
  const snapshot={name:c.name,width:c.width,height:c.height,verticesHex:Buffer.from(c.vertices.buffer).toString('hex'),indicesHex:Buffer.from(c.indices.buffer).toString('hex'),depthHex:Buffer.from(c.depth.buffer).toString('hex'),selectedHex:Buffer.from(c.selected.buffer).toString('hex'),selectedCount:c.selectedCount,enabled:c.enabled,expectedCount:count,expectedSelectedHex:selected.toString('hex'),expectedDepthHex:depth.toString('hex')};
  if(c.save)saved.push(snapshot);if(missed&&failedInputs.length<8)failedInputs.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread raster output');
const scope='Complete unmodified 0x10071ee60 body with original MXCSR |= 0xe040 under QEMU -cpu max. Original stack cookie points to fixed oracle cookie; no function instructions patched. Explicit float4 screen vertices, uint16 indices, depth+guard snapshots and nullable selected list/count/capacity. All output words, four-triangle batch truncation, winding/int32 overflow, bounding boxes, mixed/nonpositive depth diversion, tiled 2x2 edge tests and depth interpolation compared. Map cases use first 120 indices per map and synthetic screen matrix, not full real-camera geometry submission. RCPPS and MIN behavior are emulator capabilities; clipping/selected-triangle expansion, full submission, queries, GPU and real game excluded.';
const report={passed:failed===0,executableSha256:hash,function:'0x10071ee60',scope,cases:cases.length,mapCases:cases.filter(c=>c.name.startsWith('map-')).length,compared,failed,failures,rows};
fs.writeFileSync('docs/visibility-raster-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/visibility-raster-native.json',JSON.stringify({executableSha256:hash,scope,cases:saved})+'\n');
else fs.writeFileSync(`docs/visibility-raster-failure-${Date.now()}.json`,JSON.stringify({...report,failedInputs},null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
