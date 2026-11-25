import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {ObjectsDocument} from '../src/core/objects';
import {AssetCatalog} from '../src/main/assets';
import {VulkanHost} from '../src/main/vulkan';
import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {cameraSampling,jitterViewProjection} from '../src/core/camera-sampling';
import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',input=JSON.parse(fs.readFileSync('tests/fixtures/material-degenerate-uv-input.json','utf8'));
const bytes=fs.readFileSync(path.join(data,'Levels',input.level,'Objects.level.bin'));assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'),input.sourceObjectsSha256);
const nodes=new ObjectsDocument(bytes).nodes,catalog=new AssetCatalog(data,input.level),program=catalog.program(input.shader),hash=(b:string|Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
async function check(executable:string){
 const host=new VulkanHost(executable),report:any={executableSha256:hash(fs.readFileSync(executable)),samplers:[]};
 let bound:VulkanMaterialScene[]=[];const renderer=createVulkanBakedRenderer(input.level,nodes,catalog,host,'/tmp/sky-material-degenerate-shaders');
 const capture=host.setViewportMaterials.bind(host);host.setViewportMaterials=async scenes=>{bound=scenes;await capture(scenes);};
 try{
  report.device=await host.start();renderer.setDraws([{shader:input.shader,materialIndex:input.materialIndex,stride:input.stride,state:input.state,vertices:Buffer.from(input.vertices,'base64'),indices:Uint32Array.from(input.indices)}]);
  const matrix=jitterViewProjection(input.matrix,cameraSampling(0,input.width,input.height).projectionShift);
  await renderer.render(input.width,input.height,matrix,input.cameraMatrix);
  let baseline:Float32Array|undefined;
  for(const requested of [1,2,4,8,16]){
   await host.setMaterialScene({...bound[0],resources:bound[0].resources.map(r=>r.kind&&r.anisotropy!>1?{...r,anisotropy:requested}:r)});
   const values=(await host.materialFrame(input.width,input.height)).attachments[0],bad:number[]=[];
   for(let i=0;i<values.length;i++)if(i%4<3&&!Number.isFinite(values[i]))bad.push(i);
   if(requested===1)baseline=values;
   const sameAsTrilinear=Buffer.from(values.buffer).equals(Buffer.from(baseline!.buffer));
   report.samplers.push({requested,nonfiniteRGB:bad.length,sameAsTrilinear,samples:[[127,274],[131,276],[136,279],[137,280]].map(([x,y])=>({x,y,rgba:Array.from(values.slice((y*input.width+x)*4,(y*input.width+x)*4+4)).map(v=>Number.isFinite(v)?v:String(v))}))});
  }
  report.material=renderer.info();return report;
 }finally{host.stop();}
}
async function main(){
 const current=await check(path.resolve('dist/native/sky-vulkan')),baseline=process.env.SKY_MATERIAL_BASELINE?await check(process.env.SKY_MATERIAL_BASELINE):undefined;
 assert.ok(current.samplers.every((s:any)=>s.nonfiniteRGB===0));
 if(current.device.samplerAnisotropyPolicy==='llvmpipe-trilinear')assert.ok(current.samplers.every((s:any)=>s.sameAsTrilinear));
 if(baseline)assert.ok(baseline.samplers.slice(1).every((s:any)=>s.nonfiniteRGB===12));
 const report={passed:true,scope:'Three reduced original DayHubCave terrain triangles at the captured failing camera, unchanged RockFace5347/Terrain5347 sources and real material PNG/mips. Raw GPU RGB is checked before display conversion; no NaN replacement or shader arithmetic edits.',sourceVertexSha256:hash(program.vertexSource),sourceFragmentSha256:hash(program.fragmentSource),baseline,current,completeOriginalGameRuntime:false};
 fs.writeFileSync('docs/material-degenerate-uv-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:true,current:current.samplers.map((s:any)=>[s.requested,s.nonfiniteRGB]),baseline:baseline?.samplers.map((s:any)=>[s.requested,s.nonfiniteRGB])}));
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
