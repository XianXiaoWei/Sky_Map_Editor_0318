import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import * as THREE from 'three';
import { ObjectsDocument } from '../src/core/objects';
import { describeEnvironment } from '../src/core/environment-storage';
import { createViewportEnvironment } from '../src/main/viewport-environment';
import { createVulkanEnvironment } from '../src/main/vulkan-environment';
import { AssetCatalog } from '../src/main/assets';
import { VulkanHost } from '../src/main/vulkan';
import { writeEffectPng } from './effect-png';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',width=480,height=270;
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report:any={passed:false,scope:'Actual Vulkan shared prepared Environment owner -> restored derived-sun kernel -> atmosphere background and original Sun GLSL. Manual runtime enable requests use real EnvNodes. Saved autoStart selection, JS libm, current planet sphere, sky-only fog average, clear background/exposure are explicit adapter inputs; full startup events, foreground fog/cheap-fog lookup/probes/Metal/game image parity not claimed.',checks:[],images:[],sources:{}};
 try{
  report.device=await host.start();await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const file=path.join(data,'Levels/Dawn/Objects.level.bin'),bytes=fs.readFileSync(file),nodes=new ObjectsDocument(bytes).nodes;
  report.sources.Dawn=hash(bytes);
  const envs=nodes.filter(n=>n.className==='EnvNode'),node=envs.find(n=>describeEnvironment(n,nodes).registration?.duration===0)!;assert.ok(node);
  const info=describeEnvironment(node,nodes),point=info.region!.hull!.position.slice(0,3),owner=createViewportEnvironment(nodes);
  report.initialEnabled=owner.info().nodes.map(n=>({id:n.id,enabled:n.enabled}));
  for(const n of owner.info().nodes)owner.setEnabled(n.id,false);
  const wait=(seconds:number)=>{for(let i=0;i<Math.ceil(seconds/.25)+2;i++)owner.advance({delta:.25,timeScale:1});};
  wait(Math.max(...envs.map(n=>describeEnvironment(n,nodes).registration!.fadeOut),.25));
  const initial=owner(point),camera=new THREE.PerspectiveCamera(50,width/height,.1,64000);
  camera.position.fromArray(point);camera.lookAt(new THREE.Vector3(...point).sub(new THREE.Vector3(...initial.direction).multiplyScalar(1000)));camera.updateMatrixWorld();
  const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),cameraMatrix=camera.matrixWorld.toArray();
  const renderer=createVulkanEnvironment(nodes,new AssetCatalog(data,'Dawn'),host,'/tmp/sky-env-node-shaders',owner);
  const render=async()=>{await renderer(width,height,matrix,cameraMatrix);return host.frame(width,height,matrix);};
  const before=await render();await writeEffectPng('docs/env-node-Dawn-default.png',width,height,before.pixels);
  owner.setEnabled(node.id,true);wait(Math.max(info.registration!.fadeIn,.25));
  const active=owner(point),enabled=await render();await writeEffectPng('docs/env-node-Dawn-enabled.png',width,height,enabled.pixels);
  const changes=enabled.pixels.reduce((n,v,i)=>n+(v!==before.pixels[i]?1:0),0);assert.ok(changes>100,`EnvNode #${node.id} must change GPU color; differences=${changes}`);
  const state=owner.info();for(let i=0;i<5;i++)owner(point);assert.deepEqual(owner.info(),state);
  owner.setEnabled(node.id,false);wait(Math.max(info.registration!.fadeOut,.25));const restored=await render();
  await writeEffectPng('docs/env-node-Dawn-restored.png',width,height,restored.pixels);
  assert.deepEqual(restored.pixels,before.pixels,'Original default returns after disabling regional environment/fading');
  assert.equal(hash(fs.readFileSync(file)),report.sources.Dawn);
  report.checks.push({level:'Dawn',nodeId:node.id,point,changedComponents:changes,defaultValues:initial.values,enabledValues:active.values,restoredDifference:0,sourceUnchanged:true});
  report.images.push('docs/env-node-Dawn-default.png','docs/env-node-Dawn-enabled.png','docs/env-node-Dawn-restored.png');
  const emptyFile=path.join(data,'Levels/WorldEmpty/Objects.level.bin'),emptyBytes=fs.readFileSync(emptyFile),emptyNodes=new ObjectsDocument(emptyBytes).nodes,empty=createViewportEnvironment(emptyNodes);
  report.sources.WorldEmpty=hash(emptyBytes);assert.equal(empty.info().nodes.length,0);
  const emptyCamera=new THREE.PerspectiveCamera(50,width/height,.1,64000);emptyCamera.position.set(0,20,0);emptyCamera.lookAt(0,20,-1000);emptyCamera.updateMatrixWorld();
  const emptyMatrix=new THREE.Matrix4().multiplyMatrices(emptyCamera.projectionMatrix,emptyCamera.matrixWorldInverse).toArray();
  await createVulkanEnvironment(emptyNodes,new AssetCatalog(data,'WorldEmpty'),host,'/tmp/sky-env-node-shaders',empty)(width,height,emptyMatrix,emptyCamera.matrixWorld.toArray());
  const frame=await host.frame(width,height,emptyMatrix),colors=new Set<string>();for(let i=0;i<frame.pixels.length;i+=4)colors.add(Array.from(frame.pixels.subarray(i,i+3)).join(','));assert.ok(colors.size>30);
  await writeEffectPng('docs/env-node-WorldEmpty.png',width,height,frame.pixels);report.images.push('docs/env-node-WorldEmpty.png');
  report.checks.push({level:'WorldEmpty',noEnvNode:true,colors:colors.size,values:empty([0,20,0]).values,sourceUnchanged:hash(fs.readFileSync(emptyFile))===report.sources.WorldEmpty});
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/env-node-gpu-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify({passed:report.passed,checks:report.checks.map((c:any)=>({level:c.level,changedComponents:c.changedComponents,colors:c.colors})),images:report.images}));
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
