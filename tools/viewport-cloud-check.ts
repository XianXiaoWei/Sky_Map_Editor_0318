import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';import * as THREE from 'three';
import {AssetCatalog} from '../src/main/assets';import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';
import {createViewportCloud} from '../src/main/vulkan-viewport-cloud';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';import {createVulkanEnvironment} from '../src/main/vulkan-environment';
import {createBakedObject,type BakedView} from '../src/renderer/baked-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';import {nativeMaterialDefs} from '../src/core/mesh-surfaces';import {VulkanHost} from '../src/main/vulkan';import {writeEffectPng} from './effect-png';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const width=Number(process.env.SKY_CHECK_WIDTH??320),height=Math.round(width*9/16),frameCount=Number(process.env.SKY_CHECK_FRAMES??2);
if(!Number.isInteger(frameCount)||frameCount<2||frameCount>32)throw new Error('Cloud check frame count must be 2..32');
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Production native viewport cloud chain on real BstBaked.meshes. Vulkan preview, not original Metal/game visual equivalence.',maps:[]};
 try{report.device=await host.start();
 const args=process.argv.slice(2),all=args.includes('--all-clouds'),maps=all?fs.readdirSync(path.join(data,'Levels')).filter(level=>{const file=path.join(data,'Levels',level,'BstBaked.meshes');return fs.existsSync(file)&&!!new MeshesDocument(fs.readFileSync(file)).cloud;}):(args.length?args:['Dawn','Prairie_ButterflyFields','Sunset']);
 for(const level of maps){
  const mesh=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))).nodes,catalog=new AssetCatalog(data,level),scene=new THREE.Scene(),defs=nativeMaterialDefs(level);
  for(const g of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt'))scene.add(createBakedObject(mesh.geometryView(g) as BakedView,defs,'material',false));
  const box=new THREE.Box3().setFromObject(scene);if(box.isEmpty()&&mesh.cloud?.proxy){const positions=mesh.geometryView(mesh.cloud.proxy).positions;box.setFromBufferAttribute(new THREE.BufferAttribute(positions,3));}
  const center=box.getCenter(new THREE.Vector3()),extent=box.getSize(new THREE.Vector3());
  const camera=new THREE.PerspectiveCamera(50,width/height,.1,64000);camera.position.copy(center).add(new THREE.Vector3(0,Math.max(70,extent.y*.2),Math.max(180,extent.z*.35)));camera.lookAt(center);camera.updateMatrixWorld();
  const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),cameraMatrix=camera.matrixWorld.toArray(),baked=createVulkanBakedRenderer(level,nodes,catalog,host,'/tmp/sky-cloud-preview-shaders'),cloud=createViewportCloud(level,nodes,mesh,catalog,host,'/tmp/sky-cloud-preview-shaders');
  baked.setDraws(exportVulkanScene(scene).baked!);await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});await createVulkanEnvironment(nodes,catalog,host,'/tmp/sky-cloud-preview-shaders')(width,height,matrix,cameraMatrix,true);
  const environment=createVulkanEnvironment(nodes,catalog,host,'/tmp/sky-cloud-preview-shaders');
  let frame;const samplingFrames=[];for(let step=0;step<frameCount;step++){baked.advance(.1);cloud.advance(.1,baked.info().dynamics.time);const renderMatrix=await cloud.prepare(width,height,matrix,cameraMatrix,baked.info().dynamics.time);await environment(width,height,renderMatrix,cameraMatrix,true);await baked.render(width,height,renderMatrix,cameraMatrix);frame=await cloud.compose(width,height,matrix,cameraMatrix);samplingFrames.push(cloud.info().sampling);}
  if(frameCount>=8)assert.equal(new Set(samplingFrames.map(s=>s!.phase)).size,8);
  assert.equal(frame!.pixels.length,width*height*4);const colors=new Set();for(let i=0;i<frame!.pixels.length;i+=4)colors.add(frame!.pixels.slice(i,i+3).join(','));assert.ok(colors.size>(all?1:30),`${level}: composed colors=${colors.size}`);
  const info=cloud.info();assert.ok(info.passes.includes('FogUpsample'));assert.ok(info.passes.includes('Tonemap'));if(mesh.cloud){assert.ok(info.passes.includes('CloudFluffy'));assert.ok(info.proxyTriangles>0);}
  if(!all&&frameCount===2)await writeEffectPng(`docs/shader-effects/${level}-cloud-pipeline.png`,width,height,frame!.pixels);report.maps.push({level,colors:colors.size,eye:camera.position.toArray(),samplingFrames,...info});console.log(level,JSON.stringify({frames:info.frames,phases:samplingFrames.map(s=>s!.phase),colors:colors.size}));
 }
 report.passed=true;
 }finally{host.stop();fs.writeFileSync(frameCount>2?'docs/viewport-camera-sampling-check.json':process.argv.includes('--all-clouds')?'docs/viewport-cloud-all-maps-check.json':'docs/viewport-cloud-check.json',JSON.stringify(report,null,2)+'\n');}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
