import type { ModelBakeMemory } from './model-baked-runtime';
import type { ResourceAnimationPack } from './resource-animation';
import { findResourceAnimationFile, type ResourceAnimationList } from './resource-animation-list';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { numericFloatValue } from './object-numeric-runtime';
import { createOriginalNamedAnimationRequest, createOriginalResourceAnimationRequest, RESOURCE_ANIMATION_REQUEST_POOLS, type ResourceAnimationRequestServices } from './resource-animation-request';
import { initializeOriginalResourceAnimationSkeleton, type ResourceAnimationSkeletonServices } from './resource-animation-skeleton';
import { finalizeOriginalAnimationPack, type ResourceAnimationFinalizationServices } from './resource-animation-finalize';

const fail = (line: number, severity: number, expression: string): never => { throw new NativeObjectFoundationFailure('AnimationInstance.cpp', line, severity, expression); };

/** Original Animation.Default 0x100096120. Selects the first metadata-bearing
 * registered pack, then resolves its first action through the normal named
 * consumer. If none has metadata, the original plays pack zero's full range. */
export function playOriginalDefaultAnimation(m: ModelBakeMemory, controller: bigint, list: ResourceAnimationList, packs: readonly ResourceAnimationPack[], s: ResourceAnimationRequestServices) {
  const count = m.read32(controller + 0x6220n) | 0;
  if (count <= 0) fail(692, 3, 'm_animPackCount > 0');
  for (let i = 0; i < count; i++) {
    const pack = packs[i]; if (!pack) throw new Error('原动画已注册资源缺失');
    const file = findResourceAnimationFile(list, pack.name);
    if (file?.metaDatas.length) return createOriginalNamedAnimationRequest(m, controller, list, packs, file.metaDatas[0].name, 1, s);
  }
  const pack = m.read64(controller + 0x6020n);
  return createOriginalResourceAnimationRequest(m, controller, {
    start: 1, stop: m.read32(pack + 0x48n) | 0, kind: 0, packIndex: 0,
    speedMult: 1, weight: 1, weightMult: 1, action: 0, delay: 0, fadeRate: 0,
    mirrored: 0, rootMotionY: 1, rootMotionXZ: 1, flag62: 0,
    fileIndex: -1, actionIndex: -1, easingFunction: 0, easingPower: 2, field5c: 0, playheadIndex: -1,
  }, s);
}

/** Original Animation.Current 0x10009d520 searches backwards for a weighted,
 * metadata-bound timed action. A state merely playing is not a current action. */
export function currentOriginalAnimation(m: ModelBakeMemory, controller: bigint, kind: number) {
  const pool = RESOURCE_ANIMATION_REQUEST_POOLS[kind];
  if (!pool) return -1;
  for (let i = (m.read32(controller + BigInt(pool.count)) | 0) - 1; i >= 0; i--) {
    const p = controller + BigInt(pool.first + i * 0x70);
    if (m.bytes(p + 0x4fn, 1)[0] && numericFloatValue(m.read32(p + 20n)) > 0 &&
        (m.read32(p + 4n) | 0) !== -1 && (m.read32(p + 8n) | 0) !== -1) return pool.index + i;
  }
  return -1;
}

/** Original Animation.SetSpeed 0x100097c80. Writes frames per second directly
 * into the addressed request, preserving zero, subnormal and finite extreme
 * values; its original bound is infinity, so only nonfinite inputs are skipped.
 * Negative indices follow the original signed secondary-pool pointer arithmetic;
 * valid callers pass a previously returned nonnegative global playhead index. */
export function setOriginalAnimationSpeed(m: ModelBakeMemory, controller: bigint, index: number, speedBits: number) {
  index |= 0;
  const pool = (index >>> 0) < 152 ? RESOURCE_ANIMATION_REQUEST_POOLS[0] : index <= 167 ? RESOURCE_ANIMATION_REQUEST_POOLS[1] : index <= 192 ? RESOURCE_ANIMATION_REQUEST_POOLS[2] : null;
  if (!pool) return fail(2227, 4, 'playheadIndex out of bounds');
  if (Number.isFinite(numericFloatValue(speedBits))) m.write32(controller + BigInt(pool.first + (index - pool.index) * 0x70 + 32), speedBits);
}

export type ResourceAnimationRegistrationServices = ({ finalization: ResourceAnimationFinalizationServices; finalizePack?: never } |
  { finalization?: never; finalizePack(pack: bigint): void }) & ({ skeleton: ResourceAnimationSkeletonServices; initializeSkeleton?: never } |
  { skeleton?: never; initializeSkeleton(controller: bigint, bones: bigint, count: number): void });
/** Original Animation.RegisterPack 0x100094430. Appends in saved order,
 * initializes the first skeleton before finalizing, and preserves failure writes. */
export function registerOriginalAnimationPack(m: ModelBakeMemory, controller: bigint, pack: bigint, s: ResourceAnimationRegistrationServices) {
  const bones = m.read32(pack + 0x54n) | 0;
  if (bones <= 0) fail(303, 3, '_data->boneCount > 0');
  if ((m.read32(pack + 0x48n) | 0) <= 0) fail(304, 3, '_data->frameCount > 0');
  const count = m.read32(controller + 0x6220n) | 0;
  if (count >= 64) fail(305, 3, 'm_animPackCount < kMaxAnimPackCount');
  if (count > 0 && bones !== (m.read32(m.read64(controller + 0x6018n) + 0x54n) | 0)) fail(309, 4, '_data->boneCount == m_baseSkeleton->boneCount');
  m.write64(controller + 0x6020n + BigInt(count * 8), pack);
  m.write32(controller + 0x6220n, count + 1);
  if (count === 0) {
    const records = m.read64(pack + 0x60n);
    if (s.skeleton) initializeOriginalResourceAnimationSkeleton(m, controller, records, bones, s.skeleton);
    else s.initializeSkeleton(controller, records, bones);
  }
  if (s.finalization) finalizeOriginalAnimationPack(m, pack, s.finalization);
  else s.finalizePack(pack);
}
