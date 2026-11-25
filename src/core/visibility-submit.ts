import {visibilityAdd as add,visibilityMul as mul,visibilityRound} from './visibility-float';
import {transformVisibilityVertices,type VisibilityReciprocal} from './visibility-transform';
import {rasterVisibilityTriangles} from './visibility-raster';
import {clipVisibilityTriangles} from './visibility-clip';

export type VisibilityScratchStage='transformed'|'selected'|'clippedVertices'|'clippedIndices';
export interface VisibilityScratchAllocator {
  /** Explicit initial memory, including the original uninitialized scratch lanes. */
  allocate(bytes:number,alignment:number,stage:VisibilityScratchStage):Uint8Array;
  free(memory:Uint8Array,stage:VisibilityScratchStage):void;
}
export function visibilityScreenMatrix(width:number,height:number,viewProjection:ArrayLike<number>):Float32Array {
  if(viewProjection.length!==16)throw new Error('Visibility projection matrix');
  const m=Float32Array.from(viewProjection);
  if(!Array.from(m).every(Number.isFinite))throw new Error('Visibility projection finite float32');
  const x=mul(visibilityRound(width),0.5),y=mul(visibilityRound(height),0.5);
  const screen=[x,0,0,0,0,y,0,0,0,0,1,0,add(x,-0.5),add(y,-0.5),0,1];
  const result=new Float32Array(16);
  // Original unmodified matrix multiply 0x100076df0, each column left-to-right.
  for(let column=0;column<4;column++)for(let row=0;row<4;row++) {
    result[column*4+row]=add(add(add(mul(screen[row],m[column*4]),mul(screen[row+4],m[column*4+1])),mul(screen[row+8],m[column*4+2])),mul(screen[row+12],m[column*4+3]));
  }
  return result;
}

/** Numeric geometry-submit chain 0x100720250. Caller provides real allocation
 * snapshots and CPU math capabilities; resource loading, debugging and game
 * lifetime remain outside this function. The original selected capacity is
 * floor(indexCount/48), much smaller than the number of source triangles.
 */
export function submitVisibilityGeometry(depth:Float32Array,width:number,height:number,vertices:Uint8Array,vertexCount:number,indices:Uint16Array,indexCount:number,viewProjection:ArrayLike<number>,scratch:VisibilityScratchAllocator,reciprocal:VisibilityReciprocal,minimum:(a:number,b:number)=>number) {
  if(!Number.isInteger(vertexCount)||vertexCount<0||vertices.length<vertexCount*16||!Number.isInteger(indexCount)||indexCount<0||indexCount>indices.length)throw new Error('Visibility geometry source range');
  const matrix=visibilityScreenMatrix(width,height,viewProjection),allocations:{memory:Uint8Array;stage:VisibilityScratchStage}[]=[];
  const allocate=(bytes:number,alignment:number,stage:VisibilityScratchStage)=>{
    const memory=scratch.allocate(bytes,alignment,stage);
    if(memory.byteLength<bytes||memory.byteOffset%Math.min(alignment,4))throw new Error('Visibility scratch snapshot range/alignment');
    allocations.push({memory,stage});return memory;
  };
  try {
    const transformedMemory=allocate(vertexCount*16,16,'transformed'),transformed=new Float32Array(transformedMemory.buffer,transformedMemory.byteOffset,vertexCount*4);
    transformVisibilityVertices(vertices,vertexCount,matrix,transformed,reciprocal);
    const capacity=Math.floor(indexCount/48),selectedMemory=allocate(capacity*4,4,'selected'),selected=new Uint32Array(selectedMemory.buffer,selectedMemory.byteOffset,capacity),selection={triangles:selected,count:0};
    rasterVisibilityTriangles(depth,width,height,transformed,indices,indexCount,selection,reciprocal,minimum);
    const clippedVertexMemory=allocate((selection.count*4+1)*16,16,'clippedVertices'),clippedVertices=new Float32Array(clippedVertexMemory.buffer,clippedVertexMemory.byteOffset,(selection.count*4+1)*4);
    const clippedIndexMemory=allocate((selection.count*6+11)*2,2,'clippedIndices'),clippedIndices=new Uint16Array(clippedIndexMemory.buffer,clippedIndexMemory.byteOffset,selection.count*6+11);
    const clipped=clipVisibilityTriangles(vertices,indices,selected,selection.count,matrix,clippedVertices,clippedIndices);
    rasterVisibilityTriangles(depth,width,height,clippedVertices,clippedIndices,clipped.indexCount,null,reciprocal,minimum);
    return {matrix,transformed,selected,selectedCount:selection.count,clipped};
  }finally{for(const allocation of allocations.reverse())scratch.free(allocation.memory,allocation.stage);}
}
