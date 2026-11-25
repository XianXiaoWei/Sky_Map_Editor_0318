import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {darkstoneInitializeCases,prepareDarkstoneInitialize,evaluateDarkstoneInitialize} from './darkstone-initialize-cases';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest=sha(fs.readFileSync(exe));
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable SHA differs');
const cases=darkstoneInitializeCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-darkstone-initialize-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-darkstone-initialize-oracle.c','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=8){
  const batch=cases.slice(start,start+8),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const input=Buffer.concat([count,...batch.map(c=>prepareDarkstoneInitialize(c).b)]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native case count differs');
  let at=4;
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+0x60000),n=4+0x60000+calls*96,native=run.stdout.subarray(at,at+n);at+=n;
   comparedBytes+=n;serviceCalls+=calls;const actual=evaluateDarkstoneInitialize(c);
   if(!actual.equals(native)){
    const differences=[];for(let i=0;i<Math.max(n,actual.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});
    failures.push({input:c,differences,actualBytes:actual.length,nativeBytes:n});
   }
   rows.push({input:c,nativeSha256:sha(native)});
  }
  if(at!==run.stdout.length)throw new Error('Native stream differs');
  if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const report={passed:!failures.length,executableSha256:digest,functions:{'Darkstone.Initialize':'0x10027a7c0','Obb.Transform':'0x100076df0','Matrix.NormalizeScale':'0x10078a070'},cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,
 scope:'Whole original ordinary Darkstone.Initialize through return, including original matrix product and basis normalization. Mesh transform/local OBB/GUID, global color snapshots, rand, immutable short-string material setters and strcmp are explicit services. Full caller memory, preserved SIMD W/padding, GUID, hierarchy/reward/burn fields, float32 random intervals, original texture/vector/enabled calls and callback reloading order compared under QEMU. Real Model/material construction, const-string mutation/unwind, burning Update/propagation/network/live viewport and complete classes remain pending.',failures};
fs.writeFileSync('docs/darkstone-initialize-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/darkstone-initialize-native.json.gz',gzipSync(JSON.stringify({executableSha256:digest,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
