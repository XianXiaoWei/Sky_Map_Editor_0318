import { sampleSkyTints, type SkyTints } from './atmosphere';

const f = Math.fround, add = (a: number, b: number) => f(f(a) + f(b)), sub = (a: number, b: number) => f(f(a) - f(b)), mul = (a: number, b: number) => f(f(a) * f(b)), div = (a: number, b: number) => f(f(a) / f(b));
const length3 = (v: number[]) => f(Math.sqrt(add(add(mul(v[0], v[0]), mul(v[1], v[1])), mul(v[2], v[2]))));
/** Initialized by the original Color module initializer 0x10077dcb0, store
 * 0x10077dd5c from 0x100aa7660 to 0x10203f6b0. This is not a preview tint. */
export const ORIGINAL_AMBIENCE_WHITE = [1, 1, 1, 1] as const;
export interface AmbienceSunMath {
  sinf(value: number): number; cosf(value: number): number; powf(value: number, exponent: number): number;
  expf(value: number): number; exp2f(value: number): number;
}
export const previewAmbienceSunMath: AmbienceSunMath = { sinf: Math.sin, cosf: Math.cos, powf: Math.pow, expf: Math.exp, exp2f: value => 2 ** value };
export interface AmbienceSunInput {
  color: number[]; intensity: number; angleXZ: number; angleY: number;
  cheapFog: number; atmosphereDensity: number; tints: SkyTints;
  eye: number[]; planetSphere: number[]; white?: number[];
}
/** Ambience.Update 0x10005b39c..0x10005b6e2, including original direction
 * helper 0x100064550 and sky sampler 0x100064820. Original planet/camera and
 * libm are explicit inputs/services. The cheap-fog path intentionally keeps
 * the supplied sun color; regular sky applies atmospheric transmission/tint.
 * This is the derived-sun subchain, not the full Ambience update/probe system.
 */
export function deriveOriginalAmbienceSun(input: AmbienceSunInput, math: AmbienceSunMath = previewAmbienceSunMath) {
  const x = div(mul(f(Math.PI), input.angleXZ), 180), y = div(mul(f(Math.PI), input.angleY), 180);
  const sx = f(math.sinf(x)), cx = f(math.cosf(x)), cy = f(math.cosf(y)), sy = f(math.sinf(y));
  const direction = [-mul(sx, cy), -sy, -mul(cx, cy), -0];
  let referenceRay = [1, Math.max(f(.05), sy), 0, 0];
  const raySize = length3(referenceRay);
  if (raySize > f(.00001)) referenceRay = referenceRay.map(v => div(v, raySize));
  const atmosphereSample = f(math.powf(sub(1, referenceRay[1]), 5));
  const atmosphereSunColor = input.color.map(f);
  if (input.cheapFog) return { direction, atmosphereSample, atmosphereSunColor, sunColor: atmosphereSunColor.slice(), transmission: null as number | null };
  const eye = input.eye.map(f), sphere = input.planetSphere.map(f);
  const distance = length3(sphere.map((v, i) => sub(v, eye[i])));
  const traceDistance = Math.max(15000, f(Math.sqrt(Math.max(0, sub(mul(distance, distance), mul(sphere[3], sphere[3]))))));
  const far = referenceRay.map((v, i) => add(eye[i], mul(v, 25000)));
  const traced = referenceRay.map((v, i) => add(eye[i], mul(v, traceDistance)));
  const height = sub(length3(traced.map((v, i) => sub(v, sphere[i]))), sphere[3]);
  far[1] = height;
  const delta = far.map((v, i) => sub(v, eye[i])), size = length3(delta);
  let slope = div(delta[1], size);
  if (Math.abs(slope) < f(.1)) slope = slope < 0 ? f(-.1) : f(.1);
  const density = mul(input.atmosphereDensity, f(.0008325480157509446));
  const start = f(math.exp2f(mul(eye[1], f(-.0009016839903779328))));
  const end = f(math.exp2f(mul(add(mul(slope, size), eye[1]), f(-.0009016839903779328))));
  const depth = Math.min(10000, Math.max(0, div(mul(sub(start, end), density), mul(slope, f(.0009016839903779328)))));
  const transmission = f(math.exp2f(mul(mul(depth, -.5), atmosphereSample)));
  const tint = sampleSkyTints(input.tints, transmission, 10, math.expf);
  const weight = Math.min(1, transmission), white = input.white ?? [...ORIGINAL_AMBIENCE_WHITE];
  const sunColor = atmosphereSunColor.map((v, i) => i === 3 ? v : mul(mul(v, add(tint[i], mul(weight, sub(white[i], tint[i])))), input.intensity));
  return { direction, atmosphereSample, atmosphereSunColor, sunColor, transmission };
}

/** Original late Ambience.Update stores 0x10005beae..0x10005bf5b.
 * The caller controls prior/current sphere timing; this helper only computes
 * the original camera-relative 640000-radius sphere for the next frame. */
export function originalAmbiencePlanetSphere(eye: number[]) {
  const a = Math.min(1, Math.max(0, div(eye[1], 2000))), left = sub(1, a);
  return [mul(left, eye[0]), add(mul(left, -640000), mul(a, -640000)), mul(left, eye[2]), 640000];
}
