import type { ModelBakeMemory } from './model-baked-runtime';
import { updateResourceAnimationClock, type ResourceAnimationClockServices } from './resource-animation-clock';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
export interface ResourceAnimationPrimaryServices {
  clock?: ResourceAnimationClockServices;
  /** Original AnimationPack.Sample, including retarget/mirror dependencies. */
  sample(pack: bigint, request: bigint): Float32Array;
  /** The original four-bone SIMD path uses RSQRTPS followed by refinement.
   * This arithmetic service must be supplied; scalar tails use SQRTSS. */
  rsqrt(inputBits: number): number;
}

/** Complete Animation.UpdatePrimary 0x100098be0. Advances requests in reverse
 * order, selects them in insertion order, accumulates scale/translation and
 * incrementally blends shortest-path quaternions. Preserves the original
 * four-bone SIMD/tail rounding differences and writes actual Transform nodes.
 * No metadata, AI decision, request or skeleton ownership is invented here. */
export function updateOriginalResourceAnimationPrimary(m: ModelBakeMemory, controller: bigint, delta: number, clockOnly: number, s: ResourceAnimationPrimaryServices) {
  const count = m.read32(controller + 8n) | 0;
  if (count < 0 || count > 152) throw new Error('原动画主状态数量无效');
  let accumulatedWeight = 0;
  const requestAt = (i: number) => controller + 0x18n + BigInt(i * 0x70);
  for (let i = count - 1; i >= 0; i--) {
    const request = requestAt(i), result = updateResourceAnimationClock(m.bytes(request, 0x70), delta, accumulatedWeight, s.clock);
    m.bytes(request, 0x70).set(result.state); accumulatedWeight = result.accumulatedWeight;
  }
  if (clockOnly & 255) return;
  const basePack = m.read64(controller + 0x6018n), bones = m.read32(basePack + 0x54n) | 0;
  if (bones < 0 || bones > 256) throw new Error('原动画主骨骼数量无效');
  const defaultPointer = () => m.read64(basePack + 0x58n);
  const readFloat = (p: bigint) => value(m.read32(p));
  const selected: bigint[] = [];
  for (let i = 0; i < count; i++) { const p = requestAt(i); if ((m.read32(p + 12n) | 0) >= 0 && readFloat(p + 20n) > f(0.0001)) selected.push(p); }
  let pose = new Float32Array(bones * 12), total = 0;
  for (const request of selected) {
    const pack = m.read64(controller + 0x6020n + BigInt(m.read32(request + 12n) | 0) * 8n), sample = s.sample(pack, request);
    if (sample.length !== pose.length) throw new Error('原动画主采样骨骼数不匹配');
    if (bones) {
      if (!m.bytes(request + 0x4dn, 1)[0]) sample[9] = readFloat(defaultPointer() + 36n);
      if (!m.bytes(request + 0x4en, 1)[0]) { sample[8] = readFloat(defaultPointer() + 32n); sample[10] = readFloat(defaultPointer() + 40n); }
    }
    const weight = readFloat(request + 20n); total = add(total, weight);
    const simdBones = bones & ~3;
    for (let bone = 0; bone < bones; bone++) {
      const at = bone * 12;
      for (const lane of [0, 1, 2, 8, 9, 10]) pose[at + lane] = add(mul(weight, sample[at + lane]), pose[at + lane]);
      // The scalar tail also consumes the stored spare scale/position lanes.
      if (bone >= simdBones) for (const lane of [3, 11]) pose[at + lane] = add(mul(weight, sample[at + lane]), pose[at + lane]);
      const t = bone < simdBones ? div(weight, total) : mul(weight, div(1, total)), previousWeight = sub(1, t);
      const q = pose.subarray(at + 4, at + 8), b = sample.subarray(at + 4, at + 8), products = q.map((n, lane) => mul(n, b[lane]));
      const dot = bone < simdBones ? add(add(add(products[0], products[1]), products[2]), products[3]) : add(add(products[0], products[2]), add(products[1], products[3]));
      for (let lane = 0; lane < 4; lane++) { const prior = mul(previousWeight, q[lane]), next = mul(t, b[lane]); q[lane] = dot < 0 ? sub(prior, next) : add(prior, next); }
      const squares = q.map(n => mul(n, n));
      if (bone < simdBones) {
        const square = add(squares[3], add(squares[2], add(squares[0], squares[1]))), reciprocal = value(s.rsqrt(bits(square)));
        const refined = mul(reciprocal, mul(sub(3, mul(mul(reciprocal, reciprocal), square)), 0.5));
        for (let lane = 0; lane < 4; lane++) q[lane] = mul(q[lane], refined);
      } else {
        const square = add(add(squares[0], squares[2]), add(squares[1], squares[3])), length = f(Math.sqrt(square));
        if (length > f(0.00001)) for (let lane = 0; lane < 4; lane++) q[lane] = div(q[lane], length);
      }
    }
  }
  if (total > 0) {
    const reciprocal = div(1, total);
    for (let bone = 0; bone < bones; bone++) for (const lane of [0, 1, 2, 8, 9, 10]) pose[bone * 12 + lane] = mul(pose[bone * 12 + lane], reciprocal);
  } else {
    pose = new Float32Array(bones * 12);
    for (let lane = 0; lane < pose.length; lane++) pose[lane] = readFloat(defaultPointer() + BigInt(lane * 4));
  }
  for (let bone = 0; bone < bones; bone++) {
    const node = m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0), at = bone * 12;
    for (let lane = 0; lane < 4; lane++) m.write32(node + BigInt(lane * 4), bits(pose[at + 8 + lane]));
    for (let lane = 0; lane < 4; lane++) m.write32(node + 32n + BigInt(lane * 4), bits(pose[at + lane]));
    for (let lane = 0; lane < 4; lane++) m.write32(node + 48n + BigInt(lane * 4), bits(pose[at + 4 + lane]));
    m.write8(node + 0xe0n, 1);
  }
  // Expose the already calculated pose to editor consumers. The native
  // Transform writes above still execute unchanged.
  return pose;
}
