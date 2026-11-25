import {materialUsesAlphaPass} from '../core/model-render-state';
import {modelRenderStateCode} from '../core/model-render-state';
import * as THREE from 'three';
import type { VulkanFrame, VulkanScene, VulkanBakedDraw } from '../core/vulkan-protocol';
import type {VulkanModelVertices} from '../core/vulkan-protocol';
import {exportResourceModel} from './resource-model-renderer';
import {ViewportPerformancePolicy,type ViewportQuality,type ViewportResolutionMode} from '../core/viewport-performance';
import {ViewportFrameLoop} from './viewport-frame-loop';

type Api = { vulkanInfo: () => Promise<{ backend: string; device: string;deviceType?:number;nativeSurface?:boolean }>; vulkanRestart?:()=>Promise<unknown>; vulkanScene: (scene: VulkanScene) => Promise<{geometrySha256?:string}|void>; vulkanOverlay?: (scene:VulkanScene)=>Promise<void>; vulkanModelTransforms?:(updates:{nodeId:number;matrix:number[]}[])=>Promise<void>; vulkanModelVertices?:(updates:VulkanModelVertices[])=>Promise<void>; vulkanFrame: (width: number, height: number, matrix: number[],cameraMatrix?:number[],animation?:{delta:number},interaction?:{avatarPosition:number[]},quality?:'basic'|'fast'|'full') => Promise<VulkanFrame>; };
type Item = { object: THREE.Mesh | THREE.Line; material: THREE.Material; start: number; count: number; line: boolean; state: number; mode: number; };
function items(scene: THREE.Scene): Item[] {
  const list: Item[] = [];
  scene.traverseVisible(object => {
    // TransformControls updates its camera-facing geometry, active mode,
    // visibility and picking plane in updateMatrixWorld, not updateWorldMatrix.
    // Update this small subtree before walking it; ordinary scene objects retain
    // the incremental matrix path and hidden helper trees remain unvisited.
    if ((object as THREE.Object3D & {isTransformControlsRoot?:boolean}).isTransformControlsRoot) object.updateMatrixWorld(true);
    // Hidden editor helpers do not need a matrix update for rasterization.
    // Parents are visited first, retaining the same world transforms.
    object.updateWorldMatrix(false,false);
    if (!(object instanceof THREE.Mesh || object instanceof THREE.Line)) return;
    const geometry = object.geometry, positions = geometry.getAttribute('position'); if (!positions) return;
    const indexCount = geometry.index?.count ?? positions.count;
    const groups = geometry.groups.length ? geometry.groups : [{ start: 0, count: indexCount, materialIndex: 0 }];
    for (const group of groups) {
      const material = Array.isArray(object.material) ? object.material[group.materialIndex ?? 0] : object.material;
      if (!material?.visible) continue;
      const start = Math.max(group.start, geometry.drawRange.start), end = Math.min(group.start + group.count, geometry.drawRange.start + geometry.drawRange.count, indexCount);
      if (start >= end) continue;
      const line = object instanceof THREE.Line || !!(material as THREE.MeshBasicMaterial).wireframe;
      // Vulkan uses independent triangles/segments. Three Line and LineLoop
      // instead describe connected strips, so expand their edges on export.
      const primitive = object instanceof THREE.Mesh ? 3 : object instanceof THREE.LineSegments ? 2 : 1;
      const count = Math.floor((end - start) / primitive) * primitive;
      if (!count || object instanceof THREE.Line && !(object instanceof THREE.LineSegments) && count < 2) continue;
      const original = material.userData.nativeRenderState;
      const state = line ? material.depthTest ? 3 : 5 : !material.depthTest ? 4 : original ? original.name === 'Skirts' ? 2 : modelRenderStateCode(original.name) : material.side === THREE.DoubleSide ? material.transparent ? 7 : 6 : material.transparent ? 1 : 0;
      const mode = material instanceof THREE.RawShaderMaterial && material.uniforms.u_mode?.value === 4 ? 1 : 0;
      list.push({ object, material, start, count, line, state, mode });
    }
  });
  // Match the established terrain pass order; helpers draw after geometry.
  return list.sort((a, b) => {
    const rank = (i: Item) => i.state === 0 || i.state === 6 ? 0 : i.state === 1 || i.state === 7 ? 1 : i.state === 2 ? 2 : 3;
    return rank(a) - rank(b) || a.object.renderOrder - b.object.renderOrder;
  });
}
function color(item: Item, vertex: number): number[] {
  const m = item.material, g = item.object.geometry;
  if (m instanceof THREE.RawShaderMaterial && m.uniforms.u_mode) {
    const mode = m.uniforms.u_mode.value;
    if (mode === 0) {
      const ids = g.getAttribute('a_material0'), weights = g.getAttribute('a_material1'), id = m.uniforms.u_materialId.value;
      const rgba = (m.uniforms.u_matColor.value as THREE.Vector3).toArray();
      const alpha = [0, 1, 2, 3].reduce((sum, c) => sum + (Math.trunc(ids.getComponent(vertex, c) * 256) === id ? weights.getComponent(vertex, c) : 0), 0);
      return [...rgba, m.uniforms.u_opaque.value ? 1 : alpha];
    }
    const attribute = g.getAttribute(mode === 5 ? 'a_userData1' : `a_light${mode === 4 ? 0 : mode - 1}`);
    return [attribute.getX(vertex), attribute.getY(vertex), attribute.getZ(vertex), mode === 4 ? attribute.getW(vertex) : 1];
  }
  const base = ((m as THREE.MeshBasicMaterial).color ?? new THREE.Color(1, 1, 1)).toArray();
  const attribute = (m as THREE.MeshBasicMaterial).vertexColors ? g.getAttribute('color') : undefined;
  return [base[0] * (attribute?.getX(vertex) ?? 1), base[1] * (attribute?.getY(vertex) ?? 1), base[2] * (attribute?.getZ(vertex) ?? 1), m.opacity * (attribute && attribute.itemSize >= 4 ? attribute.getW(vertex) : 1)];
}
export function exportVulkanScene(scene: THREE.Scene,dynamic?:boolean): VulkanScene {
  const all = items(scene).filter(i=>(dynamic===undefined||!!i.object.userData.dynamicViewport===dynamic)&&!i.material.userData.nativeFogVolume), baked: VulkanBakedDraw[] = [], native = all.filter(i => !i.line && i.material.userData.nativeBaked), modelItems=all.filter(i=>!i.line&&i.material.userData.nativeModel),list = all.filter(i => !native.includes(i)&&!modelItems.includes(i));
  const exportedModels=modelItems.map(i=>exportResourceModel(i.object as THREE.Mesh,i.material,i.start,i.count)),models=exportedModels.filter(d=>!d.beamoPass||materialUsesAlphaPass(d.state)||!new THREE.Matrix4().fromArray(d.model).equals(new THREE.Matrix4()));
  const beamoGroups=new Map<string,typeof exportedModels>();
  for(const d of exportedModels.filter(d=>d.beamoPass&&!materialUsesAlphaPass(d.state)&&new THREE.Matrix4().fromArray(d.model).equals(new THREE.Matrix4()))){const key=JSON.stringify([d.shader,d.group,d.materialNodeId,d.beamoPass,d.baked]);let group=beamoGroups.get(key);if(!group){group=[];beamoGroups.set(key,group);}group.push(d);}
  for(const group of beamoGroups.values()){const first=group[0],vertices=new Uint8Array(group.reduce((n,d)=>n+d.vertices.length,0)),indices=new Uint32Array(group.reduce((n,d)=>n+d.indices.length,0)),beamoRanges:NonNullable<import('../core/vulkan-protocol').VulkanModelDraw['beamoRanges']>=[];let vertexAt=0,indexAt=0;for(const d of group){beamoRanges.push({nodeId:d.nodeId,vertexStart:vertexAt,vertexCount:d.vertices.length/48,indexStart:indexAt,indexCount:d.indices.length});vertices.set(d.vertices,vertexAt*48);for(const ix of d.indices)indices[indexAt++]=ix+vertexAt;vertexAt+=d.vertices.length/48;}models.push({...first,vertices,indices,beamoNodeIds:group.map(d=>d.nodeId),beamoRanges});}
  const modelBoundaries=[...all.filter(i=>i.material.userData.modelBoundary).map(i=>({nodeId:i.object.userData.nodeId,reason:String(i.material.userData.modelBoundary)})),...scene.userData.beamoBoundaries??[]];
  // Merge identical material passes across terrain patches and skirts. Keep
  // original packed bytes and index order; transforms are baked into world space.
  // Every terrain/skirt scatter plan orders its layers by MaterialDef ordinal.
  // Merge each key once, then retain that ordinal within each recovered pass.
  // Moving a layer from a disjoint patch is harmless; reversing two layers
  // on the same triangle is not. This also avoids uploading textures per patch.
  const grouped = new Map<string,Item[]>();
  for(const item of native){const binding=item.material.userData.nativeBaked,key=JSON.stringify([binding.shader,binding.materialIndex,item.state]);grouped.set(key,[...grouped.get(key)??[],item]);}
  const rank=(item:Item)=>item.state===0||item.state===6?0:item.state===1||item.state===7?1:2;
  const groups=[...grouped.values()].sort((a,b)=>rank(a[0])-rank(b[0])||a[0].material.userData.nativeBaked.materialIndex-b[0].material.userData.nativeBaked.materialIndex).map(items=>({items}));
  const position = new THREE.Vector3(), normal = new THREE.Vector3(), normalMatrix = new THREE.Matrix3();
  for (const {items:group} of groups) {
    const count = group.reduce((n,i) => n + i.object.geometry.getAttribute('position').count,0), vertices = new Uint8Array(count * 40), view = new DataView(vertices.buffer), indices = new Uint32Array(group.reduce((n,i) => n+i.count,0));
    let vertexAt=0,indexAt=0;
    for (const item of group) {
      const geometry=item.object.geometry, positions=geometry.getAttribute('position'),identityTransform=item.object.matrixWorld.equals(new THREE.Matrix4());normalMatrix.getNormalMatrix(item.object.matrixWorld);
      for(let v=0;v<positions.count;v++) {
        const at=(vertexAt+v)*40;position.fromBufferAttribute(positions,v).applyMatrix4(item.object.matrixWorld);
        position.toArray().forEach((value,lane)=>view.setFloat32(at+lane*4,value,true));
        const packed=geometry.getAttribute('a_normal') as THREE.BufferAttribute;
        if(identityTransform) vertices.set(new Uint8Array(packed.array.buffer,packed.array.byteOffset+v*4,4),at+12);
        else {normal.set(packed.getX(v),packed.getY(v),packed.getZ(v)).applyMatrix3(normalMatrix).normalize();normal.toArray().forEach((value,lane)=>view.setInt8(at+12+lane,Math.round(Math.max(-1,Math.min(1,value))*127)));view.setInt8(at+15,(packed.array as Int8Array)[v*4+3]);}
        for(const [name,offset] of [['a_material0',16],['a_material1',20],['a_light0',24],['a_light1',28],['a_light2',32],['a_userData1',36]] as const) {
          const attribute=geometry.getAttribute(name) as THREE.BufferAttribute;
          vertices.set(new Uint8Array(attribute.array.buffer,attribute.array.byteOffset+v*4,4),at+offset);
        }
      }
      for(let i=item.start;i<item.start+item.count;i++)indices[indexAt++]=vertexAt+(geometry.index?.getX(i)??i);
      vertexAt+=positions.count;
    }
    const first=group[0];baked.push({...first.material.userData.nativeBaked,state:first.state,stride:40,vertices,indices});
  }
  const count = list.reduce((n, i) => n + (i.line && i.object instanceof THREE.Mesh ? i.count * 2
    : i.object instanceof THREE.LineLoop ? i.count * 2
    : i.object instanceof THREE.Line && !(i.object instanceof THREE.LineSegments) ? (i.count - 1) * 2 : i.count), 0);
  if (count > 20000000) throw new Error('Vulkan 预览场景顶点容量超限');
  const vertices = new Float32Array(count * 7), draws = new Uint32Array(list.length * 4);
  const p = new THREE.Vector3(); let at = 0;
  for (const [draw, item] of list.entries()) {
    const g = item.object.geometry, positions = g.getAttribute('position'), first = at;
    const append = (index: number) => {
      const vertex = g.index?.getX(index) ?? index;
      p.fromBufferAttribute(positions, vertex).applyMatrix4(item.object.matrixWorld);
      vertices.set(p.toArray(), at * 7); vertices.set(color(item, vertex), at * 7 + 3); at++;
    };
    if (item.line && item.object instanceof THREE.Mesh) {
      for (let t = item.start; t < item.start + item.count; t += 3) for (const offset of [0, 1, 1, 2, 2, 0]) append(t + offset);
    } else if (item.object instanceof THREE.Line && !(item.object instanceof THREE.LineSegments)) {
      for (let i = item.start; i < item.start + item.count - 1; i++) { append(i); append(i + 1); }
      if (item.object instanceof THREE.LineLoop) { append(item.start + item.count - 1); append(item.start); }
    } else for (let i = item.start; i < item.start + item.count; i++) append(i);
    draws.set([first, at - first, item.state, item.mode], draw * 4);
  }
  return { vertices, draws, baked,models,modelBoundaries,cloud:scene.userData.entityCloud===true&&scene.userData.bakedDisplay==='material' };
}
function signature(scene: THREE.Scene,dynamic?:boolean,all=items(scene),separateModels=false,separateVertices=false) {
  const parts: unknown[] = [scene.userData.level,scene.userData.entityCloud,scene.userData.bakedDisplay];
  for (const item of all.filter(i=>dynamic===undefined||!!i.object.userData.dynamicViewport===dynamic)) {
    const g = item.object.geometry, m = item.material;
    const incremental=separateModels&&!item.line&&item.material.userData.nativeModel&&!item.object.userData.beamoDraw&&!item.object.userData.dynamicViewport;
    const flock=separateVertices&&(g.userData.nativeFlock===true||g.userData.nativeMotes===true);
    const posed=separateVertices&&!item.line&&item.material.userData.nativeModel&&!item.object.userData.beamoDraw&&g.userData.nativeSkinPose==='preview';
    parts.push(item.object.id,g.uuid, incremental?undefined:item.object.matrixWorld.elements, item.start, flock?undefined:item.count, item.state, item.mode, m.uuid, m.version, m.opacity,
      Object.entries(g.attributes).map(([name,a]) => flock||posed&&['position','normal','a_position','a_normal','native_positionColor','native_normal'].includes(name)?undefined:(a as THREE.BufferAttribute).version), flock?undefined:g.index?.version);
    if (m instanceof THREE.RawShaderMaterial) parts.push(m.uniforms.u_mode?.value, m.uniforms.u_materialId?.value, m.uniforms.u_matColor?.value?.toArray?.(), m.uniforms.u_opaque?.value);
    else parts.push((m as THREE.MeshBasicMaterial).color?.toArray(), (m as THREE.MeshBasicMaterial).vertexColors);
  }
  return JSON.stringify(parts);
}

// Native Vulkan performs rasterization and, on supported hosts, presentation.
// Canvas2D presents the fallback RGBA path and retains the UI input surface.
export class VulkanViewport {
  readonly domElement = document.createElement('canvas');
  readonly performanceElement=document.createElement('div');
  readonly recoveryElement=document.createElement('button');
  private context = this.domElement.getContext('2d', { alpha: true })!;
  private nativeSurface=false;
  private initialized=false;
  private desktopSurface=false;
  private completionDriven=false;
  private deviceLabel='';
  private surfaceUpdate:Promise<void>=Promise.resolve();
  private surfaceError:unknown;
  private frameLoop?:ViewportFrameLoop;
  private surfaceBounds='';
  private width = 1;
  private height = 1;
  private ratio = 1;
  private policy=new ViewportPerformancePolicy();
  private cssWidth=1;
  private cssHeight=1;
  private running = false;
  private rendering = false;
  private frameTask?:Promise<void>;
  private sceneKey = '';
  private sceneRevision = 0;
  private sceneGeometrySha256?:string;
  private overlayKey='';
  private frameKey = '';
  private modelPoseKey='';
  private modelPoses=new Map<number,string>();
  private vertexPoseKeys=new Map<number,string>();
  private animation?: number;
  private lastAnimatedFrame=0;
  private wasAnimated=false;
  private cloudHistoryPending=false;
  private temporalFramesPending=0;
  private invalidation=0;
  private presented:number[]=[];
  private lastFrameMilliseconds=0;
  private lastGpuTiming?:Record<string,number>;
  private lastStatsUpdate=-Infinity;
  private failed=false;
  private recovering=false;
  private preparationStarted=0;
  get frameInFlight(){return this.rendering||this.recovering;}
  constructor(private api: Api, private error: (message: string) => void) {
    if (!this.context) throw new Error('无法创建 Vulkan 显示画布');
    this.performanceElement.id='viewport-performance';this.performanceElement.textContent='FPS — · — ms';
    this.performanceElement.title='视口帧率与每帧响应耗时；静止视图按需绘制。';
    this.recoveryElement.id='viewport-recover';this.recoveryElement.textContent='恢复绘制';this.recoveryElement.hidden=true;
    this.recoveryElement.onclick=()=>{void this.recover();};
  }
  async initialize() { const info=await this.api.vulkanInfo();this.policy.setDevice(info.deviceType,info.device);this.desktopSurface=!!info.nativeSurface&&!!(window as any).SkyDesktopHost?.updateViewport;this.nativeSurface=!!info.nativeSurface&&(this.desktopSurface||!!(window as any).AndroidHost?.updateViewport);this.policy.setNativeSurface(this.nativeSurface,this.desktopSurface);if(info.deviceType!==undefined&&info.deviceType!==4&&(this.desktopSurface||!this.nativeSurface))this.policy.setFrameBudget(1000/120);this.completionDriven=this.desktopSurface||!this.nativeSurface&&info.deviceType!==undefined&&info.deviceType!==4;this.frameLoop?.setHighRate(this.completionDriven);this.domElement.dataset.device=info.device;this.domElement.dataset.deviceType=String(info.deviceType??'');this.deviceLabel=`${info.device} · ${info.deviceType===4?'软件 Vulkan':'硬件 Vulkan'}；FPS 为完成绘制次数，实际显示刷新率取决于屏幕。`;this.performanceElement.title=this.deviceLabel;if(this.nativeSurface){this.updateSurface();await this.surfaceUpdate;if(this.surfaceError)throw this.surfaceError;}this.initialized=true;return info; }
  private updateSurface(){
    if(!this.nativeSurface)return;
    const rect=this.domElement.getBoundingClientRect(),ratio=devicePixelRatio,bounds=JSON.stringify([rect.left,rect.top,rect.width,rect.height,ratio]);
    if(bounds===this.surfaceBounds)return;
    this.surfaceBounds=bounds;
    const host=this.desktopSurface?(window as any).SkyDesktopHost:(window as any).AndroidHost;
    // Handle failures immediately, including during asynchronous map loading;
    // the render path reports them after all ordered resize requests settle.
    this.surfaceUpdate=this.surfaceUpdate.then(()=>host.updateViewport(rect.left,rect.top,rect.width,rect.height,ratio)).then(()=>{this.surfaceError=undefined;},error=>{this.surfaceError=error;if(this.surfaceBounds===bounds)this.surfaceBounds='';});
  }
  setQuality(quality:ViewportQuality){this.policy.setQuality(quality);this.setSize(this.cssWidth,this.cssHeight);this.invalidate();}
  setResolutionMode(mode:ViewportResolutionMode){this.policy.setResolutionMode(mode);this.setSize(this.cssWidth,this.cssHeight);this.invalidate();}
  setFrameBudget(milliseconds:number){this.policy.setFrameBudget(milliseconds);this.setSize(this.cssWidth,this.cssHeight);this.invalidate();}
  isAvailable() { return this.running&&this.initialized; }
  /** Scene rebuilds release runtime owners after the outstanding frame has
   * finished consuming them. The UI marks itself busy before awaiting this. */
  whenIdle(){return this.frameTask??Promise.resolve();}
  setPixelRatio(ratio: number) { this.ratio = ratio; }
  setSize(width: number, height: number) {
    this.cssWidth=width;this.cssHeight=height;
    const previousWidth=this.width,previousHeight=this.height;
    this.policy.setViewportDimension(Math.max(width,height)*this.ratio);
    const scale=Math.min(this.ratio,this.policy.maximumDimension/Math.max(width,height));
    this.width=Math.max(1,Math.round(width*scale));this.height=Math.max(1,Math.round(height*scale));
    // Retain the displayed frame while a different raster size is rendering.
    // Resizing Canvas2D clears its pixels, so commit its dimensions only with
    // the next complete frame; adaptation must not flash an empty viewport.
    if(previousWidth!==this.width||previousHeight!==this.height)this.frameKey='';
    this.domElement.style.width = width + 'px'; this.domElement.style.height = height + 'px';
    this.updateSurface();
  }
  setAnimationLoop(callback: () => void) {
    this.running = true;
    this.frameLoop?.stop();this.frameLoop=new ViewportFrameLoop(()=>{if(this.running){this.preparationStarted=performance.now();callback();this.updatePerformance(performance.now());}},()=>this.rendering,()=>document.visibilityState!=='hidden');this.frameLoop.setHighRate(this.completionDriven);this.frameLoop.start();
  }
  /** Environment state requests a new frame without invalidating geometry or
   * cancelling an asynchronous map build. A pending older frame cannot consume
   * an invalidation issued after it started. */
  invalidate(){this.frameKey='';this.invalidation++;}
  async recover(){
    if(this.rendering||this.recovering||!this.api.vulkanRestart)return;
    this.recovering=true;this.recoveryElement.disabled=true;
    try{
      await this.api.vulkanRestart();
      this.sceneKey='';this.overlayKey='';this.modelPoseKey='';this.modelPoses.clear();this.vertexPoseKeys.clear();this.sceneGeometrySha256=undefined;
      this.cloudHistoryPending=false;this.temporalFramesPending=0;this.surfaceBounds='';this.surfaceError=undefined;
      await this.initialize();
      this.failed=false;this.recoveryElement.hidden=true;delete this.domElement.dataset.vulkanError;this.invalidate();
      this.domElement.dispatchEvent?.(new Event('vulkanrecovered'));
    }catch(e){this.domElement.dataset.vulkanError=String((e as Error).message??e);this.error(this.domElement.dataset.vulkanError);}
    finally{this.recovering=false;this.recoveryElement.disabled=false;}
  }
  private updatePerformance(now:number){
    if(now-this.lastStatsUpdate<250)return;this.lastStatsUpdate=now;
    while(this.presented.length&&this.presented[0]<now-1000)this.presented.shift();
    const fps=this.presented.length,ms=this.lastFrameMilliseconds;
    const gpu=this.lastGpuTiming?` · GPU ${this.lastGpuTiming.gpuWorkMs.toFixed(1)} ms`:'';
    const hasFrame=!!this.domElement.dataset.frameSequence,w=hasFrame?this.domElement.width:this.width,h=hasFrame?this.domElement.height:this.height;
    const scale=Math.round(Math.min(w/(this.cssWidth*this.ratio),h/(this.cssHeight*this.ratio))*100);
    const mode=this.policy.resolutionMode==='native'?'清晰':this.policy.resolutionMode==='balanced'?'均衡':'流畅';
    const text=`FPS ${fps} · ${ms?ms.toFixed(1):'—'} ms · ${w}×${h} · ${scale}% ${mode} · ${this.policy.path==='basic'?'基础':this.policy.path==='fast'?'原材质':'完整'}${gpu}${!fps&&!this.rendering?' · 按需':''}`;
    if(this.performanceElement.textContent!==text)this.performanceElement.textContent=text;
    this.performanceElement.dataset.fps=String(fps);this.performanceElement.dataset.frameMs=ms.toFixed(3);
    this.performanceElement.dataset.targetFrameMs=String(this.policy.targetFrameBudget);
    this.performanceElement.dataset.resolutionMode=this.policy.resolutionMode;
    this.performanceElement.dataset.renderScale=String(scale);
    this.domElement.dataset.quality=this.policy.path;
  }
  render(scene: THREE.Scene, camera: THREE.Camera) {
    if (this.rendering || this.failed || this.recovering || !this.running || !this.initialized) return;
    // No compositor/level exists while initial Data settings are open.
    if(this.nativeSurface&&!scene.userData.level)return;
    const frameStarted=this.preparationStarted||performance.now();
    camera.updateMatrixWorld(); const projectionSnapshot=camera.projectionMatrix.toArray(),matrix = new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix, camera.matrixWorldInverse).toArray();
    this.updateSurface();
    const all=items(scene),split=!!this.api.vulkanOverlay,key = signature(scene,split?false:undefined,all,!!this.api.vulkanModelTransforms,!!this.api.vulkanModelVertices),overlayKey=split?signature(scene,true,all):'',level=scene.userData.level,cameraMatrix=camera.matrixWorld.toArray(),playbackSnapshot=this.domElement.dataset.objectPlayback,now=performance.now(),invalidation=this.invalidation;
    const vertexPoses=new Map<number,{key:string;geometry:THREE.BufferGeometry}>();
    if(this.api.vulkanModelVertices)for(const item of all)if(!item.line&&item.material.userData.nativeModel&&!item.object.userData.beamoDraw&&!item.object.userData.dynamicViewport&&(item.object.geometry.userData.nativeSkinPose==='preview'||item.object.geometry.userData.nativeFlock||item.object.geometry.userData.nativeMotes)){
      const g=item.object.geometry;vertexPoses.set(item.object.userData.nodeId,{key:g.uuid+':'+g.userData.nativePoseRevision,geometry:g});
    }
    const vertexKey=JSON.stringify([...vertexPoses].map(([id,p])=>[id,p.key]));
    const poses=new Map<number,number[]>();
    if(this.api.vulkanModelTransforms)for(const item of all)if(!item.line&&item.material.userData.nativeModel&&!item.object.userData.beamoDraw&&!item.object.userData.dynamicViewport)poses.set(item.object.userData.nodeId,item.object.matrixWorld.toArray());
    const poseStrings=new Map([...poses].map(([id,matrix])=>[id,JSON.stringify(matrix.map(Math.fround))])),poseKey=JSON.stringify([...poseStrings]);
    const native=all.filter(i=>i.material.userData.nativeBaked),cloud=scene.userData.entityCloud===true&&scene.userData.bakedDisplay==='material';
    const modelTime=all.some(i=>i.material.userData.nativeModel?.usesTime===true);
    const materialAnimated=scene.userData.animateMaterials!==false&&(cloud||(scene.userData.waterEffects||scene.userData.flowerEffects||scene.userData.candleEffects)&&scene.userData.bakedDisplay==='material'||modelTime||native.some(i=>/^(Grass|Sand)/.test(i.material.userData.nativeBaked.shader)));
    const animated=materialAnimated||scene.userData.animateModels===true;
    if(animated!==this.wasAnimated||key!==this.sceneKey){this.lastAnimatedFrame=now;this.wasAnimated=animated;}
    const tick=(animated||this.nativeSurface)&&now-this.lastAnimatedFrame>=this.policy.animationInterval;
    // The native protocol/uniforms use float32 matrices. Orbit's sub-float32
    // roundoff must not keep requesting new temporal frames after navigation.
    const frameKey = key + overlayKey+poseKey+vertexKey+JSON.stringify([this.width, this.height, matrix.map(Math.fround),cameraMatrix.map(Math.fround),animated,this.policy.path]);
    const changedFrame=frameKey!==this.frameKey;
    if (!changedFrame&&!tick&&!this.cloudHistoryPending&&!this.temporalFramesPending) return;
    this.rendering = true;
    this.frameTask=(async () => {
      const changed=key!==this.sceneKey;
      if (changed) { const submitted=await this.api.vulkanScene(exportVulkanScene(scene,split?false:undefined));this.sceneGeometrySha256=submitted?.geometrySha256; this.sceneKey = key; this.sceneRevision++; }
      if(!changed&&poseKey!==this.modelPoseKey&&this.api.vulkanModelTransforms){
        const updates=[...poses].filter(([id])=>this.modelPoses.get(id)!==poseStrings.get(id)).map(([nodeId,matrix])=>({nodeId,matrix}));
        if(updates.length){await this.api.vulkanModelTransforms(updates);this.sceneRevision++;}
      }
      this.modelPoseKey=poseKey;this.modelPoses=poseStrings;
      if(!changed&&this.api.vulkanModelVertices){
        const updates:VulkanModelVertices[]=[];
        for(const [nodeId,p] of vertexPoses)if(this.vertexPoseKeys.get(nodeId)!==p.key){
          if(p.geometry.userData.nativeMotes){updates.push({nodeId,moteVertices:p.geometry.userData.moteVertices,indices:p.geometry.index!.array as Uint32Array});continue;}
          if(p.geometry.userData.nativeFlock){updates.push({nodeId,flockVertices:p.geometry.userData.flockVertices,indices:p.geometry.index!.array as Uint32Array});continue;}
          updates.push({nodeId,packedPositions:Uint8Array.from((p.geometry.getAttribute('native_positionColor') as THREE.BufferAttribute).array),packedNormals:Int8Array.from((p.geometry.getAttribute('native_normal') as THREE.BufferAttribute).array)});
        }
        if(updates.length){await this.api.vulkanModelVertices(updates);this.sceneRevision++;this.sceneGeometrySha256=undefined;}
      }
      this.vertexPoseKeys=new Map([...vertexPoses].map(([id,p])=>[id,p.key]));
      if(split&&(changed||overlayKey!==this.overlayKey)){await this.api.vulkanOverlay!(exportVulkanScene(scene,true));this.overlayKey=overlayKey;}
      const animation=materialAnimated&&now>this.lastAnimatedFrame?{delta:(now-this.lastAnimatedFrame)/1000}:undefined;this.lastAnimatedFrame=now;
      const interaction=scene.userData.physicsBallPosition?{avatarPosition:scene.userData.physicsBallPosition as number[]}:undefined;
      await this.surfaceUpdate;
      if(this.surfaceError)throw this.surfaceError;
      const width = this.width, height = this.height, frame = await this.api.vulkanFrame(width, height, matrix,cameraMatrix,animation,interaction,this.policy.path);
      if (width === this.width && height === this.height&&(!frame.surface||frame.presented)) {
        if(this.domElement.width!==width||this.domElement.height!==height){this.domElement.width=width;this.domElement.height=height;}
        if(frame.gpuFrameTiming&&['gpuWorkMs','opaqueMs','depthCloudFogMs','motionTaaTonemapMs','displayReadbackMs'].every(k=>Number.isFinite(frame.gpuFrameTiming![k]))){const t=frame.gpuFrameTiming;this.lastGpuTiming=t;this.performanceElement.title=this.deviceLabel+`\nGPU ${t.gpuWorkMs.toFixed(1)} ms · 地形/模型 ${t.opaqueMs.toFixed(1)} · 云雾/深度 ${t.depthCloudFogMs.toFixed(1)} · 抗锯齿/调色 ${t.motionTaaTonemapMs.toFixed(1)} · 显示传输 ${t.displayReadbackMs.toFixed(1)} ms`;this.domElement.dataset.gpuFrameTiming=JSON.stringify(t);}
        if(!frame.surface){this.context.putImageData(new ImageData(new Uint8ClampedArray(frame.pixels.buffer as ArrayBuffer, frame.pixels.byteOffset, frame.pixels.byteLength), frame.width, frame.height), 0, 0);this.domElement.style.opacity='1';}else{document.documentElement.classList.add('native-surface');if(this.desktopSurface)document.documentElement.classList.add('desktop-native-surface');this.domElement.style.opacity='0';}
        this.lastFrameMilliseconds=performance.now()-frameStarted;this.presented.push(performance.now());this.updatePerformance(performance.now()); this.frameKey = frameKey; this.cloudHistoryPending=cloud&&!animated&&changedFrame; this.domElement.dataset.renderedSceneRevision=String(this.sceneRevision);if(this.sceneGeometrySha256)this.domElement.dataset.renderedGeometrySha256=this.sceneGeometrySha256;else delete this.domElement.dataset.renderedGeometrySha256;this.domElement.dataset.level=level??''; this.domElement.dataset.frameSequence = String(Number(this.domElement.dataset.frameSequence ?? 0) + 1);this.domElement.dataset.cameraPosition=JSON.stringify(cameraMatrix.slice(12,15));this.domElement.dataset.cameraForward=JSON.stringify(cameraMatrix.slice(8,11).map(v=>-v));this.domElement.dataset.cameraProjection=JSON.stringify(projectionSnapshot);this.domElement.dataset.cameraMatrix=JSON.stringify(cameraMatrix);this.domElement.dataset.viewProjection=JSON.stringify(matrix);if(playbackSnapshot)this.domElement.dataset.renderedObjectPlayback=playbackSnapshot;else delete this.domElement.dataset.renderedObjectPlayback;
        // Complete the recovered eight-phase temporal sampling cycle when a
        // full view becomes stationary. Two cloud-history frames alone leave
        // static edges undersampled. Animation continues its normal frame loop.
        this.temporalFramesPending=this.policy.path==='full'&&!animated?(changedFrame?7:Math.max(0,this.temporalFramesPending-1)):0;
        this.domElement.dataset.temporalFramesPending=String(this.temporalFramesPending);
      }
      if(invalidation!==this.invalidation)this.frameKey='';
      if(this.policy.observe(performance.now()-frameStarted,performance.now(),changed)){this.setSize(this.cssWidth,this.cssHeight);this.invalidate();}
    })().catch(e => { this.failed=true;this.recoveryElement.hidden=!this.api.vulkanRestart;this.domElement.dataset.vulkanError=String(e.message??e);this.performanceElement.textContent='Vulkan 绘制失败';this.error(String(e.message ?? e)); }).finally(() => { this.rendering = false;this.frameLoop?.complete(); });
  }
  dispose() { this.running = false;this.frameLoop?.stop(); if (this.animation !== undefined) cancelAnimationFrame(this.animation); }
}
