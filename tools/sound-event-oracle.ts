import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {updatePlaySound2D,resumePlaySound2D,type PlaySound2DState,type OriginalSoundHandle} from '../src/core/sound-event-runtime';
import {startOriginalEvent} from '../src/core/event-start-runtime';import {numericFloatBits} from '../src/core/object-numeric-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
const gate=spawnSync('python3',['tools/reverse-object-runtime.py',executable,'--check-only']);if(gate.status!==0)throw new Error(gate.stderr.toString());
interface Case {name:string;sound:string;h:number[];volumeBits:number;mix:number;started:number;}
const cases:Case[]=[];
for(const mode of [0,1])for(const launched of [0,1])for(const handle of [0,1])for(const id of [0,1])for(const playing of [0,1])for(const description of [0,1])for(const time of [0,1])for(const flip of [0,1,2,100]){
 cases.push({name:`matrix-${cases.length}`,sound:cases.length%2?'event:/SFX/LongSoundName':'short',h:[mode,launched,handle,id,1,playing,description,time,numericFloatBits(12.5),numericFloatBits(0.75),0xffffffff,2,flip],volumeBits:numericFloatBits(0.625),mix:3,started:0});
}
for(const [t,s] of [[0,0],[1,0],[-1,0],[0,1],[-0,1],[Infinity,1],[1,Infinity],[12.5,0.25]])cases.push({name:`time-${cases.length}`,sound:'event:/time',h:[0,0,1,1,1,1,1,1,numericFloatBits(t),numericFloatBits(s),123,1,100],volumeBits:numericFloatBits(1),mix:0,started:1});
const inventory=JSON.parse(fs.readFileSync('docs/audio-runtime-inventory.json','utf8'));
for(const n of inventory.nodes.filter((n:any)=>n.className==='PlaySound2D')){
 const sound=n.strings.find((f:any)=>f.name==='sound')?.value;if(sound===undefined)throw new Error('Actual PlaySound2D missing sound');
 cases.push({name:n.key,sound,h:[0,0,1,1,1,1,1,1,numericFloatBits(123),numericFloatBits(1),0,1,100],volumeBits:numericFloatBits(1),mix:0,started:0});
}
const u32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
const prepared=cases.map(c=>{const event=Buffer.alloc(128,0xa5),barn=Buffer.alloc(32,0x5a),name=Buffer.alloc(128);if(Buffer.byteLength(c.sound)>126)throw new Error('Sound fixture name too long');name.write(c.sound);event[0x22]=c.started;event.writeUInt32LE(0x12345678,0x10);event.writeUInt32LE(c.volumeBits,0x50);event.writeUInt32LE(c.mix,0x54);barn.writeUInt32LE(c.h[10],0x10);return {c,event,barn,name};});
const input=Buffer.concat([u32([cases.length]),...prepared.flatMap(({c,event,barn,name})=>[u32(c.h),event,barn,name])]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-sound-event-'));let raw:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-sound-event-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:32*1024*1024,timeout:120000});if(run.status!==0)throw new Error(`Sound oracle ${run.status}/${run.signal}: ${run.stderr}`);raw=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0,failed=0,comparedBytes=0;const failures:any[]=[],saved:any[]=[];const take=(n:number)=>{if(at+n>raw.length)throw new Error('Truncated sound output');const b=raw.subarray(at,at+n);at+=n;return b;};if(take(4).readUInt32LE()!==cases.length)throw new Error('Count mismatch');
for(const {c,event,barn} of prepared){
 const nativeState=take(16),traceCount=nativeState.readUInt32LE(12),nativeTrace=take(traceCount*8),nativeOptions=take(128),nativeParameters=take(0x1b0),nativeZero=take(0x1b0),nativeName=take(128),nativeEvent=take(128),nativeBarn=take(32);
 const trace:number[][]=[];let ids=0,plays=0,parameters=0,options=Buffer.alloc(128,0xef),packet=Buffer.alloc(0x1b0,0xef),zero=Buffer.alloc(0x1b0,0xef),name=Buffer.alloc(128);
 const handle:OriginalSoundHandle={id:()=>{ids++;const id=ids>c.h[12]?2:1;trace.push([2,id]);return BigInt(id);},playing:()=>{trace.push([3,c.h[5]]);return !!c.h[5];},description:()=>{trace.push([4,0]);return {playing:()=>{trace.push([5,c.h[6]]);return !!c.h[6];}};},stop:immediate=>{trace.push([6,+immediate]);},parameters:p=>{trace.push([7,0]);parameters++;packet=Buffer.from(p);}};
 const time=Buffer.alloc(0x1090);time.writeUInt32LE(c.h[8],0x108c);time.writeUInt32LE(c.h[9],0x18);
 const state:PlaySound2DState={launched:!!c.h[1],handle:c.h[2]?handle:null,handleId:c.h[3]?1n:0n,sound:c.sound,volumeBits:c.volumeBits,mixChannel:c.mix,gameTime:c.h[7]?time:null};
 const start=()=>startOriginalEvent(event,barn,()=>{throw new Error('Unexpected null Barn');});
 const services={startEvent:start,play:(sound:string,o:Uint8Array,p:Uint8Array)=>{trace.push([1,0]);plays++;name.fill(0);name.write(sound);options=Buffer.from(o);zero=Buffer.from(p);return {handle:c.h[2]?handle:null,id:c.h[3]?1n:0n};}};
 for(let r=0;r<c.h[11];r++)if(c.h[0])resumePlaySound2D(state,start);else updatePlaySound2D(state,services);
 event[0x70]=+state.launched;event.fill(0,0x18,0x20);event.fill(0,0x58,0x70);event.fill(0,0x38,0x50);
 const actual=Buffer.concat([u32([+state.launched,plays,parameters,trace.length]),u32(trace.flat()),options,packet,zero,name,event,barn]),expected=Buffer.concat([nativeState,nativeTrace,nativeOptions,nativeParameters,nativeZero,nativeName,nativeEvent,nativeBarn]);
 if(actual.length!==expected.length){failed++;if(failures.length<10)failures.push({name:c.name,actualTrace:trace,nativeTrace:Array.from({length:traceCount},(_,i)=>[nativeTrace.readUInt32LE(i*8),nativeTrace.readUInt32LE(i*8+4)])});}
 else for(let i=0;i<actual.length;i++){comparedBytes++;if(actual[i]!==expected[i]){failed++;if(failures.length<10)failures.push({name:c.name,offset:i,actual:actual[i],native:expected[i]});}}
 if(cases.indexOf(c)%17===0||!c.name.startsWith('matrix'))saved.push({...c,expectedHex:expected.toString('hex')});
}
if(at!==raw.length)throw new Error('Trailing output');
const scope='Whole original PlaySound2D Update 0x100534410, OnResumeEnabled 0x1005343d0 and Event::Start with explicitly supplied SoundManager::play, handle id/playing/description/stop/parameter virtual calls, GameTime and Barn snapshots. Packed 128-byte options, 432-byte zero/ut parameter packets, call order/count, repeated calls and all nonpointer event/Barn bytes compared. Actual object sound strings use explicit volume/mix/time/handle snapshots: constructors, original time/manager/FMOD, 3D sound, preload and complete class/game playback remain pending.';
const report={passed:failed===0,complete:true,executableSha256,cases:cases.length,actualSoundNameCases:cases.filter(c=>!c.name.startsWith('matrix')&&!c.name.startsWith('time')).length,comparedBytes,failedBytes:failed,scope,failures};fs.writeFileSync('docs/sound-event-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/sound-event-native.json',JSON.stringify({executableSha256,scope,cases:saved})+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
