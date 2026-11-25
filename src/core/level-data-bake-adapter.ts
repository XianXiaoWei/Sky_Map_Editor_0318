import { bakeChannels, type BakeStream, type BoundBake } from './baking';
import { findLoadedBake, firstLodBakeCompatible, type LoadedBakeSource } from './baked-lookup';
import { loadedLevelDataBakeGuid, loadLevelDataBakeLod, type LoadedLevelDataBakeLod } from './level-data-bake-runtime';
import type { MeshesDocument } from './meshes';
import type { ResourceMesh } from './resources';
import type { ObjectNode } from './objects';
import { objectScalar, objectText } from './model-material-index';

export interface LoadedLevelDataModelBake {
  id: string; name: string; guid: number; serializedGuid: number;
  lods: LoadedLevelDataBakeLod[];
}
/** Prepared synchronous editor resource service. It reads the real Mesh.bin
 * table in serialization order and executes the restored GUID/LOD subchain.
 * loadIndex=0 describes this prepared LOD0 snapshot, not native startup parity.
 * Return null only for absent resources; malformed/unloaded resources must fail.
 */
export function loadEditorLevelDataModelBakes(document: MeshesDocument, resolve: (name: string) => ResourceMesh | null): LoadedBakeSource<LoadedLevelDataModelBake> {
  const records = document.bakes.map(record => {
    const mesh = resolve(record.name);
    const lods = record.submeshes.map((_, lod) => {
      if (mesh && !mesh.levels[lod]) throw new Error(`${record.name}: 原 loader 未检查的 LOD 越界 ${lod}`);
      const stream = document.bakeData(record.id, lod);
      let header = 0, cursor = 0;
      const bytes = new Uint8Array(stream.light.length + stream.extra.length);
      bytes.set(stream.light); bytes.set(stream.extra, stream.light.length);
      return loadLevelDataBakeLod(record.uniform, mesh?.levels[lod] ?? null, {
        readUint32: () => header++ === 0 ? stream.count : stream.extra.length,
        readBytes: (target, length) => { if (cursor + length > bytes.length || length > target.length) throw new Error('烘焙流读取越界'); target.set(bytes.subarray(cursor, cursor + length)); cursor += length; },
        allocate: (_heap, size) => new Uint8Array(size), freeTemporary: () => {},
      });
    });
    return { id: record.id, name: record.name, serializedGuid: record.guid,
      guid: loadedLevelDataBakeGuid(record.guid, mesh !== null), lods };
  });
  return { handle: { resource: { loadIndex: 0, records } } };
}

/** Model consumer checks only the first expanded LOD count after GUID lookup.
 * It uses the chosen record's expansion, even when the requested name differs.
 * The stricter per-request LOD gate protects the editor's attribute upload. */
export function bindEditorLoadedModelBake(document: MeshesDocument, source: LoadedBakeSource<LoadedLevelDataModelBake>, mesh: ResourceMesh, guid: number, lod = 0): { stream: BakeStream; bound: BoundBake } | null {
  const record = findLoadedBake(source, guid);
  if (!record || !firstLodBakeCompatible(record, mesh.levels[0].positions.length / 3)) return null;
  const loaded = record.lods[lod], target = mesh.levels[lod];
  if (!loaded?.lighting || !target) return null;
  if (loaded.renderVertexCount !== target.positions.length / 3) throw new Error('请求 LOD 顶点数不匹配：原消费者只检查首 LOD，编辑器拒绝越界上传');
  return { stream: document.bakeData(record.id, lod), bound: bakeChannels(loaded.lighting) };
}

/** CloudCard uses the same GUID/first-expanded-LOD gate, then copies the first
 * eight of each twelve baked bytes into its dynamic stream. A rejected card
 * is left to the caller's explicit unbaked-lighting service. */
export function editorCloudCardBakeLighting(nodes: readonly ObjectNode[], source: LoadedBakeSource<LoadedLevelDataModelBake>, resolve: (name: string) => ResourceMesh) {
  const lighting: Record<number, Uint8Array> = {}, rejectedNodeIds: number[] = [];
  for (const node of nodes.filter(n => n.className === 'CloudCard')) {
    const mesh = resolve(objectText(node, 'meshName'));
    const record = findLoadedBake(source, objectScalar(node, 'bstGuid'));
    if (record && firstLodBakeCompatible(record, mesh.levels[0].positions.length / 3) && record.lods[0].lighting) lighting[node.id] = record.lods[0].lighting.packed;
    else rejectedNodeIds.push(node.id);
  }
  return { lighting, bakedCards: Object.keys(lighting).length, rejectedNodeIds };
}
