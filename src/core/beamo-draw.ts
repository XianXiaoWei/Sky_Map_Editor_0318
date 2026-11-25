import type {ObjectNode} from './objects';
import type {ResourceMesh} from './resources';
import type {LoadedLevelDataModelBake} from './level-data-bake-adapter';
import {serializedLevelMaterialIndex,objectScalar} from './model-material-index';
import {selectEditorBeamoBake} from './beamo-bake-adapter';
import {prepareBeamoGeometryInput,evaluatePreparedBeamoGeometry,type BeamoGeometryInput,type BeamoGeometryResource} from './beamo-geometry-adapter';
export type BeamoDrawPass='primary'|'secondary'|'alpha';
export function beamoDrawMaterial(nodes:readonly ObjectNode[],level:string,nodeId:number,pass:BeamoDrawPass,index=serializedLevelMaterialIndex(nodes,level)){
 const node=nodes[nodeId];if(!node||!['Beamo','BeamoDecal'].includes(node.className))throw new Error('Beamo draw owner unavailable');
 const link=index.modelLinks(node).find(l=>l.role===(pass==='primary'?'primary':'secondary')&&l.requested);
 if(!link||link.slot===null)throw new Error('Original requested Beamo material unavailable');
 const material=index.materials[link.slot];if(!material.effective)throw new Error(material.error??'Original Beamo material defaults unavailable');
 return {materialNodeId:material.nodeId,material:{...material.effective,shaderName:material.effective.shaderName+(pass==='alpha'?'Alpha':'')}};
}
/** Binary search over separately observed original RSQRTSS capability pairs.
 * Unknown inputs remain explicit dependencies, including edited transforms. */
export function originalBeamoRsqrtCapability(bytes:Uint8Array){
 const d=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);if(bytes.length<8||d.getUint32(0,true)!==0x52535154||bytes.length!==8+d.getUint32(4,true)*8)throw new Error('Invalid original RSQRTSS capability');
 return (input:number)=>{let lo=0,hi=d.getUint32(4,true);while(lo<hi){const mid=(lo+hi)>>>1,n=d.getUint32(8+mid*8,true);if(n<(input>>>0))lo=mid+1;else hi=mid;}if(lo===d.getUint32(4,true)||d.getUint32(8+lo*8,true)!==(input>>>0))throw new Error(`Unobserved native RSQRTSS input 0x${(input>>>0).toString(16)}`);return d.getUint32(12+lo*8,true);};
}
const encode=(b:Uint8Array)=>{let s='';for(let i=0;i<b.length;i+=16384)s+=String.fromCharCode(...b.subarray(i,i+16384));return btoa(s);};
export interface BeamoDrawGeometry {nodeId:number;className:string;lod:number;acceptedBake:boolean;matrix:number[];vertices:Uint8Array;passes:{pass:BeamoDrawPass;materialNodeId:number;shader:string;indices:Uint32Array}[];counts:{vertices:number;primaryIndices:number;secondaryIndices:number;alphaIndices:number};}
/** LOD0/static editor projection through the recovered original world upload.
 * Original fallback lighting and RSQRT capability are required explicit inputs.
 * No renderable/Model/GPU object or native Barn lifecycle is synthesized. */
export function buildBeamoDrawGeometry(nodes:readonly ObjectNode[],level:string,nodeId:number,mesh:ResourceMesh,record:LoadedLevelDataModelBake|null,fallback:Uint8Array,rsqrt:(bits:number)=>number,lodIndex=0,materials=serializedLevelMaterialIndex(nodes,level)):BeamoDrawGeometry {
 const node=nodes[nodeId];if(!node||!['Beamo','BeamoDecal'].includes(node.className))throw new Error('Beamo owner unavailable');
 const selection=selectEditorBeamoBake(node,mesh,record),lod=mesh.levels[lodIndex];if(!lod?.packedPositions||!lod.packedUvs||!lod.bakeRemap)throw new Error('Original Beamo geometry streams unavailable');
 const matrix=node.fields.find(f=>f.name==='transform');if(!matrix?.raw||matrix.raw.length!==128)throw new Error('Original Beamo transform unavailable');
 const raw=Uint8Array.from(matrix.raw.match(/../g)!,s=>parseInt(s,16)),dv=new DataView(raw.buffer);
 const links=materials.modelLinks(node),secondary=links.some(l=>l.role==='secondary'&&l.requested);
 beamoDrawMaterial(nodes,level,nodeId,'primary',materials);if(secondary)beamoDrawMaterial(nodes,level,nodeId,'secondary',materials);
 const loaded=selection.accepted?record!.lods[lodIndex]:null;
 const resource:BeamoGeometryResource={positions:encode(lod.packedPositions),uvs:encode(lod.packedUvs),indices:encode(new Uint8Array(lod.indices.buffer,lod.indices.byteOffset,lod.indices.byteLength)),remap:encode(new Uint8Array(lod.bakeRemap.buffer,lod.bakeRemap.byteOffset,lod.bakeRemap.byteLength)),groups:lod.bakeVertexCount,lod:lodIndex};
 const input:BeamoGeometryInput={label:`${level}/#${nodeId}`,resourceKey:mesh.name+'/'+lodIndex,matrix:encode(raw),secondary,autoMoss:node.className==='Beamo'?objectScalar(node,'autoMoss'):0,bake:selection.accepted,lighting:loaded?.lighting?encode(loaded.lighting.packed):undefined,culled:loaded?.extra===null||loaded?.extra===undefined?null:encode(loaded.extra)};
 const result=evaluatePreparedBeamoGeometry(prepareBeamoGeometryInput(input,resource),fallback,rsqrt,false);if(result.line)throw new Error(`Original Beamo upload assertion line ${result.line}`);
 const ranges=[['primary',0,result.counts.primaryIndices],['secondary',lod.indices.length,result.counts.secondaryIndices],['alpha',lod.indices.length*2,result.counts.alphaIndices]] as const;
 const passData=ranges.filter(([, ,count])=>count>0).map(([pass,start,count])=>{const material=beamoDrawMaterial(nodes,level,nodeId,pass,materials),b=result.indices.subarray(start*4,(start+count)*4),d=new DataView(b.buffer,b.byteOffset,b.byteLength);return{pass,materialNodeId:material.materialNodeId,shader:material.material.shaderName,indices:Uint32Array.from({length:count},(_,i)=>d.getUint32(i*4,true))};});
 return{nodeId,className:node.className,lod:lodIndex,acceptedBake:selection.accepted,matrix:Array.from({length:16},(_,i)=>dv.getFloat32(i*4,true)),vertices:result.vertices.subarray(0,result.counts.vertices*48),passes:passData,counts:result.counts};
}
