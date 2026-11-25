import type {ObjectNode} from './objects';
import type {MaterialDescriptor,ShaderParameter} from './materials';
import {effectiveLevelMeshMaterial} from './model-draw';
import {creatureField,creatureNumber} from './basic-creature-plan';
import {originalCreatureLength3} from './bird-load-runtime';
import {numericFloatValue} from './object-numeric-runtime';

export function creatureModelTemplate(nodes:ObjectNode[],id:number):ObjectNode|undefined {
 const node=nodes[id];if(!node)return;
 const params=nodes[creatureNumber(node,node.className==='BirdV2'?'boidParams':'params',-1)];
 const mesh=nodes[creatureNumber(params,'meshType',-1)];
 return mesh?.className==='LevelMesh'?mesh:undefined;
}
/** BirdV2.Load 0x1001a199d and Crab.Load 0x10025b775 call the template's
 * GetTransform (+0x18), not GetObb (+0x20). Only its XYZ basis lengths are
 * copied. Template translation and rotation do not move the cloned animal. */
export function creatureTemplateScale(nodes:ObjectNode[],id:number):[number,number,number] {
 const template=creatureModelTemplate(nodes,id),matrix=creatureField(template,'transform')?.value;
 if(!Array.isArray(matrix)||matrix.length!==16)return [1,1,1];
 const bytes=new Uint8Array(Float32Array.from(matrix).buffer);
 return [0,1,2].map(i=>numericFloatValue(originalCreatureLength3(bytes.subarray(i*16,i*16+16)))) as [number,number,number];
}
export function originalCreatureMaterial(nodes:ObjectNode[],level:string,id:number):MaterialDescriptor {
 const node=nodes[id];if(!node)throw new Error('生物材质的对象身份不存在');
 if(node.className==='SpawnMotes')return {nodeId:id,name:'MoteAnim',materialId:0,custom:true,shaderName:'MoteAnim',parameters:[]};
 if(node.className==='BirdFlock')return {nodeId:id,name:'BirdFlock',materialId:0,custom:true,shaderName:'BirdFlock',parameters:[]};
 if(node.className==='DarkCreature'){
  const parameter=(name:string,nativeType:number,vector:number[],texture=''):ShaderParameter=>({name,nativeType,vector,texture,fieldId:`creature:${id}:${name}`});
  // Exact ordinary DarkCreature.Load 0x10026c670, texture/float bindings.
  return {nodeId:id,name:'CharDarkCreatureAnim',materialId:16,custom:true,shaderName:'Mesh',parameters:[
   parameter('u_diffuse1Tex',2,[],'AvatarMaskBasicTex'),parameter('u_diffuse2Tex',2,[],'AttribSimpleGlow'),
   parameter('u_lightTex',2,[],'AttribSimpleGlow'),parameter('u_normTex',2,[],'UpNormal'),
   parameter('u_diffuse1TexScale',0,[1]),parameter('u_normTexScale',0,[0])
  ]};
 }
 const template=creatureModelTemplate(nodes,id);
 if(!template)throw new Error(`生物 #${id} 缺少原模型模板`);
 return effectiveLevelMeshMaterial(template,level);
}
