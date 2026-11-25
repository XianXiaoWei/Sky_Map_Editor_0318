import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';
import * as THREE from 'three';
import {AssetCatalog} from '../src/main/assets';
import {ObjectsDocument} from '../src/core/objects';
import {MeshesDocument} from '../src/core/meshes';
import {createViewportCloud} from '../src/main/vulkan-viewport-cloud';
import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {createVulkanEnvironment} from '../src/main/vulkan-environment';
import {createBakedObject,type BakedView} from '../src/renderer/baked-renderer';
import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {VulkanHost} from '../src/main/vulkan';

const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const executable=process.env.SKY_FULL_RENDERER??'dist/native/sky-vulkan';
const optimizationCompare=process.env.SKY_FULL_OPTIMIZATION_COMPARE==='1';
const hosts=[new VulkanHost(path.resolve(executable),undefined,optimizationCompare?{SKY_FULL_COPY_REFERENCE:'1',SKY_CANVAS_CPU_REFERENCE:'1',SKY_FULL_METER_COPY_REFERENCE:'1'}:{}),new VulkanHost(path.resolve(executable))];
const surfaceCheck=process.env.SKY_FULL_GRAPH_SURFACE==='1';
const temporary=surfaceCheck?fs.mkdtempSync(path.join(os.tmpdir(),'sky-full-graph-')):undefined;
const capture=temporary&&path.join(temporary,'frame.rgba');
let surfaceArgs:Parameters<VulkanHost['fullFrame']>|undefined;
if(surfaceCheck){
 process.env.SKY_SURFACE_CAPTURE=capture!;
 const surface=new VulkanHost(path.resolve('dist/native/sky-vulkan-surface-test')),original=surface.fullFrame.bind(surface);
 surface.fullFrame=async(...args)=>{surfaceArgs=args;return original(...args);};hosts.push(surface);
}
const report:any={passed:false,scope:'Real original terrain/cloud assets: CPU readback reference versus GPU-resident graph. Exact final display bytes across animation, camera cuts, resize, map switch and renderer restart on Linux software Vulkan; no Windows FPS or original-game visual acceptance.',maps:[]};
report.cloudSampling=process.env.SKY_CLOUD_SAMPLING??'device';
if(optimizationCompare)report.scope='Same GPU-resident full-effects graph and internal dimensions, conservative copy/CPU display conversion versus optimized native transfer. Actual original map assets, wall-clock timings on Linux software Vulkan; no device FPS claim. Upload/restart frames excluded from steady-frame comparisons.';
const hash=(bytes:Uint8Array)=>createHash('sha256').update(bytes).digest('hex');
async function main(){try{
 report.device=await hosts[0].start();await hosts[1].start();if(surfaceCheck)assert.equal((await hosts[2].start()).nativeSurface,true);
 for(const level of process.argv.slice(2).length?process.argv.slice(2):['Dawn','SkyHub2','WorldEmpty']){
  const objects=fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')),meshes=fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')),mesh=new MeshesDocument(meshes),nodes=new ObjectsDocument(objects).nodes,catalog=new AssetCatalog(data,level),scene=new THREE.Scene();
  for(const g of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt'))scene.add(createBakedObject(mesh.geometryView(g) as BakedView,nativeMaterialDefs(level),'material',false));
  const draws=exportVulkanScene(scene).baked??[],box=new THREE.Box3().setFromObject(scene);
  if(box.isEmpty()&&mesh.cloud?.proxy)box.setFromBufferAttribute(new THREE.BufferAttribute(mesh.geometryView(mesh.cloud.proxy).positions,3));
  const center=box.isEmpty()?new THREE.Vector3():box.getCenter(new THREE.Vector3()),extent=box.isEmpty()?new THREE.Vector3():box.getSize(new THREE.Vector3()),camera=new THREE.PerspectiveCamera(50,16/9,.1,64000);
  camera.position.copy(center).add(new THREE.Vector3(0,Math.max(70,extent.y*.2),Math.max(180,extent.z*.35)));camera.lookAt(center);camera.updateMatrixWorld();
  const create=(reference:boolean,host:VulkanHost)=>{
   const saved=process.env.SKY_FULL_CPU_REFERENCE;process.env.SKY_FULL_CPU_REFERENCE=reference?'1':'0';
   const cloud=createViewportCloud(level,nodes,mesh,catalog,host,'/tmp/sky-cloud-preview-shaders');if(saved===undefined)delete process.env.SKY_FULL_CPU_REFERENCE;else process.env.SKY_FULL_CPU_REFERENCE=saved;
   const baked=createVulkanBakedRenderer(level,nodes,catalog,host,'/tmp/sky-cloud-preview-shaders');baked.setDraws(draws);
   return {cloud,baked,environment:createVulkanEnvironment(nodes,catalog,host,'/tmp/sky-cloud-preview-shaders')};
  };
  let runtimes=hosts.map((host,i)=>create(!optimizationCompare&&i===0,host));for(const host of hosts)await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const rows=[];
  for(let step=0;step<6;step++){
   if(step===2){camera.position.x+=2;camera.lookAt(center);camera.updateMatrixWorld();}
   if(step===5){for(const host of hosts){host.stop();await host.start();await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});}runtimes=hosts.map((host,i)=>create(!optimizationCompare&&i===0,host));}
   const width=step===3?Number(process.env.SKY_FULL_CHECK_RESIZE_WIDTH??192):Number(process.env.SKY_FULL_CHECK_WIDTH??160),height=Math.round(width*9/16);camera.aspect=width/height;camera.updateProjectionMatrix();const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),cameraMatrix=camera.matrixWorld.toArray(),outputs=[];
   if(surfaceCheck)await hosts[2].setWindowBounds({x:0,y:0,width,height,visible:true});
   // Sequential execution avoids measuring contention between software GPUs.
   for(const [index,runtime] of runtimes.entries()){try{runtime.baked.advance(.1);runtime.cloud.advance(.1,runtime.baked.info().dynamics.time);const renderMatrix=await runtime.cloud.prepare(width,height,matrix,cameraMatrix,runtime.baked.info().dynamics.time);await runtime.environment(width,height,renderMatrix,cameraMatrix,true);await runtime.baked.render(width,height,renderMatrix,cameraMatrix);outputs.push(await runtime.cloud.compose(width,height,matrix,cameraMatrix));}catch(error){throw new Error(`${level} step ${step}, ${['reference','resident','surface'][index]}: ${error}`,{cause:error});}}
   let differing=0,max=0;assert.equal(outputs[0].pixels.length,outputs[1].pixels.length);for(let i=0;i<outputs[0].pixels.length;i++){const d=Math.abs(outputs[0].pixels[i]-outputs[1].pixels[i]);differing+=Number(d>0);max=Math.max(max,d);}
   let surfacePixels:undefined|{components:number;mismatchesOver2:number;maxDifference:number};
   if(surfaceCheck){
    assert.equal(outputs[2].surface,true);assert.equal(outputs[2].presented,true);assert.equal(outputs[2].pixels.length,0);
    // Replay an unchanged reset frame: native/X11 presentation may lag the
    // rendering fence, while reset keeps cloud and temporal inputs identical.
    if(surfaceArgs![3].reset){
     for(let repeat=0;repeat<4;repeat++)assert.equal((await hosts[2].fullFrame(...surfaceArgs!)).presented,true);
     const actual=fs.readFileSync(capture!);assert.equal(actual.length,outputs[0].pixels.length);
     let bad=0,maximum=0;for(let i=0;i<actual.length;i++){const d=Math.abs(actual[i]-outputs[0].pixels[i]);bad+=Number(d>2);maximum=Math.max(maximum,d);}
     surfacePixels={components:actual.length,mismatchesOver2:bad,maxDifference:maximum};assert.equal(bad,0,`${level} step ${step}: native presentation differs`);
    }
   }
   const row={step,width,height,cameraCut:step===2,restart:step===5,differing,max,surfacePixels,referenceSha256:hash(outputs[0].pixels),residentSha256:hash(outputs[1].pixels),referenceMs:runtimes[0].cloud.info().lastMilliseconds,residentMs:runtimes[1].cloud.info().lastMilliseconds,cache:hosts[1].fullCacheInfo()};rows.push(row);console.log(level,JSON.stringify(row));assert.equal(differing,0,`${level} step ${step}: resident pixels differ`);
  }
  assert.equal(hash(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))),hash(objects));assert.equal(hash(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),hash(meshes));report.maps.push({level,sourceUnchanged:true,frames:rows});
 }
 report.passed=true;
}finally{for(const host of hosts)host.stop();fs.writeFileSync(process.env.SKY_FULL_GRAPH_REPORT??(surfaceCheck?'docs/full-preview-graph-surface-check.json':'docs/full-preview-graph-check.json'),JSON.stringify(report,null,2)+'\n');if(temporary)fs.rmSync(temporary,{recursive:true,force:true});}}
void main().catch(error=>{console.error(error);process.exitCode=1;});
