import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import type { OriginalEventSlot } from './event-barn-runtime';
import { executeFloatSplit, numericFloatValue, readFloatCell, type FloatCell, type FloatClump } from './object-numeric-runtime';
import { NativeStringLengthError, type NativeStringMemory, type NativeStringPoolServices } from './native-string-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';

const view = (b: Uint8Array) => new DataView(b.buffer, b.byteOffset, b.byteLength);
export function constructOriginalFloatSplit(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 72) throw new Error('Original FloatSplit storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = view(storage); v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100d0c298n, true);
}
export function constructOriginalOnFloat(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 192) throw new Error('Original OnFloat storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = view(storage); v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100d0d3f8n, true);
  storage.fill(0, 0x60, 0x78);
}

/** The three inlined OnFloat string-copy paths share these exact operations.
 * Short strings copy all 24 descriptor bytes, including unused tail bytes.
 * Long-to-short copies begin with a zero descriptor; long copies allocate the
 * original (length + 16) & ~15 bytes and retain the original length limit. */
export function copyOriginalOnFloatString(source: Uint8Array, memory: NativeStringMemory, pool: NativeStringPoolServices): Uint8Array {
  const out = new Uint8Array(24), v = view(source), target = view(out);
  if (!(source[0] & 1)) { out.set(source.subarray(0, 24)); return out; }
  const length = v.getBigUint64(8, true), data = v.getBigUint64(16, true);
  if (length >= 0xff1n) throw new NativeStringLengthError();
  if (length < 23n) {
    out[0] = Number(length) * 2;
    for (let i = 0; i < Number(length); i++) out[i + 1] = memory.read8(data + BigInt(i));
  } else {
    const bytes = (length + 16n) & ~15n, copy = pool.allocate(pool.getPool(), bytes);
    memory.copy(copy, data, Number(length)); memory.write8(copy + length, 0);
    target.setBigUint64(0, bytes | 1n, true); target.setBigUint64(8, length, true); target.setBigUint64(16, copy, true);
  }
  return out;
}
export function releaseOriginalOnFloatString(string: Uint8Array, pool: NativeStringPoolServices): void {
  if (string[0] & 1) pool.release(pool.getPool(), view(string).getBigUint64(16, true));
}
export interface OriginalFloatConditionServices {
  memory: NativeStringMemory;
  pool: NativeStringPoolServices;
  resolveFloat(pointer: bigint): FloatCell;
  resolveOnFloat(pointer: bigint): Uint8Array;
  resolveClump(pointer: bigint): FloatClump;
  castFloat(member: unknown): FloatCell | null;
  setEnabled(object: bigint, enabled: boolean): void;
  startEvent(): void;
  debugValue(bits: number): void;
}
function compareOriginalOnFloat(value: number, condition: number, operator: number): boolean {
  if (operator === 0 && value > condition) return true;
  if (operator === 1 && value >= condition) return true;
  if (operator === 2 && value < condition) return true;
  if (operator === 3 && value <= condition) return true;
  return operator === 4 && Math.abs(Math.fround(value - condition)) < 0.0001;
}
/** Whole normal Evaluate 0x10071a140, including both recursive evaluations.
 * Debug output uses an explicit stream service; exception unwind and allocator
 * internals remain caller dependencies. Native recursion has no depth guard. */
export function evaluateOriginalOnFloat(event: Uint8Array, debugName: Uint8Array, s: OriginalFloatConditionServices): boolean {
  const v = view(event);
  const condition = (scalar: number, float: number, operator: number, nested: number, invert: number): boolean => {
    const other = v.getBigUint64(nested, true);
    if (other) {
      const negated = event[invert], copy = copyOriginalOnFloatString(debugName, s.memory, s.pool);
      const result = evaluateOriginalOnFloat(s.resolveOnFloat(other), copy, s);
      releaseOriginalOnFloatString(copy, s.pool);
      return negated !== Number(result);
    }
    const cell = v.getBigUint64(float, true);
    const rhs = cell ? numericFloatValue(readFloatCell(s.resolveFloat(cell))) : v.getFloat32(scalar, true);
    const lhs = numericFloatValue(readFloatCell(s.resolveFloat(v.getBigUint64(0x38, true))));
    return compareOriginalOnFloat(lhs, rhs, v.getUint32(operator, true));
  };
  const a = condition(0x78, 0x80, 0x88, 0x90, 0x98);
  const b = condition(0x9c, 0xa0, 0xa8, 0xb0, 0xb8);
  const op = v.getUint32(0xbc, true);
  const result = op === 0 ? a : op === 1 ? a && b : op === 2 ? a || b : false;
  if (event[0x58]) s.debugValue(readFloatCell(s.resolveFloat(v.getBigUint64(0x38, true))));
  return result;
}
export function dispatchOriginalFloatConditionVirtual(kind: 'FloatSplit' | 'OnFloat', slot: OriginalEventSlot, event: Uint8Array, s: OriginalFloatConditionServices): void {
  const v = view(event);
  if (slot === 0 && kind === 'OnFloat') {
    v.setBigUint64(0, 0x100d0d3f8n, true); releaseOriginalOnFloatString(event.subarray(0x60, 0x78), s.pool); return;
  }
  if (slot !== 0x48) {
    if (![0, 0x10, 0x18, 0x30, 0x38, 0x40].includes(slot)) throw new Error('Unrestored Float condition virtual slot');
    return;
  }
  if (kind === 'FloatSplit') {
    // Empty outputs never dereference input in the original body.
    const outputs = () => s.resolveClump(v.getBigUint64(0x40, true));
    const input: FloatCell = { get storage() { return s.resolveFloat(v.getBigUint64(0x38, true)).storage; } };
    try { executeFloatSplit(input, { outputs, castFloat: s.castFloat, startEvent: s.startEvent }); }
    catch (error) {
      if (error instanceof Error && error.message === 'Clump.h:54: idx < size') throw new NativeObjectFoundationFailure('./Clump.h', 54, 3, 'idx < size');
      if (error instanceof Error && error.message === 'Clump.h:71: ret') throw new NativeObjectFoundationFailure('./Clump.h', 71, 3, 'ret');
      throw error;
    }
    return;
  }
  const copy = copyOriginalOnFloatString(event.subarray(0x60, 0x78), s.memory, s.pool);
  const result = evaluateOriginalOnFloat(event, copy, s);
  releaseOriginalOnFloatString(copy, s.pool);
  const output = v.getBigUint64(result ? 0x48 : 0x50, true);
  if (output) { s.setEnabled(output, true); if (event[0x40]) s.startEvent(); }
  if (event[0x41]) s.startEvent();
}
