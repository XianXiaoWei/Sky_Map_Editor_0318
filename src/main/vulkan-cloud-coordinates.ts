import { cloudRenderGraph } from '../core/cloud-render-graph';
import type { VulkanMaterialInput } from './vulkan-material';
import { bottomUpVulkanTarget } from './vulkan-target';

type Texture = VulkanMaterialInput['textures'][string];
type CloudStage = 'CloudFluffySuperCoarse' | 'CloudFluffyCoarse' | 'CloudFluffy' | 'CloudCard';

// AIR fragment coordinates are native top-row Vulkan coordinates. CloudFluffy
// Coarse instead samples depth via the lower-left UV carried by its vertex.
// Keep depth storage separate from coarse T and GLES Fog fullscreen UV storage.
export function viewportCloudStage(width: number, height: number, shader: CloudStage,
  uniforms: Record<string, unknown>, depth: { nativeDepthHalf: Texture; nativeDepthQuarter: Texture }) {
  const graph = cloudRenderGraph(width, height);
  const target = shader === 'CloudFluffySuperCoarse' ? graph.targets.coarseLo
    : shader === 'CloudFluffyCoarse' ? graph.targets.coarseHi : graph.targets.cloudA;
  return {
    uniforms: { ...uniforms, u_viewportSize: target.dimensions.slice(0, 2) },
    textures: {
      u_depthHalfTex: depth.nativeDepthHalf,
      u_depthQuarterTex: shader === 'CloudFluffyCoarse' ? bottomUpVulkanTarget(depth.nativeDepthQuarter) : depth.nativeDepthQuarter,
    },
  };
}
