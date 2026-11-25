import type {ModelBakeMemory} from './model-baked-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {pointOriginalCreatureRail,followOriginalCreatureRail,type CreatureRailServices} from './creature-rail-runtime';
import type {BirdAccelerationServices} from './bird-acceleration-runtime';
import evidence from '../../docs/bird-rail-native.json';
export interface BirdRailServices extends CreatureRailServices {random():number;castRail(object:bigint):bigint;}
/** Whole 0x1001a06a0. Preserves list order, live callback rereads, native
 * random integer overflow, open-rail restriction and both heading tests.
 * An unsuccessful search leaves the previously selected rail unchanged. */
export function selectOriginalBirdRail(m:ModelBakeMemory,ai:bigint,motion:bigint,speed:number,s:BirdRailServices,speedW=0){
 const {a,read,sum,squared,normalize}=originalForceVectors(s.arithmetic),c=evidence.constants;
 let list=m.read64(m.read64(ai+8n)+40n);if(!m.read32(list+16n))return;
 const twice=a.add(speed,speed),range=a.mul(twice,twice);
 for(let index=0;;index++){
  const object=m.read64(m.read64(list+8n)+BigInt(index)*8n),rail=s.castRail(object);
  if(!rail)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  if(rail!==m.read64(ai+64n)&&!m.bytes(rail+44n,1)[0]){
   const scaled=value(a.mul(a.mul(bits(s.random()|0),c.randomScale),c.randomRange)),integer=Number.isFinite(scaled)&&scaled>=-2147483648&&scaled<2147483648?Math.trunc(scaled):-2147483648;
   if(((Math.imul(integer,51)+99999)>>>0)<=199998){
    const start=read(pointOriginalCreatureRail(m,rail,0)),offset=start.map((n,i)=>a.sub(m.read32(motion+BigInt(i*4)),n));
    if(value(range)>value(sum(squared(offset)))){
     const end=read(pointOriginalCreatureRail(m,rail,1)),direction=normalize(end.map((n,i)=>a.sub(n,start[i]))),towards=normalize(start.map((n,i)=>a.sub(n,m.read32(motion+BigInt(i*4)))));
     if(value(sum(direction.map((n,i)=>a.mul(n,towards[i]))))>value(c.headingMinimum)){
      const velocity=read(m.bytes(motion+64n,16)).map((n,i)=>a.div(n,i===3?speedW:speed));
      if(value(sum(direction.map((n,i)=>a.mul(n,velocity[i]))))>value(c.headingMinimum)){m.write64(ai+64n,rail);return;}
     }
    }
   }
  }
  list=m.read64(m.read64(ai+8n)+40n);if((index+1)>>>0>=m.read32(list+16n))return;
 }
}
/** Resolves rail selection, end-of-rail checks and shared FollowRail in
 * the existing acceleration/force/flight/Update owner composition. */
export function originalBirdRailAccelerationServices(m:ModelBakeMemory,s:Omit<BirdAccelerationServices,'updateFlocking'|'railDistance'|'followRail'>,rail:BirdRailServices):BirdAccelerationServices {
 const arithmetic=s.arithmetic??rail.arithmetic,resolved={...rail,arithmetic};
 return {...s,arithmetic,...originalBirdRailSteeringServices(m,resolved)};
}
export function originalBirdRailSteeringServices(m:ModelBakeMemory,rail:BirdRailServices):Pick<BirdAccelerationServices,'updateFlocking'|'railDistance'|'followRail'> {
 return {updateFlocking:(ai,_params,motion,speed,_delta)=>selectOriginalBirdRail(m,ai,motion,speed,rail),railDistance:(p,motion)=>rail.nearest(p,m.bytes(motion,16).slice()).timeBits,followRail:(state,p,enabled,weight,corridor,advance)=>followOriginalCreatureRail(m,state,p,enabled,weight,corridor,advance,rail)};
}
