import {allocateOriginalSceneFoundation,constructOriginalSceneFoundation,getOriginalSceneTransform,getOriginalTerrainBlobObb,setOriginalTerrainBlobTransform,setOriginalCameraKeyFrameTransform,hotDateOriginalCameraKeyFrame,getOriginalParentEnabled,setOriginalParentEnabled,originalSceneObbAabb,type SceneFoundationKind} from '../src/core/scene-foundation-runtime';
export const SCENE_FOUNDATION_BASE=0x360000000n;
export const SCENE_FOUNDATION_OPERATIONS=['placement','allocate','getTransform','setTransform','hotDate','getObb','getEnabled','setEnabled','aabb'] as const;
export interface SceneFoundationCase {label:string;kind:SceneFoundationKind;operation:typeof SCENE_FOUNDATION_OPERATIONS[number];seed:number;classId:number;classIdAfterEnsure?:number;matrix?:string;obb?:string;sourceOffset?:number;outputOffset?:number;enabled?:number;}
export function prepareSceneFoundation(c:SceneFoundationCase){
 const b=Buffer.alloc(4096);for(let i=0;i<b.length;i++)b[i]=(c.seed+i*113)&255;
 const base=SCENE_FOUNDATION_BASE,at=(a:bigint)=>Number(a-base),m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 b.writeUInt32LE(c.classId>>>0,0xe38);if(c.obb)Buffer.from(c.obb,'base64').copy(b,0x310);
 const source=c.sourceOffset??0x600,out=c.outputOffset??0x800;if(c.matrix)Buffer.from(c.matrix,'base64').copy(b,source);return{b,m,base,source,out};
}
export function evaluateSceneFoundation(c:SceneFoundationCase){
 const {b,m,base,source,out}=prepareSceneFoundation(c),object=base+0x100n;let result=0n,allocations=0,ensures=0,size=0,order=0n,steps=0;
 const step=(n:number)=>{order|=BigInt(n)<<BigInt(steps++*8);};
 const services={allocate:(n:number)=>{allocations++;size=n;step(1);return object;},ensureObjectMeta:()=>{ensures++;step(2);if(c.classIdAfterEnsure!==undefined)m.write32(base+0xe38n,c.classIdAfterEnsure);},classId:()=>m.read32(base+0xe38n)};
 switch(c.operation){
  case 'placement':result=constructOriginalSceneFoundation(m,object,c.kind,services);break;
  case 'allocate':result=allocateOriginalSceneFoundation(m,c.kind,services);break;
  case 'getTransform':getOriginalSceneTransform(m,object,m.bytes(base+BigInt(out),64));result=base+BigInt(out);break;
  case 'setTransform':if(c.kind==='TerrainBlob')setOriginalTerrainBlobTransform(m,object,m.bytes(base+BigInt(source),64));else setOriginalCameraKeyFrameTransform(m,object,m.bytes(base+BigInt(source),64));break;
  case 'hotDate':hotDateOriginalCameraKeyFrame(m,object);break;
  case 'getObb':getOriginalTerrainBlobObb(m,object,m.bytes(base+BigInt(out),64));result=base+BigInt(out);break;
  case 'getEnabled':result=BigInt(getOriginalParentEnabled(m,object));break;
  case 'setEnabled':setOriginalParentEnabled(m,object,c.enabled??0);break;
  case 'aabb':m.bytes(base+BigInt(out),32).set(originalSceneObbAabb(m.bytes(base+BigInt(source),64)));break;
 }
 const h=Buffer.alloc(32);h.writeBigUInt64LE(result);h.writeUInt32LE(allocations,8);h.writeUInt32LE(ensures,12);h.writeBigUInt64LE(BigInt(size),16);h.writeBigUInt64LE(order,24);return Buffer.concat([h,b]);
}
