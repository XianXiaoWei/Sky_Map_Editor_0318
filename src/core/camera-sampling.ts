const f = Math.fround;

// CameraSystem 0x1001e1451..0x1001e1573. The third point is loaded
// with vmovss/vmovlps: its Y component is zero, not the adjacent literal 5.
export const CAMERA_SAMPLE_POINTS = [[4, 2], [2, 5], [6, 0], [1, 3], [5, 6], [3, 1], [7, 4], [0, 7]] as const;
// 0x100aaf450, selected by Compositor::FrameNumber() & 31.
export const CAMERA_HALF_SAMPLE_ORDER = [0, 1, 2, 3, 0, 2, 1, 3, 1, 0, 3, 2, 1, 3, 0, 2,
  2, 3, 0, 1, 2, 0, 3, 1, 3, 2, 1, 0, 3, 1, 2, 0] as const;

function dimensions(width: number, height: number) {
  if (![width, height].every(v => Number.isInteger(v) && v > 0 && v <= 16384)) throw new Error('原相机采样尺寸无效');
}

// 0x1001e157e..0x1001e1a3d: retain float32 normalization before the
// pair ratios. Algebraically cancelling the total changes native rounding.
export function temporalGaussianKernel(width: number, height: number, pixelOffset: readonly number[],
  expf: (argument: number) => number = argument => f(Math.exp(argument))) {
  dimensions(width, height);
  if (pixelOffset.length !== 2 || !pixelOffset.every(v => Number.isFinite(v) && Math.abs(v) <= .5)) throw new Error('原时间采样偏移无效');
  const arguments_: number[] = [], raw: number[] = [];
  for (let y = -1; y <= 1; y++) for (let x = -1; x <= 1; x++) {
    const dx = f(f(pixelOffset[0]) + x), dy = f(f(pixelOffset[1]) + y);
    const argument = f(f(f(dx * dx) + f(dy * dy)) * f(-2.29));
    arguments_.push(argument); raw.push(f(expf(argument)));
  }
  let total = raw[0]; for (let i = 1; i < raw.length; i++) total = f(total + raw[i]);
  const w = raw.map(v => f(v / total));
  const pairs = [f(w[8] + w[7]), f(w[6] + w[3]), f(w[1] + w[0]), f(w[5] + w[2])];
  const taps = [f(f(w[7] / pairs[0]) - 1), -1, 1, f(f(w[3] / pairs[1]) - 1),
    f(1 - f(w[1] / pairs[2])), 1, -1, f(1 - f(w[5] / pairs[3]))];
  const uv = taps.map((v, i) => f(v / f(i % 2 ? height : width)));
  return { u_aaCornerUvs0: uv.slice(0, 4), u_aaCornerUvs1: uv.slice(4),
    u_aaCornerWeights: pairs, u_aaCenterWeight: w[4], arguments: arguments_, rawWeights: raw };
}

export function cameraSampling(frame: number, width: number, height: number,
  previous: { jitter: readonly number[]; jitterHalf: readonly number[] } = { jitter: [0, 0], jitterHalf: [0, 0] },
  centeredProjection = false) {
  dimensions(width, height);
  if (!Number.isInteger(frame) || frame < 0 || frame > 0xffffffff) throw new Error('原相机帧号无效');
  if (![previous.jitter, previous.jitterHalf].every(v => v.length === 2 && v.every(Number.isFinite))) throw new Error('原相机历史采样无效');
  const phase = frame & 7, halfPhase = CAMERA_HALF_SAMPLE_ORDER[frame & 31];
  const offset = (index: number) => CAMERA_SAMPLE_POINTS[index].map(v => f(f(f(v + .5) / 8) - .5));
  const pixelOffset = offset(phase), oldPixelOffset = offset((frame + 7) & 7);
  const projectionShift = pixelOffset.map((v, i) => centeredProjection ? 0 : f(f(v + v) / f(i ? height : width)));
  const previousProjectionShift = oldPixelOffset.map((v, i) => centeredProjection ? 0 : f((v + v) / f(i ? height : width)));
  const jitter = projectionShift.map(v => f(v * -.5));
  const jitterHalf = [halfPhase * 2 & 2, halfPhase & ~1].map((v, i) => f((centeredProjection ? .5 : f(f(v - 1) * .5)) / f(i ? height : width)));
  const kernel = temporalGaussianKernel(width, height, pixelOffset);
  return { frame, phase, halfPhase, pixelOffset, projectionShift, previousProjectionShift,
    jitter, jitterHalf, jitterOld: previous.jitter.map(f), jitterHalfOld: previous.jitterHalf.map(f), ...kernel };
}

// The original CameraSystem left-multiplies clip-space translation before
// projecting. Apply it to the editor's existing camera, preserving that camera.
export function jitterViewProjection(matrix: readonly number[], projectionShift: readonly number[]) {
  if (matrix.length !== 16 || !matrix.every(Number.isFinite) || projectionShift.length !== 2 || !projectionShift.every(Number.isFinite)) throw new Error('原相机投影输入无效');
  const out = matrix.map(f);
  for (let column = 0; column < 4; column++) {
    const at = column * 4;
    out[at] = f(f(projectionShift[0] * out[at + 3]) + out[at]);
    out[at + 1] = f(f(projectionShift[1] * out[at + 3]) + out[at + 1]);
  }
  return out;
}

// 0x1001e1daa..0x1001e1df8: current clip translation * inverse(previous
// translation) * previous view-projection. Preserve the already-rounded
// previous matrix rather than rebuilding it from an unjittered camera.
export function correctPreviousViewProjection(matrix: readonly number[], currentShift: readonly number[], previousShift: readonly number[]) {
  if (previousShift.length !== 2 || !previousShift.every(Number.isFinite)) throw new Error('原相机历史投影偏移无效');
  return jitterViewProjection(matrix, currentShift.map((v, i) => f(v - previousShift[i])));
}
