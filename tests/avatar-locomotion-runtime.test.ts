import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateAvatarLocomotion,type AvatarLocoCase} from '../tools/avatar-locomotion-cases';
import {requestOriginalAvatarAction,addOriginalAvatarForce,readOriginalAvatarForces} from '../src/core/avatar-locomotion-runtime';
import {setOriginalPhysicalPositionImmediate} from '../src/core/avatar-physical-state';
import {AvatarSlidePreview} from '../src/core/avatar-slide-preview';import {avatarRead} from '../src/core/avatar-set-pos';
import {BallCollisionWorld,initialPhysicsBall,stepPhysicsBall} from '../src/core/physics-ball';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/avatar-locomotion-native.json.gz')).toString()) as {executableSha256:string;cases:{input:AvatarLocoCase;nativeSha256:string}[]};
test('Whole Avatar slide/action/force/effect bodies preserve every native snapshot, SIMD W, aliases and live callback reads',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,534);
 for(const c of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateAvatarLocomotion(c.input)).digest('hex'),c.nativeSha256,c.input.label);
});
test('Physical placement, action request, force queue and slide share one live physical-state address',()=>{
 const c=fixture.cases[0].input;let action=false;
 const actual=evaluateAvatarLocomotion(c,(m,base)=>{
  m.write32(base+0xe4n,0);setOriginalPhysicalPositionImmediate({storage:m.bytes(base,0xd00)},[0,0,0,1],{offsetAxis:[0,1,0,0]});
  requestOriginalAvatarAction(m,base,base+0x4000n,base+0x60n,base+0x6000n,0x3f400000,0,1,{log:()=>{assert.equal(m.bytes(base+0xbc8n,1)[0],1);action=true;},stringLength:name=>m.string(name).length,copyString:(out,name)=>m.bytes(out,m.string(name).length+1).set(Buffer.from(m.string(name)+'\0'))});
  addOriginalAvatarForce(m,base,base+0x4000n,0x40000000,{logOverflow:()=>assert.fail('Unexpected overflow')});assert.equal(readOriginalAvatarForces(m,base,base+0x4400n,base+0x4500n,1),1);assert.equal(m.read32(base+0xb40n),1);assert.equal(m.read32(base+0x4500n),0x40000000);
 });
 const b=actual.subarray(actual.length-0x10000);assert.ok(action);assert.equal(b[0xbc8],1);assert.equal(b.readFloatLE(0xc00),-3);assert.equal(b.readFloatLE(0xc08),-4);assert.equal(b.readFloatLE(0x10),3);assert.equal(b.readFloatLE(0x18),4);assert.equal(b.readUInt32LE(0xb40),1);
});
test('Avatar movement adapter retains floors, thin walls, jump and pause while writing the placement state',()=>{
 const floor={positions:Float32Array.from([-100,0,-100,100,0,-100,100,0,100,-100,0,100]),indices:Uint32Array.from([0,2,1,0,3,2])},wall={positions:Float32Array.from([0,0,-100,0,100,-100,0,100,100,0,0,100]),indices:Uint32Array.from([0,1,2,0,2,3])},before=wall.positions.slice(),world=new BallCollisionWorld([floor,wall]),physical={storage:new Uint8Array(0xd00)},slide=new AvatarSlidePreview(physical),input={move:[0,0,0],jump:false,fly:false,vertical:0};
 let state=initialPhysicsBall([-2,3,0]);slide.reset(state.position,state.radius);
 for(let i=0;i<180;i++)state=stepPhysicsBall(state,input,1/120,world,undefined,undefined,slide);
 assert.ok(Math.abs(state.position[1]-.6)<1e-4);assert.ok(state.grounded);
 const jumped=stepPhysicsBall(state,{...input,jump:true},1/120,world,undefined,undefined,slide);assert.ok(jumped.position[1]>state.position[1]);assert.ok(jumped.velocity[1]>6);
 for(let i=0;i<120;i++)state=stepPhysicsBall(state,{...input,move:[1,0,1]},1/60,world,undefined,undefined,slide);
 assert.ok(state.position[0]<=-.5999);assert.ok(state.position[2]>5);assert.deepEqual(wall.positions,before);slide.sync(state.position,state.velocity,state.radius);
 assert.ok(Math.abs(avatarRead(physical,0x10)[0]-state.position[0])<1e-6);assert.ok(slide.calls>300);assert.ok(slide.queries>=slide.calls);const calls=slide.calls;assert.deepEqual(stepPhysicsBall(state,input,0,world,undefined,undefined,slide),state);assert.equal(slide.calls,calls);
});
