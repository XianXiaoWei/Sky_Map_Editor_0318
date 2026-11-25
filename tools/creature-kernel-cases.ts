import {CREATURE_POOLS,CreatureCapacityError,createOriginalCreature,setOriginalCreatureEnabled,getOriginalCreatureEnabled,loadOriginalBirdV2Barn,initializeOriginalCrabBarn,unloadOriginalCrabBarn,unloadOriginalDarkCreatureBarn} from '../src/core/creature-runtime';
import {setOriginalFlameEnabled,getOriginalFlameEnabled} from '../src/core/flame-runtime';
export interface CreatureKernelCase{mode:number;seed:number;index?:number;repeat?:number;enabled?:number;lit?:number;label?:string;}
export function prepareCreatureKernel(c:CreatureKernelCase){
 const base=0x440000000n,b=Buffer.alloc(0x90000);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 if(c.mode<4)b.writeUInt32LE(c.index??0,Object.values(CREATURE_POOLS)[c.mode].count);b.writeUInt32LE(c.enabled??1,0x8ffe0);
 if(c.lit!==undefined)b[0x10b6]=c.lit;
 const at=(p:bigint,n:number)=>{const offset=Number(p-base);if(offset<0||offset+n>b.length)throw new Error('Unmapped creature kernel address');return offset;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:()=>''};return {base,b,m};
}
export function evaluateCreatureKernel(c:CreatureKernelCase){
 const {base,b,m}=prepareCreatureKernel(c);let result=0n,line=0,severity=0;
 try{if(c.mode<4)for(let i=0;i<(c.repeat??1);i++)result=createOriginalCreature(m,base,Object.keys(CREATURE_POOLS)[c.mode] as keyof typeof CREATURE_POOLS);
 else if(c.mode<10){const name=(['BirdV2','BirdFlock','Crab'] as const)[(c.mode-4)>>1];if(c.mode%2===0)setOriginalCreatureEnabled(m,base+0x1000n,name,c.enabled??1);else result=BigInt(getOriginalCreatureEnabled(m,base+0x1000n,name));}
 else if(c.mode===10)loadOriginalBirdV2Barn(m,base);else if(c.mode===11)initializeOriginalCrabBarn(m,base);else if(c.mode===12)unloadOriginalCrabBarn(m,base);else if(c.mode===13)unloadOriginalDarkCreatureBarn(m,base);else if(c.mode===14)setOriginalFlameEnabled(m,base+0x1000n,c.enabled??1);else if(c.mode===15)result=BigInt(getOriginalFlameEnabled(m,base+0x1000n));else throw new Error('Unknown creature mode');
 }catch(e){if(!(e instanceof CreatureCapacityError))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(16);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeBigUInt64LE(result,8);return Buffer.concat([header,b]);
}
export function creatureKernelCases(){const cases:CreatureKernelCase[]=[];
 Object.values(CREATURE_POOLS).forEach((pool,mode)=>{for(const index of [0,1,pool.capacity-1,pool.capacity,pool.capacity+1,0xffffffff])for(const repeat of [0,1,2])cases.push({mode,seed:31+cases.length,index,repeat});cases.push({mode,seed:91,index:0,repeat:pool.capacity+1,label:'full owner pool followed by exhaustion'});});
 for(let mode=4;mode<10;mode++)for(const enabled of [0,1,2,127,255])cases.push({mode,seed:cases.length,enabled});for(let mode=10;mode<14;mode++)for(const seed of [0,97,222])cases.push({mode,seed});for(const enabled of [0,1,2,127,255])for(const lit of [0,1,255])cases.push({mode:14,seed:cases.length,enabled,lit});for(const seed of [0,97,222])cases.push({mode:15,seed});return cases;
}
