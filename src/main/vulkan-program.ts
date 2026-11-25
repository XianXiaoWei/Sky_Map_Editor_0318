import { createHash } from 'node:crypto';
import cloudAir from '../../evidence/cloud-air-vulkan/runtime.json';
import type { ShaderProgram } from '../core/materials';
import type { VulkanShaderSource } from './vulkan-shaders';
import type { VulkanColorFormat } from '../core/vulkan-protocol';
import {hardwareCloudSampling} from './vulkan-cloud-sampling';
import {finiteCreatureOcclusionVertex} from './vulkan-model-occlusion';

const digest = (text: string) => createHash('sha256').update(text).digest('hex');
const programs = new Map(Object.entries(cloudAir));
export function vulkanProgramColorFormats(name: string): VulkanColorFormat[] | undefined {
  if (!programs.has(name)) return undefined;
  if (name.startsWith('DepthDownsample')) return name === 'DepthDownsampleGather' ? ['rgba16f'] : ['rg16f'];
  return ['CloudFluffy', 'CloudCard', 'CloudQuadParticleFluffy'].includes(name) ? ['rgba16f', 'rgba16f'] : name === 'CloudCore' ? ['rgba16f'] : ['r16f'];
}
// Embedded sources keep the recovered Metal stages available in the packaged
// runtime. Pair hashes prevent applying Sky 0.3.18 AIR to changed GLES assets.
export function vulkanProgramSources(program: ShaderProgram,nativeCloudFiltering=false): VulkanShaderSource[] {
  const recovered = programs.get(program.definition.name);
  return (['vert', 'frag'] as const).map(stage => {
    const text = stage === 'vert' ? program.vertexSource : program.fragmentSource;
    if (!recovered) return { stage, text:stage==='vert'?finiteCreatureOcclusionVertex(text):text, coordinates: 'opengl' };
    const original = recovered[stage];
    if ((stage === 'vert' ? program.definition.vertex : program.definition.fragment) !== original.file || digest(text) !== original.glesSha256) throw new Error(`原 AIR 与 ${program.definition.name} 的资源版本不符`);
    if (digest(original.text) !== original.generatedSha256) throw new Error(`原 AIR 重构源码校验失败：${original.file}`);
    return { stage, text: nativeCloudFiltering?hardwareCloudSampling(original.text):original.text, format: 'vulkan450' };
  });
}
