import crypto from 'node:crypto';
import { dispatchNativeModules } from '../src/core/module-barn-runtime';
import { NativeObjectFoundationFailure, type NativeObjectMemory } from '../src/core/object-foundation-runtime';
import { MODULE_BARN, MODULE_MEMORY, moduleFunctionNames, moduleMemory, type ModuleDispatchCase } from './module-barn-cases';
export interface ModuleDispatchResult { line: number; severity: number; services: number[][]; memorySha256: string; }
export function evaluateModuleDispatch(c: ModuleDispatchCase): ModuleDispatchResult {
  const bytes = moduleMemory(c), services: number[][] = [], at = (address: bigint) => Number(address - MODULE_MEMORY);
  const memory: NativeObjectMemory = {
    read32: address => bytes.readUInt32LE(at(address)), read64: address => bytes.readBigUInt64LE(at(address)),
    write64: (address, value) => bytes.writeBigUInt64LE(value, at(address)),
    string: address => { const start = at(address); return bytes.subarray(start, bytes.indexOf(0, start)); },
  };
  let calls = 0, casts = 0, line = 0, severity = 0;
  const groupIndex = moduleFunctionNames.indexOf(c.functionName), group = MODULE_MEMORY + BigInt(0xb000 + Math.max(0, groupIndex) * 56);
  const mutate = (index: number) => {
    if (calls++ !== c.mutationAt) return;
    bytes.writeUInt32LE(c.newCount, at(group) + 48);
    if (c.replaceOverride) memory.write64(memory.read64(group + 40n) + BigInt(index * 32 + 24), 1n);
  };
  try {
    for (let r = 0; r < c.repeats; r++) dispatchNativeModules(memory, MODULE_BARN, Buffer.from(c.functionName), c.modeMask, c.reverse, {
      voidType: MODULE_MEMORY + 0x5100n,
      receiverType: method => { const i = (at(method) - 0xe000) / 128; services.push([1, i, 0, 0]); return MODULE_MEMORY + 0x5200n; },
      castReceiver: (_type, storage, source) => { const i = (at(storage) - 0xd000) / 64; services.push([2, i, at(source), 0]); return casts++ === c.castFailsAt ? 0n : storage; },
      callOverride: (_thunk, context, contextType, storage, source) => {
        const i = (at(storage) - 0xd000) / 64; services.push([4, i, at(context), at(contextType)]); services.push([5, i, at(source), 0]); mutate(i);
      },
      invoke: (method, receiver, resultType, args, count) => {
        const i = (at(receiver) - 0xd000) / 64;
        if (memory.read64(method + 56n) !== BigInt(i + 1)) throw new Error('Module reflected method mismatch');
        services.push([3, i, at(resultType), count]);
        for (let a = 0; a < count; a++) services.push([6, i, a, at(memory.read64(args + BigInt(a * 8)))]);
        mutate(i);
      },
    });
  } catch (error) { if (!(error instanceof NativeObjectFoundationFailure)) throw error; line = error.line; severity = error.severity; }
  return { line, severity, services, memorySha256: crypto.createHash('sha256').update(bytes).digest('hex') };
}
