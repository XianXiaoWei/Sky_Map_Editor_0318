import { identityResourceSkeletonRoot, resourceAnimationBoneMatrices, type ResourceSkeletonRoot } from '../src/core/resource-animation-matrices';
import { resourceAnimationSample, sampleResourceAnimation } from '../src/core/resource-animation-sample';
import { animationSamplingCases, animationSampleRequest, type AnimationSampleCase } from './resource-animation-sample-cases';
import type { ResourceAnimationPack } from '../src/core/resource-animation';
export interface AnimationMatrixCase { sample: AnimationSampleCase; root: ResourceSkeletonRoot; }
export function animationMatrixCases(data: string) {
  const roots: ResourceSkeletonRoot[] = [identityResourceSkeletonRoot(),
    { pose: Float32Array.of(2, 0.5, -1, 0, 0.1, 0.2, -0.3, 0.9, 12, -4, 6, 0), axisScale: [1, 1, 1] },
    { pose: Float32Array.of(0.75, 2, 1.25, 0, 0, 0, 0, 1, -3, 5, 2, 0), axisScale: [2, 0.5, -1] }];
  return animationSamplingCases(data).map(c => ({ source: c.source, pack: c.pack, requests: [c.samples[0], c.samples[3], c.samples[9]].flatMap(sample => roots.map(root => ({ sample, root }))) }));
}
export function animationMatrixRequest(c: AnimationMatrixCase): Buffer {
  return Buffer.concat([animationSampleRequest(c.sample), Buffer.from(c.root.pose.buffer), Buffer.from(Float32Array.from(c.root.axisScale).buffer)]);
}
export function animationMatrixExpected(pack: ResourceAnimationPack, c: AnimationMatrixCase): Buffer {
  const pose = sampleResourceAnimation(pack, resourceAnimationSample(pack, c.sample.frames, c.sample.fraction, c.sample.clipIndex, c.sample.fix), c.sample.mask);
  return Buffer.from(resourceAnimationBoneMatrices(pack, pose, c.root).buffer);
}
