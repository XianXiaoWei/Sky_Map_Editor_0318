import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import { AssetCatalog } from '../src/main/assets';
import { VulkanHost } from '../src/main/vulkan';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial,type VulkanMaterialInput } from '../src/main/vulkan-material';
import { bottomUpVulkanTarget } from '../src/main/vulkan-target';
import { imageMipChain } from '../src/core/image-mips';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const width=128,height=96,quad=new Uint8Array(Float32Array.from([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]).buffer);
const base={stride:16,vertices:quad,indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec2' as const,offset:0},a_uv:{format:'vec2' as const,offset:8}},state:4,colorFormats:['rgba32f' as const],uniforms:{u_viewportSize:[width,height],u_projPlaneU:[2,0,0],u_projPlaneV:[0,2,0],u_projPlaneOrigin:[-1,-1,-1],u_jitter:[0,0]}};
const roughness=(values:Float32Array)=>{let energy=0,count=0;for(let y=8;y<height-8;y++)for(let x=64;x<width-8;x++){const i=(y*width+x)*4,lap=4*values[i]-values[i-4]-values[i+4]-values[i-width*4]-values[i+width*4];energy+=lap*lap;count++;}return energy/count;};
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Production Vulkan sampler and original Fxaa GLES fragment with existing fullscreen adapter. Explicit high-frequency/flat test images; real-map checks tracked separately. PNG mip preview generation and 16x anisotropy request are not original exporter/Metal parity.',samplers:[]};
 try{
  report.device=await host.start();const catalog=new AssetCatalog(data),sources=[{stage:'vert' as const,text:catalog.program('FogUpsample').vertexSource,coordinates:'opengl' as const},{stage:'frag' as const,text:catalog.program('Fxaa').fragmentSource,coordinates:'opengl' as const}],fxaa=await compileVulkanShaders(sources);
  const pixels=Float32Array.from({length:width*height*4},(_,i)=>{const p=Math.floor(i/4),x=p%width,y=Math.floor(p/width);return i%4===3?1:x<32?[.125,.25,.5][i%4]:.25+((Math.imul(x+1,1664525)^Math.imul(y+31,1013904223))&255)/1024;});
  const texture:VulkanMaterialInput['textures'][string]={format:'rgba32f',dimensions:[width,height,1],linear:true,repeat:false,data:new Uint8Array(pixels.buffer)};
  await host.setMaterialScene(await bindVulkanMaterial(fxaa,{...base,shader:'Fxaa',textures:{u_texColor:bottomUpVulkanTarget(texture)}}));const filtered=(await host.materialFrame(width,height)).attachments[0];
  const before=roughness(pixels),after=roughness(filtered);let flatMismatches=0;for(let y=8;y<height-8;y++)for(let x=8;x<24;x++)for(let c=0;c<3;c++){const i=(y*width+x)*4+c;if(filtered[i]!==pixels[i])flatMismatches++;}
  report.fxaa={beforeLaplacianEnergy:before,afterLaplacianEnergy:after,flatMismatches};assert.equal(flatMismatches,0);assert.ok(after<before*.8,'Original FXAA should reduce the explicit noise fixture');
  const sampler=await compileVulkanShaders([{stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 a_position;layout(location=1) in vec2 a_uv;layout(location=0) out vec2 uv;void main(){uv=a_uv;gl_Position=vec4(a_position.x,-a_position.y,0,1);}'},{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 uv;layout(location=0) out vec4 color;layout(set=0,binding=0) uniform sampler2D image;void main(){color=textureGrad(image,uv*vec2(32.137,2),vec2(32.137/128,0),vec2(0,2.0/96));}'}]);
  const texels=Uint8Array.from({length:64*64*4},(_,i)=>{const p=Math.floor(i/4),x=p%64,y=Math.floor(p/64);return i%4===3?255:Math.round((.1+.2*(x%2)+.6*(Math.floor(y/16)%2))*255);});
  for(const [name,mips,anisotropy] of [['base-only',false,1],['trilinear-mips',true,1],['anisotropic-mips',true,16]] as const){
   const texture:VulkanMaterialInput['textures'][string]={format:'rgba8',dimensions:[64,64,1],linear:true,repeat:true,anisotropy,...imageMipChain(64,64,texels,false,mips)};
   await host.setMaterialScene(await bindVulkanMaterial(sampler,{...base,shader:'SamplerProbe',textures:{image:texture}}));const values=(await host.materialFrame(width,height)).attachments[0];let variance=0;
   for(let y=8;y<height-8;y++){let mean=0;for(let x=8;x<width-8;x++)mean+=values[(y*width+x)*4]/(width-16);for(let x=8;x<width-8;x++)variance+=(values[(y*width+x)*4]-mean)**2/((width-16)*(height-16));}
   report.samplers.push({name,mipLevels:texture.mipLevels,anisotropy,horizontalVariance:variance});assert.ok(values.every(Number.isFinite));
  }
  assert.ok(report.samplers[1].horizontalVariance<report.samplers[0].horizontalVariance*.1,'Mip chain should suppress unresolved X texture detail');
  assert.ok(report.samplers[2].horizontalVariance<report.samplers[0].horizontalVariance*.1,'Anisotropy request should retain mip filtering');
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/viewport-filter-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
