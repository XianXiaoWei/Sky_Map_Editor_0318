import type {MaterialDef} from './mesh-surfaces';

/** Already loaded LevelData skirt records: 40-byte vertices, local u16 indices.
 * Resource manager lookup, original heap and GPU ownership are separate services. */
export interface LoadedSkirtRecord {vertices:Uint8Array;indices:Uint16Array;}
export interface SkirtBarnGeometry {
  skirtCount:number;vertexCount:number;indexCount:number;materialCount:number;
  baseVertices:Uint8Array;userData0:Uint8Array;userData1:Uint8Array;
  indices:Uint32Array;records:Uint8Array;
}
const fmax=Math.fround(3.4028234663852886e38);
const view=(a:Uint8Array)=>new DataView(a.buffer,a.byteOffset,a.byteLength);
// SSE MIN/MAX choose the second operand on unordered/equal comparisons.
const min=(a:number,b:number)=>a<b?a:b,max=(a:number,b:number)=>a>b?a:b;

/** CPU output of SkirtBarn Initialize 0x1005abf50 for explicit loaded records.
 * Unknown IDs have no bit in the original table. Slot 2 is allocated but never
 * written by this function, so its initial bytes must be supplied explicitly.
 * Existing +0x20 index count is accumulated; +0x1c vertex count is reset. */
export function buildSkirtBarnGeometry(source:readonly LoadedSkirtRecord[],defs:readonly MaterialDef[],options:{initialIndexCount:number;allocationFill:number}):SkirtBarnGeometry {
  if(defs.length!==30||defs.some((d,i)=>d.index!==i||!Number.isInteger(d.materialId)||d.materialId<1||d.materialId>255))throw new Error('SkirtBarn requires original 30 material definitions');
  if(!Number.isInteger(options.initialIndexCount)||options.initialIndexCount<0||options.initialIndexCount>0xffffffff||!Number.isInteger(options.allocationFill)||options.allocationFill<0||options.allocationFill>255)throw new Error('SkirtBarn initial storage');
  let vertexCount=0,indexCount=options.initialIndexCount;
  for(const s of source){
    if(s.vertices.length%40||s.vertices.length/40>65536||s.indices.some(i=>i>=s.vertices.length/40))throw new Error('SkirtBarn source record');
    vertexCount+=s.vertices.length/40;indexCount+=s.indices.length;
  }
  if(vertexCount>0xffffffff||indexCount>0xffffffff||vertexCount*36>256000000||indexCount*4>256000000)throw new Error('SkirtBarn storage capacity');
  const allocated=(n:number)=>new Uint8Array(n).fill(options.allocationFill);
  const baseVertices=allocated(vertexCount*36),userData0=allocated(vertexCount*4),userData1=allocated(vertexCount*4),records=allocated(source.length*48);
  const rawIndices=allocated(indexCount*4),indices=new Uint32Array(rawIndices.buffer),r=view(records);let vertexBase=0,indexBase=0;
  source.forEach((s,ordinal)=>{
    const v=view(s.vertices),at=ordinal*48,present=new Uint8Array(256);
    for(let lane=0;lane<3;lane++){r.setFloat32(at+lane*4,fmax,true);r.setFloat32(at+16+lane*4,-fmax,true);}
    // W lanes are not used by this CPU contract; native inherits caller SIMD
    // values. Preserve explicit storage rather than invent a semantic value.
    r.setUint32(at+32,s.indices.length,true);r.setUint32(at+36,0,true);
    for(let i=0;i<s.vertices.length/40;i++){
      baseVertices.set(s.vertices.subarray(i*40,i*40+36),(vertexBase+i)*36);
      userData1.set(s.vertices.subarray(i*40+36,i*40+40),(vertexBase+i)*4);
      for(let lane=0;lane<3;lane++){
        const value=v.getFloat32(i*40+lane*4,true);
        r.setFloat32(at+lane*4,min(r.getFloat32(at+lane*4,true),value),true);
        r.setFloat32(at+16+lane*4,max(r.getFloat32(at+16+lane*4,true),value),true);
      }
      for(let slot=0;slot<4;slot++){const id=s.vertices[i*40+16+slot];if(id)present[id]=1;}
    }
    let mask=0;defs.forEach((d,i)=>{if(present[d.materialId])mask|=1<<i;});r.setUint32(at+36,mask>>>0,true);
    for(let i=0;i<s.indices.length;i++)indices[indexBase+i]=s.indices[i]+vertexBase;
    vertexBase+=s.vertices.length/40;indexBase+=s.indices.length;
  });
  return {skirtCount:source.length,vertexCount,indexCount,materialCount:30,baseVertices,userData0,userData1,indices,records};
}

export const skirtVertexStreams=[
  {slot:0,stride:36,types:[3,24,28,28,28,28,28],attributes:[1,3,32,33,13,14,15]},
  {slot:2,stride:4,types:[24],attributes:[24]},
  {slot:3,stride:4,types:[24],attributes:[25]},
] as const;

export interface SkirtBarnLifetime {
  skirtCount:number;vertexCount:number;indexCount:number;materialCount:number;
  records:Uint8Array|null;
}
export interface SkirtBarnTerminationServices {
  terminateMaterial:(ordinal:number)=>void;
  terminateGeometry:()=>void;
  releaseRecords:(records:Uint8Array)=>void;
}
/** Complete normal Terminate 0x1005aca70 ownership order. +0x18 remains intact.
 * Dependencies execute explicitly; this does not implement GPU destruction. */
export function terminateSkirtBarn(state:SkirtBarnLifetime,services:SkirtBarnTerminationServices):void {
  for(let i=0;i<state.materialCount;i++)services.terminateMaterial(i);
  services.terminateGeometry();state.vertexCount=state.indexCount=state.materialCount=0;
  if(state.records)services.releaseRecords(state.records);
  state.records=null;
}

export interface SkirtBarnDrawServices {
  clearMaterial:(ordinal:number)=>void;
  inFrustum:(minimum:readonly number[],maximum:readonly number[],ordinal:number)=>boolean;
  cameraPosition:(ordinal:number)=>void;
  withinDistance:(minimum:readonly number[],maximum:readonly number[],ordinal:number,limit:number)=>boolean;
  append:(material:number,start:number,count:number,ordinal:number)=>void;
  flushMaterial:(ordinal:number)=>void;
}
export interface SkirtDrawChunk {start:number;count:number;}
/** Vertex append 0x1007f6ae0: omit empty ranges, merge adjacent ranges,
 * otherwise append one chunk. This shared helper has a 1024-chunk limit.
 * The empty-queue FFFFFFFF sentinel path needs original hidden slot storage
 * and is rejected by this normal-range adapter. */
export function appendSkirtDrawChunk(chunks:SkirtDrawChunk[],start:number,count:number):void {
  if(!Number.isInteger(start)||start<0||start>0xffffffff||!Number.isInteger(count)||count<0||count>0xffffffff)throw new Error('Skirt draw range');
  if(!count)return;
  const previous=chunks.at(-1);
  if(!previous&&start===0xffffffff)throw new Error('Original sentinel requires raw chunk storage');
  if(previous&&((previous.start+previous.count)>>>0)===start){previous.count=(previous.count+count)>>>0;return;}
  if(chunks.length>=1024)throw new Error('Original render chunk capacity');
  chunks.push({start,count});
}
/** Original 0x1005acaf0 draw driver with explicit camera query services.
 * Frustum extraction, Camera getter and distance predicate are not inferred.
 * Rejected and zero-index records still advance the original index offset. */
export function dispatchSkirtBarnDraw(state:SkirtBarnLifetime,enabled:boolean,services:SkirtBarnDrawServices):void {
  if(!enabled)return;
  if(state.skirtCount&&(!state.records||state.records.length<state.skirtCount*48))throw new Error('SkirtBarn draw record storage');
  for(let material=0;material<state.materialCount;material++)services.clearMaterial(material);
  const r=state.records?view(state.records):null;let start=0;
  for(let ordinal=0;ordinal<state.skirtCount;ordinal++){
    const at=ordinal*48,minimum=[0,4,8].map(i=>r!.getFloat32(at+i,true)),maximum=[16,20,24].map(i=>r!.getFloat32(at+i,true));
    const count=r!.getUint32(at+32,true),mask=r!.getUint32(at+36,true);
    if(services.inFrustum(minimum,maximum,ordinal)){
      services.cameraPosition(ordinal);
      if(services.withinDistance(minimum,maximum,ordinal,40))for(let material=0;material<30;material++)if(mask&(1<<material))services.append(material,start,count,ordinal);
    }
    start=(start+count)>>>0;
  }
  for(let material=0;material<state.materialCount;material++)services.flushMaterial(material);
}
