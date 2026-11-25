import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {ObjectsDocument} from '../src/core/objects';
import {readResourceMesh,type ResourceMeshLOD} from '../src/core/resources';
import {cloudCardDynamicVertices,cloudCardJsMath,type CloudCardDynamicSource} from '../src/core/cloud-card-dynamic';
import type {CloudCardIndexRange} from '../src/core/cloud-card-indices';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const executable=process.argv.slice(2).find(arg=>!arg.startsWith('--'))??path.resolve(data,'../MacOS/Sky'),digest=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
const reportPath='docs/cloud-card-dynamic-oracle.json';fs.writeFileSync(reportPath,'{"passed":false,"complete":false}\n');
type Case={name:string;sources:CloudCardDynamicSource[];eye:number[];fallback:Uint8Array};const cases:Case[]=[],identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
let seed=318;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32);
const mesh:ResourceMeshLOD={positions:Float32Array.from([-1,0,-1,1,0,-1,0,0,1]),normals:new Float32Array(9),packedNormals:Int8Array.from([0,127,0,0,-128,0,0,0,32,32,96,0]),packedUvs:Uint8Array.from({length:48},(_,i)=>i*17&255),uvs:new Float32Array(24),colors:new Float32Array(12),indices:Uint32Array.from([0,1,2]),bakeVertexCount:0};
for(const eye of [[0,1,0],[1,1,1],[0,-1,0],[1,0,1],[1e-6,1,0]])for(const opacity of [-1,0,.01,.25,.5,1,2])cases.push({name:'boundary-'+cases.length,sources:[{world:identity,mesh,opacity}],eye,fallback:Uint8Array.from([1,2,3,4,5,6,7,8])});
if(!process.argv.includes('--quick')){
 const cache=new Map<string,ResourceMeshLOD>();
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))).nodes;
  const sources=nodes.filter(n=>n.className==='CloudCard').map(n=>{
   const name=n.fields.find(f=>f.name==='meshName')!.value as string;
   if(!cache.has(name))cache.set(name,readResourceMesh(fs.readFileSync(path.join(data,'Meshes/Bin',name+'.mesh'))).levels[0]);
   const opacityField=n.fields.find(f=>f.name==='alphaMult'),value=opacityField?.value;const opacity=typeof value==='object'&&value!==null&&!Array.isArray(value)?Number((value as any).float):Number(value);
   if(value===undefined||!Number.isFinite(opacity))throw new Error(`CloudCard ${n.id} lacks original alphaMult`);
   const m=cache.get(name)!,lighting=Uint8Array.from({length:m.positions.length/3*12},(_,i)=>i*13+7&255);
   return {world:n.fields.find(f=>f.name==='transform')!.value as number[],mesh:m,opacity,lighting};
  });
  for(const eye of [[0,100,0],[1000,200,-500]])cases.push({name:level+'-'+eye.join(','),sources,eye,fallback:Uint8Array.from([8,7,6,5,4,3,2,1])});
 }
 for(let i=0;i<50;i++){
  const world=identity.map((v,j)=>j%4===3?v:Math.fround(v+(random()-.5)*.5));
  cases.push({name:'random-'+i,sources:[{world,mesh,opacity:random()}],eye:[random()*20-10,random()*20-10,random()*20-10],fallback:new Uint8Array(8)});
 }
}
const chunks:Buffer[]=[];const ints=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v,i*4));chunks.push(b);};const floats=(values:ArrayLike<number>)=>{const b=Buffer.alloc(values.length*4);Array.from(values).forEach((v,i)=>b.writeFloatLE(v,i*4));chunks.push(b);};
const ranges=(c:Case)=>{let offset=0;return c.sources.map((s,i)=>{const n=s.mesh.positions.length/3,r={sourceIndex:i,group:0,vertexOffset:offset,indexOffset:0,vertexCount:n,indexCount:s.mesh.indices.length};offset+=n;return r;});};
ints([cases.length]);for(const c of cases){ints([c.sources.length]);floats(c.eye);chunks.push(Buffer.from(c.fallback));for(const [i,s] of c.sources.entries()){
 const m=s.mesh;ints([m.positions.length/3,ranges(c)[i].vertexOffset,Number(!!s.lighting)]);floats(s.world);floats([s.opacity]);
 const packed=Buffer.alloc(m.positions.length/3*16);for(let v=0;v<m.positions.length/3;v++)for(let lane=0;lane<3;lane++)packed.writeFloatLE(m.positions[v*3+lane],v*16+lane*4);
 chunks.push(packed,Buffer.from(m.packedNormals!.buffer,m.packedNormals!.byteOffset,m.packedNormals!.byteLength),Buffer.from(m.packedUvs!),Buffer.from(s.lighting??new Uint8Array(m.positions.length/3*12)));
}}
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-dynamic-'));let raw:Buffer;
try{
 const runner=path.join(temporary,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-cloud-card-dynamic-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(String(build.stderr));
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),maxBuffer:128*1024*1024,timeout:60000});if(run.status!==0)throw new Error(`Oracle failed ${run.status}: ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temporary,{recursive:true,force:true});}
let at=0;const int=()=>{const v=raw.readUInt32LE(at);at+=4;return v;};const readFloats=(n:number)=>Array.from({length:n},()=>{const v=raw.readFloatLE(at);at+=4;return v;});const floatHex=(v:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(v);return b.toString('hex');};
if(int()!==cases.length)throw new Error('Case count differs');const rows:any[]=[],fixtures:any[]=[];
for(const c of cases){
 const n=int(),directions=readFloats(c.sources.length*4),trig=readFloats(c.sources.length*4),positions=readFloats(n*4),bytes=raw.subarray(at,at+n*28);at+=n*28;
 let ai=0,si=0,pi=0;const capturedMath={acos:()=>trig[ai++*4],sincos:()=>{const i=si++;return [trig[i*4+1],trig[i*4+2]] as [number,number];},pow:()=>trig[pi++*4+3]};
 const actual=cloudCardDynamicVertices(c.sources,ranges(c),c.sources.map((_,i)=>i),c.eye,c.fallback,capturedMath),production=cloudCardDynamicVertices(c.sources,ranges(c),c.sources.map((_,i)=>i),c.eye,c.fallback);
 const badBytes=Array.from(bytes,(v,i)=>Number(v!==actual.vertices[i])).reduce((a,b)=>a+b,0),badPositions=positions.reduce((n,v,i)=>n+Number(floatHex(v)!==floatHex(actual.positions[i])),0);
 const productionBadBytes=Array.from(bytes,(v,i)=>Number(v!==production.vertices[i])).reduce((a,b)=>a+b,0);const productionMaxError=Math.max(0,...positions.map((v,i)=>Math.abs(v-production.positions[i])));
 const row={name:c.name,cards:c.sources.length,vertices:n,badBytes,badPositions,productionBadBytes,productionMaxError,passed:badBytes+badPositions===0};rows.push(row);
 if(!row.passed&&rows.filter(r=>!r.passed).length===1){const bad=Array.from(bytes.keys()).find(i=>bytes[i]!==actual.vertices[i]);console.error({row,firstBadByte:bad,native:Array.from(bytes.subarray(0,28)),actual:Array.from(actual.vertices.subarray(0,28)),nativePosition:positions.slice(0,4),actualPosition:Array.from(actual.positions.subarray(0,4)),direction:directions.slice(0,4),trig:trig.slice(0,4)});}
 if(c.name.startsWith('boundary-')||c.name==='random-0')fixtures.push({name:c.name,eye:c.eye,world:c.sources[0].world,opacity:c.sources[0].opacity,positions:Array.from(mesh.positions),normals:Array.from(mesh.packedNormals!),uvs:Array.from(mesh.packedUvs!),fallback:Array.from(c.fallback),trig,verticesHex:bytes.toString('hex'),positionsHex:Buffer.from(Float32Array.from(positions).buffer).toString('hex')});
}
if(at!==raw.length)throw new Error('Trailing native output');const report={passed:rows.every(r=>r.passed),complete:true,executableSha256:digest,cases:rows.length,cards:rows.reduce((n,r)=>n+r.cards,0),vertices:rows.reduce((n,r)=>n+r.vertices,0),scope:'Untouched original local camera direction, quarter-acos axis rotation, Vectormath multiply, vertex positions and 28-byte normal/half-UV/alpha/two-light packing. Explicit input world/mesh/bake/default bytes and visible order. Libm imports bind Linux acosf/sincosf/powf; captured results isolate original arithmetic from JS transcendental differences. No original Mac libm or GPU/visibility/startup proof.',productionLibmBitExact:rows.every(r=>r.productionBadBytes===0),productionMaxPositionError:Math.max(...rows.map(r=>r.productionMaxError)),rows};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/cloud-card-dynamic-native.json',JSON.stringify({scope:report.scope,executableSha256:digest,cases:fixtures})+'\n');console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
