import fs from 'node:fs';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {selectOriginalBirdNextTarget} from '../src/core/bird-target-runtime';
import {initializeOriginalCreatureSteering} from '../src/core/creature-steering-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';
import {collideOriginalCreatureMotion,updateOriginalBirdAvatarAvoidance} from '../src/core/creature-world-runtime';
export const BIRD_NEXT_TARGET_ARENA=0x440000000n;
export function evaluateBirdNextTarget(header:Buffer,input:Buffer){
 const b=Buffer.from(input),at=(p:bigint)=>Number(p-BIRD_NEXT_TARGET_ARENA);let seed=header.readUInt32LE(4);
 const m:ModelBakeMemory={bytes:(p,n)=>b.subarray(at(p),at(p)+n),read32:p=>b.readUInt32LE(at(p)),read64:p=>b.readBigUInt64LE(at(p)),write8:(p,n)=>{b[at(p)]=n&255;},write32:(p,n)=>b.writeUInt32LE(n>>>0,at(p)),write64:(p,n)=>b.writeBigUInt64LE(n,at(p)),string:()=>{throw new Error('unused');}};
 const counters={wander:header.readInt32LE(8),flock:header.readInt32LE(12),avoid:header.readInt32LE(16)},out=Buffer.alloc(24);let line=0,severity=0;
 const random=()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;};
 try{if(header.readUInt32LE(0)===3){const avatars=[];for(let i=0;i<16;i++)if(b[0x3040+i*128]){const p=at(m.read64(BIRD_NEXT_TARGET_ARENA+BigInt(0x3018+i*128)));avatars.push({current:b.subarray(p+16,p+32),previous:b.subarray(p+32,p+48)});}updateOriginalBirdAvatarAvoidance(m,BIRD_NEXT_TARGET_ARENA+0x1000n,b.subarray(0x2000,0x205c),BIRD_NEXT_TARGET_ARENA+0x2100n,b.readUInt32LE(0x5040),avatars);}
 else if(header.readUInt32LE(0)===2){const result=collideOriginalCreatureMotion(m,BIRD_NEXT_TARGET_ARENA+0x1000n,BIRD_NEXT_TARGET_ARENA+0x2000n,b.readUInt32LE(0x5040),BIRD_NEXT_TARGET_ARENA+0x2200n,{random,raycast:(_scene,origin,direction,maximum,mask)=>{b.set(origin,0x5100);b.set(direction,0x5110);b.writeUInt32LE(maximum,0x5120);b.writeUInt32LE(mask,0x5124);return {hit:!!b[0x5000],active:!!b[0x5001],position:b.subarray(0x5010,0x5020),normal:b.subarray(0x5020,0x5030)};}});b.set(result.velocity,0x2100);b[0x5008]=result.blocked;}
 else if(header.readUInt32LE(0))initializeOriginalCreatureSteering(m,BIRD_NEXT_TARGET_ARENA+0x1000n,BIRD_NEXT_TARGET_ARENA+0x2000n,BIRD_NEXT_TARGET_ARENA+0x2100n,BIRD_NEXT_TARGET_ARENA+0x2200n,counters);
 else selectOriginalBirdNextTarget(m,BIRD_NEXT_TARGET_ARENA+0x1000n,BIRD_NEXT_TARGET_ARENA+0x2000n,{random:()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;},castMarker:p=>p?p-8n:0n,enabled:p=>b[at(p)+64]});
 }catch(e){const failure=e as {line?:number;severity?:number};if(!failure.line)throw e;line=failure.line;severity=failure.severity??3;}
 b.fill(0,0x7000,0x7100);out.writeUInt32LE(line);out.writeUInt32LE(severity,4);out.writeUInt32LE(seed,8);[counters.wander,counters.flock,counters.avoid].forEach((v,i)=>out.writeUInt32LE(v>>>0,12+i*4));return Buffer.concat([out,b]);
}
async function main(){
 const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',executableSha256='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
 if(crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex')!==executableSha256)throw new Error('Original executable SHA differs');
 const cases:{name:string;header:Buffer;input:Buffer}[]=[];
 for(const leadCount of [0,4])for(const seekCount of [0,1,4])for(const landCount of [0,3])for(const mask of [0,0x55,0xff])for(const seed of [0,0x12345678,0xffffffff])for(const end of [false,true]){
  const header=Buffer.alloc(20),input=Buffer.alloc(0x8000),p=(at:number,n:number)=>input.writeBigUInt64LE(BIRD_NEXT_TARGET_ARENA+BigInt(n),at),clump=(at:number,first:number,count:number)=>{p(at+8,at+32);input.writeUInt32LE(count,at+16);for(let i=0;i<count;i++)p(at+32+i*8,0x3008+(first+i)*128);};header.writeUInt32LE(seed,4);
  input.fill(0x55,0x1000,0x1600);p(0x10e8,0x1800);p(0x2018,0x2100);[0,0,0,1].forEach((v,i)=>input.writeFloatLE(v,0x2110+i*4));
  for(let i=0;i<8;i++){const at=0x3000+i*128;p(at,0x7080);[i-2,(i%3)-1,1,1].forEach((v,k)=>input.writeFloatLE(v,at+16+k*4));[1,i+1,.5].forEach((v,k)=>input.writeFloatLE(v,at+48+k*4));input[at+64]=(mask>>i)&1;}
  if(leadCount){p(0x1830,0x4000);clump(0x4000,0,leadCount);}if(seekCount){p(0x1808,0x4100);clump(0x4100,0,seekCount);}if(landCount){p(0x1810,0x4200);clump(0x4200,4,landCount);}if(end)p(0x1838,0x3380);
  cases.push({name:`lead=${leadCount},seek=${seekCount},land=${landCount},mask=${mask},seed=${seed},end=${end}`,header,input});
 }
 for(const counter of [0,1,8,9,0x7fffffff,-1,-0x80000000]){const header=Buffer.alloc(20),input=Buffer.alloc(0x8000);header.writeUInt32LE(1);for(let i=0;i<3;i++)header.writeInt32LE(counter,8+i*4);input.fill(0xa5,0x1000,0x1400);cases.push({name:`steering counters=${counter}`,header,input});}
 for(const velocity of [[0,0,0],[0,0,4],[1,3,2]])for(const forward of [[0,0,0],[0,1,0],[0,0,2],[3,2,1]])for(const hit of [0,1,2])for(const lookahead of [.01,.5,3]){
  const header=Buffer.alloc(20),input=Buffer.alloc(0x8000);header.writeUInt32LE(2);header.writeUInt32LE(0x76543210,4);
  [2,3,4,0].forEach((v,k)=>input.writeFloatLE(v,0x1000+k*4));forward.forEach((v,k)=>input.writeFloatLE(v,0x1040+k*4));input.writeFloatLE(.5,0x1050);
  velocity.forEach((v,k)=>input.writeFloatLE(v,0x2000+k*4));input[0x5000]=Number(hit>0);input[0x5001]=Number(hit===2);input.writeFloatLE(lookahead,0x5040);
  [2.2,3.3,4.4,0].forEach((v,k)=>input.writeFloatLE(v,0x5010+k*4));[0,0,-1,0].forEach((v,k)=>input.writeFloatLE(v,0x5020+k*4));
  cases.push({name:`collision,v=${velocity},motion=${forward},hit=${hit},time=${lookahead}`,header,input});
 }
 for(const delta of [0,.0001,.001,.016,.266])for(const distance of [0,.1,.5,1,4])for(const speed of [0,1,8]){
  const header=Buffer.alloc(20),input=Buffer.alloc(0x8000);header.writeUInt32LE(3);input[0x1048]=1;input.writeFloatLE(8,0x2100);input.writeFloatLE(delta,0x5040);
  for(let i=0;i<16;i++){const avatar=0x3000+i*128,transform=0x4000+i*64;input.writeBigUInt64LE(BIRD_NEXT_TARGET_ARENA+BigInt(transform),avatar+24);input[avatar+64]=Number(i===0||i===5);[distance+i*.5,0,0,1].forEach((v,k)=>input.writeFloatLE(v,transform+16+k*4));[distance+i*.5-speed*delta,0,0,1].forEach((v,k)=>input.writeFloatLE(v,transform+32+k*4));}
  cases.push({name:`avatar avoidance,delta=${delta},distance=${distance},speed=${speed}`,header,input});
 }
 const runner='/tmp/sky-bird-next-target-oracle',build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-bird-next-target-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const count=Buffer.alloc(4);count.writeUInt32LE(cases.length);const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat([count,...cases.flatMap(c=>[c.header,c.input])]),timeout:60000,maxBuffer:60e6});if(run.status!==0)throw new Error(`Native target run ${run.status}: ${run.signal}: ${run.stderr}`);
 const failures:unknown[]=[],rows:unknown[]=[];let at=4;for(const c of cases){const actual=evaluateBirdNextTarget(c.header,c.input),native=run.stdout.subarray(at,at+actual.length);at+=actual.length;if(!actual.equals(native)){const differences=[];for(let i=0;i<actual.length&&differences.length<12;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({name:c.name,differences});}rows.push({name:c.name,header:c.header.toString('hex'),input:c.input.toString('hex'),native:native.toString('hex')});}
 if(at!==run.stdout.length)throw new Error('Oracle stream differs');
 const report={passed:!failures.length,cases:cases.length,comparedBytes:at-4,executableSha256,scope:'Whole ordinary BirdV2.SelectNextTarget, SteeringBehaviors.Initialize, Motion collision/avoidance and BirdV2Ai avatar avoidance. All arena writes, signed staggering counters and ray query inputs compared. Metadata cast, rand31 and scene ray intersection are explicit shared adapters; no complete BirdV2 AI acceptance claimed.',failures};fs.writeFileSync('docs/bird-next-target-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/bird-next-target-native.json.gz',gzipSync(JSON.stringify({executableSha256,cases:rows}),{level:9}));console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
}
if(process.argv[1]?.endsWith('bird-next-target-oracle.ts'))void main();
