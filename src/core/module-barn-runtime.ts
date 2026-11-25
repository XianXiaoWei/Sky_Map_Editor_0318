import { NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';

export interface NativeModuleDispatchServices {
  voidType: bigint;
  receiverType(method: bigint): bigint;
  castReceiver(type: bigint, storage: bigint, source: bigint): bigint;
  callOverride(thunk: bigint, context: bigint, contextType: bigint, storage: bigint, source: bigint): void;
  invoke(method: bigint, receiver: bigint, resultType: bigint, argumentsAddress: bigint, argumentCount: number): void;
}
function compareNames(a: Uint8Array, b: Uint8Array): number {
  for (let i = 0; ; i++) { const av = a[i] ?? 0, bv = b[i] ?? 0; if (av !== bv || av === 0) return av - bv; }
}
/** 0x1007b1b40 consumes the function table built by ModuleBarn. Table records
 * are 56 bytes and their dispatch entries 32 bytes. This implements both
 * directions, mode filtering and reflected/one-shot override branches.
 * Names longer than 31 bytes reach an unterminated native stack buffer; that
 * undefined-input branch is excluded rather than inventing a string rule.
 */
export function dispatchNativeModules(memory: NativeObjectMemory, barn: bigint, name: Uint8Array, modeMask: number, reverse: boolean, services: NativeModuleDispatchServices): void {
  const nul = name.indexOf(0), query = nul < 0 ? name : name.subarray(0, nul);
  if (query.length > 31) throw new RangeError('Native ModuleBarn dispatch name must fit its 32-byte C string buffer');
  let first = memory.read64(barn + 0x40n), length = memory.read32(barn + 0x48n);
  const end = first + BigInt(length) * 0x38n;
  while (length) {
    const half = Math.floor(length / 2), middle = first + BigInt(half) * 0x38n;
    if (compareNames(memory.string(middle), query) < 0) { first = middle + 0x38n; length -= half + 1; }
    else length = half;
  }
  if (first === end || compareNames(memory.string(first), query) !== 0) {
    throw new NativeObjectFoundationFailure('Module.cpp', 263, 4, 'fs != fsEnd && strcmp( fs->name, name ) == 0');
  }
  const group = first;
  let count = memory.read32(group + 0x30n), processed = 0;
  while (processed < count) {
    const index = reverse ? (count - 1 - processed) >>> 0 : processed;
    const entry = memory.read64(group + 0x28n) + BigInt(index) * 32n;
    const descriptor = memory.read64(entry);
    const modeFiltered = memory.read32(barn + 0x578n) & 0xff;
    const modeMatches = !modeFiltered || (memory.read32(memory.read64(descriptor + 0x18n) + 8n) & (modeMask >>> 0)) !== 0;
    if (modeMatches) {
      const thunk = memory.read64(entry + 0x18n);
      if (thunk) {
        services.callOverride(thunk, memory.read64(barn + 0x10n), memory.read64(barn + 0x18n), memory.read64(descriptor), memory.read64(descriptor + 8n));
        // Native clears the captured entry even if its callback replaces it.
        memory.write64(entry + 0x18n, 0n);
      } else {
        const method = memory.read64(entry + 8n), storage = memory.read64(descriptor), source = memory.read64(descriptor + 8n);
        const args = memory.read64(entry + 0x10n), argumentCount = memory.read32(method + 0x30n);
        const receiver = services.castReceiver(services.receiverType(method), storage, source);
        if (!receiver) throw new NativeObjectFoundationFailure('../../Code/Base/Meta.h', 1091, 3, 'c');
        services.invoke(method, receiver, services.voidType, args, argumentCount);
      }
    }
    processed = (processed + 1) >>> 0;
    count = memory.read32(group + 0x30n);
  }
}
