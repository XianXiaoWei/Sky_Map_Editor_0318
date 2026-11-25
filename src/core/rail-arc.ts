import {railPosition, type RailCache} from './rail';

const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b);
const mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
const maxss = (a: number, b: number) => a === b || Number.isNaN(a) || Number.isNaN(b) ? b : Math.max(a, b);
const minss = (a: number, b: number) => a === b || Number.isNaN(a) || Number.isNaN(b) ? b : Math.min(a, b);
const epsilon = f(.00001);
export interface RailArcTable {
  pairs: [number, number][];
  totalLength: number;
  subdivisions: number;
  dirty: boolean;
}

// Original 0x10055c6a0. Advance t by repeated addition, not i*step.
// `subdivisions == 0` becomes one interval in the original function.
export function railArcLength(cache: RailCache, from: number, to: number, subdivisions: number): number {
  if (!Number.isInteger(subdivisions) || subdivisions < 0 || subdivisions > 65536 || ![from, to].every(Number.isFinite)) throw new Error('Rail 弧长采样输入无效');
  const count = subdivisions || 1;
  let parameter = f(from), previous = railPosition(cache, parameter), length = 0;
  const step = div(sub(f(to), parameter), f(count));
  for (let i = 0; i < count; i++) {
    parameter = add(parameter, step);
    const next = railPosition(cache, parameter), squared = next.map((v, a) => mul(sub(v, previous[a]), sub(v, previous[a])));
    length = add(length, f(Math.sqrt(add(squared[2], add(squared[0], squared[1])))));
    previous = next;
  }
  return length;
}

// Original 0x10055b560. First entry is (1/size, distance), not (0,0).
// OnLevelLoad 0x10055bc50 calls with 32 subdivisions, dirty query uses 16.
export function buildRailArcTable(cache: RailCache, subdivisions: number, size = cache.positions.length * 16): RailArcTable {
  if (!Number.isSafeInteger(size) || size < 2 || size > 65536) throw new Error('Rail 弧长表容量无效');
  const step = div(1, f(size)), pairs: [number, number][] = [];
  let previous = 0, totalLength = 0;
  for (let i = 0; i < size; i++) {
    const next = i === 0 ? step : mul(f(i + 1), step);
    totalLength = add(totalLength, railArcLength(cache, previous, next, subdivisions));
    pairs.push([next, totalLength]);
    previous = next;
  }
  return {pairs, totalLength, subdivisions, dirty: false};
}
function rebuildDirty(table: RailArcTable, cache: RailCache) {
  if (!table.dirty) return;
  Object.assign(table, buildRailArcTable(cache, 16, table.pairs.length));
}
function checkTable(table: RailArcTable) {
  if (table.pairs.length < 2 || !Number.isFinite(table.totalLength) || table.pairs.some(p => p.length !== 2 || !p.every(Number.isFinite))) throw new Error('Rail 需要完整有限弧长表');
}

// Original 0x10055d410, including lazy mutation of private table state.
export function railDistanceAtParameter(table: RailArcTable, cache: RailCache, parameter: number): number {
  checkTable(table);
  const t = f(parameter);
  if (!Number.isFinite(t) || t < 0 || t > 1) throw new Error('Rail 距离查询参数必须位于 0..1');
  rebuildDirty(table, cache);
  const scaled = mul(f(table.pairs.length), t), index = Math.trunc(scaled) || 0, fraction = sub(scaled, f(index));
  if (index === 0) return mul(fraction, table.pairs[0][1]);
  if (index === table.pairs.length) return table.pairs[index - 1][1];
  return add(mul(sub(1, fraction), table.pairs[index - 1][1]), mul(fraction, table.pairs[index][1]));
}

// Original 0x10055d4e0. Normalize against OLD total length, then rebuild.
// Do not binary-search or deduplicate: the linear scan's <= boundary and
// near-zero fallback affect repeated lengths and rounding.
export function railParameterAtDistance(table: RailArcTable, cache: RailCache, distance: number): number {
  checkTable(table);
  if (!Number.isFinite(distance)) throw new Error('Rail 距离必须有限');
  let d = f(distance);
  if (cache.looped) {d = f(d % f(table.totalLength));if (d < 0) d = add(d, f(table.totalLength));}
  else d = minss(f(table.totalLength), maxss(0, d));
  rebuildDirty(table, cache);
  let index = 0;
  while (index < table.pairs.length && d > table.pairs[index][1]) index++;
  if (index === table.pairs.length) throw new Error('Rail 原距离查询越出弧长表');
  let previous = 0, fraction: number;
  if (index > 0 && Math.abs(sub(table.pairs[index][1], table.pairs[index - 1][1])) > epsilon) {
    fraction = div(sub(d, table.pairs[index - 1][1]), sub(table.pairs[index][1], table.pairs[index - 1][1]));
    previous = table.pairs[index - 1][0];
  } else {
    fraction = Math.abs(table.pairs[0][1]) > epsilon ? div(d, table.pairs[0][1]) : 0;
    if (index > 0) previous = table.pairs[index - 1][0];
  }
  return add(mul(sub(1, fraction), previous), mul(fraction, table.pairs[index][0]));
}
