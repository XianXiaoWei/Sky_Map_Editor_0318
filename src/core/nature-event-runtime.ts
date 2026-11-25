import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

export interface NatureArithmeticServices {resolveDualNaN(op:'add'|'sub'|'mul'|'div',a:number,b:number):number;}
const nan=(n:number)=>(n&0x7fffffff)>0x7f800000;
export function natureArithmetic(s?:NatureArithmeticServices){
 const calc=(op:'add'|'sub'|'mul'|'div',a:number,b:number)=>{
  if(nan(a)&&nan(b)&&a!==b){if(s)return s.resolveDualNaN(op,a,b);throw new Error('Nature event dual-NaN propagation requires a verified arithmetic service');}
  if(nan(a))return (a|0x400000)>>>0;if(nan(b))return (b|0x400000)>>>0;
  const x=value(a),y=value(b),n=op==='add'?x+y:op==='sub'?x-y:op==='mul'?x*y:x/y;
  return Number.isNaN(n)?0xffc00000:bits(n);
 };
 return {add:(a:number,b:number)=>calc('add',a,b),sub:(a:number,b:number)=>calc('sub',a,b),mul:(a:number,b:number)=>calc('mul',a,b),div:(a:number,b:number)=>calc('div',a,b),
  max:(a:number,b:number)=>value(a)>value(b)?a:b,min:(a:number,b:number)=>value(a)<value(b)?a:b};
}
/** Original Debug/time scaling followed by MAXSS/MINSS. The minimum is
 * 0.0001 even for a zero delta; unordered input remains unordered. */
export function originalNatureDelta(m:ModelBakeMemory,game:bigint,debugScaleBits:number|undefined,a=natureArithmetic()){
 const clock=m.read64(game+0x160n);
 return a.min(0x3e883127,a.max(0x38d1b717,a.mul(a.mul(debugScaleBits??0x3f800000,m.read32(clock+32n)),m.read32(clock+20n))));
}
export interface CreatureEventServices {
 castCreature(object:bigint,kind:'BirdV2'|'DarkCreature'):bigint;
 /** Original Meta SetEnabled wrapper 0x1004d1f60, not a direct Event call. */
 setObjectEnabled(object:bigint,value:number):void;
 start(event:bigint):void;
 arithmetic?:NatureArithmeticServices;
}
export const restoredCreatureEventClasses=['BirdV2ParamSwap','BirdV2AiSwap','SetBirdGuidesEnabled','ReleaseBirds','DetachFromBirdGuides','SetDarkCreaturesNetworked','AwakenDarkCreatures','Critter_Shout'] as const;
const fail=(file:string,line:number,expression:string):never=>{throw new NativeObjectFoundationFailure(file,line,3,expression);};
export interface CritterShoutServices {
 castCritter(object:bigint):bigint;
 /** Original CritterV2 virtual +0x68. Visual/audio ownership is explicit. */
 shout(critter:bigint,owner:bigint,hasVisual:number,hasAudio:number):void;
 start(event:bigint):void;
}
/** Whole Critter_Shout.OnEnabled 0x100266350. The initial count is captured;
 * subsequent Clumps, owner and both flag bytes are read after callbacks. */
export function enableOriginalCritterShout(m:ModelBakeMemory,event:bigint,game:bigint,s:CritterShoutServices){
 let clump=m.read64(event+56n);if(!clump)fail('CritterV2Events.cpp',416,'critters');
 const count=m.read32(clump+16n);
 for(let i=0;i<count;i++){
  const critter=s.castCritter(m.read64(m.read64(clump+8n)+BigInt(i)*8n));
  if(!critter)fail('./Clump.h',71,'ret');
  s.shout(critter,m.read64(game+0x3c8n),m.bytes(event+64n,1)[0],m.bytes(event+65n,1)[0]);
  if(i+1<count){clump=m.read64(event+56n);if(i+1>=m.read32(clump+16n))fail('./Clump.h',54,'idx < size');}
 }
 s.start(event);
}
export interface CritterMessageServices {
 castMessage(object:bigint):bigint;
 /** Original CritterV2-to-Object metadata cast may adjust the pointer. */
 castCritterObject(critter:bigint):bigint;
 sendMessage(object:bigint,message:bigint):void;
 start(event:bigint):void;
}
/** Whole Critter_SendMsg.Update 0x100264fd0. Message count/Clump stay live;
 * the critter count is reread after a nonempty inner loop. */
export function updateOriginalCritterSendMsg(m:ModelBakeMemory,event:bigint,s:CritterMessageServices){
 let count=m.read32(event+72n);
 for(let i=0;i<count;i++){
  const table=m.read64(event+64n);if(!table)fail('CritterV2Events.cpp',86,'m_critters && idx < m_numCritters');
  const critter=m.read64(table+BigInt(i)*8n);if(!critter)fail('CritterV2Events.cpp',88,'critter');
  let clump=m.read64(event+88n);if(!m.read32(clump+16n))continue;
  let j=0;
  do{
   const message=s.castMessage(m.read64(m.read64(clump+8n)+BigInt(j)*8n));
   if(!message)fail('./Clump.h',71,'ret');
   s.sendMessage(s.castCritterObject(critter),message);
   j=(j+1)>>>0;clump=m.read64(event+88n);
  }while(j<m.read32(clump+16n));
  count=m.read32(event+72n);
 }
 s.start(event);
}
export interface DarkCreatureMusicServices {
 localPlayer(owner:bigint):bigint;
 castDarkCreature(object:bigint):bigint;
 /** Original expf boundary; accepts/returns the exact float bits. */
 expBits(input:number):number;
 arithmetic?:NatureArithmeticServices;
}
/** Whole SetDarkCreaturesMusicFloat.Update 0x1002744a0. Keeps local target
 * precedence, nearest eligible squared distance and original smoothing order. */
export function updateOriginalDarkCreatureMusic(m:ModelBakeMemory,event:bigint,game:bigint,debugScaleBits:number|undefined,s:DarkCreatureMusicServices){
 const a=natureArithmetic(s.arithmetic),clock=m.read64(game+0x160n),delta=m.read32(clock+20n),scale=a.mul(debugScaleBits??0x3f800000,m.read32(clock+32n));
 let target=m.read32(event+80n),nearest=0x7f7fffff;
 const player=s.localPlayer(m.read64(game+0x280n));
 let clump=m.read64(event+64n);const count=m.read32(clump+16n);
 if(count){
  const playerId=m.read32(player+0xe0n),position=Uint8Array.from(m.bytes(m.read64(player+24n)+16n,16)),positionBits=new DataView(position.buffer);
  for(let i=0;i<count;i++){
   const creature=s.castDarkCreature(m.read64(m.read64(clump+8n)+BigInt(i)*8n));
   if(!creature)fail('./Clump.h',71,'ret');
   if(m.bytes(creature+0x2c7n,1)[0]===1&&m.read32(creature+0x2c8n)===playerId){target=m.read32(event+72n);break;}
   if(!m.bytes(creature+0x2c5n,1)[0]&&m.bytes(creature+0x1d4n,1)[0]&&m.read32(creature+0x2e0n)!==3){
    const square=(axis:number)=>{const d=a.sub(positionBits.getUint32(axis*4,true),m.read32(creature+0x60n+BigInt(axis*4)));return a.mul(d,d);};
    const x=square(0),y=square(1),z=square(2),distance=a.add(z,a.add(x,y));
    if(value(nearest)>value(distance))nearest=distance;
   }
   if(i+1<count){clump=m.read64(event+64n);if(i+1>=m.read32(clump+16n))fail('./Clump.h',54,'idx < size');}
  }
 }
 const dt=a.min(0x3e883127,a.max(0x38d1b717,a.mul(scale,delta)));
 if(value(m.read32(event+72n))>value(target)){
  const minimum=m.read32(event+84n),range=a.sub(m.read32(event+88n),minimum);
  let weight=0x3f800000;
  if(value(range)>value(0x3727c5ac)||value(0xb727c5ac)>value(range))weight=a.div(a.sub(nearest,minimum),range);
  weight=a.min(0x3f800000,a.max(0,weight));
  target=a.add(a.mul(weight,m.read32(event+80n)),a.mul(a.sub(0x3f800000,weight),m.read32(event+76n)));
 }
 const weight=a.min(0x3f800000,a.max(0,a.sub(0x3f800000,s.expBits(a.mul(dt,0xbf822e9c)))));
 const result=a.add(a.mul(weight,target),a.mul(a.sub(0x3f800000,weight),m.read32(event+92n)));
 m.write32(event+92n,result);m.write32(m.read64(event+56n)+16n,result);
}
/** Original captured-count loops reload the Clump after each cast/write. */
function visitCreatures(m:ModelBakeMemory,event:bigint,kind:'BirdV2'|'DarkCreature',s:CreatureEventServices,visit:(p:bigint)=>void,line:number){
 let clump=m.read64(event+56n);if(!clump)fail(kind==='BirdV2'?'BirdV2.cpp':'DarkCreature.cpp',line,kind==='BirdV2'?'birds':'creatures');
 const count=m.read32(clump+16n);
 for(let i=0;i<count;i++){
  const creature=s.castCreature(m.read64(m.read64(clump+8n)+BigInt(i)*8n),kind);
  if(!creature)fail('./Clump.h',71,'ret');visit(creature);
  if(i+1<count){clump=m.read64(event+56n);if(i+1>=m.read32(clump+16n))fail('./Clump.h',54,'idx < size');}
 }
 s.start(event);
}
/** Whole BirdV2ParamSwap.OnEnabled 0x1001aa160. onAttach is only dispatched
 * for an already active guide. Parameter ownership remains shared. */
export function enableOriginalBirdV2ParamSwap(m:ModelBakeMemory,event:bigint,s:CreatureEventServices){
 const params=m.read64(event+56n);
 if(params){const bird=m.read64(event+64n);m.write64(bird+120n,params);
  if(m.bytes(bird+0x440n,1)[0]){m.write8(bird+0x440n,1);const onAttach=m.read64(params+72n);if(onAttach)s.setObjectEnabled(onAttach,1);}}
 s.start(event);
}
/** Whole BirdV2AiSwap.OnEnabled / Update 0x1001a9dc0 / 0x1001a9df0. */
export function enableOriginalBirdV2AiSwap(m:ModelBakeMemory,event:bigint){
 const params=m.read64(event+56n);if(params){const bird=m.read64(event+64n);m.write64(bird+128n,params);m.write64(bird+232n,params);}m.write32(event+76n,0);
}
export function updateOriginalBirdV2AiSwap(m:ModelBakeMemory,event:bigint,game:bigint,debugScaleBits:number|undefined,s:CreatureEventServices){
 const a=natureArithmetic(s.arithmetic),elapsed=a.add(originalNatureDelta(m,game,debugScaleBits,a),m.read32(event+76n));m.write32(event+76n,elapsed);
 const bird=m.read64(event+64n),scale=a.sub(0x3f800000,a.mul(a.div(elapsed,0x40400000),m.read32(event+72n)));
 for(let i=0;i<4;i++)m.write32(bird+0x3b0n+BigInt(i*4),i===3?0:scale);
 if(value(m.read32(event+76n))>=3)s.start(event);
}
export function enableOriginalSetBirdGuidesEnabled(m:ModelBakeMemory,event:bigint,s:CreatureEventServices){
 visitCreatures(m,event,'BirdV2',s,p=>{const enabled=m.bytes(event+64n,1)[0];m.write8(m.read64(p+120n)+42n,enabled);},2019);
}
export function enableOriginalSetDarkCreaturesNetworked(m:ModelBakeMemory,event:bigint,s:CreatureEventServices){
 visitCreatures(m,event,'DarkCreature',s,p=>m.write8(p+0x2dcn,m.bytes(event+64n,1)[0]),1478);
}
export interface AwakenCreatureServices extends CreatureEventServices {
 /** Original player-owner state and 0x1004a0a20 predicate are dependencies. */
 dormantState:number;
 networkAuthority(playerOwner:bigint):number;
}
/** Whole AwakenDarkCreatures.Update 0x100273c50. The dormant branch neither
 * touches the Clump nor completes; authority is queried only for networked creatures. */
export function updateOriginalAwakenDarkCreatures(m:ModelBakeMemory,event:bigint,game:bigint,s:AwakenCreatureServices){
 const player=()=>m.read64(m.read64(game+0x178n)+64n);
 if(m.read32(player()+0x820n)===s.dormantState)return;
 visitCreatures(m,event,'DarkCreature',s,p=>{if(!m.bytes(p+0x2dcn,1)[0]||(s.networkAuthority(player())&255))m.write8(p+0x2c3n,1);},1450);
}
