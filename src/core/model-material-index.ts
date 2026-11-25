import type { ObjectNode, Field } from './objects';
import { describeMaterial, type MaterialDescriptor } from './materials';
import { defaultLevelMaterialDescriptor, findLevelMaterialGuid, LEVEL_MODEL_BARN_SIZE, LEVEL_MATERIAL_SIZE } from './level-material-runtime';
export const objectScalar = (node: ObjectNode, name: string) => {
  const f = node.fields.find(f => f.name === name); return f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? 0);
};
export const objectText = (node: ObjectNode, name: string) => String(node.fields.find(f => f.name === name)?.value ?? '');
export interface IndexedLevelMaterial { nodeId: number; guid: number; slot: number; saved: MaterialDescriptor; effective: MaterialDescriptor | null; error: string | null; }
export interface ModelMaterialLink { role: 'primary' | 'secondary'; guid: number; requested: boolean; materialNodeId: number | null; slot: number | null; }
// This projection preserves file order and the original lookup primitive. The
// actual loader's registration/filtering is separate evidence, not assumed.
export function serializedLevelMaterialIndex(nodes: readonly ObjectNode[], level: string) {
  const storage = new Uint8Array(LEVEL_MODEL_BARN_SIZE), d = new DataView(storage.buffer);
  const materials: IndexedLevelMaterial[] = nodes.filter(n => n.className === 'LevelMaterial').map((node, slot) => {
    if (slot >= 16) throw new Error('Serialized material projection exceeds original 16 slots');
    const saved = describeMaterial(node); let effective: MaterialDescriptor | null = null, error: string | null = null;
    try { effective = defaultLevelMaterialDescriptor(saved, level); } catch (e) { error = (e as Error).message; }
    const guid = objectScalar(node, 'bstGuid'); d.setUint32(0x2034 + slot * LEVEL_MATERIAL_SIZE, guid, true);
    return { nodeId: node.id, guid, slot, saved, effective, error };
  });
  d.setUint32(0x8f30, materials.length, true);
  const find = (guid: number) => { const at = findLevelMaterialGuid(storage, guid); return at === null ? null : materials[(at - 0x2030) / LEVEL_MATERIAL_SIZE]; };
  const modelLinks = (node: ObjectNode): ModelMaterialLink[] => {
    if (!['Beamo', 'BeamoDecal'].includes(node.className)) return [];
    const primary = objectScalar(node, 'materialBstGuid'), guids: { role: 'primary' | 'secondary'; guid: number; requested: boolean }[] = [{ role: 'primary', guid: primary, requested: true }];
    if (node.className === 'Beamo') { const guid = objectScalar(node, 'materialBstGuidSecondary'); guids.push({ role: 'secondary', guid, requested: guid !== 0 }); }
    return guids.map(link => { const found = link.requested ? find(link.guid) : null; return { ...link, materialNodeId: found?.nodeId ?? null, slot: found?.slot ?? null }; });
  };
  return { materials, find, modelLinks };
}
export function nestedFields(fields: readonly Field[]): Field[] { return fields.flatMap(f => [f, ...nestedFields(f.children ?? [])]); }
