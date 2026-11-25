import { animationSamplingCases } from './resource-animation-sample-cases';
import { u32 } from '../src/core/binary';
import { resourceAnimationLoopSigns } from '../src/core/resource-animation-loop';
import type { ResourceAnimationPack } from '../src/core/resource-animation';
export interface AnimationLoopCase { start: number; length: number; initial: Uint8Array; }
export function animationLoopCases(data: string) {
  return animationSamplingCases(data).map(c => ({ source: c.source, pack: c.pack, requests: c.pack.tracks!.clips.flatMap(clip => {
    const size = Math.ceil(c.pack.bones.length / 8), length = clip.endFrame - clip.startFrame + 1;
    const ranges = [[clip.startFrame, 1], [clip.endFrame, 1], [clip.startFrame, length], [clip.startFrame, Math.max(1, length - 1)]];
    return ranges.flatMap(([start, count]) => [0, 255, 0xaa].map(initial => ({ start, length: count, initial: new Uint8Array(size).fill(initial) })));
  }) }));
}
export function animationLoopRequest(c: AnimationLoopCase) { return Buffer.concat([u32(c.start), u32(c.length), Buffer.from(c.initial)]); }
export function animationLoopExpected(pack: ResourceAnimationPack, c: AnimationLoopCase) { const result = resourceAnimationLoopSigns(pack, c.start, c.length, c.initial); return Buffer.concat([u32(result.negative), Buffer.from(result.mask)]); }
