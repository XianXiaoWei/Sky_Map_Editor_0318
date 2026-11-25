import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';

/** Barn.Load 0x100195f89..0x100196094. The original loader has already filled
 * its 6*materialCount int32 scratch slots with -1 and reset renderCount.
 * Normal primary, Decal primary, secondary and Alpha have distinct regions.
 * Missing secondary leaves old record indices intact. Allocation order follows
 * resolved record order; the final limit is strictly below 16, even at count 0.
 * Renderable/shader/texture creation after this interval is separate. */
export function groupOriginalBeamoMaterials(m:ModelBakeMemory,barn:bigint,slots:bigint,materialCount:number){
 const count=m.read32(barn+0x20018n),normalCount=m.read32(barn+0x20010n),table=m.read64(barn+0x20020n),width=BigInt(materialCount>>>0)*4n;
 const allocate=(slot:bigint)=>{
  let index=m.read32(slot);if(index===0xffffffff){index=m.read32(barn+0x6c830n);m.write32(barn+0x6c830n,(index+1)>>>0);m.write32(slot,index);}return index;
 };
 for(let i=0;i<count;i++){
  const record=table+BigInt(i)*384n,primary=m.read64(record+0xd8n),ordinal=m.read32(primary+0xe0n);
  const index=allocate(slots+(i<normalCount?0n:width)+BigInt(ordinal)*4n);m.write32(record+0xe8n,index);
  const secondary=m.read64(record+0xe0n);if(!secondary)continue;
  const secondaryOrdinal=BigInt(m.read32(secondary+0xe0n))*4n,secondarySlot=slots+width*2n+secondaryOrdinal,alphaSlot=slots+width*5n+secondaryOrdinal;
  const secondaryIndex=allocate(secondarySlot),alphaIndex=allocate(alphaSlot);m.write32(record+0xecn,secondaryIndex);m.write32(record+0xf0n,alphaIndex);
 }
 const renderCount=m.read32(barn+0x6c830n);
 if(renderCount>=16)throw new NativeObjectFoundationFailure('Beamo.cpp',822,4,'m_renderCount < LevelModelBarn::kMaxLevelMaterials');
 return renderCount;
}
