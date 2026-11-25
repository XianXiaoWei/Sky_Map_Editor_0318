import {visibilityAdd as add,visibilitySub as sub,visibilityMul as mul,visibilityDiv as div,visibilitySqrt as sqrt,visibilityDaz} from './visibility-float';

export interface VisibilityClippedGeometry {vertices:Float32Array;indices:Uint16Array;vertexCount:number;indexCount:number;discardedTriangles:number[];}
/** Numeric path of 0x10071f790 with the original diagnostic switch disabled.
 * Recomputes homogeneous vertices with raw-normal bias; clips z >= 0,
 * projects by signed 1/W, rejects oversized projections, emits a triangle or
 * quad, and appends a zero vertex plus indices to complete a four-triangle batch.
 * Output arrays are explicit preallocated snapshots. Original counts reset.
 */
export function clipVisibilityTriangles(vertices:Uint8Array,indices:Uint16Array,selected:Uint32Array,selectedCount:number,matrix:ArrayLike<number>,outputVertices:Float32Array,outputIndices:Uint16Array):VisibilityClippedGeometry {
  if(!Number.isInteger(selectedCount)||selectedCount<0||selectedCount>selected.length||vertices.length%16||outputVertices.length%4)throw new Error('Visibility clipping range');
  if(matrix.length!==16)throw new Error('Visibility clipping matrix');
  const m=Float32Array.from(matrix);if(!Array.from(m).every(Number.isFinite))throw new Error('Visibility clipping finite float32 matrix');
  for(let i=0;i<selectedCount;i++){const at=selected[i]*3;if(at+2>=indices.length)throw new Error('Visibility selected triangle');for(let j=0;j<3;j++)if(indices[at+j]*16+15>=vertices.length)throw new Error('Visibility selected vertex');}
  // The original allocation uses selectedCount*4+1 and selectedCount*6+11.
  if(selectedCount&&(outputVertices.length<(selectedCount*4+1)*4||outputIndices.length<selectedCount*6+11))throw new Error('Visibility clipping output allocation');
  let vertexCount=0,indexCount=0;const discardedTriangles:number[]=[];
  if(!selectedCount)return {vertices:outputVertices,indices:outputIndices,vertexCount,indexCount,discardedTriangles};
  const raw=new DataView(vertices.buffer,vertices.byteOffset,vertices.byteLength);
  const scale=div(0.0078125,sqrt(add(add(mul(m[1],m[1]),mul(m[5],m[5])),mul(m[9],m[9]))));
  function homogeneous(id:number):number[] {
    const at=id*16;let x=raw.getFloat32(at,true),y=raw.getFloat32(at+4,true),z=raw.getFloat32(at+8,true);
    const beforeW=add(add(mul(m[3],x),mul(m[11],z)),add(mul(m[7],y),m[15]));
    const bias=mul(scale,beforeW);
    x=sub(x,mul(raw.getInt8(at+12),bias));y=sub(y,mul(raw.getInt8(at+13),bias));z=sub(z,mul(raw.getInt8(at+14),bias));
    return Array.from({length:4},(_,row)=>add(m[row+12],add(mul(m[row+8],z),add(mul(m[row],x),mul(m[row+4],y)))));
  }
  for(let i=0;i<selectedCount;i++) {
    const triangle=selected[i],at=triangle*3,input=[homogeneous(indices[at]),homogeneous(indices[at+1]),homogeneous(indices[at+2])],polygon:number[][]=[];
    for(let j=0;j<3;j++) {
      const a=input[j],b=input[(j+1)%3],inside=visibilityDaz(a[2])>=0,nextInside=visibilityDaz(b[2])>=0;
      if(inside)polygon.push(a);
      if(inside!==nextInside){const t=div(a[2],sub(a[2],b[2]));polygon.push(a.map((v,lane)=>add(v,mul(sub(b[lane],v),t))));}
    }
    if(polygon.length<3)continue;
    const projected=polygon.map(v=>{const r=div(1,v[3]);return v.map((n,lane)=>mul(n,lane<3?r:0));});
    const [a,b,c,d]=projected;
    // The original overflow filter tests products separately, not area/determinant.
    const over=(x:number,y:number)=>Math.abs(mul(x,y))>1e9;
    const hugeFirst=over(sub(b[0],a[0]),sub(c[1],a[1]))&&over(sub(a[0],c[0]),sub(a[1],b[1]));
    const hugeSecond=projected.length===4&&over(sub(d[0],c[0]),sub(a[1],c[1]))&&over(sub(c[0],a[0]),sub(c[1],d[1]));
    if(hugeFirst||hugeSecond){discardedTriangles.push(triangle);continue;}
    projected.forEach((v,j)=>outputVertices.set(v,(vertexCount+j)*4));
    outputIndices.set([vertexCount,vertexCount+1,vertexCount+2],indexCount);indexCount+=3;
    if(projected.length===4){outputIndices.set([vertexCount+2,vertexCount+3,vertexCount],indexCount);indexCount+=3;}
    vertexCount+=projected.length;
  }
  if(indexCount) {
    outputVertices.fill(0,vertexCount*4,vertexCount*4+4);
    const padded=Math.ceil(indexCount/12)*12;outputIndices.fill(vertexCount,indexCount,padded);indexCount=padded;vertexCount++;
  }
  return {vertices:outputVertices,indices:outputIndices,vertexCount,indexCount,discardedTriangles};
}
