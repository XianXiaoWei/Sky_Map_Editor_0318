import type {ModelBakeMemory} from './model-baked-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
export interface CreatureWorldRay {hit:boolean;active:boolean;position:Uint8Array;normal:Uint8Array;}
export interface CreatureWorldServices {
 arithmetic?:NatureArithmeticServices;random():number;
 /** Upper lane of the native caller's XMM6 used by the scalar speed sqrt.
  * The editor's collision boundary initializes this otherwise unused lane. */
 speedDivisorWBits?:number;
 raycast(scene:bigint,origin:Uint8Array,direction:Uint8Array,maximumBits:number,mask:number):CreatureWorldRay;
}
/** Whole Motion collision/avoidance 0x10062d590. The probe starts at a
 * randomized point on the actor radius; a hit redirects the input vector
 * around the hit plane while retaining its speed. Scene intersection is
 * an explicit service, shared by steering and flight integration. */
export function collideOriginalCreatureMotion(m:ModelBakeMemory,motion:bigint,velocity:bigint,lookahead:number,scene:bigint,s:CreatureWorldServices){
 const {a,read,bytes,sum,squared,sqrt,normalize}=originalForceVectors(s.arithmetic),one=0x3f800000,epsilon=bits(.00001);
 const input=read(m.bytes(velocity,16)),inputSquared=sum(squared(input));let result=[...input];
 if(!(value(inputSquared)>value(bits(.0001))))return {velocity:bytes(result),blocked:0};
 let forward=normalize(read(m.bytes(motion+64n,16)));
 if(value(sum(squared(forward))&0x7fffffff)<=value(epsilon))forward=[0,0,one,0];
 const reference=[0,one,0,one],dot=sum(forward.map((v,i)=>a.mul(v,reference[i]))),basis=value(a.add(dot&0x7fffffff,0xbf800000)&0x7fffffff)<=value(epsilon)?[one,0,0,0]:reference;
 const cross=(x:number[],y:number[])=>{const t=[2,0,1,3].map((k,i)=>a.sub(a.mul(x[k],y[i]),a.mul(x[i],y[k]))),q=squared(t),n=sqrt(a.add(q[1],a.add(q[2],q[0]))),r=[t[2],t[0],t[1],t[3]];return value(n)>value(epsilon)?r.map((v,i)=>a.div(v,i===3?q[3]:n)):r;};
 const right=cross(forward,basis),up=cross(right,forward),random=()=>{const r=a.mul(bits(s.random()|0),0x30000000);return a.add(r,a.sub(r,one));};
 const rx=random(),ry=random(),offset=normalize(right.map((v,i)=>a.add(a.mul(v,rx),a.mul(up[i],ry)))),radius=m.read32(motion+80n),position=read(m.bytes(motion,16)),origin=position.map((v,i)=>a.add(a.mul(offset[i],radius),v));
 const speed=sqrt(inputSquared),direction=input.map((v,i)=>a.div(v,i===3?s.speedDivisorWBits??0:speed)),maximum=a.mul(speed,lookahead),hit=s.raycast(scene,bytes(origin),bytes(direction),maximum,0xffffff9f);
 if(!hit.hit||!hit.active)return {velocity:bytes(result),blocked:0};
 const point=read(hit.position),normal=read(hit.normal),distance=sum(point.map((v,i)=>a.mul(a.sub(v,origin[i]),normal[i]))),normalPart=normal.map(v=>a.mul(v,distance)),tangentLength=sqrt(a.sub(a.mul(maximum,maximum),a.mul(distance,distance)));
 let tangent=[...normal];if(value(a.add(distance,one)&0x7fffffff)>value(epsilon))tangent=normalize(point.map((v,i)=>a.sub(v,a.add(origin[i],normalPart[i]))));
 result=normalize(tangent.map((v,i)=>a.add(a.mul(tangentLength,v),normalPart[i]))).map(v=>a.add(v,0));result=normalize(result).map((v,i)=>a.mul(v,i===3?s.speedDivisorWBits??0:speed));
 return {velocity:bytes(result),blocked:1};
}
/** BirdV2Ai post-flight avoidance of nearby active avatars at
 * 0x1001a4520. Its XYZ prediction and three radius tests clear a landing
 * state and request a new target. Caller scratch W is irrelevant to tests. */
export function updateOriginalBirdAvatarAvoidance(m:ModelBakeMemory,ai:bigint,motion:Uint8Array,timer:bigint,delta:number,avatars:readonly {current:Uint8Array;previous:Uint8Array}[],arithmetic?:NatureArithmeticServices){
 const {a,read,sum,squared,sqrt}=originalForceVectors(arithmetic),one=0x3f800000,position=read(motion);
 for(const avatar of avatars){
  const current=read(avatar.current),previous=read(avatar.previous),velocity=value(delta)>value(bits(.001))?current.map((v,i)=>a.div(a.sub(v,previous[i]),delta)):[0,0,0,0];
  const weight=a.min(one,a.max(0,a.div(a.add(sqrt(sum(squared(velocity))),bits(-2.6)),bits(2.1)))),predicted=current.map((v,i)=>a.add(v,a.mul(velocity[i],i===3?0:bits(.6)))),radius=a.add(a.mul(weight,bits(1.5)),a.mul(a.sub(one,weight),bits(.4)));
  const distance=(point:number[])=>sum(squared(point.map((v,i)=>a.sub(v,position[i])))),midpoint=current.map((v,i)=>a.mul(a.add(v,predicted[i]),bits(.5))),midRadius=a.mul(a.mul(radius,bits(1.5)),bits(.5)),nearRadius=a.mul(radius,bits(.5));
  if(value(a.mul(radius,radius))>value(distance(predicted))||value(a.mul(midRadius,midRadius))>value(distance(midpoint))||value(a.mul(nearRadius,nearRadius))>value(distance(current))){m.write8(ai+72n,0);m.write32(timer,0);}
 }
}
