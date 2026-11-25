import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {seekOriginalCreatureMotion} from './creature-motion-runtime';
import {originalDarkCreatureMotionPhaseServices,type DarkCreatureMotionServices,type DarkCreatureAttackMotionWorld} from './dark-creature-motion-runtime';
import type {DarkCreatureRailServices} from './dark-creature-rail-runtime';
import type {CreatureMotionRailServices} from './creature-motion-rail-runtime';
import type {DarkCreatureAppearServices} from './dark-creature-appear-runtime';
import evidence from '../../docs/dark-creature-combat-native.json';
const c=evidence.constants,v=evidence.vectors;
export type DarkCreatureCombatSound='DuskCreatureWindup'|'duskstart2lockon'|'DuskCreatureAttack'|'DuskCreatureHit';
export interface DarkCreatureHitWorld {avatars:bigint;birds:bigint;particleOwner:bigint;audio:bigint;sceneOwner:bigint;}
export interface DarkCreatureCombatServices {
 arithmetic?:NatureArithmeticServices;
 /** Explicit mutable native BSS owners and the private, unwritten up-vector W. */
 globals:{hitTemplate:Uint8Array;hitPalette:Uint8Array;hitUpScratch:Uint8Array};
 seek(position:bigint,target:Uint8Array,weightBits:number):Uint8Array;
 exp(argumentBits:number):number;
 worldPosition(transform:bigint):Uint8Array;
 objectId(handle:bigint):bigint;
 soundPlaying(handle:bigint):number;
 play(owner:bigint,name:DarkCreatureCombatSound,options:Uint8Array,parameters:Uint8Array):{handle:bigint;id:bigint};
 updateSound(handle:bigint,parameters:Uint8Array):void;
 playAnimation(owner:bigint,parameters:Uint8Array):void;
 interaction(owner:bigint,creature:bigint,kind:number,template:bigint,sizeBits:number,secondFloatBits:number,firstFlag:number,secondFlag:number,lastFlag:number):void;
 birdPosition(bird:bigint):Uint8Array;
 hitBird(bird:bigint,owner:bigint):void;
 localAvatar(barn:bigint):bigint;
 setLocalHit(owner:bigint,kind:number):void;
 finishLocalHit(owner:bigint):void;
 createParticle(owner:bigint,position:Uint8Array,up:Uint8Array,template:bigint,flag:number):bigint;
 hit(creature:bigint,target:bigint,world:DarkCreatureHitWorld):void;
}
function options(position:Uint8Array,volume:number,near:number,far:number){const b=new Uint8Array(128),d=new DataView(b.buffer);d.setUint32(0,volume,true);b[13]=1;b.set(position,16);d.setUint32(72,near,true);d.setUint32(76,far,true);d.setUint32(112,0xc31,true);return b;}
/** Whole original Chase 0x1002703d0. Horizontal velocity damping preserves
 * Y/W, and state resets happen after animation and interaction callbacks. */
export function chaseOriginalDarkCreature(m:ModelBakeMemory,p:bigint,delta:number,audio:bigint,interaction:bigint,s:DarkCreatureCombatServices){
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic),at=(o:bigint)=>read(m.bytes(p+o,16));
 if(!m.bytes(p+0x2c7n,1)[0]){m.write8(p+0x2d0n,0);m.write32(p+0x140n,0);m.write32(p+0x178n,0);m.write32(p+0x100n,0x40800000);m.write32(p+0x2e0n,0);return;}
 const head=read(s.worldPosition(m.read64(p+0x228n)));let direction=at(0x1b0n).map((n,i)=>i===1?0:a.sub(n,head[i]));const q=squared(direction),length=sqrt(sum(q));
 if(value(length)>value(c.normalizeThreshold))direction=direction.map((n,i)=>a.div(n,i===3?q[1]:length));
 const position=at(0x60n),target=direction.map((n,i)=>a.add(a.add(a.mul(n,v.chaseTargetScale[i]),position[i]),v.up[i]));
 const force=read(s.seek(p+0x60n,bytes(target),c.one));m.bytes(p+0xc0n,16).set(bytes(at(0xc0n).map((n,i)=>a.add(n,force[i]))));
 const velocity=at(0xa0n),weight=a.min(c.one,a.max(0,a.sub(c.one,s.exp(a.mul(delta,c.chaseSmooth))))),inverse=a.sub(c.one,weight),zeroTerm=a.mul(weight,0);
 m.write32(p+0xa0n,a.add(zeroTerm,a.mul(velocity[0],inverse)));m.write32(p+0xa4n,velocity[1]);m.write32(p+0xa8n,a.add(zeroTerm,a.mul(velocity[2],inverse)));
 const validPlaying=(offset:bigint)=>{const handle=m.read64(p+offset),id=m.read64(p+offset+8n);return !!handle&&!!id&&s.objectId(handle)===id&&!!(s.soundPlaying(m.read64(p+offset))&255);};
 if(!validPlaying(0x290n)){const sound=s.play(audio,'DuskCreatureWindup',options(m.bytes(p+0x60n,16),c.one,0x40a00000,0x42480000),new Uint8Array(0x1b0));m.write64(p+0x290n,sound.handle);m.write64(p+0x298n,sound.id);}
 if(!validPlaying(0x2a0n)){const sound=s.play(audio,'duskstart2lockon',new Uint8Array(128),new Uint8Array(0x1b0));m.write64(p+0x2a0n,sound.handle);m.write64(p+0x2a8n,sound.id);}
 const animation=new Uint8Array(0x1b0),d=new DataView(animation.buffer);animation[0]=0x27;d.setUint32(32,c.one,true);d.setUint32(416,1,true);d.setUint32(428,1,true);
 const owner=m.read64(p+0x250n),id=m.read64(p+0x258n);if(owner&&id&&s.objectId(owner)===id)s.playAnimation(m.read64(p+0x250n),animation);
 const timer=a.add(delta,m.read32(p+0x140n));m.write32(p+0x140n,timer);
 if(value(timer)>value(c.chaseDuration)){
  s.interaction(interaction,p,9,0x10203f610n,a.mul(m.read32(p+0xd0n),c.half),0,0,1,1);
  m.bytes(p+0x150n,16).set(m.bytes(p+0x60n,16));m.write32(p+0x170n,0);m.write8(p+0x174n,0);m.write32(p+0xb4n,0x41c80000);m.write32(p+0x100n,0x41c80000);m.write32(p+0x2e0n,2);
 }
}
/** Whole original Attack 0x100270960. Its predicted-position probe does not
 * write integrated position/velocity; the outer Update does that afterward. */
export function attackOriginalDarkCreature(m:ModelBakeMemory,p:bigint,delta:Uint8Array,w:DarkCreatureAttackMotionWorld,s:DarkCreatureCombatServices){
 if(delta.length!==16)throw new Error('DarkCreature attack requires packed delta');
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic),dt=read(delta),at=(o:bigint)=>read(m.bytes(p+o,16));let force:number[];
 if(m.bytes(p+0x174n,1)[0]){
  const destination=at(0x160n);let direction=destination.map((n,i)=>i===1?0:a.sub(n,m.read32(p+0x150n+BigInt(i*4))));const q=squared(direction),length=sqrt(sum(q));if(value(length)>value(c.normalizeThreshold))direction=direction.map((n,i)=>a.div(n,i===3?q[1]:length));
  const target=destination.map((n,i)=>a.add(n,a.add(a.mul(direction[i],v.attackDirectionScale[i]),v.attackUp[i]))),phase=a.add(a.div(m.read32(p+0x170n),c.attackDuration),c.attackOffset),weight=a.min(c.one,a.max(0,a.add(phase,phase))),speed=a.add(a.mul(weight,c.attackSpeedHigh),a.mul(a.sub(c.one,weight),c.attackSpeedLow));m.write32(p+0x100n,speed);
  force=read(s.seek(p+0x60n,bytes(target),c.one)).map(n=>a.mul(m.read32(p+0x100n),n));
 }else{
  const predicted=at(0x1c0n).map((n,i)=>a.sub(a.add(a.mul(i===3?dt[3]:dt[0],a.mul(v.attackForceScale[i],n)),m.read32(p+0x1b0n+BigInt(i*4))),v.attackTargetOffset[i]));m.bytes(p+0x160n,16).set(bytes(predicted));
  force=read(s.seek(p+0x60n,m.bytes(p+0x160n,16),c.one)).map((n,i)=>a.mul(v.attackForceScale[i],n));
 }
 m.bytes(p+0xc0n,16).set(bytes(force.map((n,i)=>a.add(n,m.read32(p+0xc0n+BigInt(i*4))))));
 const update=(handle:bigint,packet:Uint8Array)=>{const id=m.read64(p+0x278n);if(handle&&id&&s.objectId(handle)===id)s.updateSound(m.read64(p+0x270n),packet);};
 const handle=m.read64(p+0x270n),id=m.read64(p+0x278n);
 if(handle&&id&&s.objectId(handle)===id&&(s.soundPlaying(m.read64(p+0x270n))&255)){
  const packet=new Uint8Array(128);packet.set(m.bytes(p+0x60n,16),16);new DataView(packet.buffer).setUint32(112,0x20,true);update(m.read64(p+0x270n),packet);
 }else if(!m.bytes(p+0x2c1n,1)[0]){
  const distance=sqrt(sum(squared(at(0x60n).map((n,i)=>a.sub(n,m.read32(p+0x160n+BigInt(i*4))))))),weight=a.min(c.one,a.max(0,a.div(a.add(distance,c.pitchOffset),c.pitchDivisor))),pitch=a.add(a.mul(weight,c.half),a.mul(a.sub(c.one,weight),c.pitchHigh));
  const sound=s.play(w.audio,'DuskCreatureAttack',options(m.bytes(p+0x60n,16),c.one,0x41f00000,0x42c80000),new Uint8Array(0x1b0));m.write64(p+0x270n,sound.handle);m.write64(p+0x278n,sound.id);
  const packet=new Uint8Array(128),d=new DataView(packet.buffer);d.setUint32(4,pitch,true);d.setUint32(112,2,true);
  if(sound.handle&&sound.id&&s.objectId(sound.handle)===sound.id)s.updateSound(m.read64(p+0x270n),packet);m.write8(p+0x2c1n,1);
 }
 const velocity=at(0xc0n).map((n,i)=>a.add(a.mul(i===3?dt[3]:dt[0],n),m.read32(p+0xa0n+BigInt(i*4)))),length=sqrt(sum(squared(velocity))),denominator=Number.isNaN(value(length))?c.epsilon:a.max(c.epsilon,length),ratio=a.div(m.read32(p+0xb4n),denominator),limit=Number.isNaN(value(ratio))?c.one:a.min(c.one,ratio),next=velocity.map((n,i)=>a.add(a.mul(i===3?dt[3]:dt[0],a.mul(n,i===3?0:limit)),m.read32(p+0x60n+BigInt(i*4))));
 const distanceSquared=sum(squared(at(0x160n).map((n,i)=>a.sub(n,next[i]))));
 if(value(c.attackDuration)>value(distanceSquared)&&!m.bytes(p+0x174n,1)[0])s.hit(p,p+0x160n,{avatars:w.avatars,birds:w.birds,particleOwner:w.player,audio:w.audio,sceneOwner:w.effects});
 const timer=a.add(dt[0],m.read32(p+0x170n));m.write32(p+0x170n,timer);if(value(timer)>value(c.attackDuration)){m.write32(p+0x100n,0x41480000);m.write32(p+0x2e0n,3);}
}
/** Whole original Hit 0x100270fd0, including actual fixed AvatarBarn layout
 * and active-field readers. Geometry/effect/audio consumers stay explicit. */
export function hitOriginalDarkCreature(m:ModelBakeMemory,p:bigint,target:bigint,w:DarkCreatureHitWorld,s:DarkCreatureCombatServices){
 if(s.globals.hitTemplate.length!==8||s.globals.hitPalette.length!==16||s.globals.hitUpScratch.length!==16)throw new Error('DarkCreature hit requires explicit template, palette and up-vector scratch');
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic);let total=[0,0,0,0],count=0,local=false;const birds=m.read32(w.birds+0x210n);
 for(let i=0;i<birds;i++){if(i>=64)continue;const bird=m.read64(w.birds+16n+BigInt(i*8));if(!bird||!m.bytes(bird+0xd0n,1)[0])continue;const radius=m.read32(m.read64(bird+0x78n)+24n),position=read(s.birdPosition(bird)),distance=a.sub(sum(squared(position.map((n,j)=>a.sub(n,m.read32(target+BigInt(j*4)))))),a.mul(radius,radius));
  if(value(c.hitDistanceSquared)>value(distance)){s.hitBird(bird,m.read64(w.sceneOwner+0xe8n));total=total.map((n,j)=>a.add(n,position[j]));count++;}
 }
 for(let i=0;i<16;i++){const avatar=w.avatars+32n+BigInt(i)*0x2230n;if(!m.bytes(avatar+0x21b2n,1)[0])continue;const position=read(m.bytes(m.read64(avatar+24n)+16n,16));
  if(value(c.hitDistanceSquared)>value(sum(squared(position.map((n,j)=>a.sub(n,m.read32(target+BigInt(j*4)))))))){if(m.bytes(avatar+0x1ef8n,1)[0])local=true;total=total.map((n,j)=>a.add(n,position[j]));count++;}
 }
 if(count&&!m.read64(p+0x1f8n)){
  total=total.map((n,i)=>a.div(n,i===3?0:bits(count)));
  if(local){const avatar=s.localAvatar(w.avatars);s.setLocalHit(m.read64(avatar+48n),3);s.finishLocalHit(m.read64(avatar+48n));const owner=m.read64(w.sceneOwner+0x160n);m.bytes(owner+0x74n,16).set(bytes(v.localHitEffect));m.write32(owner+0x84n,0x3e4ccccd);}
  const up=new Uint8Array(s.globals.hitUpScratch);up.set(bytes(v.up).subarray(0,12));const template=new DataView(s.globals.hitTemplate.buffer,s.globals.hitTemplate.byteOffset,8).getBigUint64(0,true);
  const particle=s.createParticle(w.particleOwner,bytes(total),up,template,0);m.write64(p+0x1f8n,particle);m.bytes(particle+0x120n,16).set(s.globals.hitPalette);m.bytes(particle+0x110n,16).set(s.globals.hitPalette);m.write32(p+0x200n,c.one);
  const distance=sqrt(sum(squared(total.map((n,i)=>a.sub(n,m.read32(target+BigInt(i*4))))))),ratio=a.div(c.one,distance),volume=Number.isNaN(value(ratio))?c.one:a.min(c.one,ratio);
  s.play(w.audio,'DuskCreatureHit',options(bytes(total),volume,c.one,0x41200000),new Uint8Array(0x1b0));
 }
 m.write8(p+0x174n,1);
}
export function originalDarkCreatureCombatServices(m:ModelBakeMemory,s:Omit<DarkCreatureCombatServices,'seek'|'hit'>):DarkCreatureCombatServices {
 return {...s,seek:(p,target,weight)=>seekOriginalCreatureMotion(m,p,target,weight,0,s.arithmetic),hit:(p,target,w)=>hitOriginalDarkCreature(m,p,target,w,{...s,seek:()=>{throw new Error('Hit does not seek');},hit:()=>{throw new Error('Hit does not recurse');}})};
}
/** Actual chase/attack/hit consumers inside the verified partial outer Update. */
export function originalDarkCreatureCombatMotionPhaseServices(m:ModelBakeMemory,s:Omit<DarkCreatureMotionServices,'chase'|'attack'>,rail:DarkCreatureRailServices,motionRail:CreatureMotionRailServices,appear:Omit<DarkCreatureAppearServices,'seek'|'switchRail'>,combat:DarkCreatureCombatServices):DarkCreatureMotionServices {
 return originalDarkCreatureMotionPhaseServices(m,{...s,chase:(p,delta,audio,interaction)=>chaseOriginalDarkCreature(m,p,new DataView(delta.buffer,delta.byteOffset,16).getUint32(0,true),audio,interaction,combat),attack:(p,delta,w)=>attackOriginalDarkCreature(m,p,delta,w,combat)},rail,motionRail,appear);
}
