import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {cloudParticlePackedInstances, stepCloudParticleLife, type CloudParticlePackSource} from '../src/core/cloud-particle-dynamic';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(sha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
let seed=318;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32),signed=()=>Math.fround(random()*200-100);
const cases=Array.from({length:240},(_,i)=>({
 name:`pack-${i}`,start:[0,1000,1023,513][i%4],time:Math.fround([0,1/60,4.999999,5,43200,-2.5][i%6]),
 camera:{eye:Array.from({length:3},signed),depthAxis:i%5===0?[0,0,1]:Array.from({length:3},signed)},
 particles:Array.from({length:[1,3,7,65,1024][i%5]},(_,j):CloudParticlePackSource=>{
  const position=Array.from({length:3},signed),edge=i<24&&j===0;
  return {position,previousPosition:position.map(v=>Math.fround(v+(i%7===0?0:signed()))),vector:Array.from({length:3},signed),
   size:edge?[0,.25,.65,12,-1,1e-40][i%6]:Math.fround(random()*20),
   life:edge?[0,.1/1.5,.35/1.5,1,-1,2][i%6]:Math.fround(random()*1.2),
   sizeReference:edge?0:Math.fround(random()*10),opacityMult:Math.fround(random()*2),phaseOffset:Math.fround(random()*2-1)};
 })}));
const input=Buffer.alloc(4+cases.reduce((n,c)=>n+36+c.particles.length*56,0));let at=0;
const u=(n:number)=>{input.writeUInt32LE(n,at);at+=4;},f=(n:number)=>{input.writeFloatLE(n,at);at+=4;};
u(cases.length);for(const c of cases){u(c.particles.length);u(c.start);f(c.time);[...c.camera.eye,...c.camera.depthAxis].forEach(f);for(const p of c.particles)[...p.position,...p.previousPosition,...p.vector,p.size,p.life,p.sizeReference,p.opacityMult,p.phaseOffset].forEach(f);}
const lifeCases=Array.from({length:200},(_,i)=>({head:[0,1,990,1023][i%4],count:[0,1,2,32,33,65,1024][i%7],delta:Math.fround([0,.0001,1/60,.266,1.5][i%5]),life:Array.from({length:1024},(_,j)=>Math.fround(i<5?(j%3===0?0:j%3===1?-1:1):random()*2-1))}));
const lifeInput=Buffer.alloc(4+lifeCases.length*(12+4096));lifeInput.writeUInt32LE(lifeCases.length);let lifeAt=4;
for(const c of lifeCases){lifeInput.writeUInt32LE(c.count,lifeAt);lifeInput.writeUInt32LE(c.head,lifeAt+4);lifeInput.writeFloatLE(c.delta,lifeAt+8);lifeAt+=12;for(const v of c.life){lifeInput.writeFloatLE(v,lifeAt);lifeAt+=4;}}
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-cloud-particle-pack-'));let raw:Buffer,lifeRaw:Buffer;
try{
 const runner=path.join(temporary,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-cloud-particle-pack-oracle.c','-lm','-o',runner]);
 if(build.status!==0)throw new Error(String(build.stderr));
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:10e6,timeout:60000});
 if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);raw=run.stdout;
 const ageRun=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable,'age'],{input:lifeInput,maxBuffer:10e6,timeout:60000});
 if(ageRun.status!==0)throw new Error(`${ageRun.status}: ${ageRun.stderr}`);lifeRaw=ageRun.stdout;
}finally{fs.rmSync(temporary,{recursive:true,force:true});}
if(raw.length!==4+cases.reduce((n,c)=>n+c.particles.length*36,0)||raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid oracle output');
at=4;const rows=cases.map(c=>{
 const native=raw.subarray(at,at+c.particles.length*32);at+=native.length;
 const nativeDepths=raw.subarray(at,at+c.particles.length*4);at+=nativeDepths.length;
 const actual=cloudParticlePackedInstances(c.particles,c.camera,c.time,new Uint8Array(native.length).fill(0xa5));
 return {...c,passed:native.equals(Buffer.from(actual.instances))&&nativeDepths.equals(Buffer.from(actual.depths.buffer)),
  nativeHex:native.toString('hex'),actualHex:Buffer.from(actual.instances).toString('hex'),nativeDepthHex:nativeDepths.toString('hex'),actualDepthHex:Buffer.from(actual.depths.buffer).toString('hex')};
});
const report={passed:rows.every(r=>r.passed),cases:rows.length,particles:cases.reduce((n,c)=>n+c.particles.length,0),executableSha256:sha256,
 scope:'Unmodified original CloudParticleBarn packing instruction block 0x1002279f2..0x100227dd7 with explicit post-physics SoA/ring inputs, camera/time and Linux fmodf binding. Native 32-byte instance bytes and float32 depth keys checked exactly; byte +31 is unwritten and preserved as sentinel. Includes wrapping ring indices, 1024 capacity, zero sizes and opacity/life boundaries. Emission, full interaction physics, unstable depth sorting, original Mac libm, GPU and game image parity excluded.',
 failures:rows.filter(r=>!r.passed).map(({particles,...r})=>({...r,particles:particles.slice(0,1)}))};
fs.writeFileSync('docs/cloud-particle-pack-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-particle-pack-native.json',JSON.stringify({scope:report.scope,cases:rows.filter((_,i)=>i<24||i===238).map(({passed,actualHex,actualDepthHex,...r})=>r)})+'\n');
if(lifeRaw.length!==4+lifeCases.length*4104||lifeRaw.readUInt32LE(0)!==lifeCases.length)throw new Error('Invalid life oracle output');
const lifeRows=lifeCases.map((c,i)=>{
 const native=lifeRaw.subarray(4+i*4104,4+(i+1)*4104),result=stepCloudParticleLife({...c,life:Float32Array.from(c.life)},c.delta),actual=Buffer.alloc(4104);
 actual.writeUInt32LE(result.head);actual.writeUInt32LE(result.count,4);Buffer.from(result.life.buffer).copy(actual,8);
 return {...c,nativeHex:native.toString('hex'),passed:native.equals(actual)};
});
const lifeReport={passed:lifeRows.every(r=>r.passed),cases:lifeRows.length,executableSha256:sha256,scope:'Original unmodified CloudParticleBarn lifetime instruction block 0x10022660f..0x1002266f5 and vectorized branch 0x100227f04..0x1002280ca, with explicit scaled delta and SoA ring. Full 1024 life values and resulting head/count compared byte-for-byte. Native behavior counts all negative slots and advances head; emission and full physics excluded.',failures:lifeRows.filter(r=>!r.passed)};
fs.writeFileSync('docs/cloud-particle-life-oracle.json',JSON.stringify(lifeReport,null,2)+'\n');
if(lifeReport.passed)fs.writeFileSync('tests/fixtures/cloud-particle-life-native.json',JSON.stringify({scope:lifeReport.scope,cases:lifeRows.filter((_,i)=>i<14||i===198).map(({passed,...r})=>r)})+'\n');
console.log(JSON.stringify({packing:report,life:lifeReport}));if(!report.passed||!lifeReport.passed)process.exitCode=1;
