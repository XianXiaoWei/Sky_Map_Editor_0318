import fs from 'node:fs';
import path from 'node:path';
import { ObjectsDocument } from '../src/core/objects';
import { constructLevelMaterial, LEVEL_MATERIAL_SIZE, LEVEL_MODEL_BARN_SIZE, nativeLevelMaterialTable } from '../src/core/level-material-runtime';
export interface MaterialCase {
  name: string; kind: number; memoryHex: string; a: number; b: number; c: number; colorHex: string;
  tableHex?: string; initialStrings: { at: number; value: string }[]; tableStrings: { at: number; value: string }[];
}
export const MATERIAL_ADDRESS = 0x220000000n;
let seed = 318;
const random = () => seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0;
const pattern = (n: number) => { const b = Buffer.alloc(n); for (let i = 0; i < n; i++) b[i] = random() >>> 24; return b; };
export function materialCases(): MaterialCase[] {
  seed = 318; const cases: MaterialCase[] = [];
  const add = (name: string, kind: number, memory: Buffer, a = 0, b = 0, c = 0, extra: Partial<MaterialCase> = {}) => {
    cases.push({ name, kind, memoryHex: memory.toString('hex'), a, b, c, colorHex: pattern(16).toString('hex'), initialStrings: [], tableStrings: [], ...extra });
  };
  for (let i = 0; i < 48; i++) add(`construct-${i}`, 0, pattern(LEVEL_MATERIAL_SIZE), random(), random());
  for (const count of [0, 1, 7, 15, 16, 17, 0xffffffff]) {
    const barn = pattern(LEVEL_MODEL_BARN_SIZE); barn.writeUInt32LE(count, 0x8f30); add(`allocate-${count}`, 1, barn);
    add(`set-count-${count}`, 3, pattern(LEVEL_MATERIAL_SIZE), count);
  }
  for (let i = 0; i < 20; i++) { add(`initialize-${i}`, 4, pattern(LEVEL_MODEL_BARN_SIZE), random(), random(), random()); add(`reset-${i}`, 5, pattern(LEVEL_MODEL_BARN_SIZE)); }
  for (const guids of [[], [0], [7, 7, 8, 7], [0, 0xffffffff, 0x80000000, 0, 0xffffffff], Array.from({ length: 16 }, () => random())]) {
    const barn = pattern(LEVEL_MODEL_BARN_SIZE); barn.writeUInt32LE(guids.length, 0x8f30); guids.forEach((v, i) => barn.writeUInt32LE(v, 0x2034 + i * LEVEL_MATERIAL_SIZE));
    for (const guid of [...guids, 0, 7, 0xffffffff, 0x318f01]) add(`guid-${guids.length}-${guid}`, 2, barn, guid);
  }
  // Read actual initialized tables (including all level overrides), not guesses
  // based on flattened texture/parameter arrays.
  const evidence = JSON.parse(fs.readFileSync('docs/level-material-evidence.json', 'utf8'));
  for (const [level, defs] of Object.entries(evidence.tables) as [string, { materialId: number; rawHex: string }[]][]) {
    const table = Buffer.from(nativeLevelMaterialTable(level).storage);
    for (const def of defs) {
      const raw = Buffer.from(def.rawHex, 'hex');
      for (const capacity of [0, 4, 5, 16, 21, 0xffffffff]) add(`uniform-${level}-${def.materialId}-${capacity}`, 6, Buffer.concat([raw, pattern(21 * 32)]), capacity);
      add(`definition-${level}-${def.materialId}`, 7, pattern(16), def.materialId, 0, 0, { tableHex: table.toString('hex') });
    }
    for (const id of [0, 3, 255]) add(`definition-missing-${level}-${id}`, 7, pattern(16), id, 0, 0, { tableHex: table.toString('hex') });
  }
  // Independent synthetic slot presence combinations. Random float bit patterns
  // include NaNs/signed zero; the native generator copies their exact bytes.
  for (let i = 0; i < 384; i++) {
    const def = pattern(0x1a0); def[0] = random() & 255;
    for (const at of [0x68, 0x88, 0xa8, 0x110, 0x170]) for (let j = 0; j < 4; j++) def.writeBigUInt64LE((random() & 3) ? BigInt(random()) + 0x400000000n : 0n, at + j * 8);
    add(`uniform-slots-${i}`, 6, Buffer.concat([def, pattern(21 * 32)]), [0, 5, 16, 21][i % 4]);
  }
  function defaultCase(name: string, level: string, mats: { guid: number; materialId: number; custom: boolean }[], entry: number, extra: Partial<MaterialCase> = {}) {
    const barn = Buffer.alloc(LEVEL_MODEL_BARN_SIZE, 0xa5), strings: MaterialCase['initialStrings'] = [];
    barn.writeUInt32LE(mats.length, 0x8f30); barn.writeBigUInt64LE(0x31800001n, 0x18);
    for (const [i, mat] of mats.entries()) {
      const root = 0x2030 + i * LEVEL_MATERIAL_SIZE;
      constructLevelMaterial(barn.subarray(root, root + LEVEL_MATERIAL_SIZE), MATERIAL_ADDRESS + BigInt(root), 123, 456, Buffer.alloc(16, 0x31));
      barn.writeUInt32LE(mat.guid, root + 4); barn[root + 0x20] = Number(mat.custom); barn[root + 0x21] = mat.materialId; barn.writeBigUInt64LE(MATERIAL_ADDRESS, root + 0xe8);
      barn.writeUInt32LE(2, root + 0xc0);
      strings.push({ at: root + 8, value: `material/${i}` }, { at: root + 0x28, value: i % 2 ? 'previous_shader'.repeat(8) : 'customShader' });
      for (let j = 0; j < 16; j++) strings.push({ at: root + 0xf0 + j * 0x60 + 8, value: j % 2 ? 'old_uniform_name'.repeat(6) : 'old' }, { at: root + 0xf0 + j * 0x60 + 0x40, value: j % 2 ? 'old_texture_path'.repeat(6) : 'oldTex' });
    }
    add(name, 8, barn, mats.length, entry, 0, { tableHex: Buffer.from(nativeLevelMaterialTable(level).storage).toString('hex'), initialStrings: strings, ...extra });
  }
  for (const [level, defs] of Object.entries(evidence.tables) as [string, { materialId: number }[]][]) for (const def of defs) defaultCase(`default-${level}-${def.materialId}`, level, [{ guid: def.materialId, materialId: def.materialId, custom: false }], def.materialId % 4);
  for (const entry of [0, 1, 2, 3]) {
    defaultCase(`default-empty-${entry}`, 'default', [], entry === 3 ? 2 : entry);
    defaultCase(`default-sixteen-${entry}`, 'default', Array.from({ length: 16 }, (_, i) => ({ guid: i % 4, materialId: evidence.tables.default[i].materialId, custom: i % 3 === 0 })), entry);
    defaultCase(`default-missing-${entry}`, 'default', [{ guid: 7, materialId: 0, custom: false }], entry);
    defaultCase(`default-skip-missing-${entry}`, 'default', [{ guid: 7, materialId: 0, custom: true }], entry);
  }
  for (const length of [0, 18, 19, 22, 23, 31, 32, 96, 512]) {
    const table = Buffer.from(nativeLevelMaterialTable('default').storage), def = 0x10;
    table.writeBigUInt64LE(0x210004000n, def + 8); table.writeBigUInt64LE(0x210005000n, def + 0x68); table.writeBigUInt64LE(0x210006000n, def + 0x88);
    defaultCase(`default-long-source-${length}`, 'default', [{ guid: 7, materialId: table[def], custom: false }], 2, { tableHex: table.toString('hex'), tableStrings: [{ at: 0x4000, value: 'S'.repeat(length) }, { at: 0x5000, value: 'u'.repeat(length) }, { at: 0x6000, value: 'T'.repeat(length) }] });
  }
  const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
  for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
    const file = path.join(data, 'Levels', level, 'Objects.level.bin'); if (!fs.existsSync(file)) continue;
    const doc = new ObjectsDocument(fs.readFileSync(file));
    const materialNodes = doc.nodes.filter(n => n.className === 'LevelMaterial');
    const guidBarn = Buffer.alloc(LEVEL_MODEL_BARN_SIZE, 0xa5); guidBarn.writeUInt32LE(materialNodes.length, 0x8f30);
    materialNodes.forEach((node, i) => { const f = node.fields.find(f => f.name === 'bstGuid'); guidBarn.writeUInt32LE(f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? 0), 0x2034 + i * LEVEL_MATERIAL_SIZE); });
    const guids = new Set<number>([0, ...materialNodes.map(node => { const f = node.fields.find(f => f.name === 'bstGuid'); return f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? 0); })]);
    for (const node of doc.nodes.filter(n => ['Beamo', 'BeamoDecal'].includes(n.className))) for (const f of node.fields.filter(f => ['materialBstGuid', 'materialBstGuidSecondary'].includes(f.name))) guids.add(f.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f.value));
    for (const guid of guids) add(`corpus-guid-${level}-${guid}`, 2, guidBarn, guid);
    for (const node of materialNodes) {
      const field = (name: string) => node.fields.find(f => f.name === name), scalar = (name: string) => { const f = field(name); return f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? 0); };
      defaultCase(`corpus-${level}-${node.id}`, level, [{ guid: scalar('bstGuid'), materialId: scalar('material'), custom: !!scalar('useCustomShader') }], node.id % 4);
    }
  }
  for (const mutation of [0xffffffff, 0, 1, 3]) for (const replacement of [0, 2, 8]) {
    const barn = pattern(LEVEL_MODEL_BARN_SIZE); barn.writeUInt32LE(4, 0x2028);
    for (let i = 0; i < 8; i++) barn.writeBigUInt64LE(i % 3 ? 0x31800000n + BigInt(i * 16) : 0n, 0x28 + i * 8);
    add(`model-update-${mutation}-${replacement}`, 9, barn, mutation, replacement);
  }
  return cases;
}
