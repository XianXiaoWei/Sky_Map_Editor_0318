import { createNativeFactoryObject, type ObjectFactoryServices } from './object-foundation-runtime';
import { readNativeTgclFields, type NativeTgclFieldServices } from './tgcl-field-runtime';
import type { NativeStringMemory } from './native-string-runtime';
export interface PreparedNativeObjectLoadContext {
  factoryAddress: bigint;
  fieldsContext: bigint;
  objectTable: bigint;
  factory: ObjectFactoryServices;
  fields: NativeTgclFieldServices;
}
/** Adapter for the verified factory→field-reader connection. The caller
 * supplies matched metadata/caches and a cursor already at this node's field
 * bytes. Original TGCL node-name consumption/indexing remains separate.
 * In the loader (0x10040d14f..0x10040d15f), table storage follows ReadFields;
 * failed field loading must not publish an object into that table. */
export function createAndReadPreparedNativeObject(memory:NativeStringMemory,context:PreparedNativeObjectLoadContext,className:Uint8Array,declaration:bigint,index:number):bigint {
  const object=createNativeFactoryObject(memory,context.factoryAddress,className,context.factory);
  readNativeTgclFields(memory,context.fieldsContext,object,declaration,context.fields);
  memory.write64(context.objectTable+BigInt(index)*8n,object);
  return object;
}
