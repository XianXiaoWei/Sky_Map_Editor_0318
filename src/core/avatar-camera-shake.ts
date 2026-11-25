import {cameraEventRead as readFloat,cameraEventWrite as writeFloat} from './camera-events';

const f=Math.fround;
type V=number[];
const add=(a:V,b:V)=>a.map((v,i)=>f(v+b[i]));
const mul=(a:V,b:V)=>a.map((v,i)=>f(v*b[i]));
const perm=(a:V,n:number)=>a.map((_,i)=>a[n>>(i*2)&3]);
const clamp=(v:number,lo:number,hi:number)=>Math.min(hi,Math.max(lo,v));
const vector=(b:Uint8Array,at:number)=>Array.from({length:4},(_,i)=>readFloat(b,at+i*4));
const length=(v:V)=>{const squared=f(f(f(v[0]*v[0])+f(v[1]*v[1]))+f(v[2]*v[2]));return f(Math.sqrt(squared));};
function insert(a:V,b:V,n:number){const out=a.slice();out[n>>4&3]=b[n>>6&3];for(let i=0;i<4;i++)if(n>>i&1)out[i]=0;return out;}

export interface WhiskerShakeQuery {origin:V;direction:V;radius:number;}
export interface WhiskerShakeServices {
 /** Runtime Wind output, ray results and sound dispatch are supplied services.
  * Math results include explicit packed-return upper lanes for sincos. */
 wind:(position:V)=>V;
 ray:(query:WhiskerShakeQuery)=>V|null;
 sound:(params:Uint8Array)=>void;
 exp:(value:number)=>number;
 pow:(value:number,power:number)=>number;
 cos:(value:number)=>number;
 sincos:(angle:number)=>V;
}
export interface WhiskerShakeOutput {offset:V;basis:V[];}

/** Original 32-bit polynomial hash. The following interpolation retains the
 * native truncation and unsigned conversion, including its negative-phase
 * behavior; replacing truncation by floor would change the original output. */
function hash(value:number){const n=(value<<13)^value;let h=Math.imul(n,n);h=Math.imul(h,0x3d73);h=(h+0xc0ae5)|0;h=Math.imul(h,n);h=(h+0x5208dd0d)&0x7fffffff;return f(f(1-f(f(h)*f(1/1073741824)))*.5);}
function noise(phase:number,s:WhiskerShakeServices){
 const integer=Math.trunc(phase),a=hash(integer|0),b=hash((integer+1)|0);
 const t=f(f(1-f(s.cos(f(f(phase-f(integer>>>0))*f(Math.PI)))))*.5);
 return f(f(f(1-t)*a)+f(t*b));
}

/** Whole Whisker shake/basis helper 0x10073afd0. Does not implement the
 * surrounding continuous camera Update, avoidance, final lens or scene
 * dispatch. All physical fields are supplied snapshots, not inferred defaults.
 * Supported finite inputs keep noise phase conversion inside int32 range. */
export function updateOriginalWhiskerShake(camera:Uint8Array,physical:Uint8Array,delta:number,s:WhiskerShakeServices):WhiskerShakeOutput {
 const dt=f(delta),position=vector(physical,0x10),velocity=vector(physical,0x50);
 let distance=clamp(length(position.map((v,i)=>f(v-vector(physical,0x130)[i]))),0,25),impulse=0;
 const active=physical[0xbb0]!==0;
 if(active){
  const forward=vector(physical,0x70),side=vector(physical,0x80);
  const origin=add(position,mul(mul(forward,Array(4).fill(f(.8))),Array(4).fill(readFloat(physical,0xe4))));
  for(const direction of [side,side.map(v=>-v),forward,forward.map(v=>-v)]){
   const hit=s.ray({origin:add(origin,mul(direction,Array(4).fill(f(.15)))),direction,radius:5});
   if(hit){const d=length(hit.map((v,i)=>f(v-origin[i])));if(d<distance)distance=d;}
  }
  const previous=readFloat(camera,0x384);
  if(previous<7){
   const difference=clamp(f(distance-previous),0,15),speed=length(velocity);
   impulse=f(f(f(speed*.25)*difference)*dt);
   if(difference!==15&&difference>.2){
    const bytes=new Uint8Array(560),d=new DataView(bytes.buffer);
    d.setFloat32(0,1,true);bytes[13]=1;position.forEach((v,i)=>writeFloat(bytes,16+i*4,v));d.setFloat32(72,10,true);d.setFloat32(76,30,true);d.setUint32(112,0xc31,true);
    d.setUint16(128,0x4321,true);d.setFloat32(160,speed,true);d.setFloat32(164,difference,true);d.setUint32(544,3,true);d.setUint32(556,2,true);s.sound(bytes);
   }
  }
 }
 writeFloat(camera,0x384,distance);
 const wind=s.wind(position),difference=wind.map((v,i)=>f(v-velocity[i]));
 let energy=f(f(f(difference[0]*difference[0])+f(difference[1]*difference[1]))+f(difference[2]*difference[2]));
 energy=f(energy*f(.0002));if(readFloat(physical,0xb48)===1)energy=f(energy*f(.3));energy=Math.min(f(.05),energy);
 let drive=f(energy+f(.005));
 if(active){const proximity=Math.max(0,f(f(7-distance)/7));drive=f(drive+f(f(proximity*energy)*2));}
 const targetSpeed=f(drive*8),targetForce=f(f(drive*3.5)+impulse),decay=f(1-f(s.exp(f(dt*f(-3.1608164310455322))))),weight=clamp(decay,0,1),previousWeight=f(1-weight);
 const baseSpeed=f(f(previousWeight*readFloat(camera,0x370))+f(weight*targetSpeed));writeFloat(camera,0x370,baseSpeed);
 const baseForce=f(f(previousWeight*readFloat(camera,0x374))+f(weight*targetForce));writeFloat(camera,0x374,baseForce);
 const eventWeight=readFloat(camera,0x380),speedWeight=f(s.pow(eventWeight,6)),forceWeight=f(s.pow(eventWeight,5));
 const speed=f(f(speedWeight*readFloat(camera,0x378))+f(f(1-speedWeight)*baseSpeed));
 const force=f(f(forceWeight*readFloat(camera,0x37c))+f(f(1-forceWeight)*baseForce));
 const step=f(speed*dt),offset:V=[],scratch:V=[];
 for(let i=0;i<3;i++){
  const at=0x360+i*4,phase=f(f(f(step*[53,61,49][i])*f(.3))+readFloat(camera,at));
  if(!Number.isFinite(phase)||Math.abs(f(phase*4))>=2147483648)throw new Error('Whisker noise phase outside verified finite int32 range');
  writeFloat(camera,at,phase);
  const first=noise(phase,s),second=f(noise(f(phase+phase),s)*f(.333)),third=f(noise(f(phase*4),s)*f(.1108890026807785));
  const value=f(f(third+f(second+first))*force);offset.push(f(value+value));scratch.push(f(value*0));
 }
 // The original stores value*0 in its orientation scratch lanes. Shake is
 // positional here; the caller adds offset to m_eyePos before avoidance.
 const yaw=f(readFloat(camera,0x298)+Math.PI+scratch[0]),pitch=f(readFloat(camera,0x290)+scratch[1]);
 let y=s.sincos(yaw).map(f),negative=y.map(v=>-v),a=insert(y,y,0x4e),right=insert(a,negative,0x20),forward=[y[0],0,y[1],0];
 const p=s.sincos(pitch).map(f),p1=insert(p,p,0x29),p2=insert([0,0,0,0],p.map(v=>-v),0x10),p0=insert(p2,p,0x60),axis=[0,1,0,1],zero=[0,0,0,0];
 right=add(mul(forward,zero),right);
 const common=mul(right,zero),up=add(mul(forward,perm(p1,0xea)),add(mul(perm(p1,0xd5),axis),common)),back=add(mul(forward,perm(p0,0xea)),add(mul(perm(p0,0xd5),axis),common));
 const roll=f(f(readFloat(camera,0x388)-readFloat(camera,0x2dc))+f(0*scratch[2])),r=s.sincos(roll).map(f);
 const r1=[r[1],r[0],0,0],r0=insert(r.map(v=>-v),r,0x5c),commonRoll=mul(back,zero);
 const basis=[add(commonRoll,add(mul(up,perm(r1,0xd5)),mul(right,perm(r1,0xc0)))),add(commonRoll,add(mul(up,perm(r0,0xd5)),mul(right,perm(r0,0xc0)))),add(back,add(mul(right,zero),mul(up,zero)))];
 writeFloat(camera,0x380,f(f(f(1-decay)*eventWeight)+f(decay*0)));
 return {offset,basis};
}

/** Browser math is a preview service, not a claim of macOS libm parity. */
export const previewWhiskerShakeMath={exp:(v:number)=>f(Math.exp(v)),pow:(v:number,p:number)=>f(Math.pow(v,p)),cos:(v:number)=>f(Math.cos(v)),sincos:(v:number)=>[f(Math.sin(v)),f(Math.cos(v)),0,0]};
