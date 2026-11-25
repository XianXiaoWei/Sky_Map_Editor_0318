import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
type Vec=number[];
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
const read=(m:ModelBakeMemory,a:bigint):Vec=>[0n,4n,8n,12n].map(o=>value(m.read32(a+o)));
const write=(m:ModelBakeMemory,a:bigint,v:Vec)=>v.forEach((n,i)=>m.write32(a+BigInt(i*4),Number.isNaN(n)?0xffc00000:bits(n)));
const vector=(a:Vec,b:Vec,op:(a:number,b:number)=>number)=>a.map((n,i)=>op(n,b[i]));
const dot=(a:Vec,b:Vec)=>add(mul(a[2],b[2]),add(mul(a[0],b[0]),mul(a[1],b[1])));
const length=(a:Vec)=>f(Math.sqrt(dot(a,a)));
// VPERMILPS 0xc0 broadcasts XYZ and retains the source register's W lane.
const normalized=(a:Vec)=>{const n=length(a);return n>value(0x3727c5ac)?a.map((v,i)=>f(v/(i===3?mul(a[1],a[1]):n))):a.slice();};
const fail=(line:number,expression:string):never=>{throw new NativeObjectFoundationFailure('AvatarLoco.cpp',line,3,expression);};
export interface AvatarSlideServices {
 /** Whole collision move query 0x100778220 remains an explicit service.
  * Supply its adjusted position even when blocked=false. Inputs are copied
  * local vectors; writes through position/target/velocity remain live. */
 move(owner:bigint,start:Uint8Array,target:Uint8Array,radiusBits:number,filter:number):{blocked:boolean;position:Uint8Array};
}
const bytes=(v:Vec)=>{const b=new Uint8Array(16),d=new DataView(b.buffer);v.forEach((n,i)=>d.setUint32(i*4,Number.isNaN(n)?0xffc00000:bits(n),true));return b;};
const decode=(b:Uint8Array)=>{const d=new DataView(b.buffer,b.byteOffset,b.byteLength);return [0,1,2,3].map(i=>d.getFloat32(i*4,true));};
/** Whole normal AvatarLoco collision/slide solver 0x100147230. The original
 * performs at most eight iterations, a second 0.05 probe on collision,
 * projected velocity or retained initial speed, a 0.001 remaining-distance
 * test, and ordered optional outputs. Finite XYZ/default MXCSR are the checked
 * arithmetic domain; unused W follows the native SIMD sequence. Collision
 * geometry, shape/filter ownership and full per-frame Avatar update are open. */
export function solveOriginalAvatarSlide(m:ModelBakeMemory,owner:bigint,position:bigint,target:bigint,velocity:bigint,radiusBits:number,filter:number,keepSpeed:boolean,outPosition:bigint,outVelocity:bigint,s:AvatarSlideServices){
 const initialVelocity=read(m,velocity),initialSquare=vector(initialVelocity,initialVelocity,mul),speed=length(initialVelocity),speedVector=[speed,speed,speed,initialSquare[1]];
 const initialDelta=vector(read(m,target),read(m,position),sub),remainingW=mul(initialDelta[1],initialDelta[1]);
 let remaining=length(initialDelta),blocked=false;
 const query=(start:Vec,end:Vec)=>s.move(owner,bytes(start),bytes(end),radiusBits,filter>>>0);
 for(let iteration=0;iteration<8;iteration++){
  const first=query(read(m,position),read(m,target));let adjusted=decode(first.position),direction=vector(adjusted,read(m,position),sub),travel=length(direction);direction=normalized(direction);
  if(first.blocked){
   const saved=direction.slice(),probe=adjusted.map((n,i)=>add(n,mul(saved[i],f(i===3?0:.05))));
   const second=query(adjusted,probe);
   if(second.blocked)direction=normalized(vector(decode(second.position),adjusted,sub));else direction=saved;
   travel=length(vector(adjusted,read(m,position),sub));blocked=true;
  }
  remaining=sub(remaining,travel);write(m,position,adjusted);
  if(keepSpeed)write(m,velocity,vector(direction,speedVector,mul));
  else{
   const liveVelocity=read(m,velocity),unit=normalized(liveVelocity);remaining=mul(remaining,dot(direction,unit));
   const projected=dot(direction,liveVelocity),squared=vector(direction,liveVelocity,mul);
   write(m,velocity,vector(direction,[projected,projected,projected,squared[1]],mul));
  }
  // UCOMISS: ordered less-than stops; unordered does not invent a stop.
  if(value(0x3a83126f)>remaining)break;
  write(m,target,vector(direction,[remaining,remaining,remaining,remainingW],mul).map((n,i)=>add(n,read(m,position)[i])));
 }
 if(outPosition)m.bytes(outPosition,16).set(Uint8Array.from(m.bytes(position,16)));
 if(outVelocity)m.bytes(outVelocity,16).set(Uint8Array.from(m.bytes(velocity,16)));
 return blocked;
}
export interface AvatarActionServices {log(durationBits:number,delayBits:number,name:bigint):void;stringLength(name:bigint):number;copyString(out:bigint,name:bigint):void;}
/** Whole normal 0x100147c70 action placement request. Records initial physical
 * position/forward, requested forward, duration/delay and position delta.
 * Logging, C strings and stack guard ABI are services; animation loading,
 * playback/blending and action completion are not supplied by this request. */
export function requestOriginalAvatarAction(m:ModelBakeMemory,state:bigint,position:bigint,forward:bigint,name:bigint,durationBits:number,delayBits:number,flag:number,s:AvatarActionServices){
 if(!name)fail(1554,'animName');
 const initial=Uint8Array.from(m.bytes(state+0x10n,16)),initialForward=Uint8Array.from(m.bytes(state+0x60n,16));
 m.bytes(state+0xbd0n,16).set(initial);m.bytes(state+0xbe0n,16).set(initialForward);m.bytes(state+0xbf0n,16).set(Uint8Array.from(m.bytes(forward,16)));
 m.write8(state+0xbc8n,1);m.write8(state+0xc10n,flag);m.write32(state+0xc14n,0);m.write32(state+0xc18n,durationBits);m.write32(state+0xc1cn,delayBits);
 s.log(durationBits,delayBits,name);
 if(((s.stringLength(name)+1)>>>0)>=65)throw new NativeObjectFoundationFailure('../../../Code/Base/FixedString.h',48,3,'len + 1 <= N');
 s.copyString(state+0xc20n,name);write(m,state+0xc00n,vector(read(m,state+0x10n),read(m,position),sub));m.write8(state+0xc60n,0);
}
export interface AvatarForceServices {logOverflow():void;copyBytes(out:bigint,input:bigint,length:number):void;}
/** Whole normal force queue 0x100148780 (32 slots, 32-byte stride) and default
 * max-velocity wrapper 0x100148750. Queue padding remains untouched. */
function addForceBytes(m:ModelBakeMemory,state:bigint,input:()=>Uint8Array,maxVelocityBits:number,s:Pick<AvatarForceServices,'logOverflow'>){
 const count=m.read32(state+0xb40n);if(count>=32){s.logOverflow();return;}
 const copied=input();m.write32(state+0xb40n,count+1);const out=state+0x740n+BigInt(count)*32n;m.bytes(out,16).set(copied);m.write32(out+16n,maxVelocityBits);
}
export function addOriginalAvatarForce(m:ModelBakeMemory,state:bigint,force:bigint,maxVelocityBits:number,s:Pick<AvatarForceServices,'logOverflow'>){addForceBytes(m,state,()=>Uint8Array.from(m.bytes(force,16)),maxVelocityBits,s);}
export function addOriginalAvatarForceDefault(m:ModelBakeMemory,state:bigint,force:bigint,s:Pick<AvatarForceServices,'logOverflow'>){const input=Uint8Array.from(m.bytes(force,16));addForceBytes(m,state,()=>input,0x497423f0,s);}
/** Whole force export 0x100148920. Both outputs are asserted even at count=0;
 * vector then scalar writes retain alias ordering, and export does not drain. */
export function readOriginalAvatarForces(m:ModelBakeMemory,state:bigint,forces:bigint,maxVelocities:bigint,capacity:number){
 if(!forces)fail(1770,'out_forces');if(!maxVelocities)fail(1771,'out_maxVels');const count=Math.min(m.read32(state+0xb40n),capacity>>>0);
 for(let i=0;i<count;i++){const source=state+0x740n+BigInt(i)*32n;m.bytes(forces+BigInt(i)*16n,16).set(Uint8Array.from(m.bytes(source,16)));m.write32(maxVelocities+BigInt(i)*4n,m.read32(source+16n));}return count;
}
/** Whole nearby-effect queue 0x100148690/0x100148700, separate from forces.
 * Original squared XYZ distance gate is 400, with unordered accepted. */
export function addOriginalAvatarNearbyEffect(m:ModelBakeMemory,state:bigint,position:bigint,firstBits:number,secondBits:number){
 const count=m.read32(state+0x730n);if(count===32)return;
 const inputBytes=Uint8Array.from(m.bytes(position,16)),input=read(m,position),delta=vector(input,read(m,state+0x10n),sub);if(dot(delta,delta)>400)return;
 m.write32(state+0x730n,count+1);const out=state+0x330n+BigInt(count)*32n;m.bytes(out,16).set(inputBytes);m.write32(out+16n,firstBits);m.write32(out+20n,secondBits);
}
export function readOriginalAvatarNearbyEffects(m:ModelBakeMemory,state:bigint,out:bigint,capacity:number,s:Pick<AvatarForceServices,'copyBytes'>){const count=Math.min(m.read32(state+0x730n),capacity>>>0);s.copyBytes(out,state+0x330n,count*32);return count;}
