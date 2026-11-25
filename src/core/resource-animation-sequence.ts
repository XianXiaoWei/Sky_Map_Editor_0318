import type { ModelBakeMemory } from './model-baked-runtime';
import { RESOURCE_ANIMATION_REQUEST_POOLS, createOriginalResourceAnimationRequest, findOriginalResourceAnimationAction, type ResourceAnimationRequestServices } from './resource-animation-request';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { resourceAnimationNameHash, type ResourceAnimationList } from './resource-animation-list';
import type { ResourceAnimationPack } from './resource-animation';
import { numericFloatValue as value } from './object-numeric-runtime';

const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
const fail = (line: number, expression: string, severity = 3): never => { throw new NativeObjectFoundationFailure('AnimationInstance.cpp', line, severity, expression); };

/** Complete Animation.MakeSpace 0x100096b60. The original eviction ceiling
 * is 1.1, not infinity: only timed requests below it can be removed. Keep the
 * first equal-weight candidate and shift entire records with mask ownership. */
export function makeOriginalAnimationSpace(m: ModelBakeMemory, controller: bigint, kind: 0 | 1 | 2, referenceCount: number) {
  const pool = RESOURCE_ANIMATION_REQUEST_POOLS[kind]; if (!pool) throw new Error('原动画池类型无效');
  const maximum = pool.capacity - 1, reserve = referenceCount | 0;
  if (reserve > maximum) fail(2345, 'referenceCount <= max - 1');
  const countAt = controller + BigInt(pool.count), requestAt = (i: number) => controller + BigInt(pool.first + i * 0x70);
  while (((m.read32(countAt) + reserve) | 0) > maximum) {
    const count = m.read32(countAt) | 0; let best = -1, bestWeight = f(1.1);
    for (let i = 0; i < count; i++) {
      const p = requestAt(i), weight = value(m.read32(p + 20n));
      if (m.bytes(p + 0x4fn, 1)[0] && bestWeight > weight) { best = i; bestWeight = weight; }
    }
    if (best === -1) fail(2358, 'bestIndex != -1');
    m.write32(countAt, count - 1);
    for (let i = best; i < (m.read32(countAt) | 0); i++) m.bytes(requestAt(i), 0x70).set(new Uint8Array(m.bytes(requestAt(i + 1), 0x70)));
  }
}

/** Animation sequence fallback/fade 0x100096d50. Existing secondary poses
 * suppress an unforced fallback only when the sum of original flag62 bytes
 * equals the number of eligible poses. This is not an every(nonzero) test. */
export function fadeOriginalAnimationSequence(m: ModelBakeMemory, controller: bigint, kind: 0 | 1 | 2, forced: number, duration: number, delay: number, s: ResourceAnimationRequestServices) {
  duration = f(duration); delay = f(delay);
  if (kind === 1 && !(forced & 255)) {
    let count = 0, flags = 0;
    for (let i = 0; i < (m.read32(controller + 12n) | 0); i++) {
      const p = controller + 0x4298n + BigInt(i * 0x70);
      if ((m.read32(p + 12n) | 0) >= 0 && value(m.read32(p + 20n)) > f(0.0001)) { count++; flags += m.bytes(p + 0x62n, 1)[0]; }
    }
    if (count === flags) return false;
  }
  makeOriginalAnimationSpace(m, controller, kind, 1);
  createOriginalResourceAnimationRequest(m, controller, {
    start: 0, stop: 0, kind, packIndex: -1, speedMult: 0, weight: 0, weightMult: 1,
    action: 1, delay, fadeRate: div(1, duration), mirrored: 0, rootMotionY: 1, rootMotionXZ: 1,
    flag62: 0, fileIndex: -1, actionIndex: -1, easingFunction: 0, easingPower: 2, field5c: 0, playheadIndex: -1,
  }, s);
  return true;
}

export interface ResourceAnimationSequenceServices extends ResourceAnimationRequestServices {
  /** Actual AnimationSequence registry corresponding to original global
   * 0x101dcff30: count at +0 and sequence pointers at +8. Owner must load it. */
  registry: bigint;
  list: ResourceAnimationList;
  packs: readonly ResourceAnimationPack[];
}

/** Complete normal nonempty Animation.PlaySequenceByIndex 0x1000968e0.
 * Metadata resolution uses the existing native-verified named lookup and
 * requests. Preserve float32 overlap/duration arithmetic and sequence IDs.
 * The original empty-sequence path consumes an uninitialized kind stack slot;
 * it is not treated as a valid executable sequence here. */
export function playOriginalAnimationSequenceByIndex(m: ModelBakeMemory, controller: bigint, index: number, weight: number, speed: number, flags: number, s: ResourceAnimationSequenceServices) {
  index |= 0;
  weight = f(weight); speed = f(speed);
  if ((m.read32(s.registry) | 0) <= index) return;
  if (index < 0) throw new Error('原动画序列索引为负');
  const previous = m.read32(controller + 0x5868n), next = (previous + 1) >>> 0;
  m.write32(controller + 0x5868n, next || ((previous + 2) >>> 0));
  const sequence = m.read64(s.registry + 8n + BigInt(index * 8)), count = m.read32(sequence + 0x18n) | 0;
  if (count <= 0) throw new Error('原空动画序列缺少有效类型');
  let delay = 0, kind: 0 | 1 | 2 = 0;
  for (let i = 0; i < (m.read32(sequence + 0x18n) | 0); i++) {
    const step = m.read64(sequence + 0x20n + BigInt(i * 8));
    const found = findOriginalResourceAnimationAction(s.list, s.packs, m.string(m.read64(step + 8n)), true)!;
    const metadata = found.metadata;
    if (i) delay = sub(delay, div(value(m.read32(step)), speed));
    else {
      if (metadata.animType < 0 || metadata.animType > 2) throw new Error('原动画序列类型映射无效');
      kind = metadata.animType as 0 | 1 | 2;
      makeOriginalAnimationSpace(m, controller, kind, (m.read32(sequence + 0x18n) + 1) | 0);
    }
    const distance = (metadata.stop - metadata.start) | 0, frames = f((distance + 1) | 0);
    const seconds = value(m.read32(step + 0x20n)), rate = f(m.read32(m.read64(controller + 0x6020n + BigInt(found.packIndex * 8)) + 0x50n) | 0);
    let speedMult: number, fps: number, duration: number;
    if (seconds > 0) { duration = div(seconds, speed); fps = div(frames, duration); speedMult = div(fps, rate); }
    else { speedMult = mul(speed, value(m.read32(step + 0x1cn))); fps = mul(speedMult, rate); duration = div(frames, fps); }
    let advance = mul(duration, value(m.read32(step + 0x18n)));
    if (distance > 0) advance = add(advance, div(-1, fps));
    createOriginalResourceAnimationRequest(m, controller, {
      start: metadata.start, stop: metadata.stop, kind, packIndex: found.packIndex,
      speedMult, weight: 0, weightMult: weight, action: 1, delay,
      fadeRate: div(speed, value(m.read32(step))), mirrored: +metadata.mirrored,
      rootMotionY: +metadata.rootMotionY, rootMotionXZ: +metadata.rootMotionXZ,
      flag62: (m.bytes(sequence + 0xa4n, 1)[0] & 8) >>> 3,
      fileIndex: found.fileIndex, actionIndex: found.actionIndex,
      easingFunction: metadata.easingFunction, easingPower: metadata.easingPower,
      field5c: flags, playheadIndex: -1,
    }, s);
    delay = add(delay, advance);
  }
  const outDuration = mul(speed, value(m.read32(sequence + 0xa0n)));
  fadeOriginalAnimationSequence(m, controller, kind, 1, outDuration, sub(delay, outDuration), s);
}

/** Animation.PlaySequence 0x1000967b0. Both name and optional base-pack
 * restriction use the original signed-char FNV hash. First matching registry
 * entry wins; file restriction zero accepts any base pack. */
export function playOriginalAnimationSequence(m: ModelBakeMemory, controller: bigint, name: string, weight: number, speed: number, flags: number, s: ResourceAnimationSequenceServices) {
  const base = m.read64(controller + 0x6018n); if (!base) fail(794, 'm_baseSkeleton != nullptr');
  const nameHash = BigInt('0x' + resourceAnimationNameHash(name)), packHash = BigInt('0x' + resourceAnimationNameHash(m.string(base)));
  for (let i = 0; i < (m.read32(s.registry) | 0); i++) {
    const sequence = m.read64(s.registry + 8n + BigInt(i * 8)), restriction = m.read64(sequence + 0x10n);
    if (m.read64(sequence + 8n) === nameHash && (!restriction || restriction === packHash)) {
      playOriginalAnimationSequenceByIndex(m, controller, i, weight, speed, flags, s); return i;
    }
  }
  return fail(722, 'id != -1', 4);
}
