import type {ObjectNode} from '../core/objects';
import type {ShaderProgram} from '../core/materials';
import {effectiveLevelMeshMaterial,modelDrawBoundary,materialDrawBoundary} from '../core/model-draw';
import {beamoDrawMaterial} from '../core/beamo-draw';
import {serializedLevelMaterialIndex} from '../core/model-material-index';
import {originalCreatureMaterial} from '../core/creature-model-binding';
import {MOTE_ATTRIBUTES} from '../core/mote-stream';
import {BIRD_FLOCK_ATTRIBUTES} from '../core/bird-flock-stream';

/** Shader names accepted by the current static model/material viewport.
 * Baked=true includes shaders that require vertex lighting; resource/bake
 * availability remains a separate runtime boundary. No Model is created. */
export function viewportModelShaders(nodes:readonly ObjectNode[],level:string,program:(name:string)=>ShaderProgram){
 const names=new Set<string>(),materials=serializedLevelMaterialIndex(nodes,level);
 for(const node of nodes){
  if(['SpawnMotes','BirdFlock','DarkCreature','BirdV2','Crab','Buddy'].includes(node.className)){
   let material;try{material=originalCreatureMaterial(nodes as ObjectNode[],level,node.id);}catch{continue;}
   const shader=program(material.shaderName);if(!materialDrawBoundary(material,shader,true,false,'model',node.className==='SpawnMotes'?MOTE_ATTRIBUTES:node.className==='BirdFlock'?BIRD_FLOCK_ATTRIBUTES:undefined))names.add(material.shaderName);continue;
  }
  if(node.className==='LevelMesh'){
   let material;try{material=effectiveLevelMeshMaterial(node,level);}catch{continue;}
   if(!material.shaderName)continue;
   const shader=program(material.shaderName);
   if(!modelDrawBoundary(node,level,shader,true,false))names.add(material.shaderName);
  }else if(['Beamo','BeamoDecal'].includes(node.className))for(const pass of ['primary','secondary','alpha'] as const){
   let material;try{material=beamoDrawMaterial(nodes,level,node.id,pass,materials).material;}catch{continue;}
   if(!material.shaderName)continue;
   const shader=program(material.shaderName);
   if(!materialDrawBoundary(material,shader,true,false,'material'))names.add(material.shaderName);
  }
 }
 return [...names].sort();
}
