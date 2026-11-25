import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {originalForceVectors} from './creature-force-runtime';
import evidence from '../../docs/fish-update-native.json';

const c=evidence.constants,one=c.one,epsilon=value(c.epsilon);
export interface FishMathServices {
 arithmetic?:NatureArithmeticServices;
 acosBits(argument:number):number;
 expBits(argument:number):number;
 logBits(argument:number):number;
 /** All four return lanes are owned by the native math boundary. Its W lane
  * reaches the rotation's W arithmetic even though only XYZ is geometric. */
 sincosBits(argument:number):Uint8Array;
}
function vectors(s:Pick<FishMathServices,'arithmetic'>){
 const v=originalForceVectors(s.arithmetic),{a}=v;
 const normalize=(x:number[])=>{const q=v.squared(x),n=v.sqrt(v.sum(q));return value(n)>epsilon?x.map((t,i)=>a.div(t,i===3?q[1]:n)):x;};
 const cross=(x:number[],y:number[])=>{
  const t=[2,0,1,3].map((i,j)=>a.sub(a.mul(x[i],y[j]),a.mul(x[j],y[i]))),q=v.squared(t),n=v.sqrt(a.add(q[1],a.add(q[2],q[0])));
  const r=[t[2],t[0],t[1],t[3]];return value(n)>epsilon?r.map((t,i)=>a.div(t,i===3?q[3]:n)):r;
 };
 return {...v,normalize,cross};
}
/** Native axis-angle column arithmetic, including the packed return W. */
function rotation(axis:number[],packed:Uint8Array,s:FishMathServices){
 if(packed.length!==16)throw new Error('Fish sincos requires four explicit native return lanes');
 const {a,read}=vectors(s),[sin,cos,,padding]=read(packed),[x,y,z,w]=axis,t=a.sub(one,cos);
 const xy=a.mul(a.mul(x,y),t),yz=a.mul(a.mul(y,z),t),zx=a.mul(a.mul(z,x),t),sx=a.mul(sin,x),sy=a.mul(sin,y),sz=a.mul(sin,z);
 return [
  [a.add(cos,a.mul(a.mul(x,x),t)),a.add(sz,xy),a.sub(zx,sy),padding],
  [a.sub(xy,sz),a.add(cos,a.mul(a.mul(y,y),t)),a.add(sx,yz),w],
  [a.add(sy,zx),a.sub(yz,sx),a.add(cos,a.mul(a.mul(z,z),t)),padding]
 ];
}
function rotate(direction:number[],columns:number[][],s:FishMathServices){
 const {a}=vectors(s);
 return direction.map((_n,i)=>a.add(a.mul(columns[2][i],i===3?direction[3]:direction[2]),a.add(a.mul(columns[1][i],i===3?direction[3]:direction[1]),a.mul(columns[0][i],i===3?direction[3]:direction[0]))));
}
/** Whole Creature motion virtual transform 0x1001a6610, used by FishV2's
 * +0x18 slot. The separate +0x20 getter returns the scaled Model transform. */
export function getOriginalCreatureMotionTransform(m:ModelBakeMemory,p:bigint,out=new Uint8Array(64)){
 if(out.length!==64)throw new Error('Creature motion transform requires 64 bytes');
 for(let i=0;i<3;i++){out.set(m.bytes(p+0x20n+BigInt(i*16),16),i*16);new DataView(out.buffer,out.byteOffset,64).setUint32(i*16+12,0,true);}
 out.set(m.bytes(p+16n,16),48);new DataView(out.buffer,out.byteOffset,64).setUint32(60,one,true);return out;
}
/** Whole TurnDirection 0x100168830. Angle comparison uses the unnormalized
 * inputs for rotation, without clamping acos; antiparallel axes use native up. */
export function turnOriginalCreatureDirection(maximum:number,before:Uint8Array,desired:Uint8Array,s:FishMathServices){
 const {a,read,bytes,normalize,sum,cross}=vectors(s),old=read(before),next=read(desired),u=normalize(old),v=normalize(next);
 let angle=s.acosBits(sum(u.map((n,i)=>a.mul(n,v[i]))));
 if(value(c.epsilon)>=value(angle&0x7fffffff))return bytes(old);
 let axis=cross(old,next);
 if(epsilon>=value(a.add(angle&0x7fffffff,c.piNegative)&0x7fffffff))axis=[...evidence.vectors.up];
 if(!(value(maximum)>value(angle)))angle=maximum;
 return bytes(rotate(old,rotation(axis,s.sincosBits(angle),s),s));
}
/** Whole persistent Bank 0x100192550. The two position histories are shifted
 * before math callbacks; its final angle reloads the live cached bank value. */
export function updateOriginalCreatureBank(m:ModelBakeMemory,p:bigint,motion:bigint,delta:number,strength:number,smoothing:number,limit:number,s:FishMathServices){
 const {a,read,bytes,length,sum}=vectors(s),current=read(m.bytes(motion,16)),change=current.map((n,i)=>a.sub(n,m.read32(p+16n+BigInt(i*4)))),previous=read(m.bytes(p+32n,16));
 m.bytes(p+16n,16).set(new Uint8Array(m.bytes(p,16)));m.bytes(p,16).set(bytes(current));m.bytes(p+32n,16).set(bytes(change));
 const flat=change.map((n,i)=>i===1?0:n),old=previous.map((n,i)=>i===1?0:n),n=length(flat),q=length(old);let gain=0;
 if(value(a.mul(n,q)&0x7fffffff)>value(c.bankThreshold)){
  gain=a.div(a.mul(a.add(n,q),a.mul(a.sub(one,s.expBits(a.mul(delta,c.bankResponse))),strength)),a.mul(a.add(n,n),q));
 }
 const t=[2,0,1,3].map((i,j)=>a.sub(a.mul(flat[i],old[j]),a.mul(flat[j],old[i]))),cross=[t[2],t[0],t[1],t[3]],offset=a.mul(sum(cross.map((n,i)=>a.mul(n,evidence.vectors.up[i]))),gain);
 const log=s.logBits(a.sub(one,a.min(one,a.max(0,a.div(smoothing,c.bankSmoothingDivisor)))));
 const rate=bits(value(log)/evidence.bankLogDivisor),weight=a.min(one,a.max(0,a.sub(one,s.expBits(a.mul(rate,delta)))));
 let angle=a.add(a.add(a.mul(weight,0),a.mul(a.sub(one,weight),m.read32(p+48n))),offset);
 angle=a.min(limit,a.max((limit^0x80000000)>>>0,angle));
 const wrap=a.div(a.add(angle,c.angleDivisor),c.bankWrap),floor=bits(Math.floor(value(wrap)));
 m.write32(p+48n,a.sub(angle,a.mul(floor,c.bankWrap)));
}
export interface FishUpdateServices extends FishMathServices {
 debugScaleBits?:number;
 followUpParameters:bigint;
 setModelEnabled(model:bigint,enabled:number):void;
 /** Whole AI 0x100335a40 is a separate consumer, not an invented force. */
 updateAI(fish:bigint,game:bigint):Uint8Array;
 collide(position:bigint,velocity:bigint,scene:bigint,deltaBits:number,repeat:{value:number}):Uint8Array;
 turnDirection(maximum:number,before:Uint8Array,desired:Uint8Array):Uint8Array;
 bank(state:bigint,motion:bigint,delta:number,strength:number,smoothing:number,limit:number):void;
 transform(fish:bigint):Uint8Array;
 setModelTransform(model:bigint,transform:Uint8Array):void;
 setAnimationWeight(animation:bigint,index:number,weight:number):void;
 raycast(scene:bigint,position:bigint,direction:Uint8Array,height:number,kind:number):{hit:number;position:Uint8Array;materialFlags:number};
 ripple(owner:bigint,kind:number,position:Uint8Array,color:Uint8Array,size:number,radius:number,weight:number,enabled:number):void;
 setLightTransform(light:bigint,transform:Uint8Array):void;
 localPlayer(owner:bigint):bigint;
 playNamed(animation:bigint,name:'CritterAlert',weight:number,speed:number,flags:number):void;
 requestInteraction(owner:bigint,position:Uint8Array,playerId:number,range:number,kind:number,enabled:number):number;
 random():number;
 emitInteraction(owner:bigint,fish:bigint,kind:number,parameters:bigint,radius:number,random:number,flags:readonly [number,number,number]):void;
}
/** Compose the original direction, bank and +0x18 transform consumers. */
export function originalFishMovementServices(m:ModelBakeMemory,s:Omit<FishUpdateServices,'turnDirection'|'bank'|'transform'>):FishUpdateServices {
 return {...s,turnDirection:(maximum,before,desired)=>turnOriginalCreatureDirection(maximum,before,desired,s),bank:(state,motion,delta,strength,smoothing,limit)=>updateOriginalCreatureBank(m,state,motion,delta,strength,smoothing,limit,s),transform:fish=>getOriginalCreatureMotionTransform(m,fish)};
}
/** Whole FishV2.Update 0x100337540..0x1003384a0. World and resource services
 * retain their original owners and callback order. This is not full FishV2
 * scene acceptance while its AI and real scene owners remain unconnected. */
export function updateOriginalFishV2(m:ModelBakeMemory,p:bigint,game:bigint,s:FishUpdateServices){
 const {a,read,bytes,length,normalize,cross,sum}=vectors(s),r=(offset:bigint)=>read(m.bytes(p+offset,16)),store=(offset:bigint,x:number[])=>m.bytes(p+offset,16).set(bytes(x));
 s.setModelEnabled(m.read64(p+0x110n),m.bytes(p+0xc0n,1)[0]);if(!m.bytes(p+0xc0n,1)[0])return;
 const clock=m.read64(game+0x160n),delta=a.min(c.maximumDelta,a.max(c.minimumDelta,a.mul(m.read32(clock+20n),a.mul(s.debugScaleBits??one,m.read32(clock+32n)))));
 const force=read(s.updateAI(p,game));let velocity=r(0x50n).map((n,i)=>a.add(a.mul(i===3?0:delta,force[i]),n));store(0x50n,velocity);let speed=length(velocity);
 if(value(speed)>value(c.minimumDelta)){
  const drag=a.sub(one,a.mul(delta,a.mul(a.div(velocity[1],speed),m.read32(m.read64(p+0x78n)+28n))));
  velocity=velocity.map((n,i)=>a.mul(n,i===3?0:drag));store(0x50n,velocity);speed=length(velocity);
 }
 const params=m.read64(p+0x78n),maximum=a.mul(a.add(m.read32(params+28n),one),m.read32(params+20n));let speedW=a.mul(velocity[1],velocity[1]);
 if(value(speed)>value(maximum)){velocity=velocity.map((n,i)=>a.mul(i===3?0:maximum,a.div(n,i===3?speedW:speed)));store(0x50n,velocity);speed=maximum;speedW=0;}
 const repeat={value:1},collisionDelta=a.mul(delta,c.collisionScale);
 for(let i=0;i<3;i++){
  velocity=read(s.collide(p+16n,p+0x50n,m.read64(game+0x138n),collisionDelta,repeat));store(0x50n,velocity);if(i===2||!repeat.value)break;
 }
 const direction=normalize(velocity),dot=sum(direction.map((n,i)=>a.mul(n,evidence.vectors.up[i]))),angle=s.acosBits(a.min(one,a.max(c.negativeOne,dot)));
 if(value(angle)>value(c.poleHigh)||value(c.poleLow)>value(angle)){
  const high=value(angle)>value(c.poleHigh),near=a.add(angle,high?one:c.negativeOne);
  const up=epsilon>=value(near&0x7fffffff)?[one,0,0,0]:[...evidence.vectors.up];
  const axis=high?cross(direction,up):cross(up,direction),rotationAngle=high?a.add(angle,c.poleHighOffset):a.sub(c.poleLow,angle);
  velocity=rotate(direction,rotation(axis,s.sincosBits(rotationAngle),s),s).map((n,i)=>a.mul(i===3?speedW:speed,n));store(0x50n,velocity);
 }
 store(16n,r(16n).map((n,i)=>a.add(a.mul(velocity[i],i===3?0:delta),n)));
 const oldUp=r(0x30n),before=r(0x40n).map(n=>(n^0x80000000)>>>0),desired=normalize(velocity);
 const maximumAngle=a.div(a.add(delta,delta),a.max(one,m.read32(m.read64(p+0x78n)+16n)));
 let facing=normalize(read(s.turnDirection(maximumAngle,bytes(before),bytes(desired))));
 if(epsilon>=value(length(facing)&0x7fffffff))facing=[...evidence.vectors.fallbackDirection];
 s.bank(p+0xd0n,p+16n,delta,c.bankStrength,one,c.bankLimit);
 const bankAngle=a.div(a.mul(m.read32(p+0x100n),c.angleScale),c.angleDivisor),columns=rotation(facing,s.sincosBits(bankAngle),s);
 let up=columns[1].map((n,i)=>a.add(a.mul(columns[2][i],0),a.add(n,a.mul(columns[0][i],0))));
 if(epsilon>=value(a.add(sum(facing.map((n,i)=>a.mul(n,up[i])))&0x7fffffff,c.negativeOne)&0x7fffffff))up=oldUp;
 const right=cross(facing,up),newUp=cross(right,facing);store(0x20n,right);store(0x30n,newUp);store(0x40n,facing.map(n=>(n^0x80000000)>>>0));
 const model=m.read64(p+0x110n),transform=s.transform(p),scale=r(0x120n);
 if(transform.length!==64)throw new Error('Fish transform requires 64 bytes');
 const matrix=new Uint8Array(64),input=new DataView(transform.buffer,transform.byteOffset,64),output=new DataView(matrix.buffer);
 for(let col=0;col<4;col++)for(let row=0;row<4;row++){
  const q=[0,1,2,3].map(i=>a.mul(input.getUint32(i*16+row*4,true),col<3?(i===col?scale[col]:0):(i===3?one:0)));
  output.setUint32(col*16+row*4,col===0?a.add(a.add(a.add(q[0],q[1]),q[2]),q[3]):a.add(q[3],a.add(q[2],a.add(q[0],q[1]))),true);
 }
 s.setModelTransform(model,matrix);
 const state=m.read32(p+0x17cn),weights:number[]=[];
 for(let i=0;i<4;i++){
  const target=state===i+1?one:0,old=m.read32(p+0x140n+BigInt(i*4));
  const next=value(a.sub(target,delta))>value(old)?a.add(delta,old):value(old)>value(a.add(delta,target))?a.sub(old,delta):target;
  m.write32(p+0x140n+BigInt(i*4),next);weights.push(next);
 }
 for(let i=0;i<4;i++)s.setAnimationWeight(m.read64(m.read64(p+0x110n)+104n),m.read32(p+0x130n+BigInt(i*4))|0,i===0?weights[0]:m.read32(p+0x140n+BigInt(i*4)));
 const hit=s.raycast(m.read64(game+0x138n),p+16n,bytes(evidence.vectors.down),a.add(m.read32(p+20n),one),0);
 if(hit.hit&&(hit.materialFlags&1)){
  const position=read(hit.position),distance=length(position.map((n,i)=>a.sub(n,m.read32(p+16n+BigInt(i*4))))),weight=a.sub(one,a.min(one,a.max(0,a.div(a.add(distance,c.negativeOne),c.rippleRange)))),color=evidence.vectors.rippleColor.map(n=>a.mul(weight,n));color[3]=one;
  const size=a.mul(weight,c.rippleSize),radius=a.mul(a.mul(weight,m.read32(m.read64(p+0x78n)+16n)),c.half);
  s.ripple(m.read64(game+0x500n),1,bytes(position),bytes(color),size,radius,one,one);
 }
 const light=m.read64(p+0x158n);if(light)s.setLightTransform(light,s.transform(p));
 const checked=s.transform(p);if(checked.length!==64)throw new Error('Fish transform requires 64 bytes');
 const check=new DataView(checked.buffer,checked.byteOffset,64);
 for(let i=0;i<16;i++)if((check.getUint32(i*4,true)&0x7fffffff)>0x7f800000)throw new NativeObjectFoundationFailure('FishV2.cpp',725,3,'!isNan( GetTransform() )');
 let timer=m.read32(p+0x160n);
 if(value(timer)>value(c.interactionCooldown)){
  const player=s.localPlayer(m.read64(game+0x280n)),avatar=m.read64(player+24n),distance=length(r(16n).map((n,i)=>a.sub(n,m.read32(avatar+16n+BigInt(i*4)))));
  if(value(m.read32(m.read64(p+0x78n)+16n))>value(distance)){
   m.write32(p+0x160n,one);s.playNamed(m.read64(m.read64(p+0x110n)+104n),'CritterAlert',one,one,0);
  }
  timer=m.read32(p+0x160n);
 }
 if(value(timer)>value(c.interactionCooldown)&&value(m.read32(p+0x168n))>value(c.interactionDelay)){
  const owner=m.read64(game+0x3c8n),position=new Uint8Array(m.bytes(p+16n,16)),range=m.read32(m.read64(p+0x78n)+16n),player=s.localPlayer(m.read64(game+0x280n));
  if(s.requestInteraction(owner,position,m.read32(player+0xe0n),range,1,1)){
   m.write32(p+0x160n,0);const count=a.mul(a.mul(bits(s.random()|0),c.randomScale),c.interactionDelay),v=value(count);
   const integer=!Number.isFinite(v)||v< -2147483648||v>=2147483648?-2147483648:Math.trunc(v);m.write8(p+0x164n,(integer+1)&255);
  }
 }
 timer=a.add(delta,m.read32(p+0x160n));m.write32(p+0x160n,timer);m.write32(p+0x168n,a.add(delta,m.read32(p+0x168n)));
 const count=m.bytes(p+0x164n,1)[0];
 if(count&&value(timer)>value(a.add(a.mul(bits(count),c.emitInterval),c.emitInterval))){
  m.write32(p+0x160n,0);m.write32(p+0x168n,0);const owner=m.read64(game+0x3c8n),radius=a.mul(a.mul(m.read32(m.read64(p+0x78n)+16n),c.emitRadiusScale),bits(count));m.write8(p+0x164n,count-1);
  const random=a.mul(bits(s.random()|0),c.randomScale);s.emitInteraction(owner,p,7,s.followUpParameters,radius,random,[1,1,1]);
 }
}
