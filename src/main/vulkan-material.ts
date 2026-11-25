import fs from 'node:fs/promises';
import { packSpirvUniforms } from '../core/spirv';
import { VULKAN_ATTRIBUTE_FORMATS, VULKAN_TEXTURE_FORMATS, type VulkanColorFormat, type VulkanTextureFormat, type VulkanMaterialScene, type VulkanMaterialResource, type VulkanAddressMode } from '../core/vulkan-protocol';
import type { VulkanShaderCompilation } from './vulkan-shaders';
import { vulkanProbeBindings, type VulkanProbeFrame } from './vulkan-probe';

export interface VulkanMaterialInput {
  shader: string; stride: number; vertices: Uint8Array; indices: Uint32Array; state: number;
  attributes: Record<string, { format: keyof typeof VULKAN_ATTRIBUTE_FORMATS; offset: number }>;
  uniforms: Record<string, unknown>;
  probe?: VulkanProbeFrame;
  colorFormats?: VulkanColorFormat[];
  immutableGeometry?:boolean;
  topology?:'triangles'|'points';
  textures: Record<string, { format: VulkanTextureFormat; dimensions: [number, number, number]; linear: boolean; repeat: boolean; addressModes?: [VulkanAddressMode,VulkanAddressMode,VulkanAddressMode]; mipLevels?: number; anisotropy?: number; data: Uint8Array; immutable?:boolean }>;
}
const shaderBytes=new WeakMap<VulkanShaderCompilation,Promise<[Buffer,Buffer]>>();
export async function bindVulkanMaterial(compiled: VulkanShaderCompilation, input: VulkanMaterialInput): Promise<VulkanMaterialScene> {
  if (!compiled.success) throw new Error(compiled.log);
  if(input.probe) {
    const bindings=vulkanProbeBindings(input.probe);
    input={...input,uniforms:{...input.uniforms,...bindings.uniforms},textures:{...input.textures,...bindings.textures}};
  }
  const vs = compiled.artifacts.find(a => a.stage === 'vert'), fsArtifact = compiled.artifacts.find(a => a.stage === 'frag');
  if (!vs || !fsArtifact) throw new Error('Vulkan 材质需要完整的两阶段程序');
  const attributes = vs.reflection.inputs.map(a => {
    const field = input.attributes[a.name]; if (!field || !(field.format in VULKAN_ATTRIBUTE_FORMATS)) throw new Error(`缺少 Vulkan 顶点输入 ${a.name}`);
    const components = a.type.kind === 'vector' ? a.type.count : 1, actual = { float: 1, vec2: 2, vec3: 3, vec4: 4, half2: 2, half4:4, snorm4: 4, unorm4: 4 }[field.format];
    // Original CloudCard stores only half UV.xy. Vulkan supplies missing z/w
    // as 0/1 when the original AIR input is float4, without rewriting payloads.
    const nativeComponentConversion=field.format==='half2'&&components===4 || field.format==='snorm4'&&components===3 || field.format==='half4'&&components===2;
    if (components !== actual && !nativeComponentConversion || (a.type.kind === 'vector' ? a.type.element!.kind : a.type.kind) !== 'float') throw new Error(`Vulkan 顶点输入类型不匹配 ${a.name}`);
    return { location: a.location, format: VULKAN_ATTRIBUTE_FORMATS[field.format], offset: field.offset };
  });
  const resources: VulkanMaterialResource[] = compiled.descriptors.map(d => {
    if (d.set !== 0 || d.count !== 1) throw new Error(`Vulkan 资源 set/数组暂未支持 ${d.name}`);
    if (d.kind === 'uniform-buffer') return { binding: d.binding, kind: 0, format: 0, dimensions: [1, 1, 1], linear: false, repeat: false, data: packSpirvUniforms(d.type, input.uniforms) };
    const texture = input.textures[d.name];
    if (d.kind !== 'combined-image-sampler' || !texture || !['2D', '3D', 'Cube'].includes(d.type.dimension!) || d.type.arrayed || d.type.multisampled) throw new Error(`缺少或不支持 Vulkan 纹理 ${d.name}`);
    const integer = texture.format.endsWith('ui');
    if (d.type.element?.kind !== (integer ? 'uint' : 'float') || integer && texture.linear) throw new Error(`Vulkan 纹理数值类型或过滤方式不匹配 ${d.name}`);
    return { binding: d.binding, kind: d.type.dimension === 'Cube' ? 3 : d.type.dimension === '3D' ? 2 : 1,
      format: VULKAN_TEXTURE_FORMATS[texture.format], dimensions: texture.dimensions, linear: texture.linear, repeat: texture.repeat, addressModes: texture.addressModes, mipLevels: texture.mipLevels, anisotropy: texture.anisotropy, data: texture.data,immutable:texture.immutable };
  });
  const colorCount = Math.max(...fsArtifact.reflection.outputs.map(o => o.location)) + 1;
  let bytes=shaderBytes.get(compiled);if(!bytes){bytes=Promise.all([fs.readFile(vs.path),fs.readFile(fsArtifact.path)]);shaderBytes.set(compiled,bytes);}
  const [vertexSpirv, fragmentSpirv] = await bytes;
  return { vertexSpirv, fragmentSpirv, stride: input.stride, attributes, resources, colorCount, colorFormats: input.colorFormats, state: input.state, vertices: input.vertices, indices: input.indices,immutableGeometry:input.immutableGeometry,topology:input.topology };
}
