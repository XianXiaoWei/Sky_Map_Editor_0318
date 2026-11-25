// Sky 0.3.18: Environment.cpp field interpolation 0x10031a230.
// Tags and jump targets are recovered from its inline 12-entry jump table.
// Float32 rounding is applied after each instruction; scalar float interpolation
// and vector interpolation deliberately use the two different native expressions.
export enum EnvFieldType { Int8, Uint8, Int16, Uint16, Int32, Uint32, Float32, Float64, Vector3, Vector4, Color, Bool }
export type EnvValue = number | number[];
const f = Math.fround;
export const ENV_WEIGHT_EPSILON = f(0.0001); // executable constant 0x100aa6a9c

function cvtt32(value: number) { return !Number.isFinite(value) || value < -2147483648 || value >= 2147483648 ? -2147483648 : Math.trunc(value); }
function scalar(value: EnvValue) { if (typeof value !== 'number') throw new Error('环境标量类型不匹配'); return value; }
function vector(value: EnvValue) { if (!Array.isArray(value) || value.length !== 4) throw new Error('原版环境向量需要四个存储分量'); return value; }

export function lerpEnvField(type: EnvFieldType, a: EnvValue, b: EnvValue, weight: number): EnvValue {
  let t = f(weight);
  if (type === EnvFieldType.Bool) return t >= .5 ? scalar(b) : scalar(a);
  if (type >= EnvFieldType.Vector3 && type <= EnvFieldType.Color) {
    if (type === EnvFieldType.Color) t = Math.min(1, Math.max(0, t));
    const av = vector(a), bv = vector(b);
    return av.map((n, i) => f(f(n) + f(f(f(bv[i]) - f(n)) * (type === EnvFieldType.Vector3 && i === 3 ? 0 : t))));
  }
  const av = scalar(a), bv = scalar(b), left = f(1 - t);
  if (type === EnvFieldType.Float64) return left * av + t * bv;
  const value = f(f(left * f(av)) + f(t * f(bv)));
  if (type === EnvFieldType.Float32) return value;
  if (type === EnvFieldType.Int8) return cvtt32(value) << 24 >> 24;
  if (type === EnvFieldType.Uint8) return Math.trunc(value) & 255;
  if (type === EnvFieldType.Int16) return cvtt32(value) << 16 >> 16;
  if (type === EnvFieldType.Uint16) return Math.trunc(value) & 65535;
  if (type === EnvFieldType.Int32) return cvtt32(value);
  if (type === EnvFieldType.Uint32) return Math.trunc(value) >>> 0;
  throw new Error('未经确认的环境插值类型');
}

export interface EnvFieldSpec { name: string; type: EnvFieldType; }
export interface WeightedEnv { weight: number; values: Record<string, EnvValue>; }

// 0x10031aec0: four layers in ascending order. Each layer first computes a
// weighted average, then interpolates the accumulated result by min(1, sum).
// Caller supplies ORIGINAL node order, spatial weights and temporal fade values.
// Recovering those inputs is a separate part of the environment runtime.
export function blendEnvLayers(fields: EnvFieldSpec[], defaults: Record<string, EnvValue> | undefined, layers: WeightedEnv[][], previousOutput?: Record<string, EnvValue>) {
  if (layers.length !== 4) throw new Error('原版环境要求四层');
  let values = Object.fromEntries(fields.map(field => {
    const value = (defaults ?? previousOutput)?.[field.name]; if (value === undefined) throw new Error(`缺少原版默认环境字段或上一帧输出 ${field.name}`);
    return [field.name, defaults ? lerpEnvField(field.type, value, value, 0) : Array.isArray(value) ? [...value] : value];
  }));
  const sums: number[] = [];
  for (const layer of layers) {
    let sum = f(0), average: Record<string, EnvValue> | undefined;
    for (const node of layer) {
      const w = f(node.weight); if (!Number.isFinite(w)) throw new Error('环境权重必须有限');
      if (w < ENV_WEIGHT_EPSILON) continue;
      sum = f(sum + w); const t = f(w / sum);
      const previous = average ?? Object.fromEntries(fields.map(field => [field.name, field.type >= EnvFieldType.Vector3 && field.type <= EnvFieldType.Color ? [0, 0, 0, 0] : 0]));
      average = Object.fromEntries(fields.map(field => {
        const next = node.values[field.name]; if (next === undefined) throw new Error(`环境节点缺少字段 ${field.name}`);
        return [field.name, lerpEnvField(field.type, previous[field.name], next, t)];
      }));
    }
    sums.push(sum);
    if (sum > ENV_WEIGHT_EPSILON && average) values = Object.fromEntries(fields.map(field => [field.name, lerpEnvField(field.type, values[field.name], average![field.name], Math.min(1, sum))]));
  }
  return { values, sums };
}

export interface EnvHull { position: number[]; quaternion: number[]; scale: number[]; falloff: number; }
export interface EnvMarker { id: number; enabled: boolean; position: number[]; quaternion: number[]; scale: number[]; }
export interface EnvFadeState { enabled: boolean; wasEnabled: boolean; remaining: number; alpha: number; }
export interface EnvFadeTiming { fadeIn: number; fadeOut: number; duration: number; }

// Original direct-EnvNode branch of 0x10031a450. Activation resets its timer
// to duration+fadeIn. Expiration disables the original node before fading out.
export function stepEnvFade(state: EnvFadeState, timing: EnvFadeTiming, delta: number): EnvFadeState {
  const dt = f(delta), fadeIn = f(timing.fadeIn), fadeOut = f(timing.fadeOut), duration = f(timing.duration);
  let remaining = Math.max(f(f(state.remaining) - dt), 0), enabled = state.enabled;
  if (enabled && !state.wasEnabled) remaining = f(duration + fadeIn);
  if (enabled && duration !== 0 && remaining === 0) enabled = false;
  const denominator = Math.max(enabled ? fadeIn : fadeOut, ENV_WEIGHT_EPSILON) * (enabled ? 1 : -1);
  const alpha = Math.min(1, Math.max(0, f(f(state.alpha) + f(dt / denominator))));
  return { enabled, wasEnabled: enabled, remaining, alpha };
}
const add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b);
const dot = (a: number[], b: number[]) => add(mul(a[2], b[2]), add(mul(a[0], b[0]), mul(a[1], b[1])));
const length = (v: number[]) => f(Math.sqrt(dot(v, v)));

// Native 0x10031a6f0, direct EnvNode branch 0x10031a9f4.
// Scale means full OBB size; falloff applies to distance from the nearest OBB
// point, then multiplies the temporal alpha. Clump hull resolution is separate.
export function envHullWeight(point: number[], hull: EnvHull, temporalAlpha: number) {
  const alpha = f(temporalAlpha); if (alpha <= 0) return 0;
  const pos = hull.position.map(f), q = hull.quaternion.map(f), scale = hull.scale.map(f), p = point.map(f), falloff = f(hull.falloff);
  if (pos.length < 3 || q.length !== 4 || scale.length < 3 || p.length < 3) throw new Error('环境范围变换分量无效');
  if (![...pos, ...q, ...scale, ...p, falloff, alpha].every(Number.isFinite)) throw new Error('环境范围需要有限数值');
  const delta = p.slice(0, 3).map((v, i) => sub(v, pos[i]));
  const radius = add(mul(Math.max(...scale.slice(0, 3)), f(1.41421)), falloff);
  if (dot(delta, delta) > mul(radius, radius)) return 0;
  const [x, y, z, w] = q, xx = mul(x, add(x, x)), yy = mul(y, add(y, y)), zz = mul(z, add(z, z));
  const xy = mul(x, add(y, y)), xz = mul(x, add(z, z)), yz = mul(y, add(z, z));
  const wx = mul(w, add(x, x)), wy = mul(w, add(y, y)), wz = mul(w, add(z, z));
  const axes = [
    [sub(sub(1, yy), zz), add(xy, wz), sub(xz, wy)],
    [sub(xy, wz), sub(sub(1, xx), zz), add(yz, wx)],
    [add(xz, wy), sub(yz, wx), sub(sub(1, xx), yy)],
  ].map(axis => { const size = length(axis); return size > f(.00001) ? axis.map(n => f(n / size)) : axis; });
  const closest = pos.slice(0, 3); let inside = true;
  for (let i = 0; i < 3; i++) {
    const projection = dot(delta, axes[i]), extent = mul(scale[i], .5), tolerance = f(.00001);
    let clamped = projection;
    if (projection > extent) { inside &&= projection <= add(extent, tolerance); clamped = extent; }
    else if (-projection > extent) { inside &&= -projection <= add(extent, tolerance); clamped = -extent; }
    for (let j = 0; j < 3; j++) closest[j] = add(closest[j], mul(axes[i][j], clamped));
  }
  if (inside) return alpha;
  const distance = length(p.slice(0, 3).map((v, i) => sub(v, closest[i])));
  return mul(Math.max(0, sub(1, f(distance / falloff))), alpha);
}

// Original Clump branch 0x10031a738..0x10031a9ef: evaluate every direct
// Marker, take the maximum spatial weight, then multiply temporal alpha ONCE.
// Marker enabled flags do not mask individual boxes. The first marker alone
// controls the shared timer (0x10031a49f); nested Clumps are not flattened.
export function envClumpWeight(point: number[], markers: EnvMarker[], falloff: number, temporalAlpha: number) {
  const alpha = f(temporalAlpha); if (alpha <= 0) return 0;
  let maximum = f(0);
  for (const marker of markers) maximum = Math.max(maximum, envHullWeight(point, { ...marker, falloff }, 1));
  return mul(maximum, alpha);
}
