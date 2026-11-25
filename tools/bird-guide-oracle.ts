import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {birdGuideCases,prepareBirdGuide,evaluateBirdGuide,BIRD_GUIDE_ARENA_BYTES,BIRD_GUIDE_TRACE_BYTES} from './bird-guide-cases';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(sha(fs.readFileSync(exe))!==executableSha256)throw new Error('Original executable SHA differs');
const cases=birdGuideCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-bird-guide-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-bird-guide-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let first=0;first<cases.length;first+=16){
  const batch=cases.slice(first,first+16),header=Buffer.alloc(4);header.writeUInt32LE(batch.length);const input=Buffer.concat([header,...batch.flatMap(c=>{const mode=Buffer.alloc(4);mode.writeUInt32LE(c.mode);return [mode,prepareBirdGuide(c).b];})]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:20e6});if(run.status!==0)throw new Error(`Batch ${first}: ${run.status}: ${run.signal}: ${run.stderr}`);let at=4;
  for(const c of batch){const length=12+BIRD_GUIDE_TRACE_BYTES+BIRD_GUIDE_ARENA_BYTES,native=run.stdout.subarray(at,at+length);at+=length;comparedBytes+=length;serviceCalls+=native.readUInt32LE(8)/6;const actual=evaluateBirdGuide(c);
   if(!actual.equals(native)){const differences=[];for(let i=0;i<length&&differences.length<20;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}rows.push({input:c,nativeSha256:sha(native)});
  }
  if(at!==run.stdout.length)throw new Error('Native guide stream differs');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256,eventBodies:2,realChildBodies:5,cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,scope:'Whole ReleaseBirds and DetachFromBirdGuides OnEnabled with actual Avatar slot/active, versioned guide Get/Set and required-Avatar assertion bodies. Prepared real-config references, full arena bytes, ordered service calls, failure writes; Model fade, enabled virtual, avatar selection, statistics and Event.Start remain explicit services. Complete Bird/BirdFlock/Avatar AI and dynamic rendering are separate.',failures};
fs.writeFileSync('docs/bird-guide-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/bird-guide-native.json.gz',gzipSync(JSON.stringify({executableSha256,cases:rows}),{level:9}));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
