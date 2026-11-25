import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {birdNaturalCases,prepareBirdNatural,evaluateBirdNatural,BIRD_NATURAL_ARENA_BYTES,BIRD_NATURAL_TRACE_BYTES} from './bird-natural-animation-cases';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(sha(fs.readFileSync(exe))!==executableSha256)throw new Error('Original executable SHA differs');
const cases=birdNaturalCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-bird-natural-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-bird-natural-animation-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const header=Buffer.alloc(4);header.writeUInt32LE(cases.length);const input=Buffer.concat([header,...cases.flatMap(c=>{const mode=Buffer.alloc(4);mode.writeUInt32LE(c.mode);return [mode,prepareBirdNatural(c).b];})]);
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:30e6});if(run.status!==0)throw new Error(`Native bird natural animation: ${run.status}: ${run.signal}: ${run.stderr}`);let at=4;
 for(const c of cases){const length=16+BIRD_NATURAL_TRACE_BYTES+BIRD_NATURAL_ARENA_BYTES,native=run.stdout.subarray(at,at+length);at+=length;comparedBytes+=length;serviceCalls+=native.readUInt32LE(8)/6;const actual=evaluateBirdNatural(c);
  if(!actual.equals(native)){const differences=[];for(let i=0;i<length&&differences.length<20;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}rows.push({input:c,nativeSha256:sha(native)});
 }
 if(at!==run.stdout.length)throw new Error('Native bird natural stream differs');
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256,wholeBodies:3,cases:cases.length,comparedBytes,serviceCalls,scope:'Whole BirdV2 takeoff sequence consumer 0x1001a3980 with original Animation.FindSequence and IsSequenceValid children. Optional named-action lookup and PlaySequenceByIndex remain explicit previously evidenced animation services. Original AI state drives selection; this does not establish full AI update or automatic viewport motion.',failures};
fs.writeFileSync('docs/bird-natural-animation-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/bird-natural-animation-native.json.gz',gzipSync(JSON.stringify({executableSha256,cases:rows},(_key,v)=>typeof v==='number'&&!Number.isFinite(v)?String(v):v),{level:9}));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
