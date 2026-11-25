import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import zlib from 'node:zlib';
import { spawnSync } from 'node:child_process';
import { tgclFieldCases, tgclFieldMemory, TGCL_BYTES } from './tgcl-field-cases';
import { evaluateTgclFields } from './tgcl-field-evaluate';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=digest(fs.readFileSync(executable));
assert.equal(executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases=tgclFieldCases(),uints=(xs:number[])=>{const b=Buffer.alloc(xs.length*4);xs.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
const input=Buffer.concat([uints([cases.length]),...cases.flatMap(c=>[uints([c.kind,Number(c.nullObject),c.rootAdjustment,Number(c.classCastFails),Number(c.receiverFails),Number(c.nullArray),Number(c.zeroElement),Number(c.stopAfterAllocator),c.nodes,Number(c.resolve),c.classes.reduce((n,c)=>n+c.properties.length,0),c.classes.length]),tgclFieldMemory(c)])]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-tgcl-fields-'));let output:Buffer;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-tgcl-field-oracle.c','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:512e6,timeout:180000});
 if(run.status!==0)throw new Error(`${run.status}/${run.signal}: ${run.stderr}`);output=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0;const u32=()=>{const v=output.readUInt32LE(at);at+=4;return v;};assert.equal(u32(),cases.length);
const failures:any[]=[],rows=[];
for(const c of cases){
 const line=u32(),severity=u32(),count=u32(),cursor=u32(),pointerCount=u32(),lengthError=Boolean(u32()),events=Array.from({length:count},()=>[u32(),u32(),u32(),u32()]);
 const memorySha256=digest(output.subarray(at,at+TGCL_BYTES));at+=TGCL_BYTES;
 const native={line,severity,lengthError,events,cursor,pointerCount,memorySha256},actual=evaluateTgclFields(c);
 try{assert.deepEqual(actual,native);}catch{failures.push({name:c.name,actual,native});}
 rows.push({input:c,native});
}
assert.equal(at,output.length);
const scope='Unmodified whole ReadString 0x10040b1d0, recursive ReadFields 0x10040b390 and libc++ grow-and-replace 0x1000198c0: POD/unmatched skips, short/long strings and post-assignment cursor assertion, capacity rounding and uint64 length-error check, prefix/insert/tail copies and release-before-descriptor writes, aliased sources, deferred scalar/array refs, reflected array allocation/address/cast, nested arrays, cached Tool_DefaultValue application and failure memory snapshots. Original pointer-fixup loop 0x10040d2aa..0x10040d311 executed as an explicitly bounded SUBRANGE. Metadata lookup registry, casts/accessors, array object construction and pool allocation/free are prepared boundary services. Corpus cases use real serialized bytes and registered member offsets, but preserve a prepared cache; they do NOT establish full TGCL metadata matching/default-cache preparation or complete actual level loading. Corpus pointers remain deferred; synthetic multi-node forward/cyclic pointers are fixed up.';
const report={passed:failures.length===0,executableSha256,wholeRoutines:3,subranges:1,cases:cases.length,growthCases:cases.filter(c=>c.kind===2).length,corpusCases:cases.filter(c=>c.provenance).length,corpusClasses:[...new Set(cases.flatMap(c=>c.provenance?[c.provenance.className]:[]))],comparedBytes:cases.length*TGCL_BYTES,scope,completeOriginalGameRuntime:false,failures};
fs.writeFileSync('docs/tgcl-field-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/tgcl-field-native.json.gz',zlib.gzipSync(JSON.stringify({executableSha256,scope,cases:rows}),{level:9}));
console.log(JSON.stringify({...report,failures:failures.slice(0,2)}));if(!report.passed)process.exitCode=1;
