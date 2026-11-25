import type { ModelBakeMemory } from './model-baked-runtime';
import type { ResourceAnimationPack } from './resource-animation';
import { sampleResourceAnimation, type ResourceAnimationSample } from './resource-animation-sample';
import { mirrorOriginalAnimationRotationValue } from './resource-animation-mirror';
import { numericFloatValue as value } from './object-numeric-runtime';
const f = Math.fround, add = (a: number, b: number) => f(a + b), mul = (a: number, b: number) => f(a * b);

/** Mirrored Pack.Sample/Clip.Sample numeric adapter (0x1000e6900/0x1000e5020).
 * Starts from the owner's generated mirrored reference, remaps rotation and
 * position channels through REVERSE indices, and leaves scale channel indices
 * unchanged, matching the original. Dynamic rotation is normalized before
 * basis correction. Padding lanes are normalized to zero as in the existing
 * nonmirrored numeric sampler; retained byte-owner padding is not modified. */
export function sampleMirroredResourceAnimation(m: ModelBakeMemory, address: bigint, pack: ResourceAnimationPack, state: ResourceAnimationSample, signMask?: Uint8Array) {
  const count = pack.bones.length, map = m.read64(address + 0xe0n), reference = m.read64(address + 0x90n);
  if (!map || !reference || (m.read32(address + 0x54n) | 0) !== count) throw new Error('原镜像采样缺少已生成的 owner 映射／参考姿态');
  const tracks = pack.tracks, clip = tracks?.clips[state.clipIndex];
  if (!tracks || !clip) throw new Error('原镜像采样缺少动画轨道');
  const sampled = sampleResourceAnimation(pack, state, signMask);
  const out = Float32Array.from({ length: count * 12 }, (_, i) => value(m.read32(reference + BigInt(i * 4))));
  const target = (source: number) => {
    const index = m.read32(map + BigInt(source * 0x90 + 0x84)) | 0;
    if (index < 0 || index >= count) throw new Error('原镜像逆向骨骼索引超出已分配骨架'); return index;
  };
  const scale = (index: number, channels: number) => {
    for (let i = 0; i < channels; i++) { const bone = tracks.flags[index + i]; out.set(sampled.subarray(bone * 12, bone * 12 + 3), bone * 12); }
  };
  const rotations = (index: number, channels: number) => {
    for (let i = 0; i < channels; i++) {
      const source = tracks.flags[index + i], bone = target(source);
      out.set(mirrorOriginalAnimationRotationValue(m, address, bone, sampled.subarray(source * 12 + 4, source * 12 + 8)), bone * 12 + 4);
    }
  };
  const positions = (index: number, channels: number) => {
    for (let i = 0; i < channels; i++) {
      const source = tracks.flags[index + i], bone = target(source), p = map + BigInt(bone * 0x90);
      for (let lane = 0; lane < 3; lane++) {
        const n = (col: number) => value(m.read32(p + BigInt(col * 16 + lane * 4)));
        out[bone * 12 + 8 + lane] = add(add(add(mul(sampled[source * 12 + 8], n(0)), mul(sampled[source * 12 + 9], n(1))), mul(sampled[source * 12 + 10], n(2))), n(3));
      }
    }
  };
  scale(clip.staticScaleIndex, clip.staticScaleCount);
  rotations(clip.staticRotationIndex, clip.staticRotationCount);
  positions(clip.staticPositionIndex, clip.staticPositionCount);
  scale(clip.scaleIndex, clip.scaleCount);
  rotations(clip.rotationIndex, clip.rotationCount);
  positions(clip.positionIndex, clip.positionCount);
  for (let i = 0; i < count; i++) { out[i * 12 + 3] = 0; out[i * 12 + 11] = 0; }
  return out;
}
