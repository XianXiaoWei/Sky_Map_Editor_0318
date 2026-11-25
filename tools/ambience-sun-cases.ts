import { deriveOriginalAmbienceSun, type AmbienceSunInput, type AmbienceSunMath } from '../src/core/ambience-sun-runtime';
export interface AmbienceSunCase { label: string; input: AmbienceSunInput; }
export type AmbienceSunTrace = [number, number, number, number][];
const bits = (n: number) => { const b = Buffer.alloc(4); b.writeFloatLE(n); return b.readUInt32LE(); };
const float = (n: number) => { const b = Buffer.alloc(4); b.writeUInt32LE(n); return b.readFloatLE(); };
export function evaluateAmbienceSunCase(c: AmbienceSunCase, trace?: AmbienceSunTrace) {
  let at = 0;
  const call = (op: number, a: number, b: number, fallback: () => number) => {
    if (!trace) return fallback();
    const t = trace[at++];
    if (!t || t[0] !== op || t[1] !== bits(a) || t[2] !== bits(b)) throw new Error(`${c.label}: libm input mismatch #${at - 1}: ${JSON.stringify([op,bits(a),bits(b)])} != ${JSON.stringify(t)}`);
    return float(t[3]);
  };
  const math: AmbienceSunMath = { sinf: a => call(0,a,0,()=>Math.sin(a)), cosf: a => call(1,a,0,()=>Math.cos(a)),
    powf: (a,b) => call(2,a,b,()=>Math.pow(a,b)), expf: a => call(3,a,0,()=>Math.exp(a)), exp2f: a => call(4,a,0,()=>2**a) };
  const result = deriveOriginalAmbienceSun(c.input, math);
  if (trace && at !== trace.length) throw new Error(`${c.label}: unused libm trace`);
  const values = [...result.direction, ...result.atmosphereSunColor, ...result.sunColor, result.atmosphereSample];
  const bytes = Buffer.alloc(values.length * 4); values.forEach((v,i) => bytes.writeFloatLE(v,i*4));
  return { bytes, result };
}
