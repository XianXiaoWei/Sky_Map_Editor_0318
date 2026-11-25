import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {terrainObbInFrustum,terrainFrustumRte,terrainFrustumRtz} from '../src/core/terrain-visibility';
import {cloudCardFrustumPlanes,type CloudCardPlane} from '../src/core/cloud-card-visibility';
import {MeshesDocument} from '../src/core/meshes';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
const cubePlanes:CloudCardPlane[]=[[1,0,0,1],[-1,0,0,1],[0,0,1,1],[0,1,0,1],[0,-1,0,1],[0,0,-1,1]];
interface Case {name:string;planes:CloudCardPlane[];matrix:number[];csr:number;save:boolean;}
const cases:Case[]=[];
const add=(name:string,planes:CloudCardPlane[],matrix:number[],save=true)=>{for(const csr of [0x1f80,0xffc0])cases.push({name:name+(csr===0x1f80?'-rte':'-rtz'),planes:planes.map(p=>p.map(Math.fround) as CloudCardPlane),matrix:matrix.map(Math.fround),csr,save});};
const obb=(center:number[],size:number[],angle=0)=>[Math.cos(angle)*size[0],Math.sin(angle)*size[0],0,0,-Math.sin(angle)*size[1],Math.cos(angle)*size[1],0,0,0,0,size[2],0,...center,1];
for(const x of [-2.0000002,-2,-1.9999999,-1,0,1,1.9999999,2,2.0000002])for(const size of [[1,1,1],[0,1,1],[1,0,1],[1,1,0],[2**-126,2**-126,2**-126]])add(`boundary-${x}-${size}`,cubePlanes,obb([x,0,0],size));
let seed=0x318a2630;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
for(let i=0;i<1400;i++) {
  const planes=i%3?cubePlanes:Array.from({length:6},()=>Array.from({length:4},()=>Math.fround((random()-.5)*4)) as CloudCardPlane);
  const matrix=i%2?obb(Array.from({length:3},()=>((random()-.5)*8)),Array.from({length:3},()=>random()*2),random()*Math.PI):Array.from({length:16},()=>Math.fround((random()-.5)*8));
  add(`random-${i}`,planes,matrix,i<64);
}
const data=path.resolve(executable,'../../Data');let maps=0,records=0;
const projection=[1.73,0,0,0,0,2.3,0,0,0,0,-1.002,-1,0,0,-.2002,0];
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file)),terrain=doc.geometries.filter(g=>g.kind==='terrain');if(terrain.length)maps++;
  for(const g of terrain) {
    const b=g.bounds!,center=[0,1,2].map(i=>(b[i]+b[i+3])/2),size=[0,1,2].map(i=>(b[i+3]-b[i])/2);
    // Explicit OBB snapshots derived from serialized bounds. Actual object
    // loader transforms/enabled flags and native bin production are separate.
    add(`map-${level}-${g.id}`,cloudCardFrustumPlanes(projection),obb(center,size),false);records++;
  }
}
const chunks:Buffer[]=[];const uint=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v);chunks.push(b);};uint(cases.length);
for(const c of cases){uint(c.csr);chunks.push(Buffer.from(Float32Array.from(c.planes.flat()).buffer),Buffer.from(Float32Array.from(c.matrix).buffer));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-terrain-frustum-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-terrain-frustum-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:8*1024*1024});
  if(run.status!==0)throw new Error(run.stderr.toString());raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length||raw.length!==4+cases.length*12)throw new Error('Terrain frustum native output length');
const saved:unknown[]=[],failures:unknown[]=[];let failed=0;
for(const [i,c] of cases.entries()) {
  const expected=raw.readUInt32LE(4+i*12),before=raw.readUInt32LE(8+i*12),after=raw.readUInt32LE(12+i*12),actual=Number(terrainObbInFrustum(c.planes,c.matrix,c.csr===0x1f80?terrainFrustumRte:terrainFrustumRtz));
  const passed=actual===expected&&(before&0xffc0)===(after&0xffc0);if(!passed){failed++;if(failures.length<20)failures.push({...c,expected,actual,before,after});}
  if(c.save)saved.push({...c,expected});
}
const scope='Complete unmodified original 0x10015e420 oriented-box/six-plane test, with explicit RTE or RTZ/FTZ/DAZ ambient MXCSR. Half-axis normalization, ordered radius/center dot products, strict tangent rejection, degenerate axes and unordered comparisons checked. 77 serialized terrain bounds across 31 maps supply explicit OBB snapshots. Original TerrainBarn plane production, enabled object transforms, distance sorting, per-bin AABB/LOD/job dispatch, loaders and viewport culling remain unverified.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,compared:cases.length*2,failed,failures,corpusMaps:maps,corpusRecords:records};
fs.writeFileSync('docs/terrain-frustum-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/terrain-frustum-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/terrain-frustum-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
