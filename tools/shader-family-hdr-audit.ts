import {previousSkyProbe} from './probe-miss-regression-input';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import fs from 'node:fs';import path from 'node:path';import * as THREE from 'three';import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';
import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {createViewportEnvironment} from '../src/main/viewport-environment';import {effectiveLevelMeshMaterial} from '../src/core/model-draw';import {objectScalar} from '../src/core/model-material-index';
import {resourceModelGeometry,applyResourceModelTransform,exportResourceModel} from '../src/renderer/resource-model-renderer';import {loadEditorLevelDataModelBakes,bindEditorLoadedModelBake} from '../src/core/level-data-bake-adapter';import {defaultModelLighting} from '../src/core/model-default-lighting';
import {createBakedObject} from '../src/renderer/baked-renderer';import {nativeMaterialDefs} from '../src/core/mesh-surfaces';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import type {VulkanMaterialScene,VulkanModelDraw,VulkanBakedDraw} from '../src/core/vulkan-protocol';import {writeEffectPng,effectDisplay} from './effect-png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',hash=(b:Uint8Array|string)=>createHash('sha256').update(b).digest('hex');
const inventory=JSON.parse(fs.readFileSync('docs/model-coverage-audit.json','utf8')).rows as {level:string;id:number;shader:string;savedVisible:boolean;bakeAvailable:boolean;defaultLighting:boolean}[];
const groups=new Map<string,typeof inventory>();for(const row of inventory.filter(r=>r.savedVisible)){const list=groups.get(row.shader)??[];list.push(row);groups.set(row.shader,list);}
const samples=[...groups].flatMap(([shader,rows])=>{
 rows.sort((a,b)=>Number(b.level==='SkyHub2')-Number(a.level==='SkyHub2')||Number(b.bakeAvailable)-Number(a.bakeAvailable));
 const selected=[rows[0]];const alternate=rows.find(r=>r.bakeAvailable!==rows[0].bakeAvailable);if(alternate)selected.push(alternate);
 return selected.map(r=>({...r,shader}));
});
function stats(values:Float32Array){let covered=0,nonfinite=0,negative=0;const rgb:number[]=[];
 for(let i=0;i<values.length;i+=4)if(values[i]||values[i+1]||values[i+2]||values[i+3]){covered++;for(let c=0;c<3;c++){const v=values[i+c];if(!Number.isFinite(v))nonfinite++;else{rgb.push(v);if(v<0)negative++;}}}
 rgb.sort((a,b)=>a-b);return {covered,nonfinite,negative,maximum:rgb.at(-1)??0,p99:rgb[Math.floor(rgb.length*.99)]??0,median:rgb[Math.floor(rgb.length*.5)]??0};
}
async function main(){const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any=process.env.SKY_HDR_RESUME==='1'?JSON.parse(fs.readFileSync('docs/shader-family-hdr-audit.json','utf8')):{completed:false,scope:'Representative real saved model and BstBaked terrain GLSL families through production GPU bindings, real texture and bake bytes. Raw linear HDR is measured before tonemapping. Large HDR is a triage signal, not automatically a shader defect. Not all instances, complete scene lighting or original Metal/game pixel parity.',cases:[],errors:[],specialPasses:[],sourceHashes:{}};
 for(const [level,h] of Object.entries(report.sourceHashes) as [string,{objects:string;meshes:string}][])if(hash(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')))!==h.objects||hash(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')))!==h.meshes)throw new Error('Saved audit source differs');
 report.completed=false;
 let bound:VulkanMaterialScene[]=[];for(const method of ['setViewportMaterials','setViewportAlpha'] as const){const original=host[method].bind(host);host[method]=async scenes=>{bound.push(...scenes);await original(scenes);};}
 const levels=new Map<string,ReturnType<typeof load>>();
 function load(level:string){const source=fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')),meshBytes=fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')),nodes=new ObjectsDocument(source).nodes,mesh=new MeshesDocument(meshBytes),catalog=new AssetCatalog(data,level),resources=new Map<string,ReturnType<typeof readResourceMesh>>(),resolve=(name:string)=>{let r=resources.get(name);if(!r){r=readResourceMesh(fs.readFileSync(catalog.meshFile(name)));resources.set(name,r);}return r;};
  report.sourceHashes[level]={objects:hash(source),meshes:hash(meshBytes)};
  const bakes=loadEditorLevelDataModelBakes(mesh,name=>{try{return resolve(name);}catch(e){if((e as NodeJS.ErrnoException).code==='ENOENT')return null;throw e;}}),env=createViewportEnvironment(nodes,undefined,{level});return {nodes,mesh,catalog,resolve,bakes,env};
 }
 async function render(level:string,draw:VulkanModelDraw|VulkanBakedDraw,box:THREE.Box3,id?:number){
  const context=levels.get(level)??load(level);levels.set(level,context);const renderer=createVulkanBakedRenderer(level,context.nodes,context.catalog,host,'/tmp/sky-shader-hdr-audit',context.env),model='nodeId' in draw;
  renderer.setDraws(model?[]:[draw as VulkanBakedDraw],model?[draw as VulkanModelDraw]:[]);
  const center=box.getCenter(new THREE.Vector3()),size=box.getSize(new THREE.Vector3()).length(),camera=new THREE.PerspectiveCamera(50,1,.01,Math.max(64000,size*10));let output:Float32Array|undefined,result:ReturnType<typeof stats>|undefined;
  for(const direction of [[.8,.9,1],[-.8,.9,-1],[0,-1,.1]]){
   camera.position.copy(center).add(new THREE.Vector3(...direction).normalize().multiplyScalar(Math.max(.1,size*1.2)));camera.lookAt(center);camera.updateMatrixWorld();bound=[];renderer.invalidateGpu();await renderer.render(96,96,new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),camera.matrixWorld.toArray());
   if(bound.length!==1)throw new Error('Expected one production material binding');await host.setMaterialScene(bound[0]);output=(await host.materialFrame(96,96)).attachments[0];result=stats(output);if(result.covered>10)break;
  }
  const shader=context.catalog.program(draw.shader),file=`docs/shader-hdr-${level}-${id??'terrain'}-${draw.shader}.png`;await writeEffectPng(file,96,96,effectDisplay(output!));
  let probeRegression:unknown;
  if(shader.variables.some(v=>v.storage==='uniform'&&v.name==='u_probeCube')){
    const compiled=await compileVulkanShaders(vulkanProgramSources(shader),'/tmp/sky-shader-hdr-audit'),prior=previousSkyProbe(context.env(camera.position.toArray()),camera.position.toArray()),fixed=bound[0];
    const before={...fixed,resources:fixed.resources.map(r=>{
      const descriptor=compiled.descriptors.find(d=>d.binding===r.binding)!;
      if(descriptor.name==='u_probeCube')return {...r,data:prior.textures.u_probeCube.data};
      if(descriptor.kind!=='uniform-buffer')return r;
      const data=r.data.slice(),view=new DataView(data.buffer,data.byteOffset,data.byteLength);
      for(const member of descriptor.type.members??[]){const value=prior.uniforms[member.name as keyof typeof prior.uniforms];if(Array.isArray(value))value.forEach((v,i)=>view.setFloat32(member.offset+i*4,v,true));}return {...r,data};
    })};
    await host.setMaterialScene(before);const old=(await host.materialFrame(96,96)).attachments[0],oldStats=stats(old);probeRegression={before:oldStats,after:result,p99Ratio:result!.p99?oldStats.p99/result!.p99:null,changed:hash(new Uint8Array(old.buffer))!==hash(new Uint8Array(output!.buffer))};
    if(oldStats.p99>8&&result!.p99<oldStats.p99*.1)await writeEffectPng(file.replace('.png','-before-probe-fix.png'),96,96,effectDisplay(old));
  }
  const parameters=model?effectiveLevelMeshMaterial(context.nodes[id!],level).parameters.map(p=>({name:p.name,vector:p.vector,texture:p.texture})):nativeMaterialDefs(level)[(draw as VulkanBakedDraw).materialIndex];
  const entry={level,id,source:model?'LevelMesh':'BstBaked.meshes',shader:draw.shader,baked:model?(draw as VulkanModelDraw).baked:true,...result,vertexShader:shader.definition.vertex,fragmentShader:shader.definition.fragment,vertexShaderSha256:hash(shader.vertexSource),fragmentShaderSha256:hash(shader.fragmentSource),parameters,probeRegression,textureFormats:bound[0].resources.filter(r=>r.kind).map(r=>({binding:r.binding,format:r.format,dimensions:r.dimensions})),image:file,triage:!result!.covered?'no-visible-sample':result!.nonfinite?'nonfinite':result!.p99>8||result!.maximum>64?'high-hdr':'within-triage-range'};
  report.cases.push(entry);fs.writeFileSync('docs/shader-family-hdr-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({level,id,shader:draw.shader,...result,triage:entry.triage}));
 }
 try {report.device=await host.start();
  const selections=process.env.SKY_HDR_RESUME==='1'?[...groups].filter(([shader])=>!report.cases.some((c:any)=>c.shader===shader&&c.covered)).flatMap(([,rows])=>rows.filter(r=>!report.cases.some((c:any)=>c.level===r.level&&c.id===r.id)).slice(0,12)):samples;
  for(const row of selections){if(process.env.SKY_HDR_RESUME==='1'&&report.cases.some((c:any)=>c.shader===row.shader&&c.covered))continue;if(row.shader==='FogVolume'){if(!report.specialPasses.length)report.specialPasses.push({...row,reason:'Original FogVolume uses the separate signed R16F Fog Gen pass with jitter/depth/cloud inputs; excluded from opaque RGB HDR triage.'});continue;}try{const context=levels.get(row.level)??load(row.level);levels.set(row.level,context);const node=context.nodes[row.id],name=String(node.fields.find(f=>f.name==='resourceName')!.value),resource=context.resolve(name),material=new THREE.MeshStandardMaterial(),description=effectiveLevelMeshMaterial(node,row.level),program=context.catalog.program(description.shaderName),geometry=resourceModelGeometry(resource),object=new THREE.Mesh(geometry,material),bake=bindEditorLoadedModelBake(context.mesh,context.bakes,resource,objectScalar(node,'bstGuid'));
    material.userData.nativeModel={shader:description.shaderName,group:program.definition.group};object.userData.nodeId=node.id;if(bake)object.userData.boundBake=bake.bound;else object.userData.defaultModelLighting=defaultModelLighting(geometry.getAttribute('position').count);applyResourceModelTransform(object,node.fields.find(f=>f.name==='transform')!.value as number[]);
    await render(row.level,exportResourceModel(object,material,0,resource.indices.length),new THREE.Box3().setFromObject(object),node.id);geometry.dispose();material.dispose();
   }catch(e){report.errors.push({...row,error:String(e)});console.log(JSON.stringify({level:row.level,id:row.id,shader:row.shader,error:String(e)}));}}
  for(const level of process.env.SKY_HDR_RESUME==='1'?[]:['SkyHub2','RainForest','Dusk','Dawn']){const context=levels.get(level)??load(level);levels.set(level,context);const scene=new THREE.Scene(),defs=nativeMaterialDefs(level);for(const g of context.mesh.geometries.filter(g=>g.kind==='terrain'))scene.add(createBakedObject(context.mesh.geometryView(g),defs,'material',false));
   const seen=new Set<string>();for(const draw of exportVulkanScene(scene).baked??[]){if(seen.has(draw.shader))continue;seen.add(draw.shader);try{const box=new THREE.Box3(),d=new DataView(draw.vertices.buffer,draw.vertices.byteOffset,draw.vertices.byteLength);for(const index of draw.indices){const offset=index*draw.stride;box.expandByPoint(new THREE.Vector3(d.getFloat32(offset,true),d.getFloat32(offset+4,true),d.getFloat32(offset+8,true)));}await render(level,draw,box);}catch(e){report.errors.push({level,shader:draw.shader,source:'BstBaked.meshes',error:String(e)});}}scene.traverse(o=>{if(o instanceof THREE.Mesh){o.geometry.dispose();for(const m of Array.isArray(o.material)?o.material:[o.material])m.dispose();}});
  }
  for(const [level,h] of Object.entries(report.sourceHashes) as [string,{objects:string;meshes:string}][])if(hash(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')))!==h.objects||hash(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')))!==h.meshes)throw new Error('Source hash changed');
  report.completed=true;report.sourceUnchanged=true;report.summary={cases:report.cases.length,shaderFamilies:new Set(report.cases.map((r:any)=>r.shader)).size,highHdr:report.cases.filter((r:any)=>r.triage==='high-hdr').map((r:any)=>({level:r.level,id:r.id,shader:r.shader,maximum:r.maximum,p99:r.p99})),nonfinite:report.cases.filter((r:any)=>r.nonfinite),errors:report.errors.length,inconclusive:report.cases.filter((r:any)=>!r.covered).map((r:any)=>({level:r.level,id:r.id,shader:r.shader})),probeRegressions:report.cases.filter((r:any)=>r.probeRegression).map((r:any)=>({level:r.level,id:r.id,shader:r.shader,...r.probeRegression}))};
 }finally{host.stop();for(const context of levels.values())context.env.dispose();fs.writeFileSync('docs/shader-family-hdr-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report.summary??{completed:false}));}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
