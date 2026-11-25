import {modelRenderStateCode} from '../core/model-render-state';
import * as THREE from 'three';
import type {ResourceMesh,ResourceMeshLOD} from '../core/resources';
import {defaultResourceModelPose} from '../core/resource-model-pose';
import type {VulkanModelDraw} from '../core/vulkan-protocol';
import {MODEL_VERTEX_STRIDE} from '../core/model-draw';
import type {BoundBake} from '../core/baking';
import {MOTE_VERTEX_STRIDE} from '../core/mote-stream';
import {BIRD_FLOCK_VERTEX_STRIDE} from '../core/bird-flock-stream';

export function applyResourceModelTransform(object:THREE.Object3D,matrix:number[]){
  if(matrix.length!==16)throw new Error('原模型矩阵需要 16 个分量');
  object.matrix.fromArray(matrix);object.matrix.decompose(object.position,object.quaternion,object.scale);
  object.matrixAutoUpdate=false;object.updateMatrixWorld(true);
}

export function resourceModelGeometry(r:ResourceMeshLOD){
  const g=new THREE.BufferGeometry();
  g.userData.nativeAnimated='animated' in r&&r.animated===true;
  if(g.userData.nativeAnimated){
    try{r=defaultResourceModelPose(r as ResourceMesh);g.userData.nativeAnimated=false;g.userData.nativeSkinPose='default';}
    catch(error){g.userData.nativeSkinBoundary=String((error as Error).message);}
  }
  const count=r.positions.length/3;
  if(r.packedPositions?.length!==count*16||r.packedNormals?.length!==count*4||r.packedUvs?.length!==count*16)throw new Error('原模型顶点流缺失');
  g.setAttribute('position',new THREE.BufferAttribute(r.positions,3));g.setAttribute('normal',new THREE.BufferAttribute(r.normals,3));g.setAttribute('color',new THREE.BufferAttribute(r.colors,4));
  // Packed attributes survive geometry.clone() without JSON serialization.
  g.setAttribute('native_positionColor',new THREE.BufferAttribute(r.packedPositions,16));
  g.setAttribute('native_normal',new THREE.BufferAttribute(r.packedNormals,4));
  g.setAttribute('native_uv',new THREE.BufferAttribute(r.packedUvs,16));
  g.setAttribute('a_position',g.attributes.position);g.setAttribute('a_normal',g.attributes.normal);g.setAttribute('a_color',g.attributes.color);
  for(let channel=0;channel<4;channel++){
    const uv=new Float32Array(count*2);for(let i=0;i<count;i++)uv.set(r.uvs.subarray(i*8+channel*2,i*8+channel*2+2),i*2);
    g.setAttribute(channel?'uv'+channel:'uv',new THREE.BufferAttribute(uv,2));
  }
  for(let channel=0;channel<2;channel++){
    const uv=new Float32Array(count*4);for(let i=0;i<count;i++)uv.set(r.uvs.subarray(i*8+channel*4,i*8+channel*4+4),i*4);
    g.setAttribute('a_uv'+channel,new THREE.BufferAttribute(uv,4));
  }
  g.setIndex(new THREE.BufferAttribute(r.indices,1));return g;
}
export function exportResourceModel(object:THREE.Mesh,material:THREE.Material,start:number,count:number):VulkanModelDraw {
  if(object.geometry.userData.nativeMotes){const g=object.geometry;return {...material.userData.nativeModel,nodeId:object.userData.nodeId,stride:MOTE_VERTEX_STRIDE,state:modelRenderStateCode('Opaque'),vertices:g.userData.moteVertices,indices:g.index!.array as Uint32Array,model:new THREE.Matrix4().toArray(),baked:false};}
  if(object.geometry.userData.nativeFlock){const g=object.geometry;return {...material.userData.nativeModel,nodeId:object.userData.nodeId,stride:BIRD_FLOCK_VERTEX_STRIDE,state:modelRenderStateCode('AlphaTestOpaque'),vertices:g.userData.flockVertices,indices:g.index!.array as Uint32Array,model:new THREE.Matrix4().toArray(),baked:false};}
  const beamo=object.userData.beamoDraw;
  if(beamo){const initial=new THREE.Matrix4().fromArray(beamo.matrix),model=object.matrixWorld.equals(initial)?new THREE.Matrix4():object.matrixWorld.clone().multiply(initial.invert());return {...material.userData.nativeModel,nodeId:beamo.nodeId,stride:48,state:modelRenderStateCode(material.userData.nativeModel.group),vertices:beamo.vertices,indices:Uint32Array.from({length:count},(_,i)=>object.geometry.index!.getX(start+i)),model:model.toArray(),baked:beamo.acceptedBake};}
  const g=object.geometry,n=g.getAttribute('position').count,vertices=new Uint8Array(n*MODEL_VERTEX_STRIDE);
  const raw=(name:string)=>(g.getAttribute(name) as THREE.BufferAttribute).array;
  const bytes=(name:string)=>{const a=raw(name);return new Uint8Array(a.buffer,a.byteOffset,a.byteLength);};
  const pos=bytes('native_positionColor'),normal=bytes('native_normal'),uv=bytes('native_uv'),bake=(object.userData.boundBake as BoundBake|undefined)?.packed??object.userData.defaultModelLighting as Uint8Array|undefined;
  if(pos.length!==n*16||normal.length!==n*4||uv.length!==n*16||bake&&bake.length!==n*12)throw new Error('原模型顶点流长度不符');
  for(let i=0;i<n;i++){const at=i*MODEL_VERTEX_STRIDE;vertices.set(pos.subarray(i*16,i*16+16),at);vertices.set(normal.subarray(i*4,i*4+4),at+16);vertices.set(uv.subarray(i*16,i*16+16),at+20);if(bake)vertices.set(bake.subarray(i*12,i*12+12),at+36);}
  const binding=material.userData.nativeModel;
  return {...binding,nodeId:object.userData.nodeId,stride:MODEL_VERTEX_STRIDE,state:modelRenderStateCode(binding.group),vertices,
    indices:Uint32Array.from({length:count},(_,i)=>g.index?.getX(start+i)??start+i),model:object.matrixWorld.toArray(),baked:!!object.userData.boundBake,defaultLighting:!!object.userData.defaultModelLighting&&!object.userData.boundBake};
}
