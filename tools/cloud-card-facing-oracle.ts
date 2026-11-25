import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { ObjectsDocument } from '../src/core/objects';
import { cloudCardInverse } from '../src/core/cloud-card-inverse';
import { cloudCardFacingPlan } from '../src/core/cloud-card-facing';

const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const executable=process.argv[2]??path.resolve(data,'../MacOS/Sky');
const digest=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('需要原 Sky executable');
const reportPath='docs/cloud-card-facing-oracle.json';fs.writeFileSync(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
type Case={name:string;worlds:number[][];visibleOrder:number[];eye:number[]};
const cases:Case[]=[],identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
let seed=31817;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32);
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const doc=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));
  const worlds=doc.nodes.filter(n=>n.className==='CloudCard').map(n=>n.fields.find(f=>f.name==='transform')!.value as number[]);
  for(const eye of [[0,0,0],[.125,-.25,1.5],worlds[0]?.slice(12,15)??[0,0,0]])for(const order of [worlds.map((_,i)=>i),worlds.map((_,i)=>i).reverse(),worlds.map((_,i)=>i).filter(i=>i%2===0)])
    cases.push({name:`${level}-${eye.join(',')}-${order.length}-${order[0]??'empty'}`,worlds,visibleOrder:order,eye});
}
for(const y of [0,-0,1,-1,Math.fround(1e-5),Math.fround(1e-5-2**-40),Math.fround(1e-5+2**-40),-Math.fround(1e-5),1e-20,-1e-20])
  cases.push({name:`direction-threshold-${cases.length}`,worlds:[identity],visibleOrder:[0],eye:[0,y,0]});
for(const n of [1,2,3,4,6,7,30,31,256,512])for(let mode=0;mode<8;mode++) {
  const worlds=Array.from({length:n},()=>{
    const scale=[.125,.5,1,2,8][Math.floor(random()*5)];
    const matrix=identity.map((v,i)=>i%4===3?v:Math.fround((v+random()*.5-.25)*scale));
    if(mode%2===1)for(const i of [3,7,11,15])matrix[i]=Math.fround(matrix[i]+random()*.125-.0625);
    return matrix;
  });
  const visibleOrder=worlds.map((_,i)=>i);for(let i=n-1;i>0;i--){const j=Math.floor(random()*(i+1));[visibleOrder[i],visibleOrder[j]]=[visibleOrder[j],visibleOrder[i]];}
  cases.push({name:`random-${n}-${mode}`,worlds,visibleOrder,eye:Array.from({length:3},()=>Math.fround(random()*200-100))});
}
const chunks:Buffer[]=[];
function ints(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n,i*4));chunks.push(b);}
function floats(v:number[]){const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));chunks.push(b);}
ints([cases.length]);for(const c of cases){ints([c.worlds.length,c.visibleOrder.length]);floats(c.eye);ints(c.visibleOrder);floats(c.worlds.flat());}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-facing-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle');const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-cloud-card-facing-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),maxBuffer:32*1024*1024,timeout:60000});
  if(run.status!==0)throw new Error(`原矩阵/朝向执行失败 (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0;const u32=()=>{const v=raw.readUInt32LE(at);at+=4;return v;};const readFloats=(n:number)=>Array.from({length:n},()=>{const v=raw.readFloatLE(at);at+=4;return v;});
const hex=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));return b.toString('hex');};
if(u32()!==cases.length)throw new Error('原案例数量不一致');
const rows=[],saved=[];
for(const c of cases) {
  const count=u32();if(count!==c.worlds.length)throw new Error('原矩阵数量不一致');
  const inverses=Array.from({length:count},()=>readFloats(16));const n=u32();if(n!==c.visibleOrder.length)throw new Error('原可见数量不一致');
  const directions=Array.from({length:n},()=>readFloats(4));const actualInverse=c.worlds.map(cloudCardInverse);
  const actualFacing=cloudCardFacingPlan(actualInverse,c.visibleOrder,c.eye);let inverseFailed=0,facingFailed=0;
  inverses.forEach((v,i)=>v.forEach((num,j)=>inverseFailed+=Number(hex([num])!==hex([actualInverse[i][j]]))));
  directions.forEach((v,i)=>v.forEach((num,j)=>facingFailed+=Number(hex([num])!==hex([actualFacing[i].direction[j]]))));
  rows.push({name:c.name,cards:count,visible:n,inverseFailed,facingFailed,passed:inverseFailed+facingFailed===0});
  if(!rows.at(-1)!.passed&&rows.filter(r=>!r.passed).length===1)console.error({case:c.name,inverse:inverses[0],actualInverse:actualInverse[0],direction:directions[0],actualDirection:actualFacing[0]?.direction});
  if(c.name.startsWith('Dawn-')||c.name.startsWith('direction-threshold-')||c.name.startsWith('random-512-'))
    saved.push({...c,worldsHex:hex(c.worlds.flat()),eyeHex:hex(c.eye),inversesHex:hex(inverses.flat()),directionsHex:hex(directions.flat())});
}
if(at!==raw.length)throw new Error('原结果存在未读取字节');
const report={passed:rows.every(r=>r.passed),complete:true,executableSha256:digest,
  scope:'Untouched original Vectormath inverse 0x100076940 plus CloudCard local camera-point transform/length threshold/normalization/Y-hemisphere sign flip at 0x100220bd0..0x100220c73. Explicit real TGCL world matrices, test eyes and post-visibility pointer order; camera getter is a callback, stop before axis-angle rotation/dynamic vertices/GPU. Finite renderable inverses and XYZ directions; the original scratch W lane, including Infinity from division by local Y squared, is preserved. Singular/non-finite inverse outputs are rejected by the editor.',
  levels:33,cases:rows.length,cards:rows.reduce((n,r)=>n+r.cards,0),visibleCards:rows.reduce((n,r)=>n+r.visible,0),
  comparedComponents:rows.reduce((n,r)=>n+r.cards*16+r.visible*4,0),failedComponents:rows.reduce((n,r)=>n+r.inverseFailed+r.facingFailed,0),rows};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-card-facing-native.json',JSON.stringify({scope:report.scope,executableSha256:digest,cases:saved})+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
