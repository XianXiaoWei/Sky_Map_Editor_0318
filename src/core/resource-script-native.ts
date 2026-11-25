import type { ResourceAccessor, ResourceScriptServices } from './resource-script-runtime';
import { addNativeResourceToLoadList, addNativeResourceToUnloadList, decrementNativeResourceLoadCount, getNativeResourceLoadCount, incrementNativeResourceLoadCount, type NativeResourceMemory } from './resource-load-runtime';

export interface NativeResourceReflectionServices {
  getResource(manager: bigint, className: string, name: string): bigint | null;
  create(className: string, allocator: bigint): bigint;
  accessor(resource: bigint, name: string): ResourceAccessor<bigint> | undefined;
  unregister(manager: bigint, resource: bigint): void;
}

/** Connects the embedded-Lua constructor/refcount lifecycle to the original
 * native resource memory layout and queues. Metadata allocation, reflected
 * field conversion, registered lookup and unregister internals must be
 * supplied explicitly; this adapter never invents a loaded resource. */
export function nativeResourceScriptServices(memory: NativeResourceMemory, manager: bigint, reflection: NativeResourceReflectionServices): ResourceScriptServices<bigint, bigint> {
  return {
    getResource: (className, name) => reflection.getResource(manager, className, name),
    create: (className, allocator) => reflection.create(className, allocator),
    accessor: (resource, name) => reflection.accessor(resource, name),
    incLoadCount: resource => incrementNativeResourceLoadCount(memory, resource),
    decLoadCount: resource => decrementNativeResourceLoadCount(memory, resource),
    getLoadCount: resource => getNativeResourceLoadCount(memory, resource),
    addToLoadList: resource => addNativeResourceToLoadList(memory, manager, resource),
    addToUnloadList: resource => addNativeResourceToUnloadList(memory, manager, resource, (manager, resource) => reflection.unregister(manager, resource)),
  };
}
