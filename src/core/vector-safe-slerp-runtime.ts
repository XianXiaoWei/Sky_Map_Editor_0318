import { originalForceVectors } from './creature-force-runtime';
import type { NatureArithmeticServices } from './nature-event-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

export interface OriginalVectorSafeSlerpServices {
  arithmetic?: NatureArithmeticServices;
  acos(inputBits: number): number;
  /** Scalar sinf return and its caller-clobbered XMM0 W lane. The original
   * VPERMILPS 0xc0 broadcasts XYZ but consumes that distinct W value. */
  sin(inputBits: number): { valueBits: number; wBits: number };
}

/** Entire original TGCMath.SafeSlerp 0x100111b90..0x100111f30. Keeps the
 * opposing-vector perturbation, preferred/Z/Y axis selection, finite-factor
 * fallback and original XYZ reductions and W divisors. Input normalization
 * and math calls precede the sole output store, preserving output aliases. */
export function safeSlerpOriginalVectors(inputA: Uint8Array, inputB: Uint8Array, preferredAxis: Uint8Array, factorBits: number, s: OriginalVectorSafeSlerpServices, out: Uint8Array = new Uint8Array(16)): Uint8Array {
  const { a, read, bytes, normalize, sum } = originalForceVectors(s.arithmetic), one = bits(1);
  let first = normalize(read(inputA)), second = normalize(read(inputB));
  const dot = (x: number[], y: number[]) => sum(x.map((n, i) => a.mul(n, y[i])));
  const store = (v: number[]) => { out.set(bytes(v)); return out; };
  if (value(dot(first, second)) < value(0xbf7ae148)) {
    if (value(factorBits) === 0) return store(first);
    if (value(factorBits) === 1) return store(second);
    let axis = normalize(read(preferredAxis));
    if (value(dot(first, axis) & 0x7fffffff) > value(0x3f7ae148)) axis = [0, 0, one, 0];
    if (value(dot(first, axis) & 0x7fffffff) > value(0x3f7ae148)) axis = [0, one, 0, 0];
    const products = first.map((n, i) => a.mul(n, axis[i])), projection = sum(products);
    axis = normalize(axis.map((n, i) => a.sub(n, a.mul(first[i], i === 3 ? products[1] : projection))));
    const cyclic = [2, 0, 1, 3], cross = first.map((n, i) => a.sub(a.mul(n, axis[cyclic[i]]), a.mul(first[cyclic[i]], axis[i])));
    const perturbation = cyclic.map((lane, i) => a.mul(cross[lane], i === 3 ? 0 : 0x3e4ccccd));
    first = normalize(first.map((n, i) => a.add(n, perturbation[i])));
  }
  const factor = Number.isFinite(value(factorBits)) ? factorBits : one, cosine = dot(first, second);
  let left: number, right: number, leftW = 0, rightW = 0;
  if (value(0x3f7fbe77) > value(cosine)) {
    const angle = s.acos(cosine), sine = s.sin(angle), reciprocal = a.div(one, sine.valueBits);
    const l = s.sin(a.mul(a.sub(one, factor), angle)); left = a.mul(l.valueBits, reciprocal); leftW = l.wBits;
    const r = s.sin(a.mul(factor, angle)); right = a.mul(r.valueBits, reciprocal); rightW = r.wBits;
  } else { left = a.sub(one, factor); right = factor; }
  const result = first.map((n, i) => a.add(a.mul(second[i], i === 3 ? rightW : right), a.mul(n, i === 3 ? leftW : left)));
  if (result.slice(0, 3).some(n => Number.isNaN(value(n)))) throw new NativeObjectFoundationFailure('../../../Code/Base/TGCMath.h', 567, 4, '!isNan(result[0]) && !isNan(result[1]) && !isNan(result[2])');
  return store(normalize(result));
}
