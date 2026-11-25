import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { cloudCardIndexLayout } from '../src/core/cloud-card-indices';
import { cloudCardDrawPlan } from '../src/core/cloud-card-draw';
import type { CloudCardSphere } from '../src/core/cloud-card-layout';
import type { CloudCardIndexRange } from '../src/core/cloud-card-indices';

const executable=process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('需要原 Sky executable');
const reportPath='docs/cloud-card-draw-oracle.json';fs.writeFileSync(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
type Case={name:string;spheres:CloudCardSphere[];ranges:CloudCardIndexRange[];visibleOrder:number[];eye:number[];sort:boolean};
const cases:Case[]=[],fixtures=JSON.parse(fs.readFileSync('tests/fixtures/cloud-card-index-native.json','utf8'));
function variants(name:string,spheres:CloudCardSphere[],ranges:CloudCardIndexRange[]) {
  const order=ranges.map(r=>r.sourceIndex);
  for(const sort of [false,true])for(const eye of [[0,0,0],[.125,-.25,1.5],spheres[0]?.slice(0,3)??[0,0,0]]) {
    for(const [i,visibleOrder] of [[],order,[...order].reverse(),order.filter((_,i)=>i%2===0)].entries())cases.push({name:`${name}-${sort}-${eye.join(',')}-${i}`,spheres,ranges,eye,sort,visibleOrder});
  }
}
for(const c of fixtures.cases) {
  const sources=c.cards.map((card:any)=>({world:card.world,bounds:card.bounds,mesh:{positions:Float32Array.from(card.positions),indices:Uint32Array.from(card.indices),normals:new Float32Array(0),colors:new Float32Array(0),uvs:new Float32Array(0),bakeVertexCount:0}}));
  const layout=cloudCardIndexLayout(sources);variants(c.name,layout.spheres,layout.ranges);
}
// Compose independently captured original visibility with the unchanged draw
// queue. No JS visibility result supplies the oracle's visible pointer order.
const visibilityFixtures=JSON.parse(fs.readFileSync('tests/fixtures/cloud-card-visibility-native.json','utf8'));
const dawn=fixtures.cases.find((c:any)=>c.name==='Dawn');
for(const c of visibilityFixtures.cases.filter((c:any)=>c.name.startsWith('Dawn-'))) {
  for(const sort of [false,true])for(const eye of [[0,0,0],[.125,-.25,1.5]])
    cases.push({name:`visibility-${c.name}-${sort}-${eye.join(',')}`,spheres:c.spheres,ranges:dawn.ranges,visibleOrder:c.visibleOrder,eye,sort});
}
let seed=31814;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32);
for(const n of [30,31,256,512]) {
  const spheres=Array.from({length:n},()=>[Math.fround(random()*200-100),Math.fround(random()*200-100),Math.fround(random()*200-100),Math.fround(random()*100)] as CloudCardSphere);
  const ranges=Array.from({length:n},(_,i)=>({sourceIndex:i,group:0,vertexOffset:i*3,indexOffset:i*6,vertexCount:3,indexCount:6}));
  variants(`random-${n}`,spheres,ranges);
}
const chunks:Buffer[]=[];
const u32=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v);chunks.push(b);};
const floats=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));chunks.push(b);};
u32(cases.length);
for(const c of cases) {
  u32(c.visibleOrder.length);u32(Number(c.sort));floats(c.eye);const bySource=new Map(c.ranges.map(r=>[r.sourceIndex,r]));
  for(const sourceIndex of c.visibleOrder) {const range=bySource.get(sourceIndex)!;floats(c.spheres[sourceIndex]);u32(range.indexOffset);u32(range.indexCount);}
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-draw-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle');const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-cloud-card-draw-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),maxBuffer:32*1024*1024,timeout:60000});
  if(run.status!==0)throw new Error(`原 draw 队列失败 (${run.status}): ${run.stderr}`);raw=run.stdout;
} finally {fs.rmSync(temp,{recursive:true,force:true});}
let at=0;const read32=()=>{const value=raw.readUInt32LE(at);at+=4;return value;};if(read32()!==cases.length)throw new Error('原 case 数量错误');
const rows=[],saved=[];
for(const c of cases) {
  const n=read32();if(n!==c.visibleOrder.length)throw new Error('原 draw 数量错误');
  const submitted=Array.from({length:n},()=>({indexOffset:read32(),indexCount:read32()}));
  const native=Array.from({length:n},()=>{const distanceSquared=raw.readFloatLE(at);at+=4;return{distanceSquared,indexOffset:read32(),indexCount:read32()};});
  const actual=cloudCardDrawPlan(c.spheres,c.ranges,c.visibleOrder,c.eye,c.sort);let failed=0;
  native.forEach((draw,i)=>{
    const expected=Buffer.alloc(4);expected.writeFloatLE(draw.distanceSquared);const observed=Buffer.alloc(4);observed.writeFloatLE(actual[i].distanceSquared);
    failed+=Number(!expected.equals(observed))+Number(draw.indexOffset!==actual[i].indexOffset)+Number(draw.indexCount!==actual[i].indexCount);
    failed+=Number(submitted[i].indexOffset!==draw.indexOffset)+Number(submitted[i].indexCount!==draw.indexCount);
  });
  rows.push({name:c.name,draws:n,sort:c.sort,failedComponents:failed,passed:failed===0});
  if(c.name.startsWith('Dawn-true-0,0,0-')||c.name.startsWith('visibility-')||c.name==='random-512-true-0,0,0-2'||c.name==='random-30-false-0,0,0-1')saved.push({...c,draws:native});
}
if(at!==raw.length)throw new Error('原 draw 输出有未读取字节');
const report={passed:rows.every(r=>r.passed),complete:true,executableSha256:digest,
  scope:'Execute original queue preparation at 0x100221270, optional unchanged distance sort and GPU range submission through 0x100221339. Explicit original frame/register storage, post-visibility pointer order, mesh index ranges and eye getter callback; GPU draw captures first/count. Jump to original epilogue before resource cleanup. Radius is excluded from center distance. Original visibility, frustum, dynamic vertex generation and complete renderer are outside this check.',
  entry:'0x100221270',stop:'0x100221339',epilogue:'0x1002213bc',sortFlag:'0x100c96180',distanceDirection:'float32 ascending',
  nativeOracleSourceSha256:crypto.createHash('sha256').update(fs.readFileSync('tools/native-cloud-card-draw-oracle.c')).digest('hex'),
  cases:rows.length,draws:rows.reduce((n,r)=>n+r.draws,0),comparedComponents:rows.reduce((n,r)=>n+r.draws*5,0),rows};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-card-draw-native.json',JSON.stringify({executableSha256:digest,cases:saved})+'\n');
console.log(JSON.stringify({passed:report.passed,cases:report.cases,draws:report.draws,comparedComponents:report.comparedComponents}));if(!report.passed)process.exitCode=1;
