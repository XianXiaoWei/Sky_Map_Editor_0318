import {serializedLevelMaterialIndex} from '../core/model-material-index';
import { createTouchControls } from './touch-controls';
import { installMobileUI } from './mobile-ui';
import { installAuthorProfile } from './author-profile';
import {isSharedRuntimeEvent} from '../core/environment-event-types';
import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { TransformControls } from 'three/addons/controls/TransformControls.js';
import type { Field, ObjectNode, ClassDecl } from '../core/objects';
import type { BakeRecord, CloudRecord, GeometryRecord } from '../core/meshes';
import type { ResourceMesh } from '../core/resources';
import { describeMaterial, materialBindings, portableShader, type MaterialDescriptor, type ShaderProgram, type ParameterBinding } from '../core/materials';
import {effectiveLevelMeshMaterial,modelDrawBoundary} from '../core/model-draw';
import {resourceModelGeometry,applyResourceModelTransform} from './resource-model-renderer';
import {defaultModelLighting} from '../core/model-default-lighting';
import {ModelAnimationPreviewController} from './model-animation-preview';
import {BasicCreaturePreview} from './basic-creature-preview';
import {resourceModelPreviewActions,resourceModelDefaultAnimation,resourceModelDefaultAnimationSettings} from '../core/resource-model-animation-preview';
import type {ResourceAnimationList} from '../core/resource-animation-list';
import {modelRenderState} from '../core/model-render-state';
import {beamoDrawMaterial,type BeamoDrawGeometry} from '../core/beamo-draw';
import {materialDrawBoundary} from '../core/model-draw';
import { decodeLight, type BakeStream, type BoundBake } from '../core/baking';
import { nativeMaterialDefs, nativeMaterialParameters, type MaterialDef } from '../core/mesh-surfaces';
import { createBakedObject, setBakedDisplay, syncBakedNormals, updateBakedAttributes, surfacePlan, type BakedDisplay } from './baked-renderer';
import { bakedRenderState, bakedRenderGroups } from '../core/mesh-render-state';
import { envClumpWeight, envHullWeight } from '../core/environment';
import { VulkanViewport } from './vulkan-viewport';
import type {ViewportResolutionMode} from '../core/viewport-performance';
import { MeshWireOverlay, BoundsOverlay } from './viewport-overlays';
import { createCameraController } from './camera-controller';
import {IgnitionController} from './ignition-controller';
import {PhysicsBallController} from './physics-ball-controller';
import {prepareInteractionScene} from './interaction-index';
import {AvatarPreviewController} from './avatar-preview-controller';
import {AvatarCameraController} from './avatar-camera-controller';
import {avatarSpawnCandidates,type AvatarPreviewResources} from '../core/avatar-preview';
import {avatarRead,avatarWrite,setOriginalAvatarPosition,updateOriginalAvatarSetPos,type PositionedAvatar,type AvatarMarker} from '../core/avatar-set-pos';
import {AVATAR_PHYSICAL_STATE_BYTES,setOriginalPhysicalPosition,setOriginalPhysicalPositionImmediate} from '../core/avatar-physical-state';
import {CameraEventPreview} from '../core/camera-event-preview';
import {TransformObjectPreview} from '../core/transform-object-preview';
import {objectPlaybackClasses} from '../core/object-playback-plan';
import {railMarkerTransform,RAIL_MARKER_OBB} from '../core/rail';
import type {CollisionMesh} from '../core/physics-ball';
import {railInspectionPoints} from '../core/rail-level';
declare global { interface Window { sky: Record<string, (...args: any[]) => Promise<any>>; } }
type MeshView = GeometryRecord & { positions: Float32Array; normals: Float32Array; materialIds: Uint8Array; weights: Uint8Array; light: Uint8Array; packedNormals: Int8Array; userData1: Uint8Array };
interface LevelView { level: string; objects: { classes: ClassDecl[]; nodes: ObjectNode[]; bytes: number }; meshes: { version: number; bytes: number; decompressedBytes: number; geometries: MeshView[]; bakes: BakeRecord[]; cloud?: CloudRecord }; dirty: { objects: boolean; meshes: boolean }; undo: number; redo: number; }
const $ = <T extends HTMLElement = HTMLElement>(id: string) => document.getElementById(id) as T;
const api = window.sky;
const android = (window as any).skyPlatform === 'android';
let touchControls: ReturnType<typeof createTouchControls> | undefined;
const multiSelect = (event: MouseEvent) => event.shiftKey || (android && document.body.classList.contains('touch-multiselect'));
if (android) installMobileUI();
let current: LevelView | undefined, dataPath = '', purposes: Record<string, string> = {}, mode: 'objects' | 'meshes' | 'avatar' = 'objects', busy = false, sceneRevision = 0;
let materialUpdates = 0;
let selected = new Set<number>(), selectedGeometry: string | undefined, selectedBake: string | undefined, tool = 'select', materialId = 0, radius = 8, strength = .3, falloff = 'smooth', wire = false;
let bakeChannel = -1, bakedDisplay: BakedDisplay = 'material';
let bakedDefs: MaterialDef[] = [];
let resourceMeshes = new Map<string, THREE.BufferGeometry>(), materials = new Map<number, { name: string; image?: string; color: THREE.Color; texture?: THREE.Texture; shader: string }>();
const resourceModels=new Map<string,ResourceMesh>(),modelAnimations=new ModelAnimationPreviewController(),creatures=new BasicCreaturePreview();
let modelAnimationList:Promise<ResourceAnimationList>|undefined,lastModelAnimationFrame=0;
const previewTextures = new Map<string, THREE.Texture>(), pendingTextures = new Map<string, Promise<THREE.Texture | undefined>>();
const modelPrograms=new Map<string,Promise<ShaderProgram>>();
const modelImages=new Map<string,Promise<boolean>>();
let beamoMaterials:ReturnType<typeof serializedLevelMaterialIndex>|undefined;
function materialForBeamo(nodeId:number,pass:Parameters<typeof beamoDrawMaterial>[3]){return beamoDrawMaterial(current!.objects.nodes,current!.level,nodeId,pass,beamoMaterials??=serializedLevelMaterialIndex(current!.objects.nodes,current!.level));}
const entityObjects = new Map<number, THREE.Object3D>(), geometryObjects = new Map<string, THREE.Mesh>(), selectionBoxes: (THREE.BoxHelper | MeshWireOverlay)[] = [];
const playbackMatrixModes=new Map<number,boolean>(),playbackVisibilityModes=new Map<number,boolean>();
const controllerMatrices=new Map<number,number[]>(),controllerEnabled=new Map<number,boolean>();
const objectPlayback=new TransformObjectPreview({environmentEventPaused:(id,paused)=>{void api.setEnvironmentEventPaused(id,paused).catch((e:Error)=>toast(e.message,true));},environmentValues:values=>{void api.setEnvironmentFloatValues(values).catch((e:Error)=>toast(e.message,true));},environmentEventEnabled:(id,on)=>{void api.setEnvironmentControllerEnabled(id,on).catch((e:Error)=>toast(e.message,true));},environmentEvent:(id,controllers)=>{void api.triggerEnvironmentEvent(id,0,controllers.map(c=>({...c,matrix:Array.from(new Float32Array(c.matrix.buffer,c.matrix.byteOffset,16))}))).then(()=>{renderer?.invalidate();}).catch((e:Error)=>toast(e.message,true));},resetEnvironment:()=>{controllerMatrices.clear();controllerEnabled.clear();void api.resetEnvironmentRuntime().then(()=>{renderer?.invalidate();}).catch((e:Error)=>toast(e.message,true));},enabled:(id,on)=>{if(controllerEnabled.get(id)!==on){controllerEnabled.set(id,on);void api.setEnvironmentControllerEnabled(id,on).catch((e:Error)=>{controllerEnabled.delete(id);toast(e.message,true);});}const object=entityObjects.get(id);if(!object)throw new Error(`对象 #${id} 没有可显示的模型`);if(!playbackVisibilityModes.has(id))playbackVisibilityModes.set(id,object.visible);const node=current?.objects.nodes[id];object.visible=on&&(!node||node.className!=='LevelMesh'||numberField(node,'render',1)!==0)&&(!object.userData.editorHelper||showHelperFrames);},transform:(id,bytes)=>{
  const object=entityObjects.get(id);if(!object)throw new Error(`对象 #${id} 没有可显示的模型`);
  if(!playbackMatrixModes.has(id))playbackMatrixModes.set(id,object.matrixAutoUpdate);
  const v=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);
  const matrix=Array.from({length:16},(_,i)=>v.getFloat32(i*4,true)),previous=controllerMatrices.get(id);
  if(previous&&matrix.every((value,i)=>Object.is(value,previous[i]))&&matrix.every((value,i)=>Object.is(value,object.matrix.elements[i])))return;
  controllerMatrices.set(id,matrix);void api.setEnvironmentControllerTransform(id,matrix).catch((e:Error)=>{if(controllerMatrices.get(id)===matrix)controllerMatrices.delete(id);toast(e.message,true);});object.matrix.fromArray(matrix);
  object.matrix.decompose(object.position,object.quaternion,object.scale);object.matrixAutoUpdate=false;object.updateMatrixWorld(true);
}});
function resetObjectPlayback(){controllerMatrices.clear();controllerEnabled.clear();objectPlayback.reset();for(const [id,auto] of playbackMatrixModes){const object=entityObjects.get(id);if(object)object.matrixAutoUpdate=auto;}playbackMatrixModes.clear();for(const [id,visible] of playbackVisibilityModes){const object=entityObjects.get(id);if(object)object.visible=object.userData.editorHelper?showHelperFrames:visible;}playbackVisibilityModes.clear();updateObjectPlaybackStatus();}
function updateObjectPlaybackStatus(){
  const state=objectPlayback.snapshot(),output=document.getElementById('object-playback-status');
  if(renderer?.domElement){if(state)renderer.domElement.dataset.objectPlayback=JSON.stringify(state);else delete renderer.domElement.dataset.objectPlayback;}
  if(!output)return;if(state){output.dataset.state=JSON.stringify(state);const active=state.events.filter(e=>e.running||e.pending).map(e=>`#${e.id}${e.starts>1?`（第${e.starts}次）`:''}`).join('、'),numeric=state.kind==='FloatAdd'||state.kind==='FloatMult';output.textContent=state.error??`#${state.id} · ${state.running?(state.paused?'已暂停':'播放中'):'已结束'}${numeric?'':` · ${(state.progress*100).toFixed(1)}%`}${state.events.length>1?` · 当前 ${active||'已结束'}`:''}`;}else{delete output.dataset.state;output.textContent='尚未运行对象事件';}
  const values=document.getElementById('object-playback-values'),valueKey=JSON.stringify(state?.values??[]);if(values&&values.dataset.values!==valueKey){values.dataset.values=valueKey;values.replaceChildren();for(const cell of state?.values??[])values.append(textElement('p',`Float #${cell.id}：${Number.isFinite(cell.value)?Number(cell.value.toPrecision(7)):String(cell.value)}`,'tool-note'));}
  const stop=document.getElementById('object-playback-stop') as HTMLButtonElement|null;if(stop)stop.disabled=!state;
  const pause=document.getElementById('object-playback-pause') as HTMLButtonElement|null;if(pause){pause.disabled=!state?.running;pause.textContent=state?.paused?'继续播放':'暂停';}
}
let showHelperFrames = false, selectionOutline: 'hidden' | 'mesh' | 'bounds' = 'mesh', mapWireOverlay: MeshWireOverlay | undefined;
let renderer: VulkanViewport, camera: THREE.PerspectiveCamera, orbit: OrbitControls, transform: TransformControls;
let physicsBall:PhysicsBallController;
let avatarPreview:AvatarPreviewController,avatarResourceError='',avatarSpawnId:number|undefined,avatarPosition:PositionedAvatar|undefined;
let editorCamera:THREE.PerspectiveCamera,avatarCamera:AvatarCameraController;
let avatarCameraEvents:CameraEventPreview;
let cameraController:ReturnType<typeof createCameraController>;
let ignitionController:IgnitionController;
const scene = new THREE.Scene(), content = new THREE.Group(), helpers = new THREE.Group(), raycaster = new THREE.Raycaster(), pointer = new THREE.Vector2();
const grid = new THREE.GridHelper(2000, 100, 0x425669, 0x233647), brushRing = new THREE.Mesh(new THREE.RingGeometry(.95, 1, 64), new THREE.MeshBasicMaterial({ color: 0x8ddec8, side: THREE.DoubleSide, transparent: true, opacity: .8, depthTest: false }));
let toastTimer: ReturnType<typeof setTimeout>, brushActive = false, brushChanged = false, brushBefore: { positions: Float32Array; ids: Uint8Array; weights: Uint8Array } | undefined;
let pendingActions = Promise.resolve();
function textElement(tag: string, text: string, className = '') { const e = document.createElement(tag); e.textContent = text; e.className = className; return e; }
function updateModelAnimations(now:number){
 const delta=lastModelAnimationFrame?Math.max(0,(now-lastModelAnimationFrame)/1000):0;lastModelAnimationFrame=now;
 const paused=busy||transform?.dragging||!!document.querySelector('dialog[open]');
 if(!paused&&modelAnimations.running){try{modelAnimations.step(delta);}catch(e){toast(String((e as Error).message),true);}}
 scene.userData.animateModels=!paused&&(modelAnimations.running||creatures.running);
 const output=document.getElementById('model-animation-status'),id=output?.dataset.nodeId;
 if(output&&id!==undefined){const state=(entityObjects.get(Number(id))?.userData.basicCreature?creatures.animations:modelAnimations).snapshot(Number(id));output.textContent=state?`${state.name} · ${state.paused?'已暂停':'播放中'} · ${state.elapsed.toFixed(1)} 秒`:'已停止';}
}
let lastCreatureStatus=0;
function updateCreatureControls(){
 const state=creatures.snapshot(),pause=$<HTMLButtonElement>('creature-pause'),stop=$<HTMLButtonElement>('creature-stop');pause.disabled=stop.disabled=!state.instances;pause.textContent=state.status==='playing'?'暂停生物':'播放生物';pause.setAttribute('aria-pressed',String(state.status==='playing'));pause.title=`基础预览：${state.instances} 个生物实例（含待事件启用的生物）`;
 if(renderer?.domElement)renderer.domElement.dataset.basicCreatures=JSON.stringify(state);
}
function updateCreatures(now:number){
 const paused=busy||transform?.dragging||!!document.querySelector('dialog[open]');
 try{creatures.update(now,paused,physicsBall?.state?.position??(mode==='avatar'&&avatarPreview?.resources?avatarPreview.object.position.toArray():undefined));}catch(e){creatures.stop();toast(String((e as Error).message),true);}
 if(now-lastCreatureStatus>250){lastCreatureStatus=now;updateCreatureControls();}
}
async function modelAnimationDetails(pane:HTMLElement,node:ObjectNode){
 const revision=sceneRevision,object=entityObjects.get(node.id),mesh=resourceModels.get(object?.userData.creatureResource??resourceName(node)),animationController=object?.userData.basicCreature?creatures.animations:modelAnimations;
 if(!(object instanceof THREE.Mesh)||!mesh?.animated)return;
 const list=await (modelAnimationList??=api.resourceAnimationList().catch((error:Error)=>{modelAnimationList=undefined;throw error;}));
 if(!pane.isConnected||revision!==sceneRevision)return;
 const actions=resourceModelPreviewActions(mesh,list),fallback=resourceModelDefaultAnimation(mesh,list),select=document.createElement('select');select.id='model-animation-action';select.setAttribute('aria-label','模型动作');
 if(fallback.available)select.add(new Option(`默认动作：${fallback.name}`,'@default'));
 for(const a of actions){const option=new Option(a.name,a.name);option.disabled=!a.available;select.add(option);}
 const first=actions.find(a=>a.available),active=animationController.snapshot(node.id);select.value=active&&actions.some(a=>a.name===active.name)?active.name:fallback.available?'@default':first?.name??'';
 const play=textElement('button','播放动作') as HTMLButtonElement;play.id='model-animation-play';play.disabled=!first&&!fallback.available;
 play.onclick=()=>{try{if(select.value==='@default'){const settings=resourceModelDefaultAnimationSettings(node);animationController.startDefault(node.id,object,mesh,list,{speedMult:settings.speedMult,randomStart:settings.randomStart?Math.floor(Math.random()*2**31):undefined});}else animationController.start(node.id,object,mesh,list,select.value);lastModelAnimationFrame=performance.now();renderer.invalidate();}catch(e){toast(String((e as Error).message),true);}};
 const pause=textElement('button','暂停 / 继续') as HTMLButtonElement;pause.id='model-animation-pause';pause.onclick=()=>animationController.togglePause(node.id);
 const stop=textElement('button','停止并还原') as HTMLButtonElement;stop.id='model-animation-stop';stop.onclick=()=>{animationController.stop(node.id);renderer.invalidate();};
 const output=textElement('p','','tool-note');output.id='model-animation-status';output.dataset.nodeId=String(node.id);
 pane.replaceChildren(select,play,pause,stop,output,textElement('p',first||fallback.available?'地图按保存设置播放默认动作，也可在此选择动作、暂停或还原。':'此模型的动画资源尚不支持动作预览。','tool-note'));
}
function toast(message: string, error = false) { const e = $('toast'); e.textContent = message; e.className = error ? 'error-toast' : ''; e.hidden = false; clearTimeout(toastTimer); toastTimer = setTimeout(() => e.hidden = true, error ? 7000 : 3500); }
function status(text: string) { $('status').textContent = text; }
async function run(task: () => Promise<void>) {
  if (busy) return;
  touchControls?.reset();
  busy = true; document.body.setAttribute('aria-busy', 'true');
  // Scene rebuilds are asynchronous. Keep navigation unavailable until the
  // operation finishes, so a new map selection cannot be silently discarded.
  const navigation = ['levels', 'mode-bin', 'mode-mesh', 'mode-avatar'].map(id => $<HTMLButtonElement | HTMLSelectElement>(id));
  navigation.forEach(control => control.disabled = true);
  try { await renderer?.whenIdle();await task(); }
  catch (error) { toast(error instanceof Error ? error.message : String(error), true); status('操作未完成'); }
  finally { navigation.forEach(control => control.disabled = false); busy = false; document.body.setAttribute('aria-busy', 'false'); }
}
function enqueue(task: () => Promise<void>) { pendingActions = pendingActions.then(task).catch(e => toast(String(e.message ?? e), true)); return pendingActions; }
function updateState(info: Partial<LevelView>) { if (!current) return; Object.assign(current, info); const d = current.dirty; $('dirty').textContent = d.objects || d.meshes ? `未保存：${[d.objects && 'Objects', d.meshes && 'Meshes'].filter(Boolean).join('、')}` : '所有修改已保存'; $('dirty').classList.toggle('unsaved', d.objects || d.meshes); $<HTMLButtonElement>('undo').disabled = !current.undo; $<HTMLButtonElement>('redo').disabled = !current.redo; }
function findField(node: ObjectNode, name: string): Field | undefined { return flatten(node.fields).find(f => f.name === name); }
function flatten(fields: Field[]): Field[] { return fields.flatMap(f => [f, ...flatten(f.children ?? [])]); }
function numberField(node: ObjectNode, name: string, def = 0) { const f = findField(node, name); if (!f) return def; return f.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f.value); }
function stringField(node: ObjectNode, name: string) { return String(findField(node, name)?.value ?? ''); }
function vectorField(node: ObjectNode, name: string) { const v = findField(node, name)?.value; return Array.isArray(v) ? v.map(Number) : undefined; }
function resourceName(node: ObjectNode) { return stringField(node, 'resourceName'); }
function displayName(node: ObjectNode) { return stringField(node, 'name') || resourceName(node) || node.name; }
function objectTransform(node: ObjectNode, object: THREE.Object3D) {
  // Respect saved static model flags. Startup events and parent Clump state
  // still require the original runtime; visibleInWorld is not an enable flag.
  if(node.className==='LevelMesh')object.visible=numberField(node,'render',1)!==0&&numberField(node,'enabled',1)!==0;
  const matrix = vectorField(node, 'transform');
  if (matrix?.length === 16) { if(['LevelMesh','Beamo','BeamoDecal'].includes(node.className))applyResourceModelTransform(object,matrix);else{object.matrix.fromArray(matrix); object.matrix.decompose(object.position, object.quaternion, object.scale);} }
  else { const p = vectorField(node, 'pos') ?? vectorField(node, 'position'), q = vectorField(node, 'quat'), s = vectorField(node, 'scale'); if (p) object.position.fromArray(p); if (q) object.quaternion.fromArray(q).normalize(); if (s) object.scale.fromArray(s); }
  object.updateMatrixWorld(true);
}
function initViewport() {
  const el = $('viewport');
  $('creature-pause').onclick=()=>{creatures.togglePause();updateCreatureControls();renderer?.invalidate();};
  $('creature-stop').onclick=()=>{creatures.stop();updateCreatureControls();renderer?.invalidate();};
  ignitionController=new IgnitionController(el,api as any,entityObjects,content,()=>renderer?.invalidate(),message=>toast(message,true));
  try { renderer = new VulkanViewport(api as any, message => { status('Vulkan 视口不可用'); toast(message, true); }); } catch { status('无法创建 Vulkan 显示画布，仍可编辑和保存文件。'); }
  const canvas = renderer?.domElement ?? document.createElement('canvas'); if (!renderer) canvas.style.display = 'none'; el.prepend(canvas);if(renderer){el.append(renderer.performanceElement,renderer.recoveryElement);canvas.addEventListener('vulkanrecovered',()=>status(`绘制已恢复 · ${current?.level??''}`));}
  if (renderer) {
    if(android)renderer.setFrameBudget(1000/60);
    renderer.setQuality('full');
    const quality=$<HTMLSelectElement>('viewport-quality'),storageKey='sky.viewportResolutionMode';
    let resolutionMode:ViewportResolutionMode=android?'smooth':'balanced';
    try{const saved=localStorage.getItem(storageKey);if(saved==='smooth'||saved==='balanced'||saved==='native')resolutionMode=saved;}catch{}
    quality.value=resolutionMode;renderer.setResolutionMode(resolutionMode);
    quality.onchange=()=>{
      const mode=quality.value as ViewportResolutionMode;renderer.setResolutionMode(mode);
      try{localStorage.setItem(storageKey,mode);}catch{}
    };
    renderer.setPixelRatio(Math.min(devicePixelRatio, android?4:2)); renderer.setSize(el.clientWidth, el.clientHeight);
    void renderer.initialize().then(info => { canvas.dataset.backend = info.backend; canvas.title = `Vulkan · ${info.device}`;renderer?.setSize(el.clientWidth,el.clientHeight); }).catch(e => { status('Vulkan 初始化失败'); toast(String(e.message ?? e), true); renderer.dispose(); });
  }
  camera = new THREE.PerspectiveCamera(50, el.clientWidth / el.clientHeight, .1, 64000); camera.position.set(80, 60, 80);
  editorCamera=camera;avatarCamera=new AvatarCameraController(canvas);
  const shakePhysical=new Uint8Array(AVATAR_PHYSICAL_STATE_BYTES);
  avatarCameraEvents=new CameraEventPreview(avatarCamera.shakeState,()=>{
    // Explicit neutral preview snapshots; native collision/stance/Wind inputs
    // are not inferred from constructor defaults or edited into Objects.
    const d=new DataView(shakePhysical.buffer),position=avatarPreview.object.position.toArray();
    for(let i=0;i<3;i++){d.setFloat32(0x10+i*4,position[i],true);d.setFloat32(0x130+i*4,position[i],true);d.setFloat32(0x50+i*4,physicsBall.state?.velocity[i]??0,true);}d.setFloat32(0x1c,1,true);d.setFloat32(0x13c,1,true);return shakePhysical;
  });avatarCamera.camera.aspect=camera.aspect;avatarCamera.camera.updateProjectionMatrix();
  orbit = new OrbitControls(camera, canvas); orbit.mouseButtons = { LEFT: -1 as THREE.MOUSE, MIDDLE: THREE.MOUSE.ROTATE, RIGHT: -1 as THREE.MOUSE }; orbit.enableDamping = true; orbit.dampingFactor = .15;
  transform = new TransformControls(camera, canvas); transform.setSize(.8);const gizmo=transform.getHelper();gizmo.traverse(object=>{object.userData.dynamicViewport=true;});scene.add(gizmo);
  const syncTransformState=()=>{
    canvas.dataset.transformMode=transform.getMode();canvas.dataset.transformAxis=transform.axis??'';
    const object=transform.object;
    if(object){canvas.dataset.transformTarget=String(object.userData.nodeId??object.userData.geometryId??'');canvas.dataset.transformMatrix=JSON.stringify(object.matrix.toArray());}
    else{delete canvas.dataset.transformTarget;delete canvas.dataset.transformMatrix;}
    const help=el.querySelector<HTMLElement>('.viewport-help');
    if(help){const text=object?({translate:'移动：拖动彩色箭头或平面 · G',rotate:'旋转：拖动彩色圆环 · R',scale:'缩放：拖动轴端方块或中心方块 · S'} as const)[transform.getMode()]:'点击视口：WASD 移动 · Q↓ E↑ · 右键拖动看向 · Shift 加速 · 中键旋转 · 滚轮缩放';if(help.textContent!==text)help.textContent=text;}
  };
  transform.addEventListener('change',syncTransformState);syncTransformState();
  let validDragMatrix:THREE.Matrix4|undefined,invalidDragReported=false;
  transform.addEventListener('dragging-changed', (e: any) => { if(e.value){resetObjectPlayback();transform.object?.updateMatrix();validDragMatrix=transform.object?.matrix.clone();invalidDragReported=false;}orbit.enabled = !e.value; });
  transform.addEventListener('objectChange', () => { if (transform.object) {
    const object=transform.object;object.updateMatrix();
    if(validDragMatrix&&(!object.matrix.elements.every(v=>Number.isFinite(Math.fround(v)))||object.scale.toArray().some(v=>v===0))){
      validDragMatrix.decompose(object.position,object.quaternion,object.scale);object.updateMatrix();
      if(!invalidDragReported){toast('变换超出有效范围，已保留上次有效变换。',true);invalidDragReported=true;}
    }else if(validDragMatrix)validDragMatrix.copy(object.matrix);
    object.updateMatrixWorld(true);selectionBoxes.forEach(b => b.update());syncTransformState();
  } });
  transform.addEventListener('mouseUp', () => enqueue(commitTransform));
  cameraController=createCameraController(el,editorCamera,orbit,()=>mode!=='avatar'&&!busy&&!transform.dragging&&!brushActive&&!physicsBall?.state&&!document.querySelector('dialog[open]'),focusSelection,frameAll);
  if (android) { orbit.enableDamping = false; orbit.touches = { ONE: -1 as THREE.TOUCH, TWO: -1 as THREE.TOUCH }; transform.setSize(1.1); }
  physicsBall=new PhysicsBallController(scene,camera,orbit,$('physics-ball-status'));
  avatarPreview=new AvatarPreviewController(scene);
  scene.add(content, helpers, grid);grid.userData.dynamicViewport=true;brushRing.userData.dynamicViewport=true; brushRing.visible = false; scene.add(brushRing);
  grid.visible = false;
  const resizeViewport=()=>{const w=el.clientWidth,h=el.clientHeight;if(!w||!h)return;for(const c of [editorCamera,avatarCamera.camera]){c.aspect=w/h;c.updateProjectionMatrix();}renderer?.setPixelRatio(Math.min(devicePixelRatio,android?4:2));renderer?.setSize(w,h);};
  const resize = new ResizeObserver(resizeViewport); resize.observe(el);
  // Moving between monitors may change DPI without changing CSS dimensions.
  const watchDpi=()=>{matchMedia(`(resolution: ${devicePixelRatio}dppx)`).addEventListener('change',()=>{resizeViewport();watchDpi();},{once:true});};watchDpi();
  const toolbar=$('viewport').querySelector<HTMLElement>('.viewport-toolbar')!;
  new ResizeObserver(()=>{$('scene-label').style.top=toolbar.offsetTop+toolbar.offsetHeight+10+'px';}).observe(toolbar);
  renderer?.setAnimationLoop(() => { const now=performance.now();if(!renderer.frameInFlight){updateModelAnimations(now);updateCreatures(now);}objectPlayback.update(now,busy||transform.dragging||!!document.querySelector('dialog[open]'));updateObjectPlaybackStatus();if(mode==='avatar')avatarCamera.clearShake();physicsBall.update(now,busy||transform.dragging||!!document.querySelector('dialog[open]'));if(mode==='avatar'){if(avatarPreview.resources)avatarPreview.sync(physicsBall.state?.position,physicsBall.state?.radius);avatarCameraEvents.update(now,busy||!!document.querySelector('dialog[open]'));const event=avatarCameraEvents.snapshot();avatarCamera.applyShake(event?.positionShake??null);renderer.domElement.dataset.cameraShake=JSON.stringify(event?.positionShake??[0,0,0]);updateAvatarCameraEventStatus();}else delete renderer.domElement.dataset.cameraShake;cameraController.update(now);touchControls?.update(now);if(mode!=='avatar')orbit.update(); selectionBoxes.forEach(b => b.update()); mapWireOverlay?.update(); renderer.domElement.dataset.cameraMode=mode==='avatar'?'avatar':'editor';ignitionController.update(now,camera,busy||transform.dragging||!!document.querySelector('dialog[open]'));if(!busy&&!materialUpdates)renderer.render(scene, camera); });
  if(android) touchControls=createTouchControls(el,canvas,{
    camera:()=>camera,orbit,transform,
    available:()=>!busy&&!document.querySelector('dialog[open]')&&!document.body.matches('.left-open,.right-open,.tools-open'),
    editing:()=>document.body.classList.contains('touch-editing'),brush:()=>mode==='meshes'&&tool!=='select',
    brushStart:startBrush,brushMove,brushEnd:()=>{if(brushActive)void enqueue(finishBrush);},tap:selectAt,
    subject:()=>mode==='avatar'||!!physicsBall.state,
    moveSubject:(x,forward,vertical,jump)=>physicsBall.setTouchInput(x,forward,vertical,jump),
    lookSubject:(x,y)=>{if(mode==='avatar'){avatarCamera.lookTouch(x,y);return true;}return false;},
    zoomSubject:factor=>{if(mode==='avatar'){avatarCamera.zoomTouch(factor);return true;}return false;}
  });
  let down = { x: 0, y: 0 };
  canvas.addEventListener('pointerdown', event => { if(event.pointerType==='touch'&&android)return; down = { x: event.clientX, y: event.clientY }; $('context-menu').hidden = true; if (event.button === 0 && mode === 'meshes' && tool !== 'select' && !transform.dragging) startBrush(event); });
  canvas.addEventListener('pointermove', event => { if(event.pointerType==='touch'&&android)return; if (mode === 'meshes' && tool !== 'select') brushMove(event); });
  canvas.addEventListener('pointerup', event => { if(event.pointerType==='touch'&&android)return; if (event.button !== 0) return; if (brushActive) { void enqueue(finishBrush); return; } if (transform.dragging || transform.axis || Math.hypot(event.clientX - down.x, event.clientY - down.y) > 4) return; selectAt(event); });
  el.addEventListener('contextmenu', event => { event.preventDefault(); if (mode !== 'meshes') return; const menu = $('context-menu'), rect = el.getBoundingClientRect(); menu.style.left = Math.min(event.clientX - rect.left, el.clientWidth - 170) + 'px'; menu.style.top = Math.min(event.clientY - rect.top, el.clientHeight - 160) + 'px'; menu.hidden = false; });
  window.addEventListener('pointerup', () => { if (brushActive) void enqueue(finishBrush); });
}
function selectAt(event: PointerEvent) {
  if(busy||document.querySelector('dialog[open]'))return;
  if(physicsBall.state){const hit=ballHit(event);if(hit)physicsBall.reset(ballContactPosition(hit));return;}
  if(mode==='avatar')return;const hit=pick(event),multi=multiSelect(event);
  if(!hit){if(!multi)clearSelection();return;}
  const node=hit.object.userData.nodeId,geo=hit.object.userData.geometryId;
  if(mode==='objects'&&node!==undefined)selectNode(node,multi);
  else if(mode==='meshes'&&geo)selectGeometry(geo);
  else if(node!==undefined){const n=current?.objects.nodes[node];const bake=current?.meshes.bakes.find(b=>b.guid===numberField(n!,'bstGuid'));if(bake)selectBake(bake.id);}
}
function pick(event: PointerEvent | MouseEvent) { const r = $('viewport').getBoundingClientRect(); pointer.set((event.clientX - r.left) / r.width * 2 - 1, -(event.clientY - r.top) / r.height * 2 + 1); raycaster.setFromCamera(pointer, camera); return raycaster.intersectObjects([...geometryObjects.values(), ...entityObjects.values()], true).find(h => h.object.visible); }
function disposeScene() { creatures.reset();delete renderer?.domElement.dataset.basicCreatures;ignitionController?.reset(); modelAnimations.stop();resourceModels.clear();modelAnimationList=undefined;lastModelAnimationFrame=0;scene.userData.animateModels=false;beamoMaterials=undefined; touchControls?.reset();cameraController.reset(); resetObjectPlayback();physicsBall.stop();avatarCameraEvents.clear();avatarPreview.clear();avatarPosition=undefined;avatarResourceError='';delete $('tree').dataset.avatarSpawn;$('physics-ball').classList.remove('active');$('physics-ball').setAttribute('aria-pressed','false');sceneRevision++; transform.detach(); clearBoxes(); if (mapWireOverlay) { scene.remove(mapWireOverlay); mapWireOverlay.dispose(); mapWireOverlay = undefined; } helpers.clear(); content.traverse(o => { if (o instanceof THREE.Mesh || o instanceof THREE.Line) { if (!o.userData.sharedResource) o.geometry.dispose(); const original = o.userData.previewMaterial as THREE.MeshStandardMaterial | undefined; if (original && original !== o.material) { original.map?.dispose(); original.dispose(); } for (const m of Array.isArray(o.material) ? o.material : [o.material]) { if (o.userData.nodeId !== undefined) (m as THREE.MeshStandardMaterial).map?.dispose(); m.dispose(); } } }); content.clear(); entityObjects.clear(); geometryObjects.clear(); for (const g of resourceMeshes.values()) g.dispose(); resourceMeshes.clear(); modelPrograms.clear(); modelImages.clear(); for (const t of previewTextures.values()) t.dispose(); previewTextures.clear(); pendingTextures.clear(); }
function applyBakeChannel(object: THREE.Mesh) {
  const bound = object.userData.boundBake as BoundBake | undefined; if (!bound) return;
  const preview = object.userData.previewMaterial ??= object.material;
  if (object.material !== preview) (object.material as THREE.Material).dispose();
  if (bakeChannel < 0) { object.material = preview; object.geometry.setAttribute('color', object.userData.originalColor); return; }
  const values = bound.channels[bakeChannel], colors = new Float32Array(bound.vertexCount * 3);
  for (let i = 0; i < bound.vertexCount; i++) colors.set(values.subarray(i * 4, i * 4 + 3), i * 3);
  object.geometry.setAttribute('color', new THREE.BufferAttribute(colors, 3)); object.material = new THREE.MeshBasicMaterial({ vertexColors: true, side: THREE.DoubleSide, toneMapped: false });
}
function attachBake(object: THREE.Mesh, stream: BakeStream, bound: BoundBake) {
  object.userData.bakeStream = stream; object.userData.boundBake = bound;
  object.userData.originalColor ??= object.geometry.attributes.color;
  for (let i = 0; i < 3; i++) object.geometry.setAttribute('a_light' + i, new THREE.BufferAttribute(bound.channels[i], 4));
  applyBakeChannel(object);
}
async function refreshBake(id: string) {
  const revision = sceneRevision;
  for (const [nodeId, object] of entityObjects) if (object instanceof THREE.Mesh && (object.userData.bakeStream as BakeStream | undefined)?.id === id) {
    const node = current!.objects.nodes[nodeId], data = await api.bakedResource(resourceName(node), numberField(node, 'bstGuid'));
    if (revision !== sceneRevision) return; if (data) attachBake(object, data.stream, data.bound);
  }
}
async function previewTexture(name: string, revision: number): Promise<THREE.Texture | undefined> {
  if (previewTextures.has(name)) return previewTextures.get(name);
  if (pendingTextures.has(name)) return pendingTextures.get(name);
  const promise = (async () => {
    try { const info = await api.imageInfo(name); if (!info.exists || revision !== sceneRevision) return;
      const url = await api.image(name), texture = await new THREE.TextureLoader().loadAsync(url);
      if (revision !== sceneRevision) { texture.dispose(); return; }
      const fields = info.declaration?.fields ?? {};
      texture.colorSpace = fields.gammaCorrection === false || fields.isNormal === true ? THREE.NoColorSpace : THREE.SRGBColorSpace;
      texture.wrapS = fields.clampToEdgeU === true ? THREE.ClampToEdgeWrapping : THREE.RepeatWrapping;
      texture.wrapT = fields.clampToEdgeV === true ? THREE.ClampToEdgeWrapping : THREE.RepeatWrapping;
      if (fields.disableMips === true) { texture.generateMipmaps = false; texture.minFilter = THREE.LinearFilter; }
      previewTextures.set(name, texture); return texture;
    } catch { return; }
  })(); pendingTextures.set(name, promise); return promise;
}
function diffuseParameter(material: MaterialDescriptor) { return material.parameters.find(p => p.name === 'u_diffuse1Tex'); }
async function modelPreviewMaterial(node: ObjectNode, revision: number, baked=false,animated=false) {
  const material=new THREE.MeshStandardMaterial({color:0xffffff,roughness:.85,side:THREE.DoubleSide});
  try{
    const description=effectiveLevelMeshMaterial(node,current!.level);
    let promise=modelPrograms.get(description.shaderName);if(!promise){promise=api.shaderProgram(description.shaderName);modelPrograms.set(description.shaderName,promise!);}
    const program=await promise!;if(revision!==sceneRevision)return material;
    const boundary=modelDrawBoundary(node,current!.level,program,baked,animated);
    if(boundary){material.userData.modelBoundary=boundary;return material;}
    for(const variable of program.variables.filter(v=>v.storage==='uniform'&&v.type==='sampler2D')){
      const name=description.parameters.find(p=>p.name===variable.name)?.texture;if(!name)continue;
      let exists=modelImages.get(name);if(!exists){exists=api.imageInfo(name).then(info=>info.exists);modelImages.set(name,exists!);}
      if(!await exists){material.userData.modelBoundary=`Texture unavailable: ${name}`;return material;}
    }
    const state=modelRenderState(program.definition.group);
    material.side=state.metalCull===2?THREE.FrontSide:THREE.DoubleSide;material.transparent=state.colors[0].blend;material.depthWrite=state.depth.write;material.depthTest=state.depth.test;
    material.userData.nativeRenderState=state;material.userData[program.definition.group==='FogVolume'?'nativeFogVolume':'nativeModel']={shader:description.shaderName,group:program.definition.group,usesTime:program.variables.some(v=>v.storage==='uniform'&&v.name==='u_time')};
  }catch(e){material.userData.modelBoundary=String((e as Error).message);}
  return material;
}
async function updateMaterialPreview(node: ObjectNode, reuseGeometry = false) {
  beamoMaterials=undefined;
  const revision = sceneRevision;
  materialUpdates++;
  try {
  if(node.className==='LevelMaterial'){
    for(const owner of current!.objects.nodes.filter(n=>['Beamo','BeamoDecal'].includes(n.className))){
      const uses=(['primary','secondary'] as const).some(pass=>{try{return materialForBeamo(owner.id,pass).materialNodeId===node.id;}catch{return false;}});
      if(uses)await updateMaterialPreview(owner,true);
    }
    return;
  }
  if(['Beamo','BeamoDecal'].includes(node.className)){
    const old=entityObjects.get(node.id);scene.userData.beamoBoundaries=(scene.userData.beamoBoundaries??[]).filter((b:{nodeId:number})=>b.nodeId!==node.id);
    let next:THREE.Group;try{next=await beamoPreviewObject(node,revision,reuseGeometry?old?.userData.beamoGeometry:undefined);}catch(e){next=new THREE.Group();scene.userData.beamoBoundaries.push({nodeId:node.id,reason:String((e as Error).message)});}
if(revision!==sceneRevision){next.traverse(o=>{if(o instanceof THREE.Mesh){o.geometry.dispose();(o.material as THREE.Material).dispose();}});return;}
    old?.traverse(o=>{if(o instanceof THREE.Mesh){o.geometry.dispose();(o.material as THREE.Material).dispose();}});if(old)content.remove(old);objectTransform(node,next);next.userData.nodeId=node.id;content.add(next);entityObjects.set(node.id,next);if(selected.size===1&&selected.has(node.id))selectNode(node.id);return;
  }
  if (node.className === 'LevelMesh') {
    const object = entityObjects.get(node.id); if (!(object instanceof THREE.Mesh) || !object.userData.resourceModel) return;
    const material = await modelPreviewMaterial(node, revision,!!object.userData.boundBake||!!object.userData.defaultModelLighting,object.geometry.userData.nativeAnimated);
    if (revision !== sceneRevision) { material.map?.dispose(); material.dispose(); return; }
    const old = (object.userData.previewMaterial ?? object.material) as THREE.MeshStandardMaterial; old.map?.dispose(); old.dispose();
    if (object.material === old) object.material = material;
    if (object.userData.previewMaterial) object.userData.previewMaterial = material;
    if (object.userData.boundBake) applyBakeChannel(object);
  }
  } finally { materialUpdates--; }
}
async function beamoPreviewObject(node:ObjectNode,revision:number,geometry?:BeamoDrawGeometry){
 const root=new THREE.Group();root.userData.nodeId=node.id;
 // Shared material edits change bindings, while the recovered upload bytes
 // depend on the Beamo owner, resource and bake. Owner edits still re-upload.
 const data:BeamoDrawGeometry=geometry??await api.beamoGeometry(node.id);root.userData.beamoGeometry=data;
 const inverse=new THREE.Matrix4().fromArray(data.matrix).invert(),positions=new Float32Array(data.counts.vertices*3),colors=new Float32Array(data.counts.vertices*4),dv=new DataView(data.vertices.buffer,data.vertices.byteOffset,data.vertices.byteLength),p=new THREE.Vector3();
 for(let i=0;i<data.counts.vertices;i++){p.set(dv.getFloat32(i*48,true),dv.getFloat32(i*48+4,true),dv.getFloat32(i*48+8,true)).applyMatrix4(inverse).toArray(positions,i*3);for(let j=0;j<4;j++)colors[i*4+j]=data.vertices[i*48+12+j]/255;}
 for(const pass of data.passes){
  const selected=materialForBeamo(node.id,pass.pass),shader=selected.material.shaderName,material=new THREE.MeshBasicMaterial({vertexColors:true});let boundary:string|null=null;
  try{let promise=modelPrograms.get(shader);if(!promise){promise=api.shaderProgram(shader);modelPrograms.set(shader,promise!);}const program=await promise!;boundary=materialDrawBoundary(selected.material,program,true,false,'material');
   if(!boundary)for(const v of program.variables.filter(v=>v.storage==='uniform'&&v.type==='sampler2D')){const name=selected.material.parameters.find(p=>p.name===v.name)?.texture;if(name){let exists=modelImages.get(name);if(!exists){exists=api.imageInfo(name).then(info=>info.exists);modelImages.set(name,exists!);}if(!await exists){boundary=`Texture unavailable: ${name}`;break;}}}
   if(!boundary){const state=modelRenderState(program.definition.group);material.side=state.metalCull===2?THREE.FrontSide:THREE.DoubleSide;material.transparent=state.colors[0].blend;material.depthWrite=state.depth.write;material.userData.nativeRenderState=state;material.userData.nativeModel={shader,group:program.definition.group,usesTime:program.variables.some(v=>v.storage==='uniform'&&v.name==='u_time'),materialNodeId:selected.materialNodeId,beamoPass:pass.pass};}
  }catch(e){boundary=String((e as Error).message);}
  if(revision!==sceneRevision){material.dispose();continue;}
  if(boundary){scene.userData.beamoBoundaries.push({nodeId:node.id,reason:`${pass.pass}: ${boundary}`});material.dispose();continue;}
  const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.BufferAttribute(positions,3));g.setAttribute('color',new THREE.BufferAttribute(colors,4));g.setIndex(new THREE.BufferAttribute(pass.indices,1));const child=new THREE.Mesh(g,material);child.userData.beamoDraw=data;child.userData.nodeId=node.id;root.add(child);
 }
 return root;
}
async function loadMaterials(revision: number) {
  materials.clear(); if (!current || revision !== sceneRevision) return;
  // LevelMaterial nodes describe independent objects and may repeat IDs.
  // Terrain/SkirtBarn use MaterialDefBarn, in its native ordinal order.
  bakedDefs = nativeMaterialDefs(current.level);
  for (const def of bakedDefs) materials.set(def.materialId, { name: def.shaderName, image: def.textures[0]?.texture, shader: def.shaderName, color: new THREE.Color().fromArray(def.color) });
  if (!materials.has(materialId)) materialId = bakedDefs[0].materialId;
}

function ballHit(event?:PointerEvent) {
  const r=$('viewport').getBoundingClientRect();pointer.set(event?(event.clientX-r.left)/r.width*2-1:0,event?-(event.clientY-r.top)/r.height*2+1:0);raycaster.setFromCamera(pointer,camera);
  const objects=[...geometryObjects.values()].filter(o=>['terrain','skirt'].includes(o.userData.bakedView?.kind));
  for(const o of entityObjects.values())if(o instanceof THREE.Mesh&&o.userData.resourceModel&&o.visible)objects.push(o);
  return raycaster.intersectObjects(objects,false).find(h=>h.object.visible);
}
function ballContactPosition(hit:THREE.Intersection) {
  const normal=hit.face?hit.face.normal.clone().applyMatrix3(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld)).normalize():new THREE.Vector3(0,1,0);
  if(normal.dot(camera.position.clone().sub(hit.point))<0)normal.negate();return hit.point.clone().addScaledVector(normal,.60001).toArray();
}
function ballSpawn(){const hit=ballHit();return hit?ballContactPosition(hit):(mode==='avatar'?avatarCamera.target:orbit.target).toArray();}
function ballCollisionMeshes():CollisionMesh[] {
  const result:CollisionMesh[]=[];scene.updateMatrixWorld(true);
  for(const object of geometryObjects.values()) {
    const view=object.userData.bakedView as MeshView|undefined;
    if(view&&['terrain','skirt'].includes(view.kind))result.push({positions:view.positions,indices:view.indices,matrix:object.matrixWorld.toArray()});
  }
  for(const [id,object] of entityObjects)if(object instanceof THREE.Mesh&&object.userData.resourceModel&&object.visible) {
    const node=current?.objects.nodes[id];if(node&&findField(node,'collide')&&numberField(node,'collide')===0)continue;
    const position=object.geometry.getAttribute('position'),index=object.geometry.index;
    result.push({positions:Float32Array.from(position.array),indices:index?Uint32Array.from(index.array):Uint32Array.from({length:position.count},(_,i)=>i),matrix:object.matrixWorld.toArray()});
  }
  return result;
}

function avatarPreviewState(position:number[]):PositionedAvatar {
  const avatar:PositionedAvatar={state:{storage:new Uint8Array(AVATAR_PHYSICAL_STATE_BYTES)},canSetPosition:true,handhold:null,groundExtent:2.5};
  // Zero e4 and world-up offset-axis are explicit preview inputs, not native
  // constructor defaults. Keep the original state writes/0.01 lift intact.
  avatarWrite(avatar.state,0x10,[...position.slice(0,3),1]);avatarWrite(avatar.state,0x60,[0,0,-1,0]);return avatar;
}
function focusAvatar(){const pose=avatarPreview.object.userData.spawn;avatarCamera.reset(avatarPreview.object.position.toArray(),pose?.euler);}
function placeAvatarAtCandidate(id:number){
  if(!current||!avatarPreview.resources)throw new Error('请先加载角色资源');
  const candidate=avatarSpawnCandidates(current.objects.nodes).find(c=>c.id===id);if(!candidate?.available)throw new Error(candidate?.reason??'请选择出生点');
  if(physicsBall.state&&avatarPosition)avatarWrite(avatarPosition.state,0x10,[physicsBall.state.position[0],physicsBall.state.position[1]-.6,physicsBall.state.position[2],1]);physicsBall.stop();$('physics-ball').classList.remove('active');$('physics-ball').setAttribute('aria-pressed','false');
  const markers=new Map<AvatarMarker,ObjectNode>();
  const marker=(id:number):AvatarMarker=>{const node=current!.objects.nodes[id],p=vectorField(node,'pos')!,m={position:[...p.slice(0,3),p[3]??1],quaternion:vectorField(node,'quat')!};markers.set(m,node);return m;};
  const destination=marker(candidate.markerId!),relative=candidate.relativeMarkerId===null?null:marker(candidate.relativeMarkerId);
  const avatar=avatarPosition??=avatarPreviewState(avatarPreview.object.position.toArray()),barn={avatars:[avatar],moved:false},rays=new THREE.Raycaster(),rayTargets=[...geometryObjects.values(),...entityObjects.values()].filter(o=>o instanceof THREE.Mesh&&!o.userData.editorHelper&&o.visible);
  const result=updateOriginalAvatarSetPos({marker:destination,relMarker:relative,setLevelStartPosition:candidate.flags.setLevelStartPosition!,randomGroundInMarker:candidate.flags.randomGroundInMarker!,breakHandHold:candidate.flags.breakHandHold!,killMomentum:candidate.flags.killMomentum!,onGround:candidate.flags.onGround!},{
    // Explicit editor session/collision services. Account startup overrides,
    // original material channel 0x50 and collision/handhold lifecycle are pending.
    barn:()=>barn,override:()=>false,breakHandHold:()=>{},
    matrix:(m,bounds)=>bounds?RAIL_MARKER_OBB.slice():railMarkerTransform({position:m.position,quaternion:m.quaternion,scale:vectorField(markers.get(m)!,'scale')!}),
    inverse:m=>new THREE.Matrix4().fromArray(m).invert().toArray().map(Math.fround),product:(a,b)=>new THREE.Matrix4().fromArray(a).multiply(new THREE.Matrix4().fromArray(b)).toArray().map(Math.fround),
    setPosition:(a,p,immediate)=>setOriginalAvatarPosition(a,p,immediate,{group:()=>null,member:()=>false,peers:()=>[],setState:(state,position,immediate)=>{const context={offsetAxis:[0,1,0,0]};if(immediate)setOriginalPhysicalPositionImmediate(state,position,context);else setOriginalPhysicalPosition(state,position,true,context);}}),
    rand:()=>Math.floor(Math.random()*2**31),
    segment:(start,end,bounds)=>{const inverse=new THREE.Matrix4().fromArray(bounds).invert(),a=new THREE.Vector3().fromArray(start).applyMatrix4(inverse),b=new THREE.Vector3().fromArray(end).applyMatrix4(inverse),ray=new THREE.Ray(a,b.sub(a).normalize()),hit=ray.intersectBox(new THREE.Box3(new THREE.Vector3(-1,-1,-1),new THREE.Vector3(1,1,1)),new THREE.Vector3());return hit?[...hit.applyMatrix4(new THREE.Matrix4().fromArray(bounds)).toArray().map(Math.fround),1]:null;},
    raycast:(start,direction,length)=>{if(!(length>0))return null;rays.set(new THREE.Vector3().fromArray(start),new THREE.Vector3().fromArray(direction));rays.near=0;rays.far=length;const hit=rays.intersectObjects(rayTargets,false)[0];if(!hit)return null;const normal=hit.face!.normal.clone().applyMatrix3(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld)).normalize();if(normal.y<0)normal.negate();return {position:[...hit.point.toArray().map(Math.fround),1],normal:[...normal.toArray().map(Math.fround),0],groundAttribute:0};},
    atan2:(y,x)=>Math.fround(Math.atan2(y,x)),asin:x=>Math.fround(Math.asin(x)),acos:x=>Math.fround(Math.acos(x)),logPosition:()=>{},start:()=>{}
  });
  const position=avatarRead(avatar.state,0x10),euler=avatarRead(avatar.state,0x30);avatarPreview.place(position,euler);avatarSpawnId=id;
  avatarPreview.object.userData.spawn={id,markerId:candidate.markerId,relativeMarkerId:candidate.relativeMarkerId,position,desiredPosition:avatarRead(avatar.state,0x130),previousPosition:avatarRead(avatar.state,0x20),velocity:avatarRead(avatar.state,0x50),physicalFlags:[avatar.state.storage[0x120],avatar.state.storage[0xbc8],avatar.state.storage[0xc60]],euler,result,scope:'原 Update/物理位置写入/相机重置 + 编辑器矩阵/碰撞/运行参数服务'};
  $('tree').dataset.avatarSpawn=JSON.stringify(avatarPreview.object.userData.spawn);focusAvatar();renderTree();status(`Avatar 已放到 ${candidate.name}；使用编辑器落地与移动预览`);
}
async function buildScene(frame = true) {
  if (!current) return; disposeScene(); const revision = sceneRevision; const view = current; scene.userData.beamoBoundaries=[];scene.userData.level=view.level;scene.userData.entityCloud=!!view.meshes.cloud;scene.userData.waterEffects=view.objects.nodes.some(n=>n.className==='Water');scene.userData.flowerEffects=view.objects.nodes.some(n=>n.className==='FlowerPatch');scene.userData.candleEffects=view.objects.nodes.some(n=>n.className==='CandleObject');scene.userData.bakedDisplay=bakedDisplay; selected = new Set(); selectedGeometry = selectedBake = undefined; status('正在读取模型与材质…');
  await loadMaterials(revision); if (revision !== sceneRevision) return;
  for (const g of view.meshes.geometries) {
    if (!g.vertexCount) continue;
    let object: THREE.Mesh;
    if (g.stride >= 36) object = createBakedObject(g, bakedDefs, bakedDisplay, false);
    else {
      const geo = new THREE.BufferGeometry(); geo.setAttribute('position', new THREE.BufferAttribute(g.positions, 3)); geo.setIndex(new THREE.BufferAttribute(g.indices, 1));
      const mat = new THREE.MeshBasicMaterial({ color: g.kind === 'cloud' ? 0xe9f1ff : 0x66798b, side: THREE.DoubleSide, wireframe: true, toneMapped: false });
      object = new THREE.Mesh(geo, mat); object.userData.geometryId = g.id;
    }
    object.userData.editorHelper = g.kind === 'cloud' || g.kind === 'occluder';
    object.visible = object.userData.editorHelper ? showHelperFrames : true; content.add(object); geometryObjects.set(g.id, object);
  }

  ignitionController.configure(view.level);
  const nodes = view.objects.nodes; let missing = 0;
  avatarCameraEvents.configure(nodes);objectPlayback.configure(nodes);
  const names = [...new Set(nodes.filter(n => n.className === 'LevelMesh').map(resourceName).filter(Boolean))]; let cursor = 0;
  await Promise.all(Array.from({ length: Math.min(5, names.length) }, async () => { while (cursor < names.length) { const name = names[cursor++]; try { const r: ResourceMesh = await api.resourceMesh(name); if (revision !== sceneRevision) return; const g=resourceModelGeometry(r); resourceMeshes.set(name, g);resourceModels.set(name,r); } catch { missing++; } } }));
  if (revision !== sceneRevision) return;
  const animationDefaults:{id:number;name:string;action?:string;error?:string}[]=[];
  let animations:ResourceAnimationList|undefined;
  if([...resourceModels.values()].some(r=>r.animated))try{animations=await (modelAnimationList??=api.resourceAnimationList());}catch(error){animationDefaults.push({id:-1,name:'AnimationList',error:String((error as Error).message)});}
  if(revision!==sceneRevision)return;
  const construct=async(n:ObjectNode,prepared?:{bake?:{stream:BakeStream;bound:BoundBake};geometry?:BeamoDrawGeometry;error?:string})=>{
    let object: THREE.Object3D | undefined;
    if (n.className === 'LevelMesh') { const g = resourceMeshes.get(resourceName(n)); if (g) {
      let bake: { stream: BakeStream; bound: BoundBake } | undefined;
      try { bake = prepared?prepared.bake:await api.bakedResource(resourceName(n), numberField(n, 'bstGuid')); } catch { /* Original loader skips incompatible resources; do not synthesize lighting. */ }
      const mesh = new THREE.Mesh(bake ? g.clone() : g, await modelPreviewMaterial(n, revision,true,g.userData.nativeAnimated)); mesh.userData.sharedResource = !bake; mesh.userData.resourceModel = true;
      if(!bake)mesh.userData.defaultModelLighting=defaultModelLighting(g.getAttribute('position').count);
      if (bake) attachBake(mesh, bake.stream, bake.bound); object = mesh;
      const resource=resourceModels.get(resourceName(n))!,settings=resourceModelDefaultAnimationSettings(n);
      if(resource.animated&&settings.play){
        try{if(!animations)throw new Error('动画列表未加载');modelAnimations.startDefault(n.id,mesh,resource,animations,{speedMult:settings.speedMult,randomStart:settings.randomStart?Math.floor(Math.random()*2**31):undefined});animationDefaults.push({id:n.id,name:resourceName(n),action:modelAnimations.snapshot(n.id)!.name});}
        catch(error){animationDefaults.push({id:n.id,name:resourceName(n),error:String((error as Error).message)});}
      }
    } }
    if(['Beamo','BeamoDecal'].includes(n.className)){try{if(prepared?.error)throw new Error(prepared.error);object=await beamoPreviewObject(n,revision,prepared?.geometry);}catch(e){scene.userData.beamoBoundaries.push({nodeId:n.id,reason:String((e as Error).message)});}if(revision!==sceneRevision)return;}
    if (n.className === 'Marker') { object = new THREE.Mesh(new THREE.BoxGeometry(1, 1, 1), new THREE.MeshBasicMaterial({ color: 0xddbc77, wireframe: true, transparent: true, opacity: .35 })); object.userData.editorHelper = true; }
    if (!object && (vectorField(n, 'pos') || vectorField(n, 'transform')) && !['Rail', 'EnvNode'].includes(n.className)) { object = new THREE.Mesh(new THREE.OctahedronGeometry(.45), new THREE.MeshBasicMaterial({ color: 0x70aabe, wireframe: true })); object.userData.editorHelper = true; }
    if (object?.userData.editorHelper) object.visible = showHelperFrames;
    if (object) { object.userData.nodeId = n.id; objectTransform(n, object); content.add(object); entityObjects.set(n.id, object); }
  };
  const renderNodes=nodes.filter(n=>['LevelMesh','Beamo','BeamoDecal'].includes(n.className));
  for(let at=0;at<renderNodes.length;at+=32){
    const chunk=renderNodes.slice(at,at+32),prepared=await api.modelPreviewBatch(chunk.map(n=>n.id));
    if(revision!==sceneRevision)return;
    const byId=new Map<number,any>(prepared.map((entry:any)=>[entry.id,entry]));
    for(const node of chunk){await construct(node,byId.get(node.id));if(revision!==sceneRevision)return;}
    await new Promise<void>(resolve=>requestAnimationFrame(()=>resolve()));
  }
  for(const node of nodes)if(!['LevelMesh','Beamo','BeamoDecal'].includes(node.className))await construct(node);
  scene.userData.modelAnimationDefaults=animationDefaults;if(renderer?.domElement)renderer.domElement.dataset.modelAnimationDefaults=JSON.stringify(animationDefaults);lastModelAnimationFrame=0;
  for(const n of nodes)if(n.className==='LevelMesh'&&/CharFishGroupAnim/i.test(resourceName(n)))modelAnimations.stop(n.id);
  await creatures.load(nodes,content,entityObjects,async name=>{const r=resourceModels.get(name)??await api.resourceMesh(name);if(revision===sceneRevision)resourceModels.set(name,r);return r;},animations,objectTransform,()=>revision===sceneRevision,current!.level);
  if(revision!==sceneRevision)return;updateCreatureControls();
  refreshRails(); refreshMapWire();
  await prepareInteractionScene(content,()=>revision===sceneRevision);
  if(revision!==sceneRevision)return;
  if(mode==='avatar'){
    try{const resources:AvatarPreviewResources=await api.avatarPreviewResources();if(revision!==sceneRevision)return;avatarPreview.load(resources);avatarPreview.place([0,0,0]);avatarPosition=avatarPreviewState([0,0,0]);avatarCamera.reset([0,0,0]);}
    catch(e){avatarResourceError=String((e as Error).message);}
  }
  renderTree(); renderInspector(); const available = renderer?.isAvailable(); $('empty').hidden = !!available && (content.children.length > 0||!!avatarPreview.resources); if (!available) { $('empty').replaceChildren(textElement('h1', '当前设备的 3D 视口不可用'), textElement('p', '可继续通过左侧列表编辑、查看和保存地图数据。')); } else if (!$('empty').hidden) { $('empty').replaceChildren(textElement('div', '✧', 'empty-symbol'), textElement('h1', 'WorldEmpty · 空地图'), textElement('p', android?'可在列表编辑配置，或进入网格模式，从工具面板新增几何。':'可在对象列表编辑配置，或进入 Meshes 模式右键新增几何。')); }
  $('level-label').textContent = view.level; $('stats').textContent = `${nodes.length.toLocaleString()} 对象 · ${view.meshes.geometries.reduce((n, g) => n + g.indexCount / 3, 0).toLocaleString()} 地图三角面`; updateState(view); if(frame&&mode!=='avatar')frameInitialScene(); status(`已打开 ${view.level}${missing ? `；${missing} 个模型资源未加载` : ''}`);
}
function refreshRails() {
  for (const [id, object] of entityObjects) { const n = current?.objects.nodes[id]; if (n?.className === 'Rail') { content.remove(object); if (object instanceof THREE.Line) { object.geometry.dispose(); (object.material as THREE.Material).dispose(); } entityObjects.delete(id); } }
  for (const node of current?.objects.nodes.filter(n => n.className === 'Rail') ?? []) {
    let positions: number[][];
    try { positions = railInspectionPoints(node, current!.objects.nodes); }
    catch { continue; }
    const points = positions.map(p => new THREE.Vector3().fromArray(p));
    const line = new THREE.Line(new THREE.BufferGeometry().setFromPoints(points), new THREE.LineBasicMaterial({ color: 0x7acbd4, transparent: true, opacity: .65 }));
    line.userData.nodeId = node.id; line.userData.editorHelper = true; line.visible = showHelperFrames;
    content.add(line); entityObjects.set(node.id, line);
  }
}
function updateAvatarCameraEventStatus(){
 const output=document.getElementById('avatar-camera-event-status');if(!output)return;const state=avatarCameraEvents.snapshot();if(!state){output.textContent='尚未运行相机事件';delete output.dataset.state;return;}output.dataset.state=JSON.stringify(state);output.textContent=`#${state.id} ${state.running?'运行中':'已停止'} · ${state.elapsed.toFixed(2)} 秒${state.weight===null?` · ${state.targets.length} 个关键帧`:` · 权重 ${state.weight.toFixed(3)}`}`;const stop=document.getElementById('avatar-camera-event-stop') as HTMLButtonElement|null;if(stop)stop.disabled=!state.running;
}
function renderTree() {
  const tree = $('tree'); tree.replaceChildren(); const query = $<HTMLInputElement>('search').value.trim().toLowerCase(); if (!current) return;
  $('left-title').textContent = mode === 'objects' ? '场景对象' : mode === 'meshes' ? 'Meshes 工具' : 'Avatar 预览'; $('object-count').textContent = String(current.objects.nodes.length);
  if (mode === 'avatar') {
    const controls = textElement('div', '', 'tool-options');
    const resources=avatarPreview.resources,candidates=avatarSpawnCandidates(current.objects.nodes);
    controls.append(textElement('p',resources?'原角色网格静态预览；动画和原外观待恢复。移动、跳跃与飞行使用编辑器碰撞预览。':'交互球移动、跳跃、飞行和地图碰撞预览。角色资源未加载。','tool-note'));
    if(avatarResourceError)controls.append(textElement('p',avatarResourceError,'tool-note'));
    if(resources){
      controls.append(textElement('p',`已加载：${resources.parts.map(p=>({body:'身体',hair:'头发',wing:'斗篷'} as Record<string,string>)[p.slot]??p.slot).join('、')}`,'tool-note'));
      const scale=document.createElement('input');scale.id='avatar-scale';scale.type='number';scale.min='.01';scale.max='10';scale.step='.01';scale.value=String(avatarPreview.previewScale);
      const scaleLabel=textElement('label','预览缩放');scaleLabel.append(scale);controls.append(scaleLabel);scale.onchange=()=>{try{avatarPreview.setScale(Number(scale.value));}catch(e){toast(String((e as Error).message),true);scale.value=String(avatarPreview.previewScale);}};
      controls.append(textElement('p','当前缩放用于编辑器显示，原角色比例待恢复。','tool-note'),textElement('p','Avatar 使用独立相机；进入机位按原重置链计算，连续跟随与避障仍待恢复。','tool-note'));
      const spawn=document.createElement('select');spawn.id='avatar-spawn';spawn.setAttribute('aria-label','AvatarSetPos 出生点');spawn.add(new Option(`选择出生点（${candidates.length} 个候选）`,''));
      for(const candidate of candidates){const option=new Option(`#${candidate.id} ${candidate.name}${candidate.reason?' · '+candidate.reason:''}`,String(candidate.id));option.disabled=!candidate.available;spawn.add(option);}
      if(candidates.some(c=>c.id===avatarSpawnId))spawn.value=String(avatarSpawnId);
      const place=textElement('button','放到所选出生点') as HTMLButtonElement;place.id='avatar-place';place.disabled=spawn.value==='';spawn.onchange=()=>{avatarSpawnId=spawn.value===''?undefined:Number(spawn.value);place.disabled=spawn.value==='';};place.onclick=()=>{try{placeAvatarAtCandidate(Number(spawn.value));}catch(e){toast(String((e as Error).message),true);}};
      controls.append(spawn,place,textElement('p','候选由 Objects.level.bin 读取；原地图启动入口选择仍待恢复。','tool-note'));
      if(avatarPreview.object.userData.spawn)controls.append(textElement('p',`当前出生点 #${avatarPreview.object.userData.spawn.id}`,'tool-note'));
    }
    for (const [id, label] of [['physics-ball', '启用 / 关闭交互球'], ['physics-ball-reset', '放到视图中心'], ['physics-ball-follow', '跟随交互球'], ['physics-ball-fly', '飞行']]) {
      const title=resources&&id==='physics-ball'?'启用 / 关闭角色移动预览':resources&&id==='physics-ball-follow'?'跟随角色':label;
      const button = textElement('button', title); button.dataset.avatarAction = id; if(id!=='physics-ball-reset'){const pressed=$(id).getAttribute('aria-pressed')==='true';button.classList.toggle('active',pressed);button.setAttribute('aria-pressed',String(pressed));} button.onclick = () => $(id).click(); controls.append(button);
    }
    const events=avatarCameraEvents.list(),eventSelect=document.createElement('select');eventSelect.id='avatar-camera-event';eventSelect.setAttribute('aria-label','Objects 相机事件');eventSelect.add(new Option(`选择相机事件（${events.length} 个）`,''));
    for(const event of events){const option=new Option(`#${event.id} ${event.className}${event.reason?' · '+event.reason:''}`,String(event.id));option.disabled=!event.available;eventSelect.add(option);}
    const start=textElement('button','运行所选相机事件') as HTMLButtonElement;start.id='avatar-camera-event-start';start.disabled=true;eventSelect.onchange=()=>start.disabled=!eventSelect.value;start.onclick=()=>{try{avatarCameraEvents.start(Number(eventSelect.value));updateAvatarCameraEventStatus();}catch(e){toast(String((e as Error).message),true);}};
    const stop=textElement('button','停止相机事件') as HTMLButtonElement;stop.id='avatar-camera-event-stop';stop.disabled=true;stop.onclick=()=>{avatarCameraEvents.stop();avatarCamera.clearShake();updateAvatarCameraEventStatus();};
    const output=textElement('p','尚未运行相机事件','tool-note');output.id='avatar-camera-event-status';controls.append(textElement('p','相机事件预览：位置震动已接入；关键帧震动与原避障待恢复。','tool-note'),eventSelect,start,stop,output);
    tree.append(controls);updateAvatarCameraEventStatus();return;
  }
  if (mode === 'objects') {
    for (const c of current.objects.classes) { const all = current.objects.nodes.filter(n => n.classIndex === c.id), nodes = all.filter(n => `${c.name} ${n.name} ${displayName(n)}`.toLowerCase().includes(query)); if (query && !nodes.length && !c.name.toLowerCase().includes(query)) continue;
      const details = document.createElement('details'); details.open = !!query || nodes.some(n => selected.has(n.id)); const summary = textElement('summary', c.name); summary.append(textElement('span', String(all.length), 'badge')); details.append(summary);
      for (const n of nodes) { const row = textElement('button', displayName(n), 'tree-row'); row.dataset.nodeId = String(n.id); row.classList.toggle('selected', selected.has(n.id)); row.title = `${n.className} · ${n.name}`; if (displayName(n) !== n.name) row.append(textElement('small', n.name)); row.onclick = e => selectNode(n.id, multiSelect(e)); details.append(row); } if (!all.length) details.append(textElement('div', '内嵌结构声明或无独立对象', 'muted placeholder')); tree.append(details);
    }
    return;
  }
  const tools = textElement('div', '', 'tool-options'); for (const [id, name] of [['select', '选择 / 变换'], ['paint', '材质涂抹'], ['raise', '凸起笔刷 · 裙边'], ['lower', '下凹笔刷 · 裙边'], ['smooth', '平滑笔刷 · 裙边']]) { const b = textElement('button', name); b.classList.toggle('active', tool === id); b.onclick = () => { tool = id; transform.detach(); renderTree(); updateBrushHud(); }; tools.append(b); }
  tools.append(textElement('label', `笔刷半径：${radius}`)); const size = document.createElement('input'); size.type = 'range'; size.min = '.5'; size.max = '100'; size.step = '.5'; size.value = String(radius); size.oninput = () => { radius = Number(size.value); size.previousElementSibling!.textContent = `笔刷半径：${radius}`; updateBrushHud(); }; tools.append(size);
  tools.append(textElement('label', `强度：${strength}`)); const s = document.createElement('input'); s.type = 'range'; s.min = '.01'; s.max = '1'; s.step = '.01'; s.value = String(strength); s.oninput = () => { strength = Number(s.value); s.previousElementSibling!.textContent = `强度：${strength}`; updateBrushHud(); }; tools.append(s);
  tools.append(textElement('label', '衰减样式')); const styles = document.createElement('select'); for (const [id, name] of [['smooth', '平滑'], ['linear', '线性'], ['constant', '恒定']]) styles.add(new Option(name, id)); styles.value = falloff; styles.onchange = () => falloff = styles.value; tools.append(styles);
  tools.append(textElement('div', '地形可保存材质涂抹。凸起、下凹和平滑作用于裙边；原版地形碰撞与区块重建仍待完成。', 'tool-note')); tree.append(tools);
  for (const [kind, title] of [['terrain', '地形'], ['skirt', '裙边'], ['cloud', '云代理'], ['occluder', '遮挡几何']]) { const gs = current.meshes.geometries.filter(g => g.kind === kind && (!query || g.id.includes(query))); const details = document.createElement('details'); details.open = true; const sum = textElement('summary', title); sum.append(textElement('span', String(gs.length), 'badge')); details.append(sum); for (const g of gs) { const row = textElement('button', `${g.id} · ${g.vertexCount.toLocaleString()} 顶点`, 'tree-row'); row.classList.toggle('selected', selectedGeometry === g.id); row.onclick = () => selectGeometry(g.id); details.append(row); } tree.append(details); }
  const d = document.createElement('details'); const sum = textElement('summary', '模型烘焙'); sum.append(textElement('span', String(current.meshes.bakes.length), 'badge')); d.append(sum); for (const b of current.meshes.bakes.filter(b => !query || b.name.toLowerCase().includes(query))) { const row = textElement('button', b.name, 'tree-row'); row.dataset.bakeId = b.id; row.append(textElement('small', `GUID ${b.guid}`)); row.classList.toggle('selected', selectedBake === b.id); row.onclick = () => selectBake(b.id); d.append(row); } tree.append(d);
}
function clearBoxes() { for (const b of selectionBoxes) { helpers.remove(b); if (b instanceof MeshWireOverlay) b.dispose(); else { b.geometry.dispose(); (b.material as THREE.Material).dispose(); } } selectionBoxes.length = 0; }
function addBox(object: THREE.Object3D, color = 0x91e2ca) { object.updateMatrixWorld(true); const box = selectionOutline === 'bounds' ? new BoundsOverlay(object, color) : new MeshWireOverlay(object, color, true); box.visible = selectionOutline !== 'hidden'; selectionBoxes.push(box); helpers.add(box); }
function refreshMapWire() { if (mapWireOverlay) { scene.remove(mapWireOverlay); mapWireOverlay.dispose(); mapWireOverlay = undefined; } if (wire) { mapWireOverlay = new MeshWireOverlay(content, 0x78b9dc); scene.add(mapWireOverlay); } }
function clumpChildren(id: number, seen = new Set<number>()): number[] { if (seen.has(id)) return []; seen.add(id); const n = current!.objects.nodes[id]; if (!n) return []; const result = [id]; if (n.className === 'Clump') for (const ref of findField(n, 'data')?.children ?? []) result.push(...clumpChildren(Number(ref.value), seen)); return result; }
function clearSelection() { selected.clear(); selectedGeometry = selectedBake = undefined; transform.detach(); clearBoxes(); renderTree(); renderInspector(); }
function selectNode(id: number, multi = false) { selectedGeometry = selectedBake = undefined; if (!multi) selected.clear(); if (multi && selected.has(id)) selected.delete(id); else selected.add(id); clearBoxes(); transform.detach(); for (const i of selected) for (const child of clumpChildren(i)) { const object = entityObjects.get(child); if (object) addBox(object); }
  if (selected.size === 1) { const object = entityObjects.get([...selected][0]); const node = current!.objects.nodes[[...selected][0]]; if (object && (findField(node, 'transform') || findField(node, 'pos'))) transform.attach(object); }
  renderTree(); renderInspector(); }
function selectGeometry(id: string) { selected.clear(); selectedBake = undefined; selectedGeometry = id; transform.detach(); clearBoxes(); const object = geometryObjects.get(id); if (object) { addBox(object); if (tool === 'select' && !['terrain', 'cloud'].includes(current!.meshes.geometries.find(g => g.id === id)!.kind)) transform.attach(object); } renderTree(); renderInspector(); }
function selectBake(id: string) { selected.clear(); selectedGeometry = undefined; selectedBake = id; clearBoxes(); transform.detach(); const bake = current!.meshes.bakes.find(b => b.id === id)!; for (const n of current!.objects.nodes.filter(n => numberField(n, 'bstGuid', -1) === bake.guid)) { const o = entityObjects.get(n.id); if (o) addBox(o); } renderTree(); renderInspector(); }
function focusSelection() {
  const objects = [...selected].flatMap(id => clumpChildren(id).map(child => entityObjects.get(child))).filter((o): o is THREE.Object3D => !!o);
  if (selectedGeometry && geometryObjects.has(selectedGeometry)) objects.push(geometryObjects.get(selectedGeometry)!);
  if (selectedBake) { const bake = current!.meshes.bakes.find(b => b.id === selectedBake)!; for (const node of current!.objects.nodes.filter(n => numberField(n, 'bstGuid', -1) === bake.guid)) { const object = entityObjects.get(node.id); if (object) objects.push(object); } }
  const box = new THREE.Box3(); for (const object of objects) { object.updateWorldMatrix(true, true); box.expandByObject(object); } frameBox(box);
}
function frameAll() { const box = new THREE.Box3(); for (const o of content.children) { if (o.visible && !(o.userData.nodeId !== undefined && current!.objects.nodes[o.userData.nodeId]?.className === 'Marker')) box.expandByObject(o); } if (box.isEmpty()) { camera.position.set(50, 40, 50); orbit.target.set(0, 0, 0); } else frameBox(box); }
// A level's distant sky/cloud models must not push the initial editor camera
// above its atmosphere. Full-scene framing remains available on the controller.
function frameInitialScene() {
  const box=new THREE.Box3();for(const object of geometryObjects.values())if((object.userData.bakedView as MeshView|undefined)?.kind==='terrain')box.expandByObject(object);
  if(box.isEmpty())frameAll();else frameBox(box);
}
function frameBox(box: THREE.Box3) { if (box.isEmpty()) return; const center = box.getCenter(new THREE.Vector3()), size = box.getSize(new THREE.Vector3()).length(); if (!Number.isFinite(size) || size > 1e6) return; const distance = Math.max(size * .85, 5); camera.position.copy(center).add(new THREE.Vector3(.6, .25, .7).normalize().multiplyScalar(distance)); orbit.target.copy(center); camera.near = Math.max(.05, distance / 20000); camera.far = Math.max(64000, distance * 10); camera.updateProjectionMatrix(); orbit.update(); }
function labelField(label: string, kind = '') { const e = textElement('div', '', 'field'), l = textElement('label', label); if (kind) l.append(textElement('small', kind)); e.append(l); return e; }
function renderField(f: Field, node: ObjectNode): HTMLElement {
  const container = labelField(f.name, f.encoding ?? f.kind);
  container.dataset.fieldId = f.id;
  if (f.nativeType) container.title = `原程序属性注册：${f.nativeType}`;
  if (f.children) { const details = document.createElement('details'); details.append(textElement('summary', `${f.kind === 'array' ? `${f.value} 项` : f.name}`)); for (const child of f.children) details.append(renderField(child, node)); container.append(details); return container; }
  const edit = (value: unknown, representation?: string) => enqueue(async () => { try { resetObjectPlayback();const result = await api.editObjects([{ id: f.id, value, representation }]); for (const updated of result.nodes as ObjectNode[]) { current!.objects.nodes[updated.id] = updated; const object = entityObjects.get(updated.id); if (object) objectTransform(updated, object); if (['LevelMaterial','Beamo','BeamoDecal'].includes(updated.className) || updated.className==='LevelMesh' && f.name !== 'transform') await updateMaterialPreview(updated); const env = document.querySelector<HTMLElement>(`[data-environment-node="${updated.id}"]`); if (env) await environmentDetails(env, updated.id); } objectPlayback.configure(current!.objects.nodes);refreshRails(); updateState(result); status(`已编辑 ${node.className}.${f.name}`); } catch (error) { renderInspector(); throw error; } });
  if (f.kind === 'vector' || f.kind === 'matrix4') { const parts = textElement('div', '', 'components'), values = [...f.value as number[]]; values.forEach((n, i) => { const input = document.createElement('input'); input.type = 'number'; input.step = 'any'; input.value = String(n); input.title = `${f.name}[${i}]`; input.onchange = () => { const prior = values[i]; values[i] = Number(input.value); void edit(values).catch(() => values[i] = prior); }; parts.append(input); }); container.append(parts); }
  else if (f.kind === 'bits32') { const row = textElement('div', '', 'bits'), select = document.createElement('select'); for (const [id, name] of [['uint', 'uint'], ['int', 'int'], ['float', 'float']]) select.add(new Option(name, id)); select.value = f.encoding && ['uint', 'int', 'float'].includes(f.encoding) ? f.encoding : 'uint'; const input = document.createElement('input'); input.type = 'number'; input.step = 'any'; input.value = String((f.value as any)[select.value]); select.onchange = () => input.value = String((f.value as any)[select.value] ?? ''); input.onchange = () => void edit(Number(input.value), select.value); row.append(select, input); container.append(row, textElement('small', f.encoding ? '默认类型来自原程序属性注册。' : '字段类型尚未确认，可切换原始位解释。', 'raw')); }
  else if (f.kind === 'reference') { const select = document.createElement('select'); select.add(new Option('空引用', String(0xffffffff))); for (const n of current!.objects.nodes) select.add(new Option(`#${n.id} ${n.className} · ${displayName(n)}`, String(n.id))); select.value = String(f.value); select.onchange = () => void edit(Number(select.value)); container.append(select); const jump = textElement('button', '定位引用对象'); jump.style.marginTop = '5px'; jump.onclick = () => { const id = Number(select.value); if (current?.objects.nodes[id]) { selectNode(id); focusSelection(); } }; container.append(jump); }
  else if (f.encoding === 'bool' && [0, 1].includes(Number(f.value))) { const input = document.createElement('input'); input.type = 'checkbox'; input.checked = !!f.value; input.onchange = () => void edit(Number(input.checked)); container.append(input); }
  else { const input = document.createElement('input'); input.type = ['u8', 'u16'].includes(f.kind) ? 'number' : 'text'; input.value = String(f.value); input.onchange = () => void edit(input.value); container.append(input); }
  return container;
}
function renderInspector() {
  const el = $('inspector'); el.replaceChildren(); $('selection-type').textContent = '未选择'; if (!current) return;
  if (mode === 'objects' && selected.size) { const node = current.objects.nodes[[...selected][selected.size - 1]]; $('selection-type').textContent = node.className; el.append(textElement('div', displayName(node), 'inspector-title'), textElement('div', `${node.name} · #${node.id}${selected.size > 1 ? ` · 已选 ${selected.size} 项` : ''}`, 'inspector-sub'));
    if (['LevelMaterial', 'LevelMesh'].includes(node.className)) { const button = textElement('button', '查看原版材质与着色器绑定'); button.id = 'inspect-material'; button.onclick = () => void run(async () => { $<HTMLDialogElement>('resource-dialog').showModal(); await showResources('materials', node.id); }); el.append(button); }
    if(resourceModels.get(entityObjects.get(node.id)?.userData.creatureResource??resourceName(node))?.animated){
      const button=textElement('button','模型动作预览'),pane=textElement('div','');button.id='inspect-model-animation';button.onclick=()=>void run(()=>modelAnimationDetails(pane,node));el.append(button,pane);
    }
    if (['EnvNode', 'SetEnvDefault', 'SetEnvHull'].includes(node.className)) { const button = textElement('button', '查看环境换算结果'), pane = textElement('div', '', 'environment-derived'); button.id = 'inspect-environment'; button.onclick = () => void run(() => { pane.dataset.environmentNode = String(node.id); return environmentDetails(pane, node.id); }); el.append(button, pane); }
    if(isSharedRuntimeEvent(node.className)){
      const button=textElement('button','运行事件') as HTMLButtonElement,reason=textElement('small','','raw');button.id='environment-event-start';button.disabled=true;
      button.onclick=()=>void run(async()=>{await api.triggerEnvironmentEvent(node.id);renderer?.invalidate();status(`已触发 ${node.className} #${node.id}`);});el.append(button,reason);
      void api.environmentRuntimeInfo().then(info=>{if(!button.isConnected)return;const event=info.events.find((e:{id:number;available:boolean;reason:string})=>e.id===node.id);button.disabled=!event?.available;if(event&&!event.available)reason.textContent=event.reason;}).catch(error=>{if(reason.isConnected)reason.textContent=(error as Error).message;});
    }
    if(['Beamo','BeamoDecal'].includes(node.className)){
      const button=textElement('button','查看烘焙关联'),pane=textElement('div','');button.id='inspect-beamo-bake';
      button.onclick=()=>void run(async()=>{const info=await api.beamoBakeInfo(node.id);if(!pane.isConnected)return;pane.replaceChildren();pane.dataset.beamoBake=JSON.stringify(info);
        pane.append(textElement('p',`${info.effectiveName} · GUID ${info.guid}${info.fallback?' · 使用备用网格':''}`),textElement('p',info.accepted?'烘焙接受条件通过':'烘焙接受条件未通过'));
        if(info.bake){pane.append(textElement('p',`烘焙记录 ${info.bake.id} · ${info.bake.name}`));for(const lod of info.bake.lods)pane.append(textElement('p',`LOD ${lod.index} · ${lod.renderVertexCount} 顶点 · 光照 ${lod.lightingBytes} 字节 · 附加数据 ${lod.extraBytes} 字节`));}
        for(const link of info.materials)pane.append(textElement('p',`${link.role==='primary'?'主材质':'次材质'} · ${link.materialNodeId===null?'未关联':`#${link.materialNodeId}`}`));
        pane.append(textElement('p','Beamo LOD0 原材质绘制已接入，完整生命周期仍在恢复中。','muted'));
      });el.append(button,pane);
    }
    if(objectPlaybackClasses.includes(node.className as any)){
      const candidate=objectPlayback.list().find(c=>c.id===node.id)!;
      const unavailable=candidate.affectedObjects.some(id=>!entityObjects.has(id));
      const start=textElement('button',node.className==='TransformObject'?'播放对象变换':'运行对象事件') as HTMLButtonElement;start.id='object-playback-start';start.disabled=!candidate.available||unavailable;
      start.onclick=()=>{try{resetObjectPlayback();physicsBall.stop();transform.detach();objectPlayback.start(node.id);const box=new THREE.Box3();for(const id of candidate.affectedObjects){const object=entityObjects.get(id);if(object)box.expandByObject(object);}frameBox(box);updateObjectPlaybackStatus();}catch(e){toast((e as Error).message,true);}};
      const pause=textElement('button','暂停') as HTMLButtonElement;pause.id='object-playback-pause';pause.onclick=()=>{objectPlayback.togglePause();updateObjectPlaybackStatus();};
      const stop=textElement('button','停止并还原') as HTMLButtonElement;stop.id='object-playback-stop';stop.onclick=resetObjectPlayback;
      const output=textElement('p','','tool-note');output.id='object-playback-status';output.setAttribute('aria-live','polite');
      const values=textElement('div','');values.id='object-playback-values';
      el.append(start,pause,stop,output,values,textElement('p',candidate.reason||(unavailable?'部分对象的模型资源未加载':node.className==='TransformObject'?'播放位移、旋转和缩放；停止后还原，播放结果不写入文件。':'运行对象组、延迟、条件和数值事件；数值仅用于本次运行，停止后还原，结果不写入文件。'),'tool-note'));
      el.append(textElement('p',`已接入 ${candidate.events.length} 个事件；支持对象组、延迟、条件、Float 运算和后续变换。循环接力可用暂停或停止控制，音效和碰撞尚未接入。`,'tool-note'));updateObjectPlaybackStatus();
      if(candidate.affectedObjects.some(id=>current!.objects.nodes[id]?.className==='Marker'))el.append(textElement('p','Marker 的范围位移可打开顶部“辅助线框”观察。','tool-note'));
    }
    for (const f of node.fields) el.append(renderField(f, node)); return; }
  if (selectedBake) {
    const bake = current.meshes.bakes.find(b => b.id === selectedBake)!; $('selection-type').textContent = '烘焙'; el.append(textElement('div', bake.name, 'inspector-title'), textElement('div', `BST GUID ${bake.guid} · ${bake.uniform ? '统一照明' : '逐顶点照明'}`, 'inspector-sub'));
    bake.submeshes.forEach((sub, i) => { const details = document.createElement('details'); details.open = i === 0; details.dataset.bakeLod = String(i); details.append(textElement('summary', `LOD ${i} · ${sub.count} 烘焙采样`)); el.append(details); void bakeEditor(details, bake, i); }); el.append(textElement('p', '原版一键烘焙的采样与光照处理仍待逆向；已有照明可按采样编辑。', 'muted')); return;
  }
  if (selectedGeometry) {
    const g = current.meshes.geometries.find(g => g.id === selectedGeometry)!; $('selection-type').textContent = g.kind; el.append(textElement('div', g.id, 'inspector-title'), textElement('div', `${g.vertexCount.toLocaleString()} 顶点 · ${(g.indexCount / 3).toLocaleString()} 三角面`, 'inspector-sub'));
    if (g.stride >= 36) { const info = textElement('div', '', 'mesh-surfaces'); el.append(info); void meshSurfaceDetails(info, g.id); }
    if (g.kind === 'terrain') el.append(textElement('p', `区块：${g.metadata?.patchCount} · 压缩边：${g.metadata?.edgeCount}`, 'muted'));
    if (g.kind === 'cloud') {
      const cloud = current.meshes.cloud!;
      el.append(textElement('p', `稀疏块 ${cloud.activeBlocks} · 原点 ${cloud.origin.join(', ')} · 网格 ${cloud.dimensions.join(' × ')}`, 'muted'));
      el.append(textElement('p', `距离场 ${cloud.distanceResolution}³ / 块 · 照明 ${cloud.ambienceResolution}³ / 块 · 太阳遮蔽系数 ${cloud.sunOcclusionScale}`, 'muted'));
      for (const c of cloud.chunks) el.append(textElement('p', `${c.name} 压缩数据：${c.length.toLocaleString()} bytes`, 'muted'));
      const info = textElement('div', '', 'cloud-textures'); el.append(info); void cloudTextureDetails(info);
      el.append(textElement('p', '材质预览显示实体云；辅助线框可查看代理几何。云编辑重建仍未完成。', 'muted'));
    }
    if (g.stride >= 36) { el.append(textElement('div', '材质调色板', 'section-label')); const list = textElement('div', '', 'material-list'); for (const [id, material] of [...materials].sort((a, b) => a[0] - b[0])) { const button = textElement('button', '', 'material-card'); button.classList.toggle('active', materialId === id); const swatch = textElement('span', '', 'swatch'); swatch.style.backgroundColor = '#' + material.color.getHexString(); button.append(swatch); const label = textElement('span', material.name); label.append(textElement('small', `${id} · ${material.shader || '默认'}`)); button.append(label); button.onclick = () => { materialId = id; tool = 'paint'; renderTree(); renderInspector(); updateBrushHud(); }; if (material.image) void api.image(material.image).then((url: string) => { const img = document.createElement('img'); img.src = url; img.alt = material.name; swatch.replaceWith(img); }).catch(() => {}); list.append(button); } el.append(list); const field = labelField('材质 ID'); const input = document.createElement('input'); input.type = 'number'; input.min = '1'; input.max = '255'; input.value = String(materialId); input.onchange = () => { const id = Number(input.value); if (!materials.has(id)) { input.value = String(materialId); toast('此 ID 没有原版 MaterialDef，请从材质调色板选择。'); return; } materialId = id; updateBrushHud(); }; field.append(input); el.append(field); }
    return;
  }
  el.append(textElement('div', mode === 'objects' ? '选择对象以编辑字段、位置与旋转。' : (android?'选择列表中的地形、裙边或烘焙记录，从工具面板新增几何。':'选择左侧地形、裙边或烘焙记录。右键视口可新增基础几何。'), 'muted placeholder'));
}
async function cloudTextureDetails(el: HTMLElement) {
  const revision = sceneRevision;
  try {
    const info = await api.cloudVolumeInfo(); if (revision !== sceneRevision || !el.isConnected || !info) return;
    for (const t of info.textures) el.append(textElement('p', `${t.name} · ${t.dimensions.join(' × ')} · ${t.channels} 通道 · ${t.bytes.toLocaleString()} bytes`, 'muted'));
  } catch (e) { if (revision === sceneRevision && el.isConnected) el.append(textElement('p', String((e as Error).message), 'muted')); }
}
async function meshSurfaceDetails(el: HTMLElement, id: string) {
  const object=geometryObjects.get(id); if(!object)return;
  const plan=surfacePlan(object); if(!plan)return;
  el.append(textElement('div', '原版材质绘制批次', 'section-label'), textElement('p', `${plan.batches.length} 批次 · ${plan.omittedTriangles} 个三角形没有有效材质 · 当前显示：材质/属性检查`, 'muted'));
  const select=document.createElement('select');select.setAttribute('aria-label','原版绘制批次');
  for(let i=0;i<plan.batches.length;i++) { const b=plan.batches[i];select.add(new Option(`${b.pass} · ID ${b.materialId} · ${b.count/3} 面 · ${b.shaderName}`,String(i))); }
  const details=textElement('div','','mesh-shader-bindings');el.append(select,details);
  let request=0;
  const show=async()=>{
    const token=++request, b=plan.batches[Number(select.value)];details.replaceChildren();if(!b)return;
    const state=bakedRenderState(bakedRenderGroups[b.pass]);
    details.append(textElement('p', `原版状态：深度 ≤ · ${state.depth.write?'写入深度':'保留深度'} · 剔除背面${state.colors[0].blend?' · alpha 混合，保留目标 alpha':''}${state.depthBias[1]?' · 斜率深度偏移 '+state.depthBias[1]:''}`, 'muted'));
    try {
      const program: ShaderProgram=await api.shaderProgram(b.shaderName);if(!el.isConnected||token!==request)return;
      const def=bakedDefs[b.materialIndex], params=nativeMaterialParameters(def).map(p=>({name:p.name,vector:p.vector,texture:'texture' in p?String(p.texture):'',nativeType:0,fieldId:`MaterialDef/${def.index}/${p.name}`}));
      if(b.pass==='skirt')params.push({name:'u_skirtDRange',vector:[5],texture:'',nativeType:0,fieldId:'SkirtBarn/u_skirtDRange'});
      const material: MaterialDescriptor={nodeId:-1,name:def.shaderName,materialId:def.materialId,custom:false,shaderName:b.shaderName,parameters:params};
      const bindings=materialBindings(material,program), missing=bindings.filter(p=>p.source==='global'||p.source==='unresolved'||p.problem);
      details.append(textElement('p', `${program.definition.vertex} + ${program.definition.fragment}`, 'muted'),textElement('p', `原版材质参数 ${params.length} 项。完整 shader 尚缺 ${missing.length} 项环境/管线绑定。`, 'muted'));
      for(const item of missing)details.append(textElement('p', `${item.variable.name}：${item.problem}`, 'binding-missing'));
      const button=textElement('button','查看原版 shader');button.onclick=()=>programDetails(details,program);details.append(button);
    } catch(e) { if(el.isConnected&&token===request)details.append(textElement('p',String((e as Error).message),'binding-missing')); }
  };
  select.onchange=()=>void show();await show();
}
async function environmentDetails(el: HTMLElement, id: number) {
  const info = await api.environmentInfo(id); if (!el.isConnected) return;
  el.replaceChildren(textElement('div', '原版环境字段换算', 'section-label'), textElement('p', `转换函数 ${info.function} · ${info.limitation}`, 'muted'));
  if (info.creation) {
    const c = info.creation, row = textElement('p', `EnvNode 创建队列 ${c.queueIndex + 1}/${c.queueSize} · 原版上限 ${c.limit}${c.complete ? '' : '（超出上限）'}`, 'muted');
    row.dataset.environmentQueue = String(c.queueIndex); el.append(row);
  }
  for (const field of info.derived) { const row = textElement('div', '', 'binding-row'); row.dataset.environmentOffset = String(field.offset); row.append(textElement('span', field.name), textElement('code', field.value === null ? '原字段未保存，默认值待确认' : String(field.value))); el.append(row); }
  if (info.registration) { const r = info.registration; el.append(textElement('p', `层 ${r.layer} · 初始剩余时间 ${r.state.remaining} · 初始淡入权重 ${r.state.alpha}`, 'muted')); }
  if (info.region) {
    const region = info.region, details = textElement('div', '', 'environment-region'); details.dataset.environmentRegion = region.kind;
    details.append(textElement('p', region.kind === 'clump' ? `Clump 范围：${region.markers.length} 个 Marker · 取各盒体的最大空间权重` : '直接节点范围：使用保存的 pos、quat 和 scale', 'muted'));
    if (region.controllerNodeId !== null) {
      const controller = textElement('button', `定位启用与计时控制对象 #${region.controllerNodeId}`);
      controller.onclick = () => selectNode(region.controllerNodeId); details.append(controller);
    }
    if (region.kind === 'clump') for (const marker of region.markers) {
      const link = textElement('button', `Marker #${marker.id} · ${marker.enabled ? '启用' : '关闭'}`); link.onclick = () => selectNode(marker.id); details.append(link);
    }
    for (const issue of region.issues) details.append(textElement('p', issue, 'muted'));
    if (region.complete) {
      const query = textElement('button', '计算当前相机位置的空间权重'), value = textElement('p', '', 'muted'); query.className = 'environment-space-query';
      query.onclick = () => {
        const point = [...camera.position.toArray(), 1];
        const weight = region.kind === 'clump' ? envClumpWeight(point, region.markers, region.registration.falloff, 1) : envHullWeight(point, region.hull, 1);
        value.textContent = `相机 (${point.slice(0, 3).map(n => n.toFixed(3)).join(', ')}) · 空间权重 ${weight}（未乘计时权重）`;
      };
      details.append(query, value);
    }
    el.append(details);
  }
  if (info.defaultsApplied.length) el.append(textElement('p', `使用原版缺字段默认值：${info.defaultsApplied.map((field: { name: string; text: string }) => `${field.name}=${field.text}`).join('；')}`, 'muted'));
  const labels: Record<string, string> = { AmbienceSun: '太阳', AmbienceSky: '天空', AmbienceFog: '雾', AmbienceBloom: '泛光', AmbienceToneMap: '曝光', AmbiencePointLight: '点光', CloudEnvParams: '云', FogVolumeParams: '体积雾' };
  for (const group of [...info.groups].sort((a, b) => a.globalRegistrationIndex - b.globalRegistrationIndex)) {
    const details = document.createElement('details'), summary = textElement('summary', `${labels[group.className] ?? group.className} · ${group.fields.filter((f: { complete: boolean }) => f.complete).length}/${group.fields.length} 个参数已确认`);
    details.dataset.environmentGroup = group.className; details.dataset.environmentGlobalIndex = String(group.globalRegistrationIndex); details.append(summary);
    for (const field of group.fields) { const row = textElement('div', '', 'binding-row'); row.dataset.environmentField = field.name; row.append(textElement('span', field.name), textElement('code', field.complete ? Array.isArray(field.value) ? field.value.join(', ') : String(field.value) : '缺少原字段，默认值待确认')); details.append(row); }
    el.append(details);
  }
}
async function bakeEditor(el: HTMLElement, bake: BakeRecord, lod: number) {
  try {
    let data: BakeStream = await api.bakeData(bake.id, lod); if (!el.isConnected) return;
    const sampleField = labelField('烘焙采样 ID'), sample = document.createElement('input'); sample.type = 'number'; sample.min = '0'; sample.max = String(data.uniform ? 0 : data.count - 1); sample.value = '0'; sample.className = 'bake-sample-id'; sampleField.append(sample); el.append(sampleField);
    const values = new Uint8Array(12), bytesField = labelField('原始照明 bytes（light0 / light1 / light2）'), components = textElement('div', '', 'components'), inputs: HTMLInputElement[] = [];
    for (let i = 0; i < 12; i++) { const input = document.createElement('input'); input.type = 'number'; input.min = '0'; input.max = '255'; input.step = '1'; input.title = `light${Math.floor(i / 4)}[${i % 4}]`; input.dataset.lightByte = String(i); inputs.push(input); components.append(input); }
    bytesField.append(components); el.append(bytesField);
    const decoded = textElement('div', '', 'light-decoded');
    const decode = () => { try { const light = decodeLight(inputs.map(i => Number(i.value))), number = (n: number) => Number.isFinite(n) ? Number(n.toPrecision(5)) : '非有限值'; decoded.textContent = `环境光系数 ${light.ambient.map(number).join(', ')}\n天空混合 ${number(light.skyMix)} · 日光可见度 ${number(light.sunVisibility)}\n方向 ${light.direction.map(number).join(', ')} · 方向强度 ${number(light.directionAmount)}\n点灯系数 ${number(light.pointLightScale)}\n仅按原 shader 解码；太阳、天空与点灯颜色尚未绑定。`; } catch (e) { decoded.textContent = String((e as Error).message); } };
    const readSample = () => { const id = Number(sample.value); if (!Number.isInteger(id) || id < 0 || id > Number(sample.max)) { toast('采样 ID 越界', true); return; } values.set(data.light.subarray(id * 12, id * 12 + 12)); for (let i = 0; i < 12; i++) inputs[i].value = String(values[i]); decode(); };
    for (const input of inputs) input.oninput = decode; sample.onchange = readSample; readSample(); el.append(decoded);
    const vertexField = labelField('按模型顶点定位采样'), vertex = document.createElement('input'); vertex.type = 'number'; vertex.min = '0'; vertex.value = '0'; vertex.className = 'bake-render-vertex';
    const locate = textElement('button', '定位此顶点的烘焙采样'); locate.onclick = () => void enqueue(async () => { const result = await api.bakedResource(bake.name, bake.guid, lod), id = Number(vertex.value); if (!result || !Number.isInteger(id) || id < 0 || id >= result.bound.vertexCount) throw new Error('模型顶点不存在或烘焙无法匹配'); sample.value = String(result.bound.sampleIndices[id]); readSample(); }); vertexField.append(vertex, locate); el.append(vertexField);
    const apply = textElement('button', '仅保存此采样'), all = textElement('button', '应用到整个 LOD');
    apply.className = 'apply-bake-sample';
    const save = async (whole: boolean) => { const bytes = inputs.map(i => Number(i.value)); const result = whole ? await api.editBake(bake.id, lod, bytes) : await api.editBakeSample(bake.id, lod, Number(sample.value), bytes); updateState(result); data = await api.bakeData(bake.id, lod); await refreshBake(bake.id); readSample(); status(whole ? '已修改整个烘焙 LOD；保存后写入 meshes' : '已修改一条 12-byte 采样；其他数据保持原样'); };
    apply.onclick = () => void enqueue(() => save(false)); all.onclick = () => void enqueue(() => save(true)); el.append(apply, all, textElement('p', `${data.uniform ? '统一照明，仅一条记录' : '共享同一采样的模型顶点会同步更新'}；附加数据 ${data.extra.length} bytes 保持原样。`, 'muted'));
  } catch (e) { if (el.isConnected) el.append(textElement('p', String((e as Error).message), 'binding-missing')); }
}
async function commitTransform() {
  if (!current || !transform.object) return;
  const object = transform.object;
  if (mode === 'objects' && selected.size === 1) { const node = current.objects.nodes[[...selected][0]], edits: { id: string; value: number[] }[] = [], m = findField(node, 'transform');
    if (m) { object.updateMatrix(); edits.push({ id: m.id, value: object.matrix.toArray() }); }
    else for (const [name, values] of [['pos', [...object.position.toArray(), 0]], ['quat', object.quaternion.toArray()], ['scale', [...object.scale.toArray(), 0]]] as const) { const field = findField(node, name); if (field) { const ns = [...values]; if (name !== 'quat' && (field.value as number[]).length === 4) ns[3] = (field.value as number[])[3]; edits.push({ id: field.id, value: ns.slice(0, field.length / 4) }); } }
    try { const r = await api.editObjects(edits); for (const n of r.nodes){current.objects.nodes[n.id] = n;if(['Beamo','BeamoDecal'].includes(n.className))await updateMaterialPreview(n);} updateState(r); refreshRails(); renderInspector(); } catch (e) { objectTransform(node, object); throw e; }
  } else if (mode === 'meshes' && selectedGeometry) { const g = current.meshes.geometries.find(g => g.id === selectedGeometry)!; object.updateMatrix(); const positions = g.positions.slice(); for (let i = 0; i < positions.length; i += 3) { const v = new THREE.Vector3().fromArray(positions, i).applyMatrix4(object.matrix); v.toArray(positions, i); }
    try { const r = await api.editGeometry(g.id, Array.from(positions)); g.positions.set(positions); object.position.set(0, 0, 0); object.quaternion.identity(); object.scale.set(1, 1, 1); object.updateMatrix(); const mesh = object as THREE.Mesh; mesh.geometry.attributes.position.needsUpdate = true; mesh.geometry.computeVertexNormals(); g.normals.set(mesh.geometry.attributes.normal.array as Float32Array); syncBakedNormals(g); if (mesh.userData.bakedView) updateBakedAttributes(mesh, bakedDisplay, false); updateState(r); } catch (e) { object.position.set(0, 0, 0); object.quaternion.identity(); object.scale.set(1, 1, 1); throw e; }
  }
}
function updateBrushHud() { $('brush-hud').hidden = mode !== 'meshes' || tool === 'select'; $('brush-hud').textContent = `${({ paint: '材质', raise: '凸起', lower: '下凹', smooth: '平滑' } as any)[tool]} · 半径 ${radius} · 强度 ${strength} · 材质 ${materialId}`; if (tool === 'select') brushRing.visible = false; }
function startBrush(event: PointerEvent) {
  if (busy || !current) return; const hit = pick(event), id = hit?.object.userData.geometryId; if (!id) return; const g = current.meshes.geometries.find(g => g.id === id)!;
  if (tool !== 'paint' && g.kind !== 'skirt') { toast('雕刻目前仅支持裙边。地形原版碰撞与区块重建尚待完成。'); return; }
  if (tool === 'paint' && g.stride < 36) return; selectGeometry(id); brushBefore = { positions: g.positions.slice(), ids: g.materialIds.slice(), weights: g.weights.slice() }; brushActive = true; brushChanged = false; orbit.enabled = false; renderer.domElement.setPointerCapture(event.pointerId); brushMove(event);
}
function brushMove(event: PointerEvent) {
  const hit = pick(event); if (!hit || !hit.object.userData.geometryId) { brushRing.visible = false; return; }
  brushRing.visible = true; brushRing.position.copy(hit.point); brushRing.quaternion.setFromUnitVectors(new THREE.Vector3(0, 0, 1), hit.face?.normal.clone().normalize() ?? new THREE.Vector3(0, 1, 0)); brushRing.scale.setScalar(radius); if (!brushActive || !current || !selectedGeometry || hit.object.userData.geometryId !== selectedGeometry) return;
  const g = current.meshes.geometries.find(g => g.id === selectedGeometry)!, object = geometryObjects.get(g.id)!; let changed = false; const smoothPositions = tool === 'smooth' ? g.positions.slice() : undefined; const adjacent = tool === 'smooth' ? buildAdjacency(g) : undefined;
  for (let i = 0; i < g.vertexCount; i++) { const p = i * 3, distance = Math.hypot(g.positions[p] - hit.point.x, g.positions[p + 1] - hit.point.y, g.positions[p + 2] - hit.point.z); if (distance > radius) continue; const t = 1 - distance / radius, weight = strength * (falloff === 'constant' ? 1 : falloff === 'linear' ? t : t * t * (3 - 2 * t)); if (!weight) continue; changed = true;
    if (tool === 'paint') {
      const offset = i * 4, ns = new Map<number, number>(); for (let j = 0; j < 4; j++) ns.set(g.materialIds[offset + j], (ns.get(g.materialIds[offset + j]) ?? 0) + g.weights[offset + j] * (1 - weight)); ns.set(materialId, (ns.get(materialId) ?? 0) + 255 * weight); const layers = [...ns].sort((a, b) => b[1] - a[1]).slice(0, 4); const total = layers.reduce((a, b) => a + b[1], 0); let sum = 0; for (let j = 0; j < 4; j++) { g.materialIds[offset + j] = layers[j]?.[0] ?? 0; g.weights[offset + j] = layers[j] ? Math.round(layers[j][1] / total * 255) : 0; sum += g.weights[offset + j]; } g.weights[offset] += 255 - sum;
    } else if (tool === 'smooth' && adjacent![i].size) { const neighbors = [...adjacent![i]]; for (let j = 0; j < 3; j++) g.positions[p + j] += (neighbors.reduce((a, b) => a + smoothPositions![b * 3 + j], 0) / neighbors.length - g.positions[p + j]) * weight; }
    else g.positions[p + 1] += radius * .04 * weight * (tool === 'lower' ? -1 : 1);
  }
  if (changed) { brushChanged = true; if (tool === 'paint') updateBakedAttributes(object, bakedDisplay, false); else { object.geometry.attributes.position.needsUpdate = true; object.geometry.computeVertexNormals(); object.geometry.computeBoundingSphere(); g.normals.set(object.geometry.attributes.normal.array as Float32Array); syncBakedNormals(g); updateBakedAttributes(object, bakedDisplay, false); } }
}
function buildAdjacency(g: MeshView) { const ns = Array.from({ length: g.vertexCount }, () => new Set<number>()); for (let i = 0; i < g.indices.length; i += 3) { const a = g.indices[i], b = g.indices[i + 1], c = g.indices[i + 2]; ns[a].add(b).add(c); ns[b].add(a).add(c); ns[c].add(a).add(b); } return ns; }
async function finishBrush() {
  if (!brushActive || !current || !selectedGeometry) return; brushActive = false; orbit.enabled = true; const g = current.meshes.geometries.find(g => g.id === selectedGeometry)!, before = brushBefore; brushBefore = undefined; if (!brushChanged) return;
  try { const result = await api.editGeometry(g.id, tool === 'paint' ? undefined : Array.from(g.positions), tool === 'paint' ? Array.from(g.materialIds) : undefined, tool === 'paint' ? Array.from(g.weights) : undefined); updateState(result); status('笔刷修改已暂存；保存后写入 BstBaked.meshes'); }
  catch (e) { if (before) { g.positions.set(before.positions); g.materialIds.set(before.ids); g.weights.set(before.weights); const o = geometryObjects.get(g.id)!; o.geometry.attributes.position.needsUpdate = true; o.geometry.computeVertexNormals(); g.normals.set(o.geometry.attributes.normal.array as Float32Array); syncBakedNormals(g); updateBakedAttributes(o, bakedDisplay, false); } throw e; }
}
async function addGeometry(kind: string) { if (!current) return; const geometry = kind === 'plane' ? new THREE.PlaneGeometry(20, 20, 10, 10).rotateX(-Math.PI / 2) : kind === 'sphere' ? new THREE.SphereGeometry(5, 24, 16) : new THREE.BoxGeometry(10, 10, 10, 4, 4, 4); geometry.translate(orbit.target.x, orbit.target.y, orbit.target.z); const positions = Array.from(geometry.attributes.position.array as Float32Array), indices = geometry.index ? Array.from(geometry.index.array) : Array.from({ length: positions.length / 3 }, (_, i) => i); geometry.dispose(); const next = await api.addGeometry(positions, indices, materialId); current = next; await buildScene(false); const g = current!.meshes.geometries.filter(g => g.kind === 'skirt').at(-1); if (g) selectGeometry(g.id); toast('已新增几何，将与地图一起保存到 BstBaked.meshes'); }
async function confirmChanges(scope: 'objects' | 'meshes' | 'all', message: string): Promise<boolean> {
  await pendingActions; if (!current || !(scope === 'all' ? current.dirty.objects || current.dirty.meshes : current.dirty[scope])) return true;
  const dialog = $<HTMLDialogElement>('confirm-dialog'); $('confirm-message').textContent = message;
  return new Promise(resolve => { dialog.showModal(); const close = (value: boolean) => { dialog.close(); resolve(value); }; $('confirm-cancel').onclick = () => close(false); $('confirm-discard').onclick = () => void runChoice(async () => { current = await api.discard(scope); close(true); }); $('confirm-save').onclick = () => void runChoice(async () => { const result = await api.save(scope); updateState(result); close(true); }); dialog.oncancel = () => resolve(false);
    async function runChoice(task: () => Promise<void>) { try { await task(); } catch (e) { toast(String((e as Error).message), true); } }
  });
}
async function changeMode(next: typeof mode) {
  if (next === mode) return;
  if (mode !== 'avatar' && !await confirmChanges(mode, `离开${mode === 'objects' ? '对象' : 'Meshes'}编辑模式前，请处理当前修改。`)) return;
  cameraController.reset();avatarCamera.clearShake();mode=next;tool='select';
  camera=mode==='avatar'?avatarCamera.camera:editorCamera;orbit.enabled=mode!=='avatar';avatarCamera.enabled=mode==='avatar';
  physicsBall.setView(camera,mode==='avatar'?avatarCamera:orbit);
  $('viewport').querySelector<HTMLElement>('.viewport-help')!.textContent=android?(mode==='avatar'?'摇杆移动 / 看向 · 点按跳跃 · 双指缩放':'点按选择 · 拖动看向 · 双指平移 / 缩放 · 编辑模式拖动轴或绘制'):mode==='avatar'?'启用移动后：WASD 移动 · 空格跳跃 · 中键 / 右键转镜头 · 滚轮缩放':'点击视口：WASD 移动 · Q↓ E↑ · 右键拖动看向 · Shift 加速 · 中键旋转 · 滚轮缩放';
  if(mode==='avatar'){physicsBall.follow=true;$('physics-ball-follow').classList.add('active');$('physics-ball-follow').setAttribute('aria-pressed','true');}
  document.querySelector('.workspace')!.classList.toggle('avatar-mode',mode==='avatar');$('camera-controller').hidden=mode==='avatar';$('right').hidden=mode==='avatar';$('viewport').querySelector<HTMLElement>('.viewport-toolbar')!.hidden=!android&&mode==='avatar';
  for(const id of ['mesh-display','bake-channel'])$(id).hidden=true;
  $('preview-label').textContent=mode==='avatar'?'Avatar 静态预览':'编辑器预览';
  for (const [id, value] of [['mode-bin', 'objects'], ['mode-mesh', 'meshes'], ['mode-avatar', 'avatar']]) {
    $(id).classList.toggle('active', mode === value); $(id).setAttribute('aria-pressed', String(mode === value));
  }
  physicsBall.stop(); clearSelection(); updateBrushHud();
  $('search').hidden = mode === 'avatar';
  for (const id of ['translate', 'rotate', 'scale']) $(id).hidden = mode === 'avatar';
  if (current) { updateState(current); await buildScene(false); }
  else { $('tree').replaceChildren(); $('left-title').textContent = mode === 'avatar' ? 'Avatar 预览' : mode === 'objects' ? '场景对象' : 'Meshes 工具'; }
}
async function chooseLevel(name: string) { if (!await confirmChanges('all', '切换地图前，请处理当前地图的修改。')) { $<HTMLSelectElement>('levels').value = current?.level ?? ''; return; } current = await api.openLevel(name);avatarSpawnId=undefined;delete $('tree').dataset.avatarSpawn; await buildScene(); }
function populateLevels(names: string[]) { const select = $<HTMLSelectElement>('levels'); select.replaceChildren(); for (const n of names) select.add(new Option(n, n)); select.value = names.includes('WorldEmpty') ? 'WorldEmpty' : names[0] ?? ''; }
function settingsDialog() { $<HTMLInputElement>('data-path').value = dataPath; $('settings-error').textContent = ''; $<HTMLDialogElement>('settings-dialog').showModal(); }
function programDetails(el: HTMLElement, program: ShaderProgram, bindings?: ParameterBinding[]) {
  const d = program.definition;
  el.append(textElement('div', d.name, 'inspector-title'), textElement('p', `${d.source}:${d.line} · 分组 ${d.group || '未声明'} · 宏 ${d.defines || '空'} · 哈希 ${d.hash}`, 'muted'), textElement('p', `${d.vertex} + ${d.fragment}`, 'program-files'));
  const compile = textElement('button', '检查 Vulkan SPIR-V 编译与链接'), result = textElement('p', '清单列出源码声明；链接器可能移除未使用的 uniform。', 'muted');
  compile.onclick = () => { result.textContent = '正在编译…'; void api.vulkanShaderCheck(program.definition.name, true).then((r: any) => { result.textContent = (r.success ? 'Vulkan SPIR-V 编译与链接通过。' : '编译未通过。') + r.log; }).catch((e: Error) => { result.textContent = e.message; }); }; el.append(compile, result);
  el.append(textElement('div', '顶点属性', 'section-label'));
  const attributes = textElement('div', '', 'binding-list');
  const supported: Record<string, string> = { a_position: 'Mesh v28 位置', a_normal: 'Mesh v28 法线', a_color: 'Mesh v28 顶点色', a_uv0: 'UV0 + UV1（vec4）', a_uv1: 'UV2 + UV3（vec4）' };
  for (const v of program.variables.filter(v => v.stage === 'vertex' && v.storage === 'in')) { const row = textElement('div', '', 'binding-row'); row.append(textElement('code', `${v.type} ${v.name}`), textElement('span', supported[v.name] ?? (/^a_light[012]$/.test(v.name) ? '原 Mesh LOD 映射后的烘焙属性；原 shader 绘制待验证' : '属性来源待逆向'), 'muted')); attributes.append(row); } el.append(attributes);
  el.append(textElement('div', 'Uniform 来源', 'section-label')); const list = textElement('div', '', 'binding-list');
  const values: ParameterBinding[] = bindings ?? program.variables.filter(v => v.storage === 'uniform').filter((v, i, all) => all.findIndex(x => x.name === v.name) === i).map(variable => ({ variable, source: 'unresolved' as const }));
  for (const binding of values) {
    const row = textElement('div', '', 'binding-row'), p = binding.parameter;
    const native = binding.nativeGlobal;
    const value = p ? p.texture || p.vector.slice(0, binding.variable.type === 'float' ? 1 : 4).join(', ') : binding.source === 'camera' ? '可从模型 / 编辑器相机提供' : native ? native.source ? `${native.source.owner} + 0x${native.source.nativeOffset.toString(16)} · ${native.components} 分量` : `原版全局纹理 · 注册 ${native.registrationCall}` : '原版默认值 / 环境 / 管线待逆向';
    row.append(textElement('code', `${binding.variable.type} ${binding.variable.name}`), textElement('span', value, binding.problem ? 'binding-missing' : 'muted'));
    if (binding.problem) row.append(textElement('small', binding.problem, 'binding-missing')); list.append(row);
  } el.append(list);
  for (const [name, source] of [[d.vertex, program.vertexSource], [d.fragment, program.fragmentSource]]) { const details = document.createElement('details'); details.append(textElement('summary', name), textElement('pre', source)); el.append(details); }
}
async function materialDetails(el: HTMLElement, id: number) {
  const info = await api.materialInfo(id); if (!el.isConnected) return;
  const material: MaterialDescriptor = info.material;
  el.replaceChildren(textElement('div', `${material.name} · #${id}`, 'inspector-title'), textElement('p', `材质 ID ${material.materialId} · ${material.custom ? '自定义 shader' : '原版默认材质'} · 模型参数按对象独立读取`, 'muted'));
  const edit = textElement('button', '返回对象编辑参数'); edit.onclick = () => void run(async () => { await changeMode('objects'); if (mode !== 'objects') return; $<HTMLDialogElement>('resource-dialog').close(); selectNode(id); }); el.append(edit);
  if (info.error) el.append(textElement('p', info.error, 'binding-missing'));
  if (info.program) programDetails(el, info.program, info.bindings);
  el.append(textElement('div', info.parameterOrigin ?? '对象保存参数', 'section-label'));
  for (const p of material.parameters) {
    const row = textElement('div', '', 'binding-row'); row.append(textElement('code', p.name), textElement('small', `原始类型 ${p.nativeType} · ${p.fieldId}`, 'muted'), textElement('span', p.texture || p.vector.join(', ')));
    if (info.program && !info.program.variables.some((v: any) => v.storage === 'uniform' && v.name === p.name)) row.append(textElement('small', '此变体未声明该参数', 'muted')); el.append(row);
  }
  el.append(textElement('div', '纹理资源', 'section-label'));
  for (const image of info.images) {
    const row = textElement('div', '', 'texture-resource'); row.append(textElement('b', image.name), textElement('small', image.exists ? 'PNG 文件存在' : 'PNG 文件缺失', image.exists ? 'muted' : 'binding-missing'));
    if (image.declaration) row.append(textElement('small', JSON.stringify(image.declaration.fields), 'muted'));
    if (image.exists) void api.image(image.name).then((url: string) => { if (!row.isConnected) return; const img = document.createElement('img'); img.src = url; img.alt = image.name; row.prepend(img); }).catch(() => {}); el.append(row);
  }
  el.append(textElement('div', '对应烘焙记录', 'section-label'));
  if (!info.bake.length) el.append(textElement('p', '没有按 BST GUID 找到模型烘焙记录。', 'muted'));
  for (const bake of info.bake as BakeRecord[]) el.append(textElement('p', `${bake.name} · GUID ${bake.guid} · ${bake.uniform ? '统一' : '逐顶点'}照明 · ${bake.submeshes.map((s, i) => `子网格 ${i}: ${s.count} 顶点 / ${s.lightLength} bytes`).join('；')}`, 'muted'));
  el.append(textElement('p', '视口目前采用编辑器预览材质。原版探针、灯光列表、烘焙属性上传、MRT 和后处理尚未完成。', 'binding-missing'));
}
async function showResources(tab = 'folders', focusNode?: number) {
  const el = $('resource-content'); el.replaceChildren(); for (const name of ['folders', 'materials', 'shaders', 'classes', 'lua']) $('tab-' + name).classList.toggle('active', name === tab);
  if (tab === 'materials') {
    const layout = textElement('div', '', 'shader-layout'), sidebar = textElement('div', '', 'shader-list'), source = textElement('div', '', 'shader-source'), search = document.createElement('input'), category = document.createElement('select'), list = textElement('div', '', 'variant-list');
    search.placeholder = '搜索模型、材质或 shader…'; category.add(new Option('原版 shader 声明', 'shader')); category.add(new Option('地图模型', 'LevelMesh')); category.add(new Option('地形材质', 'LevelMaterial'));
    sidebar.append(search, category, list); layout.append(sidebar, source); el.append(layout);
    const catalog = dataPath ? await api.shaderCatalog() : []; if (!layout.isConnected) return;
    const refresh = () => {
      list.replaceChildren();
      if (category.value === 'shader') for (const d of catalog.filter((d: any) => d.name.toLowerCase().includes(search.value.toLowerCase()))) { const button = textElement('button', d.name); button.onclick = () => void enqueue(async () => { source.replaceChildren(); try { const program = await api.shaderProgram(d.name); if (source.isConnected) programDetails(source, program); } catch (e) { source.append(textElement('p', String((e as Error).message), 'binding-missing')); } }); list.append(button); }
      else for (const n of (current?.objects.nodes ?? []).filter(n => n.className === category.value && `${displayName(n)} ${stringField(n, 'shaderName')} ${n.id}`.toLowerCase().includes(search.value.toLowerCase()))) { const button = textElement('button', `#${n.id} ${displayName(n)}`); button.dataset.nodeId = String(n.id); button.onclick = () => void enqueue(() => materialDetails(source, n.id)); list.append(button); }
    }; search.oninput = refresh; category.onchange = refresh;
    if (focusNode !== undefined && current?.objects.nodes[focusNode]) { category.value = current.objects.nodes[focusNode].className; refresh(); await materialDetails(source, focusNode); }
    else { refresh(); source.append(textElement('p', `已读取 ${catalog.length} 个原版 shader 声明。选择条目查看宏、精确文件名和绑定依赖。`, 'muted')); }
  }
  if (tab === 'folders') for (const [name, purpose] of Object.entries(purposes)) { const row = textElement('div', '', 'folder-row'); row.append(textElement('b', name), textElement('span', purpose)); el.append(row); }
  if (tab === 'lua') { if (!current) { el.append(textElement('p', '请先打开地图。')); return; } el.append(textElement('pre', await api.resources())); }
  if (tab === 'classes') { const catalog = await api.classCatalog(); const controls = textElement('div', '', 'catalog-controls'), search = document.createElement('input'), results = textElement('div', ''); search.placeholder = '搜索原程序类名…'; controls.append(search, textElement('span', `${catalog.length} 个 RTTI 类型；类型发现不代表玩法已复刻`, 'muted')); el.append(controls, results); const refresh = () => { results.replaceChildren(); for (const c of catalog.filter((c: any) => c.name.toLowerCase().includes(search.value.toLowerCase()))) { const row = textElement('div', '', 'catalog-row'); row.append(textElement('span', c.name), textElement('small', c.rttiAddress), textElement('small', c.behavior)); results.append(row); } }; search.oninput = refresh; refresh(); }
  if (tab === 'shaders') {
    const names: string[] = dataPath ? await api.shaders() : []; const layout = textElement('div', '', 'shader-layout'), list = textElement('div', '', 'shader-list'), source = textElement('div', '', 'shader-source'); layout.append(list, source); el.append(layout);
    for (const name of names) { const button = textElement('button', name); button.onclick = () => void enqueue(async () => { for (const b of list.children) b.classList.toggle('active', b === button); const text = await api.shader(name); source.replaceChildren(textElement('div', name, 'inspector-title')); const compile = textElement('button', '检查 Vulkan SPIR-V 编译'), result = textElement('p', '编译检查不代表原版渲染管线已完整复刻。', 'muted'); compile.onclick = () => { result.textContent = '正在编译…'; void api.vulkanShaderCheck(name, false).then((r: any) => { result.textContent = (r.success ? 'Vulkan SPIR-V 编译与验证通过。' : '编译未通过。') + r.log; }).catch((e: Error) => { result.textContent = e.message; }); }; source.append(compile, result, textElement('pre', text)); }); list.append(button); }
    if (!names.length) source.append(textElement('p', '配置 Data 后可查看原始 GLSL。'));
  }
}
function bindUI() {
  installAuthorProfile();
  $<HTMLSelectElement>('mesh-display').onchange = () => { bakedDisplay = $<HTMLSelectElement>('mesh-display').value as BakedDisplay;scene.userData.bakedDisplay=bakedDisplay; for (const object of geometryObjects.values()) setBakedDisplay(object, bakedDisplay); };
  $('material-animation').onclick=()=>{const enabled=scene.userData.animateMaterials===false;scene.userData.animateMaterials=enabled;$('material-animation').setAttribute('aria-pressed',String(enabled));$('material-animation').textContent=enabled?'暂停材质动画':'播放材质动画';};
  $<HTMLSelectElement>('bake-channel').onchange = () => { bakeChannel = Number($<HTMLSelectElement>('bake-channel').value); for (const object of entityObjects.values()) if (object instanceof THREE.Mesh) applyBakeChannel(object); $('preview-label').textContent = bakeChannel < 0 ? '编辑器预览' : `烘焙 light${bakeChannel} 原始通道`; };
  $('mode-bin').onclick = () => void run(() => changeMode('objects')); $('mode-mesh').onclick = () => void run(() => changeMode('meshes'));
  $('mode-avatar').onclick = () => void run(() => changeMode('avatar'));
  $('settings').onclick = () => void run(async () => { if (await confirmChanges('all', '打开配置前，请处理当前地图的修改。')) settingsDialog(); });
  $('browse').onclick = () => void run(async () => { const p = await api.chooseData(); if (p) $<HTMLInputElement>('data-path').value = p; });
  $('apply-settings').onclick = () => void run(async () => { try { const result = await api.setData($<HTMLInputElement>('data-path').value); dataPath = result.dataPath; current = undefined; populateLevels(result.levels); $<HTMLDialogElement>('settings-dialog').close(); if (result.levels.length) await chooseLevel($<HTMLSelectElement>('levels').value); } catch (e) { $('settings-error').textContent = String((e as Error).message); } });
  document.querySelector('.close-settings')!.addEventListener('click', () => { if (dataPath) $<HTMLDialogElement>('settings-dialog').close(); }); $<HTMLDialogElement>('settings-dialog').addEventListener('cancel', e => { if (!dataPath) e.preventDefault(); });
  $<HTMLSelectElement>('levels').onchange = () => void run(() => chooseLevel($<HTMLSelectElement>('levels').value));
  $('save').onclick = () => void run(async () => { await pendingActions; const r = await api.save(mode === 'avatar' ? 'all' : mode); updateState(r); toast(r.backups.length ? '已保存；原文件备份在地图的 .sky-editor-backups 目录' : '没有需要保存的修改'); });
  $('search').oninput = renderTree; $('focus').onclick = focusSelection; $('frame').onclick = frameAll;
  for (const m of ['translate', 'rotate', 'scale'] as const) $(m).onclick = () => { transform.setMode(m);renderer?.invalidate(); for (const n of ['translate', 'rotate', 'scale']) {$(n).classList.toggle('active', n === m);$(n).setAttribute('aria-pressed',String(n===m));} };
  $('wire').onclick = () => { wire = !wire; $('wire').classList.toggle('active', wire); $('wire').setAttribute('aria-pressed', String(wire)); refreshMapWire(); };
  $('helper-frames').onclick = () => { showHelperFrames = !showHelperFrames; $('helper-frames').classList.toggle('active', showHelperFrames); $('helper-frames').setAttribute('aria-pressed', String(showHelperFrames)); const playbackFlags=new Map(objectPlayback.snapshot()?.objects.map(n=>[n.id,n.enabled])??[]);content.traverse(o => { if (o.userData.editorHelper) {const nodeId=o.userData.nodeId;o.visible=showHelperFrames&&(!playbackVisibilityModes.has(nodeId)||playbackFlags.get(nodeId)!==false);} }); };
  $<HTMLSelectElement>('selection-outline').onchange = () => { selectionOutline = $<HTMLSelectElement>('selection-outline').value as typeof selectionOutline; if (selectedBake) { selectBake(selectedBake); return; } const objects = [...selected].flatMap(id => clumpChildren(id).map(child => entityObjects.get(child))).filter((o): o is THREE.Object3D => !!o); if (selectedGeometry && geometryObjects.has(selectedGeometry)) objects.push(geometryObjects.get(selectedGeometry)!); clearBoxes(); for (const object of objects) addBox(object); };
  $('grid').onclick = () => { grid.visible = !grid.visible; $('grid').classList.toggle('active', grid.visible); };
  $('physics-ball').onclick=()=>void run(async()=>{
    if(physicsBall.state){if(mode==='avatar'&&avatarPreview.resources){avatarPosition=avatarPreviewState(avatarPreview.object.position.toArray());}physicsBall.stop();}else{if(!current)throw new Error('请先打开地图');status('正在准备测试球碰撞…');const field=await api.physicsBallField();const position=mode==='avatar'&&avatarPreview.resources?avatarPreview.object.position.toArray().map((n,i)=>i===1?n+.6:n):ballSpawn();physicsBall.start(ballCollisionMeshes(),position,field,mode==='avatar'&&avatarPreview.resources?avatarPosition?.state:undefined);physicsBall.subject=mode==='avatar'&&avatarPreview.resources?'角色':'球';if(mode==='avatar'&&avatarPreview.resources)physicsBall.object.visible=false;if(mode!=='avatar'){const center=new THREE.Vector3().fromArray(physicsBall.state!.position),offset=center.clone().sub(orbit.target);camera.position.add(offset);orbit.target.copy(center);}}
    const enabled=!!physicsBall.state;$('physics-ball').classList.toggle('active',enabled);$('physics-ball').setAttribute('aria-pressed',String(enabled));status(enabled?(android?'点按地形放置，摇杆移动和点按跳跃':'交互球已启用：点击地形放置，WASD 微调'):'测试球已关闭');if(mode==='avatar')renderTree();
  });
  $('physics-ball-reset').onclick=()=>{if(physicsBall.state)physicsBall.reset(ballSpawn());};
  $('physics-ball-follow').onclick=()=>{physicsBall.follow=!physicsBall.follow;$('physics-ball-follow').classList.toggle('active',physicsBall.follow);$('physics-ball-follow').setAttribute('aria-pressed',String(physicsBall.follow));if(mode==='avatar')renderTree();};
  $('physics-ball-fly').onclick=()=>{physicsBall.fly=!physicsBall.fly;$('physics-ball-fly').classList.toggle('active',physicsBall.fly);$('physics-ball-fly').setAttribute('aria-pressed',String(physicsBall.fly));if(mode==='avatar')renderTree();};
  $('undo').onclick = () => void run(async () => { await pendingActions; current = await api.undo(); await buildScene(false); }); $('redo').onclick = () => void run(async () => { await pendingActions; current = await api.redo(); await buildScene(false); });
  for (const b of document.querySelectorAll<HTMLButtonElement>('[data-add]')) b.onclick = () => void run(async () => { $('context-menu').hidden = true; await addGeometry(b.dataset.add!); }); $('context-focus').onclick = () => { $('context-menu').hidden = true; focusSelection(); };
  $('resources').onclick = () => void run(async () => { $<HTMLDialogElement>('resource-dialog').showModal(); await showResources(); }); $('close-resources').onclick = () => $<HTMLDialogElement>('resource-dialog').close(); for (const tab of ['folders', 'materials', 'shaders', 'classes', 'lua']) $('tab-' + tab).onclick = () => void run(() => showResources(tab));
  window.addEventListener('keydown', e => { if (['INPUT', 'SELECT', 'TEXTAREA'].includes((e.target as HTMLElement).tagName) || document.querySelector('dialog[open]')) return; if (e.ctrlKey && e.key.toLowerCase() === 's') { e.preventDefault(); $('save').click(); } else if (e.ctrlKey && e.key.toLowerCase() === 'z') { e.preventDefault(); $(e.shiftKey ? 'redo' : 'undo').click(); } else if (e.key === '1') $('mode-bin').click(); else if (e.key === '2') $('mode-mesh').click(); else if (e.key === '3') $('mode-avatar').click(); else if (mode !== 'avatar' && e.key.toLowerCase() === 'g') $('translate').click(); else if (mode !== 'avatar' && e.key.toLowerCase() === 'r') $('rotate').click(); else if (mode !== 'avatar' && e.key.toLowerCase() === 's') $('scale').click(); else if (e.key.toLowerCase() === 'f') {if(mode==='avatar')focusAvatar();else focusSelection();} else if (e.key === 'Home') {if(mode==='avatar')focusAvatar();else frameAll();} });
  api.onClose(() => void run(async () => { if (await confirmChanges('all', '关闭编辑器前，请处理当前地图的修改。')) await api.close(); }));
}
async function bootstrap() { initViewport(); bindUI(); const initial = await api.bootstrap(); dataPath = initial.dataPath; purposes = initial.purposes; populateLevels(initial.levels); if (!dataPath) settingsDialog(); else if (initial.levels.length) await chooseLevel($<HTMLSelectElement>('levels').value); }
void bootstrap().catch(e => { status('启动失败'); toast(String(e.message ?? e), true); });
