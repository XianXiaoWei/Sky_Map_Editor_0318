import { NativeObjectFoundationFailure } from './object-foundation-runtime';

const view = (b: Uint8Array) => new DataView(b.buffer, b.byteOffset, b.byteLength);
const epsilon = Math.fround(0.00001);
export type MarkerArithmeticOperation = 'add' | 'subtract' | 'multiply' | 'divide' | 'sqrt';
/** Non-finite arithmetic, NaN payload propagation and non-default MXCSR are
 * explicit dependencies. Ordinary finite operations round after every SSE op. */
export class NativeMarkerArithmeticBoundary extends Error {
  constructor(public readonly operation: MarkerArithmeticOperation, public readonly a: number, public readonly b?: number) {
    super(`Marker ${operation} requires a verified non-finite arithmetic service`);
  }
}
export interface NativeMarkerArithmeticServices {
  calculate(operation: MarkerArithmeticOperation, a: number, b?: number): number;
}
function arithmetic(s?: NativeMarkerArithmeticServices) {
  const op = (operation: MarkerArithmeticOperation, a: number, b?: number): number => {
    const result = Math.fround(operation === 'add' ? a + b! : operation === 'subtract' ? a - b! : operation === 'multiply' ? a * b! : operation === 'divide' ? a / b! : Math.sqrt(a));
    if (Number.isFinite(a) && (b === undefined || Number.isFinite(b)) && Number.isFinite(result)) return result;
    if (s) return s.calculate(operation, a, b);
    throw new NativeMarkerArithmeticBoundary(operation, a, b);
  };
  const add = (a: number, b: number) => op('add', a, b), sub = (a: number, b: number) => op('subtract', a, b);
  const mul = (a: number, b: number) => op('multiply', a, b), div = (a: number, b: number) => op('divide', a, b), sqrt = (a: number) => op('sqrt', a);
  // Original xyz reduction is z² + (x² + y²), not a generic vector library.
  const length = (a: number[]) => sqrt(add(mul(a[2], a[2]), add(mul(a[0], a[0]), mul(a[1], a[1]))));
  const normalize = (a: number[]) => { const n = length(a); return n > epsilon ? a.map(x => div(x, n)) : a; };
  return { add, sub, mul, div, sqrt, length, normalize };
}
function check(b: Uint8Array, n: number): void { if (b.byteLength < n) throw new Error('Original Marker/matrix storage truncated'); }

/** Component adapter for existing Rail/Avatar consumers. The byte runtime
 * owns matrix arithmetic; omitted SIMD padding is supplied by the adapter. */
export function getNativeMarkerTransformFromComponents(marker: {position: number[]; quaternion: number[]; scale: number[]}): number[] {
  if (marker.position.length < 3 || marker.quaternion.length !== 4 || marker.scale.length < 3 || ![...marker.position, ...marker.quaternion, ...marker.scale].every(Number.isFinite)) throw new Error('Marker 变换输入无效');
  const storage = new Uint8Array(80), v = view(storage);
  [marker.position, marker.quaternion, marker.scale].forEach((ns, i) => ns.slice(0, 4).forEach((n, j) => v.setFloat32(16 + i * 16 + j * 4, n, true)));
  const matrix = view(getNativeMarkerTransform(storage)); return Array.from({length: 16}, (_, i) => matrix.getFloat32(i * 4, true));
}

/** Marker virtual +0x18, 0x10043e2d0. Axes are independently normalized;
 * quaternion normalization is deliberately absent. Output may alias Marker. */
export function getNativeMarkerTransform(storage: Uint8Array, out: Uint8Array = new Uint8Array(64), s?: NativeMarkerArithmeticServices): Uint8Array {
  check(storage, 80); check(out, 64);
  const v = view(storage), { add, sub, mul, normalize } = arithmetic(s);
  const x = v.getFloat32(32, true), y = v.getFloat32(36, true), z = v.getFloat32(40, true), w = v.getFloat32(44, true);
  const yy2 = add(y, y), zz2 = add(z, z), xy = mul(x, yy2), xz = mul(x, zz2), yy = mul(y, yy2), wy = mul(w, yy2), zz = mul(z, zz2), wz = mul(w, zz2);
  const a = normalize([sub(sub(1, yy), zz), add(xy, wz), sub(xz, wy)]);
  const xx2 = add(x, x), xx = mul(x, xx2), wx = mul(w, xx2), yz = mul(y, zz2), oneMinusXX = sub(1, xx);
  const b = normalize([sub(xy, wz), sub(oneMinusXX, zz), add(yz, wx)]);
  // Original XOR -> normalization -> XOR preserves signs, including zero.
  const c = normalize([add(xz, wy), sub(yz, wx), sub(oneMinusXX, yy)].map(n => -n)).map(n => -n);
  const position = Uint8Array.from(storage.subarray(16, 32)), scales = [48, 52, 56].map(at => v.getFloat32(at, true));
  const columns = [a, b, c].map((axis, i) => [...axis, 0].map(n => mul(n, scales[i])));
  const o = view(out); columns.forEach((axis, i) => axis.forEach((n, j) => o.setFloat32(i * 16 + j * 4, n, true)));
  out.set(position, 48); o.setFloat32(60, 1, true); return out;
}

/** Whole 0x10043ccd0 finite-arithmetic path. NaN validation covers all 16
 * lanes before writing. Translation is copied before axes are reloaded, as
 * required for source/Marker aliasing. Scale padding and enabled are retained. */
export function setNativeMarkerTransform(storage: Uint8Array, matrix: Uint8Array, s?: NativeMarkerArithmeticServices): void {
  check(storage, 80); check(matrix, 64); const input = view(matrix), target = view(storage);
  for (let i = 0; i < 16; i++) if ((input.getUint32(i * 4, true) & 0x7fffffff) > 0x7f800000)
    throw new NativeObjectFoundationFailure('Marker.cpp', 78, 3, '!isNan( mat )');
  storage.set(matrix.slice(48, 64), 16);
  const { add, sub, mul, div, sqrt, length } = arithmetic(s);
  const axes = [0, 16, 32].map(at => [0, 4, 8].map(j => input.getFloat32(at + j, true)));
  for (let i = 0; i < 3; i++) { const n = length(axes[i]); target.setFloat32(48 + i * 4, n, true); if (n > epsilon) axes[i] = axes[i].map(x => div(x, n)); }
  const [a, b, c] = axes, traceNegative = add(add(a[0], b[1]), c[2]) < 0;
  const greaterZx = c[2] > a[0], greaterZy = c[2] > b[1];
  const swapX = (b[1] > a[0] || greaterZx) && traceNegative;
  const swapY = (b[1] <= a[0] || greaterZy) && traceNegative;
  const swapZ = !(greaterZx && greaterZy) && traceNegative;
  const k = add(add(add(swapX ? -a[0] : a[0], swapY ? -b[1] : b[1]), swapZ ? -c[2] : c[2]), 1);
  const factor = mul(div(1, sqrt(k)), 0.5);
  const q3 = mul(factor, sub(b[2], swapX ? -c[1] : c[1]));
  let q4 = mul(factor, sub(c[0], swapY ? -a[2] : a[2]));
  let q5 = mul(factor, sub(a[1], swapZ ? -b[0] : b[0]));
  let q0 = mul(factor, k), q1: number, q2: number;
  // Preserve the integer flags across the scalar SSE operations and the
  // exact component permutations at 0x10043cf21..0x10043cf73.
  if (swapZ) { q1 = q5; q5 = q4; q2 = q3; } else { q1 = q4; q2 = q0; }
  if (swapX) { q4 = q2; q2 = q5; } else q4 = q5;
  if (!swapZ) q0 = q3;
  let q = swapX ? [q1, q0, q4, q2] : [q0, q1, q4, q2];
  const n = sqrt(add(add(mul(q[0], q[0]), mul(q[2], q[2])), add(mul(q[1], q[1]), mul(q[3], q[3]))));
  if (n > epsilon) q = q.map(x => div(x, n));
  q.forEach((x, i) => target.setFloat32(32 + i * 4, x, true));
}

export function nativeIdentityMatrix(out: Uint8Array = new Uint8Array(64)): Uint8Array {
  check(out, 64); out.fill(0, 0, 64); const v = view(out); for (let i = 0; i < 4; i++) v.setFloat32(i * 20, 1, true); return out;
}
/** Registered GetObb is virtual +0x20 (local), not world virtual +0x28. */
export function getNativeMarkerLocalObb(out: Uint8Array = new Uint8Array(64)): Uint8Array {
  nativeIdentityMatrix(out); const v = view(out); for (let i = 0; i < 3; i++) v.setFloat32(i * 20, 0.5, true); return out;
}
/** Obb.Transform 0x100076df0. Both inputs are read before output stores. */
export function transformNativeObb(matrix: Uint8Array, local: Uint8Array, out: Uint8Array = new Uint8Array(64), s?: NativeMarkerArithmeticServices): Uint8Array {
  check(matrix, 64); check(local, 64); check(out, 64); const { add, mul } = arithmetic(s);
  const m = view(matrix), l = view(local), result = new Float32Array(16);
  for (let col = 0; col < 4; col++) for (let row = 0; row < 4; row++) {
    const at=col*16,r=row*4;
    const x=mul(m.getFloat32(r,true),l.getFloat32(at,true)),y=mul(m.getFloat32(16+r,true),l.getFloat32(at+4,true));
    const z=mul(m.getFloat32(32+r,true),l.getFloat32(at+8,true)),w=mul(m.getFloat32(48+r,true),l.getFloat32(at+12,true));
    result[col*4+row]=col===0?add(add(add(x,y),z),w):add(w,add(z,add(x,y)));
  }
  out.set(new Uint8Array(result.buffer),0); return out;
}
export function getNativeMarkerWorldObb(storage: Uint8Array, out: Uint8Array = new Uint8Array(64), s?: NativeMarkerArithmeticServices): Uint8Array {
  return transformNativeObb(getNativeMarkerTransform(storage, undefined, s), getNativeMarkerLocalObb(), out, s);
}
export function getNativeObbExtents(world: Uint8Array, out: Uint8Array = new Uint8Array(12), s?: NativeMarkerArithmeticServices): Uint8Array {
  check(world, 64); check(out, 12); const v = view(world), { length } = arithmetic(s), result = [0, 16, 32].map(at => length([0, 4, 8].map(j => v.getFloat32(at + j, true))));
  const o = view(out); result.forEach((n, i) => o.setFloat32(i * 4, n, true)); return out;
}
