import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {executeFloatMult,executeFloatSplit,numericFloatBits,readFloatCell,type FloatCell} from '../src/core/object-numeric-runtime';
import {startOriginalEvent,nullEventBarnMessage} from '../src/core/event-start-runtime';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/object-numeric-native.json.gz')).toString());
const u32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
function run(c:any){
 const event=Buffer.alloc(80,0xa5),barn=Buffer.alloc(32,0x5a);event.writeUInt32LE(c.sequence,0x10);event[0x22]=c.started;event[0x21]=0x77;barn.writeUInt32LE(c.counter,0x10);
 const cells:FloatCell[]=c.bits.map((bits:number)=>{const storage=Buffer.alloc(32,0x96);storage.writeUInt32LE(bits,0x10);return {storage};});
 let casts=0,asserts=0,line=0,logs=0,chars=0,count=c.members.length;
 const start=()=>startOriginalEvent(event,c.barn?barn:null,msg=>{assert.equal(msg,nullEventBarnMessage);logs++;chars+=Buffer.byteLength(msg);});
 try{for(let r=0;r<c.repeats;r++){
  if(c.kind===0)executeFloatMult(cells[c.a],cells[c.b],cells[c.out],()=>Buffer.from(c.cellsHex,'hex').readUInt32LE(c.out*32+0x10));
  else if(c.kind===1)executeFloatSplit(cells[c.a],{outputs:()=>({count:()=>count,member:i=>cells[c.members[i]]}),castFloat:m=>{casts++;if(c.mutationAt===casts-1)count=c.newCount;return c.invalid?null:m as FloatCell;},startEvent:start});
  else start();
 }}catch(error){const msg=String(error);if(msg.includes('idx < size')){asserts++;line=54;}else if(msg.includes(': ret')){asserts++;line=71;}else throw error;}
 if(c.kind<2)event.fill(0,0x38,c.kind===0?0x50:0x48);
 assert.deepEqual(u32([casts,0,asserts,line,logs,chars]),Buffer.from(c.eventsHex,'hex'),c.name+' calls');
 assert.deepEqual(event,Buffer.from(c.eventHex,'hex'),c.name+' Event');assert.deepEqual(barn,Buffer.from(c.barnHex,'hex'),c.name+' Barn');
 assert.deepEqual(Buffer.concat(cells.map(c=>Buffer.from(c.storage))),Buffer.from(c.cellsHex,'hex'),c.name+' Float bytes');
}
test('FloatMult whole original fixtures retain precision, single NaN payloads and input/output alias order',()=>{assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');for(const c of fixture.cases.filter((c:any)=>c.kind===0))run(c);});
test('FloatSplit original fixtures preserve interval mapping, saved aliased input, small widths, repeated targets, bounds/cast assertions and empty Event start',()=>{for(const c of fixture.cases.filter((c:any)=>c.kind===1))run(c);});
test('Event Start original fixtures preserve complete state, null-Barn logging, repeated starts and sequence wrap',()=>{for(const c of fixture.cases.filter((c:any)=>c.kind===2))run(c);});
test('Two-NaN multiply rejects an unverified propagation choice without writing the output',()=>{
 const cell=(bits:number)=>{const storage=Buffer.alloc(32,0x96);storage.writeUInt32LE(bits,0x10);return {storage};};
 const a=cell(0x7fc12345),b=cell(0xffc23456),out=cell(numericFloatBits(5)),before=Buffer.from(out.storage);
 assert.throws(()=>executeFloatMult(a,b,out),/verified native propagation service/);assert.deepEqual(out.storage,before);
 let called=0;executeFloatMult(a,b,out,(av,bv)=>{called++;assert.equal(av,0x7fc12345);assert.equal(bv,0xffc23456);return bv;});assert.equal(called,1);assert.equal(readFloatCell(out),0xffc23456);
});
