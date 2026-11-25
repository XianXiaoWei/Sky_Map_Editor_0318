import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits,numericFloatValue} from './object-numeric-runtime';
export interface CreatureAiInitializeServices {
 /** Original movement consumer 0x10062e5b0, shared by the two AI states. */
 initializeMotion(motion:bigint,game:bigint):void;
 castGoSit(object:bigint):bigint;
 rand():number;
}
/** Whole BirdV2 AI.Initialize 0x10019ff50. Saved params at +8 are owned by
 * the caller; no Model, metadata or synthetic controller is manufactured. */
export function initializeOriginalBirdV2Ai(m:ModelBakeMemory,ai:bigint,bird:bigint,game:bigint,s:CreatureAiInitializeServices){
 m.write64(ai+16n,bird);m.write64(ai+24n,0n);m.bytes(ai+32n,2).fill(0);m.write64(ai+36n,0n);s.initializeMotion(ai+0x90n,game);
 m.bytes(ai+48n,16).fill(0);m.write64(ai+64n,0n);m.write8(ai+72n,0);m.bytes(ai+88n,16).fill(0);m.bytes(ai+112n,16).fill(0);m.write32(ai+128n,0);
 let params=m.read64(ai+8n),goSit=0n;const clump=m.read64(params+48n);
 if(clump&&m.read32(clump+16n)){goSit=s.castGoSit(m.read64(m.read64(clump+8n)));if(!goSit)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');params=m.read64(ai+8n);}
 m.write64(ai+80n,goSit);m.write8(ai+132n,m.bytes(params+136n,1)[0]);
}
/** Whole Crab AI.Initialize 0x1002585e0. Twelve native rand31 samples seed
 * its own state; this is distinct from BirdV2 guide/target initialization. */
export function initializeOriginalCrabAi(m:ModelBakeMemory,ai:bigint,crab:bigint,seed:number,game:bigint,s:Pick<CreatureAiInitializeServices,'initializeMotion'|'rand'>){
 m.write64(ai+16n,crab);m.write32(ai+0x1ccn,0);m.write32(ai+0x90n,0);m.write32(ai+80n,0);m.bytes(ai+24n,16).fill(0);m.bytes(ai+88n,16).fill(0);m.bytes(ai+112n,16).fill(0);m.write32(ai+128n,0);m.bytes(ai+48n,16).set(m.bytes(crab+16n,16));m.write32(ai+64n,seed);
 for(let i=0;i<12;i++)m.write32(ai+BigInt(0x94+i*4),numericFloatBits(Math.fround(Math.fround(s.rand()|0)*numericFloatValue(0x30000000))));
 s.initializeMotion(ai+0x1d0n,game);
}
