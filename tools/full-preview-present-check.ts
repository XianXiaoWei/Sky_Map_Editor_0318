import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {VulkanHost} from '../src/main/vulkan';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {bindVulkanMaterial,type VulkanMaterialInput} from '../src/main/vulkan-material';

async function main(){
 const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-full-present-')),capture=path.join(temporary,'frame.rgba');
 process.env.SKY_SURFACE_CAPTURE=capture;
 const surface=new VulkanHost(path.resolve('dist/native/sky-vulkan-surface-test')),reference=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report:any={passed:false,scope:'Shared final-material GPU presentation and persistent effect slots on Linux/XCB. Synthetic controlled linear output verifies transfer, orientation, mutable textures/uniforms and restart; not full-game images or Windows hardware FPS.',frames:[],nativeReplyBytes:20,finalRgbaReadbacks:0};
 try{
  const devices=await Promise.all([surface.start(),reference.start()]);assert.equal(devices[0].nativeSurface,true);report.devices=devices;
  const compiled=await compileVulkanShaders([{stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 pos;layout(location=0) out vec2 uv;void main(){uv=pos*.5+.5;gl_Position=vec4(pos,0,1);}'},{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(binding=0) uniform sampler2D color;layout(binding=1) uniform Params{float gain;};layout(location=0) in vec2 uv;layout(location=0) out vec4 outputColor;void main(){outputColor=vec4(texture(color,uv).rgb*gain,1);}'}],temporary);
  const data=new Float32Array([.9,.1,.2,1,.1,.8,.3,1,.2,.3,.9,1,.8,.7,.2,1]);
  const input:VulkanMaterialInput={shader:'full-present-test',state:4,stride:8,vertices:new Uint8Array(Float32Array.from([-1,-1,1,-1,1,1,-1,1]).buffer),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{pos:{format:'vec2',offset:0}},uniforms:{gain:1},textures:{color:{format:'rgba32f',dimensions:[2,2,1],linear:false,repeat:false,data:new Uint8Array(data.buffer)}},colorFormats:['rgba32f']};
  for(const [step,[width,height]] of [[320,180],[480,270],[320,180]].entries()){
   if(step===1)input.uniforms.gain=.5;
   if(step===2){data[0]=.05;data[1]=.9;input.uniforms.gain=.8;}
   const scene=await bindVulkanMaterial(compiled,input);await reference.setMaterialScene(scene);const expected=(await reference.materialFrame(width,height)).attachments[0];
   await surface.setWindowBounds({x:0,y:0,width,height,visible:true});await surface.setCachedMaterialScene(scene);
   // A render fence completes before X11 necessarily displays that image.
   // Repeat the unchanged state before capturing the external window, as in
   // the existing swapchain oracle; do not read the first queued black frame.
   for(let i=0;i<4;i++){const frame=await surface.presentMaterialFrame(width,height);assert.equal(frame.surface,true);assert.equal(frame.presented,true);assert.equal(frame.pixels.length,0);}
   const actual=fs.readFileSync(capture);assert.equal(actual.length,width*height*4);
   let bad=0,max=0;for(let i=0;i<actual.length;i++){
    const linear=Math.min(1,Math.max(0,expected[i])),display=linear<=.0031308?12.92*linear:1.055*Math.pow(linear,1/2.4)-.055;
    const value=i%4===3?255:Math.round(display*255),difference=Math.abs(actual[i]-value);if(difference>2)bad++;max=Math.max(max,difference);
   }
   report.frames.push({width,height,components:actual.length,mismatchesOver2:bad,maxDifference:max,actualFirst:Array.from(actual.subarray(0,16)),referenceFirst:Array.from(expected.subarray(0,16)),cache:surface.materialCacheInfo()});
   if(bad){fs.writeFileSync('/root/sky-research/full-present-failure.rgba',actual);fs.writeFileSync('/root/sky-research/full-present-failure-float.bin',new Uint8Array(expected.buffer));}
   assert.equal(bad,0,'Final material pixels, placement and transfer must match uncached GPU output');
  }
  assert.deepEqual(surface.materialCacheInfo(),{slots:1,setups:1,patches:2,capacity:16});
  surface.stop();await surface.start();assert.equal(surface.materialCacheInfo().slots,0);
  const scene=await bindVulkanMaterial(compiled,input);await surface.setCachedMaterialScene(scene);assert.equal((await surface.presentMaterialFrame(320,180)).presented,true);report.restartVerified=true;report.passed=true;
 }finally{surface.stop();reference.stop();fs.writeFileSync('docs/full-preview-present-check.json',JSON.stringify(report,null,2)+'\n');fs.rmSync(temporary,{recursive:true,force:true});}
 console.log(JSON.stringify(report));
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
