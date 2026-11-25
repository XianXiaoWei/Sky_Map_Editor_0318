import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { ObjectsDocument } from '../src/core/objects';
import { readResourceMesh } from '../src/core/resources';
import { cloudCardSphere, cloudCardOverlapGroups, type CloudCardSource } from '../src/core/cloud-card-layout';
import { cloudCardIndexLayout } from '../src/core/cloud-card-indices';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const executable = process.argv.slice(2).find(arg => !arg.startsWith('--')) ?? path.resolve(data, '../MacOS/Sky');
const digest = crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if (digest !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('需要原 Sky executable');
const sortedMode=process.argv.includes('--sorted');
const reportPath=sortedMode?'docs/cloud-card-index-oracle.json':'docs/cloud-card-layout-oracle.json';
fs.writeFileSync(reportPath, JSON.stringify({ passed: false, complete: false }) + '\n');
const identity = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
type Case = { name: string; cards: CloudCardSource[] };
const mesh = (positions: number[]) => ({ positions: Float32Array.from(positions), normals: new Float32Array(0), uvs: new Float32Array(0), colors: new Float32Array(0), indices: new Uint32Array(positions.length>=9?[2,0,1,1,0,2]:[]), bakeVertexCount: 0 });
const ball = (x: number, radius = 1): CloudCardSource => ({ mesh: mesh([-radius,0,0,radius,0,0]), bounds: [-radius,0,0,radius,0,0], world: identity.map((v,i) => i===12?x:v) });
const cases: Case[] = [
  { name: 'empty', cards: [] },
  { name: 'touching-separated', cards: [ball(0),ball(2)] },
  { name: 'just-overlapping', cards: [ball(0),ball(Math.fround(2-2**-23))] },
  { name: 'transitive-chain-and-isolated', cards: [ball(0),ball(1.5),ball(3),ball(8)] },
  { name: 'coincident-zero-radii', cards: [ball(0,0),ball(0,0),ball(0,1)] },
  { name: 'stored-center-not-vertex-mean', cards: [{ mesh: mesh([0,1,2,3,-2,1]), bounds: [-10,-3,-1,2,8,4], world: identity }] },
  { name: 'zero-matrix-empty-vertices', cards: [{ mesh: mesh([]), bounds: [1,2,3,4,5,6], world: Array(16).fill(0) }] },
];
let seed = 31814;
const random = () => ((seed = (Math.imul(seed,1664525)+1013904223)>>>0)/2**32);
for (let c=0;c<32;c++) cases.push({ name: `random-${c}`, cards: Array.from({length: 1+c%23}, () => ({
  mesh: mesh(Array.from({length: (1+c%9)*3},()=>Math.fround(random()*10-5))),
  bounds: Array.from({length:6},()=>Math.fround(random()*8-4)),
  world: identity.map((v,i)=>i%4===3?v:Math.fround(random()*12-6)),
})) });
const cache = new Map<string, ReturnType<typeof readResourceMesh>>();
for (const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));
  cases.push({ name: level, cards: doc.nodes.filter(n=>n.className==='CloudCard').map(n=>{
    const name=n.fields.find(f=>f.name==='meshName')!.value as string;
    if(!cache.has(name))cache.set(name,readResourceMesh(fs.readFileSync(path.join(data,'Meshes/Bin',name+'.mesh'))));
    const lod=cache.get(name)!.levels[0];
    return { mesh: lod, bounds: lod.bounds!, world: n.fields.find(f=>f.name==='transform')!.value as number[] };
  }) });
}
const chunks: Buffer[] = [];
const u32 = (v:number) => { const b=Buffer.alloc(4); b.writeUInt32LE(v); chunks.push(b); };
const floats = (v:ArrayLike<number>) => { const b=Buffer.alloc(v.length*4);for(let i=0;i<v.length;i++)b.writeFloatLE(v[i],i*4);chunks.push(b); };
u32(cases.length);
for(const c of cases) {
  u32(c.cards.length);
  for(const card of c.cards) {
    floats(card.world);floats(card.bounds);u32(card.mesh.positions.length/3);u32(card.mesh.indices.length);
    for(let i=0;i<card.mesh.positions.length;i+=3)floats([...card.mesh.positions.subarray(i,i+3),0]);
    for(const index of card.mesh.indices)u32(index);
  }
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-layout-'));
let raw: Buffer;
try {
  const runner=path.join(temp,'oracle');
  const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-cloud-card-layout-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable,...(sortedMode?['--sorted']:[])],{input:Buffer.concat(chunks),maxBuffer:64*1024*1024,timeout:60000});
  if(run.status!==0)throw new Error(`Native CloudCard load failed (${run.status}): ${run.stderr}`);
  raw=run.stdout;
} finally { fs.rmSync(temp,{recursive:true,force:true}); }
let at=0;const read32=()=>{const v=raw.readUInt32LE(at);at+=4;return v;};
if(read32()!==cases.length)throw new Error('原输出 case 数量错误');
const rows=[],fixtures=[];
for(const c of cases) {
  if(read32()!==c.cards.length)throw new Error('原输出 CloudCard 数量错误');
  const actual=c.cards.map(cloudCardSphere), groups=cloudCardOverlapGroups(actual);
  let failed=0;
  const native=c.cards.map((_,i)=>{
    const bytes=raw.subarray(at,at+16);at+=16;const group=read32();
    const expected=Buffer.alloc(16);actual[i].forEach((v,j)=>expected.writeFloatLE(v,j*4));
    for(let j=0;j<4;j++)failed+=Number(bytes.readUInt32LE(j*4)!==expected.readUInt32LE(j*4));
    failed+=Number(group!==groups.groups[i]);return {sphereHex:bytes.toString('hex'),group};
  });
  let ranges: ReturnType<typeof cloudCardIndexLayout>['ranges']|undefined,indices:number[]|undefined;
  if(sortedMode) {
    const layout=cloudCardIndexLayout(c.cards);
    ranges=c.cards.map(()=>({sourceIndex:read32(),group:read32(),vertexOffset:read32(),indexOffset:read32(),vertexCount:read32(),indexCount:read32()}));
    ranges.forEach((range,i)=>{for(const key of Object.keys(range) as (keyof typeof range)[])failed+=Number(range[key]!==layout.ranges[i][key]);});
    const n=read32();indices=Array.from({length:n},()=>read32());
    failed+=Number(n!==layout.indices.length);indices.forEach((value,i)=>failed+=Number(value!==layout.indices[i]));
  }
  rows.push({ name:c.name,cards:c.cards.length,groups:groups.groupCount,indexComponents:indices?.length??0,failedComponents:failed,passed:failed===0 });
  if(fixtures.length<7 || ['Dawn','CarryLand'].includes(c.name))fixtures.push({name:c.name,cards:c.cards.map((v,i)=>({positions:Array.from(v.mesh.positions),bounds:v.bounds,world:v.world,indices:Array.from(v.mesh.indices),...native[i]})),...(sortedMode?{ranges,indices}:{})});
}
if(at!==raw.length)throw new Error('原输出有未读取数据');
const report={passed:rows.every(r=>r.passed),complete:true,executableSha256:digest,
  scope:'Original CloudCardBarn full load instruction stream executes bounds center, vertex radius, world scale, sphere overlap and recursive component IDs. Explicit initialized card/mesh storage and resource observation/GPU callbacks. '+(sortedMode?'The sort entry is restored unchanged after capturing pre-sort spheres; original group sort, cumulative vertex/index offsets and complete uint32 index expansion execute. ':'Sort intercepted to capture original pre-sort results. ' )+'TGCL source order supplied explicitly. Native registration schedule, visibility, vertex expansion and Metal/game images are outside this check.',
  functions:{load:'0x10021fb40',sphere:'0x10021fd80',overlap:'0x100220090',flood:'0x10021fa30',allocate:'0x1002216b0'},nativeCapacity:512,
  nativeOracleSourceSha256:crypto.createHash('sha256').update(fs.readFileSync('tools/native-cloud-card-layout-oracle.c')).digest('hex'),
  cases:rows.length,cards:rows.reduce((n,r)=>n+r.cards,0),comparedComponents:rows.reduce((n,r)=>n+r.cards*(sortedMode?11:5)+r.indexComponents,0),indexComponents:rows.reduce((n,r)=>n+r.indexComponents,0),rows};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync(sortedMode?'tests/fixtures/cloud-card-index-native.json':'tests/fixtures/cloud-card-layout-native.json',JSON.stringify({executableSha256:digest,cases:fixtures})+'\n');
console.log(JSON.stringify({passed:report.passed,cases:report.cases,cards:report.cards,comparedComponents:report.comparedComponents}));
if(!report.passed)process.exitCode=1;
