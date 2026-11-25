import { updateOriginalDarkCreatureSpotlightPhase } from '../src/core/dark-creature-spotlight-runtime';
import { updateOriginalDarkCreatureVisualPhase } from '../src/core/dark-creature-visual-runtime';
import { numericFloatBits as bits } from '../src/core/object-numeric-runtime';
export const SPOT_SIZE = 0x20000, SPOT_ROW = 160, SPOT_BASE = 0x440000000n;
export interface SpotlightCase { label: string; look?: number; state?: number; kind?: number; missing?: number; index?: number; hit?: number; deltaBits?: number; timeBits?: number; phaseBits?: number; timerBits?: number; effect?: number; effectTimeBits?: number; head?: number[]; target?: number[]; quaternion?: number[]; velocity?: number[]; old?: number[]; upper?: number[]; mutationKind?: number; mutation?: number; steps?: number; seed?: number; }
export function darkSpotlightCases(): SpotlightCase[] {
  const cases: SpotlightCase[] = [], add = (label: string, c: Omit<SpotlightCase, 'label'>) => cases.push({ label, ...c });
  for (const state of [0, 1, 2, 3, 4, 5]) for (const kind of [0, 1, 2, 3]) for (const steps of [1, 3]) add(`state/target/frames ${state}/${kind}/${steps}`, { state, kind, steps });
  for (const kind of [0, 1, 2]) for (const missing of [0, 1]) for (const hit of [0, 1, 256, 257]) add(`target/missing/hit ${kind}/${missing}/${hit}`, { kind, missing, hit, steps: 3 });
  for (const index of [0, 63, 64, 0xffffffff]) add(`bird boundary ${index}`, { kind: 2, index });
  for (const timerBits of [-1, -0, .1, 2.5, 5, 10, Infinity, NaN].map(bits)) for (const state of [0, 1]) add(`radius ${timerBits}/${state}`, { timerBits, state });
  for (const deltaBits of [-1, -0, .016, 1, Infinity, NaN].map(bits)) for (const hit of [0, 1]) add(`smoothing ${deltaBits}/${hit}`, { deltaBits, hit, effect: 1 });
  for (const effectTimeBits of [-1, -0, .016, .017, Infinity, NaN].map(bits)) for (const effect of [0, 1]) add(`expiration ${effectTimeBits}/${effect}`, { effect, effectTimeBits, steps: 3 });
  for (const target of [[0, 1, 0, 0], [0, -1, 0, 0], [0, 0, 0, 0], [1, 2, 3, 1]]) add(`chase axis ${target}`, { state: 1, head: [0, 0, 0, 0].map(bits), target: target.map(bits), kind: 0 });
  for (const quaternion of [[0, 0, 0, 1], [0, 0, 0, 0], [1, 0, 0, 0], [0, .5, 0, .5], [.2, .3, .4, .7]]) for (const upper of [[0, 0], [1, -2]]) add(`look/W ${quaternion}/${upper}`, { quaternion: quaternion.map(bits), upper: upper.map(bits) });
  for (const mutationKind of [1, 2, 3, 4, 5, 6, 7, 8, 9]) for (const mutation of [1, 2, 3, 4, 5, 6]) add(`live callback ${mutationKind}/${mutation}`, { mutationKind, mutation, kind: mutationKind === 4 ? 1 : mutationKind === 5 ? 2 : 0, timerBits: bits(1), effect: 1, steps: 3 });
  for (const field of ['head', 'target', 'quaternion', 'old'] as const) for (const n of [0x80000000, 0x7f800000, 0xff800000, 0x7fc00000, 0xffc00000]) add(`exception ${field}/${n}`, { state: field === 'target' ? 1 : 0, [field]: [n, bits(2), bits(3), bits(1)] });
  let seed = 351; const next = () => seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0, random = () => bits(((next() % 20001) - 10000) / 1137);
  for (let i = 0; i < 40; i++) add(`random ${i}`, { state: next() % 6, kind: next() % 4, head: [random(), random(), random(), bits(1)], target: [random(), random(), random(), bits(1)], quaternion: [random(), random(), random(), random()], timerBits: random(), deltaBits: bits((next() % 1000) / 997), phaseBits: random(), timeBits: random(), hit: next() % 2, effect: next() % 2, steps: 3, seed: next() });
  for (const c of [...cases]) cases.push({ ...c, label: `look + ${c.label}`, look: 1 });
  for (const velocity of [[0, 0, 0, 0], [0, 1, 0, 0], [0, -1, 0, 0], [1, 0, 0, 0], [-1, 0, 0, 0], [0, 0, -1, 0], [1, 2, 3, 1]]) add(`look axis ${velocity}`, { look: 1, velocity: velocity.map(bits), steps: 3 });
  for (const mutationKind of [10, 11, 12]) for (const mutation of [2, 3, 6]) add(`look callback ${mutationKind}/${mutation}`, { look: 1, state: mutationKind === 10 ? 4 : 1, mutationKind, mutation, steps: 3 });
  return cases;
}
export function prepareDarkSpotlight(c: SpotlightCase) {
  const b = Buffer.alloc(SPOT_SIZE), base = SPOT_BASE; let seed = c.seed ?? 172;
  for (let i = 0; i < b.length; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[i] = seed >>> 24; }
  const m = { bytes: (p: bigint, n: number) => b.subarray(Number(p - base), Number(p - base) + n), read32: (p: bigint) => b.readUInt32LE(Number(p - base)), read64: (p: bigint) => b.readBigUInt64LE(Number(p - base)), write32: (p: bigint, n: number) => b.writeUInt32LE(n >>> 0, Number(p - base)), write64: (p: bigint, n: bigint) => b.writeBigUInt64LE(n, Number(p - base)), write8: (p: bigint, n: number) => { b[Number(p - base)] = n; }, string: () => { throw new Error('Spotlight does not read strings'); } };
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(to ? base + BigInt(to) : 0n, at), vec = (at: number, v: number[]) => v.forEach((n, i) => b.writeUInt32LE(n >>> 0, at + i * 4)), f = (at: number, v: number[]) => vec(at, v.map(bits));
  ptr(0x11e8, 0xa000); ptr(0x1228, 0x6000); ptr(0x11d8, 0xb000); ptr(0x11f8, c.effect ? 0xc000 : 0); ptr(0x7000, 0x1e000); ptr(0x7018, 0x7100);
  b.writeUInt32LE(c.state ?? 0, 0x12e0); b[0x12c7] = c.kind ?? 0; b.writeUInt32LE(10, 0x12c8); b.writeUInt32LE(c.index ?? 0, 0x12cc);
  vec(0x1110, c.quaternion ?? [0, .2, 0, .98].map(bits)); vec(0x1130, c.target ?? [4, 5, 6, 1].map(bits)); vec(0x11b0, c.old ?? [0, 1, 2, 1].map(bits)); f(0x1060, [3, 4, 5, 1]); b.writeUInt32LE(c.timerBits ?? bits(0), 0x1140); b.writeUInt32LE(c.effectTimeBits ?? bits(.03), 0x1200);
  vec(0x10a0, c.velocity ?? [1, 2, 3, 0].map(bits)); vec(0x1190, c.quaternion ?? [0, .2, 0, .98].map(bits)); f(0x10d0, [2, 3, 4, 1]); b.writeUInt32LE(c.deltaBits ?? bits(.016), 0x1120); b.writeUInt32LE(c.timeBits ?? bits(.3), 0x1124);
  f(0x7230, [14, 15, 16, 1]); f(0x60b0, [7, 8, 9, 1]); ptr(0xd000, 0x1e000); f(0xd010, [24, 25, 26, 1]);
  for (let i = 0; i < 64; i++) ptr(0x9010 + i * 8, c.missing ? 0 : 0xd000);
  b.fill(0, 0x1f000, 0x1f180); b.writeUInt32LE(c.steps ?? 1, 0x1f000); b.writeUInt32LE(c.missing ?? 0, 0x1f004); b.writeUInt32LE(c.hit ?? 1, 0x1f008); b.writeUInt32LE(c.mutationKind ?? 0, 0x1f00c); b.writeUInt32LE(c.mutation ?? 0, 0x1f010); b.writeUInt32LE(c.look ?? 0, 0x1f014); b.writeUInt32LE(bits(4), 0x1f018);
  vec(0x1f020, c.head ?? [1, 2, 3, 1].map(bits)); vec(0x1f030, [c.deltaBits ?? bits(.016), bits(77), bits(88), 0]); b.writeUInt32LE(c.timeBits ?? bits(.3), 0x1f040); b.writeUInt32LE(c.phaseBits ?? bits(.2), 0x1f048); vec(0x1f050, c.upper ?? [0, 0]);
  f(0x1f080, [.1, .2, .3, .4]); f(0x1f0a0, [8, 0, 9, 1]); f(0x1f0b0, [13, 14, 15, 1]); f(0x1f0c0, [.6, .7, .8, 1]); f(0x1f0d0, [.9, .8, .7, .6]); b.fill(0x73, 0x1f100, 0x1f120); b.fill(0, 0x1e000, 0x1e100);
  f(0x1f140, [2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4, 0, 3, 4, 5, 1]);
  return { b, m };
}
export function evaluateDarkSpotlight(c: SpotlightCase, nativeMath: readonly number[][], probes: readonly number[][]): Buffer {
  const { b, m } = prepareDarkSpotlight(c), base = SPOT_BASE, p = base + 0x1000n, rows: Buffer[] = []; let mathAt = 0, colorCount = 0, mutated = false;
  const record = (kind: number, x: bigint | number = 0, y: bigint | number = 0) => { const r = Buffer.alloc(SPOT_ROW); [kind, x, y].forEach((n, i) => r.writeBigUInt64LE(BigInt(n), i * 8)); rows.push(r); return r; };
  const mutate = (kind: number) => { if (mutated || c.mutationKind !== kind) return; mutated = true; switch (c.mutation) {
    case 1: b[0x12c7] = 3; break; case 2: b.copy(b, 0x11b0, 0x1f0b0, 0x1f0c0); break; case 3: m.write64(p + 0x1e8n, base + 0xa400n); break; case 4: m.write64(p + 0x1d8n, base + 0xb400n); break; case 5: m.write64(p + 0x1f8n, base + 0xc400n); break; case 6: m.write32(p + 0x140n, bits(4)); break;
  } };
  const arithmetic = { resolveDualNaN: (op: 'add' | 'sub' | 'mul' | 'div', x: number, y: number) => { const found = probes.find(r => r[0] === ['add', 'sub', 'mul', 'div'].indexOf(op) && r[1] === x && r[2] === y); if (!found) throw new Error('Missing spotlight arithmetic probe'); return found[3]; } };
  const math = (kind: number, x: number) => { const row = nativeMath[mathAt++]; if (!row || row[0] !== kind || row[1] !== x) throw new Error(`${c.label}: math input/order differs ${JSON.stringify({ kind, x, row })}`); return row.slice(2); };
  const s = { arithmetic, rayQueryScratch: b.subarray(0x1f100, 0x1f120), colorScratch: b.subarray(0x1f080, 0x1f090), phaseBits: () => m.read32(base + 0x1f048n),
    sinCos: (x: number) => { const result = Buffer.alloc(16); math(1, x).forEach((n, i) => result.writeUInt32LE(n, i * 4)); record(1, x).set(result, 32); mutate(1); return result; },
    exp: (x: number) => { const n = math(2, x)[0]; record(2, x).writeUInt32LE(n, 32); mutate(2); return n; },
    castRay: (world: bigint, origin: Uint8Array, direction: Uint8Array, length: number, query: Uint8Array) => { const r = record(3, world, length); r.set(origin, 32); r.set(direction, 48); r.set(query, 64); r.writeUInt32LE(c.hit ?? 1, 96); const out = (c.hit ?? 1) & 255 ? b.subarray(0x1f0a0, 0x1f0b0).slice() : null; if (out) r.set(out, 112); mutate(3); return out; },
    findAvatar: (owner: bigint, id: number) => { const avatar = c.missing ? 0n : base + 0x7000n; record(4, owner, id).writeBigUInt64LE(avatar, 32); mutate(4); return avatar; },
    birdPosition: (bird: bigint) => { const out = m.bytes(bird + 16n, 16).slice(); record(5, bird).set(out, 32); mutate(5); return out; },
    environmentColor: (owner: bigint, out: Uint8Array, position: bigint | Uint8Array, gain: number, range: number, ambient: number) => { const r = record(6, owner, typeof position === 'bigint' ? position : 0); [gain, range, ambient].forEach((n, i) => r.writeUInt32LE(n, 24 + i * 4)); r.set(out, 48); r.set(typeof position === 'bigint' ? m.bytes(position, 16) : position, 64); const at = 0x1f0c0 + (colorCount++ % 2) * 16; out.set(b.subarray(at, at + 16)); r.set(out, 80); mutate(6); },
    setDiffuseColor: (model: bigint, color: Uint8Array) => { const r = record(7, model); r.write('u_diffuseColor', 32); r.set(color, 64); mutate(7); },
    worldPosition: (transform: bigint) => { const out = m.bytes(transform + 176n, 16).slice(); record(8, transform).set(out, 32); mutate(8); return out; },
    setMarkerTransform: (marker: bigint, matrix: Uint8Array) => { record(9, marker).set(matrix, 32); m.bytes(marker + 16n, 64).set(matrix); mutate(9); },
    sine: (x: number) => { const n = math(10, x)[0]; record(10, x).writeUInt32LE(n, 32); mutate(10); return n; },
    acos: (x: number) => { const n = math(11, x)[0]; record(11, x).writeUInt32LE(n, 32); mutate(11); return n; },
    setEyeTransform: (model: bigint, matrix: Uint8Array) => { record(12, model).set(matrix, 32); m.bytes(model + 16n, 64).set(matrix); mutate(12); }
  };
  for (let step = 0; step < (c.steps ?? 1); step++) {
    const owners = { world: base + 0x9400n, avatars: base + 0x8000n, birds: base + 0x9000n, environment: base + 0x9600n };
    if (c.look) updateOriginalDarkCreatureVisualPhase(m, p, b.subarray(0x1f140, 0x1f180), b.subarray(0x1f030, 0x1f040), m.read32(base + 0x1f040n), owners, s);
    else updateOriginalDarkCreatureSpotlightPhase(m, p, b.subarray(0x1f020, 0x1f030), b.subarray(0x1f030, 0x1f040), m.read32(base + 0x1f040n), owners, s);
  }
  if (mathAt !== nativeMath.length) throw new Error('Unused spotlight math calls'); const h = Buffer.alloc(4); h.writeUInt32LE(rows.length); return Buffer.concat([h, b, ...rows]);
}
