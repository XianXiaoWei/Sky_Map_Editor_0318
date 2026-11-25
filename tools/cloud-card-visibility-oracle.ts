import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { cloudCardVisibilityPlan } from '../src/core/cloud-card-visibility';
import type { CloudCardSphere } from '../src/core/cloud-card-layout';
import { ObjectsDocument } from '../src/core/objects';
import { readResourceMesh } from '../src/core/resources';
import { cloudCardLevelLayout } from '../src/core/cloud-card-level';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (digest !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('需要原 Sky executable');
const reportPath = 'docs/cloud-card-visibility-oracle.json';
fs.writeFileSync(reportPath, JSON.stringify({ passed: false, complete: false }) + '\n');
type Case = { name: string; spheres: CloudCardSphere[]; renderOrder: number[]; viewProjection: number[]; visibilityStatuses: number[]; enabled: boolean };
const cases: Case[] = [], identity = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
let seed = 0x31815;
const random = () => ((seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0) / 2**32);
const shuffle = (n: number) => { const order = Array.from({ length: n }, (_, i) => i); for (let i=n-1;i>0;i--) { const j=Math.floor(random()*(i+1)); [order[i],order[j]]=[order[j],order[i]]; } return order; };
function add(name: string, spheres: CloudCardSphere[], renderOrder: number[], viewProjection: number[], visibilityStatuses: number[], enabled = true) {
  cases.push({ name, spheres, renderOrder, viewProjection, visibilityStatuses, enabled });
}
const indexFixture = JSON.parse(fs.readFileSync('tests/fixtures/cloud-card-index-native.json', 'utf8'));
function variants(name: string, spheres: CloudCardSphere[], order: number[]) {
  const center = spheres.length ? spheres.reduce((sum, s) => sum.map((v,i)=>v+s[i]), [0,0,0]).map(v=>v/spheres.length) : [0,0,0];
  const broad = [1/128,0,0,0,0,1/128,0,0,0,0,1/128,0,...center.map(v=>-v/128),1];
  for (const [m, matrix] of [identity,broad].entries()) for (let mode=0;mode<4;mode++) {
    const statuses = spheres.map((_, i) => mode===0?0xffffffff:mode===1?0:mode===2?(i%3===0?0:1):(i%4===0?0:(i%2===0?0x80000000:123)));
    add(`${name}-${m}-${mode}`, spheres, order, matrix, statuses);
  }
}
for (const c of indexFixture.cases) {
  const spheres: CloudCardSphere[] = c.cards.map((card: any) => { const bytes = Buffer.from(card.sphereHex, 'hex'); return [0,4,8,12].map(at => bytes.readFloatLE(at)); });
  variants(c.name, spheres, c.ranges.map((r: any) => r.sourceIndex));
}
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const levels = fs.readdirSync(path.join(data,'Levels')).sort(), cache = new Map<string,ReturnType<typeof readResourceMesh>>();
for (const level of levels) {
  if (indexFixture.cases.some((c:any)=>c.name===level)) continue;
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));
  const layout = cloudCardLevelLayout(doc.nodes, name => {
    if(!cache.has(name))cache.set(name,readResourceMesh(fs.readFileSync(path.join(data,'Meshes/Bin',name+'.mesh'))));
    return cache.get(name)!;
  });
  variants(level, layout.cards.map(c=>c.sphere), Array.from(layout.renderOrder));
}
// Test both sides of every exact tangent and radius-zero boundary.
for (const radius of [0,.5,1,4]) {
  const spheres: CloudCardSphere[] = [];
  for (let axis=0;axis<3;axis++) for (const sign of [-1,1]) for (const delta of [-(2**-20),0,2**-20]) {
    const sphere: CloudCardSphere = [0,0,0,radius]; sphere[axis]=Math.fround(sign*(1+radius+delta)); spheres.push(sphere);
  }
  add(`tangent-${radius}`,spheres,shuffle(spheres.length),identity,spheres.map(()=>0xffffffff));
}
for (const n of [0,1,2,3,4,6,7,30,31,32,63,64,127,128,255,256,511,512]) for (let mode=0;mode<12;mode++) {
  const spheres = Array.from({length:n},()=>[Math.fround(random()*32-16),Math.fround(random()*32-16),Math.fround(random()*32-16),Math.fround(random()*12)] as CloudCardSphere);
  const matrices = [identity,new Array(16).fill(0),[0,0,0,0,0,0,0,0,0,0,0,0,1,-2,3,4],
    [1.5,0,0,0,0,2,0,0,0,0,-1.02,-1,0,0,-.202,0],
    [1e-20,0,0,0,0,1e-20,0,0,0,0,1e-20,0,0,0,0,1e-20],
    Array.from({length:16},()=>Math.fround(random()*8-4))];
  const statuses = spheres.map((_,i)=>[0,1,123,0x80000000,0xffffffff][mode<6?i%5:Math.floor(random()*5)]);
  add(`random-${n}-${mode}`,spheres,shuffle(n),matrices[mode%6],statuses,mode!==11);
}
// Exhaust every remove/keep mask: catches consecutive removals and tail moves.
for (let mask=0;mask<256;mask++) {
  const spheres = Array.from({length:8},(_,i)=>[i,0,0,0] as CloudCardSphere);
  add(`compact-mask-${mask}`,spheres,shuffle(8),new Array(16).fill(0),spheres.map((_,i)=>mask&(1<<i)?0xffffffff:0));
}
// Identical six planes isolate float32 cancellation at the sphere boundary.
for (let c=0;c<256;c++) {
  const normal=Array.from({length:3},()=>Math.fround(random()*8-4));
  const point=Array.from({length:3},()=>Math.fround(random()*2**18-2**17));
  const distance=Math.fround(-(point[0]*normal[0]+point[1]*normal[1]+point[2]*normal[2]));
  const matrix=[0,0,0,normal[0],0,0,0,normal[1],0,0,0,normal[2],0,0,0,distance];
  const spheres=Array.from({length:8},(_,i)=>[point[0]+(i-4)*2**-8,point[1],point[2],i%2?2**-8:0].map(Math.fround) as CloudCardSphere);
  add(`dot-cancellation-${c}`,spheres,shuffle(8),matrix,spheres.map((_,i)=>i%3?0xffffffff:0));
}
const chunks: Buffer[] = [];
const u32 = (values: number[]) => { const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v,i*4));chunks.push(b); };
const float = (values: number[]) => { const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeFloatLE(v,i*4));chunks.push(b); };
u32([cases.length]);
for (const c of cases) { u32([c.spheres.length,Number(c.enabled)]);float(c.viewProjection);u32(c.renderOrder);u32(c.visibilityStatuses);float(c.spheres.flat()); }
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-visibility-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle');
  const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-cloud-card-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),maxBuffer:32*1024*1024,timeout:60000});
  if(run.status!==0)throw new Error(`原可见性执行失败 (${run.status}): ${run.stderr}`);raw=run.stdout;
} finally { fs.rmSync(temp,{recursive:true,force:true}); }
let at=0;const read32=()=>{const v=raw.readUInt32LE(at);at+=4;return v;};
const ints=(n:number)=>Array.from({length:n},read32);
const floats=(n:number)=>Array.from({length:n},()=>{const v=raw.readFloatLE(at);at+=4;return v;});
const hex=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));return b.toString('hex');};
if(read32()!==cases.length)throw new Error('原 case 数量错误');
const rows: {name:string;cards:number;candidates:number;visible:number;comparedComponents:number;failedComponents:number;passed:boolean}[]=[],saved=[];
for(const c of cases) {
  const reset=read32(),planeCount=read32(),planes=Array.from({length:planeCount},()=>floats(4));
  const classifierCalls=read32(),n=read32(),candidateOrder=ints(n),initialStatuses=ints(n),candidateSpheres=Array.from({length:n},()=>floats(4));
  const count=read32(),visibleOrder=ints(count),visibleStatuses=ints(count),visibleSpheres=Array.from({length:count},()=>floats(4));
  const actual=cloudCardVisibilityPlan(c.spheres,c.renderOrder,c.viewProjection,c.visibilityStatuses,c.enabled);
  let failed=0,compared=0;
  const check=(ok:boolean)=>{compared++;failed+=Number(!ok);};
  const compareInts=(expected:number[],observed:number[])=>{check(expected.length===observed.length);expected.forEach((v,i)=>check(v===observed[i]));};
  const compareFloats=(expected:number[][],observed:number[][])=>{check(expected.length===observed.length);expected.forEach((v,i)=>v.forEach((num,j)=>check(hex([num])===hex([observed[i]?.[j]??NaN]))));};
  check(reset===0);check(classifierCalls===Number(c.enabled&&c.spheres.length>0));
  compareFloats(planes,actual.planes);compareInts(candidateOrder,actual.candidateOrder);
  compareInts(initialStatuses,new Array(actual.candidateOrder.length).fill(0xffffffff));
  compareFloats(candidateSpheres,actual.candidateOrder.map(i=>c.spheres[i]));
  compareInts(visibleOrder,actual.visibleOrder);compareInts(visibleStatuses,actual.visibleStatuses);compareFloats(visibleSpheres,actual.visibleSpheres);
  rows.push({name:c.name,cards:c.spheres.length,candidates:n,visible:count,comparedComponents:compared,failedComponents:failed,passed:failed===0});
  if(failed && rows.filter(r=>!r.passed).length===1) console.error({firstMismatch:c.name,planes,actualPlanes:actual.planes,candidateOrder,actualCandidateOrder:actual.candidateOrder,visibleOrder,actualVisibleOrder:actual.visibleOrder});
  if(c.name.startsWith('Dawn-')||c.name.startsWith('tangent-')||c.name.startsWith('random-512-')||c.name.startsWith('compact-mask-')||/^dot-cancellation-([0-9]|1[0-5])$/.test(c.name))
    saved.push({...c,planesHex:hex(planes.flat()),candidateOrder,initialStatuses,candidateSpheresHex:hex(candidateSpheres.flat()),visibleOrder,visibleStatuses,visibleSpheresHex:hex(visibleSpheres.flat())});
}
if(at!==raw.length)throw new Error('原可见性输出有未读取字节');
const report={passed:rows.every(r=>r.passed),complete:true,executableSha256:digest,
  scope:'Execute original CloudCardBarn 0x1002206f0 prologue, six normalized frustum planes, sphere tests and 0x100220b10 unstable compaction. Original enable/count early returns and candidate status initialization are included. Scratch allocation/free and external Visibility::sphere classification are callbacks returning explicit source-indexed uint32 statuses. Jump at 0x100220b62 to original epilogue; dynamic vertices, real occlusion classification/buffers and GPU/game execution are excluded.',
  levels:levels.length,cases:rows.length,cards:rows.reduce((n,r)=>n+r.cards,0),candidates:rows.reduce((n,r)=>n+r.candidates,0),visibleCards:rows.reduce((n,r)=>n+r.visible,0),
  comparedComponents:rows.reduce((n,r)=>n+r.comparedComponents,0),failedComponents:rows.reduce((n,r)=>n+r.failedComponents,0),rows};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-card-visibility-native.json',JSON.stringify({scope:report.scope,executableSha256:digest,cases:saved})+'\n');
console.log(JSON.stringify({...report,rows:undefined}));
if(!report.passed) {console.error(rows.filter(r=>!r.passed).slice(0,8));process.exitCode=1;}
