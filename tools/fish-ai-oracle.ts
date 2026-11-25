import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {fishAICases,prepareFishAI,evaluateFishAI,FISH_AI_ARENA,FISH_AI_ROW,type FishAINativeMath} from './fish-ai-cases';
import evidence from '../docs/fish-ai-native.json';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest=sha(fs.readFileSync(exe));
if(digest!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const cases=fishAICases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-fish-ai-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0,nativeArithmetic:number[][]=[];
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mno-red-zone','-Wall','-Wextra','-mavx','tools/native-fish-ai-oracle.c','-lm','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 fs.writeFileSync('/root/sky-research/fish-ai-native-build.log',build.stderr);
 for(let start=0;start<cases.length;start+=16){
  const batch=cases.slice(start,start+16),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const input=Buffer.concat([count,...batch.flatMap(c=>{const h=Buffer.alloc(4);h.writeUInt32LE(c.mode);return [h,prepareFishAI(c).b];})]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:64e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: batch ${start} ${batch.map(c=>c.label).join('; ')}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native AI case count differs');
  let at=8;const probes=Array.from({length:run.stdout.readUInt32LE(4)},()=>{const row=[0,4,8,12].map(offset=>run.stdout.readUInt32LE(at+offset));at+=16;return row;});
  if(nativeArithmetic.length&&JSON.stringify(probes)!==JSON.stringify(nativeArithmetic))throw new Error('Fish AI probes differ');nativeArithmetic=probes;
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+12),n=20+FISH_AI_ARENA+calls*FISH_AI_ROW,native=run.stdout.subarray(at,at+n);at+=n;
   const math:FishAINativeMath[]=[];for(let i=0;i<calls;i++){const p=20+FISH_AI_ARENA+i*FISH_AI_ROW,kind=Number(native.readBigUInt64LE(p));if(kind===22||kind===23||kind===32||kind===33||kind===34)math.push({kind,x:Number(native.readBigUInt64LE(p+8)),result:Array.from({length:kind===23?4:1},(_,j)=>native.readUInt32LE(p+24+j*4))});}
   let actual:Buffer;try{actual=evaluateFishAI(c,math,probes);}catch(e){failures.push({input:c,error:String(e)});fs.writeFileSync('/root/sky-research/fish-ai-native-failure.bin',native);break;}
   comparedBytes+=n;serviceCalls+=calls;
   if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<30;i++)if(actual[i]!==native[i])differences.push({at:i,arena:i>=20&&i<20+FISH_AI_ARENA?'0x'+(i-20).toString(16):undefined,actual:actual[i],native:native[i]});failures.push({input:c,actualBytes:actual.length,nativeBytes:n,differences});fs.writeFileSync('/root/sky-research/fish-ai-native-failure.bin',native);fs.writeFileSync('/root/sky-research/fish-ai-actual-failure.bin',actual);}
   rows.push({input:c,math,nativeSha256:sha(native)});if(failures.length)break;
  }
  if(failures.length)break;if(at!==run.stdout.length)throw new Error('Native Fish AI stream differs');
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const breakdown=Object.fromEntries([0,1,2,3,4,5,6,7].map(mode=>[mode,cases.filter(c=>c.mode===mode).length]));
const report={passed:!failures.length,executableSha256:digest,functions:evidence.functions,cases:cases.length,comparedCases:rows.length,caseBreakdown:breakdown,comparedBytes,serviceCalls,nativeArithmeticProbes:nativeArithmetic.length,scope:"Whole original FishV2.AI with all five switch branches and explicit caller/private Marker velocity W. Full caller arena and ordered world, metadata, rail, Mote, particle/audio, animation and player/resource boundaries compared. Original asinf/sincos and movement libm results are recorded/replayed. Whole Pursuit, accumulating Avoidance and both Fish predicates are separately compared. Production Update with actual AI/TurnDirection/Bank/MotionTransform, production AI with actual Begin/Avoidance/Flee/Seek/Pursuit/Wander/Flocking/End, and combined Update/AI/movement/steering are compared with unmodified native bodies. Flock integration covers empty and Actor neighborhoods with the original eight-call cache. Raw world avoidance/collision, metadata, Avatar/OBB/rail geometry and resource owners remain explicit services; real scene and complete creature acceptance remain pending.",failures};
fs.writeFileSync('docs/fish-ai-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/fish-ai-native.json.gz',gzipSync(JSON.stringify({executableSha256:digest,nativeArithmetic,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
