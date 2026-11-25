import type { ModelBakeMemory } from './model-baked-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { natureArithmetic } from './nature-event-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';
import { findResourceAnimationFile, resourceAnimationNameHash, type ResourceAnimationList } from './resource-animation-list';
import type { ResourceAnimationPack } from './resource-animation';

export const RESOURCE_ANIMATION_REQUEST_POOLS = [
  { count: 8, first: 0x18, capacity: 152, index: 0, line: 596 },
  { count: 12, first: 0x4298, capacity: 16, index: 152, line: 602 },
  { count: 16, first: 0x4998, capacity: 25, index: 168, line: 608 },
] as const;
const fail = (line: number, severity: number, expression: string): never => { throw new NativeObjectFoundationFailure('AnimationInstance.cpp', line, severity, expression); };

/** Animation.FindNamed 0x100095690: pack order, first file match, then the
 * stored signed-char FNV hash. The action name comparison is case sensitive;
 * file lookup alone folds ASCII case. Missing names never select a fallback. */
export function findOriginalResourceAnimationAction(list: ResourceAnimationList, packs: readonly ResourceAnimationPack[], name: string, required = false) {
  const hash = resourceAnimationNameHash(name);
  for (let packIndex = 0; packIndex < packs.length; packIndex++) {
    const file = findResourceAnimationFile(list, packs[packIndex].name);
    if (!file) continue;
    const actionIndex = file.metaDatas.findIndex(m => m.hashedName === hash);
    if (actionIndex >= 0) return { metadata: file.metaDatas[actionIndex], packIndex, fileIndex: list.files.indexOf(file), actionIndex };
  }
  if (required) fail(513, 4, `Could not find animation named "${name}"`);
  return null;
}

export interface ResourceAnimationRequestInput {
  /** Saved AnimationList ranges are one based and inclusive. */
  start: number; stop: number; kind: 0 | 1 | 2; packIndex: number;
  speedMult: number; weight: number; weightMult: number;
  action: number; delay: number; fadeRate: number;
  mirrored: number; rootMotionY: number; rootMotionXZ: number; flag62: number;
  fileIndex: number; actionIndex: number; easingFunction: number; easingPower: number;
  field5c: number; playheadIndex: number;
}
export interface ResourceAnimationRequestServices {
  hasRange(pack: bigint, start: number, stop: number): boolean;
  clipForRange(pack: bigint, start: number, stop: number): number;
  /** Executes the original endpoint consumer into the caller's existing mask. */
  loopSigns(pack: bigint, start: number, length: number, mask: bigint): number;
}

/** Complete normal Animation.PlayRange 0x100095c70. Uses the caller's real
 * controller pools and mask pointers; leaves padding/unconsumed fields intact.
 * It preserves original partial writes and assertion ordering on capacity and
 * range failures. Pack registration, mask allocation and blending are owners. */
export function createOriginalResourceAnimationRequest(m: ModelBakeMemory, controller: bigint, input: ResourceAnimationRequestInput, s: ResourceAnimationRequestServices) {
  const a = natureArithmetic(), p = input;
  let packIndex = p.packIndex | 0;
  const start = (p.start - 1) | 0, stop = (p.stop - 1) | 0;
  const packAt = (i: number) => m.read64(controller + 0x6020n + BigInt(i) * 8n);
  if (packIndex !== -1 && !s.hasRange(packAt(packIndex), start, stop)) fail(586, 4, 'Animation not Found');
  let index = p.playheadIndex | 0, out: bigint;
  if (index === -1) {
    const pool = RESOURCE_ANIMATION_REQUEST_POOLS[p.kind];
    const count = m.read32(controller + BigInt(pool.count)) | 0;
    if (count >= pool.capacity) fail(pool.line, 3, ['m_stateCount < kMaxStateCount', 'm_actionCount < kMaxActionCount', 'm_additiveCount < kMaxAdditiveCount'][p.kind]);
    out = controller + BigInt(pool.first + count * 0x70); index = pool.index + count;
    m.write32(controller + BigInt(pool.count), count + 1);
  } else {
    if (index < 0 || index >= 193) fail(2227, 4, 'playheadIndex out of bounds');
    const pool = index < 152 ? RESOURCE_ANIMATION_REQUEST_POOLS[0] : index < 168 ? RESOURCE_ANIMATION_REQUEST_POOLS[1] : RESOURCE_ANIMATION_REQUEST_POOLS[2];
    out = controller + BigInt(pool.first + (index - pool.index) * 0x70);
  }
  const sequence = m.read32(controller + 0x5864n); m.write32(controller + 0x5864n, sequence + 1); m.write32(out, sequence);
  m.write32(out + 12n, packIndex); m.write32(out + 4n, p.fileIndex); m.write32(out + 8n, p.actionIndex);
  m.write32(out + 20n, bits(p.weight)); m.write32(out + 24n, bits(p.weightMult));
  m.write32(out + 36n, start); m.write32(out + 40n, (1 - p.start + p.stop) | 0);
  m.write32(out + 44n, p.easingFunction); m.write32(out + 48n, bits(p.easingPower));
  const bound = packAt(packIndex === -1 ? 0 : packIndex);
  m.write32(out + 16n, s.clipForRange(bound, start, stop));
  const speed = a.mul(bits(m.read32(packAt(packIndex === -1 ? 0 : packIndex) + 0x50n) | 0), bits(p.speedMult));
  m.write32(out + 32n, speed); m.write32(out + 0x5cn, p.field5c);
  let phase = a.div(a.mul(speed, bits(p.delay)) ^ 0x80000000, bits(m.read32(out + 40n) | 0)); m.write32(out + 28n, phase);
  // Original adds 1 repeatedly only for negative phases; it does not reduce
  // positive phases modulo 1 here. Reject a nonterminating service input.
  while (value(phase) < 0) {
    const next = a.add(phase, 0x3f800000);
    if (next === phase) throw new Error('原动画请求负相位无法推进');
    phase = next;
  }
  m.write32(out + 28n, phase);
  m.write8(out + 0x4fn, p.action);
  m.write32(out + 0x50n, p.action & 255 ? m.read32(controller + 0x5868n) : 0);
  m.write32(out + 0x54n, bits(p.delay)); m.write32(out + 0x58n, bits(p.fadeRate)); m.write8(out + 0x60n, 1);
  for (let at = 0x34; at <= 0x44; at += 4) m.write32(out + BigInt(at), 0xffffffff);
  m.write8(out + 0x4cn, p.mirrored); m.write8(out + 0x4dn, p.rootMotionY); m.write8(out + 0x4en, p.rootMotionXZ); m.write8(out + 0x62n, p.flag62);
  if (packIndex !== -1) m.write8(out + 0x61n, + (s.loopSigns(packAt(packIndex), m.read32(out + 36n) | 0, m.read32(out + 40n) | 0, m.read64(out + 0x68n)) > 0));
  return index;
}

/** Debug-disabled Animation.PlayNamed 0x1000959d0, including original
 * metadata range/speed/type mapping. An action-pool request is distinct from
 * the timed action flag at +0x4f, which this entry explicitly leaves false. */
export function createOriginalNamedAnimationRequest(m: ModelBakeMemory, controller: bigint, list: ResourceAnimationList, packs: readonly ResourceAnimationPack[], name: string, weight: number, s: ResourceAnimationRequestServices, playheadIndex = -1) {
  if (m.bytes(controller + 20n, 1)[0]) throw new Error('原动画调试日志服务尚未提供');
  const found = findOriginalResourceAnimationAction(list, packs, name, true)!;
  const metadata = found.metadata;
  if (metadata.animType < 0 || metadata.animType > 2) throw new Error('原动画类型映射尚未核验');
  return createOriginalResourceAnimationRequest(m, controller, {
    start: metadata.start, stop: metadata.stop, kind: metadata.animType as 0 | 1 | 2,
    packIndex: found.packIndex, fileIndex: found.fileIndex, actionIndex: found.actionIndex,
    speedMult: metadata.speedMult, weight, weightMult: 1, action: 0, delay: 0, fadeRate: 0,
    mirrored: +metadata.mirrored, rootMotionY: +metadata.rootMotionY, rootMotionXZ: +metadata.rootMotionXZ,
    flag62: 0, easingFunction: metadata.easingFunction, easingPower: metadata.easingPower, field5c: 0, playheadIndex,
  }, s);
}
