import { NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';
export interface NativeResourceMemory extends NativeObjectMemory {
  read8(address: bigint): number;
  write8(address: bigint, value: number): void;
  write32(address: bigint, value: number): void;
}
export interface NativeResourceLoadServices {
  register(manager: bigint, resource: bigint): void;
  load(resource: bigint, context: bigint): void;
}
/** Original ResourceManager::AddToLoadList 0x1007c2230. Prepend + tail
 * removal in LoadNext gives FIFO order for newly queued resources. */
export function addNativeResourceToLoadList(memory: NativeResourceMemory, manager: bigint, resource: bigint): void {
  memory.write64(resource + 0x60n, memory.read64(manager + 0x4c0n));
  memory.write64(manager + 0x4c0n, resource);
}
/** Whole AddToUnloadList 0x1007c2250. Unregister comes BEFORE reading the
 * unload head. The unload link is +0x68, separate from load/async +0x60. */
export function addNativeResourceToUnloadList(memory: NativeResourceMemory, manager: bigint, resource: bigint, unregister: (manager: bigint, resource: bigint) => void): void {
  unregister(manager, resource);
  memory.write64(resource + 0x68n, memory.read64(manager + 0x4d0n));
  memory.write64(manager + 0x4d0n, resource);
}
export function incrementNativeResourceLoadCount(memory: NativeResourceMemory, resource: bigint): void {
  memory.write32(resource + 0x58n, (memory.read32(resource + 0x58n) + 1) >>> 0);
}
export function decrementNativeResourceLoadCount(memory: NativeResourceMemory, resource: bigint): void {
  memory.write32(resource + 0x58n, (memory.read32(resource + 0x58n) - 1) >>> 0);
}
export function getNativeResourceLoadCount(memory: NativeResourceMemory, resource: bigint): number {
  return memory.read32(resource + 0x58n);
}
/** Whole ResourceManager::LoadNext 0x1007c3d20. Queue links are stored at
 * resource+0x60; tail removal preserves the original queue order. Registration
 * happens before the four status bytes are cleared and before heap validation.
 * Resource virtual +0x10 owns actual reading/async progress; no fabricated
 * loaded state or filename-to-render shortcut is supplied here.
 */
export function loadNextNativeResource(memory: NativeResourceMemory, manager: bigint, allowAsync: boolean, services: NativeResourceLoadServices): void {
  const head = manager + 0x4c0n;
  let resource = memory.read64(head), previous = 0n;
  if (!resource) {
    memory.write64(head, 0n);
    throw new NativeObjectFoundationFailure('Resource.cpp', 299, 3, 'toLoad');
  }
  for (;;) {
    const next = memory.read64(resource + 0x60n);
    if (!next) break;
    previous = resource; resource = next;
  }
  memory.write64(previous ? previous + 0x60n : head, 0n);
  services.register(manager, resource);
  memory.write32(resource + 0x38n, 0);
  if (!memory.read64(resource + 0x30n)) throw new NativeObjectFoundationFailure('Resource.cpp', 303, 3, 'toLoad->heap');
  services.load(resource, memory.read64(manager + 0x10n));
  if (!memory.read8(resource + 0x3bn)) return;
  if (!memory.read8(resource + 0x28n) && allowAsync) {
    memory.write64(resource + 0x60n, memory.read64(manager + 0x4c8n));
    memory.write64(manager + 0x4c8n, resource);
    return;
  }
  do {
    memory.write8(resource + 0x3an, memory.read8(resource + 0x3an) ^ 1);
    services.load(resource, memory.read64(manager + 0x10n));
  } while (memory.read8(resource + 0x3bn));
}
