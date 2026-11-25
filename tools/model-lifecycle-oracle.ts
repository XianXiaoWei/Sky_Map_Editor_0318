import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {modelLifecycleCases,prepareModelLifecycle,evaluateModelLifecycle} from './model-lifecycle-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=sha(fs.readFileSync(executable));
if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable SHA differs');
const cases=modelLifecycleCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-model-lifecycle-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-model-lifecycle-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=128){
  const batch=cases.slice(start,start+128),header=Buffer.alloc(4);header.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([header,...batch.map(c=>prepareModelLifecycle(c).packed())]),maxBuffer:40e6,timeout:60000});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);const output=run.stdout;if(output.readUInt32LE(0)!==batch.length)throw new Error('Native count differs');let at=4;
  for(const c of batch){const calls=output.readUInt32LE(at+8),length=12+calls*64+65624,native=output.subarray(at,at+length);at+=length;serviceCalls+=calls;comparedBytes+=length;
   try{const actual=evaluateModelLifecycle(c);if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(actual.length,native.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({case:c,actualBytes:actual.length,nativeBytes:native.length,differences});}}
   catch(e){failures.push({case:c,error:String(e)});}rows.push({input:c,nativeSha256:sha(native)});
  }if(at!==output.length)throw new Error(`Invalid output length ${at}/${output.length}`);
  if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const scope='Complete unchanged normal Model destructor 0x100469eb0 and ModelBarn same-slot recreation 0x10046ce50 / 0x10046d010. All selected live arena bytes and ordered callbacks independently compared, including null owners, live counts/tables/heaps, signed GUID, preserved unbaked stack dword and full 184-byte constructor ABI. Vertex/GPU/allocator/animation/collision are explicit services; full Model constructor is captured, not restored. Map names/mesh names/GUIDs are prepared inputs; LOD/ownership are prepared, not real loaded scenes. Factory, full startup, native animation, scene rendering and complete class lifecycle remain open.';
const report={passed:!failures.length,executableSha256,cases:cases.length,comparedCases:rows.length,preparedCases:cases.filter(c=>!c.source).length,corpusCases:cases.filter(c=>c.source).length,comparedBytes,serviceCalls,scope,failures};
fs.writeFileSync('docs/model-lifecycle-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/model-lifecycle-native.json.gz',gzipSync(JSON.stringify({executableSha256,scope,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
