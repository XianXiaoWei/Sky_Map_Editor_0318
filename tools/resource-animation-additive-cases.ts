import type { ResourceAnimationPack } from '../src/core/resource-animation';
import { animationPrimaryCases, prepareAnimationPrimary, type AnimationPrimaryCase } from './resource-animation-primary-cases';
import { updateOriginalResourceAnimationAdditive } from '../src/core/resource-animation-additive';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
import { u32, floats } from '../src/core/binary';
export const animationAdditiveCases = animationPrimaryCases;
export function animationAdditiveExpected(pack: ResourceAnimationPack, c: AnimationPrimaryCase, powTrace?: Buffer) {
  const p = prepareAnimationPrimary(pack, c, 2); let at = 0;
  updateOriginalResourceAnimationAdditive(p.m, p.base, c.delta, c.clockOnly, { ...p, pow: (base, exponent) => {
    // Only used before oracle execution to enumerate quaternion reciprocal
    // inputs, which do not depend on scale powf. Final byte comparisons replay
    // the native powf trace and check every base/exponent in call order.
    if (!powTrace) return bits(Math.pow(value(base), value(exponent)));
    if (at + 12 > powTrace.length || powTrace.readUInt32LE(at) !== base || powTrace.readUInt32LE(at + 4) !== exponent) throw new Error(`${c.id}: native additive powf inputs differ at ${at}`);
    const result = powTrace.readUInt32LE(at + 8); at += 12; return result;
  } });
  if (powTrace && at !== powTrace.length) throw new Error('Unused additive powf service calls');
  return { ...p, output: Buffer.concat([u32(0), u32(0), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes)]) };
}
export function animationAdditiveInput(pack: ResourceAnimationPack, c: AnimationPrimaryCase, reciprocalInputs: number[]) {
  const p = prepareAnimationPrimary(pack, c, 2);
  return Buffer.concat([u32(c.clockOnly), floats([c.delta]), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes), u32(reciprocalInputs.length), ...reciprocalInputs.map(u32)]);
}
