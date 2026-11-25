import type { ModelBakeMemory } from './model-baked-runtime';
import { numericFloatBits, numericFloatValue } from './object-numeric-runtime';
import { resourceAnimationLocalMatrix } from './resource-animation-matrices';
import { transformNativeObb } from './marker-transform-runtime';

export class OriginalTransformAssertion extends Error {
  readonly severity = 3;
  constructor(readonly line: number) { super(`原 Transform.cpp 断言：${line}`); }
}
const requireState = (ok: boolean, line: number) => { if (!ok) throw new OriginalTransformAssertion(line); };

/** Transform.constructor 0x1007f21f0. Preserve padding after the dirty byte. */
export function constructOriginalTransformNode(m: ModelBakeMemory, node: bigint) {
  m.bytes(node, 0xe0).fill(0);
  for (const at of [0x10, 0x14, 0x18, 0x20, 0x24, 0x28, 0x3c,
    0x40, 0x54, 0x68, 0x7c, 0x80, 0x94, 0xa8, 0xbc]) m.write32(node + BigInt(at), 0x3f800000);
  m.write8(node + 0xe0n, 0);
}

/** Transform.MarkDirty 0x1007f2740. Already-dirty nodes stop traversal. */
export function markOriginalTransformDirty(m: ModelBakeMemory, node: bigint) {
  if (m.bytes(node + 0xe0n, 1)[0]) return;
  m.write8(node + 0xe0n, 1);
  for (let child = m.read64(node + 0xd8n); child; child = m.read64(child + 0xd0n)) markOriginalTransformDirty(m, child);
}

/** Complete normal Transform.SetParent 0x1007f22c0, including detach,
 * sibling links, native assertion order and both dirty-propagation calls. */
export function setOriginalTransformParent(m: ModelBakeMemory, node: bigint, parent: bigint) {
  requireState(node !== parent, 0x72);
  const old = m.read64(node + 0xc0n);
  if (old) {
    const previous = m.read64(node + 0xc8n), next = m.read64(node + 0xd0n);
    if (previous) {
      requireState(m.read64(previous + 0xd0n) === node, 0x78);
      requireState(m.read64(previous + 0xc0n) === old, 0x79);
      requireState(m.read64(old + 0xd8n) !== node, 0x7a);
      m.write64(previous + 0xd0n, next);
    } else {
      requireState(m.read64(old + 0xd8n) === node, 0x7f);
      m.write64(old + 0xd8n, next);
    }
    if (next) {
      requireState(m.read64(next + 0xc8n) === node, 0x85);
      requireState(m.read64(next + 0xc0n) === old, 0x86);
      m.write64(next + 0xc8n, previous);
    }
    m.write64(node + 0xc8n, 0n); m.write64(node + 0xd0n, 0n);
    markOriginalTransformDirty(m, node);
  }
  m.write64(node + 0xc0n, parent);
  if (!parent) return;
  requireState(m.read64(node + 0xc8n) === 0n, 0x93);
  requireState(m.read64(node + 0xd0n) === 0n, 0x94);
  const next = m.read64(parent + 0xd8n);
  m.write64(node + 0xd0n, next); m.write64(parent + 0xd8n, node);
  if (next) {
    requireState(m.read64(next + 0xc0n) === parent, 0x99);
    m.write64(next + 0xc8n, node);
  }
  markOriginalTransformDirty(m, node);
}

/** Complete Transform.UpdateWorldMatrices 0x1007f2c20. Parent scale affects
 * local translation; the parent's unscaled world basis composes the local
 * basis. Store both native caches and clear only this node's dirty byte. */
export function updateOriginalTransformWorldMatrices(m: ModelBakeMemory, node: bigint): void {
  if (!m.bytes(node + 0xe0n, 1)[0]) return;
  const parent = m.read64(node + 0xc0n);
  if (parent) updateOriginalTransformWorldMatrices(m, parent);
  // The original reloads the parent pointer after its recursive update.
  const currentParent = parent ? m.read64(node + 0xc0n) : 0n;
  const read = (address: bigint, count: number) => Float32Array.from({ length: count }, (_, i) => numericFloatValue(m.read32(address + BigInt(i * 4))));
  const parentMatrix = currentParent ? new Uint8Array(m.bytes(currentParent + 0x40n, 64)) : new Uint8Array(Float32Array.of(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1).buffer);
  const parentScale = currentParent ? read(currentParent + 0x20n, 3) : [1, 1, 1];
  const pose = new Float32Array(12);
  pose.set(read(node + 0x20n, 4)); pose.set(read(node + 0x30n, 4), 4); pose.set(read(node, 4), 8);
  const local = resourceAnimationLocalMatrix(pose, 0, parentScale, read(node + 0x10n, 3));
  const world = new Uint8Array(64);
  transformNativeObb(parentMatrix, new Uint8Array(local.buffer), world);
  m.bytes(node + 0x40n, 64).set(world);
  const d = new DataView(world.buffer);
  for (let column = 0; column < 3; column++) for (let row = 0; row < 4; row++) {
    const at = (column * 4 + row) * 4;
    d.setUint32(at, numericFloatBits(Math.fround(d.getFloat32(at, true) * pose[column])), true);
  }
  m.bytes(node + 0x80n, 64).set(world);
  m.write8(node + 0xe0n, 0);
}

/** Complete Transform.GetWorldMatrix 0x1007f26e0, including lazy cache update.
 * Return owned bytes so a subsequent cache write cannot change the result. */
export function getOriginalTransformWorldMatrix(m: ModelBakeMemory, node: bigint): Uint8Array {
  updateOriginalTransformWorldMatrices(m, node);
  return new Uint8Array(m.bytes(node + 0x80n, 64));
}
