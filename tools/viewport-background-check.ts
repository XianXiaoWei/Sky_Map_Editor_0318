import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {VulkanHost} from '../src/main/vulkan';
import {AssetCatalog} from '../src/main/assets';
import {ObjectsDocument} from '../src/core/objects';
import {createVulkanEnvironment} from '../src/main/vulkan-environment';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';

const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,checks:[],scope:'Native viewport background and shared color/depth attachments; static environment preview, not original-game image parity'};
 try{
  report.device=await host.start();
  await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const nodes=new ObjectsDocument(await fs.readFile(path.join(data,'Levels/Dawn/Objects.level.bin'))).nodes;
  const env=createViewportEnvironment(nodes)([0,100,0]),camera=new THREE.PerspectiveCamera(50,1,.1,64000);
  camera.position.set(0,100,0);camera.lookAt(camera.position.clone().add(new THREE.Vector3(...env.direction).negate()));camera.updateMatrixWorld();
  const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
  let scenes:VulkanMaterialScene[]=[];
  const upload=host.setViewportBackground.bind(host);host.setViewportBackground=async next=>{scenes=next;await upload(next);};
  const render=createVulkanEnvironment(nodes,new AssetCatalog(data,'Dawn'),host,'/tmp/sky-vulkan-shader-cache');
  await render(128,128,matrix,camera.matrixWorld.toArray());
  const withSun=await host.frame(128,128,matrix);
  await upload([scenes[0]]);const withoutSun=await host.frame(128,128,matrix);
  let sunPixels=0;for(let i=0;i<withSun.pixels.length;i+=4)if(withSun.pixels.slice(i,i+3).some((v,l)=>v!==withoutSun.pixels[i+l]))sunPixels++;
  assert.ok(sunPixels>5&&sunPixels<128*128*.2,`Sun changed ${sunPixels} pixels`);report.sunPixels=sunPixels;
  report.checks.push('Actual Sun shader changes the visible disk while the atmosphere fills the empty viewport');
  await upload(scenes);
  // Opaque foreground covers the complete screen at distance 10, in front of
  // the original Sun billboard at 30000. State 6 avoids back-face culling.
  const points=[[-10,-10],[10,-10],[10,10],[-10,-10],[10,10],[-10,10]],vertices:number[]=[];
  for(const [x,y] of points){const p=new THREE.Vector3(x,y,-10).applyMatrix4(camera.matrixWorld);vertices.push(...p.toArray(),.125,.25,.5,1);}
  await host.setScene({vertices:Float32Array.from(vertices),draws:Uint32Array.from([0,6,6,0])});
  const foreground=await host.frame(128,128,matrix);
  for(let i=0;i<foreground.pixels.length;i+=4)assert.deepEqual(Array.from(foreground.pixels.slice(i,i+4)),[32,64,128,255]);
  report.checks.push('Opaque foreground occludes both sky and Sun using the shared depth attachment');
  await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const restored=await host.frame(128,128,matrix);assert.deepEqual(restored.pixels,withSun.pixels);
  const resized=await host.frame(73,41,matrix);assert.equal(resized.pixels.length,73*41*4);assert.ok(new Set(Array.from(resized.pixels)).size>10);
  await upload([]);const cleared=await host.frame(73,41,matrix);
  for(let i=0;i<cleared.pixels.length;i+=4)assert.deepEqual(Array.from(cleared.pixels.slice(i,i+4)),[16,32,48,255]);
  report.checks.push('Foreground reset restores the exact background; resize and explicit background clearing work');
  const levels=(await fs.readdir(path.join(data,'Levels'))).sort();report.maps=[];
  for(const level of levels){
   const file=path.join(data,'Levels',level,'Objects.level.bin');let bytes;try{bytes=await fs.readFile(file);}catch{continue;}
   const preview=createViewportEnvironment(new ObjectsDocument(bytes).nodes);
   for(const eye of [[0,1,0],[0,100,0],[1000,2000,-1000]]){const value=preview(eye);assert.ok([...value.direction,...value.sunColor,...value.average,...value.lut].every(Number.isFinite),level+' has nonfinite sky inputs');}
   report.maps.push(level);
  }
  report.checks.push('All available map defaults and spatial environments yield finite sky inputs at three camera positions');report.passed=true;
 }catch(error){report.error=String(error);throw error;}finally{host.stop();await fs.writeFile('docs/viewport-background-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
