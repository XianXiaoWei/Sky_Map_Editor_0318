import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {evaluateFlowerVertexCase,flowerVertexCases} from './flower-vertices-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(sha(fs.readFileSync(executable))!==digest)throw new Error('Original executable SHA differs');
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-flower-vertices-')),runner=path.join(temp,'oracle'),input=path.join(temp,'input'),cases=flowerVertexCases(),header=Buffer.alloc(4);header.writeUInt32LE(cases.length);fs.writeFileSync(input,Buffer.concat([header,...cases]));
try{
 const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-mavx','tools/native-flower-vertices-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable,input],{maxBuffer:16e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);
 let cursor=0,comparedBytes=0;const rows:any[]=[],differences:any[]=[];
 for(const [i,config] of cases.entries()){
  const count=config.readUInt32LE(0),size=4+run.stdout.readUInt32LE(cursor)+count*33,native=run.stdout.subarray(cursor,cursor+size),actual=evaluateFlowerVertexCase(config);cursor+=size;comparedBytes+=native.length;
  const mismatches=[];for(let at=0;at<Math.max(actual.length,native.length)&&mismatches.length<8;at++)if(actual[at]!==native[at])mismatches.push({offset:at,actual:actual[at],native:native[at]});
  if(mismatches.length)differences.push({case:i,count,variant:i%12,actualBytes:actual.length,nativeBytes:native.length,mismatches});rows.push({configHex:config.toString('hex'),nativeSha256:sha(native)});
 }
 if(cursor!==run.stdout.length)throw new Error('Native flower oracle has trailing bytes');
 const report={passed:!differences.length,entry:'0x100350c40',executableSha256:digest,cases:cases.length,comparedBytes,scope:'Whole original flower candidate generation, shape/material eligibility, four vertical ground batches and exact 32-byte output vertices; collision/normal/light services explicitly captured. Not complete FlowerBarn/map acceptance.',differences};
 fs.writeFileSync('docs/flower-vertices-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/flower-vertices-native.json.gz',gzipSync(JSON.stringify({...report,cases:rows})));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
