/** Visibility::Update runs with MXCSR |= 0xe040: RTZ, FTZ and DAZ.
 * Operations below round after each instruction, without fused operations.
 * NaN payloads are outside this numeric API's contract.
 */
const scratch = new ArrayBuffer(4);
const word = new Uint32Array(scratch);
const scalar = new Float32Array(scratch);
export function visibilityFloatBits(value: number): number {
  scalar[0] = value; return word[0];
}
export function visibilityFloatFromBits(bits: number): number {
  word[0] = bits; return scalar[0];
}
const minNormal = 2 ** -126;
const maxFinite = (2 - 2 ** -23) * 2 ** 127;
function signedZero(value: number): number { return value < 0 || Object.is(value, -0) ? -0 : 0; }
export function visibilityDaz(value: number): number {
  return Math.abs(value) < minNormal ? signedZero(value) : value;
}
export function visibilityRound(value: number): number {
  if (!Number.isFinite(value)) return value;
  if (Math.abs(value) > maxFinite) return value < 0 ? -maxFinite : maxFinite;
  let result = Math.fround(value);
  if (Math.abs(result) > Math.abs(value)) result = visibilityFloatFromBits(visibilityFloatBits(result) - 1);
  return Math.abs(result) < minNormal ? signedZero(result) : result;
}
export function visibilityAdd(a: number, b: number): number {
  a = visibilityDaz(a); b = visibilityDaz(b);
  const sum = a + b;
  // A double can absorb a tiny opposite-sign float32 operand. RTZ must still
  // move one float32 ULP toward zero, even when the double result equals the
  // larger operand (e.g. 1 - 2^-126). Preserve that sticky information.
  if (Number.isFinite(sum) && a !== 0 && b !== 0 && (a < 0) !== (b < 0) && (sum === a || sum === b)) {
    const previous = visibilityFloatFromBits(visibilityFloatBits(sum) - 1);
    return Math.abs(previous) < minNormal ? signedZero(previous) : previous;
  }
  return visibilityRound(sum);
}
export const visibilitySub = (a: number, b: number): number => visibilityAdd(a, -b);
export const visibilityMul = (a: number, b: number): number => visibilityRound(visibilityDaz(a) * visibilityDaz(b));
export const visibilityDiv = (a: number, b: number): number => visibilityRound(visibilityDaz(a) / visibilityDaz(b));
export const visibilitySqrt = (a: number): number => visibilityRound(Math.sqrt(visibilityDaz(a)));
/** MAXPS/MAXSS select operand two for equal values and unordered comparisons. */
export function visibilityMax(a: number, b: number): number {
  a = visibilityDaz(a); b = visibilityDaz(b); return a > b ? a : b;
}
/** QEMU -cpu max compares MAX with DAZ but forwards the selected raw operand.
 * Kept explicit; this emulator behavior is not claimed for Intel/Mac hardware. */
export function qemuVisibilityMax(a: number, b: number): number { return visibilityDaz(a) > visibilityDaz(b) ? a : b; }
