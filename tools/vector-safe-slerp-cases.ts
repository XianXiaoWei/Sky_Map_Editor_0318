import { safeSlerpOriginalVectors } from '../src/core/vector-safe-slerp-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';

export interface SafeSlerpCase { label: string; first: number[]; second: number[]; preferred: number[]; factorBits: number; sinWBits: number; alias: number; }
export function vectorSafeSlerpCases(): SafeSlerpCase[] {
  const cases: SafeSlerpCase[] = [];
  const vectors = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, -1, 0, 0], [-1, 0, 0, 0], [1, 2, 3, 4], [0, 0, 0, 0], [0.000001, 0, 0, 1], [1, 0.01, 0, 0], [0.5, -0.5, 0.7, -3]];
  for (let i = 0; i < vectors.length; i++) for (let j = 0; j < vectors.length; j++) for (const factor of [-1, -0, 0.25, 0.5, 1, 1.5, Infinity, NaN]) {
    const index = cases.length;
    cases.push({ label: `vectors ${i}/${j}/${factor}`, first: vectors[i].map(bits), second: vectors[j].map(bits), preferred: vectors[(i + j) % vectors.length].map(bits), factorBits: bits(factor), sinWBits: bits(index % 3 ? 0 : -2), alias: index % 4 });
  }
  for (const first of [[1, 0, 0, 0], [0, 0, 1, 0], [0, 1, 0, 0]]) for (const axis of vectors) for (const factor of [0, 0.25, 0.5, 1]) cases.push({ label: `opposition/axis ${cases.length}`, first: first.map(bits), second: first.map(n => bits(-n)), preferred: axis.map(bits), factorBits: bits(factor), sinWBits: 0, alias: cases.length % 4 });
  return cases;
}

export function safeSlerpInput(c: SafeSlerpCase): Buffer {
  const b = Buffer.alloc(96, 0x73);
  [...c.first, ...c.second, ...c.preferred].forEach((n, i) => b.writeUInt32LE(n >>> 0, i * 4));
  b.writeUInt32LE(c.factorBits, 64); b.writeUInt32LE(c.sinWBits, 68); b.writeUInt32LE(c.alias, 72);
  return b;
}
export function evaluateSafeSlerp(c: SafeSlerpCase, mathTrace?: Buffer): Buffer {
  const b = safeSlerpInput(c), trace: Buffer[] = []; let at = 0, line = 0, severity = 0;
  const math = (kind: number, input: number) => {
    let result = bits(kind === 1 ? Math.acos(value(input)) : Math.sin(value(input)));
    if (mathTrace) { if (at + 12 > mathTrace.length || mathTrace.readUInt32LE(at) !== kind || mathTrace.readUInt32LE(at + 4) !== input) throw new Error(`${c.label}: math input differs at ${at}`); result = mathTrace.readUInt32LE(at + 8); at += 12; }
    const row = Buffer.alloc(12); row.writeUInt32LE(kind); row.writeUInt32LE(input, 4); row.writeUInt32LE(result, 8); trace.push(row); return result;
  };
  try {
    const outAt = c.alias ? (c.alias - 1) * 16 : 48;
    safeSlerpOriginalVectors(b.subarray(0, 16), b.subarray(16, 32), b.subarray(32, 48), c.factorBits, { acos: input => math(1, input), sin: input => ({ valueBits: math(2, input), wBits: c.sinWBits }) }, b.subarray(outAt, outAt + 16));
  } catch (e) { if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity; }
  if (mathTrace && at !== mathTrace.length) throw new Error('Unused native safe-slerp math calls');
  const h = Buffer.alloc(12); h.writeUInt32LE(line); h.writeUInt32LE(severity, 4); h.writeUInt32LE(trace.length, 8);
  return Buffer.concat([h, b, ...trace]);
}
