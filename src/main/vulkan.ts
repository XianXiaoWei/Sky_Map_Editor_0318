import { EventEmitter } from 'node:events';
import type { Readable, Writable } from 'node:stream';
import { spawn, type ChildProcessWithoutNullStreams } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';
import {createHash} from 'node:crypto';
import {VULKAN_FULL_MAGIC,vulkanFullGraphBytes,type VulkanFullGraph} from '../core/vulkan-full-preview';
import {VulkanResponseDecoder} from './vulkan-response';
import {vulkanDrawOrderBytes,vulkanDrawVisibilityBytes,vulkanWindowBoundsBytes,vulkanGeometryBatchBytes,type VulkanBakedDraw,type VulkanWindowBounds} from '../core/vulkan-protocol';
import { vulkanFrameBytes, vulkanRequest, vulkanSceneBytes, vulkanMaterialSceneBytes, vulkanMaterialBatchBytes, vulkanUniformBatchBytes, vulkanResourceBatchBytes, VULKAN_FRAME_MAGIC, VULKAN_MATERIAL_MAGIC, VULKAN_PRESENT_MAGIC, type VulkanFrame, type VulkanScene, type VulkanMaterialFrame, type VulkanMaterialScene, type VulkanMaterialResource } from '../core/vulkan-protocol';

export interface VulkanTransport extends EventEmitter {
  stdin: Writable; stdout: Readable; stderr: Readable;
  exitCode: number | null; killed: boolean; kill(): boolean;
  unref?():void;
}
export class VulkanHost {
  private materialCache=new Map<string,{slot:number;resources:Map<number,string>}>();
  private materialCacheSetups=0;
  private materialCachePatches=0;
  private fullCache=new Map<number,{key:string;resources:Map<number,string>[];geometry:string[]}>();
  private fullSetups=0;
  private fullPatches=0;
  private immutableDigests=new WeakMap<Uint8Array|Uint32Array,string>();
  private resourceHashBytes=0;
  private digestCacheHits=0;
  private skippedFullUpdates=0;
  private gpuFrameTiming?:Record<string,number>;
  private digest(bytes:Uint8Array|Uint32Array,immutable=false){
    if(immutable){const cached=this.immutableDigests.get(bytes);if(cached){this.digestCacheHits++;return cached;}}
    this.resourceHashBytes+=bytes.byteLength;const hash=createHash('sha256').update(new Uint8Array(bytes.buffer,bytes.byteOffset,bytes.byteLength)).digest('hex');
    if(immutable)this.immutableDigests.set(bytes,hash);return hash;
  }
  private process?: ChildProcessWithoutNullStreams | VulkanTransport;
  private decoder = new VulkanResponseDecoder();
  private sequence = 0;
  private pending = new Map<number, { kind: number; resolve: (frame: VulkanFrame | VulkanMaterialFrame) => void; reject: (error: Error) => void; timer: ReturnType<typeof setTimeout> }>();
  private description?: { engine: string; backend: string; device: string; apiVersion: number; deviceType: number; nativeSurface?:boolean;dynamicGeometry?:boolean;samplerAnisotropyPolicy?:string;maxSamplerAnisotropy?:number };
  private startup?: Promise<NonNullable<VulkanHost['description']>>;
  constructor(private executable: string, private transportFactory?: () => VulkanTransport,private environment:Record<string,string>={}) {}
  start() {
    if (this.startup) return this.startup;
    this.startup=this.startNative().catch(error=>{
      const icd=path.resolve(path.dirname(this.executable),'../../vk_swiftshader_icd.json');
      if(process.platform!=='win32'||!fs.existsSync(icd)||process.env.VK_ICD_FILENAMES||process.env.VK_DRIVER_FILES)throw error;
      return this.startNative(icd);
    });
    return this.startup;
  }
  private startNative(softwareIcd?:string) {
    return new Promise<NonNullable<VulkanHost['description']>>((resolve, reject) => {
      if (!fs.existsSync(this.executable)) { reject(new Error(`缺少原生 Vulkan 渲染程序：${path.basename(this.executable)}`)); return; }
      const child = this.process = this.transportFactory ? this.transportFactory() : spawn(this.executable, [], { windowsHide: true,env:{...process.env,...this.environment,...softwareIcd?{VK_ICD_FILENAMES:softwareIcd,VK_DRIVER_FILES:softwareIcd}:{}} });
      let log = '', ready = false,timingLog='';
      const timer = setTimeout(() => { reject(new Error('Vulkan 初始化超时')); if (this.process === child) this.stop(); }, 30000);
      child.stderr.on('data', (chunk: Buffer) => {
        if (this.process !== child) return;
        log = (log + chunk.toString()).slice(-8192);
        timingLog+=chunk.toString();const lines=timingLog.split('\n');timingLog=lines.pop()!.slice(-8192);
        for(const line of lines)if(line.startsWith('{"gpuFrameTiming":')){try{const timing=JSON.parse(line).gpuFrameTiming;if(timing&&Object.values(timing).every(v=>typeof v==='number'&&Number.isFinite(v)&&v>=0))this.gpuFrameTiming=timing;}catch{}}
        if (!ready) {
          const match = log.match(/^\{"engine"[^\n]+\}/m);
          if (match) { this.description = JSON.parse(match[0]); ready = true; clearTimeout(timer); resolve(this.description!); }
        }
      });
      child.stdout.on('data', (chunk: Buffer) => {
        if (this.process !== child) return;
        try {
          this.decoder.push(chunk,b=>{
            if(b.readUInt32LE()===VULKAN_FULL_MAGIC){
              const id=b.readUInt32LE(4),width=b.readUInt32LE(8),height=b.readUInt32LE(12),mode=b.readUInt32LE(20),averageLum=b.readDoubleLE(24),pending=this.pending.get(id);
              if(pending){if(pending.kind!==VULKAN_FULL_MAGIC)throw new Error('Vulkan 帧类型不匹配');clearTimeout(pending.timer);this.pending.delete(id);pending.resolve({width,height,pixels:new Uint8Array(b.buffer,b.byteOffset+32,b.length-32),...mode?{surface:true,presented:mode===2}:{},averageLum,gpuFrameTiming:this.gpuFrameTiming?.request===id?{...this.gpuFrameTiming}:undefined});}return;
            }
            const magic = b.readUInt32LE(), material = magic === VULKAN_MATERIAL_MAGIC, present=magic===VULKAN_PRESENT_MAGIC, header = material ? 24 : 20;
            const id = b.readUInt32LE(4), width = b.readUInt32LE(8), height = b.readUInt32LE(12), count = material ? b.readUInt32LE(16) : 1, size = b.readUInt32LE(material ? 20 : 16);
            if (![VULKAN_FRAME_MAGIC, VULKAN_MATERIAL_MAGIC,VULKAN_PRESENT_MAGIC].includes(magic) || !width || !height || width > 4096 || height > 4096 || !count || count > 4 || (present?size>1:size !== width * height * count * (material ? 16 : 4))) throw new Error('Vulkan 帧响应无效');
            const pending = this.pending.get(id);
            if (pending) {
              if (pending.kind !== magic) throw new Error('Vulkan 帧类型不匹配');
              clearTimeout(pending.timer); this.pending.delete(id);
              if(present)pending.resolve({width,height,pixels:new Uint8Array(),surface:true,presented:size===1});
              else if (material) {
                const attachments = Array.from({ length: count }, (_, i) => {
                  const raw = Uint8Array.from(b.subarray(header + i * width * height * 16, header + (i + 1) * width * height * 16));
                  return new Float32Array(raw.buffer);
                });
                pending.resolve({ width, height, attachments });
              } else pending.resolve({ width, height, pixels: new Uint8Array(b.buffer, b.byteOffset + header, size) });
            }
          });
        } catch (e) { this.fail(e as Error); child.kill(); }
      });
      child.on('error', error => { clearTimeout(timer); reject(error); if (this.process === child) this.fail(error); });
      child.on('exit', (code, signal) => { clearTimeout(timer); const error = new Error(`Vulkan 渲染进程退出 (${signal ?? code})${log ? '：' + log.trim() : ''}`); if (!ready) reject(error); if(this.process===child){this.fail(error);this.process = undefined;} });
    });
  }
  private fail(error: Error) { for (const p of this.pending.values()) { clearTimeout(p.timer); p.reject(error); } this.pending.clear(); }
  private async write(bytes: Buffer) {
    await this.start(); const child = this.process; if (!child || child.exitCode !== null || child.killed) throw new Error('Vulkan 渲染进程不可用');
    await new Promise<void>((resolve, reject) => child.stdin.write(bytes, error => error ? reject(error) : resolve()));
  }
  async setScene(scene: VulkanScene) { const bytes = vulkanSceneBytes(scene); await this.write(vulkanRequest(1, bytes)); }
  async setWindowBounds(bounds:VulkanWindowBounds){await this.write(vulkanRequest(22,vulkanWindowBoundsBytes(bounds)));}
  async setMaterialScene(scene: VulkanMaterialScene) { await this.write(vulkanRequest(3, vulkanMaterialSceneBytes(scene))); }
  /** Full-effect pass resources are retained across frames. Only changed
   * uniform/texture bytes are patched; shader/layout/geometry changes allocate
   * a new bounded slot. Hash content so in-place texture edits remain visible. */
  async setCachedMaterialScene(scene:VulkanMaterialScene) {
    if(process.env.SKY_DISABLE_EFFECT_CACHE==='1')return this.setMaterialScene(scene);
    const digest=(bytes:Uint8Array)=>createHash('sha256').update(bytes).digest('hex');
    const metadata=JSON.stringify([scene.stride,scene.attributes,scene.colorCount,scene.colorFormats,scene.state,scene.topology,scene.resources.map(r=>[r.binding,r.kind,r.format,r.dimensions,r.linear,r.repeat,r.addressModes,r.mipLevels,r.anisotropy,r.data.length])]);
    const key=createHash('sha256').update(metadata).update(scene.vertexSpirv).update(scene.fragmentSpirv).update(scene.vertices).update(new Uint8Array(scene.indices.buffer,scene.indices.byteOffset,scene.indices.byteLength)).digest('hex');
    const hashes=new Map(scene.resources.map(r=>[r.binding,digest(r.data)]));
    let cached=this.materialCache.get(key);
    if(cached){
      const updates=scene.resources.filter(r=>cached!.resources.get(r.binding)!==hashes.get(r.binding));
      const header=Buffer.alloc(4);header.writeUInt32LE(cached.slot);
      await this.write(vulkanRequest(25,Buffer.concat([header,vulkanResourceBatchBytes([updates])])));
      cached.resources=hashes;this.materialCache.delete(key);this.materialCache.set(key,cached);this.materialCachePatches++;
    }else{
      let slot=this.materialCache.size;
      if(slot===16){const oldest=this.materialCache.entries().next().value!;slot=oldest[1].slot;this.materialCache.delete(oldest[0]);}
      const header=Buffer.alloc(4);header.writeUInt32LE(slot);
      await this.write(vulkanRequest(24,Buffer.concat([header,vulkanMaterialSceneBytes(scene)])));
      cached={slot,resources:hashes};this.materialCache.set(key,cached);this.materialCacheSetups++;
    }
  }
  materialCacheInfo(){return {slots:this.materialCache.size,setups:this.materialCacheSetups,patches:this.materialCachePatches,capacity:16};}
  async setFullStage(id:number,scenes:VulkanMaterialScene[]){
    if(!Number.isInteger(id)||id<0||id>=17)throw new Error('完整渲染阶段无效');
    await this.start();
    const header=Buffer.alloc(12);header.writeUInt32LE(id);
    if(!scenes.length){if(!this.fullCache.has(id)){this.skippedFullUpdates++;return;}header.writeUInt32LE(2,4);await this.write(vulkanRequest(26,header));this.fullCache.delete(id);return;}
    const structure=createHash('sha256');
    for(const scene of scenes)structure.update(JSON.stringify([scene.stride,scene.attributes,scene.colorCount,scene.colorFormats,scene.state,scene.topology,scene.resources.map(r=>[r.binding,r.kind,r.format,r.dimensions,r.linear,r.repeat,r.addressModes,r.mipLevels,r.anisotropy,r.data.length])])).update(this.digest(scene.vertexSpirv,true)).update(this.digest(scene.fragmentSpirv,true));
    const key=structure.digest('hex'),resources=scenes.map(s=>new Map(s.resources.map(r=>[r.binding,this.digest(r.data,r.kind!==0&&r.immutable)]))),geometry=scenes.map(s=>this.digest(s.vertices,s.immutableGeometry)+this.digest(s.indices,s.immutableGeometry));
    const previous=this.fullCache.get(id);
    if(previous?.key===key){
      const changedResources=scenes.map((s,i)=>s.resources.filter(r=>previous.resources[i].get(r.binding)!==resources[i].get(r.binding)));
      if(changedResources.every(r=>!r.length)&&geometry.every((hash,i)=>hash===previous.geometry[i])){this.skippedFullUpdates++;return;}
      const updates=vulkanResourceBatchBytes(changedResources);
      const words=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v,i*4));return b;};
      const chunks:Buffer[]=[words([scenes.length])];
      scenes.forEach((scene,i)=>{if(previous.geometry[i]===geometry[i])chunks.push(words([0,0,0]));else chunks.push(words([scene.vertices.length,scene.indices.length,scene.stride]),Buffer.from(scene.vertices.buffer,scene.vertices.byteOffset,scene.vertices.byteLength),Buffer.from(scene.indices.buffer,scene.indices.byteOffset,scene.indices.byteLength));});
      header.writeUInt32LE(1,4);header.writeUInt32LE(updates.length,8);await this.write(vulkanRequest(26,Buffer.concat([header,updates,...chunks])));this.fullPatches++;
    }else{const bytes=vulkanMaterialBatchBytes(scenes);header.writeUInt32LE(bytes.length,8);await this.write(vulkanRequest(26,Buffer.concat([header,bytes])));this.fullSetups++;}
    this.fullCache.set(id,{key,resources,geometry});
  }
  fullCacheInfo(){return {stages:this.fullCache.size,setups:this.fullSetups,patches:this.fullPatches,intermediateFrameReadbacks:0,resourceHashBytes:this.resourceHashBytes,digestCacheHits:this.digestCacheHits,skippedUpdates:this.skippedFullUpdates,gpuFrameTiming:this.gpuFrameTiming&&{...this.gpuFrameTiming}};}
  async fullFrame(width:number,height:number,matrix:number[],graph:VulkanFullGraph):Promise<VulkanFrame>{
    if(this.pending.size)throw new Error('上一帧 Vulkan 请求仍未完成');
    const device=await this.start(),id=this.sequence=(this.sequence+1)>>>0,bytes=vulkanFullGraphBytes(id,width,height,matrix,graph,!!device.nativeSurface);
    return new Promise((resolve,reject)=>{
      const timer=setTimeout(()=>{this.pending.delete(id);reject(new Error('Vulkan 完整渲染超时'));this.stop();},30000);
      this.pending.set(id,{kind:VULKAN_FULL_MAGIC,resolve:frame=>resolve(frame as VulkanFrame),reject,timer});void this.write(vulkanRequest(27,bytes)).catch(error=>{clearTimeout(timer);this.pending.delete(id);reject(error);});
    });
  }
  async setMaterialBatch(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(5, vulkanMaterialBatchBytes(scenes))); }
  async setViewportBackground(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(6,scenes.length?vulkanMaterialBatchBytes(scenes):Buffer.alloc(0))); }
  async setViewportCore(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(10,scenes.length?vulkanMaterialBatchBytes(scenes):Buffer.alloc(0))); }
  async setViewportMaterials(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(7,scenes.length?vulkanMaterialBatchBytes(scenes):Buffer.alloc(0))); }
  async setViewportItems(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(28,scenes.length?vulkanMaterialBatchBytes(scenes):Buffer.alloc(0))); }
  async updateViewportUniforms(draws: VulkanMaterialResource[][]) { await this.write(vulkanRequest(8,vulkanUniformBatchBytes(draws))); }
  async updateViewportGeometry(target:'materials'|'alpha',draws:(Pick<VulkanBakedDraw,'vertices'|'indices'|'stride'>|null)[]){
    if(target!=='materials'&&target!=='alpha')throw new Error('Vulkan 几何更新目标无效');
    const header=Buffer.alloc(4);header.writeUInt32LE(Number(target==='alpha'));await this.write(vulkanRequest(29,Buffer.concat([header,vulkanGeometryBatchBytes(draws)])));
  }
  async setViewportAlpha(scenes: VulkanMaterialScene[]) { await this.write(vulkanRequest(11,scenes.length?vulkanMaterialBatchBytes(scenes):Buffer.alloc(0))); }
  async setFastComposition(fog:VulkanMaterialScene,tone:VulkanMaterialScene,bindings:number[]){
    if(bindings.length!==4||!bindings.every(n=>Number.isInteger(n)&&n>=0))throw new Error('性能合成绑定无效');
    const a=vulkanMaterialSceneBytes(fog),b=vulkanMaterialSceneBytes(tone),header=Buffer.alloc(24);[a.length,b.length,...bindings].forEach((n,i)=>header.writeUInt32LE(n,i*4));
    await this.write(vulkanRequest(15,Buffer.concat([header,a,b])));
  }
  async updateFastComposition(fog:VulkanMaterialResource[][],tone:VulkanMaterialResource[][]){const a=vulkanUniformBatchBytes(fog),b=vulkanUniformBatchBytes(tone),header=Buffer.alloc(4);header.writeUInt32LE(a.length);await this.write(vulkanRequest(16,Buffer.concat([header,a,b])));}
  async updateViewportResources(target:'background'|'materials'|'alpha'|'fog'|'tone'|'items',draws:VulkanMaterialResource[][]){
    const index=['background','materials','alpha','fog','tone','items'].indexOf(target);if(index<0)throw new Error('视口资源更新目标无效');
    const header=Buffer.alloc(4);header.writeUInt32LE(index);await this.write(vulkanRequest(21,Buffer.concat([header,vulkanResourceBatchBytes(draws)])));
  }
  async updateViewportBackgroundUniforms(draws:VulkanMaterialResource[][]){await this.write(vulkanRequest(17,vulkanUniformBatchBytes(draws)));}
  async setViewportDrawOrder(opaque:number[],alpha:number[]){await this.write(vulkanRequest(18,vulkanDrawOrderBytes(opaque,alpha)));}
  async setViewportDrawVisibility(opaque:boolean[],alpha:boolean[]){await this.write(vulkanRequest(19,vulkanDrawVisibilityBytes(opaque,alpha)));}
  async updateViewportAlphaUniforms(draws: VulkanMaterialResource[][]) { await this.write(vulkanRequest(12,vulkanUniformBatchBytes(draws))); }
  async viewportAlpha(width:number,height:number) {
    if(this.pending.size)throw new Error('上一帧 Vulkan 请求仍未完成');
    const id=this.sequence=(this.sequence+1)>>>0;
    const bytes=vulkanFrameBytes(id,width,height,Array.from({length:16},(_,i)=>i%5===0?1:0)).subarray(0,12);await this.start();
    return new Promise<VulkanMaterialFrame>((resolve,reject)=>{
      const timer=setTimeout(()=>{this.pending.delete(id);reject(new Error('Vulkan 透明附件读取超时'));this.stop();},30000);
      this.pending.set(id,{kind:VULKAN_MATERIAL_MAGIC,resolve:frame=>resolve(frame as VulkanMaterialFrame),reject,timer});
      void this.write(vulkanRequest(13,bytes)).catch(error=>{clearTimeout(timer);this.pending.delete(id);reject(error);});
    });
  }
  async frame(width: number, height: number, matrix: number[], exposure?:number,fast=false,present=false) {
    if (this.pending.size) throw new Error('上一帧 Vulkan 请求仍未完成');
    const id = this.sequence = (this.sequence + 1) >>> 0, bytes = vulkanFrameBytes(id, width, height, matrix,exposure);
    await this.start();
    return new Promise<VulkanFrame>((resolve, reject) => {
      const timer = setTimeout(() => { this.pending.delete(id); reject(new Error('Vulkan 绘制超时')); this.stop(); }, 30000);
      this.pending.set(id, { kind: present?VULKAN_PRESENT_MAGIC:VULKAN_FRAME_MAGIC, resolve: frame => resolve(frame as VulkanFrame), reject, timer });
      void this.write(vulkanRequest(present?20:fast?14:2, bytes)).catch(error => { clearTimeout(timer); this.pending.delete(id); reject(error); });
    });
  }
  async materialFrame(width: number, height: number) {
    if (this.pending.size) throw new Error('上一帧 Vulkan 请求仍未完成');
    // Reuse the dimensions validation from the camera request encoder.
    const id = this.sequence = (this.sequence + 1) >>> 0;
    const header = vulkanFrameBytes(id, width, height, Array.from({ length: 16 }, (_, i) => i % 5 === 0 ? 1 : 0)).subarray(0, 12);
    await this.start();
    return new Promise<VulkanMaterialFrame>((resolve, reject) => {
      const timer = setTimeout(() => { this.pending.delete(id); reject(new Error('Vulkan 原材质绘制超时')); this.stop(); }, 30000);
      this.pending.set(id, { kind: VULKAN_MATERIAL_MAGIC, resolve: frame => resolve(frame as VulkanMaterialFrame), reject, timer });
      void this.write(vulkanRequest(4, header)).catch(error => { clearTimeout(timer); this.pending.delete(id); reject(error); });
    });
  }
  async presentMaterialFrame(width:number,height:number) {
    if(this.pending.size)throw new Error('上一帧 Vulkan 请求仍未完成');
    const id=this.sequence=(this.sequence+1)>>>0;
    const bytes=vulkanFrameBytes(id,width,height,Array.from({length:16},(_,i)=>i%5===0?1:0)).subarray(0,12);await this.start();
    return new Promise<VulkanFrame>((resolve,reject)=>{
      const timer=setTimeout(()=>{this.pending.delete(id);reject(new Error('Vulkan 完整画面呈现超时'));this.stop();},30000);
      this.pending.set(id,{kind:VULKAN_PRESENT_MAGIC,resolve:frame=>resolve(frame as VulkanFrame),reject,timer});
      void this.write(vulkanRequest(23,bytes)).catch(error=>{clearTimeout(timer);this.pending.delete(id);reject(error);});
    });
  }
  async viewportHDR(width:number,height:number,matrix:number[]) {
    if(this.pending.size)throw new Error('上一帧 Vulkan 请求仍未完成');
    const id=this.sequence=(this.sequence+1)>>>0,bytes=vulkanFrameBytes(id,width,height,matrix);await this.start();
    return new Promise<VulkanMaterialFrame>((resolve,reject)=>{
      const timer=setTimeout(()=>{this.pending.delete(id);reject(new Error('Vulkan 视口 HDR 读取超时'));this.stop();},30000);
      this.pending.set(id,{kind:VULKAN_MATERIAL_MAGIC,resolve:frame=>resolve(frame as VulkanMaterialFrame),reject,timer});
      void this.write(vulkanRequest(9,bytes)).catch(error=>{clearTimeout(timer);this.pending.delete(id);reject(error);});
    });
  }
  stop() {
    this.gpuFrameTiming=undefined;
    this.immutableDigests=new WeakMap();this.resourceHashBytes=0;this.digestCacheHits=0;this.skippedFullUpdates=0;
    this.fullCache.clear();this.fullSetups=0;this.fullPatches=0;
    this.materialCache.clear();this.materialCacheSetups=0;this.materialCachePatches=0;
    this.fail(new Error('Vulkan 渲染已停止'));const child=this.process;this.process=undefined;
    // Close pipe/socket ownership too: EOF shuts down the native reader, and
    // stale child handles cannot keep an old map runtime or test alive.
    if(child){child.stdin.destroy();child.stdout.destroy();child.stderr.destroy();child.kill();child.unref?.();}
    this.decoder = new VulkanResponseDecoder();this.startup=undefined;
  }
}
