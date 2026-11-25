import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import { AssetCatalog } from '../src/main/assets';
import { MeshesDocument } from '../src/core/meshes';
import { cloudRenderGraph } from '../src/core/cloud-render-graph';
import { VulkanHost } from '../src/main/vulkan';
import { compileVulkanShaders, type VulkanShaderCompilation } from '../src/main/vulkan-shaders';
import { vulkanProgramSources } from '../src/main/vulkan-program';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { sampledVulkanTarget, bottomUpVulkanTarget } from '../src/main/vulkan-target';
import { renderVulkanCloudDepth, type DepthShader } from '../src/main/vulkan-depth';
import { viewportCloudStage } from '../src/main/vulkan-cloud-coordinates';

// Compare each spatial region against independent all-near/all-far GPU frames
// at the same pixel. This catches scaling and row errors without a CPU shader
// approximation. Actual depth AIR + cloud AIR and real level atlases/noise.
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
type Texture = VulkanMaterialInput['textures'][string];
const constant = (rgba: number[]): Texture => ({ format: 'rgba32f', dimensions: [1,1,1], linear: false, repeat: false, data: new Uint8Array(Float32Array.from(rgba).buffer) });
const quad = new Uint8Array(Float32Array.from([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]).buffer);
const indices = Uint32Array.from([0,1,2,0,2,3]);
async function main() {
 const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 const report: any = { passed: false, scope: 'Asymmetric screen occlusion through production depth chain and cloud stage bindings. Original AIR stages, real Dawn atlases/noise, explicit synthetic camera/quad/light/depth. GPU uniform-near/far references at corresponding pixels, all four occluder quadrants, even and odd dimensions. Controlled incorrect bindings must produce spatial mismatches. Original Metal/game parity excluded.', cases: [], controlledMutations: [] };
 try {
  report.device = await host.start();
  const catalog = new AssetCatalog(data), mesh = new MeshesDocument(fs.readFileSync(path.join(data,'Levels/Dawn/BstBaked.meshes'))), volume = mesh.cloudVolume()!;
  const n = volume.distanceResolution;
  let minimum = -1;
  for (let i=0; i<volume.distance.length; i++) {
   const x=i%n, y=Math.floor(i/n)%n, z=Math.floor(i/n**2)%n;
   if (x && y && z && x<n-1 && y<n-1 && z<n-1 && (minimum<0 || volume.distance[i]<volume.distance[minimum])) minimum=i;
  }
  const block=Math.floor(minimum/n**3), voxel=minimum%n**3, xyz=[voxel%n,Math.floor(voxel/n)%n,Math.floor(voxel/n**2)%n];
  const point=volume.origin.map((v,i)=>(v+volume.coordinates[block*3+i])*16+(xyz[i]+.5)*16/n);
  const names: Record<string,string> = { CloudSparseGrid:'u_cloudSparse', CloudPackedDistGrid:'u_cloudDist', CloudPackedAmb0Grid:'u_cloudAmb0', CloudPackedAmb1Grid:'u_cloudAmb1', CloudPackedAmb2Grid:'u_cloudAmb2' };
  const textures: Record<string,Texture> = { u_cloudNoise3D:catalog.cloudNoise(), u_waterSim:constant([0,0,0,0]), u_texPerturb:constant([.5,.5,0,1]), u_texBlueNoise:constant([.25,.5,.75,1]), u_cloudTTex:constant([0,0,0,0]), u_cloudCoarseTTex:constant([0,0,0,0]), u_alphaTex:constant([1,1,1,1]) };
  for (const t of volume.textures) textures[names[t.name]]={ format:t.channels===1?'r8':'rgba8',dimensions:t.dimensions,linear:t.name!=='CloudSparseGrid',repeat:false,data:t.data };
  const matrix=[1,0,0,0,0,1,0,0,0,0,1,0,-point[0],-point[1],1-point[2],10];
  const u: Record<string,unknown> = { ...volume.bindings, u_eyePos:[point[0],point[1],point[2]-32], u_projPlaneU:[.125,0,0],u_projPlaneV:[0,.125,0],u_projPlaneOrigin:[-.0625,-.0625,1],u_jitter:[0,0],u_jitterHalf:[0,0],u_sunDir:[0,-1,0],u_sunColor:[1,.9,.8],u_averageSkyColor:[.2,.3,.4],u_pointLight:[0,0,0],u_time:0,u_waterSimTerms:[0,0,0,0],u_randomOffset:[0,0,0],u_cloudWindMove:[0,0,0],u_cloudWindScroll:[0,0,0],u_cloudMat:[.6,.7,.8,mesh.cloud!.sunOcclusionScale],u_cloudNoiseTweaks:[.75,-10,4,0],u_cloudUndulationScale:0,u_localAvatarPos:[1000,1000,1000],u_viewProj:matrix,u_viewProjOld:matrix };
  const cardVertices:number[]=[];
  for (const [x,y] of [[-1,-1],[1,-1],[1,1],[-1,1]]) cardVertices.push(point[0]+x*10,point[1]+y*10,point[2],0,0,1,1,(x+1)/2,(y+1)/2,0,0,.5,.5,.5,1,.2,.3,.5,.1);
  const shaders:Record<string,VulkanShaderCompilation>={};
  for (const name of ['DepthDownsample','DepthDownsampleGather','DepthDownsampleQuarter','CloudFluffySuperCoarse','CloudFluffyCoarse','CloudFluffy','CloudCard']) shaders[name]=await compileVulkanShaders(vulkanProgramSources(catalog.program(name)));
  for (const [width,height] of [[128,96],[127,95]]) {
   const graph=cloudRenderGraph(width,height),[halfW,halfH]=graph.targets.depthHalf.dimensions;
   const depths=new Map<number,Awaited<ReturnType<typeof renderVulkanCloudDepth>>>();
   // -1 all near, -2 all far, 0..3 near in that screen quadrant.
   for (const pattern of [-1,-2,0,1,2,3]) {
    const full=sampledVulkanTarget(graph.targets.fullRGBDepth,Float32Array.from({length:width*height*4},(_,i)=>{
     if(i%4!==3)return 0;
     const p=Math.floor(i/4),x=p%width,y=Math.floor(p/width),quadrant=(x>=width/2?1:0)+(y>=height/2?2:0);
     return pattern===-1||pattern===quadrant?.03125:10000;
    }));
    depths.set(pattern,await renderVulkanCloudDepth(host,shaders as Record<DepthShader,VulkanShaderCompilation>,width,height,full,{u_texSizeHalf:[halfW,halfH],u_jitterHalf:[0,0]},true));
   }
   for (const shader of ['CloudFluffySuperCoarse','CloudFluffyCoarse','CloudFluffy','CloudCard'] as const) {
    const target=shader==='CloudFluffySuperCoarse'?graph.targets.coarseLo:shader==='CloudFluffyCoarse'?graph.targets.coarseHi:graph.targets.cloudA;
    const [w,h]=target.dimensions,frames=new Map<number,Float32Array[]>();let spatialInput:VulkanMaterialInput|undefined;
    for (const pattern of [-1,-2,0,1,2,3]) {
     const stage=viewportCloudStage(width,height,shader,{...u,u_viewportSize:[width,height]},depths.get(pattern)!);
     const input:VulkanMaterialInput={ shader,stride:shader==='CloudCard'?76:16,vertices:shader==='CloudCard'?new Uint8Array(Float32Array.from(cardVertices).buffer):quad,indices,state:4,uniforms:stage.uniforms,textures:{...textures,...stage.textures},colorFormats:shader==='CloudFluffy'||shader==='CloudCard'?['rgba16f','rgba16f']:['r16f'],attributes:shader==='CloudCard'?{a_position:{format:'vec3',offset:0},a_normal:{format:'vec4',offset:12},a_uv:{format:'vec4',offset:28},a_light0:{format:'vec4',offset:44},a_light1:{format:'vec4',offset:60}}:{a_position:{format:'vec2',offset:0},a_uv:{format:'vec2',offset:8}} };
     if(pattern===0)spatialInput=input;
     await host.setMaterialScene(await bindVulkanMaterial(shaders[shader],input));
     frames.set(pattern,(await host.materialFrame(w,h)).attachments);
    }
    const near=frames.get(-1)!,far=frames.get(-2)!;
    let different=0,compared=0,mismatches=0;
    for(let y=0;y<h;y++)for(let x=0;x<w;x++){
     // Original nearest gathers include adjacent samples; exclude their seam.
     if(Math.abs((x+.5)/w-.5)<.12||Math.abs((y+.5)/h-.5)<.12)continue;
     const quadrant=((x+.5)/w>=.5?1:0)+((y+.5)/h>=.5?2:0);
     for(let a=0;a<near.length;a++)for(let c=0;c<4;c++){
      const i=(y*w+x)*4+c;
      assert.ok(Number.isFinite(near[a][i])&&Number.isFinite(far[a][i]));
      if(near[a][i]!==far[a][i])different++;
      for(let pattern=0;pattern<4;pattern++){
       const expected=(pattern===quadrant?near:far)[a][i],actual=frames.get(pattern)![a][i];
       compared++;if(actual!==expected)mismatches++;
      }
     }
    }
    report.cases.push({width,height,shader,stage:[w,h],different,compared,mismatches});
    console.log(JSON.stringify(report.cases.at(-1)));
    assert.ok(different>0,`${shader}: depth fixture must alter actual shader output`);
    assert.equal(mismatches,0,`${shader}: screen quadrant does not match independent uniform depth`);
    if(width===128){
     const depthName=shader==='CloudFluffy'||shader==='CloudCard'?'u_depthHalfTex':'u_depthQuarterTex';
     const mutations=[{name:'incorrect-depth-row-order',input:{...spatialInput!,textures:{...spatialInput!.textures,[depthName]:bottomUpVulkanTarget(spatialInput!.textures[depthName])}}}];
     if(shader!=='CloudFluffyCoarse')mutations.push({name:'incorrect-full-size-viewport',input:{...spatialInput!,uniforms:{...spatialInput!.uniforms,u_viewportSize:[width,height]}}});
     for(const mutation of mutations){
      await host.setMaterialScene(await bindVulkanMaterial(shaders[shader],mutation.input));const actual=(await host.materialFrame(w,h)).attachments;let incorrect=0;
      for(let y=0;y<h;y++)for(let x=0;x<w;x++){
       if(Math.abs((x+.5)/w-.5)<.12||Math.abs((y+.5)/h-.5)<.12)continue;
       const expected=(x+.5)/w<.5&&(y+.5)/h<.5?near:far;
       for(let a=0;a<actual.length;a++)for(let c=0;c<4;c++){const i=(y*w+x)*4+c;if(actual[a][i]!==expected[a][i])incorrect++;}
      }
      report.controlledMutations.push({shader,mutation:mutation.name,mismatches:incorrect});assert.ok(incorrect>0,`${shader}: fixture must detect ${mutation.name}`);
     }
    }
   }
  }
  report.passed=true;
 } finally {host.stop();fs.writeFileSync('docs/cloud-spatial-depth-check.json',JSON.stringify(report,null,2)+'\n');}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
