import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {MeshesDocument} from '../src/core/meshes';
import {readResourceMesh} from '../src/core/resources';
import {AssetCatalog} from '../src/main/assets';
import {VulkanHost} from '../src/main/vulkan';
import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {viewportProbeBindings} from '../src/main/viewport-probe';
import {sampleAtmosphereRay} from '../src/core/atmosphere';
import {effectiveLevelMeshMaterial} from '../src/core/model-draw';
import {modelRenderStateCode} from '../src/core/model-render-state';
import {buildBeamoDrawGeometry,originalBeamoRsqrtCapability} from '../src/core/beamo-draw';
import {objectScalar,objectText,serializedLevelMaterialIndex} from '../src/core/model-material-index';
import {loadEditorLevelDataModelBakes} from '../src/core/level-data-bake-adapter';
import {findLoadedBake} from '../src/core/baked-lookup';
import {defaultModelLighting} from '../src/core/model-default-lighting';
import {resourceModelGeometry,applyResourceModelTransform,exportResourceModel} from '../src/renderer/resource-model-renderer';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import type {VulkanMaterialScene,VulkanModelDraw} from '../src/core/vulkan-protocol';
import {writeEffectPng,effectDisplay} from './effect-png';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const sha=(bytes:Uint8Array)=>createHash('sha256').update(bytes).digest('hex');
// Reproduce the previous production input solely to isolate this regression.
function previousProbe(e:ReturnType<ReturnType<typeof createViewportEnvironment>>,eye:number[]){
 const history=new Float32Array(6144*4);
 for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++){
  const u=2*(x+.5)/32-1,v=2*(y+.5)/32-1,d=[[1,-v,-u],[-1,-v,u],[u,1,v],[u,-1,-v],[u,-v,1],[-u,-v,-1]][face],length=Math.hypot(...d);
  const c=sampleAtmosphereRay({eye:[...eye,1],direction:[...d.map(v=>v/length),0],planetSphere:e.sphere,sunDirection:[...e.direction,0],sunColor:e.sunColor,averageSkyboxColor:e.average,atmosphereSunColor:e.values.AmbienceSun.sunColor as number[],atmosphereDensity:Number(e.values.AmbienceSky.atmosphereDensity),fogDensity:0,fogHeight:1,atmosphereSample:e.atmosphereSample,tintLookup:e.lut});
  c.forEach((v,l)=>history[(face*1024+y*32+x)*4+l]=Math.max(.0001,v));
 }
 return viewportProbeBindings(history,eye);
}
function stats(output:Float32Array){
 const rgb:number[]=[];let covered=0,sum=0;
 for(let i=0;i<output.length;i+=4)if(output[i]||output[i+1]||output[i+2]){covered++;for(let k=0;k<3;k++){const v=output[i+k];assert.ok(Number.isFinite(v));rgb.push(v);sum+=v;}}
 rgb.sort((a,b)=>a-b);return {covered,mean:sum/(covered*3),maximum:rgb.at(-1),p95:rgb[Math.floor(rgb.length*.95)]};
}
async function main(){
 const source=fs.readFileSync(path.join(data,'Levels/SkyHub2/Objects.level.bin')),bakedSource=fs.readFileSync(path.join(data,'Levels/SkyHub2/BstBaked.meshes')),nodes=new ObjectsDocument(source).nodes,meshDoc=new MeshesDocument(bakedSource),catalog=new AssetCatalog(data,'SkyHub2');
 const meshes=new Map<string,ReturnType<typeof readResourceMesh>>(),resource=(name:string)=>{let m=meshes.get(name);if(!m){m=readResourceMesh(fs.readFileSync(catalog.meshFile(name)));meshes.set(name,m);}return m;};
 const bakes=loadEditorLevelDataModelBakes(meshDoc,name=>{try{return resource(name);}catch(e){if((e as NodeJS.ErrnoException).code==='ENOENT')return null;throw e;}}),rsqrt=originalBeamoRsqrtCapability(fs.readFileSync('docs/beamo-rsqrt-capability.bin')),materialIndex=serializedLevelMaterialIndex(nodes,'SkyHub2');
 const family=nodes.filter(n=>['Beamo','BeamoDecal'].includes(n.className)&&materialIndex.modelLinks(n).some(l=>l.materialNodeId===764)).map(n=>n.id);
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Actual SkyHub2 cloud and Cliff material geometry, untouched original GLSL and texture bytes. Before/after changes only the production probe input. Synthetic display images are diagnostic; complete scene raycast/Metal image parity remains pending.',materialFamily:{materialNodeId:764,shader:'RockFaceShMesh',nodeIds:family},cases:[]};let bound:VulkanMaterialScene[]=[];
 for(const method of ['setViewportMaterials','setViewportAlpha'] as const){const original=host[method].bind(host);host[method]=async scenes=>{bound.push(...scenes);await original(scenes);};}
 try{
  report.device=await host.start();
  for(const id of [137,275,2107,844,...family.filter(n=>n!==844).slice(0,2)]){
   const node=nodes[id];let draw:VulkanModelDraw,box:THREE.Box3;
   if(node.className==='LevelMesh'){
    const mesh=resource(objectText(node,'resourceName')),d=effectiveLevelMeshMaterial(node,'SkyHub2'),material=new THREE.MeshStandardMaterial(),object=new THREE.Mesh(resourceModelGeometry(mesh),material);
    object.userData.nodeId=id;object.userData.defaultModelLighting=defaultModelLighting(mesh.positions.length/3);material.userData.nativeModel={shader:d.shaderName,group:catalog.program(d.shaderName).definition.group};applyResourceModelTransform(object,node.fields.find(f=>f.name==='transform')!.value as number[]);draw=exportResourceModel(object,material,0,mesh.indices.length);box=new THREE.Box3().setFromObject(object);object.geometry.dispose();material.dispose();
   }else{
    const mesh=resource(objectText(node,'meshName')||'UnitCube'),g=buildBeamoDrawGeometry(nodes,'SkyHub2',id,mesh,findLoadedBake(bakes,objectScalar(node,'bstGuid')),defaultModelLighting(1),rsqrt,0,materialIndex),p=g.passes.find(p=>p.pass==='primary')!,program=catalog.program(p.shader);
    draw={nodeId:id,stride:48,state:modelRenderStateCode(program.definition.group),vertices:g.vertices,indices:p.indices,model:new THREE.Matrix4().toArray(),baked:g.acceptedBake,beamoPass:p.pass,materialNodeId:p.materialNodeId,shader:p.shader,group:program.definition.group as VulkanModelDraw['group']};box=new THREE.Box3();const d=new DataView(g.vertices.buffer,g.vertices.byteOffset,g.vertices.byteLength);for(let i=0;i<g.vertices.length;i+=48)box.expandByPoint(new THREE.Vector3(d.getFloat32(i,true),d.getFloat32(i+4,true),d.getFloat32(i+8,true)));
   }
   const center=box.getCenter(new THREE.Vector3()),extent=box.getSize(new THREE.Vector3()).length(),camera=new THREE.PerspectiveCamera(50,1,.01,64000);camera.position.copy(center).add(new THREE.Vector3(.8,.9,1).normalize().multiplyScalar(extent*1.2));camera.lookAt(center);camera.updateMatrixWorld();
   const evaluate=createViewportEnvironment(nodes,undefined,{level:'SkyHub2'}),renderer=createVulkanBakedRenderer('SkyHub2',nodes,catalog,host,'/tmp/skyhub2-color',evaluate),matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();renderer.setDraws([],[draw]);bound=[];await renderer.render(128,128,matrix,camera.matrixWorld.toArray());assert.equal(bound.length,1);
   const fixed=bound[0],program=await compileVulkanShaders(vulkanProgramSources(catalog.program(draw.shader)),'/tmp/skyhub2-color'),eye=camera.position.toArray(),legacy=previousProbe(evaluate(eye),eye);
   const before={...fixed,resources:fixed.resources.map(r=>{
    const desc=program.descriptors.find(d=>d.binding===r.binding)!;
    if(desc.name==='u_probeCube')return {...r,data:legacy.textures.u_probeCube.data};
    if(desc.kind!=='uniform-buffer')return r;
    const data=r.data.slice(),d=new DataView(data.buffer,data.byteOffset,data.byteLength);
    for(const m of desc.type.members??[]){const v=legacy.uniforms[m.name as keyof typeof legacy.uniforms];if(Array.isArray(v))v.forEach((n,i)=>d.setFloat32(m.offset+i*4,n,true));}
    return {...r,data};
   })};
   const outputs:Record<string,Float32Array>={};for(const [name,scene] of [['before',before],['after',fixed]] as const){await host.setMaterialScene(scene);outputs[name]=(await host.materialFrame(128,128)).attachments[0];await writeEffectPng(`docs/skyhub2-color-${id}-${name}.png`,128,128,effectDisplay(outputs[name]));}
   const a=stats(outputs.after),b=stats(outputs.before);assert.ok(a.covered>10);assert.equal(a.covered,b.covered);assert.notEqual(sha(new Uint8Array(outputs.after.buffer)),sha(new Uint8Array(outputs.before.buffer)));
   if(node.className==='LevelMesh')assert.ok(a.mean<b.mean/10,'Cloud HDR overflow must be removed at the probe input');
   const priorProbes=renderer.uploadInfo().probeUpdates,oldValues=JSON.stringify(evaluate(eye).values);camera.position.y+=50;camera.lookAt(center);camera.updateMatrixWorld();await renderer.render(128,128,new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),camera.matrixWorld.toArray());assert.equal(JSON.stringify(evaluate(camera.position.toArray()).values),oldValues);assert.equal(renderer.uploadInfo().probeUpdates,priorProbes+1,'Camera movement must invalidate the probe with unchanged environment fields');evaluate.dispose();
   report.cases.push({id,shader:draw.shader,baked:draw.baked,before:b,after:a,cameraProbeRefresh:true,verticesSha256:sha(draw.vertices),images:[`docs/skyhub2-color-${id}-before.png`,`docs/skyhub2-color-${id}-after.png`]});console.log(JSON.stringify(report.cases.at(-1)));
  }
  assert.equal(sha(fs.readFileSync(path.join(data,'Levels/SkyHub2/Objects.level.bin'))),sha(source));assert.equal(sha(fs.readFileSync(path.join(data,'Levels/SkyHub2/BstBaked.meshes'))),sha(bakedSource));report.sourcesUnchanged=true;report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/skyhub2-color-gpu-check.json',JSON.stringify(report,null,2)+'\n');}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
