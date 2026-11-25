import { cloudRenderGraph } from '../core/cloud-render-graph';
import { bindVulkanMaterial, type VulkanMaterialInput } from './vulkan-material';
import { sampledVulkanTarget,bottomUpVulkanTarget } from './vulkan-target';
import type { VulkanShaderCompilation } from './vulkan-shaders';
import type { VulkanHost } from './vulkan';

export type DepthShader = 'DepthDownsample' | 'DepthDownsampleGather' | 'DepthDownsampleQuarter';
type Texture = VulkanMaterialInput['textures'][string];

// Execute the recovered depth chain on the native host. The caller supplies
// the opaque RGB/signed-depth attachment and the actual global uniforms;
// this entry does not invent a scene depth or camera jitter source.
export async function renderVulkanCloudDepth(host: VulkanHost, shaders: Record<DepthShader, VulkanShaderCompilation>,
  width: number, height: number, fullDepth: Texture, uniforms: { u_texSizeHalf: [number, number]; u_jitterHalf: [number, number] }, bottomUp=false) {
  const graph = cloudRenderGraph(width, height), full = graph.targets.fullRGBDepth;
  if (fullDepth.format !== full.format || fullDepth.dimensions.length !== 3 || fullDepth.dimensions.some((n, i) => n !== full.dimensions[i]) || fullDepth.linear || fullDepth.repeat || fullDepth.data.length !== width * height * 8) throw new Error('原全尺寸 RGB/深度附件的尺寸、格式或采样器不符');
  if (uniforms.u_texSizeHalf.length !== 2 || !uniforms.u_texSizeHalf.every(n => Number.isFinite(n) && n > 0) || uniforms.u_jitterHalf.length !== 2 || !uniforms.u_jitterHalf.every(Number.isFinite)) throw new Error('原深度处理 uniform 无效');
  const textures = new Map<string, Texture>([[full.name, bottomUp?bottomUpVulkanTarget(fullDepth):fullDepth]]), nativeTargets = new Map<string, Texture>(), passes = [];
  for (const pass of graph.depthPasses) {
    const shader = pass.shader as DepthShader, compiled = shaders[shader];
    if (!compiled) throw new Error(`缺少原深度程序 ${shader}`);
    const bindings = { ...pass.inputs, ...pass.globals };
    const input: VulkanMaterialInput = { shader, stride: 1, vertices: new Uint8Array(4),
      indices: new Uint32Array([0, 1, 2, 0, 2, 3]), attributes: {}, state: 4,
      uniforms, colorFormats: [pass.output.format], textures: Object.fromEntries(Object.entries(bindings).map(([name, target]) => [name, textures.get(target!.name)!])) };
    await host.setCachedMaterialScene(await bindVulkanMaterial(compiled, input));
    const frame = await host.materialFrame(pass.output.dimensions[0], pass.output.dimensions[1]);
    const sampled=sampledVulkanTarget(pass.output, frame.attachments[0]);
    nativeTargets.set(pass.output.name, sampled);
    textures.set(pass.output.name, bottomUp?bottomUpVulkanTarget(sampled):sampled);
    passes.push({ shader, input, frame, target: pass.output });
  }
  return { passes, depthHalf: textures.get(graph.targets.depthHalf.name)!, depthQuarter: textures.get(graph.targets.depthQuarter.name)!,
    nativeDepthHalfMin: nativeTargets.get(graph.targets.depthHalfMin.name)!,
    nativeDepthHalf: nativeTargets.get(graph.targets.depthHalf.name)!, nativeDepthQuarter: nativeTargets.get(graph.targets.depthQuarter.name)! };
}
