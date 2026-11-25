import {cloudCardFacingPlan,CLOUD_CARD_DIRECTION_EPSILON} from './cloud-card-facing';
import {cloudCardInverse} from './cloud-card-inverse';
import type {ResourceMeshLOD} from './resources';
import type {CloudCardIndexRange} from './cloud-card-indices';

const f=Math.fround,mul=(a:number,b:number)=>f(a*b),add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b);
export interface CloudCardDynamicSource {world:number[];mesh:ResourceMeshLOD;opacity:number;lighting?:Uint8Array;}
export interface CloudCardMath {acos:(value:number)=>number;sincos:(angle:number)=>[number,number];pow:(base:number,exponent:number)=>number;}
export const cloudCardJsMath:CloudCardMath={acos:v=>f(Math.acos(v)),sincos:a=>[f(Math.sin(a)),f(Math.cos(a))],pow:(v,e)=>f(v**e)};

// Original 0x100220cc0..0x100220e34. Axis = cross(local +Y, local eye),
// angle = acos(local eye Y)*.25. No full-facing billboard or guessed rotation.
export function cloudCardRotation(direction:number[],math:CloudCardMath=cloudCardJsMath){
 const d=direction.map(f),axis=[sub(mul(d[2],1),mul(d[1],0)),sub(mul(d[0],0),mul(d[2],0)),sub(mul(d[1],0),mul(d[0],1))],squares=axis.map(v=>mul(v,v));
 const length=f(Math.sqrt(add(squares[1],add(squares[2],squares[0]))));
 if(length>CLOUD_CARD_DIRECTION_EPSILON)for(let i=0;i<3;i++)axis[i]=f(axis[i]/length);
 const angle=mul(f(math.acos(d[1])),.25),[sin,cos]=math.sincos(angle).map(f),[x,y,z]=axis,k=sub(1,cos);
 const xy=mul(mul(x,y),k),yz=mul(mul(y,z),k),zx=mul(mul(z,x),k),xs=mul(x,sin),ys=mul(y,sin),zs=mul(z,sin);
 const result=[add(cos,mul(mul(x,x),k)),add(zs,xy),sub(zx,ys),0,
  sub(xy,zs),add(cos,mul(mul(y,y),k)),add(xs,yz),0,
  add(ys,zx),sub(yz,xs),add(cos,mul(mul(z,z),k)),0,0,0,0,1];
 if(!result.every(Number.isFinite))throw new Error('CloudCard 原旋转产生非有限矩阵');
 return result;
}
// Original Vectormath 0x100076df0, full four-column product, no FMA.
export function cloudCardMultiply(left:number[],right:number[]){
 return Array.from({length:16},(_,i)=>{const row=i%4,col=i-row;return add(add(add(mul(left[row],right[col]),mul(left[4+row],right[col+1])),mul(left[8+row],right[col+2])),mul(left[12+row],right[col+3]));});
}
// Original byte normal decoder uses -128 and +127 separately. SNORM's usual
// max(-1,n/127) conversion is not the CPU transform/pack path used here.
export function cloudCardPackedNormal(bytes:Int8Array,inverse:number[]){
 const decoded=Array.from(bytes.slice(0,3),n=>mul(n,n<0?1/128:f(1/127)));
 let normal=[0,4,8].map(at=>add(mul(decoded[2],inverse[at+2]),add(mul(decoded[1],inverse[at+1]),mul(decoded[0],inverse[at]))));
 const squares=normal.map(v=>mul(v,v)),length=f(Math.sqrt(add(squares[2],add(squares[0],squares[1]))));
 if(length>CLOUD_CARD_DIRECTION_EPSILON)normal=normal.map(v=>f(v/length));
 return Int8Array.from(normal,v=>Math.trunc(Math.min(127,Math.max(-128,mul(v,v<0?128:127)))));
}
export function cloudCardPackedAlpha(opacity:number,localY:number,math:CloudCardMath=cloudCardJsMath){
 const power=f(math.pow(mul(Math.min(1,Math.max(0,f(opacity))),f(localY)),.25)),a=sub(add(power,power),1);
 if(!Number.isFinite(a))throw new Error('CloudCard 原 alpha 产生非有限结果');
 return Math.trunc(mul(Math.min(1,Math.abs(a)),a>0?127:-128))&255;
}
// Caller supplies proven original index ranges, visible order and exact baked
// bytes/default bytes. This function does not invent registration or lighting.
export function cloudCardDynamicVertices(sources:CloudCardDynamicSource[],ranges:CloudCardIndexRange[],visibleOrder:number[],eye:number[],fallbackLighting:Uint8Array,math:CloudCardMath=cloudCardJsMath){
 if(fallbackLighting.length!==8||ranges.length!==sources.length||new Set(ranges.map(r=>r.sourceIndex)).size!==sources.length)throw new Error('CloudCard 动态范围/默认照明无效');
 const bySource=new Map<number,CloudCardIndexRange>();let count=0,end=0;
 for(const range of [...ranges].sort((a,b)=>a.vertexOffset-b.vertexOffset)){
  if(![range.sourceIndex,range.vertexOffset,range.vertexCount].every(Number.isSafeInteger)||range.sourceIndex<0||range.sourceIndex>=sources.length||range.vertexOffset<end||range.vertexCount<0)throw new Error('CloudCard 动态顶点范围无效或重叠');
  end=range.vertexOffset+range.vertexCount;if(!Number.isSafeInteger(end)||end>20000000)throw new Error('CloudCard 动态顶点容量超限');
  count=Math.max(count,end);bySource.set(range.sourceIndex,range);
 }
 for(const [i,source] of sources.entries()){
  const mesh=source.mesh,range=bySource.get(i)!;
  if(!Number.isFinite(source.opacity)||range.vertexCount!==mesh.positions.length/3||!mesh.positions.every(Number.isFinite)||mesh.packedNormals?.length!==range.vertexCount*4||mesh.packedUvs?.length!==range.vertexCount*16||source.lighting&&source.lighting.length!==range.vertexCount*12)throw new Error('CloudCard 缺少原 packed 顶点/烘焙流或输入无效');
 }
 const inverses=sources.map(s=>cloudCardInverse(s.world)),facing=cloudCardFacingPlan(inverses,visibleOrder,eye);
 const vertices=new Uint8Array(count*28),view=new DataView(vertices.buffer),positions=new Float32Array(count*4),rotations:number[][]=[];
 for(const {sourceIndex,direction} of facing){
  const source=sources[sourceIndex],mesh=source.mesh,range=bySource.get(sourceIndex)!;
  const rotation=cloudCardRotation(direction,math),matrix=cloudCardMultiply(source.world.map(f),rotation);rotations.push(rotation);
  const alpha=cloudCardPackedAlpha(source.opacity,direction[1],math);
  for(let v=0;v<range.vertexCount;v++){
   const at=range.vertexOffset+v,p=Array.from(mesh.positions.subarray(v*3,v*3+3));
   const transformed=[0,1,2,3].map(row=>add(add(add(mul(p[0],matrix[row]),mul(p[1],matrix[4+row])),mul(p[2],matrix[8+row])),matrix[12+row]));
   positions.set(transformed,at*4);for(let c=0;c<3;c++)view.setFloat32(at*28+c*4,transformed[c],true);
   vertices.set(mesh.packedUvs!.subarray(v*16,v*16+4),at*28+12);
   vertices.set(new Uint8Array(cloudCardPackedNormal(mesh.packedNormals!.subarray(v*4,v*4+4),inverses[sourceIndex]).buffer),at*28+16);vertices[at*28+19]=alpha;
   vertices.set(source.lighting?source.lighting.subarray(v*12,v*12+8):fallbackLighting,at*28+20);
  }
 }
 return {vertices,positions,rotations,facing,scope:'Original CloudCard camera direction, quarter-angle rotation, positions and 28-byte UV/normal/alpha/light stream; explicit visible order, bake/default input; JS trig is a separate libm precision boundary'};
}
