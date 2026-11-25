const f=Math.fround,epsilon=f(1e-5);
/** Original Model.SetLodDist 0x100466440. The last zero threshold is
 * extended, rather than interpreted as permission to hide a model nearby. */
export function setOriginalModelLodDistance(distances:Float32Array,index:number,distance:number){
 if(!Number.isInteger(index)||index<0)throw new Error('原模型 LOD 索引无效');
 if(index>=distances.length)return;
 let next=f(distance);const previous=index?distances[index-1]:0;
 if(Math.abs(next)<=epsilon&&index===distances.length-1)next=index?f(previous*3):1e9;
 if(!(next>=previous))throw new Error('原模型 LOD 距离必须按顺序递增');
 distances[index]=next;
}
/** Numeric selection region 0x10046455f..727. The returned sentinel is a
 * native no-mesh level; an editor may retain its last mesh for selection. */
export function selectOriginalModelDistanceLod(distances:Float32Array,distance:number,enabled=true){
 if(!distances.length)throw new Error('原模型缺少 LOD 距离');
 const d=f(distance),last=distances.length-1;let index=0;
 if(enabled)while(index<distances.length&&d>distances[Math.min(index,last)])index++;
 const low=distances[Math.max(0,Math.min(index-1,last))],high=distances[Math.min(index,last)];
 const span=index?f(high-low):high;
 const ratio=span>epsilon||span<-epsilon?f((index?f(d-low):d)/span):1;
 // VMAXSS/VMINSS choose their second operand for unordered comparisons.
 const positive=ratio<0?0:ratio;
 const clamped=positive>1?1:positive;
 return {index,continuous:index?f(clamped+index):clamped};
}
/** Complete point/OBB body 0x10078cae0. Axes contain half extents,
 * followed by the center. Each SIMD operation rounds to float32. */
export function originalModelClosestObbPoint(point:readonly number[],obb:readonly number[]){
 if(point.length<3||obb.length!==16)throw new Error('原模型 OBB 数据无效');
 const relative=[0,1,2].map(i=>f(f(point[i])-f(obb[12+i]))),out=[f(obb[12]),f(obb[13]),f(obb[14])];let inside=true;
 for(let axis=0;axis<3;axis++){
  const v=[0,1,2].map(i=>f(obb[axis*4+i]));
  const length=f(Math.sqrt(f(f(f(v[0]*v[0])+f(v[1]*v[1]))+f(v[2]*v[2]))));
  if(length>epsilon)for(let i=0;i<3;i++)v[i]=f(v[i]/length);
  let projection=f(f(f(v[0]*relative[0])+f(v[1]*relative[1]))+f(v[2]*relative[2]));
  if(Math.abs(projection)>length){inside=false;projection=f(length*(projection<0?-1:1));}
  for(let i=0;i<3;i++)out[i]=f(out[i]+f(v[i]*projection));
 }
 return {point:out,inside};
}
export function originalModelLodDistance(point:readonly number[],obb:readonly number[],fovRadians?:number){
 const nearest=originalModelClosestObbPoint(point,obb);if(nearest.inside)return 0;
 const delta=nearest.point.map((p,i)=>f(f(point[i])-p));
 const distance=f(Math.sqrt(f(f(f(delta[0]*delta[0])+f(delta[1]*delta[1]))+f(delta[2]*delta[2]))));
 const multiplier=fovRadians===undefined?1:Math.min(1,f(f(f(f(fovRadians)*180)/f(Math.PI))/f(33.7)));
 return f(distance*multiplier);
}
