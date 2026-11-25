import type { ModelBakeMemory } from './model-baked-runtime';
import type { ResourceAnimationPack } from './resource-animation';
import { resourceAnimationSample, sampleResourceAnimation } from './resource-animation-sample';
import { sampleMirroredResourceAnimation } from './resource-animation-mirrored-sample';
import { numericFloatValue } from './object-numeric-runtime';

/** Actual 0x70-byte request -> Pack.Sample arguments at primary +0x100098e30,
 * secondary + additive callsites. Owner supplies the decoded pack associated
 * with its registered address; frame timing comes from the original clock. */
export function sampleOriginalResourceAnimationRequest(m: ModelBakeMemory, address: bigint, pack: ResourceAnimationPack, request: bigint) {
  const frames = [0x38, 0x3c, 0x40, 0x44].map(at => m.read32(request + BigInt(at)) | 0) as [number, number, number, number];
  const state = resourceAnimationSample(pack, frames, numericFloatValue(m.read32(request + 0x48n)), m.read32(request + 0x10n) | 0, !!m.bytes(request + 0x61n, 1)[0]);
  const mask = m.bytes(m.read64(request + 0x68n), Math.ceil(pack.bones.length / 8));
  return m.bytes(request + 0x4cn, 1)[0] ? sampleMirroredResourceAnimation(m, address, pack, state, mask) : sampleResourceAnimation(pack, state, mask);
}
