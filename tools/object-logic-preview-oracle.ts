import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import zlib from 'node:zlib';import assert from 'node:assert/strict';import {spawnSync} from 'node:child_process';
import {TransformObjectPreview} from '../src/core/transform-object-preview';import {objectLogicPreviewCases,objectLogicPreviewSyntheticCases,objectLogicNumericSyntheticCases,objectLogicSetFloatSyntheticCases,objectLogicSinglePulseSyntheticCases,objectLogicSetFloatMapCase} from './object-logic-preview-cases';
import {objectLogicFloatConditionSyntheticCases} from './float-condition-map-preview-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');assert.equal(executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const reportPrefix=process.env.SKY_LOGIC_PREVIEW_REPORT_PREFIX??'object-logic-preview';assert.match(reportPrefix,/^[a-z0-9-]+$/);
const corpus=objectLogicPreviewCases(),cases=[...corpus.cases,...objectLogicPreviewSyntheticCases(corpus.cases),...objectLogicNumericSyntheticCases(corpus.cases),...objectLogicSetFloatSyntheticCases(corpus.cases),...objectLogicSinglePulseSyntheticCases(corpus.cases),objectLogicSetFloatMapCase(),...objectLogicFloatConditionSyntheticCases()].filter(c=>!process.env.SKY_LOGIC_PREVIEW_FILTER||(c.level+':'+c.id).includes(process.env.SKY_LOGIC_PREVIEW_FILTER));
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),u32=(ns:number[])=>{const b=Buffer.alloc(ns.length*4);ns.forEach((n,i)=>b.writeUInt32LE(n,i*4));return b;};
const saved:any[]=[],failures:any[]=[];let snapshots=0,comparedOutputBytes=0;
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-object-logic-preview-'));
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-w','tools/native-object-logic-preview-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let batch=0;batch<cases.length;batch+=8){
  const rows=cases.slice(batch,batch+8).map(input=>{
   const preview=new TransformObjectPreview({transform:()=>{}});preview.configure(input.nodes);preview.start(input.id,false);
   const initial=preview.captureOriginalState();assert.ok(initial.storage.length<=0x40000);const deltas=Buffer.alloc(input.deltas.length*4);input.deltas.forEach((n,i)=>deltas.writeFloatLE(n,i*4));
   return {input,initial,encoded:Buffer.concat([u32([initial.storage.length,initial.eventPointers.length,input.deltas.length,initial.heapCursor]),initial.storage,initial.barn,deltas])};
  });
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([u32([rows.length]),...rows.map(r=>r.encoded)]),timeout:60000,maxBuffer:128*1024*1024});
  if(run.status!==0)throw new Error(`${run.status}/${run.signal}: ${run.stderr}; batch ${batch}; output bytes=${run.stdout.length}`);
  const output=run.stdout;let at=0;const take=(n:number)=>{assert.ok(at+n<=output.length);const b=output.subarray(at,at+n);at+=n;return b;},word=()=>take(4).readUInt32LE();assert.equal(word(),rows.length);
  for(const row of rows){
   assert.equal(word(),row.input.deltas.length);const frames:any[]=[];let pairs:number[][]=[],mathAt=0;
   const replay=(op:'cos'|'acos'|'sin'|'logf'|'expf',x:number)=>{const pair=pairs[mathAt++],b=Buffer.alloc(4);b.writeFloatLE(x);assert.ok(pair);assert.equal(pair[0],{cos:20,acos:21,sin:22,logf:30,expf:31}[op]);assert.equal(pair[1],b.readUInt32LE());b.writeUInt32LE(pair[2]);return b.readFloatLE();};
   const preview=new TransformObjectPreview({transform:()=>{},math:replay,numericMath:replay});
   preview.configure(row.input.nodes);preview.start(row.input.id,false);
   assert.equal(hash(preview.captureOriginalState().storage),hash(row.initial.storage));
   for(const delta of row.input.deltas){
    const line=word(),severity=word(),count=word(),size=word(),heapCursor=word(),logs=Array.from({length:count},()=>[word(),word(),word()]);assert.equal(size,row.initial.storage.length);
    const storage=take(size),barn=take(0x5040);pairs=logs.flatMap((l,i)=>[20,21,22,30,31].includes(l[0])?[[l[0],l[2],logs[i+1][2]]]:[]);mathAt=0;
    try{
     assert.equal(line,0);assert.equal(severity,0);preview.step(delta);assert.equal(preview.snapshot()!.error,null);assert.equal(mathAt,pairs.length);
     const actual=preview.captureOriginalState();assert.equal(actual.heapCursor,heapCursor);assert.deepEqual(Buffer.from(actual.storage),storage);assert.deepEqual(Buffer.from(actual.barn),barn);
    }catch(error){
     const actual=preview.captureOriginalState();const diffs=Array.from(storage).flatMap((n,i)=>n!==actual.storage[i]?[{offset:i,native:n,actual:actual.storage[i]}]:[]).slice(0,12);
     if(failures.length<24)failures.push({level:row.input.level,id:row.input.id,kind:row.input.kind,frame:frames.length,line,severity,diffs,error:String(error).slice(0,800)});
    }
    frames.push({storageSha256:hash(storage),barnSha256:hash(barn),heapCursor,math:pairs});comparedOutputBytes+=size+0x5040;snapshots++;
   }
   saved.push({...row.input,initialStorageSha256:hash(row.initial.storage),initialBarnSha256:hash(row.initial.barn),frames});
  }
  assert.equal(at,output.length);console.log(JSON.stringify({completedCases:Math.min(batch+8,cases.length),totalCases:cases.length,failures:failures.length}));
  if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const scope='Complete unchanged original EventBarn Update/sort and first load/enable/update/finish dispatch join Enable/IfEnabled/Delay/TransformObject/FloatAdd/FloatMult/SetFloat/OnFloat/FloatSplit, recursive Clump SetEnabled, shared Float storage, ObjectFactory Get/SetEnabled and registered original Event/Marker/LevelMesh reflectors. OnFloat short strings, nested Evaluate body pointers, raw inversion bytes and direct branch Object pointers are preserved; debug output and long strings are explicit blocked dependencies. Bounded real serialized subgraphs; every frame compares whole prepared object state, allocator cursor and 1280-slot Barn prefix, including initial dispatch. TS constructor/field inputs, registry nodes/type conversions, scratch/Heap and GameTime are explicit preparation/services; exact independently executed Linux libm output pairs (including logf/expf) replay with input-bit checks. JS Math is only a preview fallback, not macOS libm validation. No actual resource/Model/GPU/audio/beat/Timeline/collision/full scene or Avatar is established.';
const report={executableSha256,passed:!failures.length,cases:saved.length,snapshots,comparedOutputBytes,realRoots:saved.filter(r=>r.sourceSha256!==null).length,syntheticCases:saved.filter(r=>r.sourceSha256===null).length,mathPairs:saved.reduce((n,r)=>n+r.frames.reduce((m:any,f:any)=>m+f.math.filter((p:number[])=>p[0]===30||p[0]===31).length,0),0),counts:Object.fromEntries(['Enable','Delay','IfEnabled','FloatAdd','FloatMult','SetFloat','OnFloat','FloatSplit'].map(k=>[k,saved.filter(r=>r.kind===k&&r.sourceSha256!==null).length])),scope,completeOriginalGameRuntime:false,failures};
if(!process.env.SKY_LOGIC_PREVIEW_FILTER){
 fs.writeFileSync(`docs/${reportPrefix}-oracle.json`,JSON.stringify(report,null,2)+'\n');fs.writeFileSync(`docs/${reportPrefix}-availability.json`,JSON.stringify(corpus.availability,null,2)+'\n');
 if(report.passed)fs.writeFileSync(`tests/fixtures/${reportPrefix}-native.json.gz`,zlib.gzipSync(JSON.stringify({executableSha256,scope,cases:saved}),{level:9}));
}
if(failures.length)fs.writeFileSync('/root/sky-research/object-logic-preview-failures.json',JSON.stringify(failures,null,2)+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
