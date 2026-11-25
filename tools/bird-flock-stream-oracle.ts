import fs from 'node:fs';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {BirdFlockStream,birdFlockSectionQuaternion,type BirdFlockSection} from '../src/core/bird-flock-stream';
import {gzipSync} from 'node:zlib';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(crypto.createHash('sha256').update(fs.readFileSync(exe)).digest('hex')!==executableSha256)throw new Error('Original executable SHA differs');
const runner='/tmp/sky-flock-stream-oracle',built=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-bird-flock-stream-oracle.c','-o',runner,'-lm']);if(built.status!==0)throw new Error(built.stderr.toString());
const cases:{name:string;stream:BirdFlockStream;seed:()=>number;delta:number}[]=[];
for(const looped of [false,true])for(const speed of [0,4,70])for(const enabled of [false,true])for(const delta of [0,.016,.266,1]){
 let seed=0x12345678;const sections:BirdFlockSection[]=Array.from({length:6},(_,i)=>({center:[Math.fround(Math.sin(i*.7)*8),Math.fround(i*.2),Math.fround(i*2),1],right:[2,0,0,0],up:[0,3,0,0],quaternion:new Int8Array([0,0,0,127])}));
 const stream=new BirdFlockStream(sections,looped,{maxInstances:8,spawnRate:23,travelSpeed:speed,spinScalar:.6,enabled},{sincos:a=>[Math.fround(Math.sin(a)),Math.fround(Math.cos(a))],random:()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;}});
 // Seed a valid original record with a short segment to exercise crossings,
 // half offset conversion and removal; other cases start from an empty pool.
 if(enabled){stream.step(.15);}else{stream.count=1;for(const [i,n] of [0,0,0,17,0,0,1,.1].entries())stream.view.setFloat32(i*4,n,true);stream.view.setUint16(32,0x3800,true);stream.view.setUint16(34,0xb400,true);stream.view.setUint16(36,3,true);}
 cases.push({name:`loop=${looped},speed=${speed},enabled=${enabled},dt=${delta}`,stream,seed:()=>seed,delta});
}
for(const looped of [false,true])for(const speed of [4,70,1000])for(const enabled of [false,true])for(const spawnRate of [0,1,23])for(const delta of [.0001,.266]){
 let seed=0x87654321;const sections:BirdFlockSection[]=Array.from({length:6},(_,i)=>({center:[Math.fround(Math.sin(i*.7)*8),Math.fround(i*.2),Math.fround(i*2),1],right:[2,.1,0,0],up:[0,3,.2,0],quaternion:new Int8Array([0,0,0,127])}));
 const stream=new BirdFlockStream(sections,looped,{maxInstances:8,spawnRate,travelSpeed:speed,spinScalar:.6,enabled,prepopulate:true},{sincos:a=>[Math.fround(Math.sin(a)),Math.fround(Math.cos(a))],random:()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;}});
 cases.push({name:`prepopulate,loop=${looped},speed=${speed},rate=${spawnRate},enabled=${enabled},dt=${delta}`,stream,seed:()=>seed,delta});
}
const inputs:Buffer[]=[],expected:Buffer[]=[],header=Buffer.alloc(4);header.writeUInt32LE(cases.length);inputs.push(header);
for(const c of cases){const s=c.stream,b=Buffer.alloc(52),sec=Buffer.alloc(s.sections.length*64);b.writeUInt32LE(s.settings.maxInstances);for(const [i,n] of [s.settings.spawnRate,s.settings.travelSpeed,s.settings.spinScalar].entries())b.writeFloatLE(n,4+i*4);b.writeUInt32LE(Number(s.settings.enabled),16);b.writeUInt32LE(Number(s.looped),20);b.writeFloatLE(c.delta,24);b.writeUInt32LE(s.count,28);b.writeFloatLE(s.accumulator,32);b.writeUInt32LE(c.seed(),36);b.writeUInt32LE(s.sections.length,40);b.writeUInt32LE(Number(s.settings.prepopulate??false),44);
 let total=0;for(let i=0;i<s.sections.length-(s.looped?0:1);i++){const d=s.sections[(i+1)%s.sections.length].center.map((v,k)=>Math.fround(v-s.sections[i].center[k])),q=d.map(v=>Math.fround(v*v));total=Math.fround(total+Math.fround(Math.sqrt(Math.fround(q[2]+Math.fround(q[0]+q[1])))));}b.writeFloatLE(total,48);
 s.sections.forEach((p,i)=>{[p.center,p.right,p.up].forEach((v,j)=>v.forEach((n,k)=>sec.writeFloatLE(n,i*64+j*16+k*4)));sec.set(new Uint8Array(p.quaternion.buffer),i*64+48);});inputs.push(b,sec,Buffer.from(s.records));s.step(c.delta);
 const out=Buffer.alloc(12);out.writeUInt32LE(s.count);out.writeFloatLE(s.accumulator,4);out.writeUInt32LE(c.seed(),8);expected.push(Buffer.concat([out,Buffer.from(s.records)]));
}
const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input:Buffer.concat(inputs),maxBuffer:10e6,timeout:60000});if(run.status!==0)throw new Error(`Native run ${run.status}: ${run.signal}: ${run.stderr}`);
let at=4;const failures:unknown[]=[];for(let i=0;i<cases.length;i++){const e=expected[i],native=run.stdout.subarray(at,at+e.length);at+=e.length;if(!e.equals(native)){const differences=[];for(let k=0;k<e.length&&differences.length<12;k++)if(e[k]!==native[k])differences.push({at:k,actual:e[k],native:native[k]});failures.push({case:cases[i].name,differences});}}
const qInputs=[Buffer.from([1,0,0,0])],qb=Buffer.alloc(52),qs=Buffer.alloc(15*64);qb.writeUInt32LE(8);qb.writeUInt32LE(15,40);
for(let i=0;i<15;i++){qs.writeFloatLE(Math.fround(Math.sin(i*.43)*9),i*64);qs.writeFloatLE(Math.fround(Math.cos(i*.72)*4),i*64+4);qs.writeFloatLE(Math.fround(Math.sin(i*.31)*14),i*64+8);qs.writeFloatLE(1,i*64+12);qs.writeFloatLE(2,i*64+16);qs.writeFloatLE(3,i*64+36);}
qInputs.push(qb,qs,Buffer.alloc(8*48));const qrun=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe,'--sections'],{input:Buffer.concat(qInputs),timeout:60000,maxBuffer:1e6});if(qrun.status!==0)throw new Error(`Native section run ${qrun.status}: ${qrun.signal}: ${qrun.stderr}`);
const qNative=qrun.stdout.subarray(4+12+8*48),quaternions:unknown[]=[];
for(let i=0;i<15;i++){const direction=[0,1,2,3].map(k=>Math.fround(qs.readFloatLE((i+1)%15*64+k*4)-qs.readFloatLE(i*64+k*4))),actual=Buffer.from(birdFlockSectionQuaternion(direction)),native=qNative.subarray(i*64+48,i*64+52);if(!actual.equals(native))failures.push({quaternion:i,actual:[...actual],native:[...native]});quaternions.push({direction,native:[...native]});}
const report={passed:failures.length===0,cases:cases.length,quaternions:15,comparedBytes:expected.reduce((n,b)=>n+b.length,0)+60,executableSha256,scope:'Original cached BirdFlock.Update ordinary movement/spawn, prepopulation and unbranched section quaternion instructions. Original half tables and removal writes retained. Avatar interaction and final audio/event branches excluded explicitly; Only ostream warnings excluded from prepopulation; native count/capacity/spacing retained. Rail transform callback, platform sincos and GPU ownership are not covered.',failures};fs.writeFileSync('docs/bird-flock-stream-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/bird-flock-stream-native.json.gz',gzipSync(JSON.stringify({executableSha256,cases:cases.map((c,i)=>({name:c.name,header:inputs[i*3+1].toString('hex'),sections:inputs[i*3+2].toString('hex'),records:inputs[i*3+3].toString('hex'),native:expected[i].toString('hex')})),quaternions}),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
