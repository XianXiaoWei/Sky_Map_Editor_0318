import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import assert from 'node:assert/strict';import * as THREE from 'three';
import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {vulkanProgramSources} from '../src/main/vulkan-program';import {bindVulkanMaterial,type VulkanMaterialInput} from '../src/main/vulkan-material';
import {decodePng} from '../src/core/png';import {packProbeHalf} from '../src/core/probe';import {halfFloat} from '../src/core/resources';import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {savedWaterRenderStates} from '../src/core/water-render-state';import {createViewportEnvironment} from '../src/main/viewport-environment';import {createViewportCloud} from '../src/main/vulkan-viewport-cloud';import {createVulkanEnvironment} from '../src/main/vulkan-environment';
import {writeEffectPng,effectDisplay} from './effect-png';
import {generateOriginalFlowerTexture} from '../src/core/flower-texture-runtime';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',hash=(b:Uint8Array|string)=>crypto.createHash('sha256').update(b).digest('hex');
const quad={stride:1,vertices:new Uint8Array(4),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{},state:4};
const texture=(values:Float32Array,w:number,h:number):VulkanMaterialInput['textures'][string]=>({format:'rgba32f',dimensions:[w,h,1],linear:false,repeat:false,data:new Uint8Array(values.buffer)});
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
function reference(previous:Float32Array,w:number,h:number,dt:number,impulse:number,origin:number[],segment:number[],radius:number,sink:number,shift:number[]){
 const out=new Float32Array(previous.length),norm=new Float32Array(previous.length),read=(x:number,y:number)=>Array.from(previous.subarray((Math.max(0,Math.min(h-1,y))*w+Math.max(0,Math.min(w-1,x)))*4,(Math.max(0,Math.min(h-1,y))*w+Math.max(0,Math.min(w-1,x)))*4+4));dt=Math.min(f(0.03333334),f(dt));
 for(let y=0;y<h;y++)for(let x=0;x<w;x++){
  const sx=x+shift[0],sy=y+shift[1],c=read(sx,sy),down=read(sx,sy-1),right=read(sx+1,sy),up=read(sx,sy+1),left=read(sx-1,sy),at=(y*w+x)*4;
  norm.set([sub(left[0],c[0]),sub(down[0],c[0]),c[0]].map(n=>Math.min(1,Math.max(-1,n))),at);
  c[3]=Math.max(mul(Math.max(Math.max(down[3],up[3]),Math.max(left[3],right[3])),f(0.95)),c[3]);
  for(let lane=0;lane<4;lane++)c[lane]=mul(c[lane],sub(1,mul([f(.1),f(.01),1,1][lane],dt)));
  c[2]=add(c[2],mul(add(add(add(sub(down[0],read(sx,sy)[0]),sub(up[0],read(sx,sy)[0])),sub(left[0],read(sx,sy)[0])),sub(right[0],read(sx,sy)[0])),mul(50,dt)));
  c[2]=mul(Math.min(1,Math.abs(c[2])),Math.sign(c[2]));c[0]=add(c[0],mul(c[2],dt));
  const world=[add(mul((x+.5)/w,16),origin[0]),add(mul((y+.5)/h,16),origin[1])],v=[sub(segment[2],segment[0]),sub(segment[3],segment[1])],rel=[sub(world[0],segment[0]),sub(world[1],segment[1])],dot=add(mul(rel[0],v[0]),mul(rel[1],v[1])),vv=add(mul(v[0],v[0]),mul(v[1],v[1]));
  const t=dot<=0?0:vv<=dot?1:f(dot/vv),closest=[add(segment[0],mul(v[0],t)),add(segment[1],mul(v[1],t))],d=[sub(world[0],closest[0]),sub(world[1],closest[1])],distance=f(Math.sqrt(add(mul(d[0],d[0]),mul(d[1],d[1]))));
  const depth=mul(Math.max(sub(1,f(distance/.25)),0),impulse);if(depth>0){const by=Math.max(add(c[0],depth),0);c[0]=sub(c[0],by);c[2]=add(c[2],mul(by,f(.2)));c[3]=1;}
  const depth2=radius>0?mul(Math.max(sub(1,f(distance/radius)),0),sink):0;if(depth2>0)c[1]=sub(c[1],Math.max(add(c[1],depth2),0));out.set(c,at);
 }
 const half=packProbeHalf(out,true),halfN=packProbeHalf(norm,true);return {out:Float32Array.from(half,n=>halfFloat(n)),norm:Float32Array.from(halfN,n=>halfFloat(n))};
}
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),catalog=new AssetCatalog(data,'SkyHub2'),report:any={passed:false,scope:'Original WaterSim/Reset equations and original Flower point shader on Vulkan; actual saved Water transforms in an isolated original shader/full composition scene. Preview environment/sky probe and explicit simulation inputs; not original-game image or complete class acceptance.'};
 try{
  report.device=await host.start();const cache='/root/sky-research/water-flower-shader-cache',compile=async(name:string)=>{const p=catalog.program(name);return compileVulkanShaders(vulkanProgramSources(p),cache);};
  const sim=await compile('WaterSim'),reset=await compile('WaterSimReset'),w=64,h=64;
  assert.equal(sim.success,true,sim.log);assert.equal(reset.success,true,reset.log);
  await host.setCachedMaterialScene(await bindVulkanMaterial(reset,{shader:'WaterSimReset',...quad,uniforms:{},textures:{},colorFormats:['rgba16f','rgba16f']}));
  const clear=await host.materialFrame(w,h);assert.ok(clear.attachments[0].every(n=>n===0));assert.ok(clear.attachments[1].filter((_,i)=>i%4<3).every(n=>n===0));
  let previous=new Float32Array(w*h*4),maximumError=0,components=0,minimum=0,wet=0;const simRows=[];
  for(let frame=0;frame<8;frame++){
   const dt=frame===5?.1:frame===7?0:1/60,impulse=frame<2?1:0,origin=[0,0],segment=[7.8,8,8.2,8],radius=.4,sink=frame===0?.7:0,shift=frame===4?[1,-1]:[0,0];
   const input:VulkanMaterialInput={shader:'WaterSim',...quad,uniforms:{u_viewportSize:[w,h],u_averagedt:dt,u_waterSimTerms:[...origin,radius,.0625],u_waterSimTerms2:[shift[0]/w,shift[1]/h,impulse,sink],u_waterSimTerms3:segment},textures:{u_previous:texture(previous,w,h)},colorFormats:['rgba16f','rgba16f']};
   await host.setCachedMaterialScene(await bindVulkanMaterial(sim,input));const output=await host.materialFrame(w,h),actual=new Float32Array(previous.length),normal=new Float32Array(previous.length);
   for(let y=0;y<h;y++){actual.set(output.attachments[0].subarray((h-1-y)*w*4,(h-y)*w*4),y*w*4);normal.set(output.attachments[1].subarray((h-1-y)*w*4,(h-y)*w*4),y*w*4);}
   assert.ok(actual.every(Number.isFinite));assert.ok(normal.filter((_,i)=>i%4<3).every(Number.isFinite));const expected=reference(previous,w,h,dt,impulse,origin,segment,radius,sink,shift);let error=0;
   for(let i=0;i<actual.length;i++){error=Math.max(error,Math.abs(actual[i]-expected.out[i]));components++;if(i%4<3){error=Math.max(error,Math.abs(normal[i]-expected.norm[i]));components++;}}
   assert.ok(error<=.001,`WaterSim frame ${frame} error ${error}`);maximumError=Math.max(maximumError,error);minimum=Math.min(minimum,...actual.filter((_,i)=>i%4===0));wet=Math.max(wet,...actual.filter((_,i)=>i%4===3));previous=actual;simRows.push({frame,error,sha256:hash(new Uint8Array(actual.buffer))});
  }
  assert.ok(minimum<-.1);assert.equal(wet,1);report.simulation={frames:simRows,components,maximumError,minimumHeight:minimum,wetMaximum:wet,reset:true,shift:true,dtClamp:true,shader:sim.key};
  const wind=decodePng(fs.readFileSync(catalog.imageFile('GrassNorTex1'))),windTexture:VulkanMaterialInput['textures'][string]={format:'rgba8',dimensions:[wind.width,wind.height,1],linear:true,repeat:true,data:wind.rgba};
  const sprite=generateOriginalFlowerTexture(),rgba=new Uint8Array(32*32*4);for(let i=0;i<32*32;i++){rgba[i*4]=sprite[i*2];rgba[i*4+1]=sprite[i*2+1];rgba[i*4+3]=255;}const spriteTexture:VulkanMaterialInput['textures'][string]={format:'rgba8',dimensions:[32,32,1],linear:true,repeat:false,data:rgba};
  const camera=new THREE.PerspectiveCamera(55,1,.1,100);camera.position.set(0,1,3);camera.lookAt(0,0,0);camera.updateMatrixWorld();
  const flower=await compile('Flower'),flowerRows=[];assert.equal(flower.success,true,flower.log);
  const positions=[0,0,0,0,1,0,0,.25,1],attributes={a_position:{format:'vec3' as const,offset:0},a_normal:{format:'vec4' as const,offset:12},a_color:{format:'vec4' as const,offset:28},a_light0:{format:'vec4' as const,offset:44},a_light1:{format:'vec4' as const,offset:60},a_userData0:{format:'vec4' as const,offset:76}};
  for(const size of [.3,.6]){
   const ns=Float32Array.from([...positions.slice(0,3),0,1,0,0,.1,.4,.1,1,.5,.5,.5,1,0,1,.5,0,0,.2,1,0]);
   await host.setCachedMaterialScene(await bindVulkanMaterial(flower,{shader:'Flower',topology:'points',state:10,stride:92,vertices:new Uint8Array(ns.buffer),indices:Uint32Array.of(0),attributes,
    uniforms:{u_viewProj:new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),u_view:camera.matrixWorldInverse.toArray(),u_eyePos:camera.position.toArray(),u_sunDir:[0,-1,0],u_sunColor:[1,1,1],u_averageSkyColor:[.3,.3,.3],u_pointLight:[0,0,0],u_viewportSize:[64,64],u_unitHeightFrac:1/Math.tan(55*Math.PI/360),u_windScroll1:[.1,0,.2],u_windScroll2:[.3,0,.4],u_flowerHeight:1,u_flowerSize:size,u_waterSimTerms:[0,0,0,0]},
    textures:{u_texture:spriteTexture,u_windPattern:windTexture,u_waterSim:texture(new Float32Array(4),1,1),u_waterSimNorm:texture(new Float32Array(4),1,1)}}));
   const frame=await host.materialFrame(64,64);assert.ok(frame.attachments.every(a=>a.every(Number.isFinite)));const covered=frame.attachments[0].filter((n,i)=>i%4===3&&n>0).length;assert.ok(covered>0,'Original Flower point shader did not rasterize');
   const file=`docs/water-flower-Flower-${size}.png`;await writeEffectPng(file,64,64,effectDisplay(frame.attachments[0]));flowerRows.push({size,covered,sha256:hash(new Uint8Array(frame.attachments[0].buffer)),file});
  }
  assert.ok(flowerRows[1].covered>flowerRows[0].covered);report.flower={points:true,shader:flower.key,cases:flowerRows};
  const allRows=[];
  for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){const doc=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));for(const water of savedWaterRenderStates(doc.nodes))allRows.push({level,...water});}
  assert.equal(allRows.length,38);report.savedWaterObjects=allRows;
  const source=fs.readFileSync(path.join(data,'Levels/SkyHub2/Objects.level.bin')),objects=new ObjectsDocument(source),waterNodes=objects.nodes.filter(n=>n.className==='Water'),water=savedWaterRenderStates(waterNodes)[0],env=createViewportEnvironment(waterNodes),world=new MeshesDocument(fs.readFileSync(path.join(data,'Levels/SkyHub2/BstBaked.meshes')));
  // Isolate the actual Water objects while exercising the normal full viewport.
  // The sparse-cloud path is tested separately by existing full-graph checks.
  const noCloud=Object.create(world) as MeshesDocument;noCloud.cloud=undefined;noCloud.cloudVolume=()=>undefined;
  const preview=createViewportCloud('SkyHub2',waterNodes,noCloud,catalog,host,cache,{handle:{resource:{loadIndex:0,records:[]}}},env),background=createVulkanEnvironment(waterNodes,catalog,host,cache,env);
  const model=new THREE.Matrix4().fromArray(water.model),center=new THREE.Vector3().setFromMatrixPosition(model),scale=new THREE.Vector3().setFromMatrixScale(model),distance=Math.max(3,Math.min(100,Math.max(scale.x,scale.z)*.7));
  camera.aspect=128/96;camera.far=64000;camera.updateProjectionMatrix();camera.position.copy(center).add(new THREE.Vector3(distance*.2,distance*.65,distance*.6));camera.lookAt(center);camera.updateMatrixWorld();const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
  const frames=[];for(let i=0;i<3;i++){env.advance({delta:1/60,timeScale:1});env.beginFrame(camera.position.toArray());preview.advance(1/60,i/60,[0,0,0,0]);const jittered=await preview.prepare(128,96,matrix,camera.matrixWorld.toArray(),i*.5);await background(128,96,jittered,camera.matrixWorld.toArray(),true);const frame=await preview.compose(128,96,matrix,camera.matrixWorld.toArray());assert.equal(frame.pixels.length,128*96*4);assert.ok(frame.averageLum!>0);frames.push({frame:i,sha256:hash(frame.pixels)});if(i===2)await writeEffectPng('docs/water-flower-SkyHub2-water.png',128,96,frame.pixels);}
  assert.notEqual(frames[0].sha256,frames[2].sha256);report.viewport={frames,water:preview.info().water,passes:preview.info().passes,screenshot:'docs/water-flower-SkyHub2-water.png',geometryScope:'Isolated two saved SkyHub2 Water objects; scene terrain, scene lights and sparse clouds omitted in this check'};assert.ok(report.viewport.passes.includes('OceanMesh'));assert.ok(report.viewport.water.frames===3);
  report.passed=true;
 }catch(error){report.error=String(error);throw error;}
 finally{host.stop();fs.writeFileSync('docs/water-flower-gpu-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:report.passed,error:report.error,simulation:report.simulation&&{components:report.simulation.components,maximumError:report.simulation.maximumError},flower:report.flower?.cases,waterObjects:report.savedWaterObjects?.length,viewport:report.viewport?.frames}));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
