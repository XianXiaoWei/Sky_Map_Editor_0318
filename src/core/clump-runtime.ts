import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import type { NativeEventBarnMemory } from './native-event-barn-runtime';

export const NATIVE_CLUMP_CAPACITY = 1280;
export interface NativeClumpServices {
  classId: number;
  allocationLabel: bigint;
  allocate(heap: bigint, bytes: bigint, label: bigint, alignment: bigint): bigint;
  release(heap: bigint, data: bigint): void;
  clearHeap(heap: bigint): void;
  zero(data: bigint, bytes: bigint): void;
}
/** Whole placement 0x10022c2d0. Occupancy and padding are Barn-owned. */
export function constructNativeClump(m: NativeEventBarnMemory, object: bigint, classId: number): void {
  m.write32(object, classId); m.write64(object + 8n, 0n);
  m.write32(object + 0x10n, 0); m.write64(object + 0x18n, 0n);
}
/** 0x10022bdc0 preserves Heap/unused member bytes, clears occupancy and links
 * all embedded nodes from the last to the first. */
export function initializeNativeClumpBarn(m: NativeEventBarnMemory, barn: bigint): void {
  for (let i = 0; i < NATIVE_CLUMP_CAPACITY; i++) m.write8(barn + 0x2007cn + BigInt(i * 32), 0);
  let head = 0n;
  for (let i = NATIVE_CLUMP_CAPACITY - 1; i >= 0; i--) {
    const node = barn + 0x20068n + BigInt(i * 32);
    m.write64(node, head); head = node;
  }
  m.write64(barn + 0x2a068n, head);
}
/** Whole zero-count CreateClump 0x10022bf80 and counted overload 0x10022c000.
 * Popping a node precedes array allocation; allocation failure has no rollback. */
export function createNativeBarnClump(m: NativeEventBarnMemory, barn: bigint, s: NativeClumpServices, count = 0): bigint {
  const node = m.read64(barn + 0x2a068n);
  if (!node) throw new NativeObjectFoundationFailure('Clump.cpp', 153, 3, 'newClump');
  m.write64(barn + 0x2a068n, m.read64(node));
  m.write32(node, s.classId); m.write64(node + 8n, 0n); m.write32(node + 0x10n, 0);
  m.write8(node + 0x14n, 1); m.write64(node + 0x18n, barn + 0x10n);
  const n = count >>> 0;
  if (n) {
    m.write32(node + 0x10n, n);
    const data = s.allocate(barn + 0x10n, BigInt(n) * 8n, s.allocationLabel, 16n);
    const bytes = BigInt(m.read32(node + 0x10n)) * 8n;
    m.write64(node + 8n, data); s.zero(data, bytes);
  }
  return node;
}
/** Whole 0x10022b840. Even an unchanged count requires a valid Heap. Changed
 * counts discard all old members; zero receives the native bzero(null,0). */
export function allocateNativeClumpData(m: NativeEventBarnMemory, object: bigint, count: number, s: NativeClumpServices): void {
  const heap = m.read64(object + 0x18n), n = count >>> 0;
  if (!heap) throw new NativeObjectFoundationFailure('Clump.cpp', 34, 3, 'm_heap');
  if (m.read32(object + 0x10n) === n) return;
  const old = m.read64(object + 8n); if (old) s.release(heap, old);
  m.write32(object + 0x10n, n);
  const data = n ? s.allocate(m.read64(object + 0x18n), BigInt(n) * 8n, s.allocationLabel, 16n) : 0n;
  const bytes = n ? BigInt(m.read32(object + 0x10n)) * 8n : 0n;
  m.write64(object + 8n, data); s.zero(data, bytes);
}
/** 0x10022bd60 frees null data too when a Heap exists; it retains that Heap. */
export function destroyNativeClumpData(m: NativeEventBarnMemory, object: bigint, s: NativeClumpServices): void {
  const heap = m.read64(object + 0x18n); if (heap) s.release(heap, m.read64(object + 8n));
  m.write64(object + 8n, 0n); m.write32(object + 0x10n, 0);
}
/** 0x10022c0c0. Repeated/null release is ignored by the occupied-byte gate. */
export function releaseNativeBarnClump(m: NativeEventBarnMemory, barn: bigint, object: bigint, s: NativeClumpServices): void {
  if (!object || !m.read8(object + 0x14n)) return;
  destroyNativeClumpData(m, object, s); m.write8(object + 0x14n, 0);
  m.write64(object, m.read64(barn + 0x2a068n)); m.write64(barn + 0x2a068n, object);
}
/** 0x10022bee0 releases occupied nodes in ascending order, then clears Heap. */
export function unloadNativeClumpBarn(m: NativeEventBarnMemory, barn: bigint, s: NativeClumpServices): void {
  for (let i = 0; i < NATIVE_CLUMP_CAPACITY; i++) releaseNativeBarnClump(m, barn, barn + 0x20068n + BigInt(i * 32), s);
  s.clearHeap(barn + 0x10n);
}
/** 0x10022b7f0 reloads count and data after each reflected member call. There
 * is no aggregate Clump GetEnabled: Object's missing-method default applies. */
export function setNativeClumpEnabled(m: NativeEventBarnMemory, object: bigint, enabled: boolean, setEnabled: (object: bigint, enabled: boolean) => void): void {
  for (let i = 0; i < m.read32(object + 0x10n); i++) setEnabled(m.read64(m.read64(object + 8n) + BigInt(i) * 8n), enabled);
}
