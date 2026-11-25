import * as THREE from 'three';
import {nativeMaterialDefs} from '../../src/core/mesh-surfaces';
import {createBakedObject,type BakedView} from '../../src/renderer/baked-renderer';
export function gradientPatchScene() {
 const defs=nativeMaterialDefs('Dawn'),rock=defs.find(d=>d.shaderName==='RockFaceSh'&&d.uvScale>0)!,sand=defs.find(d=>d.shaderName==='SandSh'&&d.uvScale>0)!,grass=defs.find(d=>d.shaderName==='GrassSh'&&d.uvScale>0)!;
 const scene=new THREE.Scene();
 for(let patch=0;patch<2;patch++) {
  const positions=Float32Array.from([patch?-8:-24,.05,-8,patch?8:-8,.05,-8,patch?8:-8,.05,8,patch?-8:-24,.05,8]),ids=new Uint8Array(16),weights=new Uint8Array(16),light=new Uint8Array(48),normals=Float32Array.from([0,1,0,0,1,0,0,1,0,0,1,0]),packedNormals=Int8Array.from([0,127,0,0,0,127,0,0,0,127,0,0,0,127,0,0]);
  for(let v=0;v<4;v++){ids.set(patch?[rock.materialId,sand.materialId,grass.materialId,0]:[rock.materialId,grass.materialId,0,0],v*4);weights.set(patch?(v===0||v===3?[180,60,15,0]:[0,127,128,0]):[128,127,0,0],v*4);light.set([128,128,128,255,128,220,128,0,128,255,128,32],v*12);}
  scene.add(createBakedObject({id:`gradient${patch}`,kind:'terrain',stride:36,vertexCount:4,indexCount:6,positions,normals,packedNormals,materialIds:ids,weights,light,userData1:new Uint8Array(16),indices:Uint32Array.from([0,2,1,0,3,2])} as BakedView,defs,'material',false));
 }
 return {scene,defs,rock,sand,grass};
}
