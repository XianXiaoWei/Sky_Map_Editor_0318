import type { ModelBakeMemory } from './model-baked-runtime';
import { updateResourceAnimationClock } from './resource-animation-clock';
import type { ResourceAnimationPrimaryServices } from './resource-animation-primary';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';
import type { ResourceAnimationMaskWeights } from './resource-animation-skeleton';
const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
export interface ResourceAnimationSecondaryServices extends ResourceAnimationPrimaryServices {
  /** Original global bone masks initialized by Animation.InitializeMasks.
   * The owner supplies the selected full/upper-body mask and any dynamic
   * body blend; this consumer does not infer that selection from mesh names. */
  boneWeights(controller: bigint, request: bigint, bones: number): Float32Array;
}

/** Native UpdateSecondary mask selection 0x100099a87..0x100099c20.
 * The two arrays belong to InitializeMasks' shared globals, and the dynamic
 * toggle is the live byte at 0x100c7dc91. Preserve the unclamped +0x5834 blend
 * and multiplication/addition order for scalar and SIMD groups alike. */
export function originalResourceAnimationSecondaryBoneWeights(m: ModelBakeMemory, controller: bigint, request: bigint, bones: number, weights: ResourceAnimationMaskWeights, dynamicBodyEnabled: boolean): Float32Array {
  if (weights.primary.length !== 256 || weights.secondary.length !== 256 || bones < 0 || bones > 256) throw new Error('原骨骼全局权重无效');
  if (!m.bytes(controller + 0x5830n, 1)[0] || !m.bytes(request + 0x62n, 1)[0] || !dynamicBodyEnabled) return weights.primary.subarray(0, bones);
  const body = value(m.read32(controller + 0x5834n)), full = sub(1, body);
  return Float32Array.from({ length: bones }, (_, i) => add(mul(body, weights.secondary[i]), mul(full, weights.primary[i])));
}
/** Entire original weighted secondary pose blend 0x10009ad60. SIMD groups
 * use left-associated dots and refined RSQRTPS; tails use pairwise SQRTSS.
 * Translation/scale spare lanes are untouched in groups and cleared in tails. */
export function blendOriginalResourceAnimationPose(pose: Float32Array, sample: Float32Array, weight: number, boneWeights: Float32Array, rsqrt: (bits: number) => number) {
  const bones = boneWeights.length, simd = bones & ~3;
  if (pose.length !== bones * 12 || sample.length !== pose.length) throw new Error('原动画次级混合骨骼数不匹配');
  for (let bone = 0; bone < bones; bone++) {
    const at = bone * 12, t = mul(weight, boneWeights[bone]), previous = sub(1, t);
    for (const lane of [0, 1, 2, 8, 9, 10]) pose[at + lane] = add(mul(t, sample[at + lane]), mul(previous, pose[at + lane]));
    if (bone >= simd) { pose[at + 3] = add(mul(0, sample[at + 3]), mul(0, pose[at + 3])); pose[at + 11] = add(mul(0, pose[at + 11]), mul(0, sample[at + 11])); }
    const q = pose.subarray(at + 4, at + 8), b = sample.subarray(at + 4, at + 8), products = q.map((n, lane) => mul(n, b[lane]));
    const dot = bone < simd ? add(add(add(products[0], products[1]), products[2]), products[3]) : add(add(products[0], products[2]), add(products[1], products[3]));
    for (let lane = 0; lane < 4; lane++) { const prior = mul(previous, q[lane]), next = mul(t, b[lane]); q[lane] = dot < 0 ? sub(prior, next) : add(prior, next); }
    const squares = q.map(n => mul(n, n));
    if (bone < simd) {
      const square = add(squares[3], add(squares[2], add(squares[0], squares[1]))), reciprocal = value(rsqrt(bits(square)));
      const refined = mul(reciprocal, mul(sub(3, mul(mul(reciprocal, reciprocal), square)), 0.5));
      for (let lane = 0; lane < 4; lane++) q[lane] = mul(q[lane], refined);
    } else {
      const square = add(add(squares[0], squares[2]), add(squares[1], squares[3])), length = f(Math.sqrt(square));
      if (length > f(0.00001)) for (let lane = 0; lane < 4; lane++) q[lane] = div(q[lane], length);
    }
  }
}

/** Entire normal Animation.UpdateSecondary 0x100099680. Actual request
 * records and Transform poses are shared with the primary update. Clock
 * runs backwards, blends run forwards, and remaining weight gates each
 * request before sampling. Pack/mirror/weight services retain their owners. */
export function updateOriginalResourceAnimationSecondary(m: ModelBakeMemory, controller: bigint, delta: number, clockOnly: number, s: ResourceAnimationSecondaryServices) {
  const count = m.read32(controller + 12n) | 0;
  if (count < 0 || count > 16) throw new Error('原动画动作状态数量无效');
  const requestAt = (i: number) => controller + 0x4298n + BigInt(i * 0x70);
  let accumulatedWeight = 0;
  for (let i = count - 1; i >= 0; i--) {
    const p = requestAt(i), result = updateResourceAnimationClock(m.bytes(p, 0x70), delta, accumulatedWeight, s.clock);
    m.bytes(p, 0x70).set(result.state); accumulatedWeight = result.accumulatedWeight;
  }
  if (clockOnly & 255 || count === 0) return;
  const basePack = m.read64(controller + 0x6018n), bones = m.read32(basePack + 0x54n) | 0;
  if (bones < 0 || bones > 256) throw new Error('原动画动作骨骼数量无效');
  const readFloat = (p: bigint) => value(m.read32(p)), selected: bigint[] = [];
  for (let i = 0; i < count; i++) { const p = requestAt(i); if ((m.read32(p + 12n) | 0) >= 0 && readFloat(p + 20n) > f(0.0001)) selected.push(p); }
  if (!selected.length) return;
  let remaining = 0; for (const p of selected) remaining = add(remaining, readFloat(p + 20n));
  const pose = new Float32Array(bones * 12);
  for (let bone = 0; bone < bones; bone++) {
    const node = m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0), at = bone * 12;
    for (let lane = 0; lane < 4; lane++) { pose[at + 8 + lane] = readFloat(node + BigInt(lane * 4)); pose[at + lane] = readFloat(node + 32n + BigInt(lane * 4)); pose[at + 4 + lane] = readFloat(node + 48n + BigInt(lane * 4)); }
  }
  for (const p of selected) {
    const weight = readFloat(p + 20n); remaining = sub(remaining, weight);
    if (remaining >= 1) continue;
    let blend = div(weight, sub(1, remaining)); if (blend > 1) blend = 1;
    if (blend === 0) continue;
    const pack = m.read64(controller + 0x6020n + BigInt(m.read32(p + 12n) | 0) * 8n), sample = s.sample(pack, p);
    if (sample.length !== pose.length) throw new Error('原动画动作采样骨骼数不匹配');
    if (bones) {
      if (!m.bytes(p + 0x4dn, 1)[0]) sample[9] = readFloat(m.read64(basePack + 0x58n) + 36n);
      if (!m.bytes(p + 0x4en, 1)[0]) { sample[8] = readFloat(m.read64(basePack + 0x58n) + 32n); sample[10] = readFloat(m.read64(basePack + 0x58n) + 40n); }
    }
    blendOriginalResourceAnimationPose(pose, sample, blend, s.boneWeights(controller, p, bones), s.rsqrt);
  }
  for (let bone = 0; bone < bones; bone++) {
    const node = m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0), at = bone * 12;
    for (let lane = 0; lane < 4; lane++) m.write32(node + BigInt(lane * 4), bits(pose[at + 8 + lane]));
    for (let lane = 0; lane < 4; lane++) m.write32(node + 32n + BigInt(lane * 4), bits(pose[at + lane]));
    for (let lane = 0; lane < 4; lane++) m.write32(node + 48n + BigInt(lane * 4), bits(pose[at + 4 + lane]));
    m.write8(node + 0xe0n, 1);
  }
}
