import type { ModelBakeMemory } from './model-baked-runtime';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from './resource-animation-request';
import { sortOriginalAnimationBoneIndices } from './resource-animation-bone-sort';
import { constructOriginalTransformNode, setOriginalTransformParent } from './transform-node-runtime';

/** Original 56-name table at 0x100c7dca0, in table order. */
export const RESOURCE_ANIMATION_COMMON_BONES = [
  'M_hip', 'L_legRoot', 'L_knee', 'L_foot', 'L_toe', 'M_spine', 'M_chest', 'M_neckRoot', 'M_neckTop', 'M_head',
  'L_shoulder', 'L_armRoot', 'L_elbow', 'L_hand', 'R_shoulder', 'R_armRoot', 'R_elbow', 'R_hand',
  'L_capBRoot', 'L_capBTip', 'L_capFRoot', 'L_capFTip', 'R_capBRoot', 'R_capBTip', 'R_capFRoot', 'R_capFTip',
  'M_capFRoot', 'M_capFTip', 'M_capBRoot', 'M_capBTip', 'R_legRoot', 'R_knee', 'R_foot', 'R_toe', 'M_chestWing',
  'M_WingBRootAUX', 'L_WingBRootAUX', 'L_WingSRootAUX', 'L_WingFRootAUX', 'R_WingBRootAUX', 'R_WingSRootAUX', 'R_WingFRootAUX',
  'M_WingBRoot', 'L_WingBRoot', 'L_WingSRoot', 'L_WingFRoot', 'R_WingBRoot', 'R_WingSRoot', 'R_WingFRoot',
  'M_WingBTip', 'L_WingBTip', 'L_WingSTip', 'L_WingFTip', 'R_WingBTip', 'R_WingSTip', 'R_WingFTip',
] as const;

export interface ResourceAnimationMaskWeights { primary: Float32Array; secondary: Float32Array; }
export interface ResourceAnimationSkeletonServices {
  /** Owner allocator at 0x100795530; it supplies actual retained storage. */
  allocate(allocator: bigint, size: number, alignment: number): bigint;
  weights: ResourceAnimationMaskWeights;
}
export class OriginalSkeletonAssertion extends Error {
  readonly severity = 4;
  readonly line = 404;
  constructor(readonly boneCount: number) { super(`原骨架数量 ${boneCount} 超过 256`); }
}

function boneSearch(m: ModelBakeMemory, controller: bigint, name: string) {
  const pack = m.read64(controller + 0x6018n), count = m.read32(pack + 0x54n) | 0;
  const records = m.read64(pack + 0x60n), skip = BigInt(m.read32(controller + 0x5810n));
  const raw = m.bytes(controller + 0x5610n, count * 2), indices = new DataView(raw.buffer, raw.byteOffset, raw.byteLength);
  const target = new TextEncoder().encode(name);
  const compare = (bone: number) => {
    const text = records + BigInt(bone * 0x44) + skip;
    for (let i = 0; ; i++) {
      const a = m.bytes(text + BigInt(i), 1)[0], b = target[i] ?? 0;
      if (a !== b) return a - b;
      if (!a) return 0;
    }
  };
  let first = 0, length = count;
  while (length) {
    const half = Math.floor(length / 2), mid = first + half, bone = indices.getUint16(mid * 2, true);
    if (compare(bone) < 0) { first = mid + 1; length -= half + 1; } else length = half;
  }
  if (first === count) return null;
  const bone = indices.getUint16(first * 2, true);
  return { bone, exact: compare(bone) === 0 };
}

/** Complete Animation.InitializeMasks 0x100094550. Nonhuman calls preserve
 * the previous secondary global. Human lower_bound deliberately does not
 * check equality before selecting a leg/hip; descendants propagate until
 * no changes remain, including forward-parent records. */
export function initializeOriginalResourceAnimationMasks(m: ModelBakeMemory, controller: bigint, weights: ResourceAnimationMaskWeights) {
  if (weights.primary.length !== 256 || weights.secondary.length !== 256) throw new Error('原骨骼全局权重必须为 256 项');
  weights.primary.fill(1);
  if (!m.bytes(controller + 0x5830n, 1)[0]) return;
  weights.secondary.fill(1);
  const pack = m.read64(controller + 0x6018n), count = m.read32(pack + 0x54n) | 0, records = m.read64(pack + 0x60n);
  for (const name of ['L_legRoot', 'R_legRoot']) {
    const found = boneSearch(m, controller, name);
    if (!found) continue;
    weights.secondary[found.bone] = 0;
    let changed: boolean;
    do {
      changed = false;
      for (let bone = 0; bone < count; bone++) {
        const parent = m.read32(records + BigInt(bone * 0x44 + 0x40)) | 0;
        if (parent >= 2 && weights.secondary[parent - 1] === 0 && weights.secondary[bone] !== 0) {
          weights.secondary[bone] = 0; changed = true;
        }
      }
    } while (changed);
  }
  const hip = boneSearch(m, controller, 'M_hip'); if (hip) weights.secondary[hip.bone] = 0;
}

/** Complete normal Animation.InitializeSkeleton 0x100094900. Allocates
 * request masks, palette, root/bone Transform nodes, optional human poses and
 * common-bone indices in original order. Parent attachment and name sorting
 * are restored dependencies, not prepared state injected by the caller. */
export function initializeOriginalResourceAnimationSkeleton(m: ModelBakeMemory, controller: bigint, records: bigint, boneCount: number, s: ResourceAnimationSkeletonServices) {
  m.write64(controller + 0x6018n, m.read64(controller + 0x6020n));
  const count = boneCount >>> 0;
  if (count > 256) throw new OriginalSkeletonAssertion(count);
  const allocate = (size: number) => s.allocate(m.read64(controller), size, 16);
  const stride = (count + 7) >> 3, masks = allocate(stride * 193);
  m.write64(controller + 0x5608n, masks);
  let index = 0;
  for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < pool.capacity; i++) {
    m.write64(controller + BigInt(pool.first + i * 0x70 + 0x68), masks + BigInt(index++ * stride));
  }
  m.write64(controller + 0x5840n, allocate((count + 1) * 64));
  const nodes = allocate((count + 1) * 0xf0); m.write64(controller + 0x5838n, nodes);
  for (let node = 0; node <= count; node++) constructOriginalTransformNode(m, nodes + BigInt(node * 0xf0));
  const raw = m.bytes(controller + 0x5610n, count * 2), indices = new DataView(raw.buffer, raw.byteOffset, raw.byteLength);
  for (let bone = 0; bone < count; bone++) {
    indices.setUint16(bone * 2, bone, true);
    const parent = m.read32(records + BigInt(bone * 0x44 + 0x40)) | 0;
    setOriginalTransformParent(m, nodes + BigInt((bone + 1) * 0xf0), nodes + BigInt(parent * 0xf0));
  }
  const findByte = (target: number) => {
    for (let i = 0; ; i++) { const value = m.bytes(records + BigInt(i), 1)[0]; if (!value) return -1; if (value === target) return i; }
  };
  let prefix = findByte(0x3a); if (prefix < 0) prefix = findByte(0x5f);
  const skip = prefix < 0 || prefix === 1 ? 0 : prefix + 1;
  m.write32(controller + 0x5810n, skip);
  sortOriginalAnimationBoneIndices(m, controller, records, count);
  if (m.bytes(controller + 0x5830n, 1)[0]) {
    const first = allocate(count * 48); m.write64(controller + 0x5818n, first);
    m.write64(controller + 0x5820n, allocate(count * 48));
    if (count) m.bytes(first, count * 48).set(m.bytes(m.read64(m.read64(controller + 0x6018n) + 0x58n), count * 48));
  }
  initializeOriginalResourceAnimationMasks(m, controller, s.weights);
  const found: number[] = [];
  for (const name of RESOURCE_ANIMATION_COMMON_BONES) {
    const result = boneSearch(m, controller, name);
    if (result?.exact) { m.write32(controller + 0x5850n, m.read32(controller + 0x5850n) + 1); found.push(result.bone); }
  }
  const out = allocate(m.read32(controller + 0x5850n) * 4); m.write64(controller + 0x5858n, out);
  for (let i = 0; i < found.length; i++) m.write32(out + BigInt(i * 4), found[i]);
}
