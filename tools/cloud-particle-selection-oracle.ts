import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {selectCloudParticleSources,type CloudParticleInteractionSource} from '../src/core/cloud-particle-selection';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(sha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
let seed=318;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32),signed=()=>Math.fround(random()*8-4);
const cases:{name:string;position:number[];sources:CloudParticleInteractionSource[]}[]=[];
for(let count=0;count<=48;count++)for(let mode=0;mode<12;mode++) {
 const position=mode<9?[0,0,0]:[signed(),signed(),signed()];
 const sources=Array.from({length:count},(_,j)=>{
  let xyz=[signed(),signed(),signed()],range8c=Math.fround(random()*4),range90=Math.fround(random()*2);
  if(mode<9){const value=[1,j*.0625,(count-j)*.0625,j%3*.5,j%2?5:.5,0,1.5,1.5000001192092896,1.4999998807907104][mode];xyz=[value,0,0];range8c=mode===4?1:10;range90=1;if(mode>=6)range8c=1;}
  return {previous:[...xyz,Math.fround(j*.25)],range8c,range90};
 });cases.push({name:`selection-${count}-${mode}`,position,sources});
}
for(const scale of [0,1,-1,1e-30,1e30])cases.push({name:`overflow-${scale}`,position:[0,0,0],sources:Array.from({length:48},(_,j)=>({previous:[j%2?3.4028234663852886e38:-3.4028234663852886e38,0,0,0],range8c:3.4028234663852886e38,range90:Math.fround(scale)}))});
const encoded=Buffer.alloc(4+cases.reduce((n,c)=>n+16+c.sources.length*24,0));encoded.writeUInt32LE(cases.length);let at=4;
for(const c of cases){encoded.writeUInt32LE(c.sources.length,at);at+=4;for(const v of [...c.position,...c.sources.flatMap(s=>[...s.previous,s.range8c,s.range90])]){encoded.writeFloatLE(v,at);at+=4;}}
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-cloud-selection-'));let raw:Buffer;
try{const runner=path.join(temporary,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-cloud-particle-selection-oracle.c','-o',runner]);if(build.status!==0)throw new Error(String(build.stderr));const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:encoded,maxBuffer:2e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);raw=run.stdout;}finally{fs.rmSync(temporary,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid selection output');at=4;
const rows=cases.map(c=>{
 const count=raw.readUInt32LE(at),selectedCount=raw.readUInt32LE(at+4);at+=8;if(count>48||selectedCount>3)throw new Error('Invalid candidate count');
 const native=raw.subarray(at,at+count*24);at+=count*24;const result=selectCloudParticleSources(c.position,c.sources),actual=Buffer.alloc(result.candidates.length*24);
 result.candidates.forEach((r,j)=>{actual.writeUInt32LE(r.sourceIndex,j*24);[...r.offset,r.distanceSquared].forEach((v,k)=>actual.writeFloatLE(v,j*24+4+k*4));});
 const stable=c.sources.map((s,sourceIndex)=>({s,sourceIndex})).filter(r=>result.candidates.some(v=>v.sourceIndex===r.sourceIndex)).sort((a,b)=>{
  const key=(index:number)=>result.candidates.find(r=>r.sourceIndex===index)!.distanceSquared;return key(a.sourceIndex)-key(b.sourceIndex);
 }).slice(0,3).map(r=>r.sourceIndex);
 return {...c,nativeHex:native.toString('hex'),selectedCount,passed:count===result.candidates.length&&selectedCount===result.selected.length&&native.equals(actual),stableOrderMatches:stable.every((v,j)=>v===result.selected[j].sourceIndex),actualHex:actual.toString('hex')};
});
if(at!==raw.length)throw new Error('Trailing selection output');
const report={passed:rows.every(r=>r.passed),cases:rows.length,executableSha256:sha256,stableSortDifferentCases:rows.filter(r=>!r.stableOrderMatches).length,
 scope:'Original source classification/compaction, nearest-three heap selection and heap sorting at 0x100226920..0x100226fc2. Explicit float32 particle XYZ and up to 48 original temporary sources (previous vec4 +0, range fields +0x8c/+0x90). Native count capture replays displaced original instructions; all selection/sort instructions execute unchanged. Entire accepted permutation, source indices, offset XYZW and squared-distance bytes compared. Avatar/queued source preparation, interaction forces, full Update/GPU/wind/game-image parity excluded.',failures:rows.filter(r=>!r.passed)};
fs.writeFileSync('docs/cloud-particle-selection-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/cloud-particle-selection-native.json',JSON.stringify({scope:report.scope,cases:rows.filter((_,i)=>i<60||i>=rows.length-29).map(({passed,stableOrderMatches,actualHex,...r})=>r)})+'\n');console.log(JSON.stringify({...report,failures:report.failures.slice(0,3)}));if(!report.passed)process.exitCode=1;
