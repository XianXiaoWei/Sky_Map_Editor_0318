import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import evidence from '../docs/object-effects-native.json';
import {effectCases,prepareEffectCase,evaluateEffectCase} from './object-effects-cases';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(sha(fs.readFileSync(exe))!==evidence.executableSha256)throw new Error('Original executable SHA differs');
const cases=effectCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-object-effects-')),rows:{input:typeof cases[number];nativeSha256:string}[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-object-effects-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=32){
  const batch=cases.slice(start,start+32),header=Buffer.alloc(4);header.writeUInt32LE(batch.length);
  const input=Buffer.concat([header,...batch.flatMap(c=>{const h=Buffer.alloc(8);h.writeUInt32LE(c.mode);h.writeUInt32LE(c.repeat??1,4);return [h,prepareEffectCase(c).b];})]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,maxBuffer:10e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native count differs');let at=4;
  for(const c of batch){const calls=run.stdout.readUInt32LE(at+8),n=20+calls*16+0x20000,native=run.stdout.subarray(at,at+n);at+=n;comparedBytes+=n;serviceCalls+=calls;
   const actual=evaluateEffectCase(c);if(!actual.equals(native)){const differences=[];for(let i=0;i<actual.length&&differences.length<12;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({input:c,differences});}
   rows.push({input:c,nativeSha256:sha(native)});
  }if(at!==run.stdout.length)throw new Error('Native stream length differs');if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256:evidence.executableSha256,cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,savedCandleTransforms:cases.filter(c=>c.transformHex).length,scope:evidence.scope,failures};
fs.writeFileSync('docs/object-effects-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/object-effects-native.json.gz',gzipSync(JSON.stringify({executableSha256:evidence.executableSha256,scope:evidence.scope,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
