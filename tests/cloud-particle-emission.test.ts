import test from 'node:test';import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-particle-emission-native.json';
import physics from './fixtures/cloud-particle-physics-native.json';
import {addCloudParticle,emitModelCloudParticle,emitModelCloudPair,resetCloudParticleBarn,addCloudParticlePhysicsSphere,CLOUD_PARTICLE_BARN_BYTES} from '../src/core/cloud-particle-emission';
import {stepCloudParticlePhysics} from '../src/core/cloud-particle-physics';
import {stepCloudParticleRuntime} from '../src/core/cloud-particle-runtime';

test('Complete original cloud insertion/reset/model emitters preserve Barn bytes and exact RNG call order',()=>{
 for(const c of fixture.cases) {
  const bytes=Buffer.alloc(CLOUD_PARTICLE_BARN_BYTES,0xa5);bytes.writeUInt32LE(c.sphereCount,0xc820);bytes.writeUInt32LE(c.head,0xc824);bytes.writeUInt32LE(c.count,0xc828);let used=0,powUsed=0,value=c.input.value;
  const random=()=>c.randoms[used++],math={pow:()=>c.powers[powUsed++]};
  if(c.kind===0)addCloudParticle(bytes,{...c.input,size:c.input.speed,opacityMult:c.input.value},random);
  if(c.kind===1)emitModelCloudParticle(bytes,c.input,random,math);
  if(c.kind===2)value=emitModelCloudPair(bytes,c.input,c.sample,c.delta,random,math).value;
  if(c.kind===3)resetCloudParticleBarn(bytes);
  if(c.kind===4){const vector=Buffer.alloc(16);c.randoms.slice(0,4).forEach((v,i)=>vector.writeUInt32LE(v,i*4));addCloudParticlePhysicsSphere(bytes,{current:[...c.input.position,1],previous:[...c.input.velocity,0],radius:c.input.speed,vector:Array.from({length:4},(_,i)=>vector.readFloatLE(i*4))});}
  assert.equal(bytes.toString('hex'),c.nativeHex,c.name);assert.equal(used,c.expectedUsed,c.name);assert.equal(powUsed,c.expectedPowUsed,c.name);assert.equal(value,c.expectedValue,c.name);
 }
});

test('Original cloud integration bytes match native exponential smoothing, sphere projection and growth',()=>{
 for(const c of physics.cases) {
  let index=0;const result=stepCloudParticlePhysics(c.input,{exp:()=>c.powers[index++]}),bytes=Buffer.alloc(44);
  [...result.position,...result.velocity,result.speed,result.size,...result.vector].forEach((v,i)=>bytes.writeFloatLE(v,i*4));
  assert.equal(bytes.toString('hex'),c.nativeHex,c.name);
 }
});

test('Cloud ring saturation drops inserts without consuming phase RNG and validates before mutations',()=>{
 const bytes=new Uint8Array(CLOUD_PARTICLE_BARN_BYTES),view=new DataView(bytes.buffer),source={position:[1,2,3],velocity:[4,5,6],size:.5,opacityMult:1};
 view.setUint32(0xc828,1024,true);const original=bytes.slice();let used=0;
 assert.equal(addCloudParticle(bytes,source,()=>{used++;return 0;}),false);assert.equal(used,0);assert.deepEqual(bytes,original);
 view.setUint32(0xc828,0,true);const before=bytes.slice();assert.throws(()=>addCloudParticle(bytes,source,()=>-1));assert.deepEqual(bytes,before);
 assert.equal(addCloudParticle(bytes,source,()=>0x7fffffff),true);assert.equal(view.getFloat32(0x9020,true),1);
 assert.throws(()=>addCloudParticle(bytes,{...source,velocity:[Infinity,0,0]},()=>0));
 view.setUint32(0xc820,32,true);assert.throws(()=>addCloudParticlePhysicsSphere(bytes,{current:[0,0,0,1],previous:[0,0,0,1],radius:1,vector:[0,0,0,0]}));
});

test('Particle runtime chains life/integration/packed draw, retains emission tuple and rejects missing interaction atomically',()=>{
 const bytes=new Uint8Array(CLOUD_PARTICLE_BARN_BYTES),source={position:[0,0,0],velocity:[0,2,0],size:.5,opacityMult:.75};
 addCloudParticle(bytes,source,()=>12345);const camera={eye:[0,0,10],depthAxis:[0,0,1]};
 const input={forceVelocity:[0,0,0],forceVector:[0,0,0],minimumDistance:Math.fround(3.4028234663852886e38),sphere:{previous:[0,0,0],current:[0,0,0],velocity:[0,0,0],direction:[0,1,0],weight:0}};
 const sphere={current:[1,2,3,1],previous:[3,2,1,1],radius:2,vector:[4,5,6,0]};addCloudParticlePhysicsSphere(bytes,sphere);const withSphere=bytes.slice();
 const first=stepCloudParticleRuntime(bytes,Math.fround(1/60),1,camera,(_,queue)=>{assert.deepEqual(queue,[sphere]);return input;}),view=new DataView(first.storage.buffer);
 assert.equal(first.count,1);assert.equal(first.stride,32);assert.equal(first.instances.length,32);assert.ok(view.getFloat32(0x1018,true)>0);
 assert.ok(view.getFloat32(0x8018,true)<1);assert.ok(view.getFloat32(0x3018,true)>.5);assert.equal(view.getFloat32(0x9018,true),.5);assert.equal(view.getFloat32(0x901c,true),.75);
 assert.equal(view.getUint32(0xc820,true),0);assert.deepEqual(bytes,withSphere);assert.throws(()=>stepCloudParticleRuntime(bytes,.1,1,camera,()=>undefined as any));assert.deepEqual(bytes,withSphere);
 let current=bytes;for(let i=0;i<16;i++)current=stepCloudParticleRuntime(current,.1,i*.1,camera,()=>input).storage;
 assert.equal(new DataView(current.buffer).getUint32(0xc828,true),0);
});
