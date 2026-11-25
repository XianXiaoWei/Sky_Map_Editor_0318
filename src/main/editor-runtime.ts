import { describeEnvironment } from '../core/environment-storage';
import fs from 'node:fs';
import * as THREE from 'three';
import {PlantIgnitionPreview,canIgnite,type IgnitionSnapshot,type PlantIgnitionGeometry} from '../core/viewport-ignition';
import darkstoneColors from '../../docs/darkstone-initialization-native.json';
import {ByteCache} from '../core/byte-cache';
import type {BeamoDrawGeometry} from '../core/beamo-draw';
import path from 'node:path';
import { ObjectsDocument } from '../core/objects';
import { MeshesDocument } from '../core/meshes';
import { cloudCardLevelLayout,cloudCardLevelDynamic } from '../core/cloud-card-level';
import { cloudCardDrawPlan } from '../core/cloud-card-draw';
import { cloudCardVisibilityPlan } from '../core/cloud-card-visibility';
import { cloudCardFacingPlan } from '../core/cloud-card-facing';
import { readResourceMesh, DIRECTORY_PURPOSES } from '../core/resources';
import { assetPath, digest, saveAtomic } from '../core/storage';
import { describeMaterial, materialBindings } from '../core/materials';
import { defaultLevelMaterialDescriptor } from '../core/level-material-runtime';
import { AssetCatalog } from './assets';
import {loadAvatarPreview} from './avatar-preview';
import { bindEditorLoadedModelBake, editorCloudCardBakeLighting, loadEditorLevelDataModelBakes } from '../core/level-data-bake-adapter';
import { nativeMaterialDefs, terrainSurfaces, skirtSurfaces } from '../core/mesh-surfaces';
import { bakedRenderState, bakedRenderGroups } from '../core/mesh-render-state';
import type { CloudVolume } from '../core/cloud-volume';
import { VulkanHost, type VulkanTransport } from './vulkan';
import {mergeVulkanOverlays,type VulkanScene} from '../core/vulkan-protocol';
import type {VulkanWindowBounds} from '../core/vulkan-protocol';
import { compileVulkanShaders,configureBundledShaderCache } from './vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from './vulkan-material';
import { vulkanProgramSources, vulkanProgramColorFormats } from './vulkan-program';
import { cloudRenderGraph } from '../core/cloud-render-graph';
import { renderVulkanCloudDepth, type DepthShader } from './vulkan-depth';
import type { VulkanShaderCompilation } from './vulkan-shaders';
import { renderVulkanCloudPass } from './vulkan-cloud';
import { cloudListRenderState } from '../core/cloud-render-state';
import { createVulkanEnvironment } from './vulkan-environment';
import { createVulkanBakedRenderer } from './vulkan-baked';
import { createViewportCloud } from './vulkan-viewport-cloud';
import {createVulkanFastComposition} from './vulkan-fast-composition';
import { createViewportEnvironment } from './viewport-environment';
import { selectEditorBeamoBake } from '../core/beamo-bake-adapter';
import {buildBeamoDrawGeometry,originalBeamoRsqrtCapability} from '../core/beamo-draw';
import beamoRsqrtEvidence from '../../docs/beamo-rsqrt-capability.json';
import { findLoadedBake } from '../core/baked-lookup';
import { objectScalar,objectText,serializedLevelMaterialIndex } from '../core/model-material-index';
import { numericFloatValue } from '../core/object-numeric-runtime';
import beamoDefaults from '../../docs/beamo-defaults.json';
import {ViewportTaskQueue} from '../core/viewport-task-queue';
import {ViewportModelLod} from './viewport-model-lod';
import {beamoBakeInput} from '../core/beamo-bake-adapter';
export interface EditorPlatform {
  userData: string;
  version: string;
  nativeExecutable: string;
  vulkanTransport?: () => VulkanTransport;
  nativeEnvironment?:Record<string,string>;
  beamoTable: string;
  classCatalog: string;
  bundledShaders?: string;
  bundledData?: string;
  chooseData(): Promise<string | null>;
  close(): void;
}
/** The complete editor operation table, shared by Android and desktop adapters. */
export function createEditorRuntime(platform: EditorPlatform) {
type Snapshot = { objects: Buffer; meshes: Buffer };
let dataPath = '', level = '', objectDoc: ObjectsDocument | undefined, meshDoc: MeshesDocument | undefined;
let original: Snapshot | undefined, originalHashes = { objects: '', meshes: '' }, past: Snapshot[] = [], future: Snapshot[] = [];
const resourceCache = new Map<string, ReturnType<typeof readResourceMesh>>();
const beamoGeometryCache=new ByteCache<string,BeamoDrawGeometry>(48*1024*1024);
const documentMeshKeys=new WeakMap<MeshesDocument,string>();
let beamoMaterialIndex:{document:ObjectsDocument;index:ReturnType<typeof serializedLevelMaterialIndex>}|undefined;
function beamoMaterials(){if(beamoMaterialIndex?.document!==objectDoc)beamoMaterialIndex={document:objectDoc!,index:serializedLevelMaterialIndex(objectDoc!.nodes,level)};return beamoMaterialIndex!.index;}
function meshKey(){let key=documentMeshKeys.get(meshDoc!);if(!key){key=digest(meshDoc!.serialize());documentMeshKeys.set(meshDoc!,key);}return key;}
let beamoRsqrtCapability:ReturnType<typeof originalBeamoRsqrtCapability>|undefined;
function beamoArithmetic(){if(!beamoRsqrtCapability){const bytes=fs.readFileSync(platform.beamoTable);if(digest(bytes)!==beamoRsqrtEvidence.binarySha256)throw new Error('Original Beamo arithmetic capability SHA differs');beamoRsqrtCapability=originalBeamoRsqrtCapability(bytes);}return beamoRsqrtCapability;}
const loadedBakeCache = new WeakMap<MeshesDocument, ReturnType<typeof loadEditorLevelDataModelBakes>>();
let assetCatalog: AssetCatalog | undefined;
let vulkan: VulkanHost | undefined;
let viewportEnvironment: {document:ObjectsDocument;render:ReturnType<typeof createVulkanEnvironment>}|undefined;
let viewportBaked: {document:ObjectsDocument;renderer:ReturnType<typeof createVulkanBakedRenderer>}|undefined;
let viewportLod:ViewportModelLod|undefined;
let viewportCloud:{document:MeshesDocument;objects:ObjectsDocument;renderer:ReturnType<typeof createViewportCloud>}|undefined;
let sharedEnvironment:{document:ObjectsDocument;owner:ReturnType<typeof createViewportEnvironment>}|undefined;
let viewportStatic:VulkanScene={vertices:new Float32Array(),draws:new Uint32Array()};
let viewportSceneUploads=0,viewportOverlayUpdates=0;
let viewportCloudRequested=false;
let ignitionDocument:ObjectsDocument|undefined,ignitionToken=0,plantIgnition=new PlantIgnitionPreview(),ignitionEye:number[]|undefined,ignitionPlantTargets=new Map<number,PlantIgnitionGeometry&{nodeId:number;radius:number}>();
function ignitionState():IgnitionSnapshot {
  requireDoc();if(ignitionDocument!==objectDoc){ignitionDocument=objectDoc;ignitionToken++;plantIgnition=new PlantIgnitionPreview();ignitionEye=undefined;ignitionPlantTargets.clear();}
  const baked=viewportBaked,cloud=viewportCloud;
  const plants=baked&&baked.document===objectDoc?baked.renderer.darkstoneIgnitionTargets():[];
  const present=new Set(plants.map(p=>p.nodeId));for(const p of plants)if(!plantIgnition.state(p.nodeId).lit)ignitionPlantTargets.set(p.nodeId,p);
  for(const id of ignitionPlantTargets.keys())if(!present.has(id)&&!plantIgnition.state(id).lit)ignitionPlantTargets.delete(id);
  const candles=cloud&&cloud.objects===objectDoc?cloud.renderer.candleIgnitionStates():[];
  return {level,token:ignitionToken,targets:[
    ...[...ignitionPlantTargets.values()].map(p=>({nodeId:p.nodeId,position:p.position,radius:p.radius,kind:'darkstone' as const,enabled:true,...plantIgnition.state(p.nodeId),shrinkScale:plantIgnition.shape(p.nodeId)})),
    ...candles.map(c=>({nodeId:c.nodeId,kind:'candle' as const,position:c.position,radius:0,enabled:c.enabled,lit:c.lit,burnt:c.burnt,progress:0,light:c.light,loaded:c.loaded}))
  ]};
}
function vulkanHost() { return vulkan ??= new VulkanHost(platform.nativeExecutable, platform.vulkanTransport,platform.nativeEnvironment); }
let cloudCache: { document: MeshesDocument; volume: CloudVolume | undefined } | undefined;
let fastComposition:{document:ObjectsDocument;renderer:ReturnType<typeof createVulkanFastComposition>}|undefined;
let viewportFrameTiming:Record<string,number>={};
let viewportQuality:'basic'|'fast'|'full'='full';
function cloudVolume() {
  requireDoc(); if (cloudCache?.document !== meshDoc) cloudCache = { document: meshDoc!, volume: meshDoc!.cloudVolume() };
  return cloudCache!.volume;
}
function catalog() { if (!dataPath) throw new Error('请先配置 Data'); return assetCatalog ??= new AssetCatalog(dataPath, level || undefined); }
function environmentOwner(){requireDoc();if(!sharedEnvironment||sharedEnvironment.document!==objectDoc){const next=createViewportEnvironment(objectDoc!.nodes,undefined,{level});sharedEnvironment?.owner.dispose();sharedEnvironment={document:objectDoc!,owner:next};}return sharedEnvironment.owner;}
// Render consumers resolve the current owner after reset while retaining their
// model draws and geometry. Prepared owner IDs are editor metadata services.
let sampledEnvironmentOwner:ReturnType<typeof createViewportEnvironment>|undefined,sampledEnvironmentRevision=-1,environmentRenderRevision=0;
const environmentRevision=()=>{
  const owner=environmentOwner(),revision=owner.revision();
  if(owner!==sampledEnvironmentOwner||revision!==sampledEnvironmentRevision){sampledEnvironmentOwner=owner;sampledEnvironmentRevision=revision;environmentRenderRevision++;}
  return environmentRenderRevision;
};
const environmentEvaluator=new Proxy(((eye:number[])=>environmentOwner()(eye)) as ReturnType<typeof createViewportEnvironment>,{get:(_target,key)=>key==='revision'?environmentRevision:Reflect.get(environmentOwner(),key)});
function resourceMesh(name: string) { const file=catalog().meshFile(name);if(!resourceCache.has(file))resourceCache.set(file,readResourceMesh(fs.readFileSync(file)));return resourceCache.get(file)!; }
function loadedModelBakes() {
  requireDoc(); const document = meshDoc!;
  let loaded = loadedBakeCache.get(document);
  if (!loaded) {
    loaded = loadEditorLevelDataModelBakes(document, name => {
      try { return resourceMesh(name); }
      catch (error) { if ((error as NodeJS.ErrnoException).code === 'ENOENT') return null; throw error; }
    });
    loadedBakeCache.set(document, loaded);
  }
  return loaded;
}
const settingsFile = () => path.join(platform.userData, 'settings.json');
function config(root: string) { root = fs.realpathSync(root); for (const folder of ['Levels', 'Meshes', 'Shaders']) if (!fs.statSync(path.join(root, folder)).isDirectory()) throw new Error(`Data 缺少 ${folder} 文件夹`); return root; }
function levels() { if (!dataPath) return []; return fs.readdirSync(path.join(dataPath, 'Levels')).filter(name => fs.existsSync(path.join(dataPath, 'Levels', name, 'Objects.level.bin')) && fs.existsSync(path.join(dataPath, 'Levels', name, 'BstBaked.meshes'))).sort(); }
function requireDoc() { if (!objectDoc || !meshDoc || !original) throw new Error('请先选择地图'); }
function snapshot(): Snapshot { requireDoc(); return { objects: objectDoc!.serialize(), meshes: meshDoc!.serialize() }; }
function dirty() { if (!original || !objectDoc || !meshDoc) return { objects: false, meshes: false }; return { objects: !objectDoc.serialize().equals(original.objects), meshes: !meshDoc.serialize().equals(original.meshes) }; }
function checkpoint() { past.push(snapshot()); future = []; let bytes = past.reduce((n, s) => n + s.objects.length + s.meshes.length, 0); while (past.length > 1 && (past.length > 48 || bytes > 160 * 1024 * 1024)) { const old = past.shift()!; bytes -= old.objects.length + old.meshes.length; } }
function restore(s: Snapshot) { objectDoc = new ObjectsDocument(s.objects); meshDoc = new MeshesDocument(s.meshes); }
function view() { return { level, objects: objectDoc?.view(), meshes: meshDoc?.view(), dirty: dirty(), undo: past.length, redo: future.length }; }
function openLevel(name: string) { if (!levels().includes(name)) throw new Error('地图不存在'); const o = fs.readFileSync(assetPath(dataPath, `Levels/${name}/Objects.level.bin`)), m = fs.readFileSync(assetPath(dataPath, `Levels/${name}/BstBaked.meshes`)); const nextObjects = new ObjectsDocument(o), nextMeshes = new MeshesDocument(m); objectDoc = nextObjects; meshDoc = nextMeshes; original = { objects: o, meshes: m }; originalHashes = { objects: digest(o), meshes: digest(m) }; past = []; future = []; level = name; assetCatalog = undefined; documentMeshKeys.set(nextMeshes,originalHashes.meshes); return view(); }
function save(mode: 'objects' | 'meshes' | 'all') {
  requireDoc(); const changes = dirty(), results = [];
  if ((mode === 'objects' || mode === 'all') && changes.objects) { const b = objectDoc!.serialize(); const saved = saveAtomic(assetPath(dataPath, `Levels/${level}/Objects.level.bin`), originalHashes.objects, b); original!.objects = b; originalHashes.objects = saved.hash; objectDoc = new ObjectsDocument(b); results.push(saved.backup); }
  if ((mode === 'meshes' || mode === 'all') && changes.meshes) { const b = meshDoc!.serialize(); const saved = saveAtomic(assetPath(dataPath, `Levels/${level}/BstBaked.meshes`), originalHashes.meshes, b); original!.meshes = b; originalHashes.meshes = saved.hash; meshDoc = new MeshesDocument(b); results.push(saved.backup); }
  return { backups: results, dirty: dirty() };
}
const handlers: Record<string, (...args: any[]) => any> = {
  vulkanShaderCheck: (name: string, program: boolean) => {
    if (program) { const p = catalog().program(name); return compileVulkanShaders(vulkanProgramSources(p), path.join(platform.userData, 'vulkan-shaders')); }
    if (!/^[\w.-]+\.(vert|frag)$/.test(name)) throw new Error('shader 名称无效');
    return compileVulkanShaders([{ stage: name.endsWith('.vert') ? 'vert' : 'frag', text: fs.readFileSync(assetPath(dataPath, `Shaders/Bin/${name}`), 'utf8') }], path.join(platform.userData, 'vulkan-shaders'));
  },
  vulkanInfo: () => vulkanHost().start(),
  vulkanRestart:async()=>{
    vulkanHost().stop();
    // GPU allocations belong to the stopped process. Keep document edits,
    // environment/event state, material overrides and accumulated shader time.
    viewportBaked?.renderer.invalidateGpu();
    viewportCloud?.renderer.invalidateGpu();
    viewportEnvironment=undefined;fastComposition=undefined;
    return vulkanHost().start();
  },
  vulkanSurfaceBounds:(bounds:VulkanWindowBounds)=>{if(!platform.nativeEnvironment?.SKY_WIN32_PARENT&&!platform.nativeEnvironment?.SKY_XCB_SURFACE_TEST)throw new Error('当前平台没有原生窗口视口');return vulkanHost().setWindowBounds(bounds);},
  environmentRuntimeInfo:()=>environmentOwner().info(),
  resetEnvironmentRuntime:()=>{sharedEnvironment?.owner.dispose();sharedEnvironment=undefined;viewportEnvironment=undefined;viewportCloud=undefined;return environmentOwner().info();},
  triggerEnvironmentEvent:(id:number,predicate=0,controllers?:{id:number;matrix:number[];enabled:boolean}[])=>{for(const control of controllers??[]){if(control.matrix.length!==16||!control.matrix.every(Number.isFinite)||typeof control.enabled!=='boolean')throw new Error('环境控制器快照无效');environmentOwner().setControllerTransform(control.id,new Uint8Array(Float32Array.from(control.matrix).buffer));environmentOwner().setControllerEnabled(control.id,control.enabled);}environmentOwner().trigger(id,predicate);return environmentOwner().info();},
  setEnvironmentControllerTransform:(id:number,matrix:number[])=>{if(matrix.length!==16||!matrix.every(Number.isFinite))throw new Error('环境控制器矩阵必须有 16 个有限分量');return environmentOwner().setControllerTransform(id,new Uint8Array(Float32Array.from(matrix).buffer));},
  setEnvironmentControllerEnabled:(id:number,enabled:boolean)=>environmentOwner().setControllerEnabled(id,enabled),
  setEnvironmentFloatValues:(values:{id:number;bits:number}[])=>environmentOwner().setFloatValues(values),
  setEnvironmentEventPaused:(id:number,paused:boolean)=>{if(typeof paused!=='boolean')throw new Error('环境事件暂停值必须是 boolean');return environmentOwner().setEventPaused(id,paused);},
  setEnvironmentEnabled:(id:number,enabled:boolean)=>{if(typeof enabled!=='boolean')throw new Error('环境运行启用状态必须为 boolean');environmentOwner().setEnabled(id,enabled);return environmentOwner().info();},
  vulkanViewportInfo: () => ({...viewportBaked?.renderer.info(),...viewportBaked?.renderer.uploadInfo(),lod:viewportLod?.info(),quality:viewportQuality,fast:fastComposition?.renderer.info(),materialCache:vulkanHost().materialCacheInfo(),fullCache:vulkanHost().fullCacheInfo(),frameTiming:viewportFrameTiming,sceneUploads:viewportSceneUploads,overlayUpdates:viewportOverlayUpdates,cloud:viewportCloud?{...viewportCloud.renderer.info(),active:viewportQuality==='full'}:undefined}),
  viewportIgnitionState:()=>ignitionState(),
  resetViewportIgnition:()=>{
    ignitionState();for(const id of plantIgnition.ids())viewportBaked?.renderer.clearModelParameterBindings(id);
    plantIgnition=new PlantIgnitionPreview();ignitionToken++;
    if(viewportCloud&&viewportCloud.objects===objectDoc)viewportCloud.renderer.resetCandleOwner();
    return ignitionState();
  },
  igniteViewportTarget:(token:number,id:number)=>{
    const state=ignitionState(),target=state.targets.find(t=>t.nodeId===id);
    if(token!==state.token||!target||!ignitionEye||!canIgnite(target,ignitionEye))throw new Error('点火目标已变化或摄像头距离太远');
    if(target.kind==='candle')viewportCloud!.renderer.igniteCandle(id);
    else {
      plantIgnition.ignite(id,ignitionPlantTargets.get(id));
      viewportBaked!.renderer.setModelParameterBinding(id,{name:'u_diffuseColor',nativeType:1,vector:plantIgnition.diffuse(id)!,texture:''});
      viewportBaked!.renderer.setModelParameterBinding(id,{name:'u_spotsColor',nativeType:1,vector:darkstoneColors.colors.pulseHigh.values.slice(),texture:''});
    }
    return ignitionState();
  },
  physicsBallField:()=>{requireDoc();const volume=cloudVolume();return volume&&{origin:volume.origin,dimensions:volume.dimensions,distanceResolution:volume.distanceResolution,blockIndices:volume.blockIndices,sparse:volume.sparse,distance:volume.distance};},
  vulkanOverlay:async (scene:VulkanScene)=>{await vulkanHost().setScene(mergeVulkanOverlays(viewportStatic,scene));viewportOverlayUpdates++;},
  vulkanScene: async (scene: VulkanScene) => {
    viewportCloudRequested=scene.cloud===true;
    if(objectDoc) {
      if(viewportBaked?.document!==objectDoc)viewportBaked={document:objectDoc,renderer:createVulkanBakedRenderer(level,objectDoc.nodes,catalog(),vulkanHost(),path.join(platform.userData,'vulkan-shaders'),environmentEvaluator)};
      viewportBaked.renderer.setDraws(scene.baked??[],scene.models??[],scene.modelBoundaries??[]);
      viewportLod=new ViewportModelLod(objectDoc.nodes,{mesh:resourceMesh,bake:(node,lod)=>handlers.bakedResource(objectText(node,'resourceName'),objectScalar(node,'bstGuid'),lod),beamo:(id,lod)=>handlers.beamoGeometry(id,lod),beamoPlan:(node,mesh)=>{
        const record=findLoadedBake(loadedModelBakes(),objectScalar(node,'bstGuid')),input=beamoBakeInput(node,mesh,record),selection=selectEditorBeamoBake(node,mesh,record);
        return {count:node.className==='Beamo'?selection.selectedLods:1,distances:selection.distanceBits.map(numericFloatValue),enables:input.enableBits.map(numericFloatValue)};
      }});viewportLod.setDraws(scene.models??[]);
    }
    viewportStatic={vertices:scene.vertices,draws:scene.draws};await vulkanHost().setScene(scene);viewportSceneUploads++;
    return {geometrySha256:viewportBaked?.renderer.info().geometrySha256};
  },
  vulkanModelTransforms:(updates:{nodeId:number;matrix:number[]}[])=>{
    if(!viewportBaked)throw new Error('模型视口尚未就绪');viewportBaked.renderer.setModelTransforms(updates);
  },
  vulkanModelVertices:(updates:import('../core/vulkan-protocol').VulkanModelVertices[])=>{
    if(!viewportBaked)throw new Error('模型视口尚未就绪');viewportBaked.renderer.setModelVertices(updates);
  },
  vulkanMaterialScene: async (input: VulkanMaterialInput) => {
    const p = catalog().program(input.shader), compiled = await compileVulkanShaders(vulkanProgramSources(p), path.join(platform.userData, 'vulkan-shaders'));
    input = { ...input, colorFormats: input.colorFormats ?? vulkanProgramColorFormats(input.shader) };
    if (compiled.descriptors.some(d => d.name === 'u_cloudNoise3D') && !input.textures.u_cloudNoise3D) input = { ...input, textures: { ...input.textures, u_cloudNoise3D: catalog().cloudNoise() } };
    await vulkanHost().setMaterialScene(await bindVulkanMaterial(compiled, input));
  },
  vulkanMaterialFrame: (width: number, height: number) => vulkanHost().materialFrame(width, height),
  vulkanFrame: async (width: number, height: number, matrix: number[],cameraMatrix?:number[],animation?:{delta:number},interaction?:{avatarPosition:number[]},quality:'basic'|'fast'|'full'='full') => {
    let stageStarted=performance.now();const timing:Record<string,number>={};const mark=(name:string)=>{const now=performance.now();timing[name]=now-stageStarted;stageStarted=now;};
    if(!['basic','fast','full'].includes(quality))throw new Error('视口画质无效');viewportQuality=quality;
    let exposure:number|undefined;
    if(cameraMatrix&&objectDoc) {
      if(viewportEnvironment?.document!==objectDoc)viewportEnvironment={document:objectDoc,render:createVulkanEnvironment(objectDoc.nodes,catalog(),vulkanHost(),path.join(platform.userData,'vulkan-shaders'),environmentEvaluator)};
      ignitionState();ignitionEye=cameraMatrix.slice(12,15);
      environmentOwner().setAvatarPosition(interaction?.avatarPosition??cameraMatrix.slice(12,15));
      if(animation){
        if(!Number.isFinite(animation.delta)||animation.delta<0)throw new Error('材质预览帧时间无效');
        environmentOwner().advance({delta:animation.delta,timeScale:1});plantIgnition.advance(animation.delta);
        for(const id of plantIgnition.ids())if(!plantIgnition.state(id).burnt)viewportBaked?.renderer.setModelParameterBinding(id,{name:'u_diffuseColor',nativeType:1,vector:plantIgnition.diffuse(id)!,texture:''});
        viewportBaked?.renderer.advance(animation.delta,[...environmentOwner().wind(cameraMatrix.slice(12,15)),0]);
      }
      environmentOwner().beginFrame(cameraMatrix.slice(12,15));
      mark('environmentState');
      viewportBaked?.renderer.setAvatarPosition(interaction?.avatarPosition);
      const material=!!viewportBaked?.renderer.hasDraws()||viewportCloudRequested;
      let renderMatrix=matrix;
      if(quality==='full'){
        if(viewportCloud?.document!==meshDoc||viewportCloud?.objects!==objectDoc)viewportCloud={document:meshDoc!,objects:objectDoc,renderer:createViewportCloud(level,objectDoc.nodes,meshDoc!,catalog(),vulkanHost(),path.join(platform.userData,'vulkan-shaders'),loadedModelBakes(),environmentEvaluator)};
        const time=viewportBaked?.renderer.time()??0;
        if(animation)viewportCloud!.renderer.advance(animation.delta,time,[...environmentOwner().wind(cameraMatrix.slice(12,15)),0]);
        renderMatrix=await viewportCloud!.renderer.prepare(width,height,matrix,cameraMatrix,time);
        mark('cloudPrepare');
      }else {await vulkanHost().setViewportCore([]);await vulkanHost().setViewportItems([]);viewportCloud?.renderer.resetItems();}
      const environment=await viewportEnvironment.render(width,height,renderMatrix,cameraMatrix,true);
      mark('background');
      exposure=Number(environment.values.AmbienceToneMap.exposure);
      if(viewportLod&&viewportBaked){const projection=new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(cameraMatrix)),fov=2*Math.atan(1/Math.abs(projection.elements[5]));viewportBaked.renderer.setModelGeometry(viewportLod.update(cameraMatrix,Number.isFinite(fov)?fov:undefined,process.env.SKY_DISABLE_MODEL_LOD!=='1'));}
      await viewportBaked?.renderer.render(width,height,renderMatrix,cameraMatrix,quality==='basic'?'basic':'original');
      mark('materials');
      if(quality==='full'){const frame=await viewportCloud!.renderer.compose(width,height,matrix,cameraMatrix);mark('fullEffectsAndPresent');viewportFrameTiming=timing;return frame;}
      {
        if(fastComposition?.document!==objectDoc)fastComposition={document:objectDoc,renderer:createVulkanFastComposition(catalog(),vulkanHost(),path.join(platform.userData,'vulkan-shaders'),environmentEvaluator)};
        await fastComposition.renderer.prepare(width,height,matrix,cameraMatrix,viewportBaked?.renderer.time()??0);
        mark('compositionSetup');const nativeSurface=!!(await vulkanHost().start()).nativeSurface;
        const result=await vulkanHost().frame(width,height,matrix,undefined,true,nativeSurface);mark(nativeSurface?'rasterAndPresent':'rasterAndReadback');viewportFrameTiming=timing;return result;
      }
    }
    return vulkanHost().frame(width,height,matrix,exposure);
  },
  cloudVolumeInfo: () => { const v = cloudVolume(); return v && { blocks: v.coordinates.length / 3, atlasBlocksPerRow: v.atlasBlocksPerRow, bindings: v.bindings, textures: v.textures.map(t => ({ name: t.name, dimensions: t.dimensions, channels: t.channels, bytes: t.data.length })) }; },
  cloudRenderGraph: (width: number, height: number) => cloudRenderGraph(width, height),
  cloudListRenderState,
  cloudCardLayout: () => { requireDoc(); return cloudCardLevelLayout(objectDoc!.nodes, resourceMesh); },
  cloudCardDynamicDrawPlan: (eye:number[],visibleOrder:number[],sortByDistance:boolean,fallbackLighting:Uint8Array,lighting:Record<number,Uint8Array>={}) => {
    requireDoc();const baked=editorCloudCardBakeLighting(objectDoc!.nodes,loadedModelBakes(),resourceMesh);return cloudCardLevelDynamic(objectDoc!.nodes,resourceMesh,eye,visibleOrder,sortByDistance,fallbackLighting,{...baked.lighting,...lighting});
  },
  cloudCardDrawPlan: (eye: number[], visibleOrder: number[], sortByDistance: boolean) => {
    requireDoc(); const layout = cloudCardLevelLayout(objectDoc!.nodes, resourceMesh);
    return cloudCardDrawPlan(layout.cards.map(c => c.sphere), layout.ranges, visibleOrder, eye, sortByDistance);
  },
  cloudCardVisibilityDrawPlan: (viewProjection: number[], eye: number[], visibilityStatuses: number[], enabled: boolean, sortByDistance: boolean) => {
    requireDoc(); const layout = cloudCardLevelLayout(objectDoc!.nodes, resourceMesh), spheres = layout.cards.map(c => c.sphere);
    const visibility = cloudCardVisibilityPlan(spheres, Array.from(layout.renderOrder), viewProjection, visibilityStatuses, enabled);
    return { ...visibility, facing: cloudCardFacingPlan(layout.cards.map(c=>c.inverseWorld), visibility.visibleOrder, eye),
      draws: cloudCardDrawPlan(spheres, layout.ranges, visibility.visibleOrder, eye, sortByDistance),
      scope: '原六平面/球测试/非稳定压缩/逆矩阵/局部相机方向/距离队列；Visibility 分类结果为明确输入，原遮挡查询仍待恢复；动态流使用 cloudCardDynamicDrawPlan' };
  },
  vulkanCloudPass: async (width: number, height: number, fine: VulkanMaterialInput, cloudList: VulkanMaterialInput[]) => {
    if (!Array.isArray(cloudList) || cloudList.length > 4095 || fine.shader !== 'CloudFluffy') throw new Error('原 Cloud pass 绘制列表无效');
    const draws = [];
    for (const [i, input] of [fine, ...cloudList].entries()) {
      const program = catalog().program(input.shader);
      if (i > 0 && program.definition.group !== 'Cloud') throw new Error('该 shader 不属于原 Cloud 列表');
      const compiled = await compileVulkanShaders(vulkanProgramSources(program), path.join(platform.userData, 'vulkan-shaders'));
      const textures = { ...input.textures };
      if (compiled.descriptors.some(d => d.name === 'u_cloudNoise3D') && !textures.u_cloudNoise3D) textures.u_cloudNoise3D = catalog().cloudNoise();
      draws.push({ compiled, input: { ...input, textures } });
    }
    const result = await renderVulkanCloudPass(vulkanHost(), width, height, draws[0], draws.slice(1));
    return { cloudA: result.cloudA, cloudB: result.cloudB };
  },
  vulkanCloudDepth: async (width: number, height: number, fullDepth: VulkanMaterialInput['textures'][string], uniforms: { u_texSizeHalf: [number, number]; u_jitterHalf: [number, number] }) => {
    const names: DepthShader[] = ['DepthDownsample', 'DepthDownsampleGather', 'DepthDownsampleQuarter'];
    const shaders = Object.fromEntries(await Promise.all(names.map(async name => [name,
      await compileVulkanShaders(vulkanProgramSources(catalog().program(name)), path.join(platform.userData, 'vulkan-shaders'))]))) as Record<DepthShader, VulkanShaderCompilation>;
    const result = await renderVulkanCloudDepth(vulkanHost(), shaders, width, height, fullDepth, uniforms);
    return { depthHalf: result.depthHalf, depthQuarter: result.depthQuarter };
  },
  cloudTextureData: () => { const v = cloudVolume(); return v && { bindings: v.bindings, textures: v.textures }; },
  bootstrap: () => ({ platform: platform.bundledData ? 'android' : 'desktop', dataPath, levels: levels(), version: platform.version, purposes: DIRECTORY_PURPOSES }),
  chooseData: async () => { const root = await platform.chooseData(); return root ? config(root) : null; },
  setData: (root: string) => { if (dirty().objects || dirty().meshes) throw new Error('请先处理未保存的地图修改'); const next = config(platform.bundledData ?? root); fs.mkdirSync(path.dirname(settingsFile()), { recursive: true }); fs.writeFileSync(settingsFile(), JSON.stringify({ dataPath: next }, null, 2)); dataPath = next; resourceCache.clear();beamoGeometryCache.clear(); assetCatalog = undefined; objectDoc = undefined; meshDoc = undefined; original = undefined; level = ''; return { dataPath, levels: levels() }; },
  openLevel: (name: string) => { if (dirty().objects || dirty().meshes) throw new Error('请先处理未保存修改'); return openLevel(name); },
  save,
  discard: (mode: 'objects' | 'meshes' | 'all') => { requireDoc(); if (mode === 'objects' || mode === 'all') objectDoc = new ObjectsDocument(original!.objects); if (mode === 'meshes' || mode === 'all') meshDoc = new MeshesDocument(original!.meshes); past = []; future = []; return view(); },
  editObjects: (edits: { id: string; value: unknown; representation?: string }[]) => { requireDoc(); const next = new ObjectsDocument(objectDoc!.serialize()); for (const e of edits) next.edit(e.id, e.value, e.representation); const bytes = next.serialize(); checkpoint(); objectDoc = new ObjectsDocument(bytes); const ids = new Set(edits.map(e => Number(e.id.split('/')[0].slice(1)))); return { nodes: objectDoc.nodes.filter(n => ids.has(n.id)), dirty: dirty(), undo: past.length }; },
  editGeometry: (id: string, positions?: number[], ids?: number[], weights?: number[]) => { requireDoc(); const next = new MeshesDocument(meshDoc!.serialize()); next.editGeometry(id, positions, ids, weights); next.serialize(); checkpoint(); meshDoc = next; return { dirty: dirty(), undo: past.length }; },
  addGeometry: (positions: number[], indices: number[], material: number) => { requireDoc(); const next = new MeshesDocument(meshDoc!.serialize()); next.addSkirt(positions, indices, material); const bytes = next.serialize(); checkpoint(); meshDoc = new MeshesDocument(bytes); return view(); },
  editBake: (id: string, sub: number, light: number[]) => { requireDoc(); const next = new MeshesDocument(meshDoc!.serialize()); next.editBake(id, sub, light); next.serialize(); checkpoint(); meshDoc = next; return { dirty: dirty(), undo: past.length }; },
  bakeData: (id: string, lod: number) => { requireDoc(); return meshDoc!.bakeData(id, lod); },
  bakedResource: (name: string, guid: number, lod = 0) => {
    requireDoc(); if (!Number.isInteger(guid) || !Number.isInteger(lod) || lod < 0) throw new Error('烘焙 GUID / LOD 无效');
    return bindEditorLoadedModelBake(meshDoc!, loadedModelBakes(), resourceMesh(name), guid, lod);
  },
  beamoBakeInfo:(id:number)=>{
    requireDoc();if(!Number.isInteger(id))throw new Error('对象 ID 无效');
    const node=objectDoc!.nodes[id];if(!node||!['Beamo','BeamoDecal'].includes(node.className))throw new Error('请选择 Beamo 或 BeamoDecal');
    const requestedName=objectText(node,'meshName')||beamoDefaults.classes.Beamo.meshName.text;
    let mesh:ReturnType<typeof resourceMesh>,fallback=false;
    try{mesh=resourceMesh(requestedName);}catch(e){if((e as NodeJS.ErrnoException).code!=='ENOENT')throw e;mesh=resourceMesh('UnitCube');fallback=true;}
    const guid=objectScalar(node,'bstGuid'),record=findLoadedBake(loadedModelBakes(),guid),selected=selectEditorBeamoBake(node,mesh,record);
    return {nodeId:id,className:node.className,requestedName,effectiveName:fallback?'UnitCube':requestedName,fallback,guid,accepted:selected.accepted,
      selectedLods:selected.selectedLods,distanceBits:node.className==='Beamo'?selected.distanceBits:[],
      distances:node.className==='Beamo'?selected.distanceBits.map(bits=>{const value=numericFloatValue(bits);return Number.isFinite(value)?value:String(value);}):[],
      bake:record&&{id:record.id,name:record.name,guid:record.guid,lods:record.lods.map((lod,index)=>({index,renderVertexCount:lod.renderVertexCount,lightingBytes:lod.lighting?.packed.length??0,extraBytes:lod.extraByteCount,extraPresent:lod.extra!==null}))},
      materials:serializedLevelMaterialIndex(objectDoc!.nodes,level).modelLinks(node),completeOriginalClass:false};
  },
  beamoGeometry:(id:number,lod=0)=>{
    requireDoc();const node=objectDoc!.nodes[id];if(!Number.isInteger(id)||!node||!['Beamo','BeamoDecal'].includes(node.className))throw new Error('请选择 Beamo 或 BeamoDecal');
    const name=objectText(node,'meshName')||beamoDefaults.classes.Beamo.meshName.text;let mesh:ReturnType<typeof resourceMesh>;
    try{mesh=resourceMesh(name);}catch(e){if((e as NodeJS.ErrnoException).code!=='ENOENT')throw e;mesh=resourceMesh('UnitCube');}
    if(!Number.isInteger(lod)||!mesh.levels[lod])throw new Error('原 Beamo LOD 不存在');
    const key=JSON.stringify([dataPath,level,meshKey(),id,lod,node.fields,beamoMaterials().materials.map(m=>[m.nodeId,m.guid,m.effective])]);
    const cached=beamoGeometryCache.get(key);if(cached)return cached;
    const result=buildBeamoDrawGeometry(objectDoc!.nodes,level,id,mesh,findLoadedBake(loadedModelBakes(),objectScalar(node,'bstGuid')),Buffer.from(beamoRsqrtEvidence.fallbackLightingHex,'hex'),beamoArithmetic(),lod,beamoMaterials());
    beamoGeometryCache.set(key,result,key.length*2+result.vertices.byteLength+result.passes.reduce((n,p)=>n+p.indices.byteLength,0));return result;
  },
  modelPreviewBatch:async (ids:number[])=>{
    requireDoc();if(!Array.isArray(ids)||ids.length>32||new Set(ids).size!==ids.length||ids.some(id=>!Number.isInteger(id)||!objectDoc!.nodes[id]||!['LevelMesh','Beamo','BeamoDecal'].includes(objectDoc!.nodes[id].className)))throw new Error('模型预载列表无效');
    const result=[];
    for(const [i,id] of ids.entries()){
      const node=objectDoc!.nodes[id];
      try{result.push({id,...node.className==='LevelMesh'?{bake:handlers.bakedResource(objectText(node,'resourceName'),objectScalar(node,'bstGuid'))}:{geometry:handlers.beamoGeometry(id)}});}catch(error){result.push({id,error:String((error as Error).message)});}
      if(i%4===3)await new Promise<void>(resolve=>setImmediate(resolve));
    }
    return result;
  },
  editBakeSample: (id: string, lod: number, sample: number, light: number[]) => { requireDoc(); const next = new MeshesDocument(meshDoc!.serialize()); next.editBakeSample(id, lod, sample, light); next.serialize(); checkpoint(); meshDoc = next; return { dirty: dirty(), undo: past.length }; },
  undo: () => { if (past.length) { const last = past.pop()!; future.push(snapshot()); restore(last); } return view(); },
  redo: () => { if (future.length) { const next = future.pop()!; past.push(snapshot()); restore(next); } return view(); },
  resourceMesh,
  resourceAnimationList: () => catalog().animationList(),
  avatarPreviewResources:()=>loadAvatarPreview(dataPath,catalog(),resourceMesh),
  meshSurfaceInfo: (id: string) => {
    requireDoc();const geometry=meshDoc!.geometries.find(g=>g.id===id);if(!geometry||geometry.stride<36)throw new Error('请选择地形或裙边');
    const view=meshDoc!.geometryView(geometry),defs=nativeMaterialDefs(level),plan=geometry.kind==='terrain'?terrainSurfaces(view,defs):skirtSurfaces(view,defs);
    const owner=objectDoc!.nodes.find(n=>n.className==='TerrainBlobGroup'&&n.fields.some(f=>f.name==='bstGuid'&&(f.value as {uint?:number})?.uint===geometry.linkedId));
    const renderStates=[...new Set(plan.batches.map(b=>bakedRenderGroups[b.pass]))].map(group=>bakedRenderState(group));
    return {id,ownerNodeId:owner?.id,counts:plan.counts,batches:plan.batches,renderStates,omittedTriangles:plan.omittedTriangles,attributes:{normal:view.packedNormals.length,materialIds:view.materialIds.length,weights:view.weights.length,light:view.light.length,userData1:view.userData1.length},scope:'原版材质分批、顶点流与基础深度/混合状态；完整全局光照/云管线仍待完成'};
  },
  image: (name: string) => 'data:image/png;base64,' + fs.readFileSync(catalog().imageFile(name)).toString('base64'),
  ignitionUiAssets:()=>{
    const definition=catalog().resourceDefinition('ImageRegion','UIFlame'),uv=definition?.entry.parameters.uv,atlas=definition?.entry.parameters.image;
    if(typeof atlas!=='string'||!Array.isArray(uv)||uv.length!==4||!uv.every(v=>typeof v==='number'&&Number.isFinite(v)))throw new Error('原点火图标 ImageRegion 不完整');
    return {name:'UIFlame',atlas,uv:uv as number[],image:handlers.image(atlas),ring:handlers.image('UIRingBigThin')};
  },
  shaders: () => fs.readdirSync(assetPath(dataPath, 'Shaders/Bin')).filter(n => /\.(vert|frag)$/.test(n)).sort(),
  shader: (name: string) => { if (!/^[\w.-]+\.(vert|frag)$/.test(name)) throw new Error('shader 名称无效'); return fs.readFileSync(assetPath(dataPath, `Shaders/Bin/${name}`), 'utf8'); },
  shaderCatalog: () => [...catalog().shaders.values()],
  shaderProgram: (name: string) => catalog().program(name),
  imageInfo: (name: string) => catalog().image(name),
  materialInfo: (id: number) => {
    requireDoc(); const node = objectDoc!.nodes[id]; if (!node || !['LevelMaterial', 'LevelMesh'].includes(node.className)) throw new Error('请选择模型或材质对象');
    const serializedMaterial = describeMaterial(node); let material = serializedMaterial, program, error;
    try {
      if (node.className === 'LevelMaterial') material = defaultLevelMaterialDescriptor(serializedMaterial, level);
      if (material.shaderName && (material.custom || node.className === 'LevelMaterial')) program = catalog().program(material.shaderName);
      else error = 'LevelMesh 原版默认材质绘制选择链待恢复';
    } catch (e) { error = String((e as Error).message); }
    const images = material.parameters.filter(p => p.texture).map(p => catalog().image(p.texture));
    return { material, serializedMaterial, parameterOrigin: node.className === 'LevelMaterial' && !material.custom ? 'MaterialDefBarn 原默认生成顺序' : '对象保存参数', program, error, images, bindings: program ? materialBindings(material, program) : [], bake: meshDoc!.bakes.filter(b => b.guid === numberGuid(node)) };
  },
  environmentInfo: (id: number) => { requireDoc(); const node = objectDoc!.nodes[id]; if (!node) throw new Error('环境节点不存在'); return describeEnvironment(node, objectDoc!.nodes); },
  resources: () => { requireDoc(); return fs.readFileSync(assetPath(dataPath, `Levels/${level}/Resources.lua`), 'utf8'); },
  classCatalog: () => JSON.parse(fs.readFileSync(platform.classCatalog, 'utf8')),
  close: () => { if (dirty().objects || dirty().meshes) throw new Error('存在未保存修改'); platform.close(); }
};
function numberGuid(node: import('../core/objects').ObjectNode) { const f = node.fields.find(f => f.name === 'bstGuid'); return f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? -1); }

if (platform.bundledShaders) configureBundledShaderCache(platform.bundledShaders);
if (platform.bundledData) dataPath = config(platform.bundledData);
else try { dataPath = config(JSON.parse(fs.readFileSync(settingsFile(), 'utf8')).dataPath); } catch { dataPath = ''; }
const viewportTasks=new ViewportTaskQueue();
const serializedHandlers:typeof handlers={...handlers,
  vulkanFrame:viewportTasks.wrap(handlers.vulkanFrame),
  setData:viewportTasks.wrap(handlers.setData),openLevel:viewportTasks.wrap(handlers.openLevel),
  discard:viewportTasks.wrap(handlers.discard),editObjects:viewportTasks.wrap(handlers.editObjects),
  editGeometry:viewportTasks.wrap(handlers.editGeometry),addGeometry:viewportTasks.wrap(handlers.addGeometry),
  editBake:viewportTasks.wrap(handlers.editBake),editBakeSample:viewportTasks.wrap(handlers.editBakeSample),
  undo:viewportTasks.wrap(handlers.undo),redo:viewportTasks.wrap(handlers.redo)
};
return { handlers:serializedHandlers, dirty, stop: () => { sharedEnvironment?.owner.dispose(); vulkan?.stop(); } };
}
