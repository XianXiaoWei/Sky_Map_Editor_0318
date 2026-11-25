import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {eventLoadCases,prepareEventLoad,evaluateEventLoad} from './environment-event-load-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=sha(fs.readFileSync(executable));
if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable SHA differs');
const cases=eventLoadCases(),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-environment-event-load-')),rows:unknown[]=[],failures:unknown[]=[];let comparedBytes=0,serviceCalls=0;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-environment-event-load-oracle.c','-o',runner,'-lm']);if(build.status!==0)throw new Error(build.stderr.toString());
 for(let start=0;start<cases.length;start+=128){
  const batch=cases.slice(start,start+128),header=Buffer.alloc(4);header.writeUInt32LE(batch.length);
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([header,...batch.map(c=>prepareEventLoad(c).packed())]),maxBuffer:40e6,timeout:60000});
  if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);const output=run.stdout;if(output.readUInt32LE(0)!==batch.length)throw new Error('Native count differs');let at=4;
  for(const c of batch){const calls=output.readUInt32LE(at+8),length=12+calls*96+65540,native=output.subarray(at,at+length);at+=length;serviceCalls+=calls;comparedBytes+=length;
   if(c.mode===9)c.sinfCalls=Array.from({length:calls},(_,i)=>12+i*96).filter(i=>native.readBigUInt64LE(i)===21n).map(i=>({input:Number(native.readBigUInt64LE(i+8)),result:Number(native.readBigUInt64LE(i+16))}));
   try{const actual=evaluateEventLoad(c);if(!actual.equals(native)){const differences=[];for(let i=0;i<Math.max(actual.length,native.length)&&differences.length<16;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({case:c,actualBytes:actual.length,nativeBytes:native.length,differences});}}
   catch(e){failures.push({case:c,error:String(e)});}rows.push({input:c,nativeSha256:sha(native)});
  }if(at!==output.length)throw new Error(`Invalid output length ${at}/${output.length}`);
  if(failures.length)break;
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
const scope='Whole normal SetEnvDefault.Update and SetEnvHull.Update, including unchanged native conversion bodies and Event.Start; full normal LevelMesh.Load and LevelMeshBarn.Load; FogVolume.Initialize, SetWind.Update including original SIMD W lanes and AddWind, SetRainParams.OnEnabled, SetOceanRender.Update and point-in-OBB; Rain.Update parameter prefix through 0x1005651e7 with existing-emitter service, native phase/transition/intensity and captured sinf bits. Later rain geometry/collision/audio and absent-emitter attachment are excluded. Original matrix, containment, AddWind and Event.Start execute unmodified. All selected live arena bytes and ordered service arguments compared. ResourceRef/resource/camera/registration/create/update are explicit services. Saved public fields of all 29 defaults, 4 hulls, 4 wind events, 13 rain events and 15 ocean events are real corpus inputs; trigger metadata, resource membership, camera predicate and loaded Model ownership are prepared. Full class construction, renderer and startup remain separate.';
const report={passed:!failures.length,executableSha256,cases:cases.length,comparedCases:rows.length,preparedCases:cases.filter(c=>!c.source).length,corpusCases:cases.filter(c=>c.source).length,comparedBytes,serviceCalls,scope,failures};
fs.writeFileSync('docs/environment-event-load-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/environment-event-load-native.json.gz',gzipSync(JSON.stringify({executableSha256,scope,cases:rows}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
