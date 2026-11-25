import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import {VulkanHost} from '../src/main/vulkan';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {bindVulkanMaterial,type VulkanMaterialInput} from '../src/main/vulkan-material';
import {vulkanMaterialBatchBytes,vulkanMaterialSceneBytes} from '../src/core/vulkan-protocol';

async function main(){
 const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-reuse-gpu-')),host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report:any={passed:false,scope:'Actual Vulkan texture sharing, copy-on-write descriptor patches, mip sampling and scene reinstall. Analytical fixtures; original game image parity is not claimed.',checks:[]};
 try{
  report.device=await host.start();await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const compiled=await compileVulkanShaders([{stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 a_position;uniform vec2 u_shift;void main(){gl_Position=vec4(a_position+u_shift,0,1);}'},{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(binding=1) uniform sampler2D u_tex;layout(location=0) out vec4 color;void main(){color=textureLod(u_tex,vec2(.5),2);}' }],temporary);
  const texture=(color:number[])=>{const data=new Uint8Array((256*256+128*128+64*64)*4);for(let i=0;i<data.length;i+=4)data.set(color,i);return {format:'rgba8' as const,dimensions:[256,256,1] as [number,number,number],mipLevels:3,linear:true,repeat:false,data};};
  const original=texture([128,64,0,255]),input:VulkanMaterialInput={shader:'reuse-check',state:4,stride:8,vertices:new Uint8Array(Float32Array.from([-1,-1,0,-1,0,1,-1,1]).buffer),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec2',offset:0}},uniforms:{u_shift:[0,0]},textures:{u_tex:original}};
  const left=await bindVulkanMaterial(compiled,input),right=await bindVulkanMaterial(compiled,{...input,uniforms:{u_shift:[1,0]}}),binding=compiled.descriptors.find(d=>d.name==='u_tex')!.binding;
  const standaloneBytes=4+8+vulkanMaterialSceneBytes(left).length+vulkanMaterialSceneBytes(right).length,sharedBytes=vulkanMaterialBatchBytes([left,right]).length;
  assert.equal(standaloneBytes-sharedBytes,original.data.length);report.bytesSavedPerDuplicate=standaloneBytes-sharedBytes;
  const matrix=Array.from({length:16},(_,i)=>Number(i%5===0));
  const check=async(expectedLeft:number[],expectedRight:number[])=>{const {pixels}=await host.frame(32,8,matrix);for(let y=0;y<8;y++)for(let x=0;x<32;x++){const expected=x<16?expectedLeft:expectedRight;for(let c=0;c<4;c++)assert.ok(Math.abs(pixels[(y*32+x)*4+c]-expected[c])<=1);}};
  await host.setViewportBackground([left,right]);await check([128,64,0,255],[128,64,0,255]);report.checks.push('Shared large texture with original mip levels and independent transforms');
  const green=texture([0,255,0,255]),greenResource={...left.resources.find(r=>r.binding===binding)!,data:green.data};
  await host.updateViewportResources('background',[[greenResource],[]]);await check([0,255,0,255],[128,64,0,255]);report.checks.push('Updating one instance preserves another instance using the shared texture');
  await host.setViewportBackground([left,right]);await check([128,64,0,255],[128,64,0,255]);report.checks.push('Reinstalling a scene reuses the unchanged cached image');
  const blue=texture([0,0,255,255]),blueResource={...greenResource,data:blue.data};await host.updateViewportResources('background',[[blueResource],[blueResource]]);await check([0,0,255,255],[0,0,255,255]);report.checks.push('Shared patch bytes update all requested instances');
  await host.setViewportBackground([left,right]);await check([128,64,0,255],[128,64,0,255]);report.checks.push('Patched shared descriptors preserve original cached texels for future maps');
  report.passed=true;
 }finally{host.stop();await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/viewport-resource-reuse-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify(report));
}
main().catch(error=>{console.error(error);process.exitCode=1;});
