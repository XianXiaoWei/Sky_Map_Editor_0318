import type {CloudParticlePackSource} from './cloud-particle-dynamic';
const f = Math.fround, add = (a:number,b:number)=>f(f(a)+f(b)), mul = (a:number,b:number)=>f(f(a)*f(b));
const sub = (a:number,b:number)=>f(f(a)-f(b)), div = (a:number,b:number)=>f(f(a)/f(b));
const clamp = (v:number)=>Math.min(1,Math.max(0,v));
const finite = (v:number)=>Number.isFinite(v)&&Number.isFinite(f(v));
const valid3 = (v:number[])=>v.length===3&&v.every(finite);
export const CLOUD_PARTICLE_BARN_BYTES = 0xc830;
export interface CloudParticleEmission {position:number[]; velocity:number[]; size:number; opacityMult:number;}
export type CloudParticleRandom = ()=>number;
export function cloudParticleRandomUnit(random:CloudParticleRandom) {
  const value=random();
  if(!Number.isInteger(value)||value<0||value>0x7fffffff)throw new Error('原云粒子 rand 输入必须为 31-bit 非负整数');
  // float32 conversion can round RAND_MAX to 2^31, producing exactly 1.
  return mul(f(value),2**-31);
}
function stateView(storage:Uint8Array) {
  if(!(storage instanceof Uint8Array)||storage.length!==CLOUD_PARTICLE_BARN_BYTES)throw new Error('原云粒子 Barn 存储长度无效');
  const view=new DataView(storage.buffer,storage.byteOffset,storage.byteLength),head=view.getUint32(0xc824,true),count=view.getUint32(0xc828,true);
  if(head>=1024||count>1024)throw new Error('原云粒子环状态无效');
  return {view,head,count};
}
// Native OnLevelLoad 0x100225e90 resets counts/head only. Unused SoA data,
// queued sphere bytes and instance resources remain untouched.
export function resetCloudParticleBarn(storage:Uint8Array) {
  if(!(storage instanceof Uint8Array)||storage.length!==CLOUD_PARTICLE_BARN_BYTES)throw new Error('原云粒子 Barn 存储长度无效');
  storage.fill(0,0xc820,0xc82c);
}
export interface CloudParticlePhysicsSphere {current:number[];previous:number[];radius:number;vector:number[];}
// Complete 0x1002289b0. Native asserts at capacity 32 instead of silently
// dropping a sphere. Preserve all four source lanes, including scratch W.
export function addCloudParticlePhysicsSphere(storage:Uint8Array,sphere:CloudParticlePhysicsSphere) {
  const {view}=stateView(storage),count=view.getUint32(0xc820,true),valid4=(v:number[])=>v.length===4&&v.every(finite);
  if(count>=32||!valid4(sphere.current)||!valid4(sphere.previous)||!valid4(sphere.vector)||!finite(sphere.radius))throw new Error('原云粒子物理球队列容量或输入无效');
  const at=0xc020+count*64;
  sphere.current.forEach((v,i)=>view.setFloat32(at+i*4,f(v),true));sphere.previous.forEach((v,i)=>view.setFloat32(at+16+i*4,f(v),true));
  view.setFloat32(at+32,f(sphere.radius),true);sphere.vector.forEach((v,i)=>view.setFloat32(at+48+i*4,f(v),true));
  view.setUint32(0xc820,count+1,true);
}
export function cloudParticleQueuedSpheres(storage:Uint8Array):CloudParticlePhysicsSphere[] {
  const {view}=stateView(storage),count=view.getUint32(0xc820,true);
  if(count>32)throw new Error('原云粒子物理球队列容量无效');
  return Array.from({length:count},(_,i)=>{const at=0xc020+i*64,read4=(offset:number)=>Array.from({length:4},(_,lane)=>view.getFloat32(at+offset+lane*4,true));
    return {current:read4(0),previous:read4(16),radius:view.getFloat32(at+32,true),vector:read4(48)};});
}
// Complete original insertion 0x100228a30. A full ring drops the emission
// without calling rand. Default life=1, velocity=.8*input, speed=|input|,
// tuple=[initial size, opacity multiplier, random animation phase].
export function addCloudParticle(storage:Uint8Array, input:CloudParticleEmission, random:CloudParticleRandom) {
  const {view,head,count}=stateView(storage);
  if(!valid3(input.position)||!valid3(input.velocity)||![input.size,input.opacityMult].every(finite))throw new Error('原云粒子发射输入无效');
  if(count===1024)return false;
  const phase=cloudParticleRandomUnit(random),slot=(head+count)&1023;
  for(let lane=0;lane<3;lane++) {
    view.setFloat32(0x18+lane*0x1000+slot*4,f(input.position[lane]),true);
    view.setFloat32(0x4018+lane*0x1000+slot*4,mul(.8,input.velocity[lane]),true);
  }
  const squares=input.velocity.map(v=>mul(v,v)),speed=f(Math.sqrt(add(squares[2],add(squares[0],squares[1]))));
  view.setFloat32(0x3018+slot*4,f(input.size),true);
  view.setFloat32(0x7018+slot*4,speed,true);view.setFloat32(0x8018+slot*4,1,true);
  view.setFloat32(0x9018+slot*12,f(input.size),true);view.setFloat32(0x901c+slot*12,f(input.opacityMult),true);view.setFloat32(0x9020+slot*12,phase,true);
  view.setUint32(0xc828,count+1,true);
  return true;
}
export function cloudParticleEmissionSources(storage:Uint8Array,vectors:Float32Array,previousPositions:Float32Array):CloudParticlePackSource[] {
  const {view,head,count}=stateView(storage);
  if(!(vectors instanceof Float32Array)||vectors.length!==3072||!(previousPositions instanceof Float32Array)||previousPositions.length!==3072)throw new Error('原云粒子前序向量/位置流无效');
  return Array.from({length:count},(_,index)=>{
    const slot=(head+index)&1023,position=Array.from({length:3},(_,lane)=>view.getFloat32(0x18+lane*0x1000+slot*4,true));
    return {position,previousPosition:Array.from({length:3},(_,lane)=>previousPositions[lane*1024+slot]),vector:Array.from({length:3},(_,lane)=>vectors[lane*1024+slot]),
      size:view.getFloat32(0x3018+slot*4,true),life:view.getFloat32(0x8018+slot*4,true),sizeReference:view.getFloat32(0x9018+slot*12,true),opacityMult:view.getFloat32(0x901c+slot*12,true),phaseOffset:view.getFloat32(0x9020+slot*12,true)};
  });
}
export interface CloudParticleEmitterInput {position:number[];velocity:number[];speed:number;value:number;}
export interface CloudParticleEmitterMath {pow:(base:number,exponent:number)=>number;}
const jsMath:CloudParticleEmitterMath={pow:(b,e)=>f(Math.pow(b,e))};
function validateEmitter(input:CloudParticleEmitterInput) {
  if(!valid3(input.position)||!valid3(input.velocity)||![input.speed,input.value].every(finite))throw new Error('原模型云发射输入无效');
}
// Shared body of complete model helpers 0x1001a1140 / 0x1001a1670. These
// receive model/animation positions and speed; they do not invent them.
function modelEmission(input:CloudParticleEmitterInput,random:CloudParticleRandom,math:CloudParticleEmitterMath):CloudParticleEmission {
  const direction=Array.from({length:3},()=>add(mul(cloudParticleRandomUnit(random),4),-2));
  const squares=direction.map(v=>mul(v,v)),length=f(Math.sqrt(add(squares[2],add(squares[0],squares[1]))));
  const unit=length>f(1e-5)?direction.map(v=>div(v,length)):direction;
  const radial=cloudParticleRandomUnit(random),radius=add(mul(sub(1,radial),f(.001)),mul(radial,f(.999)));
  const size=mul(input.speed,f(.425)),spread=mul(size,f(.667)),weight=clamp(f(input.value));
  const powered=f(math.pow(f(input.value),1.5));
  const opacityMult=mul(add(mul(input.value,weight),mul(powered,sub(1,weight))),.5);
  return {position:unit.map((v,lane)=>add(mul(spread,mul(radius,v)),input.position[lane])),velocity:input.velocity.map(f),size,opacityMult};
}
// Complete helper 0x1001a1670: one randomized emission, no distance query.
export function emitModelCloudParticle(storage:Uint8Array,input:CloudParticleEmitterInput,random:CloudParticleRandom,math=jsMath) {
  stateView(storage);validateEmitter(input);
  return addCloudParticle(storage,modelEmission(input,random,math),random);
}
// Complete helper 0x1001a1140: update the cloud response and, when the native
// distance query is valid and distance > -1.5, attempt TWO particles. RNG
// calls for offsets still occur when insertion rejects a full ring.
export function emitModelCloudPair(storage:Uint8Array,input:CloudParticleEmitterInput,sample:{available:boolean;distance:number},delta:number,
  random:CloudParticleRandom,math=jsMath) {
  stateView(storage);validateEmitter(input);
  if(!finite(sample.distance)||!finite(delta))throw new Error('原云距离样本/时间输入无效');
  let value=sample.distance>0?1:clamp(div(add(sample.distance,2),3));value=mul(value,value);
  const previous=f(input.value);
  if(!(value>previous)) {
    const amount=mul(delta,previous>f(.05)?f(.5):f(.05));
    if(sub(value,amount)>previous)value=add(previous,amount);
    else if(previous>add(value,amount))value=sub(previous,amount);
  }
  let emitted=0;
  if(sample.available&&sample.distance>f(-1.5))for(let i=0;i<2;i++)emitted+=Number(addCloudParticle(storage,modelEmission({...input,value},random,math),random));
  return {value,emitted};
}
