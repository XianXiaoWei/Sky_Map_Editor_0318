import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {originalForceVectors} from './creature-force-runtime';

export interface CreatureRailServices {
 arithmetic?:NatureArithmeticServices;
 nearest(rail:bigint,position:Uint8Array):{timeBits:number;position:Uint8Array};
 distanceAtTime(rail:bigint,timeBits:number):number;
 timeAtDistance(rail:bigint,distanceBits:number):number;
 sample(rail:bigint,timeBits:number):Uint8Array;
}
/** Whole Rail.GetPoint 0x100560300. Uses the initialized native point
 * cache, preserving the null-cache and unsigned-index assertions. */
export function pointOriginalCreatureRail(m:ModelBakeMemory,rail:bigint,index:number){
 const points=m.read64(rail+0x90n);if(!points)throw new NativeObjectFoundationFailure('Rail.cpp',868,3,'pPoints');
 if((index>>>0)>=m.read32(rail+40n))throw new NativeObjectFoundationFailure('Rail.cpp',869,3,'ind < numPoints');
 return m.bytes(points+BigInt(index>>>0)*16n,16).slice();
}
/** Whole accumulating FollowRail 0x100630020. The predicted position
 * chooses a nearest point, while the corridor test uses current position.
 * Inside the corridor the original accumulates a zero force. */
export function followOriginalCreatureRail(m:ModelBakeMemory,state:bigint,rail:bigint,forward:number,weight:number,corridor:number,advance:number,s:CreatureRailServices,weightW=0){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',653,3,'m_accum');
 if(value(weight&0x7fffffff)<=value(0x3727c5ac))return;
 const {a,read,bytes,sum,squared,normalize}=originalForceVectors(s.arithmetic),predicted=read(m.bytes(state+0x60n,16)).map((n,i)=>a.add(a.mul(m.read32(state+0x80n),n),m.read32(state+32n+BigInt(i*4))));
 const nearest=s.nearest(rail,bytes(predicted));if(nearest.position.length!==16)throw new Error('Rail nearest position requires 16 bytes');
 const distanceSquared=sum(squared(read(nearest.position).map((n,i)=>a.sub(n,m.read32(state+32n+BigInt(i*4))))));let force=[0,0,0,0];
 if(value(distanceSquared)>value(a.mul(corridor,corridor))){
  const distance=s.distanceAtTime(rail,nearest.timeBits),time=s.timeAtDistance(rail,a.add(a.mul((forward&255)?0x3f800000:0xbf800000,advance),distance)),target=s.sample(rail,time);
  if(target.length!==16)throw new Error('Rail sample requires 16 bytes');
  const direction=normalize(read(target).map((n,i)=>a.sub(n,m.read32(state+32n+BigInt(i*4))))),speed=m.read32(state+0x74n);
  force=direction.map((n,i)=>a.sub(a.mul(n,speed),m.read32(state+0x60n+BigInt(i*4))));
 }
 m.bytes(state,16).set(bytes(force.map((n,i)=>a.add(a.mul(i===3?weightW:weight,n),m.read32(state+BigInt(i*4))))));
}
