// EnvironmentForces::Update 0x100326666..0x1003273b6. Explicit initialized
// snapshot; object events and the preceding boundary-force query are separate.
const f = Math.fround, add = (a: number, b: number) => f(f(a) + f(b));
const sub = (a: number, b: number) => f(f(a) - f(b));
const mul = (a: number, b: number) => f(f(a) * f(b));
const div = (a: number, b: number) => f(f(a) / f(b));
const clamp = (v: number) => Math.min(1, Math.max(0, v));
export interface GustMath {cos: (x: number) => number; exp: (x: number) => number; sincos: (x: number) => [number, number];}
export const previewGustMath: GustMath = {
  cos: x => f(Math.cos(x)), exp: x => f(Math.exp(x)), sincos: x => [f(Math.sin(x)), f(Math.cos(x))],
};
export interface GustState {ambient: number; phase0: number; phase1: number; smoothedWind: number[];}
export interface GustInput {
  time: number; scaledDelta: number; ambientTarget: number; boundaryForce: number[];
  overrideWind?: number[];
}
function latticeNoise(integer: number) {
  const n = ((integer << 13) ^ integer) | 0;
  const square = Math.imul(n, n), polynomial = (Math.imul(square, 0x3d73) + 0xc0ae5) | 0;
  const hash = (Math.imul(n, polynomial) + 0x5208dd0d) & 0x7fffffff;
  return mul(sub(1, mul(f(hash), 9.313225746154785e-10)), .5);
}
function interpolatedNoise(time: number, math: GustMath) {
  const t = f(time), integer = Math.trunc(t);
  const cosine = f(math.cos(mul(sub(t, integer), f(Math.PI))));
  const weight = mul(sub(1, cosine), .5);
  return add(mul(sub(1, weight), latticeNoise(integer)), mul(weight, latticeNoise(integer + 1)));
}
function fractalNoise(time: number, math: GustMath, second: number, third: number) {
  return add(add(interpolatedNoise(time, math), mul(interpolatedNoise(add(time, time), math), second)),
    mul(interpolatedNoise(mul(time, 4), math), third));
}
export function stepEnvironmentGust(state: GustState, input: GustInput, math: GustMath = previewGustMath): GustState & {globalWind: number[]} {
  const vec = (v: number[]) => v.length === 3 && v.every(x => Number.isFinite(f(x)));
  if (!vec(state.smoothedWind) || !vec(input.boundaryForce) || input.overrideWind && !vec(input.overrideWind) ||
    ![state.ambient, state.phase0, state.phase1, input.time, input.scaledDelta, input.ambientTarget].every(x => Number.isFinite(f(x))) ||
    Math.min(state.phase0, state.phase1, input.time) < 0 || Math.max(state.phase0, state.phase1, input.time) > 1e8) throw new Error('全局阵风需要有效原运行快照');
  let ambient = f(state.ambient), phase0 = f(state.phase0), phase1 = f(state.phase1), desired: number[];
  if (input.overrideWind) desired = input.overrideWind.map(f);
  else {
    const baseAngle = mul(fractalNoise(div(input.time, 30), math, f(.333), f(.110889)), f(Math.PI));
    const ambientWeight = clamp(sub(1, f(math.exp(mul(input.scaledDelta, f(-1.01704740524292))))));
    ambient = add(mul(ambientWeight, input.ambientTarget), mul(sub(1, ambientWeight), ambient));
    const ratio = clamp(div(ambient, 10)), frequency = add(ratio, ratio);
    phase0 = add(phase0, mul(input.scaledDelta, frequency));
    phase1 = add(phase1, mul(input.scaledDelta, mul(frequency, frequency)));
    const spread = add(mul(ratio, f(.3490658700466156)), f(.0872664675116539));
    const angle = add(add(baseAngle, baseAngle), mul(spread, fractalNoise(phase1, math, f(.333), f(.110889))));
    const halfAmbient = mul(.5, ambient);
    const pulse = add(halfAmbient, mul(halfAmbient, fractalNoise(phase0, math, .25, .0625)));
    const slow = add(mul(fractalNoise(div(input.time, 10), math, f(.333), f(.110889)), .5), .5);
    const strength = Math.max(0, mul(pulse, slow));
    const [sin, cos] = math.sincos(angle).map(f);
    desired = [add(mul(strength, cos), 0), 0, add(mul(strength, sin), 0)];
  }
  const weight = clamp(sub(1, f(math.exp(mul(input.scaledDelta, f(-6.694305896759033))))));
  const smoothedWind = desired.map((v, i) => add(mul(weight, v), mul(sub(1, weight), state.smoothedWind[i])));
  return {ambient, phase0, phase1, smoothedWind, globalWind: smoothedWind.map((v, i) => add(v, input.boundaryForce[i]))};
}
