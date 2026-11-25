import { allocateLevelMaterial, constructLevelMaterial, findLevelMaterialGuid, findMaterialDefinition, generateMaterialUniforms, initializeLevelModelBarn, levelMaterialChanged, NativeMaterialFailure, nativeMaterialString, resetLevelModelBarn, setLevelMaterialParamCount, updateDefaultLevelMaterials, updateLevelModelBarnMaterials, restoreLevelModelBarnVtables, type LevelMaterialServices } from '../src/core/level-material-runtime';
import { MATERIAL_ADDRESS, type MaterialCase } from './level-material-cases';
export interface MaterialResult {
  errors: number; line: number; severity: number; result: number; rebuilds: number; updates: string[];
  rebuildPointer: string; memoryHex: string; maskedBytes: number; strings: { at: number; value: string }[];
}
export function evaluateMaterial(c: MaterialCase): MaterialResult {
  const memory = Buffer.from(c.memoryHex, 'hex'), table = c.tableHex ? Buffer.from(c.tableHex, 'hex') : Buffer.alloc(0x34d0);
  const strings = new Map(c.initialStrings.map(s => [s.at, s.value])), tableStrings = new Map(c.tableStrings.map(s => [0x210000000n + BigInt(s.at), s.value]));
  const out: MaterialResult = { errors: 0, line: 0, severity: 0, result: 0xffffffff, rebuilds: 0, updates: [], rebuildPointer: '0', memoryHex: '', maskedBytes: 0, strings: [] };
  const services: LevelMaterialServices = {
    definitionTable: () => ({ storage: table, address: 0x210000000n }),
    string: ptr => tableStrings.get(ptr) ?? nativeMaterialString(ptr),
    assignString: (ptr, value) => { strings.set(Number(ptr - MATERIAL_ADDRESS), value); },
    uniformScratch: () => new Uint8Array(21 * 32),
    rebuildBeamo: ptr => { out.rebuilds++; out.rebuildPointer = ptr.toString(); },
  };
  try {
    switch (c.kind) {
      case 0: constructLevelMaterial(memory, MATERIAL_ADDRESS, c.a, c.b, Buffer.from(c.colorHex, 'hex')); break;
      case 1: out.result = allocateLevelMaterial(memory, MATERIAL_ADDRESS); break;
      case 2: out.result = findLevelMaterialGuid(memory, c.a) ?? 0xffffffff; break;
      case 3: setLevelMaterialParamCount(memory, c.a); break;
      case 4: initializeLevelModelBarn(memory, BigInt(c.a), BigInt(c.b), BigInt(c.c)); break;
      case 5: resetLevelModelBarn(memory); break;
      case 6: out.result = generateMaterialUniforms(memory.subarray(0, 0x1a0), memory.subarray(0x1a0), c.a); break;
      case 7: out.result = findMaterialDefinition({ storage: table, address: 0x210000000n }, c.a); break;
      case 8:
        if (c.b === 0) updateDefaultLevelMaterials(memory.subarray(0x2030), MATERIAL_ADDRESS + 0x2030n, c.a, services);
        else if (c.b === 1 || c.b === 2) updateLevelModelBarnMaterials(memory, MATERIAL_ADDRESS, services, c.b === 2);
        else levelMaterialChanged(memory.subarray(0x2030 + c.c * 0x6f0), address => { if (address !== MATERIAL_ADDRESS) throw new Error('Unknown Barn address'); return memory; }, services);
        break;
      case 9: restoreLevelModelBarnVtables(memory, ptr => { out.updates.push(ptr.toString()); if (out.updates.length - 1 === c.a) memory.writeUInt32LE(c.b, 0x2028); }); break;
      default: throw new Error('Unknown material case');
    }
  } catch (err) {
    if (!(err instanceof NativeMaterialFailure)) throw err;
    out.errors++; out.line = err.line; out.severity = err.severity;
  }
  if (c.kind === 8) {
    for (let i = 0; i < c.a; i++) {
      const root = 0x2030 + i * 0x6f0;
      const offsets = [root + 8, root + 0x28, ...Array.from({ length: 16 }, (_, j) => [root + 0xf0 + j * 0x60 + 8, root + 0xf0 + j * 0x60 + 0x40]).flat()];
      for (const at of offsets) { out.strings.push({ at, value: strings.get(at) ?? '' }); memory.fill(0, at, at + 24); }
      if (!out.errors && !memory[root + 0x20]) {
        const at = findMaterialDefinition({ storage: table, address: 0x210000000n }, memory[root + 0x21]), scratch = Buffer.alloc(21 * 32);
        const count = generateMaterialUniforms(table.subarray(at, at + 0x1a0), scratch, 21);
        for (let j = 0; j < count; j++) {
          const type = scratch.readUInt32LE(j * 32 + 8);
          if (type < 4) { const off = root + 0xf0 + j * 0x60 + 0x30 + type * 4; memory.fill(0, off, off + 16 - type * 4); out.maskedBytes += 16 - type * 4; }
        }
      }
    }
  }
  out.memoryHex = memory.toString('hex'); return out;
}
