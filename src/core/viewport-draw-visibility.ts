import * as THREE from 'three';
import type {VulkanBakedDraw,VulkanModelDraw} from './vulkan-protocol';
type Draw=VulkanBakedDraw|VulkanModelDraw;
const bounds=new WeakMap<Draw,{vertices:Uint8Array;indices:Uint32Array;box:THREE.Box3}>();
const worldBounds=new WeakMap<Draw,{local:THREE.Box3;matrix:number[];box:THREE.Box3}>();
/** Conservative draw bounds for graphics adapters; these do not stand in for
 * an original Barn's object bounds or resource/Visibility ownership. */
export function viewportDrawBounds(draw:Draw):THREE.Box3|undefined {
 if('model' in draw&&(draw.model[3]!==0||draw.model[7]!==0||draw.model[11]!==0||draw.model[15]!==1))return;
 let cached=bounds.get(draw);
 if(!cached||cached.vertices!==draw.vertices||cached.indices!==draw.indices){const box=new THREE.Box3(),data=new DataView(draw.vertices.buffer,draw.vertices.byteOffset,draw.vertices.byteLength),p=new THREE.Vector3();for(const index of draw.indices){const at=index*draw.stride;p.set(data.getFloat32(at,true),data.getFloat32(at+4,true),data.getFloat32(at+8,true));box.expandByPoint(p);}cached={vertices:draw.vertices,indices:draw.indices,box};bounds.set(draw,cached);}
 const box=cached.box;
 if(!('model' in draw))return box;
 const prior=worldBounds.get(draw);if(prior&&prior.local===box&&draw.model.every((v,i)=>Object.is(v,prior.matrix[i])))return prior.box;
 const result=box.clone().applyMatrix4(new THREE.Matrix4().fromArray(draw.model));worldBounds.set(draw,{local:box,matrix:draw.model.slice(),box:result});return result;
}
/** Graphics-only culling for the basic shader, whose vertex stage has no
 * deformation. Scene objects, interaction and simulation remain present. */
export function basicViewportVisibility(draws:Draw[],matrix:number[]):boolean[]{
 const frustum=new THREE.Frustum().setFromProjectionMatrix(new THREE.Matrix4().fromArray(matrix));
 return draws.map(draw=>{
  const world=viewportDrawBounds(draw);if(!world)return true;
  return !world.isEmpty()&&frustum.intersectsBox(world);
 });
}
