import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {candleLoadCases,evaluateCandleLoadCase,candleOracleSpans} from './candle-load-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),digest='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(sha(fs.readFileSync(executable))!==digest)throw new Error('Original executable SHA differs');
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-candle-load-')),runner=path.join(temp,'oracle'),input=path.join(temp,'input'),cases=candleLoadCases(),header=Buffer.alloc(4);header.writeUInt32LE(cases.length);fs.writeFileSync(input,Buffer.concat([header,...cases.map(c=>c.arena)]));
try{
 const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','tools/native-candle-load-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const fd=fs.openSync(input,'r');let run;try{run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{stdio:[fd,'pipe','pipe'],maxBuffer:200e6,timeout:120000});}finally{fs.closeSync(fd);}
 if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);if(run.stdout.readUInt32LE(0)!==cases.length)throw new Error('Native case count differs');
 let cursor=4,comparedBytes=0,calls=0;const rows:any[]=[],differences:any[]=[],spanSize=candleOracleSpans.reduce((sum,[,n])=>sum+n,0);
 for(const [i,c] of cases.entries()){
  const count=run.stdout.readUInt32LE(cursor+8),size=20+count*640+spanSize,native=run.stdout.subarray(cursor,cursor+size),actual=evaluateCandleLoadCase(c.arena);cursor+=size;comparedBytes+=size;calls+=count;
  const mismatches=[];for(let at=0;at<Math.max(actual.length,native.length)&&mismatches.length<12;at++)if(actual[at]!==native[at]){
   let memoryOffset:undefined|string,left=at-20-count*640;if(left>=0)for(const [start,n] of candleOracleSpans){if(left<n){memoryOffset='0x'+(start+left).toString(16);break;}left-=n;}
   mismatches.push({offset:at,memoryOffset,actual:actual[at],native:native[at]});
  }
  if(mismatches.length)differences.push({case:i,name:c.name,actualBytes:actual.length,nativeBytes:native.length,mismatches});rows.push({name:c.name,nativeSha256:sha(native),line:native.readUInt32LE(0),severity:native.readUInt32LE(4),calls:count});
 }
 if(cursor!==run.stdout.length)throw new Error('Native Candle output has trailing bytes');
 const report={passed:!differences.length,entries:['0x1001e9320','0x1001eab70','0x1001eaf00','0x1001e9ba0','0x1001eb190','0x1001ea220','0x10033abc0','0x10033a760','0x10033a780','0x10033b460','0x10033afa0','0x10033b350','0x1001e99c0','0x10033c010 (motion/light prefix only)'],executableSha256:digest,cases:cases.length,comparedBytes,calls,scope:'Whole Flame.Unload and CandleBarn.OnLevelUnload with explicit identity/stop/Vertex services; original Flame.Update prefix motion/light (native jump to original epilogue before interaction/audio remainder, explicit expf/powf returns); whole Flame.Load (including already-loaded skip, original local matrix, two rand calls, audio handle and transform/intensity resets), composed CandleBarn/Flame load, CandleBarn level load/CreateCandle, live Candle and Flame aliasing transforms, whole normal game Update with consumption/vertical shrink/burnout/Flame synchronization, single/multiple frames, identifier ignition/effects/network ordering and whole Render pool/range/frustum/Visibility/light/shader parameter/commit. Explicit prepared owner/pool/resources, camera/allocator/Visibility/GPU render, ground, macOS libm-return, audio/effect/network services; tool debug UI disabled, actual renderer owner not included.',differences};
 fs.writeFileSync('docs/candle-load-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/candle-load-native.json',JSON.stringify({...report,cases:rows},null,2)+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
