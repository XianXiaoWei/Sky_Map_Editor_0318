import fs from 'node:fs';
import path from 'node:path';
import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {readResourceMesh,type ResourceMesh} from '../src/core/resources';
import {AssetCatalog} from '../src/main/assets';
import {effectiveLevelMeshMaterial,modelDrawBoundary} from '../src/core/model-draw';
import {resourceModelPreviewActions} from '../src/core/resource-model-animation-preview';
import {resourceModelGeometry} from '../src/renderer/resource-model-renderer';
import {MODEL_NATIVE_TEXTURE_GLOBALS} from '../src/core/model-global-textures';
import {MeshesDocument} from '../src/core/meshes';
import {loadEditorLevelDataModelBakes,bindEditorLoadedModelBake} from '../src/core/level-data-bake-adapter';
import {objectScalar,objectText,serializedLevelMaterialIndex} from '../src/core/model-material-index';
import {ResourceModelAnimationPreview,resourceModelDefaultAnimation,resourceModelDefaultAnimationSettings} from '../src/core/resource-model-animation-preview';
import {findLoadedBake} from '../src/core/baked-lookup';
import {buildBeamoDrawGeometry,beamoDrawMaterial,originalBeamoRsqrtCapability} from '../src/core/beamo-draw';
import {materialDrawBoundary} from '../src/core/model-draw';
import beamoEvidence from '../docs/beamo-rsqrt-capability.json';
import {defaultModelLighting} from '../src/core/model-default-lighting';

const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const meshes=new Map<string,{mesh?:ResourceMesh;error?:string;poseError?:string;poseAvailable:boolean;actions:ReturnType<typeof resourceModelPreviewActions>;default?:ReturnType<typeof resourceModelDefaultAnimation>;sampleError?:string;sampleChanged?:boolean}>();
const rows:any[]=[],beamos:any[]=[],classes:string[]=[],shaderRows=new Map<string,unknown>(),counts=(values:string[])=>Object.fromEntries([...new Set(values)].sort().map(v=>[v,values.filter(x=>x===v).length]));
const rsqrt=originalBeamoRsqrtCapability(fs.readFileSync('docs/beamo-rsqrt-capability.bin'));
let maps=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;maps++;
 const source=fs.readFileSync(file),doc=new ObjectsDocument(source),catalog=new AssetCatalog(data,level);
 const load=(name:string)=>{
  const resolved=catalog.meshFile(name);let resource=meshes.get(resolved);
  if(!resource){resource={poseAvailable:false,actions:[]};meshes.set(resolved,resource);try{resource.mesh=readResourceMesh(fs.readFileSync(resolved));const g=resourceModelGeometry(resource.mesh);resource.poseAvailable=!g.userData.nativeAnimated;resource.poseError=g.userData.nativeSkinBoundary;g.dispose();if(resource.mesh.animated){const list=catalog.animationList();resource.actions=resourceModelPreviewActions(resource.mesh,list);resource.default=resourceModelDefaultAnimation(resource.mesh,list);if(resource.default.available)try{const preview=new ResourceModelAnimationPreview(resource.mesh,list),a=preview.step(0),b=preview.step(.17);resource.sampleChanged=!Buffer.from(a.packedPositions!).equals(Buffer.from(b.packedPositions!));}catch(error){resource.sampleError=String(error);}}}catch(error){resource.error=String(error);}}
  return resource;
 };
 const baked=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),materials=serializedLevelMaterialIndex(doc.nodes,level);
 const loaded=loadEditorLevelDataModelBakes(baked,name=>load(name).mesh??null);
 classes.push(...doc.nodes.map(n=>n.className));
 for(const node of doc.nodes.filter(n=>['Beamo','BeamoDecal'].includes(n.className))){
  const name=objectText(node,'meshName')||'UnitCube',row:any={level,id:node.id,className:node.className,name,passes:[]};
  try{let mesh=load(name).mesh;if(!mesh){mesh=load('UnitCube').mesh;row.resourceFallback='UnitCube';}if(!mesh)throw new Error('Beamo mesh unavailable');
   const geometry=buildBeamoDrawGeometry(doc.nodes,level,node.id,mesh,findLoadedBake(loaded,objectScalar(node,'bstGuid')),Buffer.from(beamoEvidence.fallbackLightingHex,'hex'),rsqrt,0,materials);row.vertices=geometry.counts.vertices;row.baked=geometry.acceptedBake;
   for(const pass of geometry.passes){const material=beamoDrawMaterial(doc.nodes,level,node.id,pass.pass,materials).material,program=catalog.program(material.shaderName);row.passes.push({pass:pass.pass,shader:pass.shader,group:program.definition.group,triangles:pass.indices.length/3,materialBoundary:materialDrawBoundary(material,program,true,false,'material')});}
  }catch(error){row.error=String(error);}beamos.push(row);
 }
 for(const node of doc.nodes.filter(n=>n.className==='LevelMesh')){
  const fields=Object.fromEntries(node.fields.map(f=>[f.name,f.value])),name=String(fields.resourceName??''),resource=load(name);
  let bakeAvailable=false;try{bakeAvailable=!!resource.mesh&&!!bindEditorLoadedModelBake(baked,loaded,resource.mesh,objectScalar(node,'bstGuid'));}catch{}
  let shader='',group='',boundary:string|null=resource.error??null,usesShaderTime=false,textures:any[]=[],shaderError:string|undefined;
  try{
   const material=effectiveLevelMeshMaterial(node,level),program=catalog.program(material.shaderName);shader=material.shaderName;group=program.definition.group;
   usesShaderTime=program.variables.some(v=>v.storage==='uniform'&&v.name==='u_time');
   const defaultLightingAvailable=!!resource.mesh&&defaultModelLighting(resource.mesh.positions.length/3).length===resource.mesh.positions.length*4;
   const materialBoundary=modelDrawBoundary(node,level,program,bakeAvailable||defaultLightingAvailable,!resource.poseAvailable);
   boundary??=materialBoundary;
   for(const variable of program.variables.filter(v=>v.storage==='uniform'&&/^sampler/.test(v.type))){const image=MODEL_NATIVE_TEXTURE_GLOBALS[variable.name]??material.parameters.find(p=>p.name===variable.name)?.texture;if(image){const info=catalog.image(image);textures.push({uniform:variable.name,resource:image,exists:info.exists,source:info.declaration?.fields.source??image+'.png'});if(!info.exists)boundary??=`Texture unavailable: ${image}`;}}
   const key=shader+':'+createHash('sha256').update(program.vertexSource+program.fragmentSource).digest('hex');
   if(!shaderRows.has(key))shaderRows.set(key,{shader,group,vertex:program.definition.vertex,fragment:program.definition.fragment,uniforms:program.variables.filter(v=>v.storage==='uniform'),usesShaderTime});
  }catch(error){shaderError=String(error);boundary??=shaderError;}
  const settings=resourceModelDefaultAnimationSettings(node),autoRequested=!!resource.mesh?.animated&&settings.play;
  rows.push({level,id:node.id,name,resolvedFile:resource.mesh?path.basename(catalog.meshFile(name)):undefined,shader,group,textures,shaderError,materialBoundary:boundary,bakeAvailable,defaultLighting:!bakeAvailable&&!!resource.mesh,poseAvailable:resource.poseAvailable,poseError:resource.poseError,meshError:resource.error,animated:resource.mesh?.animated??false,animationPack:resource.mesh?.animation?.name,frames:resource.mesh?.animation?.frameCount??0,actions:resource.actions,defaultAnimation:resource.default,sampleChanged:resource.sampleChanged,sampleError:resource.sampleError,autoRequested,autoAvailable:autoRequested&&!!resource.default?.available&&!resource.sampleError,animationSettings:settings,animationFields:Object.fromEntries(Object.entries(fields).filter(([key])=>/anim/i.test(key))),usesShaderTime,savedVisible:fields.render!==0&&fields.enabled!==0});
 }
 if(!doc.serialize().equals(source))throw new Error('Source roundtrip differs: '+level);
 console.log(JSON.stringify({level,models:rows.filter(r=>r.level===level).length,beamos:beamos.filter(r=>r.level===level).length}));
}
const summary={maps,models:rows.length,uniqueResources:new Set(rows.map(r=>r.name)).size,materialBindingsAvailable:rows.filter(r=>!r.materialBoundary).length,materialBoundaries:counts(rows.filter(r=>r.materialBoundary).map(r=>r.materialBoundary)),missingTextureBindings:rows.reduce((n,r)=>n+r.textures.filter((t:any)=>!t.exists).length,0),animatedModels:rows.filter(r=>r.animated).length,animatedResources:new Set(rows.filter(r=>r.animated).map(r=>r.name)).size,poseAvailableAnimatedModels:rows.filter(r=>r.animated&&r.poseAvailable).length,namedPreviewAvailableModels:rows.filter(r=>r.animated&&r.actions.some((a:any)=>a.available)).length,defaultAnimationAvailableModels:rows.filter(r=>r.animated&&r.defaultAnimation?.available&&!r.sampleError).length,automaticAnimationRequestedModels:rows.filter(r=>r.autoRequested).length,automaticAnimationAvailableModels:rows.filter(r=>r.autoAvailable).length,shaderTimeModels:rows.filter(r=>r.usesShaderTime).length,beamoInstances:beamos.length,beamoGeometryAvailable:beamos.filter(r=>!r.error).length,beamoPassBoundaries:counts(beamos.flatMap(r=>r.error?[r.error]:r.passes.filter((p:any)=>p.materialBoundary).map((p:any)=>p.materialBoundary))),classInventory:counts(classes)};
fs.writeFileSync(process.env.SKY_MODEL_AUDIT_REPORT??'docs/model-coverage-audit.json',JSON.stringify({summary,rows,beamos,shaders:[...shaderRows.values()],scope:'All saved LevelMesh, Beamo and BeamoDecal instances across available maps. Resolves declared exported mesh variants, checks actual loaded bake compatibility, original shader/image bindings, default animation policy and real two-frame packed skinning. Other classes are inventoried separately. GPU visibility, original scene lifecycle, creature AI and effects must be verified separately.'},null,2)+'\n');
console.log(JSON.stringify(summary));
