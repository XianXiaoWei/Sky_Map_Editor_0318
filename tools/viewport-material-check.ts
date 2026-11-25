import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import path from 'node:path';
import {VulkanHost} from '../src/main/vulkan';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {bindVulkanMaterial} from '../src/main/vulkan-material';
import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';

async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report:any={passed:false,checks:[],scope:'Independent synthetic HDR/linear blending, shared depth, uniform updates and explicit preview display adaptation; no claim of original-game composition'};
 try{
  report.device=await host.start();await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const compiled=await compileVulkanShaders([{stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec3 a_position; void main(){gl_Position=vec4(a_position,1);}'},
   {stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) out vec4 color; uniform vec4 u_color; void main(){color=u_color;}'}],'/tmp/sky-viewport-material-check');
  const vertices=Float32Array.from([-1,-1,.5,1,-1,.5,1,1,.5,-1,1,.5]);
  const scene=(rgba:number[],state:number,z=.5)=>bindVulkanMaterial(compiled,{shader:'IndependentConstant',stride:12,state,
   vertices:new Uint8Array(Float32Array.from(vertices,(v,i)=>i%3===2?z:v).buffer),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec3',offset:0}},uniforms:{u_color:rgba},textures:{}});
  const opaque=await scene([4,2,.25,1],6),decal=await scene([0,0,0,.5],7);
  const identity=Array.from({length:16},(_,i)=>i%5===0?1:0);
  const display=(value:number,exposure:number)=>{const mapped=value*exposure/(1+value*exposure);return Math.round(255*(mapped<=.0031308?12.92*mapped:1.055*mapped**(1/2.4)-.055));};
  const checkPixels=(pixels:Uint8Array,color:number[])=>{for(let i=0;i<pixels.length;i++)assert.ok(Math.abs(pixels[i]-color[i%4])<=1,`${i}: ${pixels[i]} vs ${color[i%4]}`);};
  await host.setViewportMaterials([opaque,decal]);
  // Linear blend is [2,1,.125]; clipping the opaque draw before blending gives
  // [.5,.5,.125], and applying the display curve before blending also differs.
  for(const exposure of [.25,1,4]){
   const frame=await host.frame(31,17,identity,exposure),wanted=[...[2,1,.125].map(v=>display(v,exposure)),255];checkPixels(frame.pixels,wanted);
   report.checks.push({exposure,expected:wanted,actual:Array.from(frame.pixels.slice(0,4))});
  }
  const back=await scene([0,1,0,1],6,.8);await host.setViewportMaterials([opaque,back]);
  checkPixels((await host.frame(7,9,identity,1)).pixels,[...[4,2,.25].map(v=>display(v,1)),255]);report.checks.push('Farther programmable material fails depth behind the first opaque draw');
  const updated=await scene([.125,.25,.5,1],6);await host.setViewportMaterials([opaque]);await host.updateViewportUniforms([updated.resources]);
  checkPixels((await host.frame(23,11,identity,1)).pixels,[...[.125,.25,.5].map(v=>display(v,1)),255]);report.checks.push('Uniform updates change the existing pipeline without reuploading geometry');
  await host.setViewportBackground([updated]);await host.setViewportMaterials([]);
  checkPixels((await host.frame(13,19,identity)).pixels,[32,64,128,255]);
  await host.setViewportBackground([]);checkPixels((await host.frame(13,19,identity)).pixels,[16,32,48,255]);report.checks.push('Empty foreground, background-only rendering, resize, clearing and legacy frame requests work');
  report.passed=true;
 }catch(error){report.error=String(error);throw error;}finally{host.stop();await fs.writeFile('docs/viewport-material-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
