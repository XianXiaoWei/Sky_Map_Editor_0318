import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {MeshesDocument} from '../src/core/meshes';
import {visibilityFloatBits as bits, visibilityFloatFromBits as fromBits, visibilityAdd, visibilitySub, visibilityMul, visibilityDiv, visibilitySqrt, qemuVisibilityMax} from '../src/core/visibility-float';
import {transformVisibilityVertices, qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {visibilityMipLayout, reduceVisibilityDepthMips} from '../src/core/visibility-depth';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (hash !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires supplied original executable');
const data = path.resolve(executable, '../../Data');
let seed = 0x318face;
function random() { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; return seed; }
const finiteBits = () => {let v = random();if ((v & 0x7f800000) === 0x7f800000) v ^= 0x00800000;return v>>>0;};
const edges = [0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,0x3f800000,0xbf800000,0x40400000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000];
const pairs = edges.flatMap(a => edges.map(b => [a,b]));
for(let i=0;i<8192;i++)pairs.push([finiteBits(),finiteBits()]);
const identity = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
const matrices = [identity,[0.83,0.1,0.04,0,0.2,0.7,0.1,0,0.1,0.3,0.96,1,2,-3,-0.15,0.125],
  [1.73,0.123,0.011,0.09,-0.375,1.42,0.7,-0.08,0.0625,0.1,0.999,1,-128.03,256.07,-0.2,-14.2],
  [1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,-2],
  [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0],
  [1,0,0,0,0,1e-23,0,0,0,0,1,0,0,0,0,1]].map(m=>m.map(Math.fround));
interface TransformCase {name: string;vertices: Buffer;count: number;matrix: number[];initial: Buffer;save: boolean;}
const transforms: TransformCase[] = [];
function initial(count: number) {const b = Buffer.alloc(count*16);for(let i=0;i<count*4;i++)b.writeFloatLE(-777-i/16,i*4);return b;}
const signed = [-128,-127,-1,0,1,126,127];
function vertices(count: number) {
  const b = Buffer.alloc(count*16);
  for(let i=0;i<count;i++) {
    [Math.fround((random()/2**32-0.5)*4096),Math.fround((random()/2**32-0.5)*4096),Math.fround((i%13-6)*0.5)].forEach((v,j)=>b.writeFloatLE(v,i*16+j*4));
    for(let j=0;j<3;j++)b.writeInt8(signed[(i*3+j)%signed.length],i*16+12+j);b[i*16+15]=random()&255;
  }return b;
}
for(const count of [0,1,2,3,4,5,7,8,9,11,12,15,16,31,32,511,512,513,515,516,1024,1025]) {
  const raw = vertices(count);
  matrices.forEach((matrix,i)=>transforms.push({name:`synthetic-${count}-${i}`,vertices:raw,count,matrix,initial:initial(count),save:count<=32 || count===513&&i===2}));
}
const maps: {level:string;vertices:number}[] = [];
for(const level of fs.readdirSync(path.join(data,'Levels'))) {
  const file = path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc = new MeshesDocument(fs.readFileSync(file));
  const records = doc.geometries.filter(g=>g.kind==='occluder');
  maps.push({level,vertices:records.reduce((n,r)=>n+r.vertexCount,0)});
  for(const record of records) for(const i of [0,1,2]) transforms.push({name:`map-${level}-${record.id}-${i}`,vertices:doc.lod.subarray(record.vertexOffset,record.vertexOffset+record.vertexCount*16),count:record.vertexCount,matrix:matrices[i],initial:initial(record.vertexCount),save:false});
}
const chunks: Buffer[] = [];
const mipCases:{name:string;widths:number[];heights:number[];initial:Buffer;save:boolean}[]=[];
const layoutCases:{viewport:number[];logical:number[]}[]=[];
for(const w of [0,1,2,3,5,7,15,31,65,121,255,480,1920,131073,524287,0x10000001])for(const h of [0,1,2,3,7,13,270,1080,131073]) {
  const viewport=[w*4+0.75,h*4+0.25].map(Math.fround);
  layoutCases.push({viewport,logical:viewport.map(v=>Math.trunc(v)>>>2)});
}
for(const w of [2,4,6,8,10,14,16,18,30,32,34,62])for(const h of [2,4,6,8,10,14,16,18,30,32,34]) {
  const layout=visibilityMipLayout(w*4,h*4);
  const widths=layout.map(m=>m.width),heights=layout.map(m=>m.height);
  const size=layout.reduce((n,m)=>n+m.width*m.height,0),bytes=Buffer.alloc((size+32)*4);
  const special=[...edges,0x7fc00001,0xffc03180,0x7fa03180];
  for(let i=0;i<size+32;i++)bytes.writeUInt32LE(i%11===0?special[i%special.length]:finiteBits(),i*4);
  mipCases.push({name:`mips-${w}-${h}`,widths,heights,initial:bytes,save:w<=10&&h<=10});
}
function uints(values: number[]) {const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));chunks.push(b);}
function floats(values: number[]) {const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeFloatLE(v,i*4));chunks.push(b);}
uints([1+transforms.length+mipCases.length+layoutCases.length]);uints([0,pairs.length]);pairs.forEach(uints);
for(const c of transforms) {uints([1,c.count]);floats(c.matrix);chunks.push(c.vertices,c.initial);}
for(const c of mipCases) {uints([2,c.widths.length]);uints(c.widths);uints(c.heights);chunks.push(c.initial);}
for(const c of layoutCases) {uints([3,2]);uints(c.logical);}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle');
  const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:64*1024*1024});
  if(run.status!==0)throw new Error(`Original visibility failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=4;
if(raw.readUInt32LE(0)!==1+transforms.length+mipCases.length+layoutCases.length)throw new Error('Invalid original group count');
const failures: unknown[] = [], savedMath: {inputBits:number[];outputBits:number[]}[] = [];
let mathFailed=0,mathCompared=0,transformFailed=0,transformCompared=0;
const mathFailuresByOperation = new Array(7).fill(0), mathSamplesByOperation: unknown[][] = Array.from({length:7},()=>[]), transformSamples:unknown[]=[];
for(let i=0;i<pairs.length;i++) {
  const [a,b]=pairs[i].map(fromBits);
  const actual=[visibilityAdd(a,b),visibilitySub(a,b),visibilityMul(a,b),visibilityDiv(a,b),visibilitySqrt(a),qemuVisibilityMax(a,b),qemuVisibilityReciprocal.rcp(a)];
  const outputBits:number[]=[];
  for(let j=0;j<7;j++) {
    const expected=raw.readUInt32LE(at);at+=4;outputBits.push(expected);mathCompared++;
    if(bits(actual[j])!==expected&&!(Number.isNaN(actual[j])&&Number.isNaN(fromBits(expected)))){mathFailed++;mathFailuresByOperation[j]++;const row={type:'math',pair:pairs[i],operation:j,expected,actual:bits(actual[j])};if(failures.length<20)failures.push(row);if(mathSamplesByOperation[j].length<4)mathSamplesByOperation[j].push(row);}
  }
  if(i<pairs.length&&i<256||i%257===0)savedMath.push({inputBits:pairs[i],outputBits});
}
const saved: unknown[] = [], rows=[];
for(const c of transforms) {
  const output=raw.subarray(at,at+c.count*16);at+=c.count*16;
  const actual=new Float32Array(c.count*4);new Uint8Array(actual.buffer).set(c.initial);
  transformVisibilityVertices(c.vertices,c.count,c.matrix,actual,qemuVisibilityReciprocal);
  const expectedXyz:number[]=[],unchangedW:number[]=[];let failed=0;
  for(let i=0;i<c.count;i++)for(let j=0;j<3;j++) {
    const expected=output.readUInt32LE(i*16+j*4);expectedXyz.push(expected);transformCompared++;
    const value=actual[i*4+j];
    if(bits(value)!==expected&&!(Number.isNaN(value)&&Number.isNaN(fromBits(expected)))) {failed++;transformFailed++;const row={type:'transform',name:c.name,index:i,component:j,expected,actual:bits(value)};if(failures.length<20)failures.push(row);if(transformSamples.length<40)transformSamples.push(row);}
  }
  for(let i=0;i<c.count;i++)unchangedW.push(c.initial.readUInt32LE(i*16+12));
  rows.push({name:c.name,vertices:c.count,comparedComponents:c.count*3,failedComponents:failed,passed:failed===0});
  if(c.save)saved.push({name:c.name,count:c.count,verticesHex:c.vertices.toString('hex'),matrix:c.matrix,initialHex:c.initial.toString('hex'),expectedXyzBits:expectedXyz,unchangedW});
}
let mipFailed=0,mipCompared=0;const mipSamples:unknown[]=[],savedMips:unknown[]=[],mipRows=[];
for(const c of mipCases) {
  const expected=raw.subarray(at,at+c.initial.length);at+=c.initial.length;
  const actual=new Float32Array(c.initial.length/4);new Uint8Array(actual.buffer).set(c.initial);
  reduceVisibilityDepthMips(actual,c.widths,c.heights,qemuVisibilityMax);
  const actualBits=new Uint32Array(actual.buffer);let failed=0;
  for(let i=0;i<actualBits.length;i++) {
    const native=expected.readUInt32LE(i*4);mipCompared++;
    if(actualBits[i]!==native){failed++;mipFailed++;if(mipSamples.length<20)mipSamples.push({name:c.name,index:i,expected:native,actual:actualBits[i]});}
  }
  mipRows.push({name:c.name,compared:actualBits.length,failed,passed:failed===0});
  if(c.save)savedMips.push({name:c.name,widths:c.widths,heights:c.heights,initialHex:c.initial.toString('hex'),expectedHex:expected.toString('hex')});
}
const savedLayouts:unknown[]=[],layoutSamples:unknown[]=[];let layoutFailed=0,layoutCompared=0;
for(const c of layoutCases) {
  const count=raw.readUInt32LE(at);at+=4;
  const arrays:number[][]=[];
  for(let j=0;j<4;j++){const a:number[]=[];for(let i=0;i<count;i++){a.push(raw.readUInt32LE(at));at+=4;}arrays.push(a);}
  const actual=visibilityMipLayout(c.viewport[0],c.viewport[1]);
  const observed=[actual.map(m=>m.width),actual.map(m=>m.height),actual.map(m=>bits(m.logicalWidth)),actual.map(m=>bits(m.logicalHeight))];
  layoutCompared++;if(count!==actual.length)layoutFailed++;
  for(let j=0;j<4;j++)for(let i=0;i<count;i++){layoutCompared++;if(arrays[j][i]!==observed[j][i]){layoutFailed++;if(layoutSamples.length<20)layoutSamples.push({viewport:c.viewport,level:i,field:j,expected:arrays[j][i],actual:observed[j][i]});}}
  savedLayouts.push({...c,count,arrays});
}
if(at!==raw.length)throw new Error('Unread original output');
const scope='Full unmodified transform 0x10071e7f0 and mip reducer 0x100720560 executed under QEMU x86_64 -cpu max with original Update MXCSR |= 0xe040. Transform xyz includes counts <4, SIMD/scalar summation, last-four scalar overwrite, raw signed normals and 512 batching; W scratch lane and arithmetic NaN payloads excluded. Mips compare every raw word, padding, signed zeros, operand payload forwarding, neighboring mip alias reads and explicit guard memory. Resize layout loop 0x10071db19..0x10071dbae uses a return trampoline before allocation/GPU lifecycle; viewport-to-logical conversion is not included in that slice. SSE probe covers RTZ/FTZ/DAZ; QEMU RCPPS and MAX raw denormal forwarding are explicit capabilities, actual Intel/Mac hardware remains unverified. No rasterization, classification or GPU/game runtime claimed.';
const report={passed:mathFailed===0&&transformFailed===0&&mipFailed===0&&layoutFailed===0,executableSha256:hash,scope,reciprocalCapability:qemuVisibilityReciprocal.kind,maximumCapability:'qemu-daz-comparison-raw-operand-forwarding',math:{pairs:pairs.length,compared:mathCompared,failed:mathFailed,mathFailuresByOperation,mathSamplesByOperation},transform:{function:'0x10071e7f0',cases:transforms.length,corpusMaps:maps.length,corpusVertices:maps.reduce((n,m)=>n+m.vertices,0),compared:transformCompared,failed:transformFailed,transformSamples},mips:{function:'0x100720560',cases:mipCases.length,compared:mipCompared,failed:mipFailed,mipSamples,rows:mipRows},layout:{slice:'0x10071db19..0x10071dbae',cases:layoutCases.length,compared:layoutCompared,failed:layoutFailed,layoutSamples},failures,rows};
fs.writeFileSync('docs/visibility-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/visibility-native.json',JSON.stringify({executableSha256:hash,scope,math:savedMath,transforms:saved,mips:savedMips,layouts:savedLayouts})+'\n');
else fs.writeFileSync(`docs/visibility-oracle-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));
if(!report.passed)process.exitCode=1;
