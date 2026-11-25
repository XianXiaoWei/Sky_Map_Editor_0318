import { MAX_CLOUD_CARDS, type CloudCardSphere } from './cloud-card-layout';
import {queryVisibilitySpheres,type VisibilitySphereState} from './visibility-spheres';
import type {VisibilityReciprocal} from './visibility-transform';

export type CloudCardPlane = [number, number, number, number];
const f = Math.fround;

// Original Camera+0x1c0 column-major matrix, 0x100220733..0x1002208eb.
// Plane test order: left, right, near, bottom, top, far. Preserve the original
// row3 +/- row2 extraction; the caller supplies the stored CPU frustum matrix.
export function cloudCardFrustumPlanes(viewProjection: number[]): CloudCardPlane[] {
  if (viewProjection.length !== 16 || !viewProjection.every(v => Number.isFinite(f(v))))
    throw new Error('CloudCard 视锥矩阵无效');
  const rows = [0,1,2,3].map(row => [0,4,8,12].map(col => f(viewProjection[col + row])));
  return ([[0,1],[0,-1],[2,1],[1,1],[1,-1],[2,-1]] as const).map(([row, sign]) => {
    const p = rows[3].map((v, i) => f(v + sign * rows[row][i]));
    const square = p.map(v => f(v * v));
    const lengthSquared = f(square[2] + f(square[0] + square[1]));
    if (lengthSquared > 0) {
      const length = f(Math.sqrt(lengthSquared));
      for (let i = 0; i < 4; i++) p[i] = f(p[i] / length);
    }
    if (!p.every(Number.isFinite)) throw new Error('CloudCard 视锥平面溢出');
    return p as CloudCardPlane;
  });
}

// Original sphere tests 0x1002209c0..0x100220ad4, then Visibility status
// compaction 0x100220b10..0x100220b60. Statuses are explicit uint32 outputs
// from the external Visibility classifier, keyed by source card index.
// Zero removes a card; every other bit pattern keeps it. The original
// classifier's occlusion buffers/queries are not reconstructed here.
export function cloudCardVisibilityPlan(spheres: CloudCardSphere[], renderOrder: number[],
  viewProjection: number[], visibilityStatuses: number[], enabled: boolean) {
  if (spheres.length > MAX_CLOUD_CARDS || typeof enabled !== 'boolean' ||
      spheres.some(s => s.length !== 4 || !s.every(v => Number.isFinite(f(v))) || s[3] < 0) ||
      renderOrder.length !== spheres.length || new Set(renderOrder).size !== spheres.length ||
      renderOrder.some(i => !Number.isInteger(i) || i < 0 || i >= spheres.length) ||
      visibilityStatuses.length !== spheres.length ||
      visibilityStatuses.some(v => !Number.isInteger(v) || v < 0 || v > 0xffffffff))
    throw new Error('CloudCard 可见性输入无效');
  // The game's enable/count early return precedes matrix reads and allocations.
  const planes = enabled && spheres.length ? cloudCardFrustumPlanes(viewProjection) : [];
  const candidateOrder = enabled ? renderOrder.filter(sourceIndex => {
    const sphere = spheres[sourceIndex].map(f);
    return planes.every(p => {
      const x = f(sphere[0] * p[0]), y = f(sphere[1] * p[1]), z = f(sphere[2] * p[2]);
      // SSE reduction pairs x+z and y+w, then adds those two float32 sums.
      const dot = f(f(x + z) + f(y + p[3]));
      return !(-sphere[3] > dot); // Tangency stays visible; unordered also stays.
    });
  }) : [];
  const visibleOrder = [...candidateOrder];
  const visibleStatuses = visibleOrder.map(i => visibilityStatuses[i]);
  const visibleSpheres = visibleOrder.map(i => spheres[i].map(f) as CloudCardSphere);
  let count = visibleOrder.length;
  for (let i = 0; i < count;) {
    if (visibleStatuses[i] !== 0) { i++; continue; }
    count--;
    visibleOrder[i] = visibleOrder[count];
    visibleStatuses[i] = visibleStatuses[count];
    visibleSpheres[i] = visibleSpheres[count];
  }
  visibleOrder.length = visibleStatuses.length = visibleSpheres.length = count;
  return { planes, candidateOrder, visibleOrder, visibleStatuses, visibleSpheres };
}

/** CloudCardBarn's frustum candidates, real numeric sphere query and original
 * unstable compaction. Preserve candidate order when batching Visibility;
 * paired mip carries make querying source order first observably different.
 * Caller supplies stored camera/depth snapshots and explicit CPU capabilities.
 */
export function cloudCardOcclusionPlan(spheres:CloudCardSphere[],renderOrder:number[],viewProjection:number[],state:VisibilitySphereState,enabled:boolean,reciprocal:VisibilityReciprocal,maximum:(a:number,b:number)=>number) {
  const candidates=cloudCardVisibilityPlan(spheres,renderOrder,viewProjection,spheres.map(()=>0xffffffff),enabled);
  const statuses=new Uint32Array(candidates.candidateOrder.length).fill(0xffffffff);
  queryVisibilitySpheres(state,Float32Array.from(candidates.candidateOrder.flatMap(i=>spheres[i])),statuses.length,statuses,false,reciprocal,maximum);
  const sourceStatuses=spheres.map(()=>0xffffffff);
  candidates.candidateOrder.forEach((source,i)=>{sourceStatuses[source]=statuses[i];});
  return {...cloudCardVisibilityPlan(spheres,renderOrder,viewProjection,sourceStatuses,enabled),candidateStatuses:Array.from(statuses)};
}
