// Sky 0.3.18: Wind::sample 0x100328810 and EnvironmentForces::sample
// 0x100328200. Inputs are initialized runtime snapshots, not TGCL defaults.
// Only xyz are semantic vector components. Original SIMD scratch W is excluded.
import {railClosestPoint, railTransform, type RailCache, type RailMath} from './rail';
const f = Math.fround;
const add = (a: number, b: number) => f(f(a) + f(b));
const sub = (a: number, b: number) => f(f(a) - f(b));
const mul = (a: number, b: number) => f(f(a) * f(b));
const div = (a: number, b: number) => f(f(a) / f(b));
const length = (v: number[]) => f(Math.sqrt(add(mul(v[2], v[2]), add(mul(v[0], v[0]), mul(v[1], v[1])))));
const dot = (a: number[], b: number[]) => add(mul(a[2], b[2]), add(mul(a[0], b[0]), mul(a[1], b[1])));
const maxss = (a: number, b: number) => Number.isNaN(a) || Number.isNaN(b) || a === b ? b : Math.max(a, b);
const minss = (a: number, b: number) => Number.isNaN(a) || Number.isNaN(b) || a === b ? b : Math.min(a, b);
const clamp = (v: number) => minss(1, maxss(0, v));
export interface WindSnapshot {
  transform: number[]; enabled: boolean; fadeDist: number; fadeTime: number;
  timer: number; intensity: number; order: number;
  // Marker matrices are already resolved by the caller. Their enabled flag is
  // not read by this native sample. Rail closest-point evaluation is separate.
  additionalBoxes?: number[][];
  railSample?: {closestPosition: number[]; transform: number[]};
  // Verified cached Rail bodies; cache initialization and event state remain
  // explicit. JS sincos precision has its own original-native report.
  rail?: RailCache;
}
export interface WindSample {vector: number[]; weight: number;}
// EnvironmentForces::Update 0x100324b62..0x100324b8d. delta is the already
// scaled/clamped EnvironmentForces+12 frame delta; event enable is explicit.
export function advanceWindTimer(timer: number, fadeTime: number, enabled: boolean, delta: number): number {
  if (![timer, fadeTime, delta].every(Number.isFinite)) throw new Error('Wind 计时快照无效');
  return minss(f(fadeTime), maxss(0, add(timer, enabled ? delta : -f(delta))));
}
function matrix(m: number[]) {
  if (m.length !== 16 || !m.every(Number.isFinite)) throw new Error('Wind 需要完整有限的原 Matrix4');
}
function vector(v: number[]) {
  if (v.length < 3 || !v.slice(0, 3).every(Number.isFinite)) throw new Error('Wind 需要有限的 xyz');
}
// 0x10078ce10: world-space distance to the OBB represented by half-axis columns.
// Preserve the native projection and summation order, including tiny axes.
export function windBoxDistance(halfAxisMatrix: number[], position: number[]): number {
  matrix(halfAxisMatrix); vector(position);
  const d = position.slice(0, 3).map((v, i) => sub(v, halfAxisMatrix[12 + i]));
  const residual = [0, 1, 2].map(i => {
    const axis = halfAxisMatrix.slice(i * 4, i * 4 + 3).map(f), extent = length(axis);
    const unit = extent > f(.00001) ? axis.map(v => div(v, extent)) : axis;
    const p = dot(d, unit);
    return p < -extent ? add(extent, p) : p > extent ? sub(p, extent) : 0;
  });
  // Native OBB distance sums X² + Y², then Z².
  return f(Math.sqrt(add(add(mul(residual[0], residual[0]), mul(residual[1], residual[1])), mul(residual[2], residual[2]))));
}
export function sampleWind(wind: WindSnapshot, position: number[], railMath?: RailMath): WindSample {
  matrix(wind.transform); vector(position);
  if (![wind.fadeDist, wind.fadeTime, wind.timer, wind.intensity].every(Number.isFinite) ||
    !Number.isInteger(wind.order) || wind.order < -2147483648 || wind.order > 2147483647) throw new Error('Wind 运行快照无效');
  const time = wind.enabled ? f(wind.fadeTime) === 0 ? 1 : div(wind.timer, wind.fadeTime) : 0;
  if (!(time > 0)) {
    const amount = mul(mul(time, 0), wind.intensity);
    return {vector: [mul(0, amount), mul(0, amount), mul(1, amount)], weight: mul(time, 0)};
  }
  let spatial: number, direction: number[];
  if (wind.rail && wind.railSample) throw new Error('Wind 轨道缓存和显式轨道采样不能同时提供');
  const closest = wind.rail ? railClosestPoint(wind.rail, position.slice(0, 3)) : undefined;
  const rail = closest ? {closestPosition: closest.position, transform: railTransform(wind.rail!, closest.parameter, railMath)} : wind.railSample;
  if (rail) {
    matrix(rail.transform); vector(rail.closestPosition);
    const distance = length(position.slice(0, 3).map((v, i) => sub(v, rail.closestPosition[i])));
    const radius = maxss(length(rail.transform.slice(4, 7)), length(rail.transform.slice(0, 3)));
    spatial = f(wind.fadeDist) === 0 ? Number(distance < radius) : clamp(add(div(sub(radius, distance), wind.fadeDist), 1));
    direction = rail.transform.slice(8, 11).map(f);
  } else {
    // Original Matrix4 product with diag(.5,.5,.5,1), including the additions
    // of zero products. A direct scale could change signed-zero behavior.
    const half = wind.transform.map((_, i) => {
      const row = i % 4, col = Math.floor(i / 4);
      return add(add(add(mul(wind.transform[row], col === 0 ? .5 : 0),
        mul(wind.transform[4 + row], col === 1 ? .5 : 0)),
        mul(wind.transform[8 + row], col === 2 ? .5 : 0)), mul(wind.transform[12 + row], col === 3 ? 1 : 0));
    });
    let distance = windBoxDistance(half, position);
    for (const box of wind.additionalBoxes ?? []) distance = minss(windBoxDistance(box, position), distance);
    spatial = f(wind.fadeDist) === 0 ? Number(distance === 0) : clamp(sub(1, div(distance, wind.fadeDist)));
    direction = wind.transform.slice(8, 11).map(f);
  }
  const n = length(direction), negative = direction.map(v => f(-v));
  const unit = n > f(.00001) ? negative.map(v => div(v, n)) : negative;
  const weight = mul(time, spatial), amount = mul(weight, wind.intensity);
  return {vector: unit.map(v => mul(v, amount)), weight};
}
export interface WindForceSnapshot {enabled: boolean; vector: number[];}
export interface EnvironmentWindInput {
  globalWind: number[];
  winds: WindSnapshot[];
  // Exactly 32 paired slots, visited A0,B0,A1,B1,...; not sorted by strength.
  forces: {a: WindForceSnapshot; b: WindForceSnapshot}[];
}
export function sampleEnvironmentWind(input: EnvironmentWindInput, position: number[], railMath?: RailMath): number[] {
  vector(input.globalWind); vector(position);
  if (input.winds.length > 32 || input.forces.length !== 32) throw new Error('原 EnvironmentForces 为最多 32 Wind 和 32 对交互力槽');
  let high = 0, low = 0, highCount = 0, lowCount = 0, weight = 0;
  let top = [0, 0, 0], second = [0, 0, 0];
  for (const wind of input.winds) {
    const candidate = sampleWind(wind, position, railMath);
    if (!(Math.abs(dot(candidate.vector, candidate.vector)) > f(.0001)) || wind.order < low) continue;
    // Native encounter order matters: a new highest order clears BOTH sums.
    if (wind.order > high) {
      high = low = wind.order; highCount = lowCount = 0; weight = 0;
      top = [0, 0, 0]; second = [0, 0, 0];
    } else if (wind.order > low && wind.order < high) {
      low = wind.order; lowCount = 0; second = [0, 0, 0];
    }
    if (wind.order === high) {
      highCount++; top = top.map((v, i) => add(v, candidate.vector[i]));
      weight = add(weight, candidate.weight);
    }
    if (wind.order === low) {
      lowCount++; second = second.map((v, i) => add(v, candidate.vector[i]));
    }
  }
  if (highCount > 0) { top = top.map(v => div(v, highCount)); weight = div(weight, highCount); }
  if (lowCount > 0) second = second.map(v => div(v, lowCount));
  second = second.map(v => mul(sub(1, weight), v));
  let strongest = [0, 0, 0], maxLength = 0;
  for (const pair of input.forces) for (const force of [pair.a, pair.b]) {
    if (!force.enabled) continue;
    vector(force.vector); const n = length(force.vector);
    if (n > maxLength) strongest = force.vector.slice(0, 3).map(f);
    maxLength = maxss(n, maxLength);
  }
  return input.globalWind.slice(0, 3).map((v, i) => add(add(add(v, top[i]), second[i]), strongest[i]));
}
