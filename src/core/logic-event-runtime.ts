import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { executeIfEnabled } from './object-flow-runtime';
import type { FloatClump } from './object-numeric-runtime';
import type { OriginalEventSlot } from './event-barn-runtime';

export function constructOriginalEnable(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 72) throw new Error('Original Enable storage truncated');
  constructOriginalEvent(storage, metadata); const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100c14d60n, true);
  v.setBigUint64(0x38, 0n, true); v.setUint8(0x42, 0);
}
export function constructOriginalIfEnabled(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 88) throw new Error('Original IfEnabled storage truncated');
  constructOriginalEvent(storage, metadata); const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100d0c658n, true);
}
export function constructOriginalResumeEnable(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 64) throw new Error('Original ResumeEnable storage truncated');
  constructOriginalEvent(storage, metadata); const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100c19300n, true); v.setBigUint64(0x38, 0n, true);
}
/** Whole ResumeEnable Update 0x10058a9e0, with original Clump resume supplied
 * by its memory adapter. Enable's checkpoint method 0x100316400 requests
 * ordinary enable, independently of the saved enable/killEvents fields. */
export function updateOriginalResumeEnable(event: Uint8Array, game: bigint, resumeClump: (clump: bigint, game: bigint) => void, startEvent: () => void): void {
  resumeClump(new DataView(event.buffer, event.byteOffset, event.byteLength).getBigUint64(0x38, true), game); startEvent();
}
export interface OriginalLogicEventServices {
  resolveClump(pointer: bigint): FloatClump;
  castObject(value: unknown): bigint;
  castEvent(object: bigint): Uint8Array | null;
  setEnabled(object: bigint, enabled: boolean): void;
  getEnabled(object: bigint): boolean;
  resumeEvent(event: Uint8Array): void;
  startEvent(): void;
}
/** Whole Enable Update 0x1003162f0, including Object cast assertion, Event
 * cast even with killEvents=false, reloaded Clump and retained stop order. */
export function dispatchOriginalLogicEventVirtual(kind: 'Enable' | 'IfEnabled', slot: OriginalEventSlot, event: Uint8Array, s: OriginalLogicEventServices): void {
  if (slot !== 0x48) {
    if (![0, 0x10, 0x18, 0x30, 0x38, 0x40].includes(slot)) throw new Error('Unrestored logic Event virtual slot');
    return;
  }
  const v = new DataView(event.buffer, event.byteOffset, event.byteLength), objects = () => s.resolveClump(v.getBigUint64(0x38, true));
  if (kind === 'IfEnabled') {
    executeIfEnabled({ objects, events: () => s.resolveClump(v.getBigUint64(0x48, true)),
      getEnabled: value => s.getEnabled(s.castObject(value)), setEnabled: (value, enabled) => s.setEnabled(s.castObject(value), enabled),
      startEvent: s.startEvent, triggerOnDisabled: () => !!event[0x40], checkOnce: () => !!event[0x50] });
    return;
  }
  let clump = objects();
  for (let i = 0; i < clump.count(); i++) {
    const object = s.castObject(clump.member(i));
    if (!object) throw new NativeObjectFoundationFailure('./Clump.h', 71, 3, 'ret');
    s.setEnabled(object, !!event[0x40]);
    const target = s.castEvent(object); if (target && event[0x41]) s.resumeEvent(target);
    clump = objects();
  }
  event[0x42] = 1; s.startEvent();
}
