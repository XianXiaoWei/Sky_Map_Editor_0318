import type {ObjectNode,Field} from './objects';
import {PreparedEnvironmentObjectState} from './environment-object-state';
import {initializeOriginalBirdV2Ai} from './creature-ai-initialize-runtime';
import {initializeOriginalCreatureSteering,type CreatureSteeringCounters} from './creature-steering-runtime';
import {initializeOriginalBirdMovement,normalizeOriginalCreatureBasis,originalCreatureLength3} from './bird-load-runtime';
import {selectOriginalBirdTarget,selectOriginalBirdNextTarget} from './bird-target-runtime';
import {calculateOriginalBirdAcceleration} from './bird-acceleration-runtime';
import {originalBirdAiAccelerationServices} from './bird-force-runtime';
import {integrateOriginalBirdFlight} from './bird-flight-runtime';
import {moveOriginalBirdV2} from './bird-motion-runtime';
import {getOriginalCreatureMotionTransform,turnOriginalCreatureDirection,updateOriginalCreatureBank,type FishMathServices} from './fish-update-runtime';
import {collideOriginalCreatureMotion,updateOriginalBirdAvatarAvoidance,type CreatureWorldServices} from './creature-world-runtime';
import {savedRailCache} from './rail-level';
import {railClosestPoint,railPosition,RAIL_MARKER_OBB,type RailCache} from './rail';
import {buildRailArcTable,railDistanceAtParameter,railParameterAtDistance,type RailArcTable} from './rail-arc';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {natureArithmetic} from './nature-event-runtime';
import {originalCreatureArithmetic as arithmetic} from './creature-arithmetic-capability';
import {getNativeMarkerLocalObb} from './marker-transform-runtime';
import * as THREE from 'three';

const supported=new Set(['BirdV2','BirdV2Params','BirdV2AiParams','Marker','Clump','Rail','LevelMesh']);
const floats=(b:Uint8Array)=>{const d=new DataView(b.buffer,b.byteOffset,b.byteLength);return Array.from({length:b.length/4},(_,i)=>d.getFloat32(i*4,true));};
const bytes=(values:readonly number[])=>new Uint8Array(Float32Array.from(values).buffer);
type Bird={id:number;pointer:bigint;model:bigint;animation:bigint;scratch:bigint;initial:Uint8Array;weights:number[];error?:string};
/** Editor motion owner for the recovered ordinary BirdV2 chain. Saved
 * params/targets/rails retain native storage. World ray intersections,
 * neighbor enumeration and platform math are explicit editor adapters.
 * Guide attachment, GoSit effects, pickup/events and sound remain separate. */
export class BirdWorldPreview {
 readonly state:PreparedEnvironmentObjectState;private birds=new Map<number,Bird>();private byPointer=new Map<bigint,number>();private rails=new Map<bigint,{cache:RailCache;arc:RailArcTable}>();
 private seed=0x12345678;private game:bigint;private clock:bigint;private avatar:bigint;private avatarMotion:bigint;private avatarPhysics:bigint;private avatarActive=false;private avatarPrevious?:number[];
 private counters:CreatureSteeringCounters={wander:0,flock:0,avoid:0};private collisionQueries=0;private neighborQueries=0;private followEffects=0;
 constructor(nodes:ObjectNode[],ids:number[],private world:Pick<CreatureWorldServices,'raycast'>){
  const selected=new Set<number>(),collect=(id:number)=>{const n=nodes[id];if(!n||selected.has(id)||!supported.has(n.className))return;selected.add(id);const fields=(fs:Field[])=>{for(const f of fs){if(f.kind==='reference')collect(Number(f.value));if(f.children)fields(f.children);}};fields(n.fields);};ids.forEach(collect);
  this.state=new PreparedEnvironmentObjectState([...selected].map(id=>nodes[id]));const m=this.state.runtimeMemory;
  for(const e of this.state.entries.values())this.byPointer.set(e.pointer,e.node.id);
  this.game=this.state.allocate(0x700);this.clock=this.state.allocate(48);this.avatar=this.state.allocate(80);this.avatarMotion=this.state.allocate(0xc00);
  m.write64(this.game+0x160n,this.clock);m.write32(this.clock+32n,bits(1));m.write64(this.avatar+24n,this.avatarMotion);this.avatarPhysics=this.state.allocate(0x300);m.write64(this.avatar+32n,this.avatarPhysics);m.write64(this.avatarPhysics+0x2a0n,this.avatarMotion);
  for(const offset of [0x138n,0x220n,0x280n,0x380n,0x3c8n])m.write64(this.game+offset,this.state.allocate(64));
  for(const e of this.state.entries.values())if(e.node.className==='Rail'){
   const cache=savedRailCache(e.node,nodes),arc=buildRailArcTable(cache,32);this.rails.set(e.pointer,{cache,arc});
   const points=this.state.allocate(cache.positions.length*16);cache.positions.forEach((p,i)=>m.bytes(points+BigInt(i*16),16).set(bytes([...p,1])));m.write64(e.pointer+0x90n,points);
  }
  for(const id of ids){
   const p=this.state.require(id).pointer,params=m.read64(p+120n),aiParams=m.read64(p+128n);if(!params||!aiParams)throw new Error(`BirdV2 #${id} 缺少原运动参数`);
   const region=m.read64(params+8n);m.bytes(p+16n,16).set(m.bytes(region?region+16n:p+0xc0n,16));m.bytes(p+80n,16).fill(0);m.write32(p+96n,m.read32(params+24n));m.write32(p+100n,m.read32(params+28n));m.write32(p+104n,bits(1));
   m.bytes(p+32n,48).set(region?this.transform(region).subarray(0,48):m.bytes(p+0x90n,48).slice());normalizeOriginalCreatureBasis(m,p+32n,bits(.00001));m.write64(p+0xe8n,aiParams);
   initializeOriginalBirdV2Ai(m,p+0xe0n,p,this.game,{initializeMotion:motion=>initializeOriginalCreatureSteering(m,motion,m.read64(this.game+0x220n),m.read64(this.game+0x380n),m.read64(this.game+0x138n),this.counters),castGoSit:o=>this.castMarker(o) /* native Marker metadata 0x10043ccc0 */,rand:()=>this.random()});initializeOriginalBirdMovement(m,p+0x360n);
   const template=m.read64(params+16n);if(!template)throw new Error(`BirdV2 #${id} 缺少原模型模板`);const matrix=this.transform(template),a=natureArithmetic(arithmetic);
   for(let i=0;i<3;i++)m.write32(p+BigInt(0x3b0+i*4),a.mul(originalCreatureLength3(matrix.subarray(i*16,i*16+16)),originalCreatureLength3(m.bytes(p+BigInt(0x90+i*16),16))));
   const model=this.state.allocate(0x400),animation=this.state.allocate(32),scratch=this.state.allocate(128);m.write64(p+0x3a0n,model);m.write64(model+104n,animation);m.write32(p+0x3c0n,0);m.write32(p+0x3c4n,1);m.write64(p+0x50cn,0x3f80000000000000n);
   this.birds.set(id,{id,pointer:p,model,animation,scratch,initial:this.state.require(id).bytes.slice(),weights:[1,0]});
  }
 }
 private projectSphere(position:Uint8Array,radius:number,obb:Uint8Array){
  const matrix=new THREE.Matrix4().fromArray(floats(obb)),center=new THREE.Vector3().fromArray(floats(position)),closest=new THREE.Vector3().setFromMatrixPosition(matrix);
  const axes=[0,4,8].map(i=>new THREE.Vector3().fromArray(matrix.elements,i)),offset=center.clone().sub(closest);
  for(const axis of axes){const extent=axis.length();if(extent>1e-8)closest.addScaledVector(axis.normalize(),Math.max(-extent,Math.min(extent,offset.dot(axis))));}
  const direction=center.clone().sub(closest),distance=direction.length();if(distance>1e-8)closest.addScaledVector(direction,Math.min(value(radius),distance)/distance);
  return bytes([...closest.toArray(),0]);
 }
 private random(){this.seed=(Math.imul(this.seed,1103515245)+12345)>>>0;return this.seed>>>1;}
 private castMarker(object:bigint){const p=object-8n,id=this.byPointer.get(p);return id!==undefined&&this.state.require(id).node.className==='Marker'?p:0n;}
 private transform(p:bigint){const id=this.byPointer.get(p);if(id===undefined)throw new Error('生物目标的原变换未接入');return this.state.transform(id);}
 private enabled(p:bigint){const id=this.byPointer.get(p);return id===undefined?0:Number(this.state.enabled(id));}
 private rail(p:bigint){const r=this.rails.get(p);if(!r)throw new Error('生物 Rail 缓存未接入');return r;}
 private query(point:Uint8Array,capacity:number,radiusBits:number,onlyBirds=false){
  this.neighborQueries++;const pos=floats(point),radius=value(radiusBits),out:bigint[]=[];
  for(const b of this.birds.values()){if(b.error)continue;const p=floats(this.state.runtimeMemory.bytes(b.pointer+16n,16));if(Math.hypot(...p.slice(0,3).map((v,i)=>v-pos[i]))<=radius){out.push(b.pointer);if(out.length===capacity)return out;}}
  if(!onlyBirds&&this.avatarActive&&out.length<capacity){const p=floats(this.state.runtimeMemory.bytes(this.avatarMotion+16n,16));if(Math.hypot(...p.slice(0,3).map((v,i)=>v-pos[i]))<=radius)out.push(this.avatar);}return out;
 }
 reset(){const m=this.state.runtimeMemory;for(const b of this.birds.values()){this.state.require(b.id).bytes.set(b.initial);b.weights=[1,0];delete b.error;}this.seed=0x12345678;this.avatarPrevious=undefined;this.avatarActive=false;this.collisionQueries=this.neighborQueries=this.followEffects=0;m.bytes(this.avatarMotion,0xc00).fill(0);}
 dispose(){this.state.dispose();this.birds.clear();this.rails.clear();}
 animationWeight(id:number){return this.birds.get(id)?.weights[1]??0;}
 step(delta:number,avatar?:readonly number[]){
  if(!(delta>0))return;const m=this.state.runtimeMemory,dt=Math.fround(Math.min(.266,Math.max(.0001,delta))),dtBits=bits(dt),a=natureArithmetic(arithmetic);m.write32(this.clock+20n,dtBits);m.write32(this.clock+40n,dtBits);
  this.avatarActive=!!avatar;if(avatar){m.bytes(this.avatarMotion+16n,16).set(bytes([...avatar,1]));m.bytes(this.avatarMotion+32n,16).set(bytes([...(this.avatarPrevious??avatar),1]));this.avatarPrevious=[...avatar];}
  const math:FishMathServices={arithmetic,acosBits:n=>bits(Math.acos(value(n))),expBits:n=>bits(Math.exp(value(n))),logBits:n=>bits(Math.log(value(n))),sincosBits:n=>bytes([Math.sin(value(n)),Math.cos(value(n)),0,0])};
  const sincos=(n:number)=>({sin:bits(Math.sin(value(n))),cos:bits(Math.cos(value(n)))});
  const collide=(motion:bigint,velocity:bigint,lookahead:number,scene:bigint)=>collideOriginalCreatureMotion(m,motion,velocity,lookahead,scene,{arithmetic,random:()=>this.random(),raycast:(...args)=>{this.collisionQueries++;return this.world.raycast(...args);}});
  const flocking={arithmetic,query:(_owner:bigint,point:bigint,out:bigint,capacity:32,_filter:bigint,radius:number)=>{const selected=this.query(m.bytes(point,16),capacity,radius);selected.forEach((p,i)=>m.write64(out+BigInt(i*8),p));return selected.length;},cast:(_memory:unknown,ref:bigint,kind:'Actor'|'Avatar')=>{const p=m.read64(ref);return kind==='Actor'?[...this.birds.values()].some(b=>b.pointer===p)?p:0n:p===this.avatar?p:0n;},avatarMotion:()=>{const v=new Uint8Array(92);v.set(m.bytes(this.avatarMotion+16n,16));v.set(bytes([1,0,0,0,0,1,0,0,0,0,1,0]),16);const current=floats(m.bytes(this.avatarMotion+16n,16)),old=floats(m.bytes(this.avatarMotion+32n,16));v.set(bytes(current.map((n,i)=>i<3?(n-old[i])/dt:0)),64);new DataView(v.buffer).setFloat32(80,.6,true);new DataView(v.buffer).setFloat32(88,1,true);return v;},obb:()=>{throw new Error('鸟查询收到未接入的 OBB 对象');},fallbackWeightBits:()=>{throw new Error('鸟查询收到未接入的 OBB 权重');}};
  for(const b of this.birds.values()){
   if(b.error||!this.state.enabled(b.id))continue;const p=b.pointer,ai=p+0xe0n;
   try{
    const target=m.read64(ai+24n);if(target&&!this.enabled(target)){let delay=0;if(value(m.read32(ai+36n))>.5){const r=a.mul(bits(this.random()|0),0x30000000);delay=a.mul(r,a.mul(r,bits(3)));}m.write32(p+0x50cn,delay);m.write64(ai+24n,0n);}
    const timer=p+0x50cn;m.write32(timer,a.sub(m.read32(timer),dtBits));
    if(value(m.read32(timer))<0&&!(selectOriginalBirdTarget(m,ai,timer,{arithmetic,random:()=>this.random(),castMarker:o=>this.castMarker(o),enabled:p=>this.enabled(p),transform:p=>this.transform(p)})&255))selectOriginalBirdNextTarget(m,p,this.avatar,{arithmetic,random:()=>this.random(),castMarker:o=>this.castMarker(o),enabled:p=>this.enabled(p)});
    const acceleration=originalBirdAiAccelerationServices(m,{arithmetic,pow:(n,power)=>bits(Math.pow(value(n),value(power))),followObject:()=>{throw new Error('BirdV2 GoSit 引导交互尚未接入');},collision:(motion,velocity,lookahead,scene)=>collide(motion,velocity,lookahead,scene).velocity},{random:()=>this.random(),targetTransform:p=>this.transform(p),raycast:(scene,origin,direction,maximum,options)=>this.world.raycast(scene,origin,direction,maximum,options.mask),avatarAt:(_owner,index)=>index===0?this.avatar:0n,avatarActive:p=>Number(p===this.avatar&&this.avatarActive),identityBasis:bytes([1,0,0,0,0,1,0,0,0,0,1,0])},flocking,{random:()=>this.random(),castRail:o=>this.rails.has(o)?o:this.rails.has(o-8n)?o-8n:0n,nearest:(p,point)=>{const r=this.rail(p),v=railClosestPoint(r.cache,floats(point).slice(0,3));return {timeBits:bits(v.parameter),position:bytes([...v.position,1])};},distanceAtTime:(p,time)=>{const r=this.rail(p);return bits(railDistanceAtParameter(r.arc,r.cache,value(time)));},timeAtDistance:(p,distance)=>{const r=this.rail(p);return bits(railParameterAtDistance(r.arc,r.cache,value(distance)));},sample:(p,time)=>bytes([...railPosition(this.rail(p).cache,value(time)),1])},{arithmetic,requireAvatar:()=>this.avatar,worldPosition:()=>m.bytes(this.avatarMotion+16n,16).slice(),targetTransform:p=>this.transform(p),targetObb:p=>{const id=this.byPointer.get(p);if(id===undefined)throw new Error('Bird follow target OBB unavailable');return getNativeMarkerLocalObb();},projectSphereObb:(position,radius,obb)=>this.projectSphere(position,radius,obb),random:()=>this.random(),emitCritters:()=>{this.followEffects++;}});
    integrateOriginalBirdFlight(m,p,ai,m.read64(p+120n),p+16n,this.game,m.read64(this.game+0x138n),dtBits,{arithmetic,acceleration:(ai,game)=>calculateOriginalBirdAcceleration(m,ai,game,b.scratch,acceleration),collision:(motion,velocity,lookahead,scene)=>collide(motion,velocity,lookahead,scene),acos:math.acosBits,sincos,query:(_owner,point,capacity,_filter,radius)=>this.query(point,capacity,radius,true)});
    moveOriginalBirdV2(m,p,ai,b.animation,p+16n,dtBits,{arithmetic,turnDirection:(limit,before,desired)=>turnOriginalCreatureDirection(limit,before,desired,math),bank:(state,motion,delta,strength,smoothing,limit)=>updateOriginalCreatureBank(m,state,motion,delta,strength,smoothing,limit,math),sincos,setAnimationWeight:(_animation,index,weight)=>{b.weights[index]=value(weight);},transform:p=>getOriginalCreatureMotionTransform(m,p)});
    updateOriginalBirdAvatarAvoidance(m,ai,m.bytes(p+16n,92),timer,dtBits,this.avatarActive?[{current:m.bytes(this.avatarMotion+16n,16),previous:m.bytes(this.avatarMotion+32n,16)}]:[],arithmetic);
   }catch(error){b.error=String((error as Error).message);}
  }
 }
 snapshot(id:number){const b=this.birds.get(id);if(!b)return;const m=this.state.runtimeMemory,p=b.pointer,ai=p+0xe0n,target=m.read64(ai+24n);return {algorithm:'BirdV2 native steering/flight/bank/follow',enabled:this.state.enabled(id),followEffects:this.followEffects,position:floats(m.bytes(p+16n,16)).slice(0,3),velocity:floats(m.bytes(p+80n,16)).slice(0,3),transform:floats(getOriginalCreatureMotionTransform(m,p)),scale:floats(m.bytes(p+0x3b0n,12)),weights:b.weights.slice(),landing:!!m.bytes(ai+72n,1)[0],landWeight:value(m.read32(ai+36n)),target:this.byPointer.get(target),targetTimer:value(m.read32(p+0x50cn)),rail:this.byPointer.get(m.read64(ai+64n)),suspended:!!m.bytes(ai+132n,1)[0],collisionQueries:this.collisionQueries,neighborQueries:this.neighborQueries,error:b.error};}
}
