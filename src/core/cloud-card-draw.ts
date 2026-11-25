import { MAX_CLOUD_CARDS, type CloudCardSphere } from './cloud-card-layout';
import { cloudCardDistanceOrder } from './cloud-card-sort';
import type { CloudCardIndexRange } from './cloud-card-indices';

export interface CloudCardDrawRange {
  sourceIndex: number; distanceSquared: number; indexOffset: number; indexCount: number;
}

// Original 0x100221270..0x100221328: sphere center distance in float32,
// optional ascending distance sort, then one draw range per surviving card.
// Caller supplies the original visibility result AND its post-compaction order.
export function cloudCardDrawPlan(spheres: CloudCardSphere[], ranges: CloudCardIndexRange[],
  visibleOrder: number[], eye: number[], sortByDistance: boolean) {
  if (spheres.length > MAX_CLOUD_CARDS || eye.length !== 3 || !eye.every(v => Number.isFinite(Math.fround(v))) ||
      typeof sortByDistance !== 'boolean' || visibleOrder.length > spheres.length || new Set(visibleOrder).size !== visibleOrder.length ||
      visibleOrder.some(v => !Number.isInteger(v) || v < 0 || v >= spheres.length)) throw new Error('CloudCard 可见顺序或相机输入无效');
  const bySource = new Map(ranges.map(r => [r.sourceIndex, r]));
  const draws: CloudCardDrawRange[] = visibleOrder.map(sourceIndex => {
    const range = bySource.get(sourceIndex), sphere = spheres[sourceIndex];
    if (!range || sphere.length !== 4 || !sphere.every(Number.isFinite)) throw new Error('CloudCard 绘制范围缺失');
    const d = eye.map((v, i) => Math.fround(Math.fround(sphere[i]) - Math.fround(v)));
    const square = d.map(v => Math.fround(v * v));
    const distanceSquared = Math.fround(square[2] + Math.fround(square[0] + square[1]));
    if (!Number.isFinite(distanceSquared)) throw new Error('CloudCard 距离溢出');
    return { sourceIndex, distanceSquared, indexOffset: range.indexOffset, indexCount: range.indexCount };
  });
  return sortByDistance ? Array.from(cloudCardDistanceOrder(draws.map(d => d.distanceSquared)), i => draws[i]) : draws;
}
