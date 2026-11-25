import type { OriginalEventSlot } from './event-barn-runtime';
import { dispatchOriginalFloatMultVirtual } from './float-mult-event-runtime';
import { executeFloatAdd, type FloatCell } from './object-numeric-runtime';
import { resetSetFloat, updateSetFloat } from './set-float-runtime';

export interface OriginalNumericEventServices {
  resolveFloat(pointer: bigint): FloatCell;
  startEvent(): void;
  frame(): number;
  math: { logf(value: number): number; expf(value: number): number };
  resolveDualNaN?: (a: number, b: number) => number;
}
/** Actual derived vtable dispatch using the loaded Event body. Scheduling
 * remains in EventBarn; one-shot updates call Start through the same Barn. */
export function dispatchOriginalNumericEventVirtual(kind: 'FloatMult' | 'FloatAdd' | 'SetFloat',
  slot: OriginalEventSlot, event: Uint8Array, s: OriginalNumericEventServices): void {
  if (kind === 'FloatMult') return dispatchOriginalFloatMultVirtual(slot, event, s.resolveFloat, s.resolveDualNaN);
  const v = new DataView(event.buffer, event.byteOffset, event.byteLength);
  const target = () => s.resolveFloat(v.getBigUint64(kind === 'FloatAdd' ? 0x38 : 0x40, true));
  if (kind === 'FloatAdd' && slot === 0x48) {
    const amount = v.getBigUint64(0x40, true), output = v.getBigUint64(0x48, true);
    executeFloatAdd({ target: target(), amountFloat: amount ? s.resolveFloat(amount) : null,
      output: output ? s.resolveFloat(output) : null, amountBits: v.getUint32(0x50, true),
      minimumBits: v.getUint32(0x54, true), maximumBits: v.getUint32(0x58, true),
      useMinimum: !!event[0x5c], useMaximum: !!event[0x5d], everyFrame: !!event[0x5e] }, s.startEvent, s.resolveDualNaN);
    return;
  }
  if (kind === 'SetFloat') {
    if (slot === 0x10) { v.setBigUint64(0x4c, 0n, true); return; }
    if (slot === 0x30 || slot === 0x38) { resetSetFloat(event, target()); return; }
    if (slot === 0x48) { updateSetFloat(event, target(), s.frame(), s.math, s.startEvent); return; }
  }
  if (![0, 0x10, 0x18, 0x30, 0x38, 0x40].includes(slot)) throw new Error('Unrestored numeric Event virtual slot');
}
