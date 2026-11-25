import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {originalForceVectors,pursueOriginalCreatureSteering,avoidOriginalCreatureSteering,fleeOriginalCreatureSteering,wanderOriginalCreatureSteering,type CreatureAvoidanceServices} from './creature-force-runtime';
import {beginOriginalCreatureSteering,endOriginalCreatureSteering,seekOriginalCreatureSteering,type CreatureSteeringServices} from './creature-steering-runtime';
import {seekOriginalCreatureDirection} from './creature-follow-runtime';
import {flockOriginalCreatureSteering,type CreatureFlockingServices} from './creature-flocking-runtime';
import {originalFishMovementServices,type FishUpdateServices} from './fish-update-runtime';
import evidence from '../../docs/fish-ai-native.json';

const c=evidence.constants,one=c.one;
export type FishMetadataKind='Object'|'Entity'|'Marker'|'Rail'|'Mote'|'Player'|'Actor';
export interface FishMetadataServices {
 metadata(kind:FishMetadataKind):bigint;
 /** The native conversion can change its input reference on success or
  * failure. The next conversion must receive that post-call reference. */
 cast(meta:bigint,object:bigint,source:bigint):{object:bigint;cast:bigint};
}
function cast(s:FishMetadataServices,object:bigint,kind:FishMetadataKind,source:'Object'|'Entity'){
 const from=s.metadata(source),to=s.metadata(kind);return s.cast(to,object,from);
}
/** Whole FishV2 neighbor predicate 0x100338570. */
export function filterOriginalFishNeighbor(object:bigint,s:FishMetadataServices){
 const player=cast(s,object,'Player','Entity');return player.cast?1:cast(s,player.object,'Actor','Entity').cast?1:0;
}
/** Whole FishV2 flock predicate 0x1003385f0. */
export function filterOriginalFishFlock(object:bigint,s:FishMetadataServices){return cast(s,object,'Actor','Entity').cast?1:0;}
export type FishAIAnimation='CritterAlert'|'CritterExcite'|'CritterBite'|'CritterBiteDone'|'CritterRoll'|'CritterBiteOpen';
export interface FishAIServices extends FishMetadataServices {
 arithmetic?:NatureArithmeticServices;
 debugScaleBits?:number;
 /** Private caller stack velocity W is unwritten for the flee Marker. */
 markerVelocityWBits:number;
 identityAxes:Uint8Array;
 soulParticleTemplate:bigint;
 random():number;
 query(world:bigint,position:bigint,out:bigint,capacity:32,filter:bigint,radius:number,reserved:0):number;
 begin(state:bigint,motion:Uint8Array,delta:number,maximum:number):void;
 avoidance(state:bigint,weight:number,lookahead:number,flag:number):void;
 flee(state:bigint,motion:Uint8Array,weight:number,minimum:number,maximum:number,prediction:number):void;
 markerRadius(marker:bigint):number;
 markerCount(marker:bigint):number;
 nearestRail(rail:bigint,position:Uint8Array):{parameter:number;position:Uint8Array};
 initialRail(rail:bigint):Uint8Array;
 sampleRail(rail:bigint,parameter:number):Uint8Array;
 seekDirect(state:bigint,position:Uint8Array,weight:number,speed:number):void;
 enabled(mote:bigint):number;
 consume(mote:bigint,owner:bigint,game:bigint):void;
 particle(owner:bigint,position:Uint8Array,direction:Uint8Array,template:bigint,flag:0,scale:number):void;
 sound(owner:bigint,name:'soulhit',options:Uint8Array,parameters:Uint8Array):void;
 pursuit(state:bigint,motion:Uint8Array,velocity:Uint8Array,weight:number,prediction:number):void;
 playNamed(animation:bigint,name:FishAIAnimation,flags:0,weight:number,speed:number):void;
 motionState(object:bigint):Uint8Array;
 componentPosition(component:bigint):Uint8Array;
 asinBits(argument:number):number;
 sincosBits(argument:number):Uint8Array;
 seekArrival(state:bigint,position:Uint8Array,weight:number,arrival:number):void;
 interact(component:bigint,position:Uint8Array,first:0,second:0,weight:number,scale:number):void;
 modelParameter(model:bigint,index:0,name:'u_chamAmount',amount:number):void;
 wander(state:bigint,weight:number,radius:number,distance:number,jitter:number,vertical:number):void;
 flock(state:bigint,self:bigint,filter:bigint,weight:number,alignment:number,cohesion:number,separation:number,radius:number):void;
 end(state:bigint,avoid:number):Uint8Array;
}
/** Production Update composition: the outer update consumes the actual AI,
 * TurnDirection, Bank and motion-transform implementations. */
export function originalFishAIUpdateServices(m:ModelBakeMemory,ai:FishAIServices,s:Omit<FishUpdateServices,'updateAI'|'turnDirection'|'bank'|'transform'>):FishUpdateServices {
 return originalFishMovementServices(m,{...s,updateAI:(fish,game)=>updateOriginalFishAI(m,fish,game,ai)});
}
type FishSteeringMethods='begin'|'avoidance'|'flee'|'seekDirect'|'pursuit'|'seekArrival'|'wander'|'flock'|'end';
export interface FishAISteeringDependencies {
 avoidance:CreatureAvoidanceServices;
 collision:CreatureSteeringServices;
 flocking:CreatureFlockingServices;
}
/** Compose the original steering bodies. A private motion/position buffer
 * models native stack arguments without writing temporary data to the scene. */
export function originalFishAISteeringServices(m:ModelBakeMemory,s:Omit<FishAIServices,FishSteeringMethods>,d:FishAISteeringDependencies):FishAIServices {
 const address=0xffff00000000n,storage=new Uint8Array(96),view=new DataView(storage.buffer);
 const privateAddress=(p:bigint)=>p>=address&&p<address+96n;
 const memory:ModelBakeMemory={...m,
  bytes:(p,n)=>privateAddress(p)?storage.subarray(Number(p-address),Number(p-address)+n):m.bytes(p,n),
  read32:p=>privateAddress(p)?view.getUint32(Number(p-address),true):m.read32(p),
  read64:p=>privateAddress(p)?view.getBigUint64(Number(p-address),true):m.read64(p),
  write32:(p,n)=>privateAddress(p)?view.setUint32(Number(p-address),n,true):m.write32(p,n),
  write64:(p,n)=>privateAddress(p)?view.setBigUint64(Number(p-address),n,true):m.write64(p,n),
 };
 const arithmetic=s.arithmetic;
 return {...s,
  begin:(state,motion,delta,maximum)=>{storage.set(motion);beginOriginalCreatureSteering(memory,state,address,delta,maximum);},
  avoidance:(state,weight,lookahead,flag)=>avoidOriginalCreatureSteering(m,state,weight,lookahead,flag,{...d.avoidance,arithmetic}),
  flee:(state,motion,weight,minimum,maximum,prediction)=>fleeOriginalCreatureSteering(m,state,motion,weight,minimum,maximum,prediction,arithmetic),
  seekDirect:(state,position,weight,speed)=>seekOriginalCreatureDirection(m,state,position,weight,speed,arithmetic),
  pursuit:(state,motion,velocity,weight,prediction)=>pursueOriginalCreatureSteering(m,state,motion,velocity,weight,prediction,arithmetic),
  seekArrival:(state,position,weight,arrival)=>{storage.set(position);seekOriginalCreatureSteering(memory,state,address,weight,arrival,arithmetic);},
  wander:(state,weight,radius,distance,jitter,vertical)=>wanderOriginalCreatureSteering(m,state,weight,radius,distance,jitter,vertical,s),
  flock:(state,self,filter,weight,alignment,cohesion,separation,radius)=>flockOriginalCreatureSteering(m,state,self,filter,{weightBits:weight,alignmentBits:alignment,cohesionBits:cohesion,separationBits:separation,radiusBits:radius},{...d.flocking,arithmetic}),
  end:(state,avoid)=>{endOriginalCreatureSteering(memory,address,state,avoid,{...d.collision,arithmetic});return new Uint8Array(storage.subarray(0,16));},
 };
}
/** Exact packed quaternion sequence in FishV2.AI's player interaction.
 * Keeping the scalar instructions' upper lanes preserves native NaNs/W. */
function interactionDirection(direction:number[],packed:Uint8Array,s:FishAIServices){
 const {a,read}=originalForceVectors(s.arithmetic),x0=read(packed),x1=[x0[1],x0[1],x0[3],x0[3]],x3=[...direction],x2=[x3[2],x3[3],x3[0],x3[1]];
 const mul=(x:number[],y:number[])=>x.map((n,i)=>a.mul(n,y[i])),add=(x:number[],y:number[])=>x.map((n,i)=>a.add(n,y[i]));
 const scalar=(x:number[],n:number)=>[n,...x.slice(1)];
 let x4=scalar(x1,a.mul(x1[0],0)),x5=scalar(x3,a.mul(x3[0],0));x4=scalar(x5,a.add(x5[0],x4[0]));
 let x6=scalar(x2,a.mul(x2[0],0));const x8=scalar(x4,a.sub(x4[0],x6[0]));
 let t2=scalar(x2,a.mul(x2[0],x1[0])),x7=scalar(x3,a.mul(x3[0],x0[0]));t2=scalar(t2,a.sub(t2[0],x7[0]));
 x7=scalar(x0,a.mul(x0[0],0));x5=scalar(x5,a.add(x5[0],x7[0]));const x10=scalar(x6,a.add(x6[0],x5[0]));
 // INSERTPS 0x9d copies source Z into destination Y and clears X/Z/W.
 x6=[0,x3[2],0,0];x7=[x10[0],x0[0],x10[2],x10[3]];x6=mul(x6,x7);
 x7=[x3[0],x3[0],x3[2],x3[2]];x7[0]=t2[0];x7=mul(x1,x7);x7=add(x6,x7);
 x4=[x7[1],x7[1],x7[3],x7[3]];
 let t3=scalar(x1,a.mul(x1[0],x4[0]));t3=scalar(x6,a.add(x6[0],t3[0]));x6=scalar(x8,a.mul(x8[0],0));t3=scalar(t3,a.sub(t3[0],x6[0]));
 x5=scalar(x0,a.mul(x0[0],t2[0]));t3=scalar(x5,a.add(x5[0],t3[0]));x5=scalar(x0,a.mul(x0[0],x10[0]));
 let t1=scalar(x1,a.mul(x1[0],x8[0]));t1=scalar(x5,a.add(x5[0],t1[0]));t2=scalar(t2,a.mul(t2[0],0));t1=scalar(t1,a.sub(t1[0],t2[0]));t2=scalar(x4,a.mul(x4[0],0));t1=scalar(t2,a.add(t2[0],t1[0]));
 let t0=scalar(x0,a.mul(x0[0],x4[0]));t0=scalar(x7,a.sub(x7[0],t0[0]));t0=scalar(x6,a.add(x6[0],t0[0]));
 t1=[t3[0],t1[0],t3[2],t3[3]];t0=[t1[0],t1[1],t0[0],t1[3]];return t0;
}

/** Whole FishV2.AI 0x100335a40..0x1003370c0, including all five switch
 * branches. World, metadata, steering and resource consumers keep their
 * native callback order. Scene ownership is a separate acceptance gate. */
export function updateOriginalFishAI(m:ModelBakeMemory,p:bigint,game:bigint,s:FishAIServices){
 const {a,read,bytes,length,normalize,sum}=originalForceVectors(s.arithmetic),params=()=>m.read64(p+0x78n),field=(n:number)=>m.read32(params()+BigInt(n)),position=()=>read(m.bytes(p+16n,16));
 const snapshot=(object:bigint)=>new Uint8Array(m.bytes(object+16n,92));
 const clock=m.read64(game+0x160n);let delta=a.min(c.maximumDelta,a.max(c.minimumDelta,a.mul(a.mul(s.debugScaleBits??one,m.read32(clock+32n)),m.read32(clock+20n))));
 let amount=m.read32(p+0x184n);const radius=a.mul(length(read(m.bytes(p+0x80n,16))),field(16));
 let timer=m.read32(p+0x294n);
 if(0>=value(timer)){const count=s.query(m.read64(game+0x220n),p+16n,p+0x190n,32,0x100338570n,c.queryRadius,0);m.write32(p+0x290n,count);timer=c.neighborInterval;m.write32(p+0x294n,timer);}
 m.write32(p+0x294n,a.sub(timer,delta));
 const oldTimer=m.read32(p+0x188n);timer=oldTimer;
 if(0>=value(timer)){const random=a.mul(bits(s.random()|0),c.randomScale);timer=a.add(random,a.mul(a.sub(one,random),c.half));m.write32(p+0x188n,timer);}
 m.write32(p+0x188n,a.sub(timer,delta));
 const state=p+0x2a0n;s.begin(state,snapshot(p),delta,field(24));
 if(m.bytes(params()+0x50n,1)[0])s.avoidance(state,field(0x74),a.mul(a.div(field(20),field(24)),c.neighborInterval),m.bytes(params()+0x51n,1)[0]);
 const marker=m.read64(params()+0x40n);
 if(marker){
  const motion=new Uint8Array(92),d=new DataView(motion.buffer);motion.set(m.bytes(marker+16n,16));
  if(s.identityAxes.length!==48)throw new Error('Fish Marker requires the original 48-byte identity axes');motion.set(s.identityAxes,16);
  d.setUint32(76,s.markerVelocityWBits,true);d.setUint32(80,m.read32(p+0x60n),true);d.setUint32(84,one,true);
  s.flee(state,motion,field(0x78),c.markerMinimum,c.six,one);
 }
 let target=position();const markerClump=m.read64(params()+0x48n);
 if(markerClump){const count=m.read32(markerClump+16n);let nearest=c.maximumFloat;
  for(let i=0;i<count;i++){
   const clump=m.read64(params()+0x48n);if(i>=m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');
   const marker=cast(s,m.read64(m.read64(clump+8n)+BigInt(i*8)),'Marker','Object').cast;
   if(!marker)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
   const r=s.markerRadius(marker),n=s.markerCount(marker)>>>0,score=a.add(a.mul(bits(n),c.markerCountScale),r);
   if(value(nearest)>value(score)){target=read(m.bytes(marker+0x40n,16));nearest=score;}
  }
 }
 const rails=(offset:number)=>{
  let clump=m.read64(params()+BigInt(offset));if(!clump||!m.read32(clump+16n))return false;
  let nearest=c.maximumFloat,selected=0n;
  for(let i=0;;i++){
   const rail=cast(s,m.read64(m.read64(clump+8n)+BigInt(i*8)),'Rail','Object').cast;
   if(!rail)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
   if(m.bytes(rail+0x41n,1)[0]){
    const point=m.bytes(rail+0x2cn,1)[0]||rail===m.read64(p+0x490n)?s.nearestRail(rail,bytes(target)).position:s.initialRail(rail);
    const distance=length(read(point).map((n,i)=>a.sub(n,target[i])));
    if(value(nearest)>value(distance))selected=rail;nearest=a.min(distance,nearest);
   }
   clump=m.read64(params()+BigInt(offset));if(i+1>=m.read32(clump+16n))break;
  }
  if(selected){const near=s.nearestRail(selected,new Uint8Array(m.bytes(p+16n,16))),next=a.add(near.parameter,a.div(c.railAdvance,m.read32(selected+24n))),wrap=a.sub(next,bits(Math.floor(value(next))));
   s.seekDirect(state,s.sampleRail(selected,wrap),one,c.seekSpeed);m.write64(p+0x490n,selected);
  }else m.write32(p+0x17cn,offset===0x30?2:1);
  return true;
 };
 const play=(name:FishAIAnimation)=>s.playNamed(m.read64(m.read64(p+0x110n)+104n),name,0,one,one);
 const front=(difference:number[])=>sum(difference.map((n,i)=>a.mul(n,(m.read32(p+0x40n+BigInt(i*4))^evidence.vectors.sign[i])>>>0)));
 const neighbors=(kind:'Player'|'Mote',visit:(object:bigint)=>boolean)=>{
  for(let i=0;i<m.read32(p+0x290n);i++){
   const object=cast(s,m.read64(p+0x190n+BigInt(i*8)),kind,'Entity').cast;
   if(object&&visit(object))return true;
  }return false;
 };
 let behavior=m.read32(p+0x17cn);
 if(behavior===1||behavior===4){rails(0x30);behavior=m.read32(p+0x17cn);amount=a.add(amount,a.mul(delta,c.amountGrowth));m.write32(p+0x180n,a.max(a.add(a.mul(delta,c.alertDecay),m.read32(p+0x180n)),0));}
 switch(behavior){
  case 1:
   if(0>=value(oldTimer)){
    if(value(m.read32(p+0x180n))>=value(c.alertThreshold)){play('CritterAlert');m.write32(p+0x17cn,4);}
    else if(value(m.read32(p+0x184n))>=1){play('CritterExcite');m.write32(p+0x17cn,2);}
    else if(value(c.alertThreshold)>value(m.read32(p+0x160n)))m.write32(p+0x17cn,5);
   }break;
  case 2:
   rails(0x28);
   if(0>=value(oldTimer)){
    if(value(m.read32(p+0x180n))>=1){play('CritterAlert');m.write32(p+0x17cn,4);}
    else if(0>=value(m.read32(p+0x184n))&&(m.read32(m.read64(m.read64(p+0x110n)+104n)+12n)|0)<=0){play('CritterRoll');m.write32(p+0x17cn,1);}
    else if(1>value(m.read32(p+0x160n)))m.write32(p+0x17cn,5);
    else neighbors('Mote',mote=>{
     if(!s.enabled(mote))return false;const distance=length(read(m.bytes(mote+16n,16)).map((n,i)=>a.sub(n,position()[i])));
     if(value(c.fleeMaximum)>value(distance)){play('CritterBiteOpen');m.write32(p+0x17cn,3);return true;}return false;
    });
   }break;
  case 3:{
   let eaten=false;
   if(m.read32(p+0x290n)){delta=a.div(c.biteAmount,radius);const outer=a.mul(radius,c.six);
    neighbors('Mote',mote=>{
     if(!s.enabled(mote))return false;const difference=read(m.bytes(mote+16n,16)).map((n,i)=>a.sub(n,position()[i])),q=difference.map(n=>a.mul(n,n)),distance=length(difference);
     if(value(radius)>value(distance)){
      s.consume(mote,m.read64(game+0xe8n),game);
      const point=new Uint8Array(m.bytes(mote+16n,16)),direction=value(distance)>value(c.epsilon)?difference.map((n,i)=>a.div(n,i===3?q[1]:distance)):difference;
      s.particle(m.read64(game+0x438n),point,bytes(direction),s.soulParticleTemplate,0,c.particleScale);
      const options=new Uint8Array(128),d=new DataView(options.buffer);d.setUint32(0,one,true);options[13]=1;options.set(m.bytes(mote+16n,16),16);d.setBigUint64(72,0x40f000003f800000n,true);d.setUint32(112,0xc31,true);
      s.sound(m.read64(game+0x5c8n),'soulhit',options,new Uint8Array(0x1b0));amount=a.sub(amount,delta);eaten=true;
     }else if(value(outer)>value(distance)&&value(front(difference))>value(c.frontThreshold)){
      const motion=snapshot(mote),velocity=new Uint8Array(m.bytes(mote+80n,16));s.pursuit(state,motion,velocity,one,one);
     }return false;
    });
   }
   if(eaten)play('CritterBite');
   if(0>=value(oldTimer)){
    if(value(m.read32(p+0x180n))>=1){play('CritterAlert');m.write32(p+0x17cn,4);}
    else {
     const near=neighbors('Mote',mote=>{
      if(!s.enabled(mote))return false;const difference=read(m.bytes(mote+16n,16)).map((n,i)=>a.sub(n,position()[i])),distance=length(difference);
      return value(radius)>value(distance)||(value(a.mul(radius,c.six))>value(distance)&&value(front(difference))>value(c.frontThreshold));
     });
     if(!near&&(m.read32(m.read64(m.read64(p+0x110n)+104n)+12n)|0)>0){play('CritterBiteDone');m.write32(p+0x17cn,2);}
    }
   }break;
  }
  case 4:
   neighbors('Player',player=>{
    const avatar=m.read64(player+24n),distance=length(read(m.bytes(avatar+16n,16)).map((n,i)=>a.sub(n,position()[i])));
    if(value(c.playerRadius)>value(distance)){const weight=field(0x78);s.flee(state,s.motionState(player+8n),weight,c.six,c.fleeMaximum,one);return true;}return false;
   });
   if(0>=value(oldTimer)&&0>=value(m.read32(p+0x180n)))m.write32(p+0x17cn,1);break;
  case 5:{
   const found=neighbors('Player',player=>{
    const avatar=m.read64(player+24n),distance=length(read(m.bytes(avatar+16n,16)).map((n,i)=>a.sub(n,position()[i])));
    if(!(value(c.playerRadius)>value(distance))||m.bytes(avatar+0xbb0n,1)[0])return false;
    const target=read(s.componentPosition(m.read64(m.read64(player+32n)+0x298n))),difference=position().map((n,i)=>a.sub(n,target[i])),flat=difference.map((n,i)=>i===1?0:n),span=length(flat);
    const angle=value(span)>value(c.half)?a.mul(a.add(bits(evidence.interactionAngle-value(s.asinBits(a.div(c.half,span)))),c.particleScale),c.half):c.interactionAngle;
    const packed=s.sincosBits(angle);if(packed.length!==16)throw new Error('Fish AI sincos requires four return lanes');
    const rotated=normalize(interactionDirection(difference,packed,s)),point=rotated.map((n,i)=>a.add(a.mul(n,evidence.vectors.interactionOffset[i]),target[i]));
    s.seekArrival(state,bytes(point),c.interactionWeight,c.arrivalDistance);
    const second=read(s.componentPosition(m.read64(m.read64(player+32n)+0x288n))),currentAvatar=m.read64(player+24n),near=length(second.map((n,i)=>a.sub(a.add(a.mul(evidence.vectors.interactionOffset[i],m.read32(currentAvatar+0x60n+BigInt(i*4))),n),position()[i])));
    if(value(c.interactionRadius)>value(near)){
     s.interact(m.read64(player+32n),bytes(position()),0,0,one,one);const progress=m.read64(player+48n);m.write32(progress+20n,a.add(m.read32(progress+20n),c.biteAmount));amount=a.add(amount,a.mul(delta,c.interactionAmount));
    }return true;
   });
   if(!found&&0>=value(oldTimer))m.write32(p+0x17cn,1);break;
  }
 }
 s.modelParameter(m.read64(p+0x110n),0,'u_chamAmount',a.min(one,a.max(0,a.sub(one,amount))));m.write32(p+0x184n,amount);
 if(value(c.seekSpeed)>value(m.read32(p+0x160n))&&!m.bytes(params()+0x21n,1)[0])m.write32(p+0x180n,0x40000000);
 s.wander(state,field(0x80),field(0x68),field(0x6c),field(0x64),field(0x70));
 s.flock(state,p,0x1003385f0n,field(0x7c),field(0x54),field(0x5c),field(0x58),field(0x60));
 return s.end(state,m.bytes(params()+0x50n,1)[0]||m.bytes(params()+0x51n,1)[0]?1:0);
}
