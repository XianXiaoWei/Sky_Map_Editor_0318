import type { ResourceAnimationPack } from './resource-animation';
import { resourceAnimationSample, sampleResourceAnimation } from './resource-animation-sample';
const f = Math.fround, add = (a: number, b: number) => f(a + b), mul = (a: number, b: number) => f(a * b);
/** Original exact clip lookup 0x1000e49e0 returns -1 for a subrange of a
 * single embedded clip; the sampler deliberately supports that -1. */
export function resourceAnimationClipForRange(pack: ResourceAnimationPack, start: number, end: number) {
  return pack.tracks?.clips.findIndex(c => c.startFrame === start && c.endFrame === end) ?? -1;
}
/** Original request range check 0x1000e69e0 permits any valid subrange when
 * exactly one clip exists, and only exact ranges when multiple clips exist. */
export function resourceAnimationHasRange(pack: ResourceAnimationPack, start: number, end: number) {
  const clips = pack.tracks?.clips; return !!clips?.length && start >= 0 && start <= end && end < pack.frameCount && (clips.length === 1 || resourceAnimationClipForRange(pack, start, end) >= 0);
}
/** Entire loop quaternion sign consumer 0x1000e6580. Samples both endpoints
 * in their containing original clips, then compares the original pairwise
 * quaternion dot product. Spare bits in the caller mask remain untouched. */
export function resourceAnimationLoopSigns(pack: ResourceAnimationPack, start: number, length: number, initial?: Uint8Array) {
  const maskSize = Math.ceil(pack.bones.length / 8), end = start + length - 1;
  if (!Number.isInteger(start) || !Number.isInteger(length) || length < 1 || !pack.tracks || !pack.bones.length || pack.bones.length > 256 || start < 0 || end >= pack.frameCount || initial && initial.length !== maskSize) throw new Error('原动画循环端点输入无效');
  const first = pack.tracks.clips.findIndex(c => c.startFrame <= start && start <= c.endFrame), last = pack.tracks.clips.findIndex(c => start + length > c.startFrame && end <= c.endFrame);
  if (first < 0 || last < 0) throw new Error('原动画循环端点缺少片段');
  const pose = (frame: number, index: number) => sampleResourceAnimation(pack, resourceAnimationSample(pack, [frame, frame, frame, frame], 0, index));
  const a = pose(start, first), b = pose(end, last), mask = initial ? Uint8Array.from(initial) : new Uint8Array(maskSize); let negative = 0;
  for (let bone = 0; bone < pack.bones.length; bone++) {
    const at = bone * 12 + 4, dot = add(add(mul(a[at], b[at]), mul(a[at + 2], b[at + 2])), add(mul(a[at + 1], b[at + 1]), mul(a[at + 3], b[at + 3]))), bit = 1 << (bone & 7);
    if (dot < 0) { mask[bone >>> 3] |= bit; negative++; } else mask[bone >>> 3] &= ~bit;
  }
  return { mask, negative };
}
