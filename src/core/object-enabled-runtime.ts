import { findNativeMetaClassById, NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';

const compare = (a: Uint8Array, b: Uint8Array): number => {
  for (let i = 0; ; i++) { const x = a[i] ?? 0, y = b[i] ?? 0; if (x !== y || !x) return x - y; }
};
export interface NativeMethodLookupServices {
  callParentGetter(getter: bigint): bigint;
  cachedLookup(table: bigint, name: Uint8Array): bigint;
}
/** Whole 0x1004d2330 control flow. Pointer-keyed cache implementation remains
 * an explicit service. Uncached lookup is case-sensitive and nearest-base;
 * null method entries fall through. Both parent-getter calls are retained. */
export function findNativeObjectMethod(m: NativeObjectMemory, meta: bigint, name: Uint8Array, cached: boolean, s: NativeMethodLookupServices): bigint {
  for (;;) {
    const table = m.read64(meta + 0x50n); let method = 0n;
    if (cached) method = s.cachedLookup(table, name);
    else {
      const end = table + 8n; let node = m.read64(end), candidate = end;
      while (node) { const lower = compare(m.string(m.read64(node + 0x20n)), name) >= 0;
        if (lower) candidate = node; node = m.read64(node + (lower ? 0n : 8n)); }
      if (candidate !== end && compare(name, m.string(m.read64(candidate + 0x20n))) >= 0) method = m.read64(candidate + 0x28n);
    }
    if (method) return method;
    let getter = m.read64(meta + 0x30n); if (!getter) return 0n;
    s.callParentGetter(getter); getter = m.read64(meta + 0x30n);
    meta = getter ? s.callParentGetter(getter) : 0n;
  }
}
export interface NativeObjectEnabledServices extends NativeMethodLookupServices {
  registry: bigint;
  cacheEnabled(): boolean;
  asClass(type: bigint): bigint;
  fallbackClass(): bigint;
  objectPointerType(): bigint;
  boolType(): bigint;
  voidType(): bigint;
  receiverType(method: bigint): bigint;
  castReceiver(type: bigint, object: bigint, source: bigint): bigint;
  invoke(method: bigint, receiver: bigint, resultType: bigint, argument: boolean | null): boolean;
}
function methodFor(m: NativeObjectMemory, object: bigint, name: string, s: NativeObjectEnabledServices): bigint {
  const meta = s.asClass(findNativeMetaClassById(m, s.registry, m.read32(object))) || s.fallbackClass();
  return findNativeObjectMethod(m, meta, new TextEncoder().encode(name), s.cacheEnabled(), s);
}
function receiverFor(method: bigint, object: bigint, source: bigint, s: NativeObjectEnabledServices): bigint {
  const receiver = s.castReceiver(s.receiverType(method), object, source);
  if (!receiver) throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h', 1091, 3, 'c');
  return receiver;
}
/** Whole ObjectFactory helpers 0x1004d1f60/0x1004d2050. Metadata receiver cast
 * gets Object* value storage; wrappers perform their own scalar conversion. */
export function setNativeObjectEnabled(m: NativeObjectMemory, object: bigint, enabled: boolean, s: NativeObjectEnabledServices): void {
  if (!object) return; const method = methodFor(m, object, 'SetEnabled', s); if (!method) return;
  s.boolType(); const source = s.objectPointerType(), result = s.voidType();
  s.invoke(method, receiverFor(method, object, source, s), result, enabled);
}
export function getNativeObjectEnabled(m: NativeObjectMemory, object: bigint, s: NativeObjectEnabledServices): boolean {
  if (!object) return true; const method = methodFor(m, object, 'GetEnabled', s); if (!method) return true;
  const source = s.objectPointerType(), result = s.boolType();
  return !!s.invoke(method, receiverFor(method, object, source, s), result, null);
}
