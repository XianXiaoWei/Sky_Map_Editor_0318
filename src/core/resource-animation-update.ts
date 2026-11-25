import type { ModelBakeMemory } from './model-baked-runtime';
import { updateOriginalResourceAnimationPrimary } from './resource-animation-primary';
import { updateOriginalResourceAnimationSecondary, originalResourceAnimationSecondaryBoneWeights, type ResourceAnimationSecondaryServices } from './resource-animation-secondary';
import { updateOriginalResourceAnimationAdditive, type ResourceAnimationAdditiveServices } from './resource-animation-additive';
import { flushOriginalResourceAnimation, type ResourceAnimationFlushServices } from './resource-animation-lifecycle';
import type { ResourceAnimationMaskWeights } from './resource-animation-skeleton';
import { getOriginalTransformWorldMatrix } from './transform-node-runtime';
import { transformNativeObb } from './marker-transform-runtime';

export interface ResourceAnimationUpdateServices extends ResourceAnimationSecondaryServices, ResourceAnimationAdditiveServices, ResourceAnimationFlushServices {}

/** Whole Animation.Update 0x100098b90..0x100098be0. Every phase observes the
 * same live controller, request pools and Transform storage. Native Update
 * always passes clockOnly=0 and preserves its input float between calls. */
export function updateOriginalResourceAnimation(m: ModelBakeMemory, controller: bigint, delta: number, s: ResourceAnimationUpdateServices): void {
  delta = Math.fround(delta);
  updateOriginalResourceAnimationPrimary(m, controller, delta, 0, s);
  updateOriginalResourceAnimationSecondary(m, controller, delta, 0, s);
  updateOriginalResourceAnimationAdditive(m, controller, delta, 0, s);
  flushOriginalResourceAnimation(m, controller, delta, 0, s);
}

export interface ResourceAnimationUpdateOwnerServices extends Omit<ResourceAnimationUpdateServices, 'worldMatrix' | 'multiplyMatrices' | 'boneWeights'> {
  weights: ResourceAnimationMaskWeights;
  dynamicBodyEnabled(): boolean;
}

/** Bind restored Transform cache/matrix and mask consumers to a real owner.
 * Resource sampling, instruction arithmetic, effects and scene services
 * remain explicit: this does not fabricate Model or creature ownership. */
export function originalResourceAnimationUpdateServices(m: ModelBakeMemory, s: ResourceAnimationUpdateOwnerServices): ResourceAnimationUpdateServices {
  return {
    ...s,
    worldMatrix: node => getOriginalTransformWorldMatrix(m, node),
    multiplyMatrices: (left, right) => { const out = new Uint8Array(64); transformNativeObb(left, right, out); return out; },
    boneWeights: (controller, request, bones) => originalResourceAnimationSecondaryBoneWeights(m, controller, request, bones, s.weights, s.dynamicBodyEnabled()),
  };
}
