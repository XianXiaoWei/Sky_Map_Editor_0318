export const VULKAN_FRAME_MAGIC = 0x564b4652;
export const VULKAN_PRESENT_MAGIC = 0x564b5052;
export const VULKAN_VERTEX_FLOATS = 7;
export interface VulkanBakedDraw {
  shader: string; materialIndex: number; state: number; stride: number;
  vertices: Uint8Array; indices: Uint32Array;
}
export interface VulkanModelDraw { nodeId:number; shader:string; group:import('./model-render-state').ModelRenderGroup; state:number; stride:number; vertices:Uint8Array; indices:Uint32Array; model:number[]; baked:boolean;defaultLighting?:boolean; materialNodeId?:number;beamoPass?:'primary'|'secondary'|'alpha';beamoNodeIds?:number[];beamoRanges?:{nodeId:number;vertexStart:number;vertexCount:number;indexStart:number;indexCount:number}[];creatureNodeId?:number; }
export type VulkanModelVertices = {nodeId:number;packedPositions:Uint8Array;packedNormals:Int8Array;} | {nodeId:number;moteVertices:Uint8Array;indices:Uint32Array;} | {nodeId:number;flockVertices:Uint8Array;indices:Uint32Array;};
/** Existing native geometryBatch format: null retains a draw's buffers. */
export function vulkanGeometryBatchBytes(draws:(Pick<VulkanBakedDraw,'vertices'|'indices'|'stride'>|null)[]){
 if(!draws.length||draws.length>4096)throw new Error('Vulkan 几何更新列表无效');
 const words=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n,i*4));return b;};
 const chunks:Buffer[]=[words([draws.length])];let bytes=4;
 for(const draw of draws){
  if(!draw){chunks.push(words([0,0,0]));bytes+=12;continue;}
  if(!(draw.vertices instanceof Uint8Array)||!(draw.indices instanceof Uint32Array)||!Number.isInteger(draw.stride)||draw.stride<=0||draw.stride>4096||draw.vertices.length%draw.stride||draw.vertices.length>400000000||draw.indices.length>20000000||draw.indices.some(i=>i>=draw.vertices.length/draw.stride))throw new Error('Vulkan 动态几何输入无效');
  bytes+=12+draw.vertices.length+draw.indices.byteLength;if(bytes>600000000)throw new Error('Vulkan 动态几何容量超限');
  chunks.push(words([draw.vertices.length,draw.indices.length,draw.stride]),Buffer.from(draw.vertices.buffer,draw.vertices.byteOffset,draw.vertices.byteLength),Buffer.from(draw.indices.buffer,draw.indices.byteOffset,draw.indices.byteLength));
 }
 return Buffer.concat(chunks);
}
export interface VulkanScene { vertices: Float32Array; draws: Uint32Array; baked?: VulkanBakedDraw[]; models?:VulkanModelDraw[]; modelBoundaries?:{nodeId:number;reason:string}[]; cloud?:boolean; }
export function mergeVulkanOverlays(base:VulkanScene,overlay:VulkanScene):VulkanScene {
  vulkanSceneBytes(base);vulkanSceneBytes(overlay);
  const vertices=new Float32Array(base.vertices.length+overlay.vertices.length),draws=new Uint32Array(base.draws.length+overlay.draws.length);
  vertices.set(base.vertices);vertices.set(overlay.vertices,base.vertices.length);draws.set(base.draws);draws.set(overlay.draws,base.draws.length);
  for(let i=base.draws.length;i<draws.length;i+=4)draws[i]+=base.vertices.length/7;
  return {vertices,draws};
}
export interface VulkanFrame { width: number; height: number; pixels: Uint8Array; surface?: boolean; presented?: boolean; averageLum?:number; gpuFrameTiming?:Record<string,number>; }
export interface VulkanWindowBounds {x:number;y:number;width:number;height:number;visible:boolean;}
export function vulkanWindowBoundsBytes(bounds:VulkanWindowBounds){
  const {x,y,width,height,visible}=bounds;
  if(![x,y,width,height].every(Number.isInteger)||Math.abs(x)>32768||Math.abs(y)>32768||width<0||height<0||width>16384||height>16384||typeof visible!=='boolean')throw new Error('原生视口边界无效');
  const bytes=Buffer.alloc(20);bytes.writeInt32LE(x,0);bytes.writeInt32LE(y,4);bytes.writeUInt32LE(width,8);bytes.writeUInt32LE(height,12);bytes.writeUInt32LE(Number(visible),16);return bytes;
}
export const VULKAN_MATERIAL_MAGIC = 0x564b4d52;
export interface VulkanMaterialFrame { width: number; height: number; attachments: Float32Array[]; }
export const VULKAN_TEXTURE_FORMATS = { r8: 1, rgba8: 2, r32f: 3, rgba32f: 4, r16f: 5, rg16f: 6, rgba16f: 7,
  r8ui: 8, rg8ui: 9, r16ui: 10, rg16ui: 11, r32ui: 12, rgba8ui: 13, rgba8srgb: 14 } as const;
export type VulkanTextureFormat = keyof typeof VULKAN_TEXTURE_FORMATS;
export type VulkanAddressMode = 'clamp' | 'repeat' | 'mirror' | 'border';
export type VulkanColorFormat = 'r32f' | 'rgba32f' | 'r16f' | 'rg16f' | 'rgba16f';
export interface VulkanMaterialResource { binding: number; kind: 0 | 1 | 2 | 3; format: 0 | typeof VULKAN_TEXTURE_FORMATS[VulkanTextureFormat]; dimensions: [number, number, number]; linear: boolean; repeat: boolean; addressModes?: [VulkanAddressMode,VulkanAddressMode,VulkanAddressMode]; mipLevels?: number; anisotropy?: number; data: Uint8Array; immutable?:boolean; }
export function vulkanTextureDataBytes(dimensions: [number, number, number], kind: number, format: number, mipLevels = 1) {
  const [w, h, d] = dimensions, texelBytes = [0, 1, 4, 4, 16, 2, 4, 8, 1, 2, 2, 4, 4, 4, 4][format];
  if (![1, 2, 3].includes(kind) || !texelBytes || !dimensions.every(n => Number.isInteger(n) && n > 0 && n <= 16384)
    || kind === 1 && d !== 1 || kind === 3 && (d !== 6 || w !== h)
    || !Number.isInteger(mipLevels) || mipLevels < 1 || mipLevels > 1 + Math.floor(Math.log2(Math.max(w, h, kind === 2 ? d : 1)))) throw new Error('Vulkan 纹理尺寸、格式或 mip 层数无效');
  // Packed mip-major data; cube layers are +X,-X,+Y,-Y,+Z,-Z per level.
  let bytes = 0;
  for (let level = 0; level < mipLevels; level++) bytes += Math.max(1, w >> level) * Math.max(1, h >> level)
    * (kind === 3 ? 6 : kind === 2 ? Math.max(1, d >> level) : 1) * texelBytes;
  return bytes;
}
export interface VulkanMaterialScene {
  vertexSpirv: Uint8Array; fragmentSpirv: Uint8Array; stride: number;
  attributes: { location: number; format: number; offset: number }[];
  resources: VulkanMaterialResource[]; colorCount: number; colorFormats?: VulkanColorFormat[]; state: number;
  vertices: Uint8Array; indices: Uint32Array;
  immutableGeometry?:boolean;
  topology?:'triangles'|'points';
}
export const VULKAN_ATTRIBUTE_FORMATS = { float: 100, vec2: 103, vec3: 106, vec4: 109, half2: 83, half4:97, unorm4: 37, snorm4: 38 } as const;
const attributeBytes = new Map([[83, 4], [97,8], [100, 4], [103, 8], [106, 12], [109, 16], [37, 4], [38, 4]]);
type TextureTable={ids:WeakMap<Uint8Array,Map<string,number>>;next:number};
export function vulkanMaterialSceneBytes(scene: VulkanMaterialScene,table?:TextureTable): Buffer {
  const { stride, attributes, resources, colorCount, colorFormats, state, topology, vertices, indices, vertexSpirv, fragmentSpirv } = scene;
  if (!Number.isInteger(stride) || stride < 1 || stride > 256 || !(vertices instanceof Uint8Array) || !(indices instanceof Uint32Array) || vertices.length % stride || vertices.length > 400000000 || indices.length > 20000000 || state < 0 || state > 12 || !Number.isInteger(state) || topology!==undefined&&!['triangles','points'].includes(topology) || topology==='points'&&(state===3||state===5) || indices.length % (topology==='points'?1:state === 3 || state === 5 ? 2 : 3) || !Number.isInteger(colorCount) || colorCount < 1 || colorCount > 4) throw new Error('Vulkan 原材质几何或输出无效');
  if (![vertexSpirv, fragmentSpirv].every(s => s instanceof Uint8Array && s.length >= 20 && s.length % 4 === 0 && new DataView(s.buffer, s.byteOffset, s.byteLength).getUint32(0, true) === 0x07230203)) throw new Error('Vulkan 材质 SPIR-V 无效');
  if (attributes.length > 16 || new Set(attributes.map(a => a.location)).size !== attributes.length || attributes.some(a => !Number.isInteger(a.location) || a.location < 0 || a.location >= 16 || !Number.isInteger(a.offset) || a.offset < 0 || !attributeBytes.has(a.format) || a.offset + attributeBytes.get(a.format)! > stride)) throw new Error('Vulkan 原顶点格式无效');
  if (!indices.every(i => i < vertices.length / stride)) throw new Error('Vulkan 原材质索引越界');
  if (resources.length > 32 || new Set(resources.map(r => r.binding)).size !== resources.length) throw new Error('Vulkan 资源绑定重复或超限');
  if (colorFormats && (colorFormats.length !== colorCount || colorFormats.some(f => !['r16f', 'rg16f', 'rgba16f', 'r32f', 'rgba32f'].includes(f)))) throw new Error('Vulkan 输出附件格式无效');
  const chunks: Buffer[] = [];
  // Topology is independent of the original blend/depth state. Legacy packets
  // retain their bytes; bit 8 selects the native point-list pipeline.
  const header = Buffer.alloc(36); [vertexSpirv.length, fragmentSpirv.length, stride, attributes.length, resources.length, colorCount, state|(topology==='points'?0x100:0), vertices.length, indices.length].forEach((n, i) => header.writeUInt32LE(n, i * 4));
  chunks.push(header, Buffer.from(vertexSpirv), Buffer.from(fragmentSpirv));
  for (const a of attributes) { const b = Buffer.alloc(12); [a.location, a.format, a.offset].forEach((n, i) => b.writeUInt32LE(n, i * 4)); chunks.push(b); }
  for (const r of resources) {
    if (!Number.isInteger(r.binding) || r.binding < 0 || r.binding > 65535 || ![0, 1, 2, 3].includes(r.kind) || !(r.data instanceof Uint8Array) || !r.data.length || r.data.length > 300000000) throw new Error('Vulkan 原材质资源无效');
    if (r.kind && (r.data.length !== vulkanTextureDataBytes(r.dimensions, r.kind, r.format, r.mipLevels)
      || r.format >= 8 && r.format <= 13 && r.linear)) throw new Error('Vulkan 纹理格式、过滤方式与数据长度不符');
    const anisotropy=r.anisotropy??1;
    if(!Number.isInteger(anisotropy)||anisotropy<1||anisotropy>16||anisotropy>1&&(!r.kind||!r.linear))throw new Error('Vulkan 各向异性过滤无效');
    const filter = r.kind ? ((r.mipLevels ?? 1) - 1) * 2 + Number(r.linear) + (anisotropy>1?anisotropy*256:0) : 0;
    const modes=['clamp','repeat','mirror','border'];
    if(r.addressModes && (r.addressModes.length!==3 || r.addressModes.some(mode=>!modes.includes(mode)))) throw new Error('Vulkan 纹理寻址模式无效');
    // Flagged per-axis modes; legacy address words 0/1 remain unchanged.
    const address=r.addressModes ? (0x80000000 | r.addressModes.reduce((bits,mode,i)=>bits|(modes.indexOf(mode)<<(i*2)),0))>>>0 : Number(r.repeat);
    let reference:number|undefined;
    if(table&&r.kind){const key=JSON.stringify([r.kind,r.format,r.dimensions,r.mipLevels??1]);let ids=table.ids.get(r.data);if(!ids){ids=new Map();table.ids.set(r.data,ids);}reference=ids.get(key);if(reference===undefined)ids.set(key,table.next++);}
    const b = Buffer.alloc(36); [r.binding, reference===undefined?r.kind:r.kind|4, reference===undefined?r.format:reference, ...r.dimensions, filter, address, reference===undefined?r.data.length:0].forEach((n, i) => b.writeUInt32LE(n, i * 4)); chunks.push(b);if(reference===undefined)chunks.push(Buffer.from(r.data.buffer,r.data.byteOffset,r.data.byteLength));
  }
  chunks.push(Buffer.from(vertices), Buffer.from(indices.buffer, indices.byteOffset, indices.byteLength));
  if (colorFormats) { const b = Buffer.alloc(colorCount * 4); colorFormats.forEach((f, i) => b.writeUInt32LE(VULKAN_TEXTURE_FORMATS[f], i * 4)); chunks.push(b); }
  const size = chunks.reduce((n, b) => n + b.length, 0); if (size > 600000000) throw new Error('Vulkan 原材质请求超限');
  return Buffer.concat(chunks);
}
// A sequence of pipelines/descriptors drawn inside ONE render pass. Every draw
// sees the same color/depth attachments; only the beginning clears the targets.
export function vulkanMaterialBatchBytes(scenes: VulkanMaterialScene[]): Buffer {
  if (!scenes.length || scenes.length > 4096) throw new Error('Vulkan 材质绘制列表长度无效');
  const formats = (s: VulkanMaterialScene) => s.colorFormats ?? Array(s.colorCount).fill('rgba32f');
  const first = formats(scenes[0]);
  if (scenes.some(s => s.colorCount !== scenes[0].colorCount || formats(s).length !== first.length || formats(s).some((f, i) => f !== first[i]))) throw new Error('Vulkan 同一 pass 的输出附件不一致');
  const header = Buffer.alloc(4); header.writeUInt32LE(scenes.length);
  const chunks: Buffer[] = [header]; let bytes = 4;
  const table:TextureTable={ids:new WeakMap(),next:0};
  for (const scene of scenes) {
    const payload = vulkanMaterialSceneBytes(scene,table); bytes += payload.length + 4;
    if (bytes > 600000000) throw new Error('Vulkan 材质绘制列表容量超限');
    const length = Buffer.alloc(4); length.writeUInt32LE(payload.length); chunks.push(length, payload);
  }
  return Buffer.concat(chunks);
}
export function vulkanSceneBytes(scene: VulkanScene): Buffer {
  if (!(scene.vertices instanceof Float32Array) || !(scene.draws instanceof Uint32Array) || scene.vertices.length % 7 || scene.draws.length % 4) throw new Error('Vulkan 顶点或绘制列表无效');
  const vc = scene.vertices.length / 7, dc = scene.draws.length / 4;
  if (vc > 20000000 || dc > 200000) throw new Error('Vulkan 场景容量超限');
  for (let i = 0; i < scene.draws.length; i += 4) {
    const [first, count, state, mode] = scene.draws.subarray(i, i + 4);
    if (state > 7 || mode > 1 || first + count > vc || count % (state === 3 || state === 5 ? 2 : 3)) throw new Error('Vulkan 绘制范围无效');
  }
  if (!scene.vertices.every(Number.isFinite)) throw new Error('Vulkan 顶点必须是有限 float32');
  const b = Buffer.alloc(8 + scene.vertices.byteLength + scene.draws.byteLength); b.writeUInt32LE(vc); b.writeUInt32LE(dc, 4);
  Buffer.from(scene.vertices.buffer, scene.vertices.byteOffset, scene.vertices.byteLength).copy(b, 8);
  Buffer.from(scene.draws.buffer, scene.draws.byteOffset, scene.draws.byteLength).copy(b, 8 + scene.vertices.byteLength); return b;
}
export function vulkanFrameBytes(id: number, width: number, height: number, matrix: number[], exposure?:number): Buffer {
  if (![width, height].every(n => Number.isInteger(n) && n > 0 && n <= 4096) || matrix.length !== 16 || !matrix.every(n => Number.isFinite(n) && Math.abs(n) <= 3.4028234663852886e38)) throw new Error('Vulkan 摄像机或视口尺寸无效');
  if(exposure!==undefined&&(!Number.isFinite(exposure)||exposure<=0||exposure>3.4028234663852886e38))throw new Error('Vulkan 曝光无效');
  const b = Buffer.alloc(exposure===undefined?76:80); b.writeUInt32LE(id); b.writeUInt32LE(width, 4); b.writeUInt32LE(height, 8); matrix.forEach((n, i) => b.writeFloatLE(n, 12 + i * 4)); if(exposure!==undefined)b.writeFloatLE(exposure,76);return b;
}
export function vulkanUniformBatchBytes(draws: VulkanMaterialResource[][]): Buffer {
  return resourceUpdates(draws,false);
}
/** Update existing descriptors without destroying pipelines, geometry or images.
 * Image dimensions/format stay fixed; the native owner validates its layout. */
export function vulkanResourceBatchBytes(draws:VulkanMaterialResource[][]):Buffer {
  return resourceUpdates(draws,true);
}
function resourceUpdates(draws:VulkanMaterialResource[][],textures:boolean):Buffer {
  if (!draws.length || draws.length > 4096) throw new Error('Vulkan uniform 绘制列表长度无效');
  const word = (n: number) => { const b = Buffer.alloc(4); b.writeUInt32LE(n); return b; };
  const chunks:Buffer[] = [word(draws.length)],images=new WeakMap<Uint8Array,number>();let imageCount=0;
  for (const resources of draws) {
    if (resources.length > 32 || new Set(resources.map(r => r.binding)).size !== resources.length) throw new Error('Vulkan uniform 绑定重复或超限');
    chunks.push(word(resources.length));
    for (const r of resources) {
      if (!Number.isInteger(r.binding) || r.binding < 0 || r.binding > 65535 || !(r.data instanceof Uint8Array) || !r.data.length || (r.kind===0?r.data.length>65536:!textures||![1,2,3].includes(r.kind)||r.data.length>300000000||r.data.length!==vulkanTextureDataBytes(r.dimensions,r.kind,r.format,r.mipLevels))) throw new Error('Vulkan resource 更新无效');
      const reference=textures&&r.kind?images.get(r.data):undefined;
      if(reference!==undefined)chunks.push(word(r.binding),word((0x80000000|reference)>>>0));
      else{chunks.push(word(r.binding),word(r.data.length),Buffer.from(r.data.buffer,r.data.byteOffset,r.data.byteLength));if(textures&&r.kind)images.set(r.data,imageCount++);}
    }
  }
  const bytes=chunks.reduce((n,b)=>n+b.length,0);if(bytes>600000000)throw new Error('Vulkan resource 更新容量超限');
  return Buffer.concat(chunks,bytes);
}
export function vulkanDrawOrderBytes(opaque:number[],alpha:number[]):Buffer {
  const words:number[]=[];
  for(const order of [opaque,alpha]){
    if(order.length>4096||new Set(order).size!==order.length||!order.every(i=>Number.isInteger(i)&&i>=0&&i<order.length))throw new Error('Vulkan 绘制顺序必须为完整排列');
    words.push(order.length,...order);
  }
  const bytes=Buffer.alloc(words.length*4);words.forEach((n,i)=>bytes.writeUInt32LE(n,i*4));return bytes;
}
export function vulkanDrawVisibilityBytes(opaque:boolean[],alpha:boolean[]):Buffer {
  if([opaque,alpha].some(a=>a.length>4096||a.some(v=>typeof v!=='boolean')))throw new Error('Vulkan 显隐列表无效');
  const words=[opaque.length,...opaque.map(Number),alpha.length,...alpha.map(Number)],b=Buffer.alloc(words.length*4);words.forEach((n,i)=>b.writeUInt32LE(n,i*4));return b;
}
export function vulkanRequest(type: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29, payload: Buffer) {
  const b = Buffer.alloc(8); b.writeUInt32LE(type); b.writeUInt32LE(payload.length, 4); return Buffer.concat([b, payload]);
}
