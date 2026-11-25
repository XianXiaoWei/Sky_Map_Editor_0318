import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import type { NativeEventBarnMemory as NativeObjectMemory } from './native-event-barn-runtime';

export const NATIVE_MARKER_CAPACITY = 1024;
export const NATIVE_MARKER_BYTES = 80;
const view = (b: Uint8Array) => new DataView(b.buffer, b.byteOffset, b.byteLength);

/** Whole Marker placement 0x10043e1b0. Transform, enabled and ID bytes are
 * retained; CreateMarker separately zeroes the pool slot before placement. */
export function constructNativeMarker(storage: Uint8Array, classId: number): void {
  if (storage.byteLength < NATIVE_MARKER_BYTES) throw new Error('Original Marker storage truncated');
  const v = view(storage); v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100cc6250n, true);
}
export function setNativeMarkerEnabled(storage: Uint8Array, enabledByte: number): void { storage[0x40] = enabledByte & 255; }
export function getNativeMarkerEnabledByte(storage: Uint8Array): number { return storage[0x40]; }

/** Whole MarkerBarn placement 0x10043eaa0; bitmap contents and next ID are
 * startup/Initialize responsibilities, rather than constructor defaults. */
export function constructNativeMarkerBarn(m: NativeObjectMemory, barn: bigint, classId: number): void {
  m.write32(barn, classId); m.write64(barn + 0x10n, 0x8000000400n); m.write32(barn + 0x18n, 0);
  m.write64(barn + 0x20n, barn + 0x30n); m.write64(barn + 0x28n, barn + 0xb0n);
}
export function initializeNativeMarkerBarn(m: NativeObjectMemory, barn: bigint): void { m.write32(barn + 0x140b0n, 0); }
const poolFailure = (line: number, expression: string): never => {
  throw new NativeObjectFoundationFailure('../../../Code/Base/ObjectPool.h', line, 4, expression);
};
/** Whole CreateMarker 0x10043d6a0. Uses first free bitmap bit, zeroes exactly
 * 80 bytes, assigns a monotonically increasing ID and ignores the meta arg. */
export function createNativeBarnMarker(m: NativeObjectMemory, barn: bigint, classId: number): bigint {
  const count = m.read32(barn + 0x18n);
  if (count >= m.read32(barn + 0x10n)) poolFailure(71, 'm_count < kCapacity');
  m.write32(barn + 0x18n, (count + 1) >>> 0);
  const bits = m.read64(barn + 0x20n); let word = 0;
  while (m.read32(bits + BigInt(word * 4)) === 0xffffffff) word++;
  const old = m.read32(bits + BigInt(word * 4)); let bit = 0;
  while (old & (1 << bit)) bit++;
  m.write32(bits + BigInt(word * 4), (old | (1 << bit)) >>> 0);
  const object = m.read64(barn + 0x28n) + BigInt((word * 32 + bit) * NATIVE_MARKER_BYTES);
  for (let i = 0; i < NATIVE_MARKER_BYTES; i++) m.write8(object + BigInt(i), 0);
  m.write32(object + 8n, classId); m.write64(object, 0x100cc6250n);
  const id = m.read32(barn + 0x140b0n); m.write32(barn + 0x140b0n, (id + 1) >>> 0); m.write32(object + 0x44n, id);
  return object;
}
export interface NativeMarkerPoolServices { destroy(object: bigint): void; }
/** Whole ReleaseMarker 0x10043d7a0 including original signed shift/multiply
 * index calculation. Null and already-free slots leave the pool intact. */
export function releaseNativeBarnMarker(m: NativeObjectMemory, barn: bigint, object: bigint, s: NativeMarkerPoolServices): void {
  if (!object) return;
  const data = m.read64(barn + 0x28n), delta = BigInt.asIntN(64, object - data);
  if (delta <= -80n) poolFailure(65, 'idx >= 0');
  const index = Number(BigInt.asUintN(32, (delta >> 4n) * 0xcccccccccccccccdn));
  if (index >= m.read32(barn + 0x10n)) poolFailure(57, 'idx < kCapacity');
  const at = m.read64(barn + 0x20n) + BigInt((index >>> 5) * 4), mask = 1 << (index & 31), old = m.read32(at);
  if (!(old & mask)) return;
  m.write32(at, (old & ~mask) >>> 0); s.destroy(data + BigInt(index * NATIVE_MARKER_BYTES));
  m.write32(barn + 0x18n, (m.read32(barn + 0x18n) - 1) >>> 0);
}
/** Normal OnLevelUnload/Terminate traversals with a stable original pool.
 * Derived destructor callbacks that mutate capacity/bitmap are not restored. */
export function unloadNativeMarkerBarn(m: NativeObjectMemory, barn: bigint, s: NativeMarkerPoolServices, terminate = false): void {
  const capacity = m.read32(barn + 0x10n);
  for (let i = 0; i < capacity; i++) {
    const at = m.read64(barn + 0x20n) + BigInt((i >>> 5) * 4);
    if (m.read32(at) & (1 << (i & 31))) releaseNativeBarnMarker(m, barn, m.read64(barn + 0x28n) + BigInt(i * NATIVE_MARKER_BYTES), s);
  }
  if (!terminate) initializeNativeMarkerBarn(m, barn);
}
