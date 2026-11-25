import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {darkCreatureLoadCases,prepareDarkCreatureLoad,evaluateDarkCreatureLoad} from './dark-creature-load-cases';
import evidence from '../docs/dark-creature-load-native.json';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(sha(fs.readFileSync(executable))!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const cases=darkCreatureLoadCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-dark-creature-load-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-dark-creature-load-oracle.c','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=16){
  const batch=cases.slice(start,start+16),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([count,...batch.map(c=>prepareDarkCreatureLoad(c).b)]),timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native case count differs');let at=4;
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+0x60000),n=0x60000+4+calls*256,native=run.stdout.subarray(at,at+n);at+=n;
   const actual=evaluateDarkCreatureLoad(c);comparedBytes+=n;serviceCalls+=calls;
   if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}
   rows.push({input:c,nativeSha256:sha(native)});
  }
  if(at!==run.stdout.length)throw new Error('Native stream differs');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256:evidence.executableSha256,start:evidence.start,end:evidence.end,cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,scope:evidence.scope+' Full caller memory and ordered services compared. Original options padding is excluded from service snapshots; every explicitly initialized byte is compared. Missing textures/observations/bones, prior bone fields, degenerate scales, saved flags and late rail assertions are covered.',failures};
fs.writeFileSync('docs/dark-creature-load-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/dark-creature-load-native.json.gz',gzipSync(JSON.stringify({executableSha256:evidence.executableSha256,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
