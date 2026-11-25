import test from 'node:test';import assert from 'node:assert/strict';
import {BallCollisionWorld,initialPhysicsBall,stepPhysicsBall} from '../src/core/physics-ball';
import {queryCloudAvatar} from '../src/core/cloud-avatar-query';import type {CloudDistanceField} from '../src/core/cloud-volume';
import fixture from './fixtures/cloud-avatar-query-native.json';
const floor={positions:Float32Array.from([-100,0,-100,100,0,-100,100,0,100,-100,0,100]),indices:Uint32Array.from([0,2,1,0,3,2])};
const input={move:[0,0,0],jump:false,fly:false,vertical:0};
test('Test ball lands on actual triangles, jumps from contact and does not accumulate paused time',()=>{
 const world=new BallCollisionWorld([floor]);let state=initialPhysicsBall([0,3,0]);for(let i=0;i<180;i++)state=stepPhysicsBall(state,input,1/120,world);
 assert.ok(Math.abs(state.position[1]-.6)<1e-4);assert.ok(state.grounded);assert.ok(Math.abs(state.velocity[1])<1e-8);
 const jumped=stepPhysicsBall(state,{...input,jump:true},1/120,world);assert.ok(jumped.position[1]>state.position[1]);assert.ok(jumped.velocity[1]>6);assert.equal(jumped.grounded,false);
 assert.deepEqual(stepPhysicsBall(jumped,input,0,world),jumped);
});
test('Motion substeps retain a thin wall and slide along it without changing source meshes',()=>{
 const wall={positions:Float32Array.from([0,0,-100,0,100,-100,0,100,100,0,0,100]),indices:Uint32Array.from([0,1,2,0,2,3])},before=wall.positions.slice(),world=new BallCollisionWorld([floor,wall]);let state=initialPhysicsBall([-2,1,0]);
 for(let i=0;i<120;i++)state=stepPhysicsBall(state,{...input,move:[1,0,1]},1/60,world);
 assert.ok(state.position[0]<=-.5999);assert.ok(state.position[2]>5);assert.deepEqual(wall.positions,before);
 const fast=stepPhysicsBall({...initialPhysicsBall([-2,50,0]),velocity:[200,0,0]},{...input,fly:true,move:[1,0,0]},.1,world);assert.ok(fast.position[0]<=-.5999);
});
test('Full original Avatar cloud query matches native branches, float/double wave coordinates and signed normal bytes',()=>{
 for(const c of fixture.cases) {
  let used=0,sineUsed=0;const positions=Buffer.alloc(112),result=queryCloudAvatar({distanceResolution:c.resolution} as CloudDistanceField,c.position,c.state,()=>c.sines[sineUsed++],p=>{[...p,1].forEach((v,k)=>positions.writeFloatLE(v,used*16+k*4));return c.samples[used++];}),bytes=Buffer.alloc(16);
  [result.distance,...result.normal].forEach((v,j)=>bytes.writeFloatLE(v,j*4));assert.equal(bytes.toString('hex'),c.nativeHex,c.name);assert.equal(positions.toString('hex'),c.positionsHex,c.name);assert.equal(used,c.sampleCount);assert.equal(+result.available,c.available);
 }
});
