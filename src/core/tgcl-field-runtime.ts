import { findNativeMetaClassById, NativeObjectFoundationFailure } from './object-foundation-runtime';
import { assignNativeCString, readNativeTgclString, type NativeStringGrowthServices, type NativeStringMemory } from './native-string-runtime';
export interface NativeTgclFieldServices extends NativeStringGrowthServices {
  registry: bigint;
  nullObjectType: bigint;
  integerType: bigint;
  asClass(type: bigint): bigint;
  castObject(meta: bigint, object: bigint): bigint;
  methodReceiverType(method: bigint): bigint;
  castReceiver(type: bigint, value: bigint, source: bigint): bigint;
  invokeArrayAllocator(method: bigint, receiver: bigint, count: number, argumentType: bigint, resultType: bigint): void;
  fieldReceiverType(field: bigint): bigint;
  fieldAddress(type: bigint, root: bigint, rootClass: bigint, member: bigint): bigint;
  elementType(field: bigint): bigint;
  elementObject(type: bigint, slot: bigint): bigint;
}
const failure = (line: number, expression: string, severity = 3, file = 'LevelObjects.cpp'): never => { throw new NativeObjectFoundationFailure(file, line, severity, expression); };
function objectClass(memory: NativeStringMemory, object: bigint, services: NativeTgclFieldServices): bigint {
  return services.asClass(object ? findNativeMetaClassById(memory, services.registry, memory.read32(object)) : services.nullObjectType) || services.asClass(services.nullObjectType);
}
function readWord(memory: NativeStringMemory, context: bigint): number {
  const at = memory.read32(context + 0x147cn), end = BigInt(at) + 4n;
  if (end > BigInt(memory.read32(context + 0x1478n))) failure(157, 'ctx->dataHead + podSize <= ctx->dataMax');
  const value = memory.read32(memory.read64(context + 0x1470n) + BigInt(at));
  memory.write32(context + 0x147cn, Number(end)); return value;
}
function queuePointer(memory: NativeStringMemory, context: bigint, destination: bigint, index: number, adjustment: bigint): void {
  const count = memory.read32(context + 0x148cn);
  if (count >= memory.read32(context + 0x1488n)) failure(176, 'ctx->objectPtrCount < ctx->objectPtrMax');
  const entry = memory.read64(context + 0x1480n) + BigInt(count) * 24n;
  memory.write64(entry, destination); memory.write32(entry + 8n, index);
  memory.write64(entry + 16n, adjustment); memory.write32(context + 0x148cn, count + 1);
}

/** Whole recursive LevelObjects::ReadFields 0x10040b390. Context contains
 * the original compiled schema, prepared member/default caches and deferred
 * pointer table. Cache PREPARATION, metadata casts and array constructors
 * remain explicit dependencies; no guessed class defaults are introduced. */
export function readNativeTgclFields(memory: NativeStringMemory, context: bigint, object: bigint, declaration: bigint, services: NativeTgclFieldServices): void {
  const root = object ? services.castObject(objectClass(memory, object, services), object) : 0n;
  for (let i = 0; i < memory.read32(declaration + 8n); i++) {
    const index = (memory.read32(declaration + 4n) + i) >>> 0;
    const property = memory.read64(context + 0x1438n) + BigInt(index) * 16n;
    const auxiliary = memory.read64(context + 0x1440n) + BigInt(index) * 32n;
    const hasVar = object !== 0n && memory.read32(property + 4n) !== 0xffffffff;
    const type = memory.read32(property);
    if (type === 0) {
      const destination = hasVar ? root + memory.read64(auxiliary) : 0n;
      const size = memory.read32(property + 8n), at = memory.read32(context + 0x147cn);
      if (BigInt(at) + BigInt(size) > BigInt(memory.read32(context + 0x1478n))) failure(157, 'ctx->dataHead + podSize <= ctx->dataMax');
      if (destination) memory.copy(destination, memory.read64(context + 0x1470n) + BigInt(at), size);
      // Original re-reads the cursor after memcpy.
      memory.write32(context + 0x147cn, (memory.read32(context + 0x147cn) + size) >>> 0);
    } else if (type === 1) {
      readNativeTgclString(memory, context, hasVar ? root + memory.read64(auxiliary) : 0n, services);
    } else if (type === 2) {
      const destination = hasVar ? root + memory.read64(auxiliary) : 0n;
      const id = readWord(memory, context);
      queuePointer(memory, context, destination, id, memory.read64(auxiliary + 8n));
    } else if (type === 3) {
      const count = readWord(memory, context);
      let data = 0n, element = 0n;
      if (hasVar) {
        const container = objectClass(memory, object, services);
        const field = memory.read64(auxiliary + 16n), allocator = memory.read64(auxiliary + 24n);
        const receiver = services.castReceiver(services.methodReceiverType(allocator), root, container);
        if (!receiver) failure(1091, 'c', 3, '../../../Code/Base/Meta.h');
        services.invokeArrayAllocator(allocator, receiver, count, services.integerType, services.nullObjectType);
        const fieldType = services.fieldReceiverType(field);
        data = services.fieldAddress(fieldType, root, services.asClass(container), memory.read64(field + 32n));
        if (memory.read64(field + 56n) !== 0xffffffffffffffffn && memory.read64(field + 72n) === 0n) {
          data = memory.read64(data);
          if (!data) {
            services.fieldReceiverType(field); // Original diagnostic re-query.
            failure(1035, '!m_countAddress || m_staticArraySize > 0 || *(void**)v != 0', 4, '../../../Code/Base/Meta.h');
          }
        }
        element = services.asClass(services.elementType(field));
      }
      for (let j = 0; j < count; j++) {
        if (memory.read32(property + 12n) !== 0xffffffff) {
          let value = 0n;
          if (hasVar) {
            const slot = data + BigInt(j) * 8n;
            if (!memory.read64(slot)) failure(229, '!hasVar || varArray[ j ]');
            value = services.elementObject(element, slot);
          }
          const nested = memory.read64(context + 0x1420n) + BigInt(memory.read32(property + 12n)) * 12n;
          readNativeTgclFields(memory, context, value, nested, services);
        } else {
          const id = readWord(memory, context);
          queuePointer(memory, context, hasVar ? data + BigInt(j) * 8n : 0n, id, memory.read64(auxiliary + 8n));
        }
      }
    } else failure(235, 'false');
  }
  if (!object) return;
  const classIndex = Number((declaration - memory.read64(context + 0x1420n)) / 12n);
  const range = memory.read64(context + 0x1428n) + BigInt(classIndex) * 8n;
  for (let i = 0; i < memory.read32(range + 4n); i++) {
    const entry = memory.read64(context + 0x1450n) + BigInt((memory.read32(range) + i) >>> 0) * 28n;
    const type = memory.read32(entry), destination = root + BigInt(memory.read32(entry + 8n));
    if (type === 0 || type === 2) memory.copy(destination, entry + 12n, memory.read32(entry + 4n));
    else if (type === 1) assignNativeCString(memory, destination, memory.read64(memory.read64(entry + 12n) + 8n), services);
    else failure(261, 'false');
  }
}

/** Original loader instructions 0x10040d2aa..0x10040d311 (a subrange, not
 * the complete loader). References resolve only after all nodes exist.
 * A null destination is skipped before touching its serialized index. */
export function resolveNativeTgclPointers(memory: NativeStringMemory, context: bigint, objects: bigint): void {
  const count = memory.read32(context + 0x148cn);
  const pointers = memory.read64(context + 0x1480n);
  for (let i = 0; i < count; i++) {
    const entry = pointers + BigInt(i) * 24n;
    const destination = memory.read64(entry);
    if (!destination) continue;
    const id = memory.read32(entry + 8n);
    const value = id === 0xffffffff ? 0n : BigInt.asUintN(64, memory.read64(objects + BigInt(id) * 8n) - memory.read64(entry + 16n));
    memory.write64(destination, value);
  }
}
