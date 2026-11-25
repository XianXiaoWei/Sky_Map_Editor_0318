import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import type { OriginalEventSlot } from './event-barn-runtime';
import type { FloatClump } from './object-numeric-runtime';

/** Whole Delay placement 0x1002c62f0. Flags and elapsed/index remain untouched
 * until saved fields, prepared defaults and enable/resume initialize them. */
export function constructOriginalDelay(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 80) throw new Error('Original Delay storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100ca5700n, true);
  v.setUint32(0x38, 0, true); v.setBigUint64(0x40, 0n, true);
}

export interface OriginalDelayServices {
  frame(): number;
  onBeat(): boolean;
  resolveClump(pointer: bigint): FloatClump;
  castObject(value: unknown): bigint;
  setEnabled(object: bigint, enabled: boolean): void;
  startEvent(): void;
}

/** Complete enable/resume 0x1002c6410/420 and Update 0x1002c6430.
 * Frame delays compare before incrementing; staggered output resets elapsed
 * after each member and completes before enabling the last member. */
export function dispatchOriginalDelayVirtual(slot: OriginalEventSlot, event: Uint8Array, s: OriginalDelayServices): void {
  const v = new DataView(event.buffer, event.byteOffset, event.byteLength);
  if (slot === 0x30 || slot === 0x38) { v.setBigUint64(0x48, 0n, true); return; }
  if (slot !== 0x48) {
    if (![0, 0x10, 0x18, 0x40].includes(slot)) throw new Error('Unrestored Delay virtual slot');
    return;
  }
  const f = Math.fround;
  v.setFloat32(0x48, f((event[0x3e] ? 0 : s.frame()) + v.getFloat32(0x48, true)), true);
  const elapsed = v.getFloat32(0x48, true), delay = v.getFloat32(0x38, true);
  const group = () => s.resolveClump(v.getBigUint64(0x40, true));
  const enable = (clump: FloatClump, i: number) => {
    const object = s.castObject(clump.member(i));
    if (!object) throw new NativeObjectFoundationFailure('./Clump.h', 71, 3, 'ret');
    s.setEnabled(object, true);
  };
  // Native UCOMISS takes the below branch for unordered operands too.
  if (elapsed >= delay && (!event[0x3d] || s.onBeat())) {
    let clump = group();
    if (!event[0x3c] || v.getUint32(0x4c, true) === ((clump.count() - 1) >>> 0)) {
      s.startEvent(); clump = group();
    }
    if (event[0x3c]) {
      const i = v.getUint32(0x4c, true);
      if (i >= clump.count()) throw new NativeObjectFoundationFailure('./Clump.h', 54, 3, 'idx < size');
      enable(clump, i);
      v.setUint32(0x4c, (v.getUint32(0x4c, true) + 1) >>> 0, true);
      v.setFloat32(0x48, 0, true);
    } else {
      for (let i = 0; i < clump.count(); i++) { enable(clump, i); clump = group(); }
    }
  }
  v.setFloat32(0x48, f((event[0x3e] ? 1 : 0) + v.getFloat32(0x48, true)), true);
}
