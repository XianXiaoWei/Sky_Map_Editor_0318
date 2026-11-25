import type {ModelBakeMemory} from './model-baked-runtime';

// Original factory delegates allocate from Barn-owned arrays, rather than
// creating a mesh for each serialized object. Owner construction/reset and
// metadata are separate services; these functions preserve untouched bytes.
export const OBJECT_EFFECT_POOLS={
 FlowerPatch:{entry:0x10034f110n,count:0x11dc0,first:0xed0,stride:0x110,capacity:255,line:743},
 CandleObject:{entry:0x1001ea9e0n,count:0xf6d0,first:0x7010,stride:0xb0,capacity:196,line:566},
 Water:{entry:0x1004d5eb0n,count:0x13c8,first:0x13d0,stride:0x5d0,capacity:8,line:743},
} as const;
export type ObjectEffectPoolClass=keyof typeof OBJECT_EFFECT_POOLS;
export class ObjectEffectCapacityError extends Error {
 readonly severity=3;
 constructor(readonly className:ObjectEffectPoolClass,readonly line:number){super(`${className} original Barn capacity exceeded`);}
}
export function createOriginalObjectEffect(m:ModelBakeMemory,barn:bigint,className:ObjectEffectPoolClass):bigint{
 const pool=OBJECT_EFFECT_POOLS[className],index=m.read32(barn+BigInt(pool.count));
 if(index>=pool.capacity)throw new ObjectEffectCapacityError(className,pool.line);
 m.write32(barn+BigInt(pool.count),(index+1)>>>0);
 const out=barn+BigInt(pool.first)+BigInt(index)*BigInt(pool.stride);
 if(className==='CandleObject'){
  // CandleBarn.CreateCandleObject initializes both transform and OBB matrices.
  // It preserves the metadata header and padding for the owning constructor.
  const columns=[new Uint8Array(new Float32Array([1,0,0,0]).buffer),new Uint8Array(new Float32Array([0,1,0,0]).buffer),new Uint8Array(new Float32Array([0,0,1,0]).buffer),new Uint8Array(new Float32Array([0,0,0,1]).buffer)];
  for(const base of [16,80])for(let i=0;i<4;i++)m.bytes(out+BigInt(base+i*16),16).set(columns[i]);
  m.write32(out+168n,0);
  // The overlapping native stores clear +0x98..+0xa4, including enabled,
  // lit, specialSound, consumable and numWaxToGive. +0xa5..+0xa7 survive.
  m.write64(out+157n,0n);m.write64(out+152n,0n);
 }
 return out;
}
/** Original SetTransform/GetTransform copy each column in order. Keep this
 * order for aliasing; copying the entire matrix through a temporary differs. */
export function setOriginalCandleTransform(m:ModelBakeMemory,out:bigint,input:bigint|Uint8Array){
 if(input instanceof Uint8Array&&input.length!==64)throw new Error('原蜡烛变换长度无效');
 for(let i=0n;i<64n;i+=16n)m.bytes(out+16n+i,16).set(new Uint8Array(typeof input==='bigint'?m.bytes(input+i,16):input.subarray(Number(i),Number(i)+16)));
}
export function getOriginalCandleTransform(m:ModelBakeMemory,out:bigint,input:bigint){
 for(let i=0n;i<64n;i+=16n)m.bytes(out+i,16).set(new Uint8Array(m.bytes(input+16n+i,16)));
 return out;
}
export function getOriginalCandleEnabled(m:ModelBakeMemory,out:bigint){return m.bytes(out+160n,1)[0];}
/** Original SetEnabled also updates Candle's live rendering record. Call only
 * with an actual bound record; the owner must not invent one to hide missing
 * CandleBarn Load/resource/RenderData dependencies. */
export function setOriginalCandleEnabled(m:ModelBakeMemory,out:bigint,enabled:number){
 m.write8(out+160n,enabled&255);
 m.write8(m.read64(out+144n)+100n,enabled&255);
}
export function unloadOriginalFlowerBarn(m:ModelBakeMemory,barn:bigint,services:{releaseVertexData(p:bigint):void;releaseRenderData(p:bigint):void}){
 services.releaseVertexData(barn+16n);services.releaseRenderData(barn+0x450n);services.releaseRenderData(barn+0x990n);
 m.write32(barn+0x11dc0n,0);
}
