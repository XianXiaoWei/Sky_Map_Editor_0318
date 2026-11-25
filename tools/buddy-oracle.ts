import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {buddyCases,prepareBuddy,evaluateBuddy} from './buddy-cases';import evidence from '../docs/buddy-native.json';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(sha(fs.readFileSync(exe))!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const cases=buddyCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-buddy-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-buddy-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=16){
  const batch=cases.slice(start,start+16),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input:Buffer.concat([count,...batch.flatMap(c=>{const seed=Buffer.alloc(4);seed.writeUInt32LE(c.seed);return [seed,prepareBuddy(c).b];})]),timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native count differs');let at=4;
  for(const c of batch){const calls=run.stdout.readUInt32LE(at+8+0x10000),n=12+0x10000+calls*160,native=run.stdout.subarray(at,at+n);at+=n;comparedBytes+=n;serviceCalls+=calls;
   const nativeMath=[];for(let i=0;i<calls;i++){const t=native.subarray(12+0x10000+i*160),kind=Number(t.readBigUInt64LE());if(kind===5)nativeMath.push({kind,input:[Number(t.readBigUInt64LE(8)),Number(t.readBigUInt64LE(16))],result:Number(t.readBigUInt64LE(24))});if(kind===6)nativeMath.push({kind,input:[Number(t.readBigUInt64LE(8))],result:Number(t.readBigUInt64LE(16))});}
   const actual=evaluateBuddy(c,nativeMath);if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}
   rows.push({input:c,nativeMath,nativeSha256:sha(native)});
  }
  if(at!==run.stdout.length)throw new Error('Native stream differs');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256:evidence.executableSha256,cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,scope:evidence.scope+' Complete caller memory and ordered service calls; atan2f/asinf use explicit native input/output traces. Missing sequences, live mesh changes, empty/31/32/33 discoverable masks, capacity assertions, repeated loads and short/long strings are covered.',failures};fs.writeFileSync('docs/buddy-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/buddy-native.json.gz',gzipSync(JSON.stringify({executableSha256:evidence.executableSha256,cases:rows}),{level:9}));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
