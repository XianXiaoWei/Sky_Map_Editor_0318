import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';
import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';
import {createVulkanTemporalAA} from '../src/main/vulkan-temporal-aa';
import {sampledVulkanTarget} from '../src/main/vulkan-target';
import {cloudRenderGraph} from '../src/core/cloud-render-graph';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const width=96,height=64,graph=cloudRenderGraph(width,height);
const color=(phase:number)=>Float32Array.from({length:width*height*4},(_,i)=>{const p=Math.floor(i/4),x=p%width,y=Math.floor(p/width);if(i%4===3)return 1;if(x<32)return [.125,.25,.5][i%4];return .25+.4*((Math.imul(x+1,1664525)^Math.imul(y+31,1013904223))&255)/255*(phase?-.5:1)+(phase?.3:0);});
const texture=(values:Float32Array)=>({format:'rgba32f' as const,dimensions:[width,height,1] as [number,number,number],linear:true,repeat:false,data:new Uint8Array(values.buffer)});
const differences=(a:Float32Array,b:Float32Array)=>{let sum=0,n=0;for(let y=8;y<height-8;y++)for(let x=40;x<width-8;x++)for(let lane=0;lane<3;lane++){sum+=Math.abs(a[(y*width+x)*4+lane]-b[(y*width+x)*4+lane]);n++;}return sum/n;};
async function main(){const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Original MotionGen/MotionDilate/TemporalAa GLSL on production Vulkan resolver. Explicit stationary cloud motion, asymmetric image/flat region, camera cut, preserved half infinity and target-size reset. Centered scene jitter; excludes Metal and complete moving-model list.'};
 try{report.device=await host.start();const temporal=createVulkanTemporalAA(new AssetCatalog(data),host,'/tmp/sky-temporal-test-shaders');
  const cloud=Float32Array.from({length:width/2*height/2*4},(_,i)=>i%4===0?1280:i%4===3?1:0),cloudB=sampledVulkanTarget(graph.targets.cloudB,cloud);
  const depth=sampledVulkanTarget(graph.targets.depthHalfMin,Float32Array.from({length:width/2*height/2*4},(_,i)=>i%4<2?1:0));
  const uniforms={u_eyePos:[0,0,0],u_viewportSize:[width,height],u_projPlaneU:[2,0,0],u_projPlaneV:[0,2,0],u_projPlaneOrigin:[-1,-1,-1],u_jitter:[0,0],u_viewProjOld:[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]};
  const first=color(0),second=color(1),a=await temporal.resolve(width,height,uniforms,{color:texture(first),cloudB,depthHalfMin:depth}),b=await temporal.resolve(width,height,uniforms,{color:texture(second),cloudB,depthHalfMin:depth});
  assert.equal(a.cameraCut,true);assert.equal(b.cameraCut,false);
  let maxCutError=0,flatMismatches=0,motionMismatches=0;
  for(let i=0;i<first.length;i++)if(i%4!==3)maxCutError=Math.max(maxCutError,Math.abs(first[i]-a.resolved[i]));
  for(let y=8;y<height-8;y++)for(let x=8;x<24;x++)for(let c=0;c<3;c++){const i=(y*width+x)*4+c;if(b.resolved[i]!==second[i])flatMismatches++;}
  for(let i=0;i<a.motion.length;i+=4)if(a.motion[i]!==0||a.motion[i+1]!==0||a.motion[i+2]!==10||Math.abs(a.motion[i+3]-.0002)>1e-6)motionMismatches++;
  const rawDifference=differences(first,second),resolvedDifference=differences(a.resolved,b.resolved);
  report.checks={maxCutError,flatMismatches,motionMismatches,rawFrameDifference:rawDifference,resolvedFrameDifference:resolvedDifference};
  assert.ok(maxCutError<.001);assert.equal(flatMismatches,0);assert.equal(motionMismatches,0);assert.ok(resolvedDifference<rawDifference*.6);
  const cut=await temporal.resolve(width,height,uniforms,{color:texture(second),cloudB,depthHalfMin:depth},true);let explicitCutError=0;for(let i=0;i<second.length;i++)if(i%4!==3)explicitCutError=Math.max(explicitCutError,Math.abs(second[i]-cut.resolved[i]));assert.ok(explicitCutError<.001);
  // Infinite half motion must reach the original +/- .5 clamp and remain
  // finite in the MotionGen output and subsequent TAA resolve.
  for(let i=0;i<cloud.length;i+=4){cloud[i+1]=Infinity;cloud[i+2]=-Infinity;}
  const overflow=await temporal.resolve(width,height,uniforms,{color:texture(second),cloudB:sampledVulkanTarget(graph.targets.cloudB,cloud,{infinityChannels:[1,2]}),depthHalfMin:depth},true);assert.ok(overflow.resolved.every(Number.isFinite));for(let i=0;i<overflow.motion.length;i+=4){assert.equal(overflow.motion[i],512);assert.equal(overflow.motion[i+1],-512);}
  temporal.reset();const reset=await temporal.resolve(width,height,uniforms,{color:texture(first),cloudB,depthHalfMin:depth});assert.equal(reset.cameraCut,true);assert.equal(reset.frames,1);
  report.checks={maxCutError,explicitCutError,flatMismatches,motionMismatches,rawFrameDifference:rawDifference,resolvedFrameDifference:resolvedDifference,overflowMotionClampPassed:true,historyResetPassed:true};report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/temporal-aa-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
