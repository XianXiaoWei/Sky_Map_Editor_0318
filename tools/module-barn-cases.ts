export const MODULE_MEMORY = 0x230000000n, MODULE_BARN = MODULE_MEMORY + 0xa000n;
export const moduleFunctionNames = ['Initialize', 'OnLevelLoad', 'Update', 'Z'.repeat(31)];
export interface ModuleDispatchCase {
  name: string; functionName: string; reverse: boolean; modeMask: number; filter: boolean; repeats: number;
  entries: { flags: number; override: boolean; signature: number }[];
  mutationAt: number; newCount: number; replaceOverride: boolean; castFailsAt: number;
}
export function moduleMemory(c: ModuleDispatchCase): Buffer {
  const b = Buffer.alloc(0x10000), ptr = (at: number, offset: number) => b.writeBigUInt64LE(MODULE_MEMORY + BigInt(offset), at);
  ptr(0xa010, 0xd700); ptr(0xa018, 0x5300); ptr(0xa040, 0xb000); b.writeUInt32LE(moduleFunctionNames.length, 0xa048); b[0xa578] = Number(c.filter);
  for (const [g, name] of moduleFunctionNames.entries()) {
    const group = 0xb000 + g * 56; b.write(name + '\0', group); ptr(group + 40, 0xb800 + g * 0x400); b.writeUInt32LE(c.entries.length, group + 48);
    for (const [i, e] of c.entries.entries()) {
      const entry = 0xb800 + g * 0x400 + i * 32, descriptor = 0xc800 + i * 64, method = 0xe000 + i * 128;
      ptr(entry, descriptor); ptr(entry + 8, method); ptr(entry + 16, 0xd800 + i * 32); b.writeBigUInt64LE(e.override ? 1n : 0n, entry + 24);
      ptr(descriptor, 0xd000 + i * 64); ptr(descriptor + 8, 0x5000); ptr(descriptor + 24, descriptor + 32); b.writeUInt32LE(e.flags >>> 0, descriptor + 40);
      b.writeUInt32LE(e.signature, method + 48); b.writeBigUInt64LE(BigInt(i + 1), method + 56);
      for (let a = 0; a < e.signature; a++) ptr(0xd800 + i * 32 + a * 8, 0xd000 + ((i + a) % Math.max(c.entries.length, 1)) * 64);
    }
  }
  return b;
}
export function moduleDispatchCases(): ModuleDispatchCase[] {
  const cases: ModuleDispatchCase[] = [];
  function add(name: string, changes: Partial<ModuleDispatchCase> = {}) {
    cases.push({ name, functionName: 'Update', reverse: false, modeMask: 1, filter: false, repeats: 1,
      entries: Array.from({ length: 6 }, (_, i) => ({ flags: [0, 1, 2, 3, 0x80000000, 0xffffffff][i], override: i % 2 === 0, signature: i % 4 })),
      mutationAt: 0xffffffff, newCount: 6, replaceOverride: false, castFailsAt: 0xffffffff, ...changes });
  }
  for (const functionName of [...moduleFunctionNames, '', 'Missing', 'update', 'Upd']) for (const reverse of [false, true]) for (const filter of [false, true]) for (const modeMask of [0, 1, 2, 3, 0x80000000, 0xffffffff]) add(`dispatch-${functionName}-${reverse}-${filter}-${modeMask}`, { functionName, reverse, filter, modeMask, repeats: 2 });
  for (const reverse of [false, true]) for (const n of [0, 1, 2, 7, 8]) for (const override of [false, true]) add(`dispatch-count-${reverse}-${n}-${override}`, {
    reverse, repeats: 2, entries: Array.from({ length: n }, (_, i) => ({ flags: 1, override, signature: i % 4 })),
  });
  for (const reverse of [false, true]) for (const override of [false, true]) for (const newCount of [0, 1, 2, 4, 6, 8]) add(`dispatch-mutation-${reverse}-${override}-${newCount}`, {
    reverse, newCount, mutationAt: 0, replaceOverride: override, repeats: 2,
    entries: Array.from({ length: 8 }, (_, i) => ({ flags: 1, override, signature: i % 4 })),
  });
  for (const reverse of [false, true]) for (const castFailsAt of [0, 1, 3, 7]) add(`dispatch-cast-failure-${reverse}-${castFailsAt}`, {
    reverse, castFailsAt, entries: Array.from({ length: 8 }, (_, i) => ({ flags: 1, override: false, signature: i % 4 })),
  });
  return cases;
}
