import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value,truncateOriginalFloatToInt} from './object-numeric-runtime';
import {transformNativeObb} from './marker-transform-runtime';

const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b),div=(a:number,b:number)=>f(a/b);
// SSE MIN/MAX forward the second operand on an unordered comparison.
const min=(a:number,b:number)=>a<b?a:b,max=(a:number,b:number)=>a>b?a:b;
const get=(m:ModelBakeMemory,a:bigint)=>value(m.read32(a)),put=(m:ModelBakeMemory,a:bigint,v:number)=>m.write32(a,bits(v));
const xyz=(m:ModelBakeMemory,a:bigint)=>[0n,4n,8n].map(o=>get(m,a+o));
export interface BeamoScratchServices {
 allocator():bigint;
 tag():bigint;
 allocate(allocator:bigint,bytes:bigint,tag:bigint,alignment:number):bigint;
 free(allocator:bigint,address:bigint):void;
}
const allocate=(s:BeamoScratchServices,bytes:bigint,alignment:number)=>{const allocator=s.allocator();return s.allocate(allocator,bytes,s.tag(),alignment);};
const release=(s:BeamoScratchServices,a:bigint)=>s.free(s.allocator(),a);
export interface BeamoNormalServices extends BeamoScratchServices {
 /** RSQRTSS is CPU-specific. Supply an independently checked capability;
  * silently replacing it with a JS reciprocal changes packed normals. */
 rsqrt(bits:number):number;
}
/** Entire normal 0x10045ee30 plus wrapper 0x10045edf0. Accumulate triangle
 * area normals in the Mesh +0x98 groups, then pack and remap to render vertices.
 * The fourth output byte stays untouched. Default MXCSR and finite input
 * positions are the tested arithmetic domain; degeneracy keeps SSE NaN clamps.
 * Beamo's wrapper selects original positions, not alternate remapped positions. */
export function generateOriginalBeamoNormals(m:ModelBakeMemory,out:bigint,positions:bigint,lod:bigint,s:BeamoNormalServices){
 const vertexCount=m.read32(lod+0x34n),indexCount=m.read32(lod+0x38n),indices=m.read64(lod+0x80n),groups=m.read32(lod+0x40n),remap=m.read64(lod+0x98n);
 const sums=allocate(s,BigInt(groups)*16n,16);m.bytes(sums,groups*16).fill(0);
 for(let i=0;i<indexCount;i+=3){
  const ids=[0,1,2].map(j=>m.read32(indices+BigInt((i+j)*4))),p=ids.map(id=>xyz(m,positions+BigInt(id)*16n));
  const a=p[1].map((v,j)=>sub(v,p[0][j])),b=p[2].map((v,j)=>sub(v,p[0][j]));
  const n=[sub(mul(a[1],b[2]),mul(a[2],b[1])),sub(mul(a[2],b[0]),mul(a[0],b[2])),sub(mul(a[0],b[1]),mul(a[1],b[0]))];
  // Every group lookup and accumulation is ordered, including duplicate IDs.
  for(const id of ids){const at=sums+BigInt(m.read32(remap+BigInt(id)*4n))*16n;for(let j=0;j<3;j++)put(m,at+BigInt(j*4),add(n[j],get(m,at+BigInt(j*4))));}
 }
 const packed=allocate(s,BigInt(groups)*4n,4);
 for(let i=0;i<groups;i++){
  const n=xyz(m,sums+BigInt(i)*16n),square=add(mul(n[2],n[2]),add(mul(n[0],n[0]),mul(n[1],n[1]))),r=value(s.rsqrt(bits(square)));
  const lanes=n.map(v=>truncateOriginalFloatToInt(bits(min(max(mul(mul(v,r),value(0x42ffff7d)),-128),127)))&255);
  m.write32(packed+BigInt(i)*4n,lanes[0]|lanes[1]<<8|lanes[2]<<16);
 }
 for(let i=0;i<vertexCount;i++){const src=packed+BigInt(m.read32(remap+BigInt(i)*4n))*4n;m.bytes(out+BigInt(i)*4n,3).set(m.bytes(src,3));}
 release(s,packed);release(s,sums);
}
export interface BeamoWeightServices extends BeamoScratchServices {
 meshName(object:bigint,vptr:bigint):string;
 transform(object:bigint,vptr:bigint):Uint8Array;
 localObb(object:bigint,vptr:bigint):Uint8Array;
 distanceToObb(point:Uint8Array,obb:Uint8Array):number;
}
/** Whole normal finite Obb distance leaf 0x10078ce10; axes shorter than the
 * original 1e-5 threshold retain their tiny basis rather than divide by zero. */
export function distanceOriginalBeamoObb(point:Uint8Array,obb:Uint8Array){
 const p=new DataView(point.buffer,point.byteOffset,point.byteLength),b=new DataView(obb.buffer,obb.byteOffset,obb.byteLength);
 const d=[0,1,2].map(i=>sub(p.getFloat32(i*4,true),b.getFloat32(48+i*4,true)));
 const delta=[0,1,2].map(i=>{const axis=[0,1,2].map(j=>b.getFloat32(i*16+j*4,true)),extent=f(Math.sqrt(add(mul(axis[2],axis[2]),add(mul(axis[0],axis[0]),mul(axis[1],axis[1])))));
  if(extent>value(0x3727c5ac))for(let j=0;j<3;j++)axis[j]=div(axis[j],extent);
  const dot=add(mul(d[2],axis[2]),add(mul(d[0],axis[0]),mul(d[1],axis[1])));
  return dot< -extent?add(extent,dot):extent<dot?sub(dot,extent):0;
 });
 return f(Math.sqrt(add(add(mul(delta[0],delta[0]),mul(delta[1],delta[1])),mul(delta[2],delta[2]))));
}
/** Entire normal secondary-weight helper 0x1001975c0, with original virtual
 * name/transform/OBB and distance queries as explicit services. Auto-moss uses
 * the newly generated packed normal. UnitCube volume collection keeps original
 * order and dynamic count reads; its fixed 32-OBB scratch capacity is unchanged. */
export function updateOriginalBeamoWeights(m:ModelBakeMemory,count:number,normals:bigint,positions:bigint,volumeBarn:bigint,weights:bigint,autoMoss:number,s:BeamoWeightServices){
 const ns=allocate(s,BigInt(count)*16n,16),ps=allocate(s,BigInt(count)*16n,16);
 for(let i=0;i<count;i++){
  const normal=m.bytes(normals+BigInt(i)*4n,3),at=ns+BigInt(i)*16n;
  for(let j=0;j<3;j++){const signed=normal[j]>=128?normal[j]-256:normal[j];put(m,at+BigInt(j*4),mul(signed,signed>=0?value(0x3c010204):1/128));}put(m,at+12n,0);
  m.bytes(ps+BigInt(i)*16n,12).set(m.bytes(positions+BigInt(i)*16n,12));m.write32(ps+BigInt(i)*16n+12n,0);
 }
 if(autoMoss!==0)for(let i=0;i<count;i++){
  const n=xyz(m,ns+BigInt(i)*16n);
  let t=min(max(add(mul(n[2],0),add(mul(n[0],0),mul(n[1],1))),0),1);t=div(add(t,value(0xbe4ccccd)),value(0x3eccccce));t=min(max(t,0),1);
  const square=mul(t,t),cube=mul(t,square),poly=add(mul(t,add(mul(t,6),-15)),10),at=weights+BigInt(i)*4n;
  put(m,at,max(get(m,at),mul(cube,poly)));
 }
 const obbs=allocate(s,2048n,16);let used=0;
 for(let i=0;i<m.read32(volumeBarn+0x185110n);i++){
  const object=volumeBarn+16n+BigInt(i)*0xa60n;
  if(s.meshName(object,m.read64(object))==='UnitCube'){
   const matrix=s.transform(object,m.read64(object)),local=s.localObb(object,m.read64(object));
   m.bytes(obbs+BigInt(used++)*64n,64).set(transformNativeObb(matrix,local));
  }
 }
 for(let i=0;i<count;i++)for(let j=0;j<used;j++){
  const distance=s.distanceToObb(m.bytes(ps+BigInt(i)*16n,16),m.bytes(obbs+BigInt(j)*64n,64));
  const t=f(min(max(distance/0.2,0),1));
  const at=weights+BigInt(i)*4n;put(m,at,max(get(m,at),sub(1,t)));
 }
 release(s,obbs);release(s,ps);release(s,ns);
}
export interface BeamoUploadServices extends BeamoScratchServices {
 fallbackLighting():Uint8Array;
 generateNormals(out:bigint,positions:bigint,lod:bigint):void;
 updateWeights(count:number,normals:bigint,positions:bigint,volumeBarn:bigint,weights:bigint,autoMoss:number):void;
}
export interface BeamoUploadResult {vertices:number;primaryIndices:number;secondaryIndices:number;alphaIndices:number;}
/** Whole normal upload-LOD helper 0x100197ab0. The real Mesh/loaded bake and
 * caller's shared vertex/index buffers already exist. No Model is synthesized.
 * Includes compact vertex remap, trisCulled filtering and three material ranges.
 * Offsets are caller-owned: this function returns counts without advancing them.
 */
export function uploadOriginalBeamoLod(m:ModelBakeMemory,record:bigint,bake:bigint,volumeBarn:bigint,lodIndex:number,offsets:bigint,vertices:bigint,indices:bigint,s:BeamoUploadServices):BeamoUploadResult{
 const lod=m.read64(m.read64(record+0x18n)+0x48n)+BigInt(lodIndex>>>0)*0xb8n;
 const fallback=s.fallbackLighting();if(fallback.length!==12)throw new Error('原 Beamo 默认光照必须为12字节');
 const count=()=>m.read32(lod+0x34n);
 const live=allocate(s,BigInt(count()),1),remap=allocate(s,BigInt(count())*4n,4),world=allocate(s,BigInt(count())*16n,16),normals=allocate(s,BigInt(count())*4n,16),weights=allocate(s,BigInt(count())*4n,16);
 for(let i=0;i<count();i++){
  const at=world+BigInt(i)*16n;m.bytes(at,16).set(m.bytes(m.read64(lod+0x60n)+BigInt(i)*16n,16));
  const p=xyz(m,at),matrix=Array.from({length:4},(_,j)=>xyz(m,record+0x30n+BigInt(j)*16n));
  for(let j=0;j<3;j++)put(m,at+BigInt(j*4),add(matrix[3][j],add(add(mul(p[0],matrix[0][j]),mul(p[1],matrix[1][j])),mul(p[2],matrix[2][j]))));
 }
 s.generateNormals(normals,world,lod);m.bytes(weights,count()*4).fill(0);s.updateWeights(count(),normals,world,volumeBarn,weights,m.bytes(record+0xf4n,1)[0]);
 for(let i=0;i<count();i++){const at=world+BigInt(i)*16n+15n,alpha=m.bytes(at,1)[0];m.write8(at,truncateOriginalFloatToInt(bits(mul(max(get(m,weights+BigInt(i)*4n),div(alpha,255)),255))));}
 let culled=0n;
 if(bake){culled=m.read64(m.read64(bake+0x28n)+BigInt(lodIndex>>>0)*24n+16n);if(!culled)throw new NativeObjectFoundationFailure('Beamo.cpp',475,3,'bake->lods[ lodLevel ].trisCulled');m.bytes(live,count()).fill(0);
  const indexCount=m.read32(lod+0x38n);if(((indexCount+2)>>>0)>=5){const triangles=Math.trunc((indexCount|0)/3),source=m.read64(lod+0x80n);for(let i=0;i<triangles;i++)if(m.bytes(culled+BigInt(i),1)[0]===0)for(let j=0;j<3;j++)m.write8(live+BigInt(m.read32(source+BigInt(i*3+j)*4n)),1);}
 }else m.bytes(live,count()).fill(1);
 let vertexCount=0;
 for(let i=0;i<count();i++){
  m.write32(remap+BigInt(i)*4n,vertexCount);
  if(m.bytes(live+BigInt(i),1)[0]===0)continue;
  const dst=vertices+BigInt((vertexCount+m.read32(offsets))>>>0)*48n,src=world+BigInt(i)*16n;
  m.bytes(dst,16).set(m.bytes(src,16));m.write32(dst+16n,m.read32(normals+BigInt(i)*4n));m.bytes(dst+20n,16).set(m.bytes(m.read64(lod+0x70n)+BigInt(i)*16n,16));
  if(bake){const light=m.read64(m.read64(bake+0x28n)+BigInt(lodIndex>>>0)*24n+8n)+BigInt(i)*12n;m.write32(dst+44n,m.read32(light+8n));m.write64(dst+36n,m.read64(light));}
  else{m.bytes(dst+36n,8).set(fallback.subarray(0,8));m.bytes(dst+44n,4).set(fallback.subarray(8,12));}
  vertexCount=(vertexCount+1)>>>0;
 }
 let primary=0,secondary=0,alpha=0;
 const emit=(stream:1|2|3,ids:number[])=>{const at=m.read32(offsets+BigInt(stream*4))+(stream===1?primary:stream===2?secondary:alpha);for(let j=0;j<3;j++)m.write32(indices+BigInt((at+j)>>>0)*4n,ids[j]);if(stream===1)primary=(primary+3)>>>0;else if(stream===2)secondary=(secondary+3)>>>0;else alpha=(alpha+3)>>>0;};
 const indexCount=m.read32(lod+0x38n);
 if(((indexCount+2)>>>0)>=5)for(let triangle=0;triangle<Math.trunc((m.read32(lod+0x38n)|0)/3);triangle++){
  if(bake&&m.bytes(culled+BigInt(triangle),1)[0]!==0)continue;
  const source=m.read64(lod+0x80n),ids=[0,1,2].map(j=>m.read32(source+BigInt(triangle*3+j)*4n)),mapped=ids.map(id=>(m.read32(remap+BigInt(id)*4n)+m.read32(offsets))>>>0);
  if(!m.read64(record+0xe0n))emit(1,mapped);
  else{const total=ids.reduce((n,id)=>n+m.bytes(world+BigInt(id)*16n+15n,1)[0],0);if(total>674)emit(2,mapped);else{emit(1,mapped);if(total>0)emit(3,mapped);}}
 }
 release(s,weights);release(s,normals);release(s,world);release(s,remap);release(s,live);
 return{vertices:vertexCount,primaryIndices:primary,secondaryIndices:secondary,alphaIndices:alpha};
}
