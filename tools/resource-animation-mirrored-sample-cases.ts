import type { ResourceAnimationPack } from '../src/core/resource-animation';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { finalizeOriginalAnimationPack } from '../src/core/resource-animation-finalize';
import { sampleOriginalResourceAnimationRequest } from '../src/core/resource-animation-request-sample';
import { resourceAnimationSample } from '../src/core/resource-animation-sample';
import { animationSamplingCases, type AnimationSampleCase } from './resource-animation-sample-cases';
import { animationFinalizeMetadata, prepareAnimationFinalize } from './resource-animation-finalize-cases';
import { numericFloatBits } from '../src/core/object-numeric-runtime';
export function mirroredAnimationSamplingCases(data: string) {
  return animationSamplingCases(data).flatMap(row => [0, 1].map(additive => ({ ...row, additive })));
}
export function prepareMirroredAnimationSampleOwner(pack: ResourceAnimationPack, additive: number) {
  const c = { id: '', mode: 1, metadata: additive ? 7 : 6, finalized: 0, human: 0, variant: -1, seed: 12001 };
  const { b, base, m } = prepareAnimationFinalize(pack, c), library = readResourceAnimationList(animationFinalizeMetadata(pack, c, Buffer.alloc(0)));
  let used = 0x20000;
  finalizeOriginalAnimationPack(m, base + 0x9100n, { getAnimationLibrary: () => library, allocate: (allocator, size, alignment) => {
    if (allocator !== base + 0x9008n || alignment !== 16) throw new Error('Mirrored sample owner allocator differs');
    used = (used + alignment - 1) & ~(alignment - 1); const out = used; used += size;
    b.fill(0, out, used); return base + BigInt(out);
  } });
  return { m, address: base + 0x9100n, request: base + 0x1e000n, mask: base + 0x1d000n };
}
export function mirroredAnimationSampleExpected(pack: ResourceAnimationPack, c: AnimationSampleCase, owner: ReturnType<typeof prepareMirroredAnimationSampleOwner>) {
  const { m, request } = owner;
  c.frames.forEach((frame, i) => m.write32(request + BigInt(0x38 + i * 4), frame));
  m.write32(request + 0x48n, numericFloatBits(c.fraction)); m.write32(request + 0x10n, c.clipIndex);
  m.write8(request + 0x61n, +c.fix); m.write8(request + 0x4cn, 1); m.write64(request + 0x68n, owner.mask);
  m.bytes(owner.mask, c.mask.length).set(c.mask);
  const state = resourceAnimationSample(pack, c.frames, c.fraction, c.clipIndex, c.fix), pose = sampleOriginalResourceAnimationRequest(m, owner.address, pack, request), b = Buffer.alloc(48);
  b.writeUInt32LE(state.clipIndex); Buffer.from(state.weights.buffer).copy(b, 4); Buffer.from(state.scaleWeights.buffer).copy(b, 20);
  state.frames.forEach((frame, i) => b.writeInt32LE(frame, 28 + i * 4)); b[44] = +state.fixQuaternionSigns;
  return Buffer.concat([b, Buffer.from(pose.buffer)]);
}
