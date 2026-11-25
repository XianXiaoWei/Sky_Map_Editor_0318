import { Reader } from '../src/core/binary';
import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { resourceAnimationSample, sampleResourceAnimation } from '../src/core/resource-animation-sample';
import { animationResourceCases } from './resource-animation-cases';
export interface AnimationSampleCase { frames: [number, number, number, number]; fraction: number; clipIndex: number; fix: boolean; mask: Uint8Array; }
export function animationSamplingCases(data: string) {
  return animationResourceCases(data).flatMap(source => {
    const pack = readResourceAnimationPack(new Reader(source.bytes)); if (!pack.tracks) return [];
    const samples: AnimationSampleCase[] = [];
    for (let index = 0; index < pack.tracks.clips.length; index++) {
      const c = pack.tracks.clips[index], start = c.startFrame, end = c.endFrame, length = end - start + 1;
      const frame = (i: number) => start + i % length;
      for (const fraction of [-0.25, 0, 0.125, 0.5, 0.875, 1, 1.25]) samples.push({ frames: [frame(0), frame(1), frame(2), frame(3)], fraction, clipIndex: index, fix: false, mask: new Uint8Array(Math.ceil(pack.bones.length / 8)) });
      for (const mask of [0, 255]) for (const fraction of [0, 0.25, 0.5, 0.75, 1]) samples.push({ frames: [Math.max(start, end - 1), end, start, Math.min(end, start + 1)], fraction, clipIndex: index, fix: true, mask: new Uint8Array(Math.ceil(pack.bones.length / 8)).fill(mask) });
      samples.push({ frames: [start, start, start, start], fraction: 0, clipIndex: index, fix: false, mask: new Uint8Array(Math.ceil(pack.bones.length / 8)) });
      samples.push({ frames: [end, end, end, end], fraction: 0, clipIndex: index, fix: false, mask: new Uint8Array(Math.ceil(pack.bones.length / 8)) });
    }
    return [{ source, pack, samples }];
  });
}
export function animationSampleRequest(c: AnimationSampleCase): Buffer {
  const b = Buffer.alloc(28); c.frames.forEach((frame, i) => b.writeInt32LE(frame, i * 4)); b.writeFloatLE(c.fraction, 16); b.writeInt32LE(c.clipIndex, 20); b.writeUInt32LE(+c.fix, 24);
  return Buffer.concat([b, c.mask]);
}
export function animationSampleExpected(pack: ResourceAnimationPack, c: AnimationSampleCase): Buffer {
  const state = resourceAnimationSample(pack, c.frames, c.fraction, c.clipIndex, c.fix), pose = sampleResourceAnimation(pack, state, c.mask), b = Buffer.alloc(48);
  b.writeUInt32LE(state.clipIndex); Buffer.from(state.weights.buffer).copy(b, 4); Buffer.from(state.scaleWeights.buffer).copy(b, 20);
  state.frames.forEach((frame, i) => b.writeInt32LE(frame, 28 + i * 4)); b[44] = +state.fixQuaternionSigns;
  return Buffer.concat([b, Buffer.from(pose.buffer)]);
}
