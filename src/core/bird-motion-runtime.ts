import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {setOriginalModelTransform} from './level-mesh-runtime';
import type {BirdUpdateServices} from './bird-update-runtime';
import evidence from '../../docs/bird-motion-native.json';

export interface BirdMotionServices {
 arithmetic?:NatureArithmeticServices;
 turnDirection(maximumAngleBits:number,before:Uint8Array,desired:Uint8Array):Uint8Array;
 bank(state:bigint,motion:bigint,deltaBits:number,strengthBits:number,smoothingBits:number,limitBits:number):void;
 sincos(argumentBits:number):{sin:number;cos:number};
 setAnimationWeight(animation:bigint,index:number,weightBits:number):void;
 transform(bird:bigint):Uint8Array;
}
const one=0x3f800000,epsilon=0x3727c5ac,c=evidence.constants;
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Whole 0x1001a34c0. The unused speed argument is intentionally ignored;
 * suspended AI still updates the Model transform from its own live scale. */
export function moveOriginalBirdV2(m:ModelBakeMemory,bird:bigint,ai:bigint,animation:bigint,motion:bigint,delta:number,s:BirdMotionServices){
 const a=natureArithmetic(s.arithmetic),read=(p:bigint)=>[0,4,8,12].map(n=>m.read32(p+BigInt(n))),store=(p:bigint,v:number[])=>v.forEach((n,i)=>m.write32(p+BigInt(i*4),n));
 const vec=(b:Uint8Array)=>{if(b.length!==16)throw new Error('Bird motion requires 16-byte vectors');const d=new DataView(b.buffer,b.byteOffset,16);return [0,4,8,12].map(n=>d.getUint32(n,true));};
 const bytes=(v:number[])=>{const b=new Uint8Array(16),d=new DataView(b.buffer);v.forEach((n,i)=>d.setUint32(i*4,n,true));return b;};
 const sum=(q:number[])=>a.add(q[2],a.add(q[0],q[1]));
 const normalize=(v:number[],cross=false)=>{const q=v.map(n=>a.mul(n,n)),n=sqrt(cross?a.add(q[1],a.add(q[2],q[0])):sum(q));return value(n)>value(epsilon)?v.map((x,i)=>a.div(x,i===3?(cross?q[3]:q[1]):n)):v;};
 const cross=(x:number[],y:number[])=>normalize([2,0,1,3].map((i,j)=>a.sub(a.mul(x[i],y[j]),a.mul(x[j],y[i]))),true);
 if(!m.bytes(ai+0x84n,1)[0]){
  const weight=m.read32(ai+36n);let velocity=read(motion+64n);
  if(value(weight)>0){velocity=velocity.map((n,i)=>a.sub(n,a.mul(a.mul(weight,a.mul(weight,a.mul(i===3?0:delta,n))),i===3?0:0x40a00000)));store(motion+64n,velocity);}
  store(motion,read(motion).map((n,i)=>a.add(a.mul(i===3?0:delta,velocity[i]),n)));
  const before=read(motion+48n).map(n=>(n^0x80000000)>>>0),flight=normalize(velocity),up=[0,one,0,one];
  const products=flight.map((n,i)=>a.mul(n,up[i])),dot=sum(products),horizontal=normalize(flight.map((n,i)=>a.sub(n,a.mul(up[i],i===3?products[1]:dot))));
  const desired=value(m.read32(ai+36n))>0||m.bytes(ai+33n,1)[0]?horizontal:flight;
  let direction=vec(s.turnDirection(a.div(a.add(delta,delta),a.max(one,m.read32(m.read64(bird+120n)+24n))),bytes(before),bytes(desired)));
  const q=direction.map(n=>a.mul(n,n)),square=sum(q);
  direction=value(epsilon)>=value(square&0x7fffffff)?[0,0,one,0]:normalize(direction);
  s.bank(bird+0x360n,motion,delta,c.bankStrength,one,c.bankLimit);
  const angle=a.div(a.mul(m.read32(bird+0x390n),c.angleScale),c.angleDivisor),{sin,cos}=s.sincos(angle),[x,y,z,w]=direction,t=a.sub(one,cos);
  const xy=a.mul(t,a.mul(x,y)),yz=a.mul(t,a.mul(y,z)),zx=a.mul(t,a.mul(z,x)),sx=a.mul(sin,x),sy=a.mul(sin,y),sz=a.mul(sin,z);
  const columns=[
   [a.add(cos,a.mul(t,a.mul(x,x))),a.add(sz,xy),a.sub(zx,sy),0],
   [a.sub(xy,sz),a.add(cos,a.mul(t,a.mul(y,y))),a.add(sx,yz),w],
   [a.add(sy,zx),a.sub(yz,sx),a.add(cos,a.mul(t,a.mul(z,z))),0]
  ];
  let bankUp=columns[1].map((n,i)=>a.add(a.mul(columns[2][i],0),a.add(n,a.mul(columns[0][i],0))));
  const alignment=sum(direction.map((n,i)=>a.mul(n,bankUp[i])));
  if(value(epsilon)>=value(a.add(alignment&0x7fffffff,0xbf800000)&0x7fffffff))bankUp=read(motion+32n);
  const right=cross(direction,bankUp),rightSwizzle=[right[2],right[0],right[1],right[3]];
  // cross() returns the native unshuffled normalized cross; permute for basis.
  const upCross=cross(rightSwizzle,direction),newUp=[upCross[2],upCross[0],upCross[1],upCross[3]];
  store(motion+16n,rightSwizzle);store(motion+32n,newUp);store(motion+48n,direction.map(n=>(n^0x80000000)>>>0));
  const first=a.sub(one,m.read32(ai+36n));s.setAnimationWeight(animation,m.read32(bird+0x3c0n)|0,first);
  s.setAnimationWeight(animation,m.read32(bird+0x3c4n)|0,a.sub(one,first));
 }
 const model=m.read64(bird+0x3a0n),transform=s.transform(bird);
 if(transform.length!==64)throw new Error('Bird motion requires a 64-byte transform');
 const scale=read(bird+0x3b0n),d=new DataView(transform.buffer,transform.byteOffset,64),result=new Uint8Array(64),out=new DataView(result.buffer);
 for(let col=0;col<4;col++)for(let row=0;row<4;row++){
  const q=[0,1,2,3].map(i=>a.mul(d.getUint32(i*16+row*4,true),col<3?(i===col?scale[col]:0):(i===3?one:0)));
  out.setUint32(col*16+row*4,col===0?a.add(a.add(a.add(q[0],q[1]),q[2]),q[3]):a.add(q[3],a.add(q[2],a.add(q[0],q[1]))),true);
 }
 setOriginalModelTransform({...m,read8:p=>m.bytes(p,1)[0]},model,result);
}
export function originalBirdMotionUpdateServices(m:ModelBakeMemory,s:Omit<BirdUpdateServices,'updateMovement'>,motion:BirdMotionServices):BirdUpdateServices {
 return {...s,updateMovement:(bird,ai,animation,position,_speed,delta)=>moveOriginalBirdV2(m,bird,ai,animation,position,delta,motion)};
}
