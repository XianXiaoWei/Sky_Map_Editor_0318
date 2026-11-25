import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {clipVisibilityTriangles} from '../src/core/visibility-clip';
import {visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';

const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied original executable');
let seed=0x3187cafe;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
const matrices=[
 [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],
 [0.83,0.1,0.04,0,0.2,0.7,0.1,0,0.1,0.3,0.96,1,2,-3,-0.15,0.125],
 [1.73,0.123,0.011,0.09,-0.375,1.42,0.7,-0.08,0.0625,0.1,0.999,1,-128.03,256.07,-0.2,-14.2],
 [1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,1],
 [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,-1],
 [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0]
].map(m=>m.map(Math.fround));
interface Case {name:string;vertices:Buffer;indices:Uint16Array;selected:Uint32Array;matrix:number[];output:Float32Array;outputIndices:Uint16Array;save:boolean;}
const cases:Case[]=[];
function add(name:string,vertices:Buffer,indices:Uint16Array,selected:Uint32Array,matrix:number[],save=true) {
  const output=new Float32Array((selected.length*4+1)*4),outputIndices=new Uint16Array(selected.length*6+11).fill(0xbeef);
  for(let i=0;i<output.length;i++)output[i]=-999-i/16;
  cases.push({name,vertices,indices,selected,matrix,output,outputIndices,save});
}
for(const n of [0,1,2,3,4,5,7,8,9,15,16,17,64,65,128])for(let run=0;run<12;run++) {
  const vertices=Buffer.alloc(n*3*16);
  for(let i=0;i<n*3;i++) {
    [(random()-0.5)*64,(random()-0.5)*64,[-2,-0.5,0,0.125,0.5,2,fromBits(1)][i%7]].forEach((v,j)=>vertices.writeFloatLE(v,i*16+j*4));
    for(let j=0;j<3;j++)vertices.writeInt8(run<6?0:[-128,-127,-1,0,1,126,127][(i+j)%7],i*16+12+j);
    vertices[i*16+15]=Math.floor(random()*256);
  }
  const indices=Uint16Array.from({length:n*3},(_,i)=>i),selected=Uint32Array.from({length:n},(_,i)=>n-1-i);
  add(`random-${n}-${run}`,vertices,indices,selected,matrices[run%matrices.length],n<=9);
}
for(let pattern=0;pattern<27;pattern++)for(const normal of [0,-128,127])for(const matrix of [matrices[0],matrices[3]]) {
  const vertices=Buffer.alloc(3*16);
  let state=pattern;
  for(let i=0;i<3;i++){const z=[-1,0,1][state%3];state=Math.floor(state/3);[i===1?8:0,i===2?8:0,z].forEach((v,j)=>vertices.writeFloatLE(v,i*16+j*4));vertices.writeInt8(normal,i*16+14);}
  add(`sign-pattern-${pattern}-${normal}-${matrix===matrices[0]?0:1}`,vertices,Uint16Array.from([0,1,2]),Uint32Array.from([0]),matrix);
}
for(const scale of [10000,31623,100000,1e10]) {
  const vertices=Buffer.alloc(3*16);[[0,0,1],[scale,0,1],[0,scale,1]].forEach((v,i)=>v.forEach((n,j)=>vertices.writeFloatLE(n,i*16+j*4)));
  add(`large-projection-${scale}`,vertices,Uint16Array.from([0,1,2]),Uint32Array.from([0]),matrices[0]);
}
const chunks:Buffer[]=[];
function uints(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));chunks.push(b);}
function floats(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));chunks.push(b);}
uints([cases.length]);
for(const c of cases){uints([5,c.vertices.length/16]);uints([c.selected.length,c.indices.length,c.output.length/4,c.outputIndices.length]);floats(c.matrix);chunks.push(c.vertices,Buffer.from(c.indices.buffer),Buffer.from(c.selected.buffer),Buffer.from(c.output.buffer),Buffer.from(c.outputIndices.buffer));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-clip-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:64*1024*1024});
  if(run.status!==0)throw new Error(`Original clipping failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid clipping group count');let at=4,compared=0,failed=0;
const failures:unknown[]=[],failedInputs:unknown[]=[],saved:unknown[]=[],rows:unknown[]=[];
for(const c of cases) {
  const vertexCount=raw.readUInt32LE(at),indexCount=raw.readUInt32LE(at+4);at+=8;
  const output=raw.subarray(at,at+c.output.byteLength);at+=c.output.byteLength;
  const outputIndices=raw.subarray(at,at+c.outputIndices.byteLength);at+=c.outputIndices.byteLength;
  const actual=c.output.slice(),actualIndices=c.outputIndices.slice(),result=clipVisibilityTriangles(c.vertices,c.indices,c.selected,c.selected.length,c.matrix,actual,actualIndices);
  let missed=0;compared+=2;missed+=Number(result.vertexCount!==vertexCount)+Number(result.indexCount!==indexCount);
  const actualBits=new Uint32Array(actual.buffer);
  for(let i=0;i<actualBits.length;i++){compared++;const native=output.readUInt32LE(i*4);if(actualBits[i]!==native&&!(Number.isNaN(fromBits(native))&&Number.isNaN(actual[i]))){missed++;if(failures.length<20)failures.push({name:c.name,field:'vertices',index:i,expected:native,actual:actualBits[i]});}}
  for(let i=0;i<actualIndices.length;i++){compared++;if(actualIndices[i]!==outputIndices.readUInt16LE(i*2)){missed++;if(failures.length<20)failures.push({name:c.name,field:'indices',index:i,expected:outputIndices.readUInt16LE(i*2),actual:actualIndices[i]});}}
  failed+=missed;rows.push({name:c.name,selected:c.selected.length,vertexCount,indexCount,discarded:result.discardedTriangles.length,failed:missed,passed:missed===0});
  const snapshot={name:c.name,verticesHex:c.vertices.toString('hex'),indices:Array.from(c.indices),selected:Array.from(c.selected),matrix:c.matrix,initialHex:Buffer.from(c.output.buffer).toString('hex'),initialIndices:Array.from(c.outputIndices),vertexCount,indexCount,outputHex:output.toString('hex'),outputIndices:Array.from({length:c.outputIndices.length},(_,i)=>outputIndices.readUInt16LE(i*2))};
  if(c.save)saved.push(snapshot);if(missed&&failedInputs.length<8)failedInputs.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread clipping output');
const scope='Unmodified complete numeric path of 0x10071f790 under original RTZ/FTZ/DAZ MXCSR and QEMU -cpu max. Original stack cookie is an explicit fixed oracle cookie. Original diagnostic/render switch 0x10203c2f8 disabled; logging and debug geometry calls excluded. Raw signed-normal bias, homogeneous summation, z>=0 clipping with original edge order, signed perspective divide, large-triangle product filter, emitted triangle/quad indices, count reset and dummy vertex/index padding included. Every output slot and untouched sentinel compared; arithmetic NaN payloads excluded. No full loaded resource/geometry submit, hardware/game/GPU execution or real queries claimed.';
const report={passed:failed===0,executableSha256:hash,function:'0x10071f790',scope,cases:cases.length,compared,failed,failures,rows};
fs.writeFileSync('docs/visibility-clip-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/visibility-clip-native.json',JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n');
else fs.writeFileSync(`docs/visibility-clip-failure-${Date.now()}.json`,JSON.stringify({...report,failedInputs},null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
