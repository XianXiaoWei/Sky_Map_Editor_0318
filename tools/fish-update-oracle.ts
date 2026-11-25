import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {gzipSync} from 'node:zlib';
import {spawnSync} from 'node:child_process';
import {fishUpdateCases,prepareFishUpdate,evaluateFishUpdate,FISH_UPDATE_ARENA as SIZE,FISH_UPDATE_ROW as ROW,type FishNativeMath} from './fish-update-cases';
import evidence from '../docs/fish-update-native.json';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest=sha(fs.readFileSync(exe));
if(digest!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const allCases=fishUpdateCases(),limit=Number(process.env.FISH_ORACLE_LIMIT??allCases.length),cases=allCases.slice(0,limit),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-fish-update-')),rows:unknown[]=[],failures:unknown[]=[];
let comparedBytes=0,serviceCalls=0,nativeArithmetic:number[][]=[];
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-mno-red-zone','-Wall','-Wextra','tools/native-fish-update-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=32){
  const batch=cases.slice(start,start+32),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const input=Buffer.concat([count,...batch.flatMap(c=>{const h=Buffer.alloc(4);h.writeUInt32LE(c.mode);return [h,prepareFishUpdate(c).b];})]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:30e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native Fish case count differs');let at=8;
  const probes=Array.from({length:run.stdout.readUInt32LE(4)},()=>{const row=[0,4,8,12].map(offset=>run.stdout.readUInt32LE(at+offset));at+=16;return row;});if(nativeArithmetic.length&&JSON.stringify(probes)!==JSON.stringify(nativeArithmetic))throw new Error('Fish arithmetic probes differ');nativeArithmetic=probes;
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+12),n=16+SIZE+calls*ROW,native=run.stdout.subarray(at,at+n);at+=n;const math:FishNativeMath[]=[];
   for(let i=0;i<calls;i++){const r=native.subarray(16+SIZE+i*ROW),kind=Number(r.readBigUInt64LE());if(kind>=1&&kind<=4)math.push({kind,x:Number(r.readBigUInt64LE(8)),result:Array.from({length:kind===4?4:1},(_,j)=>r.readUInt32LE(24+j*4))});}
   let actual:Buffer|undefined;try{actual=evaluateFishUpdate(c,math,nativeArithmetic);}catch(e){failures.push({input:c,error:String(e)});}
   comparedBytes+=n;serviceCalls+=calls;
   if(actual&&!actual.equals(native)){
    const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<24;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});
   }
   if(failures.length){fs.writeFileSync('/root/sky-research/fish-update-failure-native.bin',native);if(actual)fs.writeFileSync('/root/sky-research/fish-update-failure-actual.bin',actual);fs.writeFileSync('/root/sky-research/fish-update-failure-case.json',JSON.stringify({input:c,nativeMath:math,nativeArithmetic},null,2));break;}
   rows.push({input:c,nativeMath:math,nativeSha256:sha(native)});
  }
  if(failures.length)break;if(at!==run.stdout.length)throw new Error('Native Fish stream differs');
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length&&cases.length===allCases.length,executableSha256:digest,functions:evidence.functions,cases:allCases.length,comparedCases:rows.length,comparedBytes,serviceCalls,nativeArithmeticProbes:nativeArithmetic.length,scope:evidence.scope+' Complete caller arena and ordered calls compare original movement helpers, callbacks, disabled/deferred Models, velocity/collision thresholds, full transform NaN assertion, animation weights, surface material flags/ripple requests and player alert/interaction/follow-up timers. Whole AI remains a recorded external service in this comparison.',failures};
fs.writeFileSync('docs/fish-update-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/fish-update-native.json.gz',gzipSync(JSON.stringify({executableSha256:digest,nativeArithmetic,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(failures.length)process.exitCode=1;
