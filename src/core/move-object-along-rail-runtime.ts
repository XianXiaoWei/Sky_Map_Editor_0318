import type { ModelBakeMemory } from './model-baked-runtime';
import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { originalForceVectors } from './creature-force-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';
import type { NatureArithmeticServices } from './nature-event-runtime';

export const ORIGINAL_MOVE_OBJECT_ALONG_RAIL_SIZE = 0xf8;
/** Whole placement constructor 0x100486f40. Public fields retain their
 * allocation contents until TGCL supplies saved values or missing defaults. */
export function constructOriginalMoveObjectAlongRail(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.length < ORIGINAL_MOVE_OBJECT_ALONG_RAIL_SIZE) throw new Error('Original MoveObjectAlongRail storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100c17210n, true);
  v.setUint16(0x74, 0, true); v.setUint32(0xf0, 0xffffffff, true);
}
export interface MoveObjectAlongRailLoadServices {
  allocationTag: bigint;
  allocate(heap: bigint, size: number, tag: bigint, alignment: number): bigint;
  release(heap: bigint, allocation: bigint): void;
  networkState(manager: bigint): bigint;
}
/** Whole Load 0x1004844b0. The second allocation re-reads the live Clump;
 * network registration follows allocation, including on assertion paths. */
export function loadOriginalMoveObjectAlongRail(m: ModelBakeMemory, event: bigint, game: bigint, heap: bigint, s: MoveObjectAlongRailLoadServices): void {
  let objects = m.read64(event + 64n);
  if (objects) {
    m.write64(event + 176n, s.allocate(heap, m.read32(objects + 16n) * 96, s.allocationTag, 16));
    objects = m.read64(event + 64n);
    m.write64(event + 192n, s.allocate(heap, m.read32(objects + 16n) * 32, s.allocationTag, 16));
  } else { m.write64(event + 176n, 0n); m.write64(event + 192n, 0n); }
  if (m.bytes(event + 160n, 1)[0]) {
    if (!m.bytes(event + 12n, 1)[0]) throw new NativeObjectFoundationFailure('MoveObjectAlongRail.cpp', 165, 4, 'autoStart');
    const state = s.networkState(m.read64(game + 0x5d0n)), count = m.bytes(state + 0x168n, 1)[0];
    if (count >= 16) throw new NativeObjectFoundationFailure('MoveObjectAlongRail.cpp', 169, 4, 'state.moveCount < LevelState::kMaxMoveObjects');
    m.write32(event + 240n, count); m.write8(state + 0x168n, count + 1);
  }
  m.write8(event + 216n, 0); m.write32(event + 220n, 0);
}
/** Whole Unload 0x1004845f0, including null release calls and live rereads. */
export function unloadOriginalMoveObjectAlongRail(m: ModelBakeMemory, event: bigint, heap: bigint, s: Pick<MoveObjectAlongRailLoadServices, 'release'>): void {
  s.release(heap, m.read64(event + 176n)); m.write64(event + 176n, 0n);
  s.release(heap, m.read64(event + 192n)); m.write64(event + 192n, 0n);
}
export interface MoveObjectAlongRailEnableServices {
  arithmetic?: NatureArithmeticServices;
  objectMetadata(): bigint;
  castObject(metadata: bigint, object: bigint, source: bigint): bigint;
  transform(object: bigint): Uint8Array;
  nearest(rail: bigint, position: Uint8Array): number;
  distanceAtParameter(rail: bigint, parameterBits: number): number;
  random(): number;
  /** Unwritten W at native rbp-0xa0. It persists across all objects in
   * this Enable invocation; it is neither cleared nor homogeneous 1. */
  initialScaleWBits(): number;
}
/** Whole Enable 0x100484640. Rail queries, metadata casts and randomness
 * remain explicit boundaries. All 96/32-byte record padding is preserved.
 * VMOVSS from memory clears upper lanes, so sway phase Z/W are native zero. */
export function enableOriginalMoveObjectAlongRail(m: ModelBakeMemory, event: bigint, game: bigint, s: MoveObjectAlongRailEnableServices): void {
  const { a, read, bytes, sqrt, normalize, squared } = originalForceVectors(s.arithmetic);
  const clamp = bits(0.0001), one = bits(1), randomScale = 0x30000000;
  m.write32(event + 80n, a.max(m.read32(event + 80n), clamp));
  if (m.bytes(event + 88n, 1)[0]) {
    m.write32(event + 84n, a.max(m.read32(event + 84n), clamp));
    m.write32(event + 80n, a.div(m.read32(m.read64(event + 56n) + 24n), m.read32(event + 84n)));
  }
  m.write32(event + 212n, 0); m.write32(event + 184n, 0); m.write8(event + 208n, 0); m.write64(event + 200n, 0n);
  let objects = m.read64(event + 64n);
  if (m.read32(objects + 16n)) {
    const scaleW = s.initialScaleWBits();
    for (let index = 0;; index = (index + 1) >>> 0) {
      const object = m.read64(m.read64(objects + 8n) + BigInt(index) * 8n), source = s.objectMetadata(), meta = s.objectMetadata();
      const cast = s.castObject(meta, object, source);
      if (!cast) throw new NativeObjectFoundationFailure('./Clump.h', 71, 3, 'ret');
      const transform = new Uint8Array(s.transform(cast)), states = m.read64(event + 176n), state = states + BigInt(index) * 96n;
      m.write32(state + 48n, 0);
      if (m.bytes(event + 90n, 1)[0]) {
        const rail = m.read64(event + 56n), current = s.transform(cast);
        const parameter = s.nearest(rail, new Uint8Array(current.subarray(48, 64))), distance = s.distanceAtParameter(rail, parameter);
        const offset = a.div(distance, m.read32(m.read64(event + 56n) + 24n)); m.write32(state + 48n, offset);
        if (value(offset) > value(m.read32(event + 184n))) m.write32(event + 184n, offset);
      }
      const columns = [0, 16, 32].map(at => read(transform, at));
      const scale = columns.map(column => { const q = squared(column); return sqrt(a.add(a.add(q[0], q[2]), a.add(q[1], q[3]))); });
      m.bytes(state, 16).set(bytes([...scale, scaleW]));
      m.bytes(state + 16n, 16).set(transform.subarray(48, 64));
      const zSquared = squared(columns[2]), zLength = sqrt(a.add(zSquared[2], a.add(zSquared[0], zSquared[1])));
      const backward = columns[2].map(n => (n ^ 0x80000000) >>> 0);
      m.bytes(state + 32n, 16).set(bytes(value(zLength) > value(0x3727c5ac) ? backward.map((n, i) => a.div(n, i === 3 ? zSquared[1] : zLength)) : backward));
      m.write32(state + 52n, 0); m.bytes(state + 64n, 16).set(bytes(normalize(columns[1]))); m.write32(state + 80n, 0);
      const random = (multiplier: number) => {
        const unit = a.mul(bits(s.random() | 0), randomScale), delta = a.sub(unit, one);
        return a.add(a.mul(unit, multiplier), a.mul(delta, multiplier));
      };
      const amplitude = random(bits(3));
      m.write32(m.read64(event + 192n) + BigInt(index) * 32n, amplitude);
      const phaseX = random(0x4048f5c3), phaseY = random(0x4048f5c3);
      // The sway pointer is fetched again after the two phase callbacks.
      m.bytes(m.read64(event + 192n) + BigInt(index) * 32n + 16n, 16).set(bytes([phaseX, phaseY, 0, 0]));
      objects = m.read64(event + 64n); if ((index + 1) >>> 0 >= m.read32(objects + 16n)) break;
    }
  }
  if (!m.bytes(event + 160n, 1)[0]) {
    m.write8(event + 224n, 1);
    const time = m.read64(game + 0x160n), out = new DataView(m.bytes(event + 232n, 8).buffer, m.bytes(event + 232n, 8).byteOffset, 8);
    out.setFloat64(0, value(m.read32(time + 36n)), true);
  }
}
/** Whole Finish 0x100484a70. A networked event keeps its network state. */
export function finishOriginalMoveObjectAlongRail(m: ModelBakeMemory, event: bigint): void {
  if (!m.bytes(event + 160n, 1)[0]) m.write8(event + 224n, 0);
}
