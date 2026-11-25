import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {switchOriginalDarkCreatureRail,type DarkCreatureRailServices} from './dark-creature-rail-runtime';
import {seekOriginalCreatureMotion} from './creature-motion-runtime';
import evidence from '../../docs/creature-lifecycle-native.json';
export interface DarkCreatureStateServices {
 arithmetic?:NatureArithmeticServices;
 switchRail(creature:bigint,cooldown:number):void;
 seek(position:bigint,target:Uint8Array,speedBits:number):Uint8Array;
 detect(creature:bigint,result:bigint,target:bigint,radiusBits:number,world:readonly bigint[]):number;
 worldPosition(transform:bigint):Uint8Array;
}
/** Whole return/cooldown caller 0x100270f10. Acceleration and the timer
 * read remain live after seek; transition resets occur after rail switch. */
export function returnOriginalDarkCreature(m:ModelBakeMemory,p:bigint,delta:number,s:DarkCreatureStateServices){
 const a=natureArithmetic(s.arithmetic),target=new Uint8Array(16),d=new DataView(target.buffer);
 for(let i=0;i<4;i++)d.setUint32(i*4,a.add(m.read32(p+0x60n+BigInt(i*4)),m.read32(p+0xa0n+BigInt(i*4))),true);
 const force=s.seek(p+0x60n,target,evidence.constants.actionSpeed);if(force.length!==16)throw new Error('DarkCreature seek requires 16 bytes');const f=new DataView(force.buffer,force.byteOffset,16);
 for(let i=0;i<4;i++)m.write32(p+0xc0n+BigInt(i*4),a.add(m.read32(p+0xc0n+BigInt(i*4)),f.getUint32(i*4,true)));
 const time=a.add(delta,m.read32(p+0x178n));m.write32(p+0x178n,time);
 if(value(time)>value(evidence.constants.returnDuration)){s.switchRail(p,1);m.write8(p+0x2d0n,0);for(const offset of [0x140n,0x178n,0x2e0n])m.write32(p+offset,0);m.write32(p+0x100n,0x40800000);m.bytes(p+0x2c1n,2).fill(0);}
}
/** Whole alert caller 0x10026d2a0. Captured prior alert is compared with
 * the live alert after detection, including callback-induced transitions. */
export function alertOriginalDarkCreature(m:ModelBakeMemory,p:bigint,delta:number,world:readonly bigint[],s:DarkCreatureStateServices){
 const a=natureArithmetic(s.arithmetic);if(!m.bytes(p+0x2c3n,1)[0]||!m.bytes(p+0x2c4n,1)[0])return;
 if(m.bytes(p+0x2c5n,1)[0]){const time=a.add(delta,m.read32(p+0x17cn));m.write32(p+0x17cn,time);if(value(time)>value(m.read32(m.read64(p+0x50n)+8n)))s.switchRail(p,0);}
 const state=m.read32(p+0x2e0n);if(state===2)return;const previous=m.bytes(p+0x2d0n,1)[0];let result=0;
 if(!m.bytes(p+0x2c5n,1)[0]&&m.bytes(p+0x1d4n,1)[0]&&state!==3)result=s.detect(p,p+0x2c7n,p+0x1b0n,m.read32(p+0x1d0n),world);
 m.write8(p+0x2c7n,result);
 if(!previous&&m.bytes(p+0x2d0n,1)[0]){
  m.write32(p+0x180n,0x41200000);const position=s.worldPosition(m.read64(p+0x208n));if(position.length!==16)throw new Error('DarkCreature position requires 16 bytes');m.bytes(p+0x190n,16).set(position);
  m.write32(p+0x140n,0);m.write32(p+0x100n,0);evidence.vectors.alertVelocityScale.forEach((n,i)=>m.write32(p+0xa0n+BigInt(i*4),a.mul(m.read32(p+0xa0n+BigInt(i*4)),n)));m.write32(p+0x2e0n,4);
 }
}
export function originalDarkCreatureRailStateServices(m:ModelBakeMemory,s:Omit<DarkCreatureStateServices,'switchRail'>,rail:DarkCreatureRailServices):DarkCreatureStateServices {
 return {...s,switchRail:(p,cooldown)=>switchOriginalDarkCreatureRail(m,p,cooldown,rail)};
}
/** The return state's actual numeric seek and rail body share its live
 * memory; geometry sampling and target/resource ownership stay explicit. */
export function originalDarkCreatureMotionStateServices(m:ModelBakeMemory,s:Omit<DarkCreatureStateServices,'switchRail'|'seek'>,rail:DarkCreatureRailServices):DarkCreatureStateServices {
 return originalDarkCreatureRailStateServices(m,{...s,seek:(position,target,weight)=>seekOriginalCreatureMotion(m,position,target,weight,0,s.arithmetic)},rail);
}
