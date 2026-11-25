import { PROBE_SIZE, PROBE_MIP_LEVELS, PROBE_PIXELS, probeUniforms } from '../core/probe';
import type { VulkanAddressMode } from '../core/vulkan-protocol';

// Original 0x100059c99 descriptor -> 0x1007f04d0 -> 0x100a6aa30 Metal setters.
// min/mag/mip linear, S/T clamp-to-edge, R repeat, LOD -1000..1000, aniso 1.
// Vulkan's available-mip clamp has the same effective LOD range for this cube.
export const ORIGINAL_PROBE_SAMPLER={linear:true,repeat:false,addressModes:['clamp','clamp','repeat'] as [VulkanAddressMode,VulkanAddressMode,VulkanAddressMode]};

export interface VulkanProbeFrame {
  sh: Float32Array; half: Uint16Array; center: number[];
  sampler?: { linear: boolean; repeat: boolean; addressModes?: [VulkanAddressMode,VulkanAddressMode,VulkanAddressMode] };
}
// Bind the actual reduced RGBA16F mip-major cube, retaining the game's half
// bits. Do not re-quantize via a float texture or fabricate a fallback probe.
export function vulkanProbeBindings(frame: VulkanProbeFrame) {
  const sampler=frame.sampler??ORIGINAL_PROBE_SAMPLER;
  if(!(frame.sh instanceof Float32Array) || frame.sh.length!==27 || !(frame.half instanceof Uint16Array)
    || frame.half.length!==PROBE_PIXELS*4 || frame.center.length!==3 || !frame.center.every(Number.isFinite)
    || typeof sampler.linear!=='boolean' || typeof sampler.repeat!=='boolean') throw new Error('原 Vulkan 探针帧无效');
  const data=new Uint8Array(frame.half.length*2), view=new DataView(data.buffer);
  frame.half.forEach((value,i)=>view.setUint16(i*2,value,true));
  return { uniforms:{...probeUniforms(frame.sh),u_probeCenter:frame.center.map(Math.fround)},
    textures:{u_probeCube:{format:'rgba16f' as const,dimensions:[PROBE_SIZE,PROBE_SIZE,6] as [number,number,number],
      mipLevels:PROBE_MIP_LEVELS,linear:sampler.linear,repeat:sampler.repeat,addressModes:sampler.addressModes,data}} };
}
