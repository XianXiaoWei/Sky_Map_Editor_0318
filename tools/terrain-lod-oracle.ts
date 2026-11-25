import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {terrainBinLods,terrainFrustumRte,terrainFrustumRtz} from '../src/core/terrain-visibility';
import {MeshesDocument} from '../src/core/meshes';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
interface Case {name:string;distance:boolean;csr:number;minimum:number;thresholds:Float32Array;eye:Float32Array;spheres:Float32Array;statuses:Uint32Array;save:boolean;}
const cases:Case[]=[];
const add=(name:string,spheres:Float32Array,statuses:Uint32Array,eye:Float32Array,thresholds:Float32Array,minimum:number,save=true)=>{
  for(const distance of [false,true])for(const csr of [0x1f80,0xffc0])cases.push({name:`${name}-${distance?'distance':'constant'}-${csr===0x1f80?'rte':'rtz'}`,distance,csr,minimum,thresholds,eye,spheres,statuses,save});
};
let seed=0x318a3274;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
for(const count of [0,1,2,3,4,7,8,15,16,31,32,33,63,64,65,127,128,129])for(let run=0;run<20;run++) {
  const eye=Float32Array.from([random()*20,random()*20,random()*20,123]);
  const spheres=Float32Array.from(Array.from({length:count},()=>[(random()-.5)*100,(random()-.5)*100,(random()-.5)*100,random()*15]).flat());
  const statuses=Uint32Array.from({length:count},(_,i)=>[0,1,0x80000000,0xffffffff,0x318faced][(i+run)%5]);
  add(`random-${count}-${run}`,spheres,statuses,eye,Float32Array.from([10,20,40]),[-1,0,1.5,3,5,32767,32768,65535,65536,NaN,Infinity,-Infinity][run%12],count<=8&&run<8||[31,32,33,64,65,128,129].includes(count)&&run<3);
}
for(const x of [-1,0,1,9.999999,10,10.000001,19.999998,20,20.000002,39.999996,40,40.000004])for(const radius of [0,1,10])add(`boundary-${x}-${radius}`,Float32Array.from([x,0,0,radius]),Uint32Array.from([1]),new Float32Array(4),Float32Array.from([10,20,40]),0);
for(const exceptional of [NaN,Infinity,-Infinity,2**-149,-(2**-149),2**127]) {
  add(`exceptional-${exceptional}`,Float32Array.from([exceptional,0,0,1,0,0,0,exceptional]),Uint32Array.from([1,1]),new Float32Array(4),Float32Array.from([0,1,exceptional]),exceptional);
}
const data=path.resolve(executable,'../../Data');let corpusMaps=0,corpusRecords=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file)),geometries=doc.geometries.filter(g=>g.kind==='terrain');if(!geometries.length)continue;
  const spheres=Float32Array.from(geometries.flatMap(g=>{const b=g.bounds!,center=[0,1,2].map(i=>(b[i]+b[i+3])/2),radius=Math.hypot(...[0,1,2].map(i=>(b[i+3]-b[i])/2));return [...center,radius];}));
  add(`map-${level}`,spheres,new Uint32Array(geometries.length).fill(0xffffffff),Float32Array.from([0,100,0,1]),Float32Array.from([50,100,200]),0,false);corpusMaps++;corpusRecords+=geometries.length;
}
const chunks:Buffer[]=[];const uints=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v,i*4));chunks.push(b);};
const bytes=(values:Float32Array|Uint32Array|Uint16Array)=>Buffer.from(values.buffer,values.byteOffset,values.byteLength);
uints([cases.length]);for(const c of cases){uints([Number(c.distance),c.statuses.length,c.csr]);chunks.push(bytes(c.thresholds),bytes(Float32Array.of(c.minimum)),bytes(c.eye),bytes(c.spheres),bytes(c.statuses),bytes(new Uint16Array(c.statuses.length+8).fill(0xabcd)));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-terrain-lod-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-terrain-lod-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:16*1024*1024});
  if(run.status!==0)throw new Error(`Original terrain LOD failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Terrain LOD output groups');let at=4,failed=0,compared=0;
const saved:unknown[]=[],failures:unknown[]=[];
for(const c of cases) {
  const before=raw.readUInt32LE(at),after=raw.readUInt32LE(at+4);at+=8;
  const expected=Array.from({length:c.statuses.length+8},(_,i)=>raw.readUInt16LE(at+i*2));at+=expected.length*2;
  const result=terrainBinLods(c.statuses,c.spheres,c.eye,c.thresholds,c.minimum,c.distance,c.csr===0x1f80?terrainFrustumRte:terrainFrustumRtz),actual=new Uint16Array(c.statuses.length+8).fill(0xabcd);actual.set(result);
  let mismatches=Number((before&0xffc0)!==(after&0xffc0));compared++;expected.forEach((word,i)=>{compared++;if(word!==actual[i])mismatches++;});
  const snapshot={name:c.name,distance:c.distance,csr:c.csr,minimumHex:bytes(Float32Array.of(c.minimum)).toString('hex'),thresholdsHex:bytes(c.thresholds).toString('hex'),eyeHex:bytes(c.eye).toString('hex'),spheresHex:bytes(c.spheres).toString('hex'),statuses:Array.from(c.statuses),expected};
  if(mismatches){failed+=mismatches;if(failures.length<20)failures.push({...snapshot,actual:Array.from(actual),before,after});}if(c.save)saved.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread terrain LOD output');
const scope='Original TerrainBarn numeric spans 0x1006a3118..0x1006a3217 (constant LOD from AABB statuses, including 32-item SIMD and scalar tail) and 0x1006a3274..0x1006a331f (distance-squared minus sphere-radius-squared, three squared thresholds, CVTTSS2SI minimum and signed-16 clamp). Only entry/return trampolines delimit those instruction spans; no imports/callbacks. RTE and RTZ/FTZ/DAZ ambient controls, guard words, tangent thresholds, exceptional floats and uint32 statuses checked; zero-count harness preserves output without entering a numeric span. 77 terrain bounds in 31 maps provide explicit derived sphere snapshots, not original loaded bins. AABB query itself is separately verified; full TerrainBarn camera/OBB gathering, bin production, LOD transitions, allocation/resource jobs, collision and viewport scheduling remain incomplete.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,compared,failed,failures,corpusMaps,corpusRecords};
fs.writeFileSync('docs/terrain-lod-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/terrain-lod-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/terrain-lod-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
