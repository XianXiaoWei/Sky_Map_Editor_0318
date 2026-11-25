import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
import {darkstoneHierarchyCases,prepareDarkstoneHierarchy,evaluateDarkstoneHierarchy} from './darkstone-hierarchy-cases';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest=sha(fs.readFileSync(exe));
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable SHA differs');
const cases=darkstoneHierarchyCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-darkstone-hierarchy-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-darkstone-hierarchy-oracle.c','-o',runner]);
 if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=8){
  const batch=cases.slice(start,start+8),count=Buffer.alloc(4);count.writeUInt32LE(batch.length);
  const input=Buffer.concat([count,...batch.map(c=>prepareDarkstoneHierarchy(c).b)]);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:20e6});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  if(run.stdout.readUInt32LE()!==batch.length)throw new Error('Native case count differs');
  let at=4;
  for(const c of batch){
   const calls=run.stdout.readUInt32LE(at+8+0x60000),n=12+0x60000+calls*32,native=run.stdout.subarray(at,at+n);at+=n;
   comparedBytes+=n;serviceCalls+=calls;const actual=evaluateDarkstoneHierarchy(c);
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
const report={passed:!failures.length,executableSha256:digest,functions:{'Darkstone.BuildHierarchy':'0x10027ae30','Obb.Distance':'0x10078ce10'},cases:cases.length,comparedCases:rows.length,comparedBytes,serviceCalls,
 scope:'Original hierarchy CFG and original Obb distance arithmetic under QEMU. Four hierarchy call targets are redirected to an observer which executes the unchanged original distance leaf. Prepared mesh virtual transforms/OBBs and assertions are explicit services. All caller memory, pointer permutation, cursor, parent/child indices, capacity failures and call order/float32 distance bits are compared. Includes rotated/anisotropic/tiny/zero OBBs, overlap chains, separate sibling groups, disconnected suffixes, ties, ancestor traversal and callback mutations. SoulTrap loader has a composition entry using this actual hierarchy. Real Model initialization, native scene ownership, burning/propagation/reward/network/render/unload and complete classes remain pending.',failures};
fs.writeFileSync('docs/darkstone-hierarchy-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/darkstone-hierarchy-native.json.gz',gzipSync(JSON.stringify({executableSha256:digest,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
