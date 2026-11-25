import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {stepCloudParticlePhysics,type CloudParticlePhysicsInput} from '../src/core/cloud-particle-physics';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(sha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
let seed=318;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32),signed=()=>Math.fround(random()*40-20),v3=()=>Array.from({length:3},signed);
const cases=Array.from({length:400},(_,i)=>{
 const direction=v3(),n=Math.hypot(...direction);
 const input:CloudParticlePhysicsInput={position:v3(),velocity:v3(),speed:Math.fround(random()*20),size:Math.fround(random()*8),delta:Math.fround([.0001,1/60,.1,.266][i%4]),
  forceVelocity:v3(),forceVector:v3(),minimumDistance:Math.fround([0,1,2.5,10,3.4028234663852886e38][i%5]),sphere:{previous:v3(),current:v3(),velocity:v3(),direction:direction.map(v=>Math.fround(v/n)),weight:Math.fround(random())}};
 if(i<20){input.position=[0,0,0];input.velocity=[0,0,0];input.forceVelocity=[0,0,0];input.forceVector=[0,0,0];input.sphere={previous:[0,0,0],current:[0,0,0],velocity:[0,0,0],direction:[0,1,0],weight:0};}
 if(i===20){input.velocity=[0,.0009999,0];input.forceVelocity=[0,0,0];}
 if(i===21){input.velocity=[0,.0010001,0];input.forceVelocity=[0,0,0];}
 return {name:`physics-${i}`,input};
});
const encoded=Buffer.alloc(4+cases.length*192);encoded.writeUInt32LE(cases.length);let at=4;
for(const {input:c} of cases){const values=[...c.position,0,...c.velocity,0,c.speed,c.size,c.delta,0,0,0,0,0,...c.forceVelocity,0,...c.forceVector,0,c.minimumDistance,0,0,0,...c.sphere.previous,0,...c.sphere.current,0,...c.sphere.velocity,0,...c.sphere.direction,0,c.sphere.weight,0,0,0];if(values.length!==48)throw new Error('Physics input layout mismatch');for(const v of values){encoded.writeFloatLE(v,at);at+=4;}}
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-cloud-physics-'));let raw:Buffer;
try{const runner=path.join(temporary,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-cloud-particle-physics-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(String(build.stderr));const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:encoded,maxBuffer:1e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);raw=run.stdout;}finally{fs.rmSync(temporary,{recursive:true,force:true});}
if(raw.length!==4+cases.length*52)throw new Error('Invalid physics output');
const pack=(r:ReturnType<typeof stepCloudParticlePhysics>)=>{const b=Buffer.alloc(44);[...r.position,...r.velocity,r.speed,r.size,...r.vector].forEach((v,j)=>b.writeFloatLE(v,j*4));return b;};
const rows=cases.map((c,i)=>{
 const start=4+i*52,powers=[raw.readFloatLE(start),raw.readFloatLE(start+4)],native=raw.subarray(start+8,start+52);let used=0;
 const actual=pack(stepCloudParticlePhysics(c.input,{exp:()=>powers[used++]})),production=pack(stepCloudParticlePhysics(c.input));
 const mismatch=[] as number[];for(let j=0;j<44;j++)if(actual[j]!==native[j])mismatch.push(j);
 return {...c,powers,nativeHex:native.toString('hex'),actualHex:actual.toString('hex'),passed:native.equals(actual),productionBitExact:native.equals(production),mismatch};
});
const report={passed:rows.every(r=>r.passed),cases:rows.length,executableSha256:sha256,productionLibmBitExact:rows.every(r=>r.productionBitExact),
 scope:'Unmodified original CloudParticleBarn exponential-weight instructions 0x100226839..0x1002268db and integration block 0x10022757e..0x100227885. Explicit old particle/selected sphere and preceding interaction velocity/vector/minimum-distance; expf bound to Linux libm with captured return values. Position, remaining velocity, smoothed speed, size and packed-vector source compared byte-for-byte. Nearest-three selection/force production, Avatar/model automatic state, full Update and original Mac libm/GPU/game image parity excluded.',failures:rows.filter(r=>!r.passed)};
fs.writeFileSync('docs/cloud-particle-physics-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/cloud-particle-physics-native.json',JSON.stringify({scope:report.scope,cases:rows.filter((_,i)=>i<24||i>=100&&i<116).map(({actualHex,passed,productionBitExact,mismatch,...r})=>r)})+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
