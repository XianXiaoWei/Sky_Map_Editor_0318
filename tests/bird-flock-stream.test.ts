import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {BirdFlockStream,birdFlockSectionQuaternion,BIRD_FLOCK_WING_HALF2,BIRD_FLOCK_WING_INDICES,type BirdFlockSection} from '../src/core/bird-flock-stream';
import {halfFloat} from '../src/core/resources';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-flock-stream-native.json.gz')).toString());
test('Native cached flock travel, ordinary spawn and quaternion bytes remain identical',()=>{
 for(const c of fixture.cases){const b=Buffer.from(c.header,'hex'),raw=Buffer.from(c.sections,'hex');let seed=b.readUInt32LE(36);
  const sections:BirdFlockSection[]=Array.from({length:b.readUInt32LE(40)},(_,i)=>({center:[0,4,8,12].map(k=>raw.readFloatLE(i*64+k)),right:[0,4,8,12].map(k=>raw.readFloatLE(i*64+16+k)),up:[0,4,8,12].map(k=>raw.readFloatLE(i*64+32+k)),quaternion:Int8Array.from(raw.subarray(i*64+48,i*64+52))}));
  const s=new BirdFlockStream(sections,!!b.readUInt32LE(20),{maxInstances:b.readUInt32LE(0),spawnRate:b.readFloatLE(4),travelSpeed:b.readFloatLE(8),spinScalar:b.readFloatLE(12),enabled:!!b.readUInt32LE(16),prepopulate:b.length>=52&&!!b.readUInt32LE(44)},{sincos:a=>[Math.fround(Math.sin(a)),Math.fround(Math.cos(a))],random:()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;}});
  s.records.set(Buffer.from(c.records,'hex'));s.count=b.readUInt32LE(28);s.accumulator=b.readFloatLE(32);s.step(b.readFloatLE(24));
  const head=Buffer.alloc(12);head.writeUInt32LE(s.count);head.writeFloatLE(s.accumulator,4);head.writeUInt32LE(seed,8);assert.equal(Buffer.concat([head,Buffer.from(s.records)]).toString('hex'),c.native,c.name);
 }
 for(const q of fixture.quaternions)assert.deepEqual([...Buffer.from(birdFlockSectionQuaternion(q.direction))],q.native);
});
test('Original flock wing is eight half2 vertices with independent instance payloads',()=>{
 assert.deepEqual([...BIRD_FLOCK_WING_HALF2].map(halfFloat),[0,1.5,.5,-1,0,-1,-.5,-1,0,-.5,0,.5,1.5,0,-1.5,0]);assert.equal(BIRD_FLOCK_WING_INDICES.length,12);
 const sections:BirdFlockSection[]=[0,1,2,3].map(i=>({center:[i*3,0,i*2,1],right:[2,0,0,0],up:[0,2,0,0],quaternion:new Int8Array([0,0,0,127])}));
 const s=new BirdFlockStream(sections,false,{maxInstances:1000,spawnRate:20,travelSpeed:8,spinScalar:.1,enabled:true});s.step(.2);assert.equal(s.count,4);const first=s.snapshot();s.step(.1);const after=s.snapshot();assert.notDeepEqual(after.birds[0].position,first.birds[0].position);assert.notDeepEqual(after.birds[0].offset,after.birds[1].offset);assert.notEqual(after.birds[0].phase,after.birds[1].phase);assert.notDeepEqual(after.birds[0].position,after.birds[1].position);
 const g=s.geometry();assert.equal(g.vertices.length,s.count*8*24);assert.equal(g.indices.length,s.count*12);const view=new DataView(g.vertices.buffer);assert.deepEqual([0,1,2].map(k=>view.getFloat32(k*4,true)),after.birds[0].position);s.reset();assert.equal(s.count,0);assert.equal(s.accumulator,0);assert.ok(s.geometry().positions.every(Number.isFinite));
});
