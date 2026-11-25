import type { VulkanColorFormat } from './vulkan-protocol';

export interface CloudTarget {
  name: string; dimensions: [number, number, number]; format: VulkanColorFormat;
  linear: boolean; repeat: boolean;
}
// Sky 0.3.18 Compositor descriptors and native allocation loop. Evidence:
// docs/cloud-render-graph.json; 0x10023de50, 0x100243a30, 0x100b066c0.
// CloudCore is submitted to Opaque before these passes. Its cloudTex0 input
// reads the existing CloudA contents, before this frame overwrites CloudA.
export function cloudRenderGraph(width: number, height: number) {
  if (![width, height].every(n => Number.isInteger(n) && n > 0 && n <= 16384)) throw new Error('云渲染视口尺寸无效');
  const target = (name: string, divisor: number, format: VulkanColorFormat, linear = false): CloudTarget => ({
    name, dimensions: [Math.max(1, Math.floor(width / divisor)), Math.max(1, Math.floor(height / divisor)), 1],
    format, linear, repeat: false,
  });
  const targets = {
    fullRGBDepth: target('rtFullRGBDepth', 1, 'rgba16f'),
    depthHalfMin: target('rtDepthHalfMin', 2, 'rg16f'),
    depthHalf: target('rtDepthHalf', 2, 'rgba16f'),
    depthQuarter: target('rtDepthQuarter', 4, 'rg16f'),
    coarseLo: target('rtCloudCoarseLo', 8, 'r16f'),
    coarseHi: target('rtCloudCoarseHi', 4, 'r16f'),
    cloudA: target('rtCloudA', 2, 'rgba16f', true),
    cloudB: target('rtCloudB', 2, 'rgba16f', true),
  };
  return { targets, opaqueCloud: { shader: 'CloudCore', historyInput: 'u_cloudTex0', target: targets.cloudA }, depthPasses: [
    { shader: 'DepthDownsample', output: targets.depthHalfMin, inputs: { u_depthFullTex: targets.fullRGBDepth }, globals: {} },
    { shader: 'DepthDownsampleGather', output: targets.depthHalf, inputs: { u_depthMinTex: targets.depthHalfMin }, globals: {} },
    // The quarter texture comes from the global shader parameters, not a
    // per-quad binding in the original Compositor descriptor.
    { shader: 'DepthDownsampleQuarter', output: targets.depthQuarter, inputs: {}, globals: { u_depthHalfTex: targets.depthHalf } },
  ], passes: [
    { shader: 'CloudFluffySuperCoarse', outputs: [targets.coarseLo], inputs: {}, followingLists: [] },
    { shader: 'CloudFluffyCoarse', outputs: [targets.coarseHi], inputs: { u_cloudCoarseTTex: targets.coarseLo }, followingLists: [] },
    { shader: 'CloudFluffy', outputs: [targets.cloudA, targets.cloudB], inputs: { u_cloudTTex: targets.coarseHi }, followingLists: ['Cloud'] },
  ] };
}
