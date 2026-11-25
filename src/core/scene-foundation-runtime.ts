import type {ModelBakeMemory} from './model-baked-runtime';
import {copyOriginalMatrix} from './level-mesh-runtime';
import {transformNativeObb} from './marker-transform-runtime';
export type SceneFoundationKind='Parent'|'CameraKeyFrame'|'TerrainBlob';
export const ORIGINAL_SCENE_FOUNDATION_BYTES={Parent:144,CameraKeyFrame:144,TerrainBlob:640} as const;
export interface SceneFoundationConstructorServices {
 ensureObjectMeta():void;
 classId(kind:SceneFoundationKind):number;
 allocate(bytes:number):bigint;
}
/** Entire normal placement entries 0x100523e80/0x1001e2eb0/0x1006b0f30.
 * These are non-virtual Object-derived records: class ID is at +0, no vptr.
 * Most saved defaults come from the separate TGCL cache, NOT placement.
 * Parent enabled/pointers and TerrainBlob transform/shape remain untouched.
 */
export function constructOriginalSceneFoundation(m:ModelBakeMemory,address:bigint,kind:SceneFoundationKind,s:SceneFoundationConstructorServices){
 s.ensureObjectMeta();m.write32(address,s.classId(kind));
 if(kind==='Parent'){
  m.bytes(address+0x20n,24).fill(0);
  m.bytes(address+0x69n,32).fill(0);m.bytes(address+0x60n,32).fill(0);
 }else if(kind==='CameraKeyFrame'){
  for(let col=0;col<4;col++)for(let row=0;row<4;row++)m.write32(address+16n+BigInt(col*16+row*4),col===row?0x3f800000:0);
  m.write64(address+0x50n,0x4270000000000000n);
  m.write64(address+0x60n,0n);m.write32(address+0x68n,0x3f800000);
  m.bytes(address+0x70n,16).fill(0);m.write64(address+0x7dn,0n);
 }else{
  m.write64(address+0x1e8n,0n);m.write8(address+0x1f0n,0);
  [0x3f800000,0,0x3f800000,0x3f800000].forEach((v,i)=>m.write32(address+0x1f4n+BigInt(i*4),v));
 }
 return address;
}
/** Whole ordinary allocating constructors; allocator and Object meta bootstrap
 * remain explicit, in original allocation-before-metadata order. */
export function allocateOriginalSceneFoundation(m:ModelBakeMemory,kind:SceneFoundationKind,s:SceneFoundationConstructorServices){
 return constructOriginalSceneFoundation(m,s.allocate(ORIGINAL_SCENE_FOUNDATION_BYTES[kind]),kind,s);
}
export function getOriginalSceneTransform(m:ModelBakeMemory,address:bigint,out:Uint8Array=new Uint8Array(64)){
 return copyOriginalMatrix(out,m.bytes(address+16n,64));
}
export function setOriginalCameraKeyFrameTransform(m:ModelBakeMemory,address:bigint,matrix:Uint8Array){copyOriginalMatrix(m.bytes(address+16n,64),matrix);}
export function hotDateOriginalCameraKeyFrame(m:ModelBakeMemory,address:bigint){m.write8(address+0x84n,1);}
export function getOriginalParentEnabled(m:ModelBakeMemory,address:bigint){return m.bytes(address+24n,1)[0];}
export function setOriginalParentEnabled(m:ModelBakeMemory,address:bigint,enabled:number){m.write8(address+24n,enabled);}
/** Original 0x10078c720 keeps the ordered 16 corner extrema, including SSE
 * signed-zero ties and NaN candidates that retain the prior bound. Finite
 * matrix multiplication is owned by the shared original Obb kernel. */
export function originalSceneObbAabb(obb:Uint8Array){
 const d=new DataView(obb.buffer,obb.byteOffset,obb.byteLength),f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b);
 // The fourth initial lane is zero in BOTH original bound constants.
 const min=[1e9,1e9,1e9,0],max=[-1e9,-1e9,-1e9,0];
 for(let row=0;row<4;row++){
  const [a,b,c,t]=[0,16,32,48].map(col=>d.getFloat32(col+row*4,true)),ab=sub(a,b),sum=add(a,b),na=-a,nb=sub(na,b),ba=sub(b,a);
  for(const delta of [sub(ab,c),add(ab,c),sub(sum,c),add(sum,c),sub(nb,c),add(c,nb),sub(ba,c),add(c,ba)]){
   const lo=sub(t,delta),hi=add(t,delta);
   if(!Number.isNaN(lo))min[row]=min[row]<lo?min[row]:lo;
   if(!Number.isNaN(hi))max[row]=max[row]>hi?max[row]:hi;
  }
 }
 const out=new Uint8Array(32),v=new DataView(out.buffer);min.concat(max).forEach((n,i)=>v.setFloat32(i*4,n,true));return out;
}
export function getOriginalTerrainBlobObb(m:ModelBakeMemory,address:bigint,out:Uint8Array=new Uint8Array(64)){return copyOriginalMatrix(out,m.bytes(address+0x210n,64));}
/** Whole normal TerrainBlob.SetTransform: copy four columns, multiply by its
 * LIVE local +0x210 OBB, then write four-lane world min/max at +0x250/+0x260.
 * It does not infer the OBB from the saved shape or regenerate terrain/bakes.
 */
export function setOriginalTerrainBlobTransform(m:ModelBakeMemory,address:bigint,matrix:Uint8Array){
 copyOriginalMatrix(m.bytes(address+16n,64),matrix);
 const world=transformNativeObb(m.bytes(address+16n,64),m.bytes(address+0x210n,64));
 m.bytes(address+0x250n,32).set(originalSceneObbAabb(world));
}
/** Endpoints share live loader storage with later logic/scene consumers. */
export class OriginalSceneTransformEndpoint {
 constructor(readonly objectId:number,readonly address:bigint,readonly kind:'CameraKeyFrame'|'TerrainBlob',private readonly memory:ModelBakeMemory){}
 getTransform(){return getOriginalSceneTransform(this.memory,this.address);}
 setTransform(matrix:Uint8Array){if(this.kind==='TerrainBlob')setOriginalTerrainBlobTransform(this.memory,this.address,matrix);else setOriginalCameraKeyFrameTransform(this.memory,this.address,matrix);}
}
export class OriginalParentEndpoint {
 constructor(readonly objectId:number,readonly address:bigint,private readonly memory:ModelBakeMemory){}
 getEnabled(){return getOriginalParentEnabled(this.memory,this.address);}
 setEnabled(enabled:number){setOriginalParentEnabled(this.memory,this.address,enabled);}
}
