import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import type {DarkCreatureStateServices} from './dark-creature-state-runtime';
import evidence from '../../docs/dark-creature-detect-native.json';
const c=evidence.constants;
export interface DarkCreatureDetectServices {
 arithmetic?:NatureArithmeticServices;
 queryAvatars(owner:bigint,mode:1):readonly bigint[];
 enabled(avatar:bigint):number;
 worldPosition(transform:bigint):Uint8Array;
 birdPosition(bird:bigint):Uint8Array;
 atan2(yBits:number,xBits:number):number;
 cos(argumentBits:number):number;
 raycast(scene:bigint,origin:Uint8Array,direction:Uint8Array,maximumBits:number,options:{layer:1;mask:42;enabled:1;reserved:Uint8Array}):boolean;
}
/** Whole 0x10026d410. Targets retain their own original radius and IDs;
 * near-anchor bypasses and cone candidates share native best-distance order.
 * A blocked current target raises alert; a newly visible target clears it. */
export function detectOriginalDarkCreature(m:ModelBakeMemory,p:bigint,result:bigint,target:bigint,radius:number,world:readonly bigint[],s:DarkCreatureDetectServices):number {
 if(world.length!==4)throw new Error('DarkCreature detection requires four original world owners');
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic),previousPlayer=m.read32(p+0x2c8n),previousBird=m.read32(p+0x2ccn);
 const players=s.queryAvatars(world[0],1),playerCount=players.length;
 const origin=read(s.worldPosition(m.read64(p+0x228n))),left=read(s.worldPosition(m.read64(p+0x210n))),right=read(s.worldPosition(m.read64(p+0x218n))),raised=origin.map((x,i)=>a.add(evidence.offset[i],x));
 const tip=read(s.worldPosition(m.read64(p+0x220n))),raisedTip=tip.map((x,i)=>a.add(evidence.offset[i],x)),radiusSquared=a.mul(radius,radius);
 let best=c.maximumDistanceSquared,kind=0,playerId=0,birdIndex=0xffffffff;
 const difference=(x:readonly number[],y:readonly number[])=>x.map((n,i)=>a.sub(n,y[i]));
 const squareDistance=(x:readonly number[],y:readonly number[])=>sum(squared(difference(x,y)));
 const candidate=(position:number[],bias:number,bird:boolean)=>{
  const delta=difference(position,origin),q=squared(delta),distance=sum(q),adjust=(n:number)=>bird?a.sub(n,bias):a.add(n,bias);
  const near=[origin,left,right,tip,raised,raisedTip],limits=[c.nearSquared,c.nearSquared,c.nearSquared,c.tipNearSquared,c.offsetNearSquared,c.offsetNearSquared];
  for(let i=0;i<near.length;i++)if(value(limits[i])>=value(adjust(squareDistance(position,near[i]))))return {delta,q,distance,metric:c.nearSquared};
  const targetPosition=read(m.bytes(target,16)),metric=adjust(squareDistance(position,targetPosition));
  if(!(value(radiusSquared)>=value(metric))){
   const toward=difference(targetPosition,origin),targetLength=sqrt(sum(squared(toward))),length=sqrt(distance);
   if(value(c.epsilon)>value(targetLength))return;
   if(!(value(c.epsilon)>value(length))){
    const cosine=s.cos(s.atan2(radius,targetLength)),dot=sum(delta.map((x,i)=>a.mul(x,toward[i])));
    if(!(value(targetLength)>value(a.div(dot,targetLength)))||!(value(a.div(a.div(dot,length),targetLength))>value(cosine)))return;
   }
  }
  if(!(value(best)>value(metric)))return;
  return {delta,q,distance,metric};
 };
 const blocked=(candidate:{delta:number[];q:number[];distance:number})=>{
  const maximum=sqrt(candidate.distance);let direction=candidate.delta;
  if(value(maximum)>value(c.epsilon))direction=direction.map((x,i)=>a.div(x,i===3?candidate.q[1]:maximum));
  return s.raycast(world[3],bytes(origin),bytes(direction),maximum,{layer:1,mask:42,enabled:1,reserved:new Uint8Array(16)});
 };
 for(let index=0;index<playerCount;index++){
  const avatar=players[index];
  if(!avatar||!(s.enabled(avatar)&255))continue;
  if(value(c.minimumEnergy)>value(m.read32(m.read64(avatar+48n)+8n)))continue;
  const position=read(m.bytes(m.read64(avatar+24n)+16n,16)),found=candidate(position,c.avatarRadiusBias,false);if(!found)continue;
  const id=m.read32(avatar+0xe0n);
  if(blocked(found)){if(previousPlayer===id&&m.bytes(result,1)[0]===1)m.write8(p+0x2d0n,1);}
  else{kind=1;playerId=id;best=found.metric;}
 }
 const count=m.read32(world[2]+0x210n);
 for(let index=0;index<count;index++){
  if(index>63)continue;const bird=m.read64(world[2]+16n+BigInt(index*8));if(!bird||!m.bytes(bird+0xd0n,1)[0])continue;
  const birdRadius=m.read32(m.read64(bird+120n)+24n),position=read(s.birdPosition(bird)),found=candidate(position,a.mul(birdRadius,birdRadius),true);if(!found)continue;
  if(blocked(found)){if(previousBird===index&&m.bytes(result,1)[0]===2)m.write8(p+0x2d0n,1);}
  else{kind=2;birdIndex=index;best=found.metric;}
 }
 if(kind===1){m.write32(p+0x2c8n,playerId);m.write8(p+0x2d0n,0);}
 else if(kind===2){m.write32(p+0x2ccn,birdIndex);m.write8(p+0x2d0n,0);}
 return kind;
}
export function originalDarkCreatureDetectStateServices(m:ModelBakeMemory,s:Omit<DarkCreatureStateServices,'detect'>,detect:DarkCreatureDetectServices):DarkCreatureStateServices {
 const arithmetic=s.arithmetic??detect.arithmetic;return {...s,arithmetic,detect:(p,result,target,radius,world)=>detectOriginalDarkCreature(m,p,result,target,radius,world,{...detect,arithmetic})};
}
