import { NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';

export const NATIVE_VALUE_BARN_CAPACITY = 80;
export interface NativeValueBarnServices {
  valuePointerType: bigint;
  allocationLabel: bigint;
  size(meta: bigint): bigint;
  alignment(meta: bigint): bigint;
  allocate(heap: bigint, size: bigint, label: bigint, alignment: bigint): bigint;
  constructInPlace(meta: bigint, storage: bigint): bigint;
  castValue(meta: bigint, storage: bigint, source: bigint): bigint;
  release(heap: bigint, value: bigint): void;
  clearHeap(heap: bigint): void;
}
function clearSlots(memory: NativeObjectMemory, barn: bigint): void {
  for (let i = 0; i < NATIVE_VALUE_BARN_CAPACITY; i++) memory.write64(barn + 0x10n + BigInt(i) * 8n, 0n);
}
function linkSlots(memory: NativeObjectMemory, barn: bigint): void {
  // The native unrolled stores run from the last slot down to the first.
  for (let i = NATIVE_VALUE_BARN_CAPACITY - 1; i >= 0; i--) {
    const slot = barn + 0x10n + BigInt(i) * 8n;
    memory.write64(slot, i === NATIVE_VALUE_BARN_CAPACITY - 1 ? 0n : slot + 8n);
  }
  memory.write64(barn + 0x290n, barn + 0x10n);
}
/** 0x100715760 initializes the fixed slot chain, preserving the Module and
 * Heap bytes. The original intermediate 0x100011c10 body is an empty return. */
export function initializeNativeValueBarn(memory: NativeObjectMemory, barn: bigint): void {
  clearSlots(memory, barn); linkSlots(memory, barn);
}
/** 0x100716250 removes the free slot before size/alignment/allocation calls.
 * Float placement retains allocator bytes. Cast failure leaves the popped
 * slot null; the original has no rollback or constructor-supplied value. */
export function createNativeBarnValue(memory: NativeObjectMemory, barn: bigint, meta: bigint, services: NativeValueBarnServices): bigint {
  const slot = memory.read64(barn + 0x290n);
  if (!slot) throw new NativeObjectFoundationFailure('Value.cpp', 74, 3, 'value');
  memory.write64(barn + 0x290n, memory.read64(slot));
  memory.write64(slot, 0n);
  const size = services.size(meta), label = services.allocationLabel, alignment = services.alignment(meta);
  const allocation = services.allocate(barn + 0x298n, size, label, alignment);
  const constructed = services.constructInPlace(meta, allocation);
  const value = services.castValue(services.valuePointerType, constructed, meta);
  memory.write64(slot, value);
  if (!value) throw new NativeObjectFoundationFailure('Value.cpp', 79, 3, '*value');
  memory.write64(value + 8n, slot);
  return memory.read64(slot);
}
/** 0x100716360 does nothing for null Value or null backlink. Otherwise it
 * returns the slot to the chain before releasing storage, retaining backlink. */
export function releaseNativeBarnValue(memory: NativeObjectMemory, barn: bigint, value: bigint, services: NativeValueBarnServices): void {
  if (!value) return;
  const slot = memory.read64(value + 8n);
  if (!slot) return;
  memory.write64(slot, memory.read64(barn + 0x290n));
  memory.write64(barn + 0x290n, slot);
  services.release(barn + 0x298n, value);
}
/** 0x100715cd0 clears slot storage before clearing the Heap, then rebuilds
 * all 80 links. This branch does not dispatch individual value destructors. */
export function unloadNativeValueBarn(memory: NativeObjectMemory, barn: bigint, services: NativeValueBarnServices): void {
  clearSlots(memory, barn); services.clearHeap(barn + 0x298n); linkSlots(memory, barn);
}
