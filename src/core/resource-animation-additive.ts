import type { ModelBakeMemory } from './model-baked-runtime';
import type { ResourceAnimationPrimaryServices } from './resource-animation-primary';
import { updateResourceAnimationClock } from './resource-animation-clock';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';
const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
export interface ResourceAnimationAdditiveServices extends ResourceAnimationPrimaryServices {
  /** Original scalar tail calls powf for scale. Its explicit arithmetic service
   * is separate from SIMD groups, which use the original linear scale factor. */
  pow(baseBits: number, exponentBits: number): number;
}
/** Animation.UpdateAdditive 0x100099ea0. Updates clocks backwards, samples
 * forwards and applies weighted scale/translation and delta quaternions to the
 * existing shared pose. SIMD groups and scalar tails retain different scale,
 * quaternion normalization and multiplication orders. Pack finalization owns
 * additive reference/mirror maps; this consumer does not fabricate them. */
export function updateOriginalResourceAnimationAdditive(m: ModelBakeMemory, controller: bigint, delta: number, clockOnly: number, s: ResourceAnimationAdditiveServices) {
  const count = m.read32(controller + 16n) | 0;
  if (count < 0 || count > 25) throw new Error('原动画叠加状态数量无效');
  const requestAt = (i: number) => controller + 0x4998n + BigInt(i * 0x70);
  let accumulated = 0;
  for (let i = count - 1; i >= 0; i--) {
    const p = requestAt(i), result = updateResourceAnimationClock(m.bytes(p, 0x70), delta, accumulated, s.clock);
    m.bytes(p, 0x70).set(result.state); accumulated = result.accumulatedWeight;
  }
  if (clockOnly & 255 || count === 0) return;
  const bones = m.read32(m.read64(controller + 0x6018n) + 0x54n) | 0;
  if (bones < 0 || bones > 256) throw new Error('原动画叠加骨骼数量无效');
  const selected: bigint[] = [];
  for (let i = 0; i < count; i++) { const p = requestAt(i); if ((m.read32(p + 12n) | 0) >= 0 && value(m.read32(p + 20n)) > f(0.0001)) selected.push(p); }
  if (!selected.length) return;
  const pose = new Float32Array(bones * 12), simd = bones & ~3;
  for (let bone = 0; bone < bones; bone++) {
    const node = m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0), at = bone * 12;
    for (let lane = 0; lane < 4; lane++) { pose[at + lane] = value(m.read32(node + 32n + BigInt(lane * 4))); pose[at + 4 + lane] = value(m.read32(node + 48n + BigInt(lane * 4))); pose[at + 8 + lane] = value(m.read32(node + BigInt(lane * 4))); }
  }
  for (const p of selected) {
    const pack = m.read64(controller + 0x6020n + BigInt(m.read32(p + 12n) | 0) * 8n), sample = s.sample(pack, p), weight = value(m.read32(p + 20n)), remaining = sub(1, weight);
    if (sample.length !== pose.length) throw new Error('原动画叠加采样骨骼数不匹配');
    if (bones) {
      if (!m.bytes(p + 0x4dn, 1)[0]) sample[9] = 0;
      if (!m.bytes(p + 0x4en, 1)[0]) { sample[8] = 0; sample[10] = 0; }
    }
    for (let bone = 0; bone < bones; bone++) {
      const at = bone * 12, grouped = bone < simd;
      for (let lane = 0; lane < 3; lane++) {
        const factor = grouped ? add(mul(weight, add(sample[at + lane], -1)), 1) : value(s.pow(bits(sample[at + lane]), bits(weight)));
        pose[at + lane] = mul(factor, pose[at + lane]); pose[at + 8 + lane] = add(mul(weight, sample[at + 8 + lane]), pose[at + 8 + lane]);
      }
      if (!grouped) pose[at + 11] = add(mul(0, sample[at + 11]), pose[at + 11]);
      const q = sample.slice(at + 4, at + 8), negative = q[3] < 0;
      for (let lane = 0; lane < 4; lane++) {
        const identity = lane === 3 ? remaining : 0;
        q[lane] = grouped ? mul(q[lane], negative ? -weight : weight) : negative ? sub(identity, mul(q[lane], weight)) : add(mul(q[lane], weight), identity);
      }
      if (grouped) q[3] = add(q[3], remaining);
      const squares = q.map(n => mul(n, n));
      if (grouped) {
        const square = add(squares[3], add(squares[2], add(squares[0], squares[1]))), reciprocal = value(s.rsqrt(bits(square))), refined = mul(reciprocal, mul(sub(3, mul(square, mul(reciprocal, reciprocal))), 0.5));
        for (let lane = 0; lane < 4; lane++) q[lane] = mul(q[lane], refined);
      } else {
        const length = f(Math.sqrt(add(add(squares[0], squares[2]), add(squares[1], squares[3]))));
        if (length > f(0.00001)) for (let lane = 0; lane < 4; lane++) q[lane] = div(q[lane], length);
      }
      const a = pose.slice(at + 4, at + 8), [x, y, z, w] = q, [ax, ay, az, aw] = a;
      if (grouped) {
        pose[at + 4] = add(mul(aw, x), add(mul(az, y), sub(mul(ax, w), mul(ay, z))));
        pose[at + 5] = add(mul(aw, y), sub(add(mul(ax, z), mul(ay, w)), mul(az, x)));
        pose[at + 6] = add(mul(aw, z), add(mul(az, w), sub(mul(ay, x), mul(ax, y))));
        pose[at + 7] = add(mul(aw, w), sub(sub(-mul(ax, x), mul(ay, y)), mul(az, z)));
      } else {
        pose[at + 4] = add(add(mul(w, ax), mul(x, aw)), sub(mul(y, az), mul(z, ay)));
        pose[at + 5] = add(add(mul(w, ay), mul(y, aw)), sub(mul(z, ax), mul(x, az)));
        pose[at + 6] = add(add(mul(w, az), mul(z, aw)), sub(mul(x, ay), mul(y, ax)));
        pose[at + 7] = sub(mul(w, aw), add(mul(z, az), add(mul(x, ax), mul(y, ay))));
      }
    }
  }
  for (let bone = 0; bone < bones; bone++) {
    const node = m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0), at = bone * 12;
    for (let lane = 0; lane < 4; lane++) { m.write32(node + BigInt(lane * 4), bits(pose[at + 8 + lane])); m.write32(node + 32n + BigInt(lane * 4), bits(pose[at + lane])); m.write32(node + 48n + BigInt(lane * 4), bits(pose[at + 4 + lane])); }
    m.write8(node + 0xe0n, 1);
  }
}
