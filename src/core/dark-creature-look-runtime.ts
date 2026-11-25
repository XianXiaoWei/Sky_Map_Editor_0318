import type { ModelBakeMemory } from './model-baked-runtime';
import { originalForceVectors } from './creature-force-runtime';
import type { DarkCreatureSpotlightServices } from './dark-creature-spotlight-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

export interface DarkCreatureLookServices extends Pick<DarkCreatureSpotlightServices, 'arithmetic' | 'sinCos' | 'exp' | 'worldPosition'> {
  sine(inputBits: number): number;
  acos(inputBits: number): number;
  setEyeTransform(model: bigint, matrix: Uint8Array): void;
}

/** Original eye look/smoothing slice 0x10026e7da..0x10026eda3. The input
 * matrix is the same frame's preceding body motion matrix. Returns the head
 * position used by subsequent projection; it is not reloaded after callbacks.
 * The body, later projection/audio/interaction and scene owners are separate. */
export function updateOriginalDarkCreatureLookPhase(m: ModelBakeMemory, p: bigint, motionMatrix: Uint8Array, s: DarkCreatureLookServices): Uint8Array {
  const { a, read, bytes, normalize, squared, sqrt, sum } = originalForceVectors(s.arithmetic), one = bits(1), half = bits(.5), threshold = 0x3727c5ac;
  const at = (offset: bigint) => read(m.bytes(p + offset, 16)), negate = (n: number) => (n ^ 0x80000000) >>> 0;
  const perm = (x: number[]) => [x[2], x[0], x[1], x[3]], mul = (x: number[], y: number[]) => x.map((n, i) => a.mul(n, y[i])), sub = (x: number[], y: number[]) => x.map((n, i) => a.sub(n, y[i]));
  const head = new Uint8Array(s.worldPosition(m.read64(p + 0x228n))), old = at(0x110n), state = m.read32(p + 0x2e0n);
  let target: number[];
  if (state === 4) {
    let angle = a.mul(s.sine(m.read32(p + 0x124n)), bits(30));
    angle = a.mul(a.div(a.mul(angle, bits(Math.PI)), bits(180)), half);
    const pair = read(s.sinCos(angle)), q = at(0x190n), rotation = [0, pair[0], 0, pair[1]], cross = perm(sub(mul(perm(q), rotation), mul(q, perm(rotation))));
    target = q.map((n, i) => a.add(a.add(a.mul(q[3], rotation[i]), a.mul(n, i === 3 ? pair[3] : pair[1])), cross[i]));
    target[3] = a.sub(a.mul(pair[1], q[3]), sum(mul(q, rotation)));
  } else {
    const direction = normalize(state === 1 ? sub(at(0x130n), read(head)) : at(0xa0n));
    let up = [0, one, 0, one];
    if (value(sum(mul(direction.map(negate), up)) & 0x7fffffff) > value(0x3f7fbe77)) up = [0x80000000, 0x80000000, bits(-1), 0];
    const normalizeCross = (cross: number[]) => { const q = squared(cross), length = sqrt(a.add(q[1], a.add(q[2], q[0]))), v = perm(cross); return value(length) > value(threshold) ? v.map((n, i) => a.div(n, i === 3 ? q[3] : length)) : v; };
    const side = normalizeCross(sub(mul(direction, perm(up)), mul(perm(direction), up)));
    const vertical = normalizeCross(sub(mul(perm(direction), side), mul(direction, perm(side))));
    const traceNegative = value(a.add(direction[2], a.add(side[0], vertical[1]))) < 0;
    const greaterZx = value(direction[2]) > value(side[0]), greaterZy = value(direction[2]) > value(vertical[1]);
    const swapX = (value(vertical[1]) > value(side[0]) || greaterZx) && traceNegative;
    const swapY = (value(vertical[1]) <= value(side[0]) || greaterZy || Number.isNaN(value(vertical[1])) || Number.isNaN(value(side[0]))) && traceNegative;
    const swapZ = !(greaterZx && greaterZy) && traceNegative;
    const k = a.add(a.add(swapZ ? negate(direction[2]) : direction[2], a.add(swapX ? negate(side[0]) : side[0], swapY ? negate(vertical[1]) : vertical[1])), one);
    const factor = a.mul(a.div(one, sqrt(k)), half);
    const q3 = a.mul(factor, a.sub(vertical[2], swapX ? negate(direction[1]) : direction[1]));
    let q4 = a.mul(factor, a.sub(direction[0], swapY ? negate(side[2]) : side[2]));
    let q5 = a.mul(factor, a.sub(side[1], swapZ ? negate(vertical[0]) : vertical[0]));
    let q0 = a.mul(factor, k), q1: number, q2: number;
    if (swapZ) { q1 = q5; q5 = q4; q2 = q3; } else { q1 = q4; q2 = q0; }
    if (swapX) { q4 = q2; q2 = q5; } else q4 = q5;
    if (!swapZ) q0 = q3;
    target = swapX ? [q1, q0, q4, q2] : [q0, q1, q4, q2];
  }
  m.bytes(p + 0x110n, 16).set(bytes(target));
  const exp = s.exp(a.mul(m.read32(p + 0x120n), 0xc04a4ad1));
  const dot4 = (x: number[], y: number[]) => { const q = mul(x, y); return a.add(a.add(q[0], q[2]), a.add(q[1], q[3])); };
  const normalize4 = (q: number[]) => { const length = sqrt(dot4(q, q)); return value(length) > value(threshold) ? q.map(n => a.div(n, length)) : q; };
  let first = normalize4(old); const second = normalize4(target), dot = dot4(first, second);
  if (value(dot) < 0) first = first.map(negate);
  const cosine = value(dot) < 0 ? negate(dot) : dot, weight = a.sub(one, exp);
  let left = a.sub(one, weight), right = weight;
  if (value(0x3f7fbe77) > value(cosine)) {
    const angle = s.acos(cosine), reciprocal = a.div(one, s.sine(angle));
    left = a.mul(s.sine(a.mul(a.sub(one, weight), angle)), reciprocal);
    right = a.mul(s.sine(a.mul(angle, weight)), reciprocal);
  }
  let result = second.map((n, i) => a.add(a.mul(n, right), a.mul(first[i], left)));
  if (result.some(n => Number.isNaN(value(n)))) result = value(weight) > 0 ? at(0x110n) : old;
  m.bytes(p + 0x110n, 16).set(bytes(result));
  const scale = at(0xd0n).map((n, i) => a.mul(n, i === 3 ? 0 : 0x3ecccccd)), matrix = new Uint8Array(64);
  for (let i = 0; i < 3; i++) matrix.set(bytes(read(motionMatrix, i * 16).map(n => a.mul(n, scale[i]))), i * 16);
  matrix.set(bytes([...read(head).slice(0, 3), read(motionMatrix, 48)[3]]), 48);
  s.setEyeTransform(m.read64(p + 0x1e8n), matrix);
  return head;
}
