import { cloudRenderGraph } from '../core/cloud-render-graph';
import { CLOUD_LIST_MATERIAL_STATE } from '../core/cloud-render-state';
import { bindVulkanMaterial, type VulkanMaterialInput } from './vulkan-material';
import { sampledVulkanTarget } from './vulkan-target';
import type { VulkanShaderCompilation } from './vulkan-shaders';
import type { VulkanHost } from './vulkan';

export interface CloudPassDraw { compiled: VulkanShaderCompilation; input: VulkanMaterialInput; }

// Caller supplies original uniforms/textures and an already ordered Cloud list.
// No CloudCore proxy is inserted here: it belongs to the earlier Opaque pass.
export async function renderVulkanCloudPass(host: VulkanHost, width: number, height: number,
  fine: CloudPassDraw, cloudList: CloudPassDraw[]) {
  const graph = cloudRenderGraph(width, height), outputs = [graph.targets.cloudA, graph.targets.cloudB];
  if (fine.input.shader !== 'CloudFluffy') throw new Error('原 Cloud pass 必须先绘制 CloudFluffy');
  const formats = outputs.map(t => t.format);
  const inputs = [{ ...fine.input, state: 4, colorFormats: formats }, ...cloudList.map(draw => ({
    ...draw.input, state: CLOUD_LIST_MATERIAL_STATE, colorFormats: formats,
  }))];
  if (cloudList.some(d => !['CloudCard', 'CloudQuadParticleFluffy'].includes(d.input.shader))) throw new Error('原 Cloud 列表 shader 未接入');
  const scenes = [];
  for (const [i, draw] of [fine, ...cloudList].entries()) {
    const scene = await bindVulkanMaterial(draw.compiled, inputs[i]);
    if (scene.colorCount !== 2) throw new Error('原 Cloud pass 需要两个输出附件');
    scenes.push(scene);
  }
  await host.setMaterialBatch(scenes);
  const frame = await host.materialFrame(outputs[0].dimensions[0], outputs[0].dimensions[1]);
  return { frame, cloudA: sampledVulkanTarget(outputs[0], frame.attachments[0]), cloudB: sampledVulkanTarget(outputs[1], frame.attachments[1], { infinityChannels: [1,2] }) };
}
