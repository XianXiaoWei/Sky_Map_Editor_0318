import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {addCloudParticle,emitModelCloudParticle,emitModelCloudPair,resetCloudParticleBarn,addCloudParticlePhysicsSphere,CLOUD_PARTICLE_BARN_BYTES} from '../src/core/cloud-particle-emission';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(sha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
let seed=318;const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32),signed=()=>Math.fround(random()*100-50);
const cases=Array.from({length:424},(_,i)=>({name:`emission-${i}`,kind:i<360?i%4:4,sphereCount:i<360?0:i%32,head:[0,1,1023,777][Math.floor(i/4)%4],count:[0,1,1022,1023,1024][Math.floor(i/16)%5],input:{position:Array.from({length:3},signed),velocity:i<20?[0,0,0]:Array.from({length:3},signed),speed:Math.fround(i<20?0:random()*20),value:Math.fround([0,.04,.05,.2,.5,1,2][Math.floor(i/4)%7])},sample:{available:i%7!==0,distance:Math.fround([-2,-1.5,-1.499999,-.5,0,.01,5][Math.floor(i/4)%7])},delta:Math.fround([0,.0001,1/60,.266][Math.floor(i/4)%4]),randoms:Array.from({length:16},()=>Math.floor(random()*2**31))}));
// Cover the exact zero-direction threshold and RAND_MAX -> float32 1.
for(let i=0;i<4;i++)cases[20+i].randoms=[...Array(3).fill(2**30),0x7fffffff,0x7fffffff,...Array(11).fill(0)];
for(const c of cases.filter(c=>c.kind===4)){const vector=Buffer.alloc(16);[signed(),signed(),signed(),0].forEach((v,i)=>vector.writeFloatLE(v,i*4));for(let i=0;i<4;i++)c.randoms[i]=vector.readUInt32LE(i*4);}
const storage=(c:typeof cases[number])=>{const b=Buffer.alloc(CLOUD_PARTICLE_BARN_BYTES,0xa5);b.writeUInt32LE(c.sphereCount,0xc820);b.writeUInt32LE(c.head,0xc824);b.writeUInt32LE(c.count,0xc828);return b;};
const input=Buffer.alloc(4+cases.length*(CLOUD_PARTICLE_BARN_BYTES+120));input.writeUInt32LE(cases.length);let at=4;
for(const c of cases){input.writeUInt32LE(c.kind,at);at+=4;storage(c).copy(input,at);at+=CLOUD_PARTICLE_BARN_BYTES;for(const v of [...c.input.position,1,...c.input.velocity,0,c.input.speed,c.input.value,c.sample.distance,c.delta]){input.writeFloatLE(v,at);at+=4;}input.writeUInt32LE(Number(c.sample.available),at);at+=4;for(const v of c.randoms){input.writeUInt32LE(v,at);at+=4;}}
if(at!==input.length)throw new Error('Emission input layout mismatch');
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-cloud-emission-'));let raw:Buffer;
try{const runner=path.join(temporary,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-cloud-particle-emission-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(String(build.stderr));const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:30e6,timeout:60000});if(run.status!==0)throw new Error(`${run.status}: ${run.stderr}`);raw=run.stdout;}finally{fs.rmSync(temporary,{recursive:true,force:true});}
if(raw.length!==4+cases.length*(CLOUD_PARTICLE_BARN_BYTES+20))throw new Error('Invalid emission output');
const execute=(c:typeof cases[number],powers?:number[])=>{
 const bytes=storage(c);let used=0,powUsed=0,value=c.input.value;
 const rng=()=>c.randoms[used++],math={pow:(b:number,e:number)=>powers?powers[powUsed++]:Math.fround(Math.pow(b,e))};
 if(c.kind===0)addCloudParticle(bytes,{...c.input,size:c.input.speed,opacityMult:c.input.value},rng);
 if(c.kind===1)emitModelCloudParticle(bytes,c.input,rng,math);
 if(c.kind===2)value=emitModelCloudPair(bytes,c.input,c.sample,c.delta,rng,math).value;
 if(c.kind===3)resetCloudParticleBarn(bytes);
 if(c.kind===4){const vector=Buffer.alloc(16);c.randoms.slice(0,4).forEach((v,i)=>vector.writeUInt32LE(v,i*4));addCloudParticlePhysicsSphere(bytes,{current:[...c.input.position,1],previous:[...c.input.velocity,0],radius:c.input.speed,vector:Array.from({length:4},(_,i)=>vector.readFloatLE(i*4))});}
 return {bytes,used,powUsed,value};
};
const rows=cases.map((c,i)=>{
 const start=4+i*(CLOUD_PARTICLE_BARN_BYTES+20),powers=[raw.readFloatLE(start+8),raw.readFloatLE(start+12)],native=raw.subarray(start+20,start+20+CLOUD_PARTICLE_BARN_BYTES),expectedValue=raw.readFloatLE(start+16),result=execute(c,powers),production=execute(c);
 const expectedUsed=raw.readUInt32LE(start),expectedPowUsed=raw.readUInt32LE(start+4),failures=[] as number[];
 for(let j=0;j<native.length;j++)if(result.bytes[j]!==native[j])failures.push(j);
 return {...c,powers,expectedUsed,expectedPowUsed,expectedValue,nativeHex:native.toString('hex'),passed:failures.length===0&&result.used===expectedUsed&&result.powUsed===expectedPowUsed&&Math.fround(result.value)===expectedValue,
  productionBitExact:production.bytes.equals(native),badBytes:failures.length,firstBadBytes:failures.slice(0,16)};
});
const report={passed:rows.every(r=>r.passed),cases:rows.length,executableSha256:sha256,productionLibmBitExact:rows.every(r=>r.productionBitExact),
 scope:'Complete original insertion 0x100228a30, physics-sphere append 0x1002289b0, OnLevelLoad reset 0x100225e90 and both complete model emission helpers 0x1001a1140/0x1001a1670 execute unchanged. Entire Barn snapshot, response value and exact RNG/pow call counts compared. Explicit source position/velocity/speed, distance query return/sample and 31-bit random stream; Linux powf captures isolate original float32 arithmetic. Full model animation/startup, Avatar automatic emission, native game RNG sequence, CloudBarn sampling/default environment, complete physics and game image parity excluded.',
 failures:rows.filter(r=>!r.passed).map(({nativeHex,...r})=>r)};
fs.writeFileSync('docs/cloud-particle-emission-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-particle-emission-native.json',JSON.stringify({scope:report.scope,cases:rows.filter((_,i)=>i<32||i===63||i===79||i>=360&&i<364||i===383).map(({passed,productionBitExact,badBytes,firstBadBytes,...r})=>r)})+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
