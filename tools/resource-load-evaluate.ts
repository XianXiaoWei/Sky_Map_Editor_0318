import crypto from 'node:crypto';
import { addNativeResourceToLoadList, addNativeResourceToUnloadList, decrementNativeResourceLoadCount, getNativeResourceLoadCount, incrementNativeResourceLoadCount, loadNextNativeResource, type NativeResourceMemory } from '../src/core/resource-load-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { RESOURCE_MEMORY, RESOURCE_MANAGER, resourceLoadMemory, type ResourceLoadCase } from './resource-load-cases';
export function evaluateResourceLoad(c: ResourceLoadCase) {
  const bytes = resourceLoadMemory(c), services: number[][] = [], calls = Array(8).fill(0);
  const at = (address: bigint) => Number(address - RESOURCE_MEMORY);
  const memory: NativeResourceMemory = {
    read8: p => bytes[at(p)], write8: (p, v) => { bytes[at(p)] = v; },
    read32: p => bytes.readUInt32LE(at(p)), write32: (p, v) => { bytes.writeUInt32LE(v >>> 0, at(p)); },
    read64: p => bytes.readBigUInt64LE(at(p)), write64: (p, v) => { bytes.writeBigUInt64LE(v, at(p)); },
    string: p => { const start = at(p); return bytes.subarray(start, bytes.indexOf(0, start)); },
  };
  let line = 0, severity = 0;
  try {
    if (c.methodSequence) {
      memory.write64(RESOURCE_MANAGER + 0x4c0n, 0n);
      for (let i = 0; i < c.count; i++) {
        const res = RESOURCE_MEMORY + BigInt(0x2000 + i * 256);
        addNativeResourceToLoadList(memory, RESOURCE_MANAGER, res);
        for (let n = 0; n < c.referenceCycles; n++) incrementNativeResourceLoadCount(memory, res);
        services.push([3, at(res), getNativeResourceLoadCount(memory, res), 0]);
      }
    }
    for (let r = 0; r < c.repeats; r++) loadNextNativeResource(memory, RESOURCE_MANAGER, c.allowAsync, {
      register: (manager, resource) => {
        services.push([1, at(resource), memory.read32(resource + 0x38n), at(memory.read64(manager + 0x4c0n)) >>> 0]);
        memory.write32(resource + 0x38n, 0xfedcba98);
        if (c.registerClearsHeap) memory.write64(resource + 0x30n, 0n);
        if (c.registerAddsQueued) memory.write64(manager + 0x4c0n, RESOURCE_MEMORY + 0x2700n);
      },
      load: (resource, context) => {
        const i = (at(resource) - 0x2000) / 256;
        services.push([2, at(resource), memory.read32(resource + 0x38n), at(context)]);
        if (calls[i]++ === 0) memory.write8(resource + 0x3an, c.firstLoadTurn);
        memory.write8(resource + 0x38n, 0x12); memory.write8(resource + 0x39n, 0x34);
        memory.write8(resource + 0x3bn, calls[i] <= c.busyLoads ? c.busyByte : 0);
        if (c.mutateContext) memory.write64(RESOURCE_MANAGER + 0x10n, context + 0x10n);
      },
    });
    if (c.methodSequence) for (let i = 0; i < c.count; i++) {
      const res = RESOURCE_MEMORY + BigInt(0x2000 + i * 256);
      for (let n = 0; n < c.referenceCycles; n++) decrementNativeResourceLoadCount(memory, res);
      const count = getNativeResourceLoadCount(memory, res); services.push([4, at(res), count, 0]);
      if (count === 0) addNativeResourceToUnloadList(memory, RESOURCE_MANAGER, res, (manager, resource) => {
        services.push([5, at(resource), 0, 0]); memory.write64(manager + 0x4d0n, RESOURCE_MEMORY + 0x4000n);
      });
    }
  } catch (error) { if (!(error instanceof NativeObjectFoundationFailure)) throw error; line = error.line; severity = error.severity; }
  return { line, severity, services, memorySha256: crypto.createHash('sha256').update(bytes).digest('hex') };
}
