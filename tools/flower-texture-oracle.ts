import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {initializeOriginalFlowerTexture,generateOriginalFlowerTexture} from '../src/core/flower-texture-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(sha(fs.readFileSync(executable))!==digest)throw new Error('Original executable SHA differs');
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-flower-texture-')),runner=path.join(temp,'oracle'),trace:Buffer[]=[],b=Buffer.alloc(0x600000,0xaa),base=0x460000000n;let allocators=0;
const offset=(p:bigint)=>Number(p-base),m={bytes:(p:bigint,n:number)=>b.subarray(offset(p),offset(p)+n),read32:(p:bigint)=>b.readUInt32LE(offset(p)),read64:(p:bigint)=>b.readBigUInt64LE(offset(p)),write8:(p:bigint,n:number)=>{b[offset(p)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n,offset(p));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,offset(p));},string:()=>''};
function record(tag:number){const r=Buffer.alloc(64);r.writeUInt32LE(tag);trace.push(r);return r;}
initializeOriginalFlowerTexture(m,base,{
 initializeSampler:(p,desc)=>{const r=record(1);r.writeBigUInt64LE(p,8);r.set(desc,16);},
 allocator:()=>{const r=record(2),p=base+0x510100n+BigInt(allocators++)*0x100n;r.writeBigUInt64LE(p,8);return p;},heap:()=>base+0x510300n,
 allocate:(owner,bytes,heap,alignment)=>{const r=record(3);r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(BigInt(bytes),16);r.writeBigUInt64LE(heap,24);r.writeUInt32LE(alignment,32);return base+0x500000n;},
 createImage:(p,name,kind,w,h,format,flags)=>{const r=record(4);r.writeBigUInt64LE(p,8);r.set(new TextEncoder().encode(name),16);[kind,w,h,format,flags].forEach((n,i)=>r.writeUInt32LE(n,32+i*4));},
 upload:(p,data)=>{const r=record(5);r.writeBigUInt64LE(p,8);r.writeBigUInt64LE(data,16);},finalizeImage:p=>{record(6).writeBigUInt64LE(p,8);},free:(owner,p)=>{const r=record(7);r.writeBigUInt64LE(owner,8);r.writeBigUInt64LE(p,16);}
});
const header=Buffer.alloc(4);header.writeUInt32LE(trace.length);const actual=Buffer.concat([header,...trace,b.subarray(0x11dc0,0x11dc4),b.subarray(0x455df0,0x455df8),b.subarray(0x500000,0x500800)]);
try{
 const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-flower-texture-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{maxBuffer:1e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);
 const native=run.stdout,differences=[];for(let i=0;i<Math.max(actual.length,native.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({offset:i,actual:actual[i],native:native[i]});
 const report={passed:!differences.length,executableSha256:digest,entry:'0x10034e2b0',comparedBytes:native.length,serviceCalls:trace.length,textureBytes:2048,textureSha256:sha(generateOriginalFlowerTexture()),nativeSha256:sha(native),scope:'Whole normal FlowerBarn.Initialize, both generated RG channels and image/sampler/allocator service order; GPU service bodies and exceptional unwinding remain explicit',differences};
 fs.writeFileSync('docs/flower-texture-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/flower-texture-native.json',JSON.stringify({...report,textureHex:native.subarray(native.length-2048).toString('hex')},null,2)+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
