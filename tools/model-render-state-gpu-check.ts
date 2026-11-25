import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';
import {VulkanHost} from '../src/main/vulkan';import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {bindVulkanMaterial} from '../src/main/vulkan-material';
import {viewportBasicMaterialSources} from '../src/main/viewport-basic-material';
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Production Vulkan material pipelines: transparent RGB/alpha, first-two-attachment blend, later attachment overwrite, backface culling, depth test/write and no decal bias. Synthetic shaders isolate descriptor state; original Metal/GPU and Scene sorting remain unverified.',checks:[]};
 try{report.device=await host.start();const compiled=await compileVulkanShaders([
  {stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec3 a_position;void main(){gl_Position=vec4(a_position.x,-a_position.y,a_position.z,1);}'},
  {stage:'frag',format:'vulkan450',text:'#version 450\nlayout(set=0,binding=0) uniform Data {vec4 color;};layout(location=0) out vec4 first;layout(location=1) out vec4 second;layout(location=2) out vec4 third;void main(){first=color;second=color;third=color;}'}
 ],'/tmp/sky-model-render-state-shaders');
 const scene=async(state:number,color:number[],depth=.5,reverse=false)=>bindVulkanMaterial(compiled,{shader:'state-fixture',state,stride:12,vertices:new Uint8Array(new Float32Array([-.8,-.8,depth,.8,-.8,depth,0,.8,depth]).buffer),indices:Uint32Array.from(reverse?[2,1,0]:[0,1,2]),attributes:{a_position:{format:'vec3',offset:0}},uniforms:{color},textures:{}});
 const check=async(name:string,scenes:Awaited<ReturnType<typeof scene>>[],expected:number[][])=>{await host.setMaterialBatch(scenes);const frame=await host.materialFrame(32,32),at=(16*32+16)*4;const colors=frame.attachments.map(a=>Array.from(a.slice(at,at+4)));for(let i=0;i<colors.length;i++)for(let lane=0;lane<4;lane++)assert.ok(Math.abs(colors[i][lane]-expected[i][lane])<1e-5,`${name} attachment ${i} lane ${lane}: ${colors[i][lane]} != ${expected[i][lane]}`);report.checks.push({name,colors,expected});};
 const base=await scene(0,[1,0,0,.25],.7),green=[0,1,0,.5],blend=[.5,.5,0,.625];
 await check('skybox-rgb-preserves-distance',[base,await scene(11,green,.3)],[[.5,.5,0,.25],green,green]);
 await check('skybox-no-depth-write',[base,await scene(11,green,.3),await scene(0,[0,0,1,1],.5)],[[0,0,1,1],[0,0,1,1],[0,0,1,1]]);
 await check('skybox-depth-test',[base,await scene(11,green,.9)],[[1,0,0,.25],[1,0,0,.25],[1,0,0,.25]]);
 await check('skybox-backfaces',[base,await scene(11,green,.3,true)],[[1,0,0,.25],[1,0,0,.25],[1,0,0,.25]]);
 for(const state of [9,10]){
  await check('transparent-'+state,[base,await scene(state,green,.3)],[blend,blend,green]);
  await check('depth-test-'+state,[base,await scene(state,green,.9)],[[1,0,0,.25],[1,0,0,.25],[1,0,0,.25]]);
  await check('no-depth-write-'+state,[base,await scene(state,green,.3),await scene(0,[0,0,1,1],.5)],[[0,0,1,1],[0,0,1,1],[0,0,1,1]]);
  await check('backfaces-'+state,[base,await scene(state,green,.3,true)],state===9?[[1,0,0,.25],[1,0,0,.25],[1,0,0,.25]]:[blend,blend,green]);
 }
 await check('alpha-test-opaque-depth-write',[base,await scene(6,[0,1,0,1],.3,true),await scene(0,[0,0,1,1],.5)],[[0,1,0,1],[0,1,0,1],[0,1,0,1]]);
 // Original transparent shaders write color and logarithmic depth to their
 // own targets. They must test the opaque depth without changing RGBDepth.
 const vertex={stage:'vert' as const,format:'vulkan450' as const,text:'#version 450\nlayout(location=0) in vec3 a_position;void main(){gl_Position=vec4(a_position.x,-a_position.y,a_position.z,1);}'};
 const opaqueProgram=await compileVulkanShaders([vertex,{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) out vec4 color;void main(){color=vec4(1,0,0,7);}'}],'/tmp/sky-model-render-state-shaders');
 const alphaProgram=await compileVulkanShaders([vertex,{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(set=0,binding=0) uniform Data {vec4 color;};layout(location=0) out vec4 first;layout(location=1) out vec4 second;void main(){first=color;second=vec4(256,0,0,color.a);}'}],'/tmp/sky-model-render-state-shaders');
 const viewScene=async(program:typeof opaqueProgram,state:number,depth:number,color:number[])=>bindVulkanMaterial(program,{shader:'shared-depth-fixture',state,stride:12,vertices:new Uint8Array(new Float32Array([-.8,-.8,depth,.8,-.8,depth,0,.8,depth]).buffer),indices:Uint32Array.from([0,1,2]),attributes:{a_position:{format:'vec3',offset:0}},uniforms:{color},textures:{}});
 const matrix=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});await host.setViewportMaterials([await viewScene(opaqueProgram,0,.5,[1,0,0,1])]);
 const alphaCheck=async(name:string,size:number,scenes:Awaited<ReturnType<typeof scene>>[],expected:number[][])=>{
  await host.setViewportAlpha(scenes);const opaque=await host.viewportHDR(size,size,matrix),frame=await host.viewportAlpha(size,size),at=(Math.floor(size/2)*size+Math.floor(size/2))*4;
  assert.deepEqual(Array.from(opaque.attachments[0].slice(at,at+4)),[1,0,0,7]);const colors=frame.attachments.map(a=>Array.from(a.slice(at,at+4)));
  for(let i=0;i<2;i++)for(let lane=0;lane<4;lane++)assert.ok(Math.abs(colors[i][lane]-expected[i][lane])<1e-5,`${name} attachment ${i} lane ${lane}`);
  report.checks.push({name,colors,expected,opaqueRGBDepth:[1,0,0,7]});
 };
 await alphaCheck('separate-alpha-occluded',32,[await viewScene(alphaProgram,9,.7,green)],[[0,0,0,0],[0,0,0,0]]);
 await alphaCheck('separate-alpha-visible',32,[await viewScene(alphaProgram,9,.3,green)],[[0,.5,0,.5],[128,0,0,.5]]);
 await alphaCheck('separate-alpha-retains-opaque-depth',32,[await viewScene(alphaProgram,9,.2,[1,0,0,.5]),await viewScene(alphaProgram,9,.4,green)],[[.25,.5,0,.75],[192,0,0,.75]]);
 await alphaCheck('separate-alpha-resize',48,[await viewScene(alphaProgram,10,.3,green)],[[0,.5,0,.5],[128,0,0,.5]]);
 await alphaCheck('separate-alpha-clear',48,[],[[0,0,0,0],[0,0,0,0]]);
 await host.setViewportAlpha([await viewScene(alphaProgram,9,.2,[1,0,0,.5]),await viewScene(alphaProgram,9,.4,green)]);
 await host.setViewportDrawOrder([0],[1,0]);
 const reordered=await host.viewportAlpha(48,48),middle=(24*48+24)*4;
 assert.deepEqual(Array.from(reordered.attachments[0].slice(middle,middle+4)),[.5,.25,0,.75]);
 await host.setViewportDrawOrder([0],[0,1]);
 const restored=await host.viewportAlpha(48,48);assert.deepEqual(Array.from(restored.attachments[0].slice(middle,middle+4)),[.25,.5,0,.75]);
 report.checks.push({name:'alpha-order-without-geometry-or-texture-upload',reversed:[.5,.25,0,.75],restored:[.25,.5,0,.75]});
 const quadVertex={stage:'vert' as const,format:'vulkan450' as const,text:'#version 450\nlayout(location=0) in vec2 a_position;layout(location=0) out vec2 uv;void main(){uv=(a_position+1)*.5;gl_Position=vec4(a_position,0,1);}'};
 const fogProgram=await compileVulkanShaders([quadVertex,{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 uv;layout(location=0) out vec4 color;uniform sampler2D opaqueTex;uniform sampler2D alphaTex;uniform sampler2D alphaDepth;void main(){vec4 a=texture(alphaTex,uv);color=vec4(texture(opaqueTex,uv).rgb*(1-a.a)+a.rgb,1)+texture(alphaDepth,uv)*0.00000001;}'}],'/tmp/sky-model-render-state-shaders');
 const toneProgram=await compileVulkanShaders([quadVertex,{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 uv;layout(location=0) out vec4 color;uniform sampler2D sceneTex;void main(){color=texture(sceneTex,uv);}'}],'/tmp/sky-model-render-state-shaders');
 const zero={format:'rgba32f' as const,dimensions:[1,1,1] as [number,number,number],linear:false,repeat:false,data:new Uint8Array(16)};
 const quad=async(program:typeof fogProgram,textures:any)=>bindVulkanMaterial(program,{shader:'gpu-composition-fixture',state:4,stride:8,vertices:new Uint8Array(Float32Array.from([-1,-1,1,-1,1,1,-1,1]).buffer),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec2',offset:0}},uniforms:{},textures,colorFormats:['rgba32f']});
 const binding=(p:typeof fogProgram,name:string)=>p.descriptors.find(d=>d.name===name)!.binding;
 await host.setFastComposition(await quad(fogProgram,{opaqueTex:zero,alphaTex:zero,alphaDepth:zero}),await quad(toneProgram,{sceneTex:zero}),[binding(fogProgram,'opaqueTex'),binding(fogProgram,'alphaTex'),binding(fogProgram,'alphaDepth'),binding(toneProgram,'sceneTex')]);
 const display=(v:number)=>Math.round(255*(v<=.0031308?12.92*v:1.055*v**(1/2.4)-.055));
 for(const size of [48,32,64]){
  const frame=await host.frame(size,size,matrix,undefined,true),at=(Math.floor(size/2)*size+Math.floor(size/2))*4;
  const rgb=Array.from(frame.pixels.slice(at,at+4));assert.deepEqual(rgb,[display(.5),display(.5),0,255]);
  report.checks.push({name:'GPU-resident-opaque-alpha-composition-'+size,pixel:rgb});
 }
 await host.setViewportAlpha([]);
 const clear=await host.frame(32,32,matrix,undefined,true);assert.deepEqual(Array.from(clear.pixels.slice((16*32+16)*4,(16*32+16)*4+4)),[255,0,0,255]);
 report.checks.push({name:'GPU-composition-clears-alpha-borrowed-target',pixel:[255,0,0,255]});
 await host.setViewportDrawVisibility([false],[]);const hidden=await host.frame(32,32,matrix,undefined,true);
 const background=[display(16/255),display(32/255),display(48/255),255];
 assert.deepEqual(Array.from(hidden.pixels.slice((16*32+16)*4,(16*32+16)*4+4)),background);
 await host.setViewportDrawVisibility([true],[]);const shown=await host.frame(32,32,matrix,undefined,true);
 assert.deepEqual(Array.from(shown.pixels.slice((16*32+16)*4,(16*32+16)*4+4)),[255,0,0,255]);
 report.checks.push({name:'graphics-visibility-reuses-geometry-and-restores-target',hidden:background,shown:[255,0,0,255]});
 for(const model of [false,true])for(const transparent of [false,true]){
  const basic=await compileVulkanShaders(viewportBasicMaterialSources(model,transparent),'/tmp/sky-model-render-state-shaders'),stride=model?48:40,vertices=new Uint8Array(stride*3),view=new DataView(vertices.buffer);
  [[-.8,-.8,.5],[.8,-.8,.5],[0,.8,.5]].forEach((p,i)=>{p.forEach((v,j)=>view.setFloat32(i*stride+j*4,v,true));vertices.set([0,127,0,0],i*stride+(model?16:12));if(model)vertices.set([255,128,64,255],i*stride+12);else{vertices.set([0,0,0,0],i*stride+16);vertices.set([255,0,0,0],i*stride+20);}});
  const attributes: Parameters<typeof bindVulkanMaterial>[1]['attributes']=model?{a_position:{format:'vec3' as const,offset:0},a_normal:{format:'snorm4' as const,offset:16},a_color:{format:'unorm4' as const,offset:12}}:{a_position:{format:'vec3' as const,offset:0},a_normal:{format:'snorm4' as const,offset:12},a_material0:{format:'unorm4' as const,offset:16},a_material1:{format:'unorm4' as const,offset:20}};
  const scene=await bindVulkanMaterial(basic,{shader:'basic-fixture',stride,vertices,indices:Uint32Array.from([0,1,2]),state:transparent?10:6,attributes,uniforms:{u_viewProj:matrix,u_model:matrix,u_color:[1,1,1,1],u_eyePos:[0,0,0],u_materialId:0,u_opaque:true},textures:{}});
  assert.ok(scene.resources.every(r=>r.kind===0),'Basic graphics must not allocate original material textures');
  await host.setMaterialScene(scene);const frame=await host.materialFrame(32,32),pixel=Array.from(frame.attachments[0].slice((16*32+16)*4,(16*32+16)*4+3)),expected=model?[1,128/255,64/255]:[1,1,1];
  pixel.forEach((v,i)=>assert.ok(Math.abs(v-expected[i])<1e-4));assert.equal(frame.attachments.length,transparent?2:1);
  report.checks.push({name:`basic-packed-${model?'model':'terrain'}-${transparent?'alpha':'opaque'}`,pixel,textureAllocations:0});
 }
 report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/model-render-state-gpu-check.json',JSON.stringify(report,null,2)+'\n');}console.log(JSON.stringify({passed:report.passed,checks:report.checks.length}));
}void main().catch(e=>{console.error(e);process.exitCode=1;});
