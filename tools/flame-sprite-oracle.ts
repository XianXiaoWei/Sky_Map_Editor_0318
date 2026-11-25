import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {flameSpriteCases,prepareFlameSprite,evaluateFlameSprite} from './flame-sprite-cases';
import evidence from '../docs/flame-sprite-native.json';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(sha(fs.readFileSync(executable))!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const cases=flameSpriteCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-flame-sprite-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','tools/native-flame-sprite-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=16){
  const batch=cases.slice(start,start+16),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([count,...batch.map(c=>prepareFlameSprite(c).b)]),timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);let at=4;
  for(const input of batch){
   const calls=run.stdout.readUInt32LE(at+0x20008),size=0x2000c+calls*96,native=run.stdout.subarray(at,at+size);at+=size;
   const trace=Array.from({length:calls},(_,i)=>native.subarray(0x2000c+i*96,0x2000c+(i+1)*96));comparedBytes+=size;
   try{const actual=evaluateFlameSprite(input,trace);if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(size,actual.length)&&differences.length<12;i++)if(actual[i]!==native[i])differences.push({at:'0x'+i.toString(16),actual:actual[i],native:native[i]});failures.push({input,differences});}}catch(error){failures.push({input,error:String(error)});}
   rows.push({input,nativeSha256:sha(native),trace:trace.map(r=>r.toString('base64'))});
  }
  if(at!==run.stdout.length)throw new Error('Native trailing bytes');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256:evidence.executableSha256,cases:cases.length,comparedCases:rows.length,comparedBytes,scope:'Primary FlameBarn sprite subregion executed in place, whole SpriteRenderer Add/Reset including overlapping input memory and capacity assertion, whole Render with explicitly prepared dynamic Vertex/camera/sort/map/commit services (single camera-facing sprite); exact 24-byte vertex output and full memory compared. Independently captured sinf returns and hardware RSQRTSS estimate replayed. Full Barn, nonbillboard renderer paths, glow/particles, interaction/propagation and native GPU/resource owner remain pending.',failures};
fs.writeFileSync('docs/flame-sprite-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/flame-sprite-native.json.gz',gzipSync(JSON.stringify({executableSha256:evidence.executableSha256,cases:rows}),{level:9}));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
