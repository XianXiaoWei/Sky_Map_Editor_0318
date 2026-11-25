export const RESOURCE_MEMORY = 0x240000000n, RESOURCE_MANAGER = RESOURCE_MEMORY + 0x1000n;
export interface ResourceLoadCase {
  name: string; count: number; repeats: number; allowAsync: boolean; flag28: number;
  busyLoads: number; busyByte: number; heapMissing: boolean; registerClearsHeap: boolean;
  registerAddsQueued: boolean; mutateContext: boolean; firstLoadTurn: number;
  methodSequence: boolean; initialLoadCount: number; referenceCycles: number;
}
export function resourceLoadCases(): ResourceLoadCase[] {
  const cases: ResourceLoadCase[] = [];
  const add = (name: string, changes: Partial<ResourceLoadCase>) => cases.push({ name, count: 3, repeats: 1,
    allowAsync: false, flag28: 0, busyLoads: 0, busyByte: 1, heapMissing: false, registerClearsHeap: false,
    registerAddsQueued: false, mutateContext: false, firstLoadTurn: 0, methodSequence: false, initialLoadCount: 0, referenceCycles: 0, ...changes });
  for (const count of [0, 1, 2, 7]) for (const allowAsync of [false, true]) for (const flag28 of [0, 1, 255]) for (const busyLoads of [0, 1, 4])
    add(`queue-${count}-${allowAsync}-${flag28}-${busyLoads}`, { count, repeats: count || 1, allowAsync, flag28, busyLoads });
  for (const allowAsync of [false, true]) for (const busyByte of [1, 2, 255]) for (const firstLoadTurn of [0, 2, 255])
    add(`status-${allowAsync}-${busyByte}-${firstLoadTurn}`, { allowAsync, busyByte, firstLoadTurn, busyLoads: 3, mutateContext: true });
  for (const heapMissing of [false, true]) for (const registerClearsHeap of [false, true]) for (const registerAddsQueued of [false, true])
    add(`registration-${heapMissing}-${registerClearsHeap}-${registerAddsQueued}`, { heapMissing, registerClearsHeap, registerAddsQueued, busyLoads: 2, mutateContext: true });
  add('empty-after-single-load', { count: 1, repeats: 2 });
  for (const count of [1, 3]) for (const initialLoadCount of [0, 1, 0x7fffffff, 0xffffffff]) for (const referenceCycles of [0, 1, 3])
    add(`public-methods-${count}-${initialLoadCount}-${referenceCycles}`, { count, repeats: count, methodSequence: true, initialLoadCount, referenceCycles, busyLoads: 1 });
  return cases;
}
export function resourceLoadMemory(c: ResourceLoadCase): Buffer {
  const b = Buffer.alloc(0x8000);
  for (let i = 0; i < b.length; i++) b[i] = (i * 37 + 17) & 255;
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(to ? RESOURCE_MEMORY + BigInt(to) : 0n, at);
  ptr(0x1010, 0x6000); ptr(0x14c0, c.count ? 0x2000 + (c.count - 1) * 256 : 0); ptr(0x14c8, 0x4000);
  ptr(0x14d0, 0);
  for (let i = 0; i < 8; i++) {
    const p = 0x2000 + i * 256; ptr(p, 0x7000); b[p + 0x28] = c.flag28;
    ptr(p + 0x30, c.heapMissing ? 0 : 0x5000); ptr(p + 0x60, i ? p - 256 : 0);
    b.writeUInt32LE(0xa5b6c7d8, p + 0x38);
    b.writeUInt32LE(c.initialLoadCount, p + 0x58);
  }
  ptr(0x4060, 0); ptr(0x7000 + 0x10, 0);
  return b;
}
