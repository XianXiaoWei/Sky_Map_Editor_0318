import * as THREE from 'three';
import type {ResourceMesh,ResourceMeshLOD} from '../core/resources';
import type {ResourceAnimationList} from '../core/resource-animation-list';
import {ResourceModelAnimationPreview,type ResourceModelAnimationOptions,type ResourceAnimationFrameCache} from '../core/resource-model-animation-preview';

/** Each preview instance owns its geometry and request. Shared source geometry
 * and model textures stay reusable by every other bird/ray/crab instance. */
export class ModelAnimationPreviewController {
 private entries=new Map<number,{object:THREE.Mesh;original:THREE.BufferGeometry;shared:unknown;preview:ResourceModelAnimationPreview;paused:boolean}>();
 start(id:number,object:THREE.Mesh,mesh:ResourceMesh,list:ResourceAnimationList,name:string,options:ResourceModelAnimationOptions={}){
  this.attach(id,object,new ResourceModelAnimationPreview(mesh,list,name,options));
 }
 startDefault(id:number,object:THREE.Mesh,mesh:ResourceMesh,list:ResourceAnimationList,options:ResourceModelAnimationOptions={}){
  this.attach(id,object,new ResourceModelAnimationPreview(mesh,list,undefined,options));
 }
 private attach(id:number,object:THREE.Mesh,preview:ResourceModelAnimationPreview){
  const pose=preview.step(0),existing=this.entries.get(id);
  // Action changes keep the owned geometry identity. Native scene signatures
  // depend on that identity; replacing it would re-upload every map draw.
  if(existing&&existing.object===object&&existing.preview.mesh===preview.mesh){this.apply(object.geometry,pose);existing.preview=preview;existing.paused=false;return;}
  this.stop(id);
  const original=object.geometry,shared=object.userData.sharedResource;object.geometry=original.clone();object.geometry.userData={...original.userData};object.userData.sharedResource=false;
  this.entries.set(id,{object,original,shared,preview,paused:false});this.apply(object.geometry,pose);
 }
 private apply(g:THREE.BufferGeometry,pose:ResourceMeshLOD){
  const streams=[['position',pose.positions],['normal',pose.normals],['native_positionColor',pose.packedPositions!],['native_normal',pose.packedNormals!]] as const;
  for(const [name,source] of streams){const attribute=g.getAttribute(name) as THREE.BufferAttribute;if(!attribute||attribute.array.length!==source.length)throw new Error('动态模型顶点流不匹配');}
  let changed=false;
  for(const [name,source] of streams){const attribute=g.getAttribute(name) as THREE.BufferAttribute;for(let i=0;i<source.length;i++)if(attribute.array[i]!==source[i]){changed=true;break;}if(changed)break;}
  if(!changed&&g.userData.nativeSkinPose==='preview')return;
  for(const [name,source] of streams){const attribute=g.getAttribute(name) as THREE.BufferAttribute;attribute.array.set(source);attribute.needsUpdate=true;}
  // clone() duplicates alias attributes. Restore their identity for picking
  // and shader consumers before updating bounds.
  g.setAttribute('a_position',g.getAttribute('position'));g.setAttribute('a_normal',g.getAttribute('normal'));
  g.computeBoundingBox();g.computeBoundingSphere();g.boundsTree?.refit();
  g.userData.nativeSkinPose='preview';g.userData.nativePoseRevision=(g.userData.nativePoseRevision??0)+1;
 }
 step(delta:number){const poses:ResourceAnimationFrameCache=new Map();for(const [id,e] of this.entries){if(e.paused||!e.object.visible)continue;try{this.apply(e.object.geometry,e.preview.step(delta,poses));}catch(error){this.stop(id);throw error;}}}
 togglePause(id:number){const e=this.entries.get(id);if(e)e.paused=!e.paused;}
 stop(id?:number){for(const [key,e] of this.entries){if(id!==undefined&&key!==id)continue;e.object.geometry.dispose();e.object.geometry=e.original;e.object.userData.sharedResource=e.shared;this.entries.delete(key);}}
 get running(){return [...this.entries.values()].some(e=>!e.paused);}
 snapshot(id:number){const e=this.entries.get(id);return e?{...e.preview.snapshot(),paused:e.paused}:null;}
}
