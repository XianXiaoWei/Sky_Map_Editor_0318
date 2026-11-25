import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import zlib from 'node:zlib';import assert from 'node:assert/strict';import {spawnSync} from 'node:child_process';
import {TransformObjectPreview} from '../src/core/transform-object-preview';import {transformSequenceCases} from './transform-sequence-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');assert.equal(executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),u32=(ns:number[])=>{const b=Buffer.alloc(ns.length*4);ns.forEach((n,i)=>b.writeUInt32LE(n,i*4));return b;};
const rows=transformSequenceCases().map(input=>{
 const preview=new TransformObjectPreview({transform:()=>{}});preview.configure(input.nodes);preview.start(input.id);assert.equal(preview.snapshot()!.error,null);
 const initial=preview.captureOriginalState(),deltas=Buffer.alloc(input.deltas.length*4);input.deltas.forEach((n,i)=>deltas.writeFloatLE(n,i*4));
 return {input,initial,encoded:Buffer.concat([u32([initial.storage.length,initial.eventPointers.length,input.deltas.length]),initial.storage,initial.barn,deltas])};
});
assert.equal(rows.length,5);const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-transform-sequence-'));let output:Buffer;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-w','tools/native-transform-sequence-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([u32([rows.length]),...rows.map(r=>r.encoded)]),timeout:180000,maxBuffer:128*1024*1024});
 if(run.status!==0)throw new Error(`${run.status}/${run.signal}: ${run.stderr}; output bytes=${run.stdout.length}`);output=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0,comparedOutputBytes=0,snapshots=0;const failures:any[]=[],saved:any[]=[],take=(n:number)=>{assert.ok(at+n<=output.length);const b=output.subarray(at,at+n);at+=n;return b;},word=()=>take(4).readUInt32LE();
assert.equal(word(),rows.length);
for(const row of rows){
 assert.equal(word(),row.input.deltas.length);const frames:any[]=[];let replay:number[][]|undefined,mathAt=0;
 const preview=new TransformObjectPreview({transform:()=>{},math:(op,x)=>{
  if(!replay)return Math.fround(op==='acos'?Math.acos(x):op==='cos'?Math.cos(x):Math.sin(x));
  const pair=replay[mathAt++],bits=Buffer.alloc(4);bits.writeFloatLE(x);assert.ok(pair);assert.equal(pair[0],{cos:20,acos:21,sin:22}[op]);assert.equal(pair[1],bits.readUInt32LE());bits.writeUInt32LE(pair[2]);return bits.readFloatLE();
 }});preview.configure(row.input.nodes);preview.start(row.input.id);
 assert.equal(hash(preview.captureOriginalState().storage),hash(row.initial.storage));
 for(const delta of row.input.deltas){
  const line=word(),severity=word(),count=word(),size=word(),logs=Array.from({length:count},()=>[word(),word(),word()]);assert.equal(size,row.initial.storage.length);
  const storage=take(size),barn=take(0x5040);replay=logs.flatMap((l,i)=>l[0]>=20&&l[0]<=22?[[l[0],l[2],logs[i+1][2]]]:[]);mathAt=0;
  try{
   assert.equal(line,0);assert.equal(severity,0);preview.step(delta);assert.equal(preview.snapshot()!.error,null);assert.equal(mathAt,replay.length);
   const actual=preview.captureOriginalState();assert.deepEqual(Buffer.from(actual.storage),storage);assert.deepEqual(Buffer.from(actual.barn),barn);
  }catch(error){failures.push({level:row.input.level,id:row.input.id,frame:frames.length,error:String(error).slice(0,700)});}
  frames.push({storageSha256:hash(storage),barnSha256:hash(barn),math:replay});comparedOutputBytes+=size+0x5040;snapshots++;
 }
 saved.push({...row.input,initialStorageSha256:hash(row.initial.storage),initialBarnSha256:hash(row.initial.barn),frames});
}
assert.equal(at,output.length);
const scope='Complete unchanged original EventBarn Update and pointer sorter join TransformObject enable/update/finish and reflected Event::SetEnabled completion requests. Five real RainEnd/StormEnd serialized subgraphs, including four cyclic roots; every frame compares entire prepared storage and 1280-slot Barn prefix. Initial already-loaded editor snapshots, slot registration/order, metadata casts, allocator/scratch and GameTime are explicit inputs/services; subsequent arithmetic replays exact independently executed Linux libm output pairs with input-bit checks. Initial setup is not independent native construction/loading evidence. Original resource/Model/GPU/collision/audio/Timeline/full scene remain unverified.';
const report={executableSha256,passed:!failures.length,cases:rows.length,snapshots,comparedOutputBytes,realRoots:5,cyclicRoots:4,scope,completeOriginalGameRuntime:false,failures};
fs.writeFileSync('docs/transform-sequence-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/transform-sequence-native.json.gz',zlib.gzipSync(JSON.stringify({executableSha256,scope,cases:saved}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
