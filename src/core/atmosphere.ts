// Recovered Ambience sky color and ray samplers. Inputs describe initialized
// runtime fields; event dispatch, planet state and probe rendering are separate.
const f = Math.fround;
function vector(value: number[], name: string) {
  if (value.length !== 4 || !value.every(Number.isFinite)) throw new Error(`缺少有限四分量 ${name}`);
  return value.map(f);
}
function length3(value: number[]) { return f(Math.sqrt(f(f(f(value[0] * value[0]) + f(value[1] * value[1])) + f(value[2] * value[2])))); }

export interface SkyTints { tintBot: number[]; tintMidBot: number[]; tintMidMid: number[]; tintMidTop: number[]; tintTop: number[]; }
function weightedSky(colors: number[][], centers: number[], x: number, sharpness: number, expf: (value: number) => number = Math.exp) {
  const weights = centers.map(center => { const delta = f(center - x); return f(expf(-f(f(delta * delta) * sharpness))); });
  let sum = weights[0]; for (let i = 1; i < weights.length; i++) sum = f(sum + weights[i]);
  const out = colors[0].map(value => f(weights[0] * value));
  for (let i = 1; i < colors.length; i++) for (let lane = 0; lane < 4; lane++) out[lane] = f(out[lane] + f(weights[i] * colors[i][lane]));
  for (let lane = 0; lane < 3; lane++) {
    const normalized = f(out[lane] / sum);
    // Original SSE divps returns the negative quiet indefinite NaN when every
    // Gaussian tap underflows (0/0). Preserve it, rather than inventing a color.
    out[lane] = Number.isNaN(normalized) ? -Number.NaN : normalized;
  }
  out[3] = 1;
  return out;
}
function tintVectors(tints: SkyTints) {
  const bot = vector(tints.tintBot, 'tintBot'), top = vector(tints.tintTop, 'tintTop');
  return [bot, bot, vector(tints.tintMidBot, 'tintMidBot'), vector(tints.tintMidMid, 'tintMidMid'), vector(tints.tintMidTop, 'tintMidTop'), top, top];
}
// 0x100064820: seven Gaussian taps, with repeated bottom/top endpoint colors.
export function sampleSkyTints(tints: SkyTints, coordinate: number, sharpness: number, expf?: (value: number) => number) {
  if (![coordinate, sharpness].every(Number.isFinite)) throw new Error('天空采样输入必须有限');
  return weightedSky(tintVectors(tints), [-.25, 0, .25, .5, .75, 1, 1.25], f(coordinate), f(sharpness), expf);
}
// 0x100064a20: the cheap-fog gradient has different coordinates and field slots.
export function sampleCheapFogTints(tints: SkyTints, coordinate: number, sharpness: number, height: number, expf?: (value: number) => number) {
  if (![coordinate, sharpness, height].every(Number.isFinite)) throw new Error('雾采样输入必须有限');
  const scale = f(f(height) + 4);
  return weightedSky(tintVectors(tints), [-1, 0, 1, 2, 3, 4, 5].map(center => f(center / scale)), f(coordinate), f(sharpness), expf);
}
export function skyTintLookup(tints: SkyTints) {
  const lookup = new Float32Array(64 * 4);
  for (let i = 0; i < 64; i++) lookup.set(sampleSkyTints(tints, f(i / 63), 10), i * 4);
  return lookup;
}

export interface AtmosphereRayInput {
  eye: number[]; direction: number[]; planetSphere: number[]; sunDirection: number[];
  sunColor: number[]; averageSkyboxColor: number[]; atmosphereSunColor: number[];
  atmosphereDensity: number; fogDensity: number; fogHeight: number; atmosphereSample: number;
  tintLookup: Float32Array;
}
// 0x100064c60. Preserve separate atmospheric/fog optical depths, float64 phase
// expression and the original alpha composition. No substitute sky gradient.
export function sampleAtmosphereRay(input: AtmosphereRayInput) {
  return createAtmosphereRaySampler(input)(input.direction);
}
/** Prepare a probe's common eye/environment once. Per-ray float operation
 * order stays unchanged and callers retain the ordinary single-ray API. */
export function createAtmosphereRaySampler(input:Omit<AtmosphereRayInput,'direction'>) {
  const eye = vector(input.eye, 'eye'), sphere = vector(input.planetSphere, 'planetSphere');
  const sunDir = vector(input.sunDirection, 'sunDirection'), sun = vector(input.sunColor, 'sunColor');
  const average = vector(input.averageSkyboxColor, 'averageSkyboxColor'), scatter = vector(input.atmosphereSunColor, 'atmosphereSunColor');
  if (![input.atmosphereDensity, input.fogDensity, input.fogHeight, input.atmosphereSample].every(Number.isFinite)
    || input.tintLookup.length !== 256 || !input.tintLookup.every(Number.isFinite)) throw new Error('大气运行输入不完整');
  const distance = length3(sphere.map((value, lane) => f(value - eye[lane])));
  const traceDistance = Math.max(15000, f(Math.sqrt(Math.max(0, f(f(distance * distance) - f(sphere[3] * sphere[3]))))));
  return (direction:number[])=>{
  const ray=vector(direction,'direction');
  const far = eye.map((value, lane) => f(value + f(ray[lane] * (lane === 3 ? 0 : 25000))));
  const traced = eye.map((value, lane) => f(value + f(traceDistance * ray[lane])));
  const height = f(length3(traced.map((value, lane) => f(value - sphere[lane]))) - sphere[3]);
  const delta = far.map((value, lane) => f((lane === 1 ? height : value) - eye[lane]));
  const rayLength = length3(delta);
  let slope = f(delta[1] / rayLength);
  if (Math.abs(slope) < f(.1)) slope = slope < 0 ? f(-.1) : f(.1);
  const endHeight = f(f(rayLength * slope) + eye[1]);
  const densityScale = f(.0008325480157509446), heightScale = f(.0009016839903779328);
  const clampDepth = (value: number) => Math.min(10000, Math.max(0, value));
  const exp2 = (value: number) => f(2 ** value);
  const opticalDepth = (density: number, exponent: number) => clampDepth(f(
    f(f(exp2(f(exponent * eye[1])) - exp2(f(exponent * endHeight))) * f(densityScale * f(density))) / f(-exponent * slope)));
  const atmosphere = opticalDepth(input.atmosphereDensity, -heightScale);
  const fog = opticalDepth(input.fogDensity, f(-heightScale / f(input.fogHeight)));
  const dotTerms = sunDir.map((value, lane) => f(-value * ray[lane]));
  const dot = f(f(dotTerms[0] + dotTerms[1]) + dotTerms[2]), dotSquared = f(dot * dot);
  // The original converts both terms to double before multiply and add.
  const phase = f((dot * .4 + dotSquared * .2) + .4);
  const atmosphereAlpha = f(1 - exp2(f(atmosphere * -5))), fogAlpha = f(1 - exp2(f(fog * -20)));
  const coordinate = f(Math.min(1, exp2(f(f(f(phase * atmosphere) * f(input.atmosphereSample)) * f(-.15)))) * 64);
  const base = Math.trunc(coordinate), fraction = f(coordinate - f(base)), left = Math.min(63, base), right = Math.min(63, base + 1);
  const lookup = Array.from({ length: 4 }, (_, lane) => f(input.tintLookup[left * 4 + lane] + f(f(input.tintLookup[right * 4 + lane] - input.tintLookup[left * 4 + lane]) * fraction)));
  lookup[3] = 1;
  const scale = f(f(f(1 + dotSquared) * atmosphere) * phase);
  const atmosphereColor = lookup.map((value, lane) => f(f(value * scatter[lane]) * scale));
  const forward = Math.max(0, f(dot * dotSquared));
  const baseColor = sun.map((value, lane) => f(average[lane] + (lane === 3 ? value : f(value * forward))));
  const falloff = f(f(f(fog * f(3333.300048828125)) * f(f(.004999999888241291) / f(f(.004999999888241291) - f(dot - 1)))) * f(1 - fogAlpha));
  const fogScale = f(falloff + f(fogAlpha * phase));
  const fogColor = baseColor.map((value, lane) => lane === 3 ? average[lane] : f(value * fogScale));
  const atmospheric = atmosphereColor.map((value, lane) => lane === 3 ? scatter[lane] : f(value * atmosphereAlpha));
  const mix = Math.min(1, Math.max(0, fogAlpha));
  const out = atmospheric.map((value, lane) => f(f(value + f(mix * f(fogColor[lane] - value))) * (lane === 3 ? 0 : .5)));
  out[3] = f(fogAlpha + f(atmosphereAlpha * f(1 - fogAlpha)));
  return out;
  };
}
