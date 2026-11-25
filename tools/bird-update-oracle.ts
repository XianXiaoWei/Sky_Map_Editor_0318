import {birdFollowChainCases} from './bird-follow-chain-cases';import followEvidence from '../docs/bird-follow-native.json';
import {birdRailChainCases} from './bird-rail-chain-cases';import railEvidence from '../docs/bird-rail-native.json';
import {birdForceChainCases} from './bird-force-cases';import forceEvidence from '../docs/bird-force-native.json';
import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {birdMotionChainCases,birdSteeringMotionChainCases} from './bird-motion-cases';import motionEvidence from '../docs/bird-motion-native.json';
import {birdSteeringFlightChainCases} from './bird-acceleration-cases';import accelerationEvidence from '../docs/bird-acceleration-native.json';
import {birdFlightChainCases} from './bird-flight-cases';import flightEvidence from '../docs/bird-flight-native.json';
import {birdUpdateCases,prepareBirdUpdate,evaluateBirdUpdate} from './bird-update-cases';
import evidence from '../docs/bird-update-native.json';import targetEvidence from '../docs/bird-target-native.json';import {birdTargetChainCases} from './bird-target-cases';
const executable=process.argv.find((arg,i)=>i>=2&&!arg.startsWith('--'))??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(sha(fs.readFileSync(executable))!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const followChain=process.argv.includes('--follow-chain'),railChain=followChain||process.argv.includes('--rail-chain'),forceChain=railChain||process.argv.includes('--force-chain'),steeringMotionChain=forceChain||process.argv.includes('--steering-motion-chain'),motionFlightChain=steeringMotionChain||process.argv.includes('--motion-flight-chain'),motionChain=motionFlightChain||process.argv.includes('--motion-chain');
const targetChain=process.argv.includes('--target-chain'),steeringFlightChain=steeringMotionChain||process.argv.includes('--steering-flight-chain'),flightChain=motionFlightChain||steeringFlightChain||process.argv.includes('--flight-chain');const cases=followChain?birdFollowChainCases():railChain?birdRailChainCases():forceChain?birdForceChainCases():steeringMotionChain?birdSteeringMotionChainCases():motionChain?birdMotionChainCases(motionFlightChain):steeringFlightChain?birdSteeringFlightChainCases():flightChain?birdFlightChainCases():targetChain?birdTargetChainCases():birdUpdateCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-bird-update-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;let nativeArithmetic:number[][]|undefined;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-bird-update-oracle.c','-lm','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=16){
  const batch=cases.slice(start,start+16),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable,...(followChain?['--follow-chain']:railChain?['--rail-chain']:forceChain?['--force-chain']:steeringMotionChain?['--steering-motion-chain']:motionFlightChain?['--motion-flight-chain']:motionChain?['--motion-chain']:steeringFlightChain?['--steering-flight-chain']:flightChain?['--flight-chain']:targetChain?['--target-chain']:[])],{input:Buffer.concat([count,...batch.map(c=>prepareBirdUpdate(c).b)]),timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native case count differs');let at=4;
  if(forceChain){const count=run.stdout.readUInt32LE(at);at+=4;const probes=Array.from({length:count},()=>{const row=[0,4,8,12].map(offset=>run.stdout.readUInt32LE(at+offset));at+=16;return row;});if(nativeArithmetic&&JSON.stringify(nativeArithmetic)!==JSON.stringify(probes))throw new Error('Native arithmetic probes differ across batches');nativeArithmetic=probes;}
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+0x60000),n=0x60000+4+calls*160,native=run.stdout.subarray(at,at+n);at+=n;
   const nativeMath=[];if(flightChain||motionChain)for(let i=0;i<calls;i++){const row=native.subarray(0x60004+i*160),kind=Number(row.readBigUInt64LE());if(kind===26||kind===27||kind===31)nativeMath.push({kind,input:Number(row.readBigUInt64LE(8)),result:Array.from({length:kind===27?2:1},(_,j)=>Number(row.readBigUInt64LE((kind===31?24:16)+j*8)))});}
   let actual:Buffer;try{actual=evaluateBirdUpdate(c,flightChain||motionChain?nativeMath:undefined,nativeArithmetic);}catch(error){throw new Error(c.label+": "+String(error));}comparedBytes+=n;serviceCalls+=calls;
   if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}
   rows.push({input:c,...(flightChain||motionChain?{nativeMath}:{}),nativeSha256:sha(native)});
  }
  if(at!==run.stdout.length)throw new Error('Native stream differs');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const scope=(followChain?followEvidence.scope+' Actual object-follow, direct Seek/Brake/Orbit, target/guide/flocking forces, rail selection, acceleration, steering, flight, motion and Model.SetTransform execute in original BirdV2.Update. World/Avatar/OBB projection, Critter effects, direction/bank and resources retain explicit owner boundaries.':railChain?railEvidence.scope+' Actual rail selection/follow, target/guide forces and original Flocking execute inside acceleration, Steering.Begin/End, flight, motion and BirdV2.Update. Metadata casts, nearest/arc/sample, object follow, direction/bank, collision and resource owners remain explicit services.':forceChain?forceEvidence.scope+' Raw target/guide forces, landing probe selection and original shared Flocking are composed with acceleration, Steering.Begin/End, flight, motion and Model.SetTransform in BirdV2.Update. Rail choice/follow, object-follow, direction interpolation/bank, world collision and real resource owners remain explicit boundaries.':steeringMotionChain
 ? 'Whole ordinary BirdV2Ai acceleration dispatcher, original Steering.Begin/End, flight integration, displacement/orientation caller, matrix multiplication and Model.SetTransform execute together inside BirdV2.Update. Concrete target/rail/guide/flocking force implementations, world collision/neighborhood, direction interpolation/bank filtering, math, action weights and Actor transform remain explicit services. Autonomous AI and real Model/animation/GPU ownership remain pending.'
 : motionChain?motionEvidence.scope+(motionFlightChain?' Original flight integration also executes in this chain; acceleration remains an explicit service.':'')
 : steeringFlightChain?accelerationEvidence.scope+' '+flightEvidence.scope
 : flightChain?flightEvidence.scope:targetChain?targetEvidence.scope:evidence.scope)
 +(motionChain&&!flightChain
 ? ' Full caller memory and ordered services compared, including consecutive frames, callback changes and native sincosf inputs/outputs replayed through explicit math services.'
 : flightChain?' Complete caller arena and ordered services compared, including consecutive frames and live callback changes. Original acosf/sincosf'+(steeringFlightChain?'/powf':'')+' inputs and outputs are recorded and replayed as explicit math services; no JavaScript/libm equivalence claim.'
 : ' Full caller memory and ordered services compared, including consecutive frames, callback changes, NaN transform assertions and global counter rollover.');
const report={passed:!failures.length,executableSha256:evidence.executableSha256,start:evidence.start,end:evidence.end,
 ...(followChain?{follow:followEvidence.functions}:{}),
 ...(railChain?{rails:railEvidence.functions}:{}),
 ...(forceChain?{forces:forceEvidence.functions,nativeArithmeticProbes:nativeArithmetic?.length}:{}),
 ...(motionChain?{motion:{start:motionEvidence.start,end:motionEvidence.end,codeSha256:motionEvidence.codeSha256}}:{}),
 ...(flightChain?{flightIntegration:{start:flightEvidence.start,end:flightEvidence.end,codeSha256:flightEvidence.codeSha256}}:{}),
 ...(steeringFlightChain?{acceleration:{start:accelerationEvidence.start,end:accelerationEvidence.end,codeSha256:accelerationEvidence.codeSha256},scratchScope:'The 112-byte private TypeScript motion/output scratch models original stack storage and is cleared before exporting caller arena bytes. Every captured motion byte supplied to downstream services is recorded and compared; original object memory, steering state and service trace bytes are not excluded.'}:{}),
 ...(targetChain?{targetSelection:{start:targetEvidence.start,end:targetEvidence.end}}:{}),
 cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,scope,failures};
const name=followChain?'bird-follow-chain':railChain?'bird-rail-chain':forceChain?'bird-force':steeringMotionChain?'bird-steering-motion':motionChain?'bird-motion'+(motionFlightChain?'-flight':''):steeringFlightChain?'bird-acceleration':flightChain?'bird-flight':targetChain?'bird-target':'bird-update';
fs.writeFileSync('docs/'+name+'-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/'+name+'-native.json.gz',gzipSync(JSON.stringify({executableSha256:evidence.executableSha256,cases:rows,...(nativeArithmetic?{nativeArithmetic}:{})}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
