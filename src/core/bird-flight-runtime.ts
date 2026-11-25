import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import evidence from '../../docs/bird-flight-native.json';
import {updateOriginalBirdV2,type BirdUpdateServices} from './bird-update-runtime';

export interface BirdFlightServices {
 arithmetic?:NatureArithmeticServices;
 acceleration(ai:bigint,game:bigint):Uint8Array;
 collision(position:bigint,velocity:bigint,lookaheadBits:number,scene:bigint,blocked:number):{velocity:Uint8Array;blocked:number};
 acos(argumentBits:number):number;
 sincos(argumentBits:number):{sin:number;cos:number};
 query(owner:bigint,point:Uint8Array,capacity:2,filter:bigint,radiusBits:number):readonly bigint[];
}
const c=evidence.constants,one=0x3f800000;
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Use the recovered integration in the existing whole per-frame caller.
 * Other world, movement and Model services retain their original bindings. */
export function originalBirdFlightUpdateServices(m:ModelBakeMemory,s:Omit<BirdUpdateServices,'updateAi'>,flight:BirdFlightServices):BirdUpdateServices {
 return {...s,updateAi:(bird,ai,params,motion,game,scene,delta)=>integrateOriginalBirdFlight(m,bird,ai,params,motion,game,scene,delta,flight)??0};
}
export function updateOriginalBirdV2WithFlight(m:ModelBakeMemory,bird:bigint,game:bigint,s:Omit<BirdUpdateServices,'updateAi'>,flight:BirdFlightServices){
 updateOriginalBirdV2(m,bird,game,originalBirdFlightUpdateServices(m,s,flight));
}
/** Complete 0x1001a2f30 caller. Speed is the original pre-collision output,
 * and the motion buffer can alias the bird's own position and velocity. */
export function integrateOriginalBirdFlight(m:ModelBakeMemory,bird:bigint,ai:bigint,params:bigint,motion:bigint,game:bigint,scene:bigint,delta:number,s:BirdFlightServices):number|undefined {
 if(m.bytes(ai+0x84n,1)[0])return;
 const a=natureArithmetic(s.arithmetic),read=(p:bigint)=>[0,4,8,12].map(n=>m.read32(p+BigInt(n)));
 const store=(p:bigint,v:number[])=>v.forEach((n,i)=>m.write32(p+BigInt(i*4),n));
 const vector=(b:Uint8Array)=>{if(b.length!==16)throw new Error('Bird flight requires a 16-byte service vector');const v=new DataView(b.buffer,b.byteOffset,16);return [0,4,8,12].map(n=>v.getUint32(n,true));};
 const length=(v:number[])=>{const q=v.map(n=>a.mul(n,n));return sqrt(a.add(q[2],a.add(q[0],q[1])));};
 const acceleration=vector(s.acceleration(ai,game));
 let velocity=read(motion+64n).map((n,i)=>a.add(a.mul(acceleration[i],i===3?0:delta),n));
 store(motion+64n,velocity);m.write32(motion+84n,m.read32(params+28n));
 let speed=length(velocity),speedW=a.mul(velocity[1],velocity[1]);
 if(value(speed)>value(c.minimumSpeed)){
  const factor=a.sub(one,a.mul(a.mul(a.div(m.read32(motion+68n),speed),m.read32(params+36n)),delta));
  velocity=read(motion+64n).map((n,i)=>a.mul(n,i===3?0:factor));store(motion+64n,velocity);speed=a.mul(factor,speed);speedW=0;
 }
 const cap=a.mul(a.add(m.read32(params+36n),one),m.read32(params+28n));
 if(value(speed)>value(cap)){velocity=read(motion+64n).map((n,i)=>a.mul(a.div(n,i===3?speedW:speed),i===3?0:cap));store(motion+64n,velocity);speed=cap;}
 if(value(c.epsilon)>=value(m.read32(ai+36n)&0x7fffffff)){
  if(!(value(c.epsilon)>=value(m.read32(m.read64(ai+8n)+104n)&0x7fffffff))){
   let blocked=1;
   for(let i=0;i<3;i++){
    const response=s.collision(motion,motion+64n,a.mul(delta,c.collisionScale),scene,blocked);
    vector(response.velocity);
    m.bytes(motion+64n,16).set(response.velocity);blocked=response.blocked;
    if(!(blocked&1))break;
   }
  }
  velocity=read(motion+64n);const n=length(velocity),squareY=a.mul(velocity[1],velocity[1]);
  if(value(n)>value(c.epsilon))velocity=velocity.map((x,i)=>a.div(x,i===3?squareY:n));
  const dot=a.add(a.mul(velocity[2],0),a.add(a.mul(velocity[0],0),a.mul(velocity[1],one)));
  let angle=s.acos(a.min(one,a.max(0xbf800000,dot))),direction=velocity;
  let axis:number[]|undefined;
  if(value(angle)>value(c.maximumPitchAngle)){
   const reference=value(c.epsilon)>=value(a.add(angle,one)&0x7fffffff)?[one,0,0,0]:[0,one,0,0];
   angle=a.add(angle,c.negativeMaximumPitchAngle);
   axis=[2,0,1,3].map((i,j)=>a.sub(a.mul(velocity[i],reference[j]),a.mul(velocity[j],reference[i])));
  }else if(value(c.minimumPitchAngle)>value(angle)){
   const reference=value(c.epsilon)>=value(a.add(angle,0xbf800000)&0x7fffffff)?[one,0,0,0]:[0,one,0,0];
   angle=a.sub(c.minimumPitchAngle,angle);
   axis=[2,0,1,3].map((i,j)=>a.sub(a.mul(velocity[j],reference[i]),a.mul(velocity[i],reference[j])));
  }
  if(axis){
   const q=axis.map(n=>a.mul(n,n)),axisLength=sqrt(a.add(q[1],a.add(q[2],q[0])));
   axis=[axis[2],axis[0],axis[1],axis[3]];
   if(value(axisLength)>value(c.epsilon))axis=axis.map((n,i)=>a.div(n,i===3?q[3]:axisLength));
   const {sin,cos}=s.sincos(angle),[x,y,z]=axis,t=a.sub(one,cos),xy=a.mul(a.mul(x,y),t),yz=a.mul(a.mul(y,z),t),zx=a.mul(a.mul(z,x),t),sx=a.mul(sin,x),sy=a.mul(sin,y),sz=a.mul(sin,z);
   const columns=[
    [a.add(cos,a.mul(a.mul(x,x),t)),a.add(sz,xy),a.sub(zx,sy),0],
    [a.sub(xy,sz),a.add(cos,a.mul(a.mul(y,y),t)),a.add(sx,yz),axis[3]],
    [a.add(sy,zx),a.sub(yz,sx),a.add(cos,a.mul(a.mul(z,z),t)),axis[3]]
   ];
   direction=[0,1,2,3].map(i=>a.add(a.mul(columns[2][i],i===3?velocity[3]:velocity[2]),a.add(a.mul(columns[1][i],i===3?velocity[3]:velocity[1]),a.mul(columns[0][i],i===3?velocity[3]:velocity[0]))));
  }
  store(motion+64n,direction.map(n=>a.mul(n,speed)));
 }
 if(m.bytes(ai+72n,1)[0]){
  const target=read(ai+48n),position=read(bird+16n),d=target.map((n,i)=>a.sub(n,position[i])),q=d.map(n=>a.mul(n,n)),distance=a.add(q[2],a.add(q[0],q[1]));
  if(value(c.arrivalDistanceSquared)>value(distance))store(bird+16n,position.map((n,i)=>a.add(n,a.mul(d[i],i===3?0:delta))));
  else if(value(c.queryDistanceSquared)>value(distance)){
   const timer=m.read32(bird+0x510n);
   if(!(value(timer)<=0))m.write32(bird+0x510n,a.sub(timer,delta));
   else {
    const point=new Uint8Array(16),v=new DataView(point.buffer);target.forEach((n,i)=>v.setUint32(i*4,n,true));
    const neighbors=s.query(m.read64(game+0x220n),point,2,0x1001a67f0n,c.queryRadius);
    if(neighbors.some(p=>p!==bird))m.write32(bird+0x50cn,0);
    m.write32(bird+0x510n,0x3fc00000);
   }
  }
 }
 return speed;
}
