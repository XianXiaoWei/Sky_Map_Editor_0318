import type { ResourceMeshLOD } from './resources';

export interface CloudCardSource { mesh: ResourceMeshLOD; bounds: number[]; world: number[]; }
export type CloudCardSphere = [number, number, number, number];
// Original allocation 0x1002216c4 compares m_cloudCount with 0x200.
export const MAX_CLOUD_CARDS = 512;
const f = Math.fround;
const add = (a: number, b: number) => f(a + b);
const mul = (a: number, b: number) => f(a * b);

// CloudCardBarn load 0x10021fd80..0x10021ff28. The center comes from
// the stored bounds, while radius comes from actual LOD0 positions.
// Preserve SSE operation order, including the four-lane column norms.
export function cloudCardSphere(source: CloudCardSource): CloudCardSphere {
  const { mesh, bounds, world } = source;
  if (bounds.length !== 6 || world.length !== 16 || mesh.positions.length % 3 ||
      ![...bounds, ...world].every(Number.isFinite)) throw new Error('CloudCard 包围盒或矩阵无效');
  const center = bounds.slice(0, 3).map((v, i) => mul(add(f(v), f(bounds[i + 3])), .5));
  const transformed = center.map((_, row) => add(f(world[12 + row]),
    add(add(mul(f(world[row]), center[0]), mul(f(world[4 + row]), center[1])), mul(f(world[8 + row]), center[2]))));
  let radiusSquared = 0;
  for (let i = 0; i < mesh.positions.length; i += 3) {
    const delta = center.map((v, c) => f(mesh.positions[i + c] - v));
    if (!delta.every(Number.isFinite)) throw new Error('CloudCard 顶点包含非有限坐标');
    radiusSquared = Math.max(radiusSquared, add(mul(delta[2], delta[2]), add(mul(delta[0], delta[0]), mul(delta[1], delta[1]))));
  }
  const scales = [0, 4, 8].map(at => {
    const squares = world.slice(at, at + 4).map(v => mul(f(v), f(v)));
    return add(add(squares[0], squares[2]), add(squares[1], squares[3]));
  });
  const radius = mul(f(Math.sqrt(radiusSquared)), f(Math.sqrt(Math.max(...scales))));
  if (![...transformed, radius].every(Number.isFinite)) throw new Error('CloudCard 世界球溢出');
  return [...transformed, radius] as CloudCardSphere;
}

// Native overlap loop 0x100220090 and recursive flood 0x10021fa30.
// Touching spheres stay separate. A chain joins all members even when
// its end spheres do not overlap. IDs follow first unvisited source order.
export function cloudCardOverlapGroups(spheres: CloudCardSphere[]) {
  if (spheres.length > MAX_CLOUD_CARDS || spheres.some(s => s.length !== 4 || !s.every(Number.isFinite) || s[3] < 0)) throw new Error('CloudCard 世界球列表无效');
  const neighbors: number[][] = spheres.map(() => []);
  for (let i = 0; i < spheres.length; i++) for (let j = 0; j < spheres.length; j++) {
    if (i === j) continue;
    const delta = [0, 1, 2].map(c => f(f(spheres[j][c]) - f(spheres[i][c])));
    const distanceSquared = add(mul(delta[2], delta[2]), add(mul(delta[0], delta[0]), mul(delta[1], delta[1])));
    const radii = add(f(spheres[j][3]), f(spheres[i][3]));
    if (mul(radii, radii) > distanceSquared) neighbors[i].push(j);
  }
  const groups = new Int32Array(spheres.length).fill(-1);
  let groupCount = 0;
  for (let i = 0; i < spheres.length; i++) {
    if (groups[i] !== -1) continue;
    const pending = [i]; groups[i] = groupCount;
    while (pending.length) for (const j of neighbors[pending.pop()!]) {
      if (groups[j] === -1) { groups[j] = groupCount; pending.push(j); }
    }
    groupCount++;
  }
  return { neighbors, groups, groupCount };
}
