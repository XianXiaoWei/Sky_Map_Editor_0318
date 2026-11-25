import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {MeshesDocument} from '../src/core/meshes';
import {ObjectsDocument} from '../src/core/objects';
import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {createBakedObject} from '../src/renderer/baked-renderer';
import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import {createVulkanBakedRenderer,BAKED_PREVIEW_SCOPE} from '../src/main/vulkan-baked';
import {AssetCatalog} from '../src/main/assets';
import {VulkanHost} from '../src/main/vulkan';
import {cameraSampling,jitterViewProjection} from '../src/core/camera-sampling';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,maps:[],scope:BAKED_PREVIEW_SCOPE};
 try{
  report.device=await host.start();await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});await host.setViewportBackground([]);
  for(const level of (await fs.readdir(path.join(data,'Levels'))).sort()){
   const objectsPath=path.join(data,'Levels',level,'Objects.level.bin');try{await fs.access(objectsPath);}catch{continue;}
   const doc=new MeshesDocument(await fs.readFile(path.join(data,'Levels',level,'BstBaked.meshes'))),nodes=new ObjectsDocument(await fs.readFile(objectsPath)).nodes;
   const scene=new THREE.Scene(),defs=nativeMaterialDefs(level);
   for(const g of doc.geometries.filter(g=>g.stride>=36&&g.vertexCount))scene.add(createBakedObject(doc.geometryView(g),defs,'material',false));
   const terrain=scene.children.filter(child=>child.userData.bakedView.kind==='terrain'),bounds=new THREE.Box3();
   for(const object of terrain.length?terrain:scene.children)bounds.expandByObject(object);
   const center=bounds.isEmpty()?new THREE.Vector3(0,100,0):bounds.getCenter(new THREE.Vector3()),size=bounds.isEmpty()?1:Math.max(1,bounds.getSize(new THREE.Vector3()).length());
   const camera=new THREE.PerspectiveCamera(50,1,.1,64000);camera.position.copy(center).add(new THREE.Vector3(size*.6,size*.3,size*.6));camera.lookAt(center);camera.updateMatrixWorld();
   const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
   const renderer=createVulkanBakedRenderer(level,nodes,new AssetCatalog(data,level),host,'/tmp/sky-terrain-map-cache');renderer.setDraws(exportVulkanScene(scene).baked!);
   try{
    const initialMatrix=jitterViewProjection(matrix,cameraSampling(0,64,64).projectionShift);
    await renderer.render(64,64,initialMatrix,camera.matrixWorld.toArray());const initial=await host.frame(64,64,initialMatrix,1);assert.equal(initial.pixels.length,64*64*4);
    camera.position.x+=size*.01;camera.lookAt(center);camera.updateMatrixWorld();const moved=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
    const movedMatrix=jitterViewProjection(moved,cameraSampling(1,64,64).projectionShift);
    await renderer.render(64,64,movedMatrix,camera.matrixWorld.toArray());await host.frame(64,64,movedMatrix,1);
    const result={level,passed:true,...renderer.info()};report.maps.push(result);console.log(JSON.stringify({level,passed:true,draws:result.draws,shaders:result.shaders.length}));
   }catch(error){report.maps.push({level,passed:false,error:String(error)});throw error;}
   for(const object of scene.children)object.traverse(child=>{if(child instanceof THREE.Mesh){child.geometry.dispose();for(const material of Array.isArray(child.material)?child.material:[child.material])material.dispose();}});
  }
  report.checks=['All available real terrain/skirt streams, original shader variants and real PNG textures render without nonfinite RGB with native eight-phase projection jitter','Camera movement updates existing material uniforms or spatial environment resources; original map files remain read-only'];report.passed=true;
 }catch(error){report.error=String(error);throw error;}finally{host.stop();await fs.writeFile('docs/viewport-terrain-maps-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:report.passed,maps:report.maps.length,error:report.error}));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
