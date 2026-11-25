import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {seekOriginalCreatureMotion} from './creature-motion-runtime';
import {followOriginalCreatureMotionRail,type CreatureMotionRailServices} from './creature-motion-rail-runtime';
import {appearOriginalDarkCreature,originalDarkCreatureAppearServices,type DarkCreatureAppearServices} from './dark-creature-appear-runtime';
import {switchOriginalDarkCreatureRail,type DarkCreatureRailServices} from './dark-creature-rail-runtime';
import evidence from '../../docs/dark-creature-motion-native.json';
const c=evidence.constants,v=evidence.vectors;
/** Register owners followed by all six stack owners in the original ABI. */
export interface DarkCreatureMotionWorld {avatars:bigint;actors:bigint;birds:bigint;scene:bigint;context:bigint;audio:bigint;interaction:bigint;auxiliary:bigint;player:bigint;extra:bigint;effects:bigint;}
export type DarkCreatureAttackMotionWorld=Pick<DarkCreatureMotionWorld,'avatars'|'actors'|'birds'|'player'|'extra'|'audio'|'effects'>;
export interface DarkCreatureMotionServices {
 arithmetic?:NatureArithmeticServices;
 palette:{patrol:Uint8Array;attack:Uint8Array;idle:Uint8Array};
 /** The original FollowRail tolerance path leaves this private W unwritten. */
 forceScratch:Uint8Array;
 seek(position:bigint,target:Uint8Array,weightBits:number):Uint8Array;
 appear(creature:bigint,audio:bigint):void;
 switchRail(creature:bigint,cooldown:number):void;
 followRail(position:bigint,rail:bigint,time:bigint,direction:number,toleranceBits:number,deltaBits:number,output:Uint8Array):void;
 findAvatar(barn:bigint,id:number):bigint;
 avatarEnabled(avatar:bigint):number;
 birdPosition(bird:bigint):Uint8Array;
 attack(creature:bigint,delta:Uint8Array,world:DarkCreatureAttackMotionWorld):void;
 chase(creature:bigint,delta:Uint8Array,audio:bigint,interaction:bigint):void;
 sine(argumentBits:number):number;
 exp(argumentBits:number):number;
 worldPosition(transform:bigint):Uint8Array;
 updateBounds(owner:bigint):void;
 setModelTransform(model:bigint,transform:Uint8Array):void;
}
/** Exact original outer Update motion phase 0x10026ddb0..0x10026e7da.
 * It stops after Model.SetTransform and callback-owner fields. The remaining
 * look direction, effects, audio and interactions are a separate pending phase. */
export function updateOriginalDarkCreatureMotionPhase(m:ModelBakeMemory,p:bigint,delta:Uint8Array,absoluteTimeBits:number,world:DarkCreatureMotionWorld,s:DarkCreatureMotionServices):Uint8Array {
 if(delta.length!==16||s.forceScratch.length!==16)throw new Error('DarkCreature motion requires packed delta and caller force scratch');
 if([s.palette.patrol,s.palette.attack,s.palette.idle].some(vector=>vector.length!==16))throw new Error('DarkCreature palette requires 16-byte vectors');
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic),dt=read(delta),time=dt[0],add=(x:readonly number[],y:readonly number[])=>x.map((n,i)=>a.add(n,y[i])),sub=(x:readonly number[],y:readonly number[])=>x.map((n,i)=>a.sub(n,y[i])),mul=(x:readonly number[],y:readonly number[])=>x.map((n,i)=>a.mul(n,y[i]));
 const at=(offset:bigint)=>read(m.bytes(p+offset,16)),put=(offset:bigint,x:readonly number[])=>m.bytes(p+offset,16).set(bytes(x));
 let palette=read(s.palette.idle);
 m.write32(p+0x120n,time);m.write32(p+0x124n,absoluteTimeBits);m.write8(p+0x1d4n,0);m.write8(p+0x2c0n,0);put(0xc0n,[0,0,0,0]);
 const accumulate=(force:Uint8Array)=>put(0xc0n,add(at(0xc0n),read(force)));
 const seek=(target:readonly number[])=>accumulate(s.seek(p+0x60n,bytes(target),c.one));
 const activeTarget=()=>{
  const kind=m.bytes(p+0x2c7n,1)[0];if(kind===1){const avatar=s.findAvatar(world.avatars,m.read32(p+0x2c8n));if(avatar&&(s.avatarEnabled(avatar)&255))put(0x130n,read(m.bytes(m.read64(avatar+24n)+16n,16)));}
  else if(kind===2){const index=m.read32(p+0x2ccn);if(index<64){const bird=m.read64(world.birds+16n+BigInt(index)*8n);if(bird&&m.bytes(bird+0xd0n,1)[0])put(0x130n,read(s.birdPosition(bird)));}}
 };
 const transition=()=>{if(m.bytes(p+0x2c7n,1)[0]){m.write32(p+0x100n,0x3dcccccd);m.write32(p+0x2e0n,1);}};
 if(!m.bytes(p+0x2c3n,1)[0]){seek(at(0xe0n));m.write8(p+0x2c4n,0);}
 else if(!m.bytes(p+0x2c4n,1)[0])s.appear(p,world.audio);
 else{
  const state=m.read32(p+0x2e0n);
  if(state===4){
   const remaining=a.sub(m.read32(p+0x180n),time);m.write32(p+0x180n,remaining);
   if(value(remaining)<=0){m.write8(p+0x2d0n,0);m.write32(p+0x140n,0);m.write32(p+0x178n,0);m.write32(p+0x100n,0x40800000);m.write32(p+0x2e0n,0);}
   palette=read(s.palette.patrol);m.write8(p+0x1d4n,1);m.write8(p+0x2c0n,1);transition();
  }else if(state===0){
   const params=m.read64(p+0x50n),cooldown=m.bytes(p+0x2c5n,1)[0],rail=m.read64(params+(cooldown?24n:16n));
   if(!cooldown){const current=m.read32(p+0x1a0n),duration=m.read32(params+12n);
    if(value(duration)>value(current)){
     const next=a.add(current,time);m.write32(p+0x1a0n,next);const remaining=a.sub(duration,next);
     if(value(c.fadeDuration)>value(remaining)){
      const ratio=a.min(c.one,a.max(0,a.div(remaining,c.fadeDuration))),angle=a.mul(a.add(a.mul(ratio,c.five),a.mul(a.sub(c.one,ratio),0)),c.waveScale);
      const wave=a.min(c.one,a.max(0,a.add(a.mul(s.sine(angle),c.half),c.half)));
      const patrol=read(s.palette.patrol);palette=add(patrol,mul(sub(palette,patrol),[wave,wave,wave,wave]));m.write8(p+0x2c0n,1);
     }
    }else{palette=read(s.palette.patrol);m.write8(p+0x1d4n,1);}
   }
   s.followRail(p+0x60n,rail,p+0x2d4n,m.bytes(p+0x2c6n,1)[0],0,time,s.forceScratch);accumulate(s.forceScratch);transition();
  }else{
   activeTarget();
   // Target callbacks can change the state before the dispatcher rereads it.
   const live=m.read32(p+0x2e0n);
   if(live===3){seek(add(at(0x60n),at(0xa0n)));const timer=a.add(time,m.read32(p+0x178n));m.write32(p+0x178n,timer);
    if(value(timer)>value(c.returnDuration)){s.switchRail(p,1);m.write8(p+0x2d0n,0);m.write32(p+0x140n,0);m.write32(p+0x178n,0);m.write32(p+0x100n,0x40800000);m.write32(p+0x2e0n,0);m.bytes(p+0x2c1n,2).fill(0);}palette=read(s.palette.idle);
   }else if(live===2){s.attack(p,delta,world);palette=read(s.palette.attack);m.write8(p+0x1d4n,1);}
   else if(live===1){const kind=m.bytes(p+0x2c7n,1)[0];let valid=true;
    if(kind===1){const avatar=s.findAvatar(world.avatars,m.read32(p+0x2c8n));valid=!!avatar&&!!(s.avatarEnabled(avatar)&255);}
    else if(kind===2){const index=m.read32(p+0x2ccn),bird=index<64?m.read64(world.birds+16n+BigInt(index)*8n):0n;valid=!!bird&&!!m.bytes(bird+0xd0n,1)[0];}
    if(!valid)m.write8(p+0x2c7n,0);s.chase(p,delta,world.audio,world.interaction);
    const ratio=a.min(c.one,a.max(0,a.div(m.read32(p+0x140n),c.five))),wave=s.sine(a.mul(a.add(a.mul(a.mul(ratio,ratio),c.chaseWave),a.mul(a.sub(c.one,a.mul(ratio,ratio)),0)),c.waveScale)),weight=a.min(c.one,a.max(0,a.add(a.mul(wave,c.half),c.half))),attack=read(s.palette.attack);
    palette=add(attack,mul(sub(read(s.palette.idle),attack),[weight,weight,weight,weight]));m.write8(p+0x1d4n,1);
   }
  }
 }
 const bounds=(owner:bigint,position:readonly number[])=>{m.bytes(owner+16n,16).set(bytes([c.five,0,0,0]));m.bytes(owner+32n,16).set(bytes(v.boundY));m.bytes(owner+48n,16).set(bytes(v.boundZ));m.bytes(owner+64n,16).set(bytes([position[0],position[1],position[2],c.one]));s.updateBounds(owner);};
 bounds(m.read64(p+0x230n),at(0x60n));const right=m.read64(p+0x218n);if(right){const position=read(s.worldPosition(right));bounds(m.read64(p+0x238n),position);}
 const position=at(0x60n);put(0xf0n,position);
 const smoothing=a.min(c.one,a.max(0,a.sub(c.one,s.exp(a.mul(time,c.speedSmooth))))),speed=a.add(a.mul(smoothing,m.read32(p+0x100n)),a.mul(a.sub(c.one,smoothing),m.read32(p+0xb4n)));m.write32(p+0xb4n,speed);
 let velocity=add(mul(at(0xc0n),[time,time,time,dt[3]]),at(0xa0n));const length=sqrt(sum(squared(velocity))),safeLength=Number.isNaN(value(length))?c.epsilon:a.max(c.epsilon,length),ratio=a.div(speed,safeLength),limit=Number.isNaN(value(ratio))?c.one:a.min(c.one,ratio);
 velocity=mul(velocity,[limit,limit,limit,0]);put(0xa0n,velocity);const next=add(position,mul(velocity,[time,time,time,dt[3]]));put(0x60n,next);
 let basisX:number[],basisY:number[],basisZ:number[];const q=squared(velocity),permutation=(x:readonly number[])=>[x[2],x[0],x[1],x[3]];
 const normalizeBasis=(cross:number[])=>{const x=permutation(cross),q=squared(cross),length=sqrt(a.add(q[1],a.add(q[2],q[0])));return value(length)>value(c.normalizeThreshold)?x.map((n,i)=>a.div(n,i===3?q[3]:length)):x;};
 if(value(sum(q))>value(c.half)){
  const length=sqrt(sum(q)),direction=value(length)>value(c.normalizeThreshold)?velocity.map((n,i)=>a.div(n,i===3?q[1]:length)):velocity;
  basisZ=direction.map(n=>(n^0x80000000)>>>0);let up=v.duplicatedUp;
  const dot=sum(mul(direction,up));if(value(dot&0x7fffffff)>value(c.upThreshold))up=v.fallbackUp;
  const cross=sub(mul(permutation(up),basisZ),mul(permutation(basisZ),up));basisX=normalizeBasis(cross);
  basisY=normalizeBasis(sub(mul(permutation(basisZ),basisX),mul(permutation(basisX),basisZ)));
  put(0x70n,basisX);put(0x80n,basisY);put(0x90n,basisZ);
 }else{basisX=at(0x70n);basisY=at(0x80n);basisZ=at(0x90n);}
 const scale=mul(at(0xd0n),v.modelScale),matrix=new Uint8Array(64);
 [basisX,basisY,basisZ].forEach((axis,i)=>matrix.set(bytes(axis.map((n,j)=>a.mul(j===3?0:n,scale[i]))),i*16));matrix.set(bytes([next[0],next[1],next[2],c.one]),48);
 s.setModelTransform(m.read64(p+0x1e0n),matrix);const model=m.read64(p+0x1e0n);m.write64(model+0x3b0n,0x100272160n);m.write64(model+0x3b8n,p);
 return bytes(palette);
}
/** Compose the actual raw seek/rail/appearance consumers with this phase;
 * chase/attack, scene geometry, model and audio owners remain explicit. */
export function originalDarkCreatureMotionPhaseServices(m:ModelBakeMemory,s:Omit<DarkCreatureMotionServices,'seek'|'switchRail'|'followRail'|'appear'>,rail:DarkCreatureRailServices,motionRail:CreatureMotionRailServices,appear:Omit<DarkCreatureAppearServices,'seek'|'switchRail'>):DarkCreatureMotionServices {
 const appearance=originalDarkCreatureAppearServices(m,{...appear,arithmetic:s.arithmetic??appear.arithmetic},rail);
 return {...s,seek:(p,target,weight)=>seekOriginalCreatureMotion(m,p,target,weight,0,s.arithmetic),switchRail:(p,cooldown)=>switchOriginalDarkCreatureRail(m,p,cooldown,rail),followRail:(p,rail,time,direction,tolerance,delta,out)=>followOriginalCreatureMotionRail(m,p,rail,time,direction,tolerance,delta,out,{...motionRail,arithmetic:s.arithmetic??motionRail.arithmetic}),appear:(p,audio)=>appearOriginalDarkCreature(m,p,audio,appearance)};
}
