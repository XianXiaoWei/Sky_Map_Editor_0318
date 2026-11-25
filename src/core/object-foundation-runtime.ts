/** Original Meta.cpp and Float metadata construction bodies. Registry memory,
 * virtual conversions, allocation and metadata initialization are explicit
 * dependencies. A class with no serialized references still depends on these.
 */
export class NativeObjectFoundationFailure extends Error {
  constructor(public readonly file: string, public readonly line: number, public readonly severity: number, public readonly expression: string) {
    super(`${file}:${line}: ${expression}`);
  }
}
const fail = (file: string, line: number, severity: number, expression: string): never => { throw new NativeObjectFoundationFailure(file, line, severity, expression); };
export interface NativeObjectMemory {
  read32(address: bigint): number;
  read64(address: bigint): bigint;
  write64(address: bigint, value: bigint): void;
  string(address: bigint): Uint8Array;
}
export function findNativeMetaClassById(memory: NativeObjectMemory, registry: bigint, id: number): bigint {
  const n = id >>> 0;
  if (n >= 1280) fail('Meta.cpp', 135, 4, 'id < MetaClass::kMaxClasses');
  return memory.read64(registry + 0x98n + BigInt(n) * 8n);
}
function strcmp(a: Uint8Array, b: Uint8Array): number {
  for (let i = 0; ; i++) { const av = a[i] ?? 0, bv = b[i] ?? 0; if (av !== bv || av === 0) return av - bv; }
}
/** Case-sensitive path of 0x1007abc80. The case-insensitive branch is a
 * separate original dependency and must not be silently approximated. */
export function findNativeMetaClassByName(memory: NativeObjectMemory, registry: bigint, name: Uint8Array): bigint {
  const end = registry + 0x70n; let node = memory.read64(end), candidate = end;
  while (node) {
    const comparison = strcmp(memory.string(memory.read64(node + 0x20n)), name);
    if (comparison >= 0) candidate = node;
    node = memory.read64(node + (comparison >= 0 ? 0n : 8n));
  }
  if (candidate === end || strcmp(name, memory.string(memory.read64(candidate + 0x20n))) < 0) return 0n;
  return memory.read64(candidate + 0x28n);
}
export interface ObjectVtableServices {
  registry: bigint;
  nullObjectType: bigint;
  asClass(type: bigint): bigint;
  isAbstract(meta: bigint): boolean;
  isPolymorphic(meta: bigint): boolean;
  construct(meta: bigint): bigint;
  destroy(meta: bigint, instance: bigint): void;
  castObject(meta: bigint, object: bigint): bigint;
}
/** 0x1007abd80 repairs a deserialized vptr. It does not run Object::Update.
 * Cache initialization precedes destruction; cast receives the original
 * Object subobject, which may be null. Scalar Float is nonpolymorphic.
 */
export function restoreNativeObjectVtable(memory: NativeObjectMemory, object: bigint, services: ObjectVtableServices): void {
  const type = object ? findNativeMetaClassById(memory, services.registry, memory.read32(object)) : services.nullObjectType;
  let meta = services.asClass(type);
  if (!meta) meta = services.asClass(services.nullObjectType);
  if (services.isAbstract(meta) || !services.isPolymorphic(meta)) fail('Meta.cpp', 147, 3, '!mc.IsAbstract() && mc.IsPolymorphic()');
  if (!memory.read64(meta + 0x58n)) {
    const instance = services.construct(meta);
    memory.write64(meta + 0x58n, memory.read64(instance));
    services.destroy(meta, instance);
  }
  const destination = services.castObject(meta, object);
  memory.write64(destination, memory.read64(meta + 0x58n));
}
export const NATIVE_FLOAT_SIZE = 24;
/** Original placement construction writes only classId; the Value backlink,
 * value at +0x10, and padding are owned by allocation/loading, not defaults. */
export function constructNativeFloat(storage: Uint8Array, classId: number): void {
  if (storage.length < NATIVE_FLOAT_SIZE) throw new Error('Native Float storage truncated');
  new DataView(storage.buffer, storage.byteOffset, storage.byteLength).setUint32(0, classId >>> 0, true);
}
export function allocateNativeFloat(classId: number, allocate: (size: number) => Uint8Array): Uint8Array {
  const storage = allocate(NATIVE_FLOAT_SIZE); constructNativeFloat(storage, classId); return storage;
}
export function releaseNativeFloat(object: bigint, release: (object: bigint) => void): void { if (object) release(object); }

export interface ObjectFactoryServices {
  registry: bigint;
  objectType: bigint;
  callParentGetter(getter: bigint): bigint;
  receiverType(method: bigint): bigint;
  cast(type: bigint, value: bigint, sourceType: bigint): bigint;
  invoke(method: bigint, receiver: bigint, argument: bigint | null): bigint;
}
/** ObjectFactory's pointer-keyed tree selects the nearest registered factory
 * in the inheritance chain. Parent getter calls are deliberately retained:
 * the original calls once before re-reading and calling the getter again. */
function findNativeObjectFactory(memory: NativeObjectMemory, factory: bigint, requested: bigint, services: ObjectFactoryServices): bigint {
  const end = factory + 0x20n; let type = requested;
  for (;;) {
    let node = memory.read64(end), candidate = end;
    while (node) {
      const key = memory.read64(node + 0x20n), lower = key >= type;
      if (lower) candidate = node;
      node = memory.read64(node + (lower ? 0n : 8n));
    }
    if (candidate !== end && memory.read64(candidate + 0x20n) <= type) return candidate;
    let getter = memory.read64(type + 0x30n);
    if (!getter) fail('ObjectFactory.cpp', 145, 4, 'it != m_factoryMap.end()');
    services.callParentGetter(getter);
    getter = memory.read64(type + 0x30n);
    type = getter ? services.callParentGetter(getter) : 0n;
  }
}
/** Full 0x1004d0b60 control flow with explicit reflected-call/cast services. */
export function createNativeFactoryObject(memory: NativeObjectMemory, factory: bigint, name: Uint8Array, services: ObjectFactoryServices): bigint {
  const requested = findNativeMetaClassByName(memory, services.registry, name);
  if (!requested) fail('ObjectFactory.cpp', 86, 4, 'metaClass');
  const entry = findNativeObjectFactory(memory, factory, requested, services), method = memory.read64(entry + 0x38n);
  if (!method) fail('ObjectFactory.cpp', 89, 4, 'factory->createFun');
  const count = memory.read32(method + 0x30n);
  if (count !== 0 && count !== 1) fail('ObjectFactory.cpp', 105, 4, 'false');
  const receiverType = services.receiverType(method);
  const receiver = services.cast(receiverType, memory.read64(entry + 0x28n), memory.read64(entry + 0x30n));
  if (!receiver) fail('../../../Code/Base/Meta.h', 1091, 3, 'c');
  const created = services.invoke(method, receiver, count === 1 ? requested : null);
  const object = services.cast(services.objectType, created, services.objectType);
  if (!object) fail('ObjectFactory.cpp', 109, 3, 'newObject');
  return object;
}

export interface ObjectFactoryLifecycleServices extends ObjectFactoryServices {
  nullObjectType: bigint;
  moduleType: bigint;
  asClass(type: bigint): bigint;
  invokeRelease(method: bigint, receiver: bigint, object: bigint): void;
}
/** The original calls AsClass on the object's ID type and falls back by
 * calling AsClass on Object's null-pointer type. Null is still dispatched. */
function nativeFactoryObjectClass(memory: NativeObjectMemory, object: bigint, services: ObjectFactoryLifecycleServices): bigint {
  const type = object ? findNativeMetaClassById(memory, services.registry, memory.read32(object)) : services.nullObjectType;
  return services.asClass(type) || services.asClass(services.nullObjectType);
}
/** 0x1004d0e00. Missing Release re-queries the object's class for its diagnostic;
 * reflected release receives one Object* argument and has no result storage. */
export function releaseNativeFactoryObject(memory: NativeObjectMemory, factory: bigint, object: bigint, services: ObjectFactoryLifecycleServices): void {
  const requested = nativeFactoryObjectClass(memory, object, services);
  const entry = findNativeObjectFactory(memory, factory, requested, services);
  const method = memory.read64(entry + 0x40n);
  if (!method) {
    nativeFactoryObjectClass(memory, object, services);
    fail('ObjectFactory.cpp', 116, 4, 'factory->releaseFun');
  }
  const receiverType = services.receiverType(method);
  const receiver = services.cast(receiverType, memory.read64(entry + 0x28n), memory.read64(entry + 0x30n));
  if (!receiver) fail('../../../Code/Base/Meta.h', 1091, 3, 'c');
  services.invokeRelease(method, receiver, object);
}
/** 0x1004d0fd0. Priority belongs to the selected factory's Module subobject;
 * a failed Module conversion returns zero. Keep the signed int field value. */
export function getNativeFactoryObjectInitPriority(memory: NativeObjectMemory, factory: bigint, object: bigint, services: ObjectFactoryLifecycleServices): number {
  const requested = nativeFactoryObjectClass(memory, object, services);
  const entry = findNativeObjectFactory(memory, factory, requested, services);
  const module = services.cast(services.moduleType, memory.read64(entry + 0x28n), memory.read64(entry + 0x30n));
  return module ? memory.read32(module + 4n) | 0 : 0;
}
