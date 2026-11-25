import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import evidence from '../../docs/dark-creature-motion-native.json';
export interface CreatureMotionRailServices {
 arithmetic?:NatureArithmeticServices;
 remainder(inputBits:number,divisorBits:number):number;
 sample(rail:bigint,timeBits:number):Uint8Array;
}
/** Whole raw Motion.FollowRail 0x10062e300. Unlike accumulating FollowRail,
 * this advances normalized time from the current speed and rail duration.
 * The caller supplies output scratch: the tolerance branch writes only XYZ. */
export function followOriginalCreatureMotionRail(m:ModelBakeMemory,position:bigint,rail:bigint,time:bigint,direction:number,tolerance:number,delta:number,output:Uint8Array,s:CreatureMotionRailServices){
 if(output.length!==16)throw new Error('Motion FollowRail requires 16-byte caller output scratch');
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic);
 let step=a.mul(a.div(m.read32(position+0x54n),m.read32(rail+24n)),delta);
 if(!(direction&255))step=(step^0x80000000)>>>0;
 let next=a.add(step,m.read32(time));next=m.bytes(rail+44n,1)[0]?s.remainder(next,0x3f800000):a.min(0x3f800000,a.max(0,next));
 const target=read(s.sample(rail,next));let difference=target.map((n,i)=>a.sub(n,m.read32(position+BigInt(i*4)))),q=squared(difference);
 if(!(value(sum(q))>value(a.mul(tolerance,tolerance)))){output.fill(0,0,12);return;}
 m.write32(time,next);
 // Original rereads the motion after the time write, including aliased owners.
 difference=target.map((n,i)=>a.sub(n,m.read32(position+BigInt(i*4))));q=squared(difference);const length=sqrt(sum(q));
 if(value(length)>value(evidence.constants.normalizeThreshold))for(let i=0;i<4;i++)difference[i]=a.div(difference[i],i===3?q[1]:length);
 const speed=m.read32(position+0x54n);output.set(bytes(difference.map((n,i)=>a.sub(a.mul(n,speed),m.read32(position+0x40n+BigInt(i*4))))));
}
