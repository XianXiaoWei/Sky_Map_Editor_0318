import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import {hardwareCloudSampling} from '../src/main/vulkan-cloud-sampling';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {bindVulkanMaterial} from '../src/main/vulkan-material';
import {VulkanHost} from '../src/main/vulkan';

async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report:any={passed:false,scope:'Actual Vulkan 3D sampling: hardware cloud adapter versus direct native textureLod, plus analytical clamp/repeat/nearest/trilinear checks. Original bytes, LOD zero and sampler modes retained; native filtering precision may differ from the exact software-reference interpolation. No Windows FPS or original-game image claim.',cases:[]};
 try{
  report.device=await host.start();
  const generated=hardwareCloudSampling(fs.readFileSync('evidence/cloud-air-vulkan/CloudFluffy0.frag','utf8'));
  const helperStart=generated.indexOf('ivec3 air_texel_coord('),sampleStart=generated.indexOf('vec4 air_sample3d('),helperEnd=generated.indexOf('\n}',sampleStart)+2,helpers=generated.slice(helperStart,helperEnd);
  const coordinates=[[0,0,0],[1,1,1],[-.125,.5,1.125],[.0625,.0625,.0625],[.1875,.5625,.9375],[.5,.5,.5],[.003,.998,.47],[1.37,-.4,.71]];
  const queries=coordinates.flatMap(uv=>[uv,[uv[0]+1,uv[1]-1,uv[2]+2]]),count=queries.length;
  const vertex={stage:'vert' as const,format:'vulkan450' as const,text:'#version 450\nlayout(location=0) in vec2 a_position;void main(){gl_Position=vec4(a_position,0,1);}'};
  for(const format of ['r8','rgba8'] as const)for(const linear of [false,true])for(const repeat of [false,true]){
   const channels=format==='r8'?1:4,bytes=Uint8Array.from({length:8*8*8*channels},(_,i)=>((i*47+Math.floor(i/channels)*13)^Math.floor(i/(8*channels)))%256);
   const scenes=[];
   for(const adapter of [false,true]){
    const fragment={stage:'frag' as const,format:'vulkan450' as const,text:`#version 450\n${adapter?helpers:''}\nlayout(binding=0) uniform Params{vec4 u_queries[${count}];};layout(binding=1) uniform sampler3D u_image;layout(location=0) out vec4 color;void main(){vec3 uv=u_queries[int(gl_FragCoord.x)].xyz;color=${adapter?`air_sample3d(u_image,uv,ivec3(0),${linear},${repeat})`:'textureLod(u_image,uv,0.0)'};}`};
    const compiled=await compileVulkanShaders([vertex,fragment]);assert.ok(compiled.success,compiled.log);
    scenes.push(await bindVulkanMaterial(compiled,{shader:'cloud-native-filter-check',state:4,stride:8,vertices:new Uint8Array(Float32Array.from([-1,-1,1,-1,1,1,-1,1]).buffer),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec2',offset:0}},uniforms:{u_queries:queries.map(uv=>[...uv,0])},textures:{u_image:{format,dimensions:[8,8,8],linear,repeat,data:bytes}},colorFormats:['rgba32f']}));
   }
   const outputs=[];
   for(const scene of scenes){await host.setMaterialScene(scene);outputs.push((await host.materialFrame(count,1)).attachments[0]);}
   assert.deepEqual(outputs[0],outputs[1],'Cloud wrapper must match direct native sampling');
   const texel=(xyz:number[],lane:number)=>{if(lane>=channels)return lane===3?1:0;const p=xyz.map(v=>repeat?((v%8)+8)%8:Math.max(0,Math.min(7,v)));return bytes[(((p[2]*8+p[1])*8+p[0])*channels)+lane]/255;};
   let maximum=0;
   for(let q=0;q<count;q++)for(let lane=0;lane<4;lane++){
    const p=queries[q].map(v=>Math.fround(v)*8-(linear?.5:0)),base=p.map(Math.floor),fraction=p.map((v,i)=>v-base[i]);let expected=0;
    if(!linear)expected=texel(base,lane);
    else for(let z=0;z<2;z++)for(let y=0;y<2;y++)for(let x=0;x<2;x++){const d=[x,y,z],weight=d.reduce((n,v,i)=>n*(v?fraction[i]:1-fraction[i]),1);expected+=texel(base.map((v,i)=>v+d[i]),lane)*weight;}
    const difference=Math.abs(outputs[1][q*4+lane]-expected);maximum=Math.max(maximum,difference);assert.ok(difference<=(linear?3/255:1e-6),`${format}/${linear}/${repeat}: analytical difference ${difference}`);
   }
   report.cases.push({format,linear,repeat,samples:count,nativeAdapterDifferences:0,maxAnalyticalDifference:maximum});
  }
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/cloud-hardware-filter-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify(report));
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
