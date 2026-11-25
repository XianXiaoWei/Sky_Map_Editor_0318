import * as THREE from 'three';
import type {VulkanModelDraw} from '../core/vulkan-protocol';
import {viewportDrawBounds} from '../core/viewport-draw-visibility';
import {queryVisibilityAabbs} from '../core/visibility-aabbs';
import {visibilityDaz,qemuVisibilityMax} from '../core/visibility-float';

/** Use the recovered original Visibility::QueryAABBs frustum-only path,
 * 0x100721ce0, on the editor's symmetric perspective camera. Draw-derived
 * world bounds and camera snapshots remain explicit graphics adapters.
 * Original software depth/occluder ownership is still pending. */
export function originalViewportVisibility(draws:VulkanModelDraw[],matrix:number[],cameraWorld:number[]):boolean[]{
 if(!draws.length)return [];
 const view=new THREE.Matrix4().fromArray(cameraWorld).invert(),projection=new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(cameraWorld));
 const p=projection.elements;
 // Off-axis/orthographic cameras require their original projection consumer.
 if(!p.every(Number.isFinite)||p[0]<=0||p[5]<=0||Math.abs(p[11]+1)>1e-5||Math.abs(p[15])>1e-5||[1,2,3,4,6,7,8,9,12,13].some(i=>Math.abs(p[i])>1e-5))return draws.map(()=>true);
 const indices:number[]=[],minima:number[]=[],maxima:number[]=[];
 for(let i=0;i<draws.length;i++){
  const box=viewportDrawBounds(draws[i]);if(!box||box.isEmpty()||![...box.min.toArray(),...box.max.toArray()].every(Number.isFinite))continue;
  // Outward margin covers the double-to-float camera/bounds adapter rounding.
  const margin=Math.max(1,...box.min.toArray().map(Math.abs),...box.max.toArray().map(Math.abs))*2**-20;
  indices.push(i);minima.push(box.min.x-margin,box.min.y-margin,box.min.z-margin,0);maxima.push(box.max.x+margin,box.max.y+margin,box.max.z+margin,0);
 }
 const statuses=new Uint32Array(indices.length),minimum=(a:number,b:number)=>visibilityDaz(a)<visibilityDaz(b)?a:b;
 queryVisibilityAabbs({camera:{view:Float32Array.from(view.elements),projection:Float32Array.from(p)},disabled:false,frustumOnly:true,distanceLimit:0,mips:[],depth:new Float32Array()},Float32Array.from(minima),Float32Array.from(maxima),indices.length,statuses,{kind:'unused-frustum-only',rcp:()=>{throw new Error('Frustum-only queries must not access occlusion reciprocals');}},minimum,qemuVisibilityMax);
 const result=draws.map(()=>true);indices.forEach((draw,i)=>{result[draw]=statuses[i]!==0;});return result;
}
