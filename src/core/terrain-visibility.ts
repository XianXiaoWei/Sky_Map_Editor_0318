import type {CloudCardPlane} from './cloud-card-visibility';
import {queryVisibilitySpheres,type VisibilitySphereState} from './visibility-spheres';
import {queryVisibilityAabbs} from './visibility-aabbs';
import type {VisibilityReciprocal} from './visibility-transform';
import {visibilityAdd,visibilityMul,visibilityDiv,visibilitySqrt} from './visibility-float';

export interface TerrainFrustumArithmetic {
  add(a:number,b:number):number;mul(a:number,b:number):number;div(a:number,b:number):number;sqrt(a:number):number;
}
export const terrainFrustumRte:TerrainFrustumArithmetic={add:(a,b)=>Math.fround(a+b),mul:(a,b)=>Math.fround(a*b),div:(a,b)=>Math.fround(a/b),sqrt:a=>Math.fround(Math.sqrt(a))};
export const terrainFrustumRtz:TerrainFrustumArithmetic={add:visibilityAdd,mul:visibilityMul,div:visibilityDiv,sqrt:visibilitySqrt};

/** Original 0x10015e420. The snapshot contains three half-axis columns and
 * an OBB center column. Normalize then multiply by the original axis lengths;
 * cancelling these operations changes rounding and degenerate-axis behavior.
 * Original tangent OBBs are rejected. TerrainBarn does not set MXCSR here:
 * the caller must provide the ambient arithmetic capability explicitly.
 */
export function terrainObbInFrustum(planes:readonly CloudCardPlane[],halfAxes:ArrayLike<number>,math:TerrainFrustumArithmetic):boolean {
  if(planes.length!==6||planes.some(p=>p.length!==4)||halfAxes.length!==16)throw new Error('Terrain frustum snapshot dimensions');
  const matrix=Array.from(halfAxes,Math.fround),dot3=(a:number[],b:number[])=>math.add(math.add(math.mul(a[0],b[0]),math.mul(a[1],b[1])),math.mul(a[2],b[2]));
  const axes=[0,4,8].map(at=>matrix.slice(at,at+3)),lengths=axes.map(axis=>math.sqrt(dot3(axis,axis))),normalized=axes.map((axis,i)=>axis.map(v=>math.div(v,lengths[i])));
  const center=matrix.slice(12,15);
  for(const rawPlane of planes) {
    const p=rawPlane.map(Math.fround),projected=normalized.map(axis=>dot3(axis,p));
    // SSE combines the X and Z reductions in parallel, then Y + Z + X.
    const y=math.mul(lengths[1],Math.abs(projected[1])),z=math.mul(lengths[2],Math.abs(projected[2])),x=math.mul(lengths[0],Math.abs(projected[0]));
    const radius=math.add(x,math.add(z,y)),distance=math.add(p[3],dot3(center,p));
    if(-radius>=distance)return false;
  }
  return true;
}

export interface TerrainVisibilityObject {
  enabled:boolean;
  /** Original object+0x60 and +0xa0 snapshots; not bounds guessed from draws. */
  halfAxes:ArrayLike<number>;sphere:readonly number[];
}
/** TerrainBarn 0x1006a2c90..0x1006a2d71 candidate gathering, sphere query
 * with initialize=true, then swap-with-last object/status compaction. This is
 * the stage before native distance sorting and per-bin AABB/LOD/job dispatch.
 */
export function terrainOcclusionCandidates(objects:readonly TerrainVisibilityObject[],planes:readonly CloudCardPlane[],state:VisibilitySphereState,math:TerrainFrustumArithmetic,reciprocal:VisibilityReciprocal,maximum:(a:number,b:number)=>number) {
  const candidateOrder:number[]=[],spheres:number[]=[];
  objects.forEach((object,index)=>{
    if(!object.enabled||!terrainObbInFrustum(planes,object.halfAxes,math))return;
    if(object.sphere.length!==4)throw new Error('Terrain object sphere snapshot dimensions');
    candidateOrder.push(index);spheres.push(...object.sphere);
  });
  const statuses=new Uint32Array(candidateOrder.length).fill(0xffffffff);
  queryVisibilitySpheres(state,Float32Array.from(spheres),statuses.length,statuses,true,reciprocal,maximum);
  const candidateStatuses=Array.from(statuses),visibleOrder=candidateOrder.slice();let count=visibleOrder.length;
  for(let index=0;index<count;) {
    if(statuses[index]!==0){index++;continue;}
    count--;statuses[index]=statuses[count];visibleOrder[index]=visibleOrder[count];
  }
  visibleOrder.length=count;
  return {candidateOrder,candidateStatuses,visibleOrder,visibleStatuses:Array.from(statuses.subarray(0,count))};
}

/** TerrainBarn 0x1006a3118..0x1006a3217 or 0x1006a3274..0x1006a331f.
 * With distance LOD enabled, use squared center distance minus squared sphere
 * radius, then three squared thresholds. Minimum LOD uses native CVTTSS2SI
 * and a signed 16-bit comparison. Status zero emits FFFF without clamping.
 * Constant mode emits 3 for every nonzero Visibility status. This does not
 * allocate terrain bins, dispatch jobs or apply the resulting LOD transitions.
 */
export function terrainBinLods(statuses:Uint32Array,spheres:Float32Array,eye:ArrayLike<number>,thresholds:ArrayLike<number>,minimumLod:number,distanceLod:boolean,math:TerrainFrustumArithmetic):Uint16Array {
  const result=new Uint16Array(statuses.length);
  if(!distanceLod){statuses.forEach((status,i)=>{result[i]=status===0?0xffff:3;});return result;}
  if(spheres.length!==statuses.length*4||eye.length!==4||thresholds.length!==3)throw new Error('Terrain bin LOD snapshot dimensions');
  const minimum=Math.fround(minimumLod),integer=Number.isFinite(minimum)&&minimum>=-0x80000000&&minimum<0x80000000?Math.trunc(minimum):-0x80000000,signedMinimum=(integer<<16)>>16;
  const limits=Array.from(thresholds,Math.fround).map(v=>math.mul(v,v)),position=Array.from(eye,Math.fround);
  statuses.forEach((status,i)=>{
    if(status===0){result[i]=0xffff;return;}
    const sphere=Array.from(spheres.subarray(i*4,i*4+4)),d=[0,1,2].map(lane=>math.add(sphere[lane],-position[lane])),squares=d.map(v=>math.mul(v,v));
    const distance=math.add(math.add(squares[0],squares[1]),squares[2]),metric=math.add(distance,-math.mul(sphere[3],sphere[3]));
    let lod=3;for(let index=0;index<3;index++)if(limits[index]>=metric){lod=index;break;}
    result[i]=Math.max(lod,signedMinimum);
  });
  return result;
}

/** Explicit original bin minima/maxima and sphere snapshots. Preserve their
 * original array order for four-lane AABB queries before selecting LODs. */
export function queryTerrainBinLods(state:VisibilitySphereState,minima:Float32Array,maxima:Float32Array,spheres:Float32Array,eye:ArrayLike<number>,thresholds:ArrayLike<number>,minimumLod:number,distanceLod:boolean,math:TerrainFrustumArithmetic,reciprocal:VisibilityReciprocal,minimum:(a:number,b:number)=>number,maximum:(a:number,b:number)=>number) {
  if(minima.length!==maxima.length||minima.length%4)throw new Error('Terrain bin bounds snapshot dimensions');
  const statuses=new Uint32Array(minima.length/4);
  queryVisibilityAabbs(state,minima,maxima,statuses.length,statuses,reciprocal,minimum,maximum);
  return {statuses,lods:terrainBinLods(statuses,spheres,eye,thresholds,minimumLod,distanceLod,math)};
}

