import { visibilityAdd as add, visibilitySub as sub, visibilityMul as mul, visibilityDiv as div, visibilitySqrt as sqrt } from './visibility-float';

export interface VisibilityReciprocal {
  /** RCPPS depends on the CPU. The current oracle uses QEMU's RTZ reciprocal.
   * Actual Intel/Mac approximate reciprocal remains to be measured. */
  kind: string;
  rcp(value: number): number;
}
export const qemuVisibilityReciprocal: VisibilityReciprocal = {kind: 'qemu-x86_64-max-rtz', rcp: value => div(1, value)};

/** Original 0x10071e7f0 xyz writes. Matrix is column-major, vertices stride 16.
 * Output W is scratch in the scalar path and deliberately outside this API.
 * Counts below four leave output untouched, as in the original unsigned branch.
 */
export function transformVisibilityVertices(vertices: Uint8Array, count: number, matrix: ArrayLike<number>, output: Float32Array, reciprocal: VisibilityReciprocal): void {
  if (!Number.isSafeInteger(count) || count < 0 || count > 0xffffffff || vertices.byteLength < count * 16 || output.length < count * 4) throw new Error('Visibility vertex/output range');
  if (matrix.length !== 16) throw new Error('Visibility requires 16 matrix components');
  const m = Float32Array.from(matrix);
  if (!Array.from(m).every(Number.isFinite)) throw new Error('Visibility matrix must be finite float32');
  if (count < 4) return;
  const raw = new DataView(vertices.buffer, vertices.byteOffset, vertices.byteLength);
  const scale = div(0.0078125, sqrt(add(add(mul(m[1], m[1]), mul(m[5], m[5])), mul(m[9], m[9]))));
  const scalarStart = (Math.floor(count / 4) * 4) - 4;
  for (let i = 0; i < count; i++) {
    let x = raw.getFloat32(i * 16, true), y = raw.getFloat32(i * 16 + 4, true), z = raw.getFloat32(i * 16 + 8, true);
    const scalar = i >= scalarStart;
    const beforeW = scalar ? add(add(mul(m[3], x), mul(m[11], z)), add(mul(m[7], y), m[15]))
      : add(mul(m[3], x), add(mul(m[7], y), add(m[15], mul(m[11], z))));
    const bias = mul(scale, beforeW);
    x = sub(x, mul(raw.getInt8(i * 16 + 12), bias));
    y = sub(y, mul(raw.getInt8(i * 16 + 13), bias));
    z = sub(z, mul(raw.getInt8(i * 16 + 14), bias));
    const dot = (row: number) => scalar
      ? add(m[row + 12], add(mul(m[row + 8], z), add(mul(m[row], x), mul(m[row + 4], y))))
      : add(mul(m[row], x), add(mul(m[row + 4], y), add(m[row + 12], mul(m[row + 8], z))));
    const w = dot(3);
    const r = scalar ? div(1, w) : (() => {const initial = reciprocal.rcp(w); return mul(initial, sub(2, mul(initial, w)));})();
    output[i * 4] = mul(dot(0), Math.abs(r));
    output[i * 4 + 1] = mul(dot(1), Math.abs(r));
    output[i * 4 + 2] = w > 0 ? mul(dot(2), scalar ? Math.abs(r) : r) : 0;
  }
}
