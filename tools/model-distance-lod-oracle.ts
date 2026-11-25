import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import zlib from 'node:zlib';import assert from 'node:assert/strict';import {spawnSync} from 'node:child_process';
import {selectOriginalModelDistanceLod,setOriginalModelLodDistance,originalModelClosestObbPoint} from '../src/core/model-distance-lod';
import {selectOriginalBeamoDistanceLod} from '../src/core/beamo-distance-lod';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');assert.equal(executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
let seed=4289167;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
const cases:any[]=[],identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
for(let n=1;n<=7;n++){
 const distances=Array.from({length:n},(_,i)=>(i+1)*10);
 for(const distance of [0,-0,1e-8,5,10,10.000001,20,70,71,1000])for(const enabled of [0,1])cases.push({mode:0,distances,distance,enabled,point:[distance,1,0,1],obb:identity});
 for(let i=0;i<n;i++)cases.push({mode:1,distances,distance:i===n-1?0:distances[i],enabled:i,point:[0,0,0,1],obb:identity});
 for(let i=0;i<64;i++){
  const obb=identity.map((v,k)=>k%4===3?v:Math.fround((random()-.5)*20));
  if(i%4===0)for(let k=0;k<3;k++)obb[i%3*4+k]=0;
  const point=Array.from({length:4},(_,k)=>k===3?1:Math.fround((random()-.5)*40));
  cases.push({mode:0,distances:distances.map((d,j)=>j===n-1&&i%4===0?distances[Math.max(0,j-1)]:d),distance:Math.fround(random()*100),enabled:i%2,point,obb});
 }
}
for(let n=1;n<=4;n++)for(const enabled of [0,1,2,3,4,5,6,7])for(const distance of [0,10,10.000001,20,20.000002,30,1000])cases.push({mode:3,distances:Array.from({length:n},(_,i)=>(i+1)*10),distance,enabled,point:[1,2,3,1],obb:identity});
const word=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v);return b;},float=(v:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(v);return b;};
const input=Buffer.concat([word(cases.length),...cases.map(c=>Buffer.concat([word(c.mode),word(c.distances.length),float(c.distance),word(c.enabled),...c.distances.map(float),...c.point.map(float),...c.obb.map(float)]))]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-distance-lod-'));let output:Buffer;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-model-distance-lod-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,timeout:90000,maxBuffer:10e6});if(run.status!==0)throw new Error(`${run.status} ${run.signal} ${run.stderr}`);output=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0;const u32=()=>{const v=output.readUInt32LE(at);at+=4;return v;},f32=()=>{const v=output.readFloatLE(at);at+=4;return v;};assert.equal(u32(),cases.length);
const rows=cases.map(input=>{
 const native={index:u32(),continuous:f32(),distances:input.distances.map(f32),inside:!!u32(),point:[f32(),f32(),f32()]};
 const distances=Float32Array.from(input.distances),selected=input.mode===0?selectOriginalModelDistanceLod(distances,input.distance,!!input.enabled):{index:input.mode===3?selectOriginalBeamoDistanceLod(distances.length,Array.from(distances),[0,1,2].map(i=>input.enabled>>i&1),input.distance):0,continuous:0};
 if(input.mode===1)setOriginalModelLodDistance(distances,input.enabled,input.distance);
 const nearest=originalModelClosestObbPoint(input.point,input.obb),actual={...selected,distances:Array.from(distances),inside:nearest.inside,point:nearest.point};
 assert.deepEqual(actual,native,JSON.stringify(input));return {input,native};
});assert.equal(at,output.length);
const scope='Whole original Model.SetLodDist 0x100466440 (valid inputs), whole closest point/OBB 0x10078cae0, unchanged numeric LOD selection spans 0x10046455f..64e/731. No original Barn lifecycle, visibility, fade task scheduling or GPU ownership claim.';
fs.writeFileSync('tests/fixtures/model-distance-lod-native.json.gz',zlib.gzipSync(JSON.stringify({executableSha256,scope,cases:rows}),{level:9}));
const report={passed:true,executableSha256,cases:cases.length,nativeOutputBytes:output.length,scope};fs.writeFileSync('docs/model-distance-lod-oracle.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
