import type { OriginalEventSlot } from './event-barn-runtime';
import { executeFloatMult, type FloatCell } from './object-numeric-runtime';

/** FloatMult's original vtable: base load/unload/transition/destruction bodies
 * are no-ops, while +0x48 executes 0x1007191a0. Pointer fields are read from the
 * Event body (Object* is body+8), after the loader has resolved references. */
export function dispatchOriginalFloatMultVirtual(slot: OriginalEventSlot, event: Uint8Array,
  resolveFloat: (pointer: bigint) => FloatCell, resolveDualNaN?: (a: number, b: number) => number): void {
  if (slot === 0x48) {
    const state = new DataView(event.buffer, event.byteOffset, event.byteLength);
    const a = resolveFloat(state.getBigUint64(0x38, true)), b = resolveFloat(state.getBigUint64(0x40, true));
    executeFloatMult(a, b, resolveFloat(state.getBigUint64(0x48, true)), resolveDualNaN);
    return;
  }
  if (![0, 0x10, 0x18, 0x30, 0x38, 0x40].includes(slot)) throw new Error('Unrestored FloatMult virtual slot');
}
