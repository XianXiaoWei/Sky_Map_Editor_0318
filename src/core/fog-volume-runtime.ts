import type {ModelBakeMemory} from './model-baked-runtime';
/** Whole FogVolume.Initialize 0x100355a70. Params at module+0xc retain
 * their metadata ID. Original visibility=.7, resolution=128, enabled=1;
 * inverted/additive/ignoreClouds=0. Queue/default sphere pointers reset. */
export function initializeOriginalFogVolume(m:ModelBakeMemory,module:bigint):void {
 m.write32(module+0x18n,1);m.write64(module+0x10n,0x803f333333n);m.write64(module+0x20n,0n);m.write32(module+0xa630n,0);
}
export function initialOriginalFogVolumeFields(){
 const b=new Uint8Array(0xa640),v=new DataView(b.buffer),m={bytes:(p:bigint,n:number)=>b.subarray(Number(p),Number(p)+n),read32:(p:bigint)=>v.getUint32(Number(p),true),read64:(p:bigint)=>v.getBigUint64(Number(p),true),write32:(p:bigint,n:number)=>v.setUint32(Number(p),n,true),write64:(p:bigint,n:bigint)=>v.setBigUint64(Number(p),n,true),write8:(p:bigint,n:number)=>v.setUint8(Number(p),n),string:()=>''};
 initializeOriginalFogVolume(m,0n);
 return {visibility:v.getFloat32(16,true),resolution:v.getUint32(20,true),enabled:b[24],inverted:b[25],additive:b[26],ignoreClouds:b[27]};
}
/** Original ordinary FogVolumeSphere transform/flag leaves. SetTransform
 * writes actual matrix bytes; no GPU readiness or geometry is fabricated. */
export function setOriginalFogVolumeSphereTransform(m:ModelBakeMemory,p:bigint,matrix:Uint8Array){if(matrix.length!==64)throw new Error('FogVolumeSphere matrix must be 64 bytes');m.bytes(p+16n,64).set(matrix);}
export function getOriginalFogVolumeSphereTransform(m:ModelBakeMemory,p:bigint){return new Uint8Array(m.bytes(p+16n,64));}
