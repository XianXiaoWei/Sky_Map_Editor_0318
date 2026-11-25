import { animationPrimaryCases, prepareAnimationPrimary, type AnimationPrimaryCase } from './resource-animation-primary-cases';
import type { ResourceAnimationPack } from '../src/core/resource-animation';
import { updateOriginalResourceAnimationSecondary } from '../src/core/resource-animation-secondary';
import { u32, floats } from '../src/core/binary';
export function animationSecondaryCases(data: string) { return animationPrimaryCases(data).map(c => ({ ...c, requests: c.requests.map(r => ({ ...r, id: r.id + ':secondary' })) })); }
export function animationSecondaryExpected(pack: ResourceAnimationPack, c: AnimationPrimaryCase) {
  const p = prepareAnimationPrimary(pack, c, 1);
  updateOriginalResourceAnimationSecondary(p.m, p.base, c.delta, c.clockOnly, { ...p, boneWeights: () => new Float32Array(pack.bones.length).fill(1) });
  return { ...p, output: Buffer.concat([u32(0), u32(0), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes)]) };
}
export function animationSecondaryInput(pack: ResourceAnimationPack, c: AnimationPrimaryCase, reciprocalInputs: number[]) {
  const p = prepareAnimationPrimary(pack, c, 1);
  return Buffer.concat([u32(c.clockOnly), floats([c.delta]), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes), u32(reciprocalInputs.length), ...reciprocalInputs.map(u32)]);
}
