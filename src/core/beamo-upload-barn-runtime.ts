import type {ModelBakeMemory} from './model-baked-runtime';
import type {BeamoUploadResult} from './beamo-geometry-runtime';

/** Original 0x100aad5e0/0x100aad600 tables, in stream setter order. */
export const ORIGINAL_BEAMO_STREAM_FORMATS=[3,28,24,32,32,28,28,28] as const;
export const ORIGINAL_BEAMO_STREAM_ATTRIBUTES=[1,2,3,5,6,13,14,15] as const;
export interface BeamoBarnUploadServices {
 createVertexData(address:bigint,name:string,vertices:number):void;
 configureStream(address:bigint,slot:number,formats:readonly number[],attributes:readonly number[],count:number,usage:number,extra:number,extraPointer:bigint):void;
 configureIndices(address:bigint,slot:number,format:number,usage:number,count:number,extra:number):void;
 mapBuffer(address:bigint):bigint;
 upload(record:bigint,bake:bigint,volumeBarn:bigint,lod:number,offsets:bigint,vertices:bigint,indices:bigint):BeamoUploadResult;
 unmapBuffer(address:bigint):void;
 finishVertexData(address:bigint):void;
}
/** Barn.Load 0x100195be7..0x100195f45. Caller provides the original loader's
 * live context (offsets at +0x40) and resolved records. This includes sphere
 * publication, uint64 allocation totals, stream configuration, all Mesh LODs,
 * record ranges, count advancement and ordered unmap/finish. VertexData/heap
 * services and upload remain explicit; the upload service can call the proven
 * uploadOriginalBeamoLod on these same record/buffer addresses.
 *
 * Native reload points matter: after upload, range metadata goes to the cached
 * table, then subsequent LOD/record tests reload the live Barn table/counts.
 * Saved LOD enables do not filter this allocation/upload loop.
 */
export function uploadOriginalBeamoBarn(m:ModelBakeMemory,barn:bigint,context:bigint,volumeBarn:bigint,s:BeamoBarnUploadServices){
 const initialCount=m.read32(barn+0x20018n);
 for(let i=0;i<initialCount;i++){
  const record=m.read64(barn+0x20020n)+BigInt(i)*384n;
  m.bytes(barn+0x69830n+BigInt(i)*16n,16).set(m.bytes(record+0xa0n,16));
  m.write32(barn+0x6983cn+BigInt(i)*16n,m.read32(record+0xb0n));
 }
 let vertices=0n,indices=0n;
 if(initialCount){
  const table=m.read64(barn+0x20020n);
  for(let i=0;i<initialCount;i++){
   const mesh=m.read64(table+BigInt(i)*384n+0x18n),count=m.read32(mesh+0x40n),lods=m.read64(mesh+0x48n);
   for(let lod=0;lod<count;lod++){
    vertices=BigInt.asUintN(64,vertices+BigInt(m.read32(lods+BigInt(lod)*0xb8n+0x34n)));
    indices=BigInt.asUintN(64,indices+BigInt(m.read32(lods+BigInt(lod)*0xb8n+0x38n)));
   }
  }
 }
 const vertexData=barn+0x6c838n,indexCount=Number(indices&0xffffffffn),offsets=context+0x40n;
 s.createVertexData(vertexData,'Beamos',Number(vertices&0xffffffffn));
 s.configureStream(vertexData,0,ORIGINAL_BEAMO_STREAM_FORMATS,ORIGINAL_BEAMO_STREAM_ATTRIBUTES,8,1,0,0n);
 s.configureIndices(vertexData,0,9,1,(indexCount*3)>>>0,0);
 const vertexBufferOwner=barn+0x6c980n,indexBufferOwner=barn+0x6ca80n;
 const vertexBuffer=s.mapBuffer(vertexBufferOwner),indexBuffer=s.mapBuffer(indexBufferOwner);
 let advanced=[0,0,indexCount,(indexCount*2)>>>0];
 advanced.forEach((n,i)=>m.write32(offsets+BigInt(i*4),n));
 let table=m.read64(barn+0x20020n),objectCount=m.read32(barn+0x20018n);
 for(let i=0;i<objectCount;i++){
  let record=table+BigInt(i)*384n,mesh=m.read64(record+0x18n);
  if(m.read32(mesh+0x40n)){
   for(let lod=0;;lod++){
    record=table+BigInt(i)*384n;
    const counts=s.upload(record,m.read64(record+0x20n),volumeBarn,lod,offsets,vertexBuffer,indexBuffer);
    const range=record+BigInt(lod)*16n;
    m.bytes(range+0xfcn,16).set(m.bytes(offsets,16));
    const output=[counts.vertices,counts.primaryIndices,counts.secondaryIndices,counts.alphaIndices];
    output.forEach((n,j)=>m.write32(range+0x13cn+BigInt(j*4),n));
    advanced=advanced.map((n,j)=>(n+output[j])>>>0);
    advanced.forEach((n,j)=>m.write32(offsets+BigInt(j*4),n));
    table=m.read64(barn+0x20020n);mesh=m.read64(table+BigInt(i)*384n+0x18n);
    if(lod+1>=m.read32(mesh+0x40n))break;
   }
   objectCount=m.read32(barn+0x20018n);
  }
 }
 s.unmapBuffer(vertexBufferOwner);s.unmapBuffer(indexBufferOwner);s.finishVertexData(vertexData);
 return{allocatedVertices:vertices,allocatedIndices:indices,offsets:advanced};
}
