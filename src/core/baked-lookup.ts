// Original LevelDataRef lookup 0x1003f68d0. Inputs represent the loaded
// native table, after the loader has resolved resources and invalidated GUIDs.
// Raw serialized records alone do not establish that loaded state.
export interface LoadedBakeSource<T extends {guid: number}> {
  handle: {resource: {loadIndex: number; records: readonly T[]} | null} | null;
}

export function findLoadedBake<T extends {guid: number}>(source: LoadedBakeSource<T>, guid: number): T | null {
  if (!Number.isInteger(guid) || guid < 0 || guid > 0xffffffff) throw new Error('烘焙 GUID 必须为 uint32');
  const resource = source.handle?.resource;
  if (!resource) return null;
  if (!Number.isInteger(resource.loadIndex) || resource.loadIndex < -0x80000000 || resource.loadIndex > 0x7fffffff) throw new Error('烘焙资源载入索引必须为 int32');
  if (resource.loadIndex < 0) return null;
  for (const record of resource.records) if (record.guid === guid) return record;
  return null;
}

export interface LoadedModelBake {
  guid: number;
  lods: readonly {renderVertexCount: number}[];
}
// Original BeamoBarn 0x100195427..0x100195440 compares LOD count.
export function beamoBakeCompatible(record: LoadedModelBake | null, meshLodCount: number): boolean {
  return record !== null && record.lods.length === meshLodCount;
}
// Original CloudCardBarn 0x10021fc86..0x10021fcb2 and mesh binding
// 0x10045fb24..0x10045fb55 compare the first expanded LOD vertex count.
// These acceptance checks do not validate every LOD or perform allocation.
export function firstLodBakeCompatible(record: LoadedModelBake | null, meshFirstLodVertexCount: number): boolean {
  if (!record) return false;
  if (!record.lods.length) throw new Error('原模型烘焙兼容检查需要首个已展开 LOD');
  return record.lods[0].renderVertexCount === meshFirstLodVertexCount;
}
