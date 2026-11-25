import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {seekOriginalCreatureMotion} from './creature-motion-runtime';
import {switchOriginalDarkCreatureRail,type DarkCreatureRailServices} from './dark-creature-rail-runtime';
import evidence from '../../docs/dark-creature-motion-native.json';
export interface DarkCreatureAppearServices {
 arithmetic?:NatureArithmeticServices;
 switchRail(creature:bigint,cooldown:number):void;
 seek(position:bigint,target:Uint8Array,weightBits:number):Uint8Array;
 soundId(handle:bigint):bigint;
 soundPlaying(handle:bigint):number;
 play(owner:bigint,name:'DarkCreatureAppear'|'DuskCreatureReveal',options:Uint8Array,parameters:Uint8Array):{handle:bigint;id:bigint};
}
/** Whole original 0x100270010. Height can switch to patrol immediately;
 * otherwise upward motion and version-checked appearance audio stay live. */
export function appearOriginalDarkCreature(m:ModelBakeMemory,p:bigint,audio:bigint,s:DarkCreatureAppearServices){
 const a=natureArithmetic(s.arithmetic);
 if(value(a.sub(m.read32(p+0x64n),m.read32(p+0x12cn)))>value(evidence.constants.appearHeight)){s.switchRail(p,0);m.write8(p+0x2c4n,1);return;}
 const target=new Uint8Array(16),d=new DataView(target.buffer);evidence.vectors.up.forEach((n,i)=>d.setUint32(i*4,a.add(m.read32(p+0x60n+BigInt(i*4)),n),true));
 const force=s.seek(p+0x60n,target,evidence.constants.one);if(force.length!==16)throw new Error('DarkCreature appearance requires 16-byte seek output');const f=new DataView(force.buffer,force.byteOffset,16);
 for(let i=0;i<4;i++)m.write32(p+0xc0n+BigInt(i*4),a.add(m.read32(p+0xc0n+BigInt(i*4)),f.getUint32(i*4,true)));
 const handle=m.read64(p+0x280n),id=m.read64(p+0x288n);
 if(handle&&id&&s.soundId(handle)===id&&(s.soundPlaying(m.read64(p+0x280n))&255))return;
 const options=(volume:number,near:number,far:number)=>{const data=new Uint8Array(128),v=new DataView(data.buffer);v.setUint32(0,volume,true);data[13]=1;data.set(m.bytes(p+0x60n,16),16);v.setUint32(72,near,true);v.setUint32(76,far,true);v.setUint32(112,0xc31,true);return data;};
 const created=s.play(audio,'DarkCreatureAppear',options(0x3f19999a,0x41200000,0x42c80000),new Uint8Array(0x1b0));m.write64(p+0x280n,created.handle);m.write64(p+0x288n,created.id);
 s.play(audio,'DuskCreatureReveal',options(0x3f800000,0x41000000,0x42a00000),new Uint8Array(0x1b0));
}
export function originalDarkCreatureAppearServices(m:ModelBakeMemory,s:Omit<DarkCreatureAppearServices,'switchRail'|'seek'>,rail:DarkCreatureRailServices):DarkCreatureAppearServices {
 return {...s,switchRail:(p,cooldown)=>switchOriginalDarkCreatureRail(m,p,cooldown,rail),seek:(p,target,weight)=>seekOriginalCreatureMotion(m,p,target,weight,0,s.arithmetic)};
}
