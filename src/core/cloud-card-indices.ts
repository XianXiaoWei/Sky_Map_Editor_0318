import { cloudCardSphere, cloudCardOverlapGroups, MAX_CLOUD_CARDS, type CloudCardSource } from './cloud-card-layout';
import { cloudCardGroupOrder } from './cloud-card-sort';

export interface CloudCardIndexRange {
  sourceIndex: number; group: number; vertexOffset: number; indexOffset: number; vertexCount: number; indexCount: number;
}

// CloudCardBarn load sorts complete records by group before 0x1002202c0
// accumulates offsets and 0x100220360 adds each vertex base to LOD0 indices.
// These ranges refer to a shared dynamic vertex stream, still to be generated.
export function cloudCardIndexLayout(sources: CloudCardSource[]) {
  if (sources.length > MAX_CLOUD_CARDS) throw new Error('CloudCard 超过原容量');
  const spheres = sources.map(cloudCardSphere), groups = cloudCardOverlapGroups(spheres);
  const order = cloudCardGroupOrder(groups.groups), ranges: CloudCardIndexRange[] = [];
  let vertexCount = 0, indexCount = 0;
  for (const sourceIndex of order) {
    const mesh = sources[sourceIndex].mesh, count = mesh.positions.length / 3;
    if (mesh.indices.length % 3 || !mesh.indices.every(i => i < count)) throw new Error('CloudCard 模型索引无效');
    ranges.push({ sourceIndex, group: groups.groups[sourceIndex], vertexOffset: vertexCount, indexOffset: indexCount, vertexCount: count, indexCount: mesh.indices.length });
    vertexCount += count; indexCount += mesh.indices.length;
  }
  if (vertexCount > 0xffffffff || indexCount > 20000000) throw new Error('CloudCard 索引流超出上传容量');
  const indices = new Uint32Array(indexCount);
  for (const range of ranges) {
    const source = sources[range.sourceIndex].mesh.indices;
    for (let i = 0; i < source.length; i++) indices[range.indexOffset + i] = source[i] + range.vertexOffset;
  }
  return { spheres, groups: groups.groups, groupCount: groups.groupCount, order, ranges, vertexCount, indices };
}
