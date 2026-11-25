import {cloudCardInverse} from './cloud-card-inverse';
import {originalPointInObb} from './weather-event-runtime';
import {itemFloatBytes,itemFloats,itemView} from './item-effect-arithmetic';
import {originalFlowerNoise} from './flower-vertices-runtime';
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
export interface FlowerPatchState {nodeId:number;bytes:Uint8Array;}
export interface FlowerGroundTriangle {vertices:number[][];normalY:number;material:number;}
export interface FlowerSeed {sphere:number[];patches:number[];density:number;reserve:number;}
export const flowerFloat=(b:Uint8Array,at:number)=>itemView(b).getFloat32(at,true);
/** Quaternion columns in FlowerBarn's setup have no Marker axis normalization. */
export function prepareOriginalFlowerPatchRegion(bytes:Uint8Array){
 if(bytes.length!==272)throw new Error('FlowerPatch storage must have 272 bytes');
 const [x,y,z,w]=itemFloats(bytes.subarray(32,48)),xx=mul(x,add(x,x)),yy=mul(y,add(y,y)),zz=mul(z,add(z,z)),xy=mul(x,add(y,y)),xz=mul(x,add(z,z)),yz=mul(y,add(z,z)),wx=mul(w,add(x,x)),wy=mul(w,add(y,y)),wz=mul(w,add(z,z));
 const axes=[[sub(sub(1,yy),zz),add(xy,wz),sub(xz,wy)],[sub(xy,wz),sub(sub(1,xx),zz),add(yz,wx)],[add(xz,wy),sub(yz,wx),sub(sub(1,xx),yy)]],scale=itemFloats(bytes.subarray(48,64));
 const matrix=axes.flatMap((axis,i)=>[...axis.map(n=>mul(n,mul(scale[i],.5))),0]);matrix.push(...itemFloats(bytes.subarray(16,28)),1);
 const inverse=cloudCardInverse(matrix);bytes.set(itemFloatBytes(matrix),144);bytes.set(itemFloatBytes(inverse),208);
}
export function flowerPatchContains(bytes:Uint8Array,point:number[]){
 const shape=itemView(bytes).getUint32(124,true);
 if(shape===0)return true;
 if(shape===2)return originalPointInObb(itemFloatBytes([...point.slice(0,3),0]),bytes.subarray(144,208));
 if(shape!==1)return true;
 const inverse=itemFloats(bytes.subarray(208,272)),local=[0,1,2].map(i=>add(add(add(mul(point[0],inverse[i]),mul(point[1],inverse[4+i])),mul(point[2],inverse[8+i])),inverse[12+i]));
 return add(mul(local[2],local[2]),add(mul(local[0],local[0]),mul(local[1],local[1])))<=1;
}
/** Restored centroid/area weighting, seeded threshold, four-patch density
 * ordering and initial reservation equations from 0x10034fb10. Spatial OBB
 * overlap is supplied explicitly; native allocator/pool setup remains open. */
export function originalFlowerSeeds(patches:readonly FlowerPatchState[],geometries:readonly FlowerGroundTriangle[][],
 overlap:(patch:Uint8Array,center:number[],halfExtent:number[])=>boolean){
 const candidates:{center:number[];area:number;triangle:number}[]=[];let totalArea=0;
 for(const triangles of geometries)for(const [index,triangle] of triangles.entries()){
  if(triangle.normalY<=0)continue;const [a,b,c]=triangle.vertices,center=[0,1,2].map(i=>add(add(mul(a[i],f(.333333)),mul(b[i],f(.333333))),mul(c[i],f(.333333))));
  if(!(center[1]>0)||!patches.some(p=>p.bytes[120]&&p.bytes[132]===triangle.material&&flowerPatchContains(p.bytes,center)))continue;
  const u=a.map((v,i)=>sub(v,c[i])),v=b.map((n,i)=>sub(n,c[i])),cross=[sub(mul(u[1],v[2]),mul(u[2],v[1])),sub(mul(u[2],v[0]),mul(u[0],v[2])),sub(mul(u[0],v[1]),mul(u[1],v[0]))];
  const area=mul(f(Math.sqrt(add(add(mul(cross[0],cross[0]),mul(cross[1],cross[1])),mul(cross[2],cross[2])))),.5);
  candidates.push({center,area,triangle:index*3});totalArea=add(totalArea,area);
 }
 const densityScale=Math.max(f(.1),mul(totalArea,.000244140625)),radius=mul(f(Math.sqrt(densityScale)),1.5),seeds:FlowerSeed[]=[];let totalDensity=0,patchOverflow=0;
 for(const candidate of candidates){
  const u=mul(add(add(mul(f(originalFlowerNoise(candidate.triangle)),-(2**-30)),1),1),.5);
  if(!(f(candidate.area/densityScale)>add(u,f(.0015))))continue;
  if(seeds.length===4096)throw new Error('Original FlowerBarn seed capacity exceeded');
  const eligible=patches.map((p,i)=>({p,i})).filter(({p})=>p.bytes[120]&&(itemView(p.bytes).getUint32(124,true)===0||overlap(p.bytes,candidate.center,[radius,2,radius])));
  if(eligible.length>4)patchOverflow+=eligible.length-4;
  const selected=eligible.slice(0,4).sort((a,b)=>flowerFloat(b.p.bytes,112)-flowerFloat(a.p.bytes,112));
  if(!selected.length)throw new Error('Original FlowerBarn seed has no patch');
  let density=0,r=radius;for(const {p} of selected){density=add(density,flowerFloat(p.bytes,112));totalDensity=add(totalDensity,flowerFloat(p.bytes,112));r=Math.max(r,add(radius,flowerFloat(p.bytes,116)));}
  seeds.push({sphere:[...candidate.center,r],patches:selected.map(s=>s.i),density,reserve:0});
 }
 for(const seed of seeds)seed.reserve=Math.min(Math.trunc(mul(f(seed.density/totalDensity),98304)),Math.trunc(add(mul(seed.density,densityScale),1)))&0xffff;
 return {seeds,densityScale,patchOverflow,candidateTriangles:candidates.length};
}
/** Original Update's target count, with all float32 arithmetic boundaries. */
export function originalFlowerTarget(seed:FlowerSeed,densityScale:number,eye:number[],forward:number[]){
 const distance=seed.sphere.slice(0,3).map((v,i)=>sub(v,add(eye[i],mul(forward[i],f(.1))))),length=f(Math.sqrt(add(mul(distance[2],distance[2]),add(mul(distance[0],distance[0]),mul(distance[1],distance[1])))));
 const attenuation=f(1/f(Math.sqrt(Math.max(1,sub(length,Math.max(10,add(seed.sphere[3],seed.sphere[3])))))));
 return Math.max(0,Math.trunc(add(mul(mul(seed.density,attenuation),densityScale),1)));
}
