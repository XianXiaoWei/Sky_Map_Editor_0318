import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {MeshesDocument} from '../src/core/meshes';
import {submitVisibilityGeometry,type VisibilityScratchStage} from '../src/core/visibility-submit';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';

const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied original executable');
const matrices=[
 [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],
 [0.83,0.1,0.04,0,0.2,0.7,0.1,0,0.1,0.3,0.96,1,2,-3,-0.15,0.125],
 [1.73,0.123,0.011,0.09,-0.375,1.42,0.7,-0.08,0.0625,0.1,0.999,1,-128.03,256.07,-0.2,-14.2]
].map(m=>m.map(Math.fround));
let seed=0x3185cafe;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
interface Case {name:string;width:number;height:number;vertices:Buffer;indices:Uint16Array;matrix:number[];depth:Float32Array;save:boolean;}
const cases:Case[]=[];
function add(name:string,width:number,height:number,vertices:Buffer,indices:Uint16Array,matrix:number[],save=true) {
  const depth=new Float32Array(width*height+Math.max(32,width+4)).fill(1);
  cases.push({name,width,height,vertices,indices,matrix,depth,save});
}
for(const n of [0,1,3,4,7,8,9,16,31,32,33,127,128,129,511,512,513])for(let run=0;run<3;run++) {
  const vertices=Buffer.alloc(n*16);
  for(let i=0;i<n;i++){[(random()-0.5)*4,(random()-0.5)*4,(random()-0.5)*4].forEach((v,j)=>vertices.writeFloatLE(v,i*16+j*4));for(let j=0;j<3;j++)vertices.writeInt8(run?[-128,-127,-1,0,1,126,127][(i+j)%7]:0,i*16+12+j);vertices[i*16+15]=i&255;}
  for(const count of [0,12,95,96,97,191,192,193]) {
    if(!n&&count)continue;
    add(`synthetic-${n}-${run}-${count}`,run===0?15:16,run===0?11:12,vertices,Uint16Array.from({length:count},(_,i)=>i%n),matrices[run],n<=16||n===513&&count===193);
  }
}
const data=path.resolve(executable,'../../Data');
for(const level of fs.readdirSync(path.join(data,'Levels'))) {
  const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file));
  for(const record of doc.geometries.filter(g=>g.kind==='occluder')) {
    const vertices=doc.lod.subarray(record.vertexOffset,record.vertexOffset+record.vertexCount*16);
    add(`map-${level}`,32,24,vertices,Uint16Array.from(record.indices),[0.02,0,0,0,0,0.02,0,0,0,0,0.02,0,0,0,0.5,1].map(Math.fround),false);
  }
}
const chunks:Buffer[]=[];
function uints(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));chunks.push(b);}
function floats(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));chunks.push(b);}
uints([cases.length]);
for(const c of cases){uints([6,c.vertices.length/16]);uints([c.width,c.height,c.indices.length,c.depth.length]);floats(c.matrix);chunks.push(c.vertices,Buffer.from(c.indices.buffer),Buffer.from(c.depth.buffer));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-submit-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:128*1024*1024});
  if(run.status!==0)throw new Error(`Original submission failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid submission group count');let at=4,compared=0,failed=0;
const failures:unknown[]=[],failedInputs:unknown[]=[],saved:unknown[]=[],rows:unknown[]=[];
const stages:VisibilityScratchStage[]=['transformed','selected','clippedVertices','clippedIndices'];
for(const c of cases) {
  const depth=raw.subarray(at,at+c.depth.byteLength);at+=c.depth.byteLength;
  const count=raw.readUInt32LE(at);at+=4;const allocations:{bytes:number;freed:number;data:Buffer}[]=[];
  for(let i=0;i<count;i++){const bytes=raw.readUInt32LE(at),freed=raw.readUInt32LE(at+4);at+=8;const data=raw.subarray(at,at+bytes);at+=bytes;allocations.push({bytes,freed,data});}
  const actual=c.depth.slice(),observed:{stage:VisibilityScratchStage;memory:Uint8Array;bytes:number}[]=[],freed:VisibilityScratchStage[]=[];
  const result=submitVisibilityGeometry(actual,c.width,c.height,c.vertices,c.vertices.length/16,c.indices,c.indices.length,c.matrix,
    {allocate(bytes,alignment,stage){const memory=new Uint8Array(bytes).fill(0xef);observed.push({stage,memory,bytes});return memory;},free(memory,stage){freed.push(stage);}},qemuVisibilityReciprocal,qemuVisibilityMin);
  let missed=0;compared+=2;missed+=Number(count!==4)+Number(freed.join(',')!==stages.slice().reverse().join(','));
  const checks=[{field:'depth',expected:depth,actual:Buffer.from(actual.buffer),float:true},...allocations.map((a,i)=>({field:stages[i],expected:a.data,actual:Buffer.from(observed[i]?.memory??new Uint8Array()),float:i===0||i===2}))];
  for(let i=0;i<allocations.length;i++){compared+=2;if(allocations[i].freed!==1||allocations[i].bytes!==observed[i]?.bytes)missed++;}
  for(const check of checks) {
    compared++;if(check.expected.length!==check.actual.length){missed++;continue;}
    const step=check.float?4:check.field==='clippedIndices'?2:4;
    for(let i=0;i<check.expected.length;i+=step){const native=step===4?check.expected.readUInt32LE(i):check.expected.readUInt16LE(i),value=step===4?check.actual.readUInt32LE(i):check.actual.readUInt16LE(i);
      // Transformed W is original scalar scratch; the xyz API intentionally
      // leaves W untouched. Compare all other allocations and every depth word.
      if(check.field==='transformed'&&i%16===12)continue;
      compared++;
      if(native!==value&&!(check.float&&Number.isNaN(fromBits(native))&&Number.isNaN(fromBits(value)))){missed++;if(failures.length<20)failures.push({name:c.name,field:check.field,index:i/step,expected:native,actual:value});}
    }
  }
  failed+=missed;rows.push({name:c.name,vertices:c.vertices.length/16,indices:c.indices.length,selectedCapacity:Math.floor(c.indices.length/48),selectedCount:result.selectedCount,clippedVertices:result.clipped.vertexCount,clippedIndices:result.clipped.indexCount,failed:missed,passed:missed===0});
  const snapshot={name:c.name,width:c.width,height:c.height,verticesHex:c.vertices.toString('hex'),indices:Array.from(c.indices),matrix:c.matrix,initialDepthHex:Buffer.from(c.depth.buffer).toString('hex'),expectedDepthHex:depth.toString('hex'),allocations:allocations.map(a=>({bytes:a.bytes,freed:a.freed,hex:a.data.toString('hex')}))};
  if(c.save)saved.push(snapshot);if(missed&&failedInputs.length<8)failedInputs.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread submission output');
const scope='Original complete numeric geometry submission 0x100720250, original matrix multiply 0x100076df0, transform 0x10071e7f0, both triangle depth calls 0x10071ee60 and clipping 0x10071f790 execute continuously. Only external scratch getter/allocation/free are callbacks with explicit 0xef initial snapshots; debug diagnostic flag disabled and stack cookie supplied. Depth including guard, allocation sizes, selected list, clipping buffer slots and release counts compared; transformed scratch W and arithmetic NaN payloads excluded. All 33 maps use every occluder vertex/index with explicit synthetic orthographic projection. Original camera/resource/loading, real heap lifetime, diagnostic rendering, full Visibility Update/Resize, mip queries, hardware/GPU/game runtime remain unverified. QEMU reciprocal/MIN capabilities are explicit.';
const mapCases=cases.filter(c=>c.name.startsWith('map-'));
const report={passed:failed===0,executableSha256:hash,function:'0x100720250',scope,cases:cases.length,corpusMaps:mapCases.length,corpusVertices:mapCases.reduce((n,c)=>n+c.vertices.length/16,0),corpusIndices:mapCases.reduce((n,c)=>n+c.indices.length,0),compared,failed,failures,rows};
fs.writeFileSync('docs/visibility-submit-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/visibility-submit-native.json',JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n');
else fs.writeFileSync(`docs/visibility-submit-failure-${Date.now()}.json`,JSON.stringify({...report,failedInputs},null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
