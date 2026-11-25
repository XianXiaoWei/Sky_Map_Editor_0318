import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import zlib from 'node:zlib';import assert from 'node:assert/strict';import {spawnSync} from 'node:child_process';
import {evaluateModelParameter,MODEL_PARAMETER_BASE as base,type ModelParameterCase} from './model-parameter-evaluate';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');assert.equal(sha,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases:ModelParameterCase[]=[];
function str(b:Buffer,at:number,name:string,long=false){const data=Buffer.from(name);b.fill(0,at,at+24);if(data.length>22||long){b.writeBigUInt64LE(65n,at);b.writeBigUInt64LE(BigInt(data.length),at+8);b.writeBigUInt64LE(base+BigInt(at+0x400),at+16);data.copy(b,at+0x400);b[at+0x400+data.length]=0;}else{b[at]=data.length*2;data.copy(b,at+1);}}
function add(name:string,actions:number[][],prepare?:(b:Buffer)=>void,config=[7,1,0]){
 const b=Buffer.alloc(65536);for(let i=0;i<b.length;i++)b[i]=(i*17+cases.length*23)&255;
 b[0xa30]=0;b[0xa32]=0;b.writeUInt32LE(1,0x220);b.writeBigUInt64LE(base+0x2000n,0x228);
 for(let i=0;i<16;i++){const p=0x230+i*0x80;b.writeBigUInt64LE(base+BigInt(p),0x1a0+i*8);str(b,p+8,i?'unused'+i:'u_value');str(b,p+0x40,'White');b.writeUInt32LE(0,p+0x20);b.writeUInt32LE(1,p+0x58);b.writeUInt32LE(0xffffffff,p+0x5c);b.writeUInt32LE(0,p+0x70);b.writeUInt32LE(0,p+0x74);b[p+0x78]=0;
 for(let j=0;j<4;j++){b.writeUInt32LE(bits(j+2),p+0x30+j*4);b.writeUInt32LE(bits(j-1),p+0x60+j*4);}}
 b.writeBigUInt64LE(base+0x2800n,0x2008);b.writeUInt32LE(3,0x208c);for(let pass=0;pass<3;pass++){const table=0x2900+pass*0x40;b.writeBigUInt64LE(base+BigInt(table),0x2028+pass*8);for(let i=0;i<3;i++)b.writeBigUInt64LE(base+BigInt(0x4000+i*0x1000),table+i*8);}
 for(let i=0;i<3;i++){b.writeBigUInt64LE(base+BigInt(0x3000+i*0x100),0x2800+i*8);b[0x3014+i*0x100]=1;b[0x4538+i*0x1000]=1;}
 b.writeBigUInt64LE(base+0xc400n,0xc310);b.writeBigUInt64LE(base+0xc020n,0xc008);b.fill(0,0xe100,0xe108);
 str(b,0xa000,'u_value');str(b,0xa040,'Black');for(let i=0;i<4;i++)b.writeUInt32LE(bits(i*.25),0xa080+i*4);
 prepare?.(b);cases.push({name,config,actions:actions.map(a=>[...a,...Array(6-a.length).fill(0)]),memory:b.toString('hex')});
}
for(const type of [0,1])for(const duration of [0,-1,.5,2])for(const elapsed of [0,.25,1,3]){
 const action=type===0?[0,2,0xa000,0,bits(8),bits(.75)]:[1,2,0xa000,0xa080,0,bits(.75)];
 add(`retarget ${type}/${duration}/${elapsed}`,[action,[3,0,0,0,bits(.25)],[3,0,0,0,bits(.25)],[3,0,0,0,bits(1)],[3,0,0,0,bits(1)]],b=>{b.writeUInt32LE(type,0x250);b.writeUInt32LE(bits(duration),0x2a4);b.writeUInt32LE(bits(elapsed),0x2a0);});
}
for(const type of [0,1,2])for(const length of [0,1,22,23,27,28])for(const long of [false,true])add(`new parameter ${type}/${length}/${long}`,[[type,2,0xa000,0xa080,bits(3),bits(.5)],[3,0,0,0,bits(.5)]],b=>{b.writeUInt32LE(0,0x220);str(b,0xa000,'p'.repeat(length),long);str(b,0xa080,'tex'.repeat(type===2?9:0));});
for(const length of [0,22,23,27,28])for(const existing of [false,true])for(const found of [0,1])add(`texture ${length}/${existing}/${found}`,[[2,2,0xa000,0xa040],[3],[3]],b=>{b.writeUInt32LE(existing?1:0,0x220);b.writeUInt32LE(2,0x250);str(b,0xa040,'t'.repeat(length));},[7,found,0]);
for(const type of [0,1,2])for(const mutation of [0,1,2,3])for(const mask of [0,1,2,5,7])add(`LOD readiness/type/count callback ${type}/${mutation}/${mask}`,[[type,0,0xa000,0xa080,bits(5),bits(1)],[3,0,0,0,bits(.5)]],b=>{b.writeUInt32LE(type,0x250);if(type===2)str(b,0xa080,'White');for(let i=0;i<3;i++)b[0x3014+i*0x100]=(mask>>i)&1;},[7,1,mutation]);
for(const type of [0,1,2])for(const count of [0,1,16])add(`lookup same-name/type assertion ${type}/${count}`,[[4,2,0xa000,0,type]],b=>b.writeUInt32LE(count,0x220));
add('capacity assertion after full strcmp scan',[[4,2,0xa000,0,0]],b=>{b.writeUInt32LE(16,0x220);str(b,0xa000,'new');});
add('embedded NUL compares by strcmp but stores sized string',[[4,2,0xa000,0,0]],b=>str(b,0xa000,'u_value\0tail'));
add('new embedded NUL name assignment retains length',[[4,2,0xa000,0,0]],b=>{b.writeUInt32LE(0,0x220);str(b,0xa000,'new\0tail');});
for(const target of [0x260,0x290])add(`vector aliases ${target.toString(16)}`,[[1,2,0xa000,target,0,bits(1)],[3,0,0,0,bits(.5)]],b=>{b.writeUInt32LE(1,0x250);b.writeUInt32LE(bits(1),0x2a4);b.writeUInt32LE(bits(.5),0x2a0);});
add('texture self assignment',[[2,2,0xa000,0x270],[3]],b=>b.writeUInt32LE(2,0x250));
add('new name self assignment retains name but initializes type/pass/cache',[[4,2,0x238,0,1]],b=>b.writeUInt32LE(0,0x220));
for(const n of [0x80000000,0x7f800000,0xff800000,0x7fc12345,0x7f812345])for(const type of [0,1])add(`arithmetic bits ${n}/${type}`,[[type,1,0xa000,0xa080,n,n],[3,0,0,0,n]],b=>{b.writeUInt32LE(type,0x250);b.writeUInt32LE(n,0x2a0);b.writeUInt32LE(n,0x2a4);b.writeUInt32LE(n,0x260);b.writeUInt32LE(n,0x290);b.writeUInt32LE(n,0xa080);});
for(const op of [5,6,7,8])add(`Model readiness assertion ${op}`,[[op,1,op===8?0xa001:7,0xa080,bits(1)]],b=>b[0x4538]=0);
add('Model lookup null table assertion',[[8,1,0xa001]],b=>b.writeBigUInt64LE(0n,0x2030));
add('invalid parameter valueType assertion after timer mutation',[[3,0,0,0,bits(.25)]],b=>{b[0xa32]=1;b[0x2a8]=1;b.writeUInt32LE(7,0x250);b.writeUInt32LE(7,0x28c);});
add('texture resource with null loaded data binds null',[[2,1,0xa000,0xa040],[3]],b=>{b.writeUInt32LE(2,0x250);b.writeBigUInt64LE(0n,0xc310);});
for(const mutation of [0,2,3])add(`multiple active/clean parameters callback ${mutation}`,[[3,0,0,0,bits(.25)],[3,0,0,0,bits(1)]],b=>{
 b.writeUInt32LE(5,0x220);b[0xa32]=1;for(let i=0;i<5;i++){const p=0x230+i*0x80;b[p+0x78]=i===2?0:1;b.writeUInt32LE(i===3?2:i%2,p+0x20);b.writeUInt32LE(bits(.5),p+0x74);}
},[7,1,mutation]);
let seed=0x183419;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
for(let i=0;i<128;i++){const type=i%2,randomValue=()=>bits((random()/0x100000000-.5)*10**(i%8-4)),target=randomValue(),duration=bits(random()/0x100000000*2),dt=bits(random()/0x100000000),elapsed=bits(random()/0x100000000*2);
 add(`seeded float32 interpolation ${i}`,[[type,2,0xa000,0xa080,target,duration],[3,0,0,0,dt],[3,0,0,0,dt]],b=>{b.writeUInt32LE(type,0x250);b.writeUInt32LE(elapsed,0x2a0);b.writeUInt32LE(duration,0x2a4);for(let j=0;j<4;j++){b.writeUInt32LE(randomValue(),0x260+j*4);b.writeUInt32LE(randomValue(),0x290+j*4);b.writeUInt32LE(randomValue(),0xa080+j*4);}});
}
const input=Buffer.concat([Buffer.from(Uint32Array.of(cases.length).buffer),...cases.map(c=>Buffer.concat([Buffer.from(Uint32Array.from([...c.config,c.actions.length,...c.actions.flat()]).buffer),Buffer.from(c.memory,'hex')]))]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-model-param-'));let output:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-model-parameter-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,timeout:60000,maxBuffer:120e6});if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);output=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=4;assert.equal(output.readUInt32LE(0),cases.length);const u32=()=>{const n=output.readUInt32LE(at);at+=4;return n;};const rows=cases.map(input=>{const native=input.actions.map(()=>{const line=u32(),severity=u32(),result=u32(),n=u32(),events=Array.from({length:n},()=>Array.from({length:8},u32)),memory=output.subarray(at,at+65536).toString('hex');at+=65536;return {line,severity,result,events,memory};});const actual=evaluateModelParameter(input);for(let i=0;i<native.length;i++){const a=actual[i],e=native[i];assert.deepEqual({...a,memory:undefined},{...e,memory:undefined},input.name+` action ${i}`);const ab=Buffer.from(a.memory,'hex'),eb=Buffer.from(e.memory,'hex'),bad=ab.findIndex((n,j)=>n!==eb[j]);assert.equal(bad,-1,`${input.name} action ${i} byte 0x${bad.toString(16)}: actual ${ab[bad]} native ${eb[bad]}`);}return {input,native};});assert.equal(at,output.length);
const report={passed:true,executableSha256:sha,cases:cases.length,snapshots:rows.reduce((n,r)=>n+r.native.length,0),comparedBytes:output.length-4,scope:'Whole original LevelMesh parameter find/float/vector/texture setters; valid-uniform normal update path and original Model-to-ready-LOD forwarding, default MXCSR. Full byte snapshots, retarget/timer/alias/assertion ordering and explicit Vertex/resource/pool callbacks. Hot reload, invalid-uniform stream/removal, resource/ref implementation, Metal/GPU allocator and full constructors are not restored.'};fs.writeFileSync('docs/model-parameter-oracle.json',JSON.stringify(report,null,2)+'\n');fs.writeFileSync('tests/fixtures/model-parameter-native.json.gz',zlib.gzipSync(JSON.stringify({report,cases:rows}),{level:9}));console.log(JSON.stringify(report));
