import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';
import {updatePlaySound2D,resumePlaySound2D,type PlaySound2DState,type OriginalSoundHandle} from '../src/core/sound-event-runtime';
import {startOriginalEvent} from '../src/core/event-start-runtime';
const fixture=JSON.parse(fs.readFileSync('tests/fixtures/sound-event-native.json','utf8'));
const u32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
function run(c:any){
 const event=Buffer.alloc(128,0xa5),barn=Buffer.alloc(32,0x5a);event[0x22]=c.started;event.writeUInt32LE(0x12345678,0x10);event.writeUInt32LE(c.volumeBits,0x50);event.writeUInt32LE(c.mix,0x54);barn.writeUInt32LE(c.h[10],0x10);
 const trace:number[][]=[];let ids=0,plays=0,parameters=0,options=Buffer.alloc(128,0xef),packet=Buffer.alloc(0x1b0,0xef),zero=Buffer.alloc(0x1b0,0xef),name=Buffer.alloc(128);
 const handle:OriginalSoundHandle={id:()=>{ids++;const id=ids>c.h[12]?2:1;trace.push([2,id]);return BigInt(id);},playing:()=>{trace.push([3,c.h[5]]);return !!c.h[5];},description:()=>{trace.push([4,0]);return {playing:()=>{trace.push([5,c.h[6]]);return !!c.h[6];}};},stop:immediate=>{trace.push([6,+immediate]);},parameters:p=>{trace.push([7,0]);parameters++;packet=Buffer.from(p);}};
 const time=Buffer.alloc(0x1090);time.writeUInt32LE(c.h[8],0x108c);time.writeUInt32LE(c.h[9],0x18);
 const state:PlaySound2DState={launched:!!c.h[1],handle:c.h[2]?handle:null,handleId:c.h[3]?1n:0n,sound:c.sound,volumeBits:c.volumeBits,mixChannel:c.mix,gameTime:c.h[7]?time:null};
 const start=()=>startOriginalEvent(event,barn,()=>{throw new Error('Unexpected null Barn');});
 const services={startEvent:start,play:(sound:string,o:Uint8Array,p:Uint8Array)=>{trace.push([1,0]);plays++;name.fill(0);name.write(sound);options=Buffer.from(o);zero=Buffer.from(p);return {handle:c.h[2]?handle:null,id:c.h[3]?1n:0n};}};
 for(let r=0;r<c.h[11];r++)if(c.h[0])resumePlaySound2D(state,start);else updatePlaySound2D(state,services);
 event[0x70]=+state.launched;event.fill(0,0x18,0x20);event.fill(0,0x58,0x70);event.fill(0,0x38,0x50);
 const actual=Buffer.concat([u32([+state.launched,plays,parameters,trace.length]),u32(trace.flat()),options,packet,zero,name,event,barn]);
 assert.deepEqual(actual,Buffer.from(c.expectedHex,'hex'),c.name);
}
test('PlaySound2D original update packets, repeated play, handle identity changes and completion callback order match native fixtures',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');for(const c of fixture.cases.filter((c:any)=>!c.h[0]))run(c);
});
test('PlaySound2D resume retains launched/handle state and stops only matching live handles before Event Start',()=>{for(const c of fixture.cases.filter((c:any)=>c.h[0]))run(c);});
