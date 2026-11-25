import type {ObjectNode} from '../core/objects';
import type {ResourceMesh} from '../core/resources';
import type {VulkanModelDraw} from '../core/vulkan-protocol';
import type {BeamoDrawGeometry} from '../core/beamo-draw';
import type {BoundBake} from '../core/baking';
import {objectText,objectScalar} from '../core/model-material-index';
import {setOriginalModelLodDistance,selectOriginalModelDistanceLod,originalModelLodDistance} from '../core/model-distance-lod';
import {selectOriginalBeamoDistanceLod} from '../core/beamo-distance-lod';
import {distanceOriginalBeamoObb} from '../core/beamo-geometry-runtime';
import {transformNativeObb} from '../core/marker-transform-runtime';
import {defaultModelLighting} from '../core/model-default-lighting';
import {ByteCache} from '../core/byte-cache';

type Geometry={vertices:Uint8Array;indices:Uint32Array};
export interface ViewportLodServices {
 mesh(name:string):ResourceMesh;
 bake(node:ObjectNode,lod:number):{bound:BoundBake}|null;
 beamo(nodeId:number,lod:number):BeamoDrawGeometry;
 beamoPlan(node:ObjectNode,mesh:ResourceMesh):{count:number;distances:number[];enables:number[]};
}
type Part={node:ObjectNode;mesh:ResourceMesh;high:Geometry;local:Uint8Array;savedTransform?:Uint8Array;distances:Float32Array;enables?:number[];count:number;index:number;failed:boolean};
type Group={draw:VulkanModelDraw;high:Geometry;parts:Part[];key:string};
const floats=(values:readonly number[])=>new Uint8Array(Float32Array.from(values).buffer);
const numbers=(bytes:Uint8Array)=>Array.from(new Float32Array(bytes.buffer,bytes.byteOffset,16));
/** Editor transport for the original numeric LOD decisions. High-detail
 * Three geometry stays available for picking and physics. GPU draw identities,
 * material bindings and merge membership remain stable across switches. */
export class ViewportModelLod {
 private groups:Group[]=[];private cache=new ByteCache<string,Geometry>(48*1024*1024);
 private boundaries:{nodeId:number;reason:string}[]=[];private switches=0;
 constructor(private nodes:readonly ObjectNode[],private services:ViewportLodServices){}
 setDraws(draws:VulkanModelDraw[]){
  this.groups=[];this.cache.clear();this.boundaries=[];this.switches=0;
  for(const draw of draws){
   if(draw.stride!==48||draw.creatureNodeId!==undefined)continue;
   const ranges=draw.beamoRanges??[{nodeId:draw.nodeId,vertexStart:0,vertexCount:draw.vertices.length/48,indexStart:0,indexCount:draw.indices.length}];
   const parts:Part[]=[];let eligible=false;
   for(const range of ranges){
    const node=this.nodes[range.nodeId];if(!node||!['LevelMesh','Beamo','BeamoDecal'].includes(node.className))continue;
    try{
     const mesh=this.services.mesh(objectText(node,node.className==='LevelMesh'?'resourceName':'meshName')||'UnitCube'),bounds=mesh.levels[0].bounds;
     if(!bounds||bounds.length!==6)throw new Error('原模型缺少包围盒');
     // Original MeshInstance: half(min)+half(max), (max-min)/2.
     const local=Array(16).fill(0);for(let i=0;i<3;i++){local[i*5]=Math.fround(Math.fround(bounds[i+3]-bounds[i])/2);local[12+i]=Math.fround(Math.fround(bounds[i]*.5)+Math.fround(bounds[i+3]*.5));}local[15]=1;
     const distances=new Float32Array(mesh.lods);mesh.levels.forEach((l,i)=>setOriginalModelLodDistance(distances,i,l.lodDistance!));
     let count=mesh.lods,enables:number[]|undefined,savedTransform:Uint8Array|undefined;
     if(draw.beamoPass){const plan=this.services.beamoPlan(node,mesh);count=plan.count;enables=plan.enables;distances.set(plan.distances.slice(0,distances.length));const raw=node.fields.find(f=>f.name==='transform')?.raw;if(!raw||raw.length!==128)throw new Error('原 Beamo 缺少变换');savedTransform=Uint8Array.from(Buffer.from(raw,'hex'));}
     else {const raw=node.fields.find(f=>f.name==='lodDists')?.raw;if(raw){const v=Buffer.from(raw,'hex');for(let i=0;i<Math.min(2,mesh.lods);i++){const distance=v.readFloatLE(i*4);if(distance!==-1)setOriginalModelLodDistance(distances,i,distance);}}}
     const failed=mesh.animated||count<2;eligible=eligible||!failed;
     const high=ranges.length===1?{vertices:draw.vertices,indices:draw.indices}:{vertices:draw.vertices.subarray(range.vertexStart*48,(range.vertexStart+range.vertexCount)*48),indices:Uint32Array.from(draw.indices.subarray(range.indexStart,range.indexStart+range.indexCount),i=>i-range.vertexStart)};
     parts.push({node,mesh,high,local:floats(local),savedTransform,distances,enables,count,index:0,failed});
     if(mesh.animated&&count>1)this.boundaries.push({nodeId:node.id,reason:'Animated LOD remains at LOD0 until pose transport supports the selected mesh level'});
    }catch(error){this.boundaries.push({nodeId:node.id,reason:String((error as Error).message)});}
   }
   // An incomplete merged provenance must retain its existing full geometry.
   if(eligible&&parts.length===ranges.length)this.groups.push({draw,high:{vertices:draw.vertices,indices:draw.indices},parts,key:parts.map(()=>0).join(',')});
  }
 }
 private geometry(group:Group,part:Part,index:number):Geometry {
  if(!index)return part.high;
  const key=part.node.id+':'+index+':'+(group.draw.beamoPass??'model'),cached=this.cache.get(key);if(cached)return cached;
  let result:Geometry;
  if(group.draw.beamoPass){const prepared=this.services.beamo(part.node.id,index);if(prepared.acceptedBake!==group.draw.baked)throw new Error('低 LOD 烘焙绑定与已提交材质不匹配');result={vertices:prepared.vertices,indices:prepared.passes.find(p=>p.pass===group.draw.beamoPass)?.indices??new Uint32Array()};}
  else {
   const lod=part.mesh.levels[index],count=lod.positions.length/3,bake=group.draw.baked?this.services.bake(part.node,index)?.bound:null;
   if(group.draw.baked&&!bake)throw new Error('低 LOD 缺少与原模型匹配的烘焙');
   const light=bake?.packed??defaultModelLighting(count),vertices=new Uint8Array(count*48);
   if(!lod.packedPositions||!lod.packedNormals||!lod.packedUvs||light.length!==count*12)throw new Error('原 LOD 顶点属性不完整');
   const normals=new Uint8Array(lod.packedNormals.buffer,lod.packedNormals.byteOffset,lod.packedNormals.byteLength);
   for(let i=0;i<count;i++){vertices.set(lod.packedPositions.subarray(i*16,i*16+16),i*48);vertices.set(normals.subarray(i*4,i*4+4),i*48+16);vertices.set(lod.packedUvs.subarray(i*16,i*16+16),i*48+20);vertices.set(light.subarray(i*12,i*12+12),i*48+36);}
   result={vertices,indices:lod.indices};
  }
  this.cache.set(key,result,result.vertices.byteLength+result.indices.byteLength);return result;
 }
 update(cameraMatrix:readonly number[],fovRadians?:number,enabled=true){
  const updates:{draw:VulkanModelDraw;vertices:Uint8Array;indices:Uint32Array}[]=[],eye=cameraMatrix.slice(12,15),point=floats([...eye,1]);
  for(const group of this.groups){
   const levels=group.parts.map(part=>{
    if(part.failed||!enabled)return 0;
    const world=transformNativeObb(floats(group.draw.model),part.savedTransform?transformNativeObb(part.savedTransform,part.local):part.local);
    const distance=group.draw.beamoPass?distanceOriginalBeamoObb(point,world):originalModelLodDistance(eye,numbers(world),fovRadians);
    const multiplier=fovRadians===undefined?1:Math.min(1,Math.fround(Math.fround(Math.fround(Math.fround(fovRadians)*180)/Math.fround(Math.PI))/Math.fround(33.7)));
    return group.draw.beamoPass?selectOriginalBeamoDistanceLod(part.count,Array.from(part.distances),part.enables!,Math.fround(distance*multiplier)):Math.min(part.mesh.lods-1,selectOriginalModelDistanceLod(part.distances,distance).index);
   });
   let key=levels.join(',');if(key===group.key)continue;
   const geometry=group.parts.map((part,i)=>{try{return this.geometry(group,part,levels[i]);}catch(error){part.failed=true;levels[i]=0;this.boundaries.push({nodeId:part.node.id,reason:String((error as Error).message)});return part.high;}});
   key=levels.join(',');if(key===group.key)continue;
   let merged:Geometry;
   if(levels.every(i=>!i))merged=group.high;
   else if(geometry.length===1)merged=geometry[0];
   else {const vertices=new Uint8Array(geometry.reduce((n,g)=>n+g.vertices.length,0)),indices=new Uint32Array(geometry.reduce((n,g)=>n+g.indices.length,0));let v=0,ix=0;for(const g of geometry){vertices.set(g.vertices,v*48);for(const id of g.indices)indices[ix++]=v+id;v+=g.vertices.length/48;}merged={vertices,indices};}
   updates.push({draw:group.draw,...merged});group.key=key;group.parts.forEach((p,i)=>{if(p.index!==levels[i])this.switches++;p.index=levels[i];});
  }
  return updates;
 }
 info(){return {enabled:true,eligibleOwners:new Set(this.groups.flatMap(g=>g.parts.filter(p=>!p.failed).map(p=>p.node.id))).size,lowOwners:new Set(this.groups.flatMap(g=>g.parts.filter(p=>p.index>0).map(p=>p.node.id))).size,switches:this.switches,cacheBytes:this.cache.bytes,highTriangles:this.groups.reduce((n,g)=>n+g.high.indices.length/3,0),currentTriangles:this.groups.reduce((n,g)=>n+g.draw.indices.length/3,0),boundaries:this.boundaries};}
}
