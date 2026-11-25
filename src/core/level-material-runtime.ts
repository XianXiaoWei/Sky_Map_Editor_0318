import evidence from '../../docs/level-material-evidence.json';
import type { MaterialDescriptor, ShaderParameter } from './materials';

export const LEVEL_MATERIAL_SIZE = 0x6f0;
export const LEVEL_SHADER_PARAM_SIZE = 0x60;
export const LEVEL_MODEL_BARN_SIZE = 0x8f40;
export const LEVEL_MATERIAL_LIMIT = 16;
export class NativeMaterialFailure extends Error {
  constructor(public readonly file: string, public readonly line: number, public readonly severity: number, public readonly expression: string) {
    super(`${file}:${line}: ${expression}`);
  }
}
const fail = (file: string, line: number, severity: number, expr: string): never => { throw new NativeMaterialFailure(file, line, severity, expr); };
const view = (b: Uint8Array) => new DataView(b.buffer, b.byteOffset, b.byteLength);
const size = (b: Uint8Array, n: number) => { if (b.length < n) throw new Error('Native material storage truncated'); return view(b); };
const bytes = (hex: string) => Uint8Array.from(hex.match(/../g) ?? [], v => parseInt(v, 16));

// These are metadata/global inputs, not guessed constructor defaults. The
// original constructor does not write flags, GUID, count, type or vector bytes.
export function constructLevelMaterial(storage: Uint8Array, address: bigint, materialClassId: number, paramClassId: number, baseColor: Uint8Array) {
  const d = size(storage, LEVEL_MATERIAL_SIZE); if (baseColor.length !== 16) throw new Error('Base color storage');
  d.setUint32(0, materialClassId, true); storage.fill(0, 8, 0x20); storage.fill(0, 0x28, 0x40); storage.set(baseColor, 0xd0);
  for (let i = 0; i < 16; i++) {
    const at = 0xf0 + i * 0x60; d.setUint32(at, paramClassId, true);
    storage.fill(0, at + 8, at + 0x20); storage.fill(0, at + 0x40, at + 0x58);
    d.setBigUint64(0x40 + i * 8, address + BigInt(at), true);
  }
}
export function setLevelMaterialParamCount(storage: Uint8Array, count: number) {
  const d = size(storage, LEVEL_MATERIAL_SIZE), n = count >>> 0;
  if (n > 16) fail('LevelModel.cpp', 93, 3, 'count <= kMaxParams');
  d.setUint32(0xc0, n, true);
}
export function initializeLevelModelBarn(storage: Uint8Array, modelDependency: bigint, beamoDependency: bigint, thirdDependency: bigint) {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE);
  d.setUint32(0x2028, 0, true); d.setUint32(0x8f30, 0, true);
  d.setBigUint64(0x10, modelDependency, true); d.setBigUint64(0x18, beamoDependency, true); d.setBigUint64(0x20, thirdDependency, true); d.setUint8(0x8f34, 0);
}
export function resetLevelModelBarn(storage: Uint8Array) {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE); d.setUint32(0x2028, 0, true); d.setUint32(0x8f30, 0, true);
}
export function allocateLevelMaterial(storage: Uint8Array, barnAddress: bigint): number {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE), count = d.getUint32(0x8f30, true);
  if (count >= 16) fail('LevelModel.cpp', 213, 4, 'm_levelMaterialCount < kMaxLevelMaterials');
  const at = 0x2030 + count * LEVEL_MATERIAL_SIZE;
  d.setBigUint64(at + 0xe8, barnAddress, true); d.setUint32(0x8f30, count + 1, true); d.setUint32(at + 0xe0, count, true); return at;
}
export function findLevelMaterialGuid(storage: Uint8Array, guid: number): number | null {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE), count = d.getUint32(0x8f30, true);
  for (let i = 0; i < count; i++) { const at = 0x2030 + i * LEVEL_MATERIAL_SIZE; if (d.getUint32(at + 4, true) === (guid >>> 0)) return at; }
  return null;
}
// Original vtable-repair loop re-reads model count after each service call. Null pointers
// propagate as null, non-null pointers pass the Object subobject at +8.
export function restoreLevelModelBarnVtables(storage: Uint8Array, restoreObject: (object: bigint) => void) {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE);
  for (let i = 0; i < d.getUint32(0x2028, true); i++) {
    const model = d.getBigUint64(0x28 + i * 8, true); restoreObject(model ? model + 8n : 0n);
  }
}
export interface MaterialDefinitionTable { storage: Uint8Array; address: bigint; }
export function findMaterialDefinition(table: MaterialDefinitionTable, materialId: number): number {
  const d = size(table.storage, 0x34d0), id = materialId >>> 0;
  const index = d.getUint32(0x30d0 + id * 4, true), at = 0x10 + index * 0x1a0;
  if (d.getUint8(at) !== (id & 255)) fail('MaterialDefs.cpp', 86, 4, 'm_defs[ index ].material == material');
  return at;
}
export function nativeLevelMaterialTable(level: string): MaterialDefinitionTable {
  const tables = evidence.tables as Record<string, { index: number; materialId: number; rawHex: string }[]>;
  const storage = new Uint8Array(0x34d0), d = view(storage), definitions = tables[level] ?? tables.default;
  d.setUint32(0xc, definitions.length, true);
  for (const def of definitions) { storage.set(bytes(def.rawHex), 0x10 + def.index * 0x1a0); d.setUint32(0x30d0 + def.materialId * 4, def.index, true); }
  return { storage, address: 0x210000000n };
}
export const nativeMaterialString = (pointer: bigint): string => {
  const str = (evidence.strings as Record<string, string>)[`0x${pointer.toString(16)}`];
  if (str === undefined) throw new Error(`Unresolved original material string 0x${pointer.toString(16)}`); return str;
};
const names = [0x100b88dccn, 0x100b88dd9n, 0x100b88e00n, 0x100b88df1n, 0x100b88de6n];
// 0x100443a70 writes into caller storage, preserving padding and unused lanes.
// Capacity assertion occurs AFTER all writes; storage must hold up to 21 entries.
export function generateMaterialUniforms(definition: Uint8Array, output: Uint8Array, capacity: number): number {
  const d = size(definition, 0x1a0), o = size(output, 21 * 32); let count = 0;
  const header = (name: bigint, type: number) => { const at = count++ * 32; o.setBigUint64(at, name, true); o.setUint32(at + 8, type, true); return at; };
  const number = (name: bigint, type: number, source: number, length: number) => { const at = header(name, type); output.set(definition.subarray(source, source + length), at + 0x10); };
  o.setFloat32(header(names[0], 1) + 0x10, d.getUint8(0), true);
  number(names[1], 1, 0x5c, 4); number(names[2], 1, 0x58, 4); number(names[3], 1, 0x54, 4); number(names[4], 3, 0x20, 12);
  for (let i = 0; i < 4; i++) {
    const texName = d.getBigUint64(0x68 + i * 8, true), texture = d.getBigUint64(0x88 + i * 8, true);
    if (texName && texture) o.setBigUint64(header(texName, 100) + 0x10, texture, true);
    for (const [namesAt, valuesAt, type, length, stride] of [[0xa8, 0xd0, 4, 16, 16], [0x110, 0x130, 3, 12, 16], [0x170, 0x190, 1, 4, 4]]) {
      const name = d.getBigUint64(namesAt + i * 8, true); if (name) number(name, type, valuesAt + i * stride, length);
    }
  }
  if (count > (capacity >>> 0)) fail('MaterialDefs.cpp', 224, 3, 'bufSize >= uniformCount'); return count;
}
export interface LevelMaterialServices {
  definitionTable(): MaterialDefinitionTable;
  string(pointer: bigint): string;
  assignString(address: bigint, value: string): void;
  // The real caller supplies uninitialized stack scratch. Its untouched lanes
  // must be explicit for reproducible replay; they are not fabricated defaults.
  uniformScratch(): Uint8Array;
  rebuildBeamo(dependency: bigint): void;
}
export function updateDefaultLevelMaterials(storage: Uint8Array, address: bigint, count: number, services: LevelMaterialServices) {
  const d = size(storage, count * LEVEL_MATERIAL_SIZE);
  for (let i = 0; i < count; i++) {
    const root = i * LEVEL_MATERIAL_SIZE; if (d.getUint8(root + 0x20)) continue;
    const table = services.definitionTable(), at = findMaterialDefinition(table, d.getUint8(root + 0x21));
    const def = table.storage.subarray(at, at + 0x1a0), definition = view(def);
    services.assignString(address + BigInt(root + 0x28), services.string(definition.getBigUint64(8, true)) + 'Mesh');
    services.definitionTable(); // Original getter is called again before generation.
    const scratch = services.uniformScratch(), count = generateMaterialUniforms(def, scratch, 16), uniforms = view(scratch);
    d.setUint32(root + 0xc0, count, true);
    for (let j = 0; j < count; j++) {
      const uniform = j * 32, paramAddress = d.getBigUint64(root + 0x40 + j * 8, true), param = Number(paramAddress - address);
      services.assignString(paramAddress + 8n, services.string(uniforms.getBigUint64(uniform, true)));
      const type = uniforms.getUint32(uniform + 8, true);
      if (type >= 1 && type <= 8) { d.setUint8(param + 0x20, 0); storage.set(scratch.subarray(uniform + 0x10, uniform + 0x20), param + 0x30); }
      else if (type === 100) { d.setUint8(param + 0x20, 1); services.assignString(paramAddress + 0x40n, services.string(uniforms.getBigUint64(uniform + 0x10, true))); }
      else fail('LevelModel.cpp', 139, 3, 'false');
    }
  }
}
export function updateLevelModelBarnMaterials(storage: Uint8Array, address: bigint, services: LevelMaterialServices, rebuild: boolean) {
  const d = size(storage, LEVEL_MODEL_BARN_SIZE);
  updateDefaultLevelMaterials(storage.subarray(0x2030), address + 0x2030n, d.getUint32(0x8f30, true), services);
  if (rebuild) services.rebuildBeamo(d.getBigUint64(0x18, true));
}
export function levelMaterialChanged(material: Uint8Array, resolveBarn: (address: bigint) => Uint8Array, services: LevelMaterialServices) {
  const address = size(material, LEVEL_MATERIAL_SIZE).getBigUint64(0xe8, true);
  updateLevelModelBarnMaterials(resolveBarn(address), address, services, true);
}
// Declared component lengths are retained for uploads. Scratch tail bytes are
// irrelevant to a scalar/vec3 upload, and are not presented as default values.
export function nativeDefaultMaterialParameters(level: string, materialId: number, capacity = 21): ShaderParameter[] {
  const table = nativeLevelMaterialTable(level), at = findMaterialDefinition(table, materialId);
  const def = table.storage.subarray(at, at + 0x1a0), scratch = new Uint8Array(21 * 32), count = generateMaterialUniforms(def, scratch, capacity), d = view(scratch);
  const parameters: ShaderParameter[] = [];
  for (let i = 0; i < count; i++) {
    const at = i * 32, type = d.getUint32(at + 8, true), name = nativeMaterialString(d.getBigUint64(at, true));
    parameters.push({ name, nativeType: type === 100 ? 1 : 0, vector: type === 100 ? [] : Array.from({ length: type }, (_, j) => d.getFloat32(at + 0x10 + j * 4, true)), texture: type === 100 ? nativeMaterialString(d.getBigUint64(at + 0x10, true)) : '', fieldId: `MaterialDef/${materialId}/${i}` });
  }
  return parameters;
}
export function defaultLevelMaterialDescriptor(material: MaterialDescriptor, level: string): MaterialDescriptor {
  if (material.custom) return material;
  const table = nativeLevelMaterialTable(level), at = findMaterialDefinition(table, material.materialId), def = table.storage.subarray(at, at + 0x1a0);
  return { ...material, shaderName: nativeMaterialString(view(def).getBigUint64(8, true)) + 'Mesh', parameters: nativeDefaultMaterialParameters(level, material.materialId, 16) };
}
