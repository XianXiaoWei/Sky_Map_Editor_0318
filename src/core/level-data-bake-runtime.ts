import { expandBakeLighting, type PackedBake } from './baking';
import type { ResourceMeshLOD } from './resources';

export interface LevelDataBakeReadServices {
  readUint32(): number;
  readBytes(target: Uint8Array, length: number): void;
  allocate(heap: 'temporary' | 'level', bytes: number, alignment: number): Uint8Array;
  freeTemporary(bytes: Uint8Array): void;
}
export interface LoadedLevelDataBakeLod {
  renderVertexCount: number;
  extraByteCount: number;
  lighting: PackedBake | null;
  extra: Uint8Array | null;
}
/** GUID invalidation instructions 0x1003f4c63..0x1003f4c6e.
 * Resource existence and a usable ResourceRef are separate native gates. */
export function loadedLevelDataBakeGuid(serializedGuid: number, resourceExists: boolean): number {
  return resourceExists ? serializedGuid >>> 0 : 0xffffffff;
}
/** LevelData::Load 0x1003f4db5..0x1003f4f67, one stable Mesh.bin LOD.
 * Serializer/heap calls are explicit services. This is an instruction subchain,
 * not the complete LevelData loader, resource manager or Model constructor.
 * Original unchecked out-of-range LOD/remap and undersized uniform allocation
 * inputs are rejected by the adapter instead of emulating invalid memory reads.
 */
export function loadLevelDataBakeLod(uniform: boolean, mesh: ResourceMeshLOD | null, services: LevelDataBakeReadServices): LoadedLevelDataBakeLod {
  const samples = services.readUint32(), extraByteCount = services.readUint32();
  if (uniform && samples === 0) throw new Error('原 uniform 临时分配不足 12 字节：未核验的输入');
  const temporary = services.allocate('temporary', samples * 12, 4);
  const compatible = mesh !== null && samples === mesh.bakeVertexCount;
  const extra = services.allocate(compatible ? 'level' : 'temporary', extraByteCount, compatible ? 16 : 1);
  services.readBytes(temporary, uniform ? 12 : samples * 12);
  services.readBytes(extra, extraByteCount);
  if (!compatible) {
    // Original clears the complete 24-byte loaded LOD AFTER consuming bytes.
    services.freeTemporary(extra);
    services.freeTemporary(temporary);
    return { renderVertexCount: 0, extraByteCount: 0, lighting: null, extra: null };
  }
  const renderVertexCount = mesh.positions.length / 3;
  const packed = services.allocate('level', renderVertexCount * 12, 16);
  const expanded = expandBakeLighting(mesh, { id: '', name: '', guid: 0, lod: 0, uniform, count: samples,
    light: temporary.subarray(0, uniform ? 12 : samples * 12), extra });
  packed.set(expanded.packed);
  services.freeTemporary(temporary);
  return { renderVertexCount, extraByteCount, lighting: { ...expanded, packed }, extra };
}
