import { numericFloatBits as bits, numericFloatValue as value, truncateOriginalFloatToInt } from './object-numeric-runtime';
const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b), div = (a: number, b: number) => f(a / b);
const min = (a: number, b: number) => a < b ? a : b, max = (a: number, b: number) => a > b ? a : b;
export interface ResourceAnimationClockServices { pow(baseBits: number, exponentBits: number): number; }
/** Entire Animation request clock 0x100097df0. Operates on the original
 * 0x70-byte request record, preserving fields/pointers it doesn't consume.
 * Ease 1..4 calls the supplied original-math service. The primary/secondary
 * controller owns request ordering, pack/clip binding and accumulated weight. */
export function updateResourceAnimationClock(input: Uint8Array, delta: number, accumulatedWeight: number, services?: ResourceAnimationClockServices) {
  if (input.length !== 0x70 || !Number.isFinite(delta) || !Number.isFinite(accumulatedWeight)) throw new Error('原动画请求时钟输入无效');
  const state = Uint8Array.from(input), d = new DataView(state.buffer), get = (at: number) => d.getFloat32(at, true), put = (at: number, v: number) => d.setFloat32(at, v, true), int = (at: number) => d.getInt32(at, true), setInt = (at: number, v: number) => d.setInt32(at, v, true);
  const count = int(0x28), start = int(0x24), action = !!state[0x4f]; delta = f(delta); accumulatedWeight = f(accumulatedWeight);
  if (count < 0 || count > 10000000 || [0x18, 0x1c, 0x20, 0x30, 0x54, 0x58].some(at => !Number.isFinite(get(at)))) throw new Error('原动画请求字段无效');
  setInt(0x34, int(0x3c));
  if (count < 2) {
    put(0x1c, 0); for (const at of [0x38, 0x3c, 0x40, 0x44]) setInt(at, start); put(0x48, 0);
  } else {
    const phase = add(div(mul(delta, get(0x20)), f(count)), get(0x1c)); let progress = sub(phase, f(Math.floor(phase))); put(0x1c, progress);
    const ease = int(0x2c);
    if (ease) {
      const threshold = div(add(f(count), -1), f(count)), before = progress < threshold;
      if (action && before) progress = div(progress, threshold);
      if (ease >= 1 && ease <= 4) {
        if (!services) throw new Error('原动画 easing 缺少 powf 服务');
        const power = get(0x30), pow = (base: number) => value(services.pow(bits(base), bits(power)));
        if (ease === 1) progress = pow(progress);
        else if (ease === 2) progress = sub(1, pow(sub(1, progress)));
        else if (ease === 3) {
          const result = mul(pow(sub(1, Math.abs(add(add(progress, progress), -1)))), 0.5);
          progress = progress < 0.5 ? result : sub(1, result);
        } else {
          const result = mul(pow(Math.abs(add(add(progress, progress), -1))), 0.5);
          progress = add(progress < 0.5 ? -result : result, 0.5);
        }
      }
      if (action && before) progress = mul(threshold, progress);
    }
    const frameFloat = mul(progress, f(count)), current = truncateOriginalFloatToInt(bits(frameFloat)), next = (current + 1) % count;
    let previous = current - 1, after = next + 1;
    if (action) { if (current <= 0) previous = 0; if (after >= count - 1) after = count - 1; }
    else { previous = (previous + count) % count; after %= count; }
    [previous, current, next, after].forEach((n, i) => setInt(0x38 + i * 4, n + start)); put(0x48, sub(frameFloat, f(current)));
  }
  if (action) {
    const remaining = sub(get(0x54), delta); put(0x54, remaining);
    // MAXSS/MINSS select their second operand on an equal comparison.
    // Native MAXSS(0, -remaining*rate) retains -0 at an exact zero delay.
    const blend = min(1, max(0, -mul(remaining, get(0x58)))), cube = mul(blend, mul(blend, blend));
    const eased = mul(cube, add(mul(blend, add(mul(blend, 6), -15)), 10)); put(0x14, eased);
    if (eased >= 1 && int(0xc) === -1) { state[0x60] = 0; setInt(0, 0); }
    let weight = mul(eased, sub(1, accumulatedWeight)); put(0x14, weight);
    if (accumulatedWeight >= 1) { weight = 0; put(0x14, 0); state[0x60] = 0; setInt(0, 0); }
    accumulatedWeight = add(weight, accumulatedWeight); put(0x14, mul(get(0x18), get(0x14)));
  }
  return { state, accumulatedWeight };
}
