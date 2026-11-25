import type {ModelBakeMemory} from './model-baked-runtime';
export const CREATURE_POOLS={
 BirdFlock:{entry:0x10019bb70n,owner:'BirdFlocks',count:0x80cf0,first:0x80070,stride:0xc8,capacity:16,line:532},
 DarkCreature:{entry:0x10026c330n,owner:'DarkCreatureBarn',count:0xc,first:0x10,stride:0x2f0,capacity:8,line:1403},
 SmallDarkCreature:{entry:0x10026c370n,owner:'DarkCreatureBarn',count:0x1790,first:0x17a0,stride:0x110,capacity:64,line:1409},
 SmallDarkCreatureZone:{entry:0x10026c3c0n,owner:'DarkCreatureBarn',count:0x5ba0,first:0x5bb0,stride:0x270,capacity:8,line:1415},
} as const;
export type CreaturePoolClass=keyof typeof CREATURE_POOLS;
export class CreatureCapacityError extends Error{
 readonly severity=3;
 constructor(readonly className:CreaturePoolClass,readonly line:number){super(`${className} original owner capacity exceeded`);}
}
/** Complete original factory stores. Placement construction and TGCL public
 * fields follow separately; never clear uninitialized pool slot bytes. */
export function createOriginalCreature(m:ModelBakeMemory,barn:bigint,name:CreaturePoolClass){
 const pool=CREATURE_POOLS[name],index=m.read32(barn+BigInt(pool.count));if(index>=pool.capacity)throw new CreatureCapacityError(name,pool.line);
 m.write32(barn+BigInt(pool.count),index+1);const out=barn+BigInt(pool.first)+BigInt(index*pool.stride);
 if(name==='BirdFlock'){
  m.write8(out+12n,1);m.write8(out+13n,1);m.write64(out+16n,0n);m.write64(out+24n,0x40a00000000003e8n);m.write32(out+32n,0x40800000);
  m.write64(out+96n,0x420c000040400000n);m.write64(out+104n,0n);m.write32(out+112n,0);m.write64(out+120n,0n);m.write32(out+128n,0);
  m.write64(out+184n,0n);m.write32(out+192n,0);m.bytes(out+136n,16).fill(0);m.write32(out+152n,0);m.write64(out+160n,barn+16n);
 }
 return out;
}
export const CREATURE_ENABLED={BirdV2:{set:0x10019feb0n,get:0x10019fec0n,offset:0xd0},BirdFlock:{set:0x10019b500n,get:0x10019b510n,offset:0xc},Crab:{set:0x100258270n,get:0x100258280n,offset:0xd8}} as const;
export type CreatureEnabledClass=keyof typeof CREATURE_ENABLED;
export function setOriginalCreatureEnabled(m:ModelBakeMemory,out:bigint,name:CreatureEnabledClass,value:number){m.write8(out+BigInt(CREATURE_ENABLED[name].offset),value&255);}
export function getOriginalCreatureEnabled(m:ModelBakeMemory,out:bigint,name:CreatureEnabledClass){return m.bytes(out+BigInt(CREATURE_ENABLED[name].offset),1)[0];}
export function loadOriginalBirdV2Barn(m:ModelBakeMemory,barn:bigint){m.bytes(barn+16n,0x204).fill(0);}
export function initializeOriginalCrabBarn(m:ModelBakeMemory,barn:bigint){m.write32(barn+0x410n,0);m.write64(barn+0x514n,0n);}
export function unloadOriginalCrabBarn(m:ModelBakeMemory,barn:bigint){m.write32(barn+0x410n,0);}
export function unloadOriginalDarkCreatureBarn(m:ModelBakeMemory,barn:bigint){m.write32(barn+12n,0);m.write32(barn+0x1790n,0);}
