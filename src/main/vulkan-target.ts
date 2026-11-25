import type { CloudTarget } from '../core/cloud-render-graph';
import type { VulkanMaterialInput } from './vulkan-material';

// The native host exposes RGBA float32 readback. Reconstruct the actual target
// storage for a later sampled pass, without introducing another approximation.
export function sampledVulkanTarget(target: CloudTarget, rgba: Float32Array, options: { infinityChannels?: number[] } = {}): VulkanMaterialInput['textures'][string] {
  const pixels = target.dimensions[0] * target.dimensions[1];
  if (rgba.length !== pixels * 4) throw new Error(`Vulkan 附件 ${target.name} 的读回尺寸不符`);
  const channels = target.format.startsWith('rgba') ? 4 : target.format.startsWith('rg') ? 2 : 1;
  const half = target.format.endsWith('16f');
  const data = new Uint8Array(pixels * channels * (half ? 2 : 4)), view = new DataView(data.buffer);
  const float = new Float32Array(1), bits = new Uint32Array(float.buffer);
  for (let pixel = 0; pixel < pixels; pixel++) for (let lane = 0; lane < channels; lane++) {
    const value = rgba[pixel * 4 + lane], index = pixel * channels + lane;
    if (!half) { view.setFloat32(index * 4, value, true); continue; }
    float[0] = value;
    const sign = bits[0] >>> 16 & 0x8000, magnitude = Math.abs(value);
    let encoding: number;
    // Original CloudB motion can overflow half when a point projects near the
    // preceding camera plane. Preserve its IEEE infinity for MotionGen's clamp;
    // FogUpsample uses only the finite logarithmic depth and weight channels.
    if(!Number.isFinite(value)&&!Number.isNaN(value)&&options.infinityChannels?.includes(lane)){
      view.setUint16(index*2,sign|0x7c00,true);continue;
    }
    if (!Number.isFinite(value) || magnitude > 65504) throw new Error(`Vulkan half 附件 ${target.name} 的读回值超出有限范围（通道 ${lane}：${value}）`);
    if (magnitude < 2 ** -14) {
      const mantissa = magnitude * 2 ** 24;
      if (!Number.isInteger(mantissa)) throw new Error(`Vulkan half 附件 ${target.name} 未按存储格式量化`);
      encoding = sign | mantissa;
    } else {
      const exponent = ((bits[0] >>> 23) & 255) - 112;
      if (bits[0] & 8191) throw new Error(`Vulkan half 附件 ${target.name} 未按存储格式量化`);
      encoding = sign | exponent << 10 | (bits[0] & 0x7fffff) >>> 13;
    }
    view.setUint16(index * 2, encoding, true);
  }
  return { format: target.format, dimensions: target.dimensions, linear: target.linear, repeat: target.repeat, data };
}

// Vulkan readback rows start at the top. Original fullscreen programs use
// lower-left UVs; reverse only their sampled target rows at this boundary.
// CloudCore reads gl_FragCoord and keeps the top-row history unchanged.
export function bottomUpVulkanTarget(texture: VulkanMaterialInput['textures'][string]) {
  const [width,height,depth]=texture.dimensions;
  if(depth!==1||texture.mipLevels&&texture.mipLevels!==1)throw new Error('屏幕附件必须是二维单 mip');
  const rowBytes=texture.data.length/height,data=new Uint8Array(texture.data.length);
  for(let y=0;y<height;y++)data.set(texture.data.subarray(y*rowBytes,(y+1)*rowBytes),(height-1-y)*rowBytes);
  return {...texture,data};
}
