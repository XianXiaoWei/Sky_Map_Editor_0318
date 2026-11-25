import { getNativeMarkerTransformFromComponents } from './marker-transform-runtime';
import {cloudCardMultiply} from './cloud-card-dynamic';

const f = Math.fround;
const add = (a: number, b: number) => f(a + b);
const sub = (a: number, b: number) => f(a - b);
const mul = (a: number, b: number) => f(a * b);
const div = (a: number, b: number) => f(a / b);
const dot = (a: number[], b: number[]) => add(mul(a[2], b[2]), add(mul(a[0], b[0]), mul(a[1], b[1])));
const difference = (a: number[], b: number[]) => a.map((v, i) => sub(v, b[i]));
const fraction = (t: number) => sub(t, f(Math.floor(t)));
const epsilon = f(.00001);

// These are initialized original cache arrays, not raw serialized dataPoints.
// Cache construction, Object GetTransform/GetScale and lifecycle are separate.
export interface RailCache {
  positions: number[][];
  scales: [number[], number[], number[]];
  rolls: number[];
  looped: boolean;
  transform: number[];
}
export interface RailMath {sincos(angle: number): [number, number];}
export const railJsMath: RailMath = {sincos: a => [f(Math.sin(a)), f(Math.cos(a))]};

function indices(count: number, looped: boolean, parameter: number) {
  let t = f(parameter);
  if (!Number.isFinite(t) || count < 2) throw new Error('Rail 需要有限参数及至少两个缓存点');
  if (looped) {t = f(t % 1); if (t < 0) t = add(t, 1);}
  else if (t < 0) t = 0;
  else if (t > 1) t = 1;
  const segments = looped ? count : count - 1, scaled = mul(t, f(segments));
  let i = Math.trunc(scaled);
  if (!looped && i === count - 1) i = count - 2;
  // Tiny negative loop parameters can round to 1 in the original addition.
  // The original then indexes outside its cache; do not invent wrap semantics.
  if (i < 0 || i >= count) throw new Error('Rail 原参数归一化越出缓存');
  const p0 = looped ? (i === 0 ? count - 1 : i - 1) : Math.max(0, i - 1);
  const p2 = looped ? (i === count - 1 ? 0 : i + 1) : i + 1;
  const p3 = looped ? (i === count - 2 ? 0 : p2 + 1) : Math.min(count - 1, i + 2);
  return {t: sub(scaled, f(i)), points: [p0, i, p2, p3]};
}
function coefficients(p0: number, p1: number, p2: number, p3: number, scalar: boolean) {
  const a = scalar ? sub(add(add(add(p0, p0), mul(p1, -5)), mul(p2, 4)), p3)
    : sub(add(sub(add(p0, p0), mul(p1, 5)), mul(p2, 4)), p3);
  const b = add(p3, sub(sub(mul(p1, 3), p0), mul(p2, 3)));
  return {a, b, d: sub(p2, p0), twice: add(p1, p1)};
}
function polynomial(c: ReturnType<typeof coefficients>, t: number) {
  return mul(add(c.twice, mul(t, add(c.d, mul(t, add(c.a, mul(t, c.b)))))), .5);
}
function derivative(c: ReturnType<typeof coefficients>, t: number) {
  return mul(add(c.d, mul(t, add(add(c.a, c.a), mul(mul(t, c.b), 3)))), .5);
}
// Original scalar 0x1005609d0: -5*p1 addition (vector uses 5*p1 subtraction).
export function railScalar(values: number[], looped: boolean, parameter: number) {
  const {t, points} = indices(values.length, looped, parameter);
  const p = points.map(i => f(values[i]));
  return polynomial(coefficients(p[0], p[1], p[2], p[3], true), t);
}
function curve(cache: RailCache, parameter: number, slope: boolean) {
  const {t, points} = indices(cache.positions.length, cache.looped, parameter);
  return [0, 1, 2].map(axis => {
    const p = points.map(i => f(cache.positions[i][axis]));
    const c = coefficients(p[0], p[1], p[2], p[3], false);
    return slope ? derivative(c, t) : polynomial(c, t);
  });
}
// Original position function 0x10055e420, xyz only (SIMD W is scratch).
export function railPosition(cache: RailCache, parameter: number) {return curve(cache, parameter, false);}

// Original fast line-segment distance 0x100789ac0; retain cancellation.
export function railSegmentDistanceSquared(eye: number[], a: number[], b: number[]) {
  const segment = difference(b.map(f), a.map(f)), delta = difference(eye.map(f), a.map(f));
  const projection = dot(segment, delta);
  if (projection <= 0) return dot(delta, delta);
  const length = dot(segment, segment);
  if (projection >= length) {const d = difference(eye.map(f), b.map(f)); return dot(d, d);}
  return sub(dot(delta, delta), div(mul(projection, projection), length));
}
// Original 0x10055d820, including the open-rail fractional-sampling quirk.
export function railClosestPoint(cache: RailCache, position: number[]) {
  const n = cache.positions.length, segments = n - 1 + Number(cache.looped), eye = position.map(f);
  if (n < 2 || eye.length !== 3 || !eye.every(Number.isFinite)) throw new Error('Rail 最近点输入无效');
  let segmentIndex = 0, minimum = f(1e9);
  for (let i = 0; i < segments; i++) {
    const d = railSegmentDistanceSquared(eye, cache.positions[i], cache.positions[(i + 1) % n]);
    if (minimum >= d) {minimum = d; segmentIndex = i;}
  }
  const start = cache.positions[segmentIndex].map(f);
  const direction = difference(cache.positions[(segmentIndex + 1) % n].map(f), start);
  const projection = Math.min(1, Math.max(0, div(dot(direction, difference(eye, start)), dot(direction, direction))));
  if (!Number.isFinite(projection)) throw new Error('Rail 原最近点选中了退化线段');
  if (!cache.looped && segmentIndex === 0 && projection <= 0) return {parameter: 0, position: start};
  if (!cache.looped && segmentIndex === n - 2 && projection >= 1) return {parameter: 1, position: cache.positions[n - 1].map(f)};
  const guess = div(add(projection, f(segmentIndex)), f(segments)), radius = div(.25, f(segments));
  const lower = sub(guess, radius), width = sub(add(guess, radius), lower);
  let best = 0, bestSquared = f(1e9), bestDelta = [0, 0, 0];
  for (let i = 0; i < 16; i++) {
    const raw = add(mul(mul(add(f(i), .5), width), .0625), lower);
    const delta = difference(eye, railPosition(cache, fraction(raw))), squared = dot(delta, delta);
    if (squared < bestSquared) {best = raw; bestSquared = squared; bestDelta = delta;}
  }
  const oldFraction = fraction(best), tangent = curve(cache, oldFraction, true), squared = dot(tangent, tangent);
  if (squared > 0) {
    const oldLength = f(Math.sqrt(bestSquared)), length = f(Math.sqrt(squared));
    best = fraction(add(best, div(div(div(dot(bestDelta, tangent), length), length), f(segments))));
    const delta = difference(eye, railPosition(cache, best));
    if (dot(delta, delta) > mul(oldLength, oldLength)) best = oldFraction;
  }
  return {parameter: best, position: railPosition(cache, best)};
}
function normalize(v: number[]) {
  const s = v.map(x => mul(x, x));
  // Cross instructions measure the pre-shuffle [y,z,x] vector: their
  // (lane2²+lane0²)+lane1² is also (x²+y²)+z² after the permutation.
  const length = f(Math.sqrt(add(s[2], add(s[0], s[1]))));
  return length > epsilon ? v.map(x => div(x, length)) : v;
}
function cross(a: number[], b: number[]) {
  return [sub(mul(a[1], b[2]), mul(a[2], b[1])), sub(mul(a[2], b[0]), mul(a[0], b[2])), sub(mul(a[0], b[1]), mul(a[1], b[0]))];
}
// Original full transform 0x100560b40. Endpoint tests use the incoming t;
// loop normalization is deliberately not applied to those tests.
export function railTransform(cache: RailCache, parameter: number, math: RailMath = railJsMath) {
  const t = f(parameter), n = cache.positions.length, position = railPosition(cache, t);
  let tangent: number[];
  if (mul(Math.max(Math.abs(t), 0), epsilon) >= Math.abs(t)) tangent = difference(cache.positions[1].map(f), cache.positions[0].map(f));
  else if (mul(Math.max(Math.abs(t), 1), epsilon) >= Math.abs(sub(t, 1))) tangent = difference(cache.positions[n - 1].map(f), cache.positions[n - 2].map(f));
  else tangent = curve(cache, t, true);
  tangent = normalize(tangent);
  const forward = tangent.map(x => -x), up = normalize(cache.transform.slice(4, 7).map(f));
  const right = normalize(cross(up, forward)), upBasis = normalize(cross(forward, right));
  const angle = railScalar(cache.rolls, cache.looped, t), [sin, cos] = math.sincos(angle).map(f);
  const [x, y, z] = tangent, u = sub(1, cos), xy = mul(mul(x, y), u), zx = mul(mul(z, x), u), yz = mul(mul(y, z), u);
  const xs = mul(x, sin), ys = mul(y, sin), zs = mul(z, sin);
  const rotation = [add(cos, mul(mul(x, x), u)), add(zs, xy), sub(zx, ys),
    sub(xy, zs), add(cos, mul(mul(y, y), u)), add(xs, yz),
    add(ys, zx), sub(yz, xs), add(cos, mul(mul(z, z), u))];
  const rotate = (v: number[]) => [0, 1, 2].map(r => add(mul(rotation[6 + r], v[2]), add(mul(rotation[3 + r], v[1]), mul(rotation[r], v[0]))));
  const basis = [...rotate(right), 0, ...rotate(upBasis), 0, ...rotate(forward), 0, 0, 0, 0, 1];
  const translation = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, ...position, 1];
  const scales = cache.scales.map(values => mul(railScalar(values, cache.looped, t), .5));
  const scaling = [scales[0], 0, 0, 0, 0, scales[1], 0, 0, 0, 0, scales[2], 0, 0, 0, 0, 1];
  return cloudCardMultiply(cloudCardMultiply(translation, basis), scaling);
}

export interface RailControlPoint {world: number[]; obb: number[];}
export interface RailCacheMath {atan2(y: number, x: number): number;}
export const railCacheJsMath: RailCacheMath = {atan2: (y, x) => f(Math.atan2(y, x))};
const shuffle = (v: number[], order: number[]) => order.map(i => v[i]);
const times = (a: number[], b: number[]) => a.map((v, i) => mul(v, b[i]));

// Original 0x10078a710. Preserve the intermediate SIMD shuffle/multiply order
// instead of replacing this with a projected-up angle from a math library.
export function railControlPointRoll(world: number[], referenceUp: number[], math: RailCacheMath = railCacheJsMath) {
  const up = normalize(world.slice(4, 7).map(f)), axis = normalize(world.slice(8, 11).map(f)), negAxis = axis.map(v => -v);
  const p = [2, 0, 1], q = [1, 2, 0];
  const c = difference(times(shuffle(referenceUp, p), negAxis), times(referenceUp, shuffle(negAxis, p)));
  const left = shuffle(times(c, negAxis), p), right = times(shuffle(c, q), axis);
  const projected = shuffle(left.map((v, i) => add(v, right[i])), p);
  const sineVector = shuffle(difference(times(up, shuffle(projected, p)), times(shuffle(up, p), projected)), p);
  return f(math.atan2(dot(sineVector, negAxis), dot(up, projected)));
}

// Original non-null control-point cache rebuild 0x10055cf30, with explicit
// GetTransform/GetObb outputs. Dynamic invalidation/allocation is separate.
export function buildRailCache(points: RailControlPoint[], transform: number[], looped: boolean, math: RailCacheMath = railCacheJsMath): RailCache {
  if (points.length < 2 || transform.length !== 16 || !transform.every(Number.isFinite) || points.some(p => p.world.length !== 16 || p.obb.length !== 16 || !p.world.every(Number.isFinite) || !p.obb.every(Number.isFinite))) throw new Error('Rail 控制点 getter 矩阵无效');
  const up = normalize(transform.slice(4, 7).map(f)), positions: number[][] = [], scales: RailCache['scales'] = [[], [], []], rolls: number[] = [];
  for (const point of points) {
    positions.push(point.world.slice(12, 15).map(f));
    const bounds = cloudCardMultiply(point.world.map(f), point.obb.map(f));
    for (let i = 0; i < 3; i++) {
      const axis = bounds.slice(i * 4, i * 4 + 3), length = f(Math.sqrt(dot(axis, axis)));
      scales[i].push(add(length, length));
    }
    rolls.push(railControlPointRoll(point.world.map(f), up, math));
  }
  const pi = f(Math.PI), tau = f(Math.PI * 2);
  for (let i = 1; i < rolls.length; i++) {
    let d = sub(rolls[i], rolls[i - 1]);
    d = sub(d, mul(f(Math.floor(div(add(d, pi), tau))), tau));
    rolls[i] = add(rolls[i - 1], d);
  }
  return {positions, scales, rolls, transform: transform.map(f), looped};
}

export interface RailMarkerInput {position: number[]; quaternion: number[]; scale: number[];}
// Original Marker GetTransform 0x10043e2d0: normalize each quaternion column
// before applying scale; the quaternion itself is not normalized.
export function railMarkerTransform(marker: RailMarkerInput) {
  return getNativeMarkerTransformFromComponents(marker);
}
export const RAIL_MARKER_OBB = [.5, 0, 0, 0, 0, .5, 0, 0, 0, 0, .5, 0, 0, 0, 0, 1];
