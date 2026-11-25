import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';

/** Whole original CandleBarn.OnLevelUnload 0x1001e99c0. Vertex.Unload is
 * a resource-owner dependency; FlameBarn independently owns its Flame pool. */
export function unloadOriginalCandleLevel(m:ModelBakeMemory,barn:bigint,unloadVertex:(renderData:bigint)=>void){
 const fail=(line:number,expression:string):never=>{throw new NativeObjectFoundationFailure('../../../Code/Base/ObjectPool.h',line,4,expression);};
 const capacity=m.read32(barn+0xf980n),firstBits=m.read64(barn+0xf990n);
 let index=0;while(index<capacity&&!(m.read32(firstBits+BigInt(index>>>5)*4n)&(1<<(index&31))))index++;
 while(index!==capacity){
  if(index>=m.read32(barn+0xf980n))fail(107,'idx < kCapacity');
  if(!(m.read32(m.read64(barn+0xf990n)+BigInt(index>>>5)*4n)&(1<<(index&31))))fail(108,'Allocated( idx )');
  unloadVertex(m.read64(barn+0xf998n)+BigInt(index)*0x570n+0x20n);
  do{index++;if(index>=capacity)break;if(index>=m.read32(barn+0xf980n))fail(57,'idx < kCapacity');}while(!(m.read32(m.read64(barn+0xf990n)+BigInt(index>>>5)*4n)&(1<<(index&31))));
 }
 m.bytes(barn+0x10n,0x7000).fill(0);m.write32(barn+0xf6d0n,0);m.write32(barn+0xf988n,0);m.bytes(m.read64(barn+0xf990n),m.read32(barn+0xf984n)).fill(0);
}
