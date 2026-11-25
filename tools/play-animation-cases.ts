import { updateOriginalPlayAnimation, type PlayAnimationServices } from '../src/core/play-animation-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { u32 } from '../src/core/binary';
export const PLAY_ANIMATION_BASE = 0x470000000n;
export interface PlayAnimationCase { id: string; seed: number; count: number; play: number; defaults: number; setSpeed: number; speed: number; float: boolean; floatBits: number; sequence: string; name: string; castFails: boolean; noAnimation: boolean; currentIndex: number; fallbackIndex: number; mutation: number; }
export function playAnimationCases() {
  const out: PlayAnimationCase[] = [], add = (c: Partial<PlayAnimationCase> = {}) => out.push({ id: String(out.length), seed: out.length + 93, count: 2, play: 1, defaults: 0, setSpeed: 0, speed: 0x3f800000, float: false, floatBits: 0x3f000000, sequence: '', name: 'critterMove', castFails: false, noAnimation: false, currentIndex: 11, fallbackIndex: 7, mutation: 0, ...c });
  for (const count of [0, 1, 3]) for (const play of [0, 1]) for (const defaults of [0, 1]) for (const setSpeed of [0, 1]) for (const float of [false, true]) add({ count, play, defaults, setSpeed, float });
  for (const sequence of ['', 'flowerLoop', 'aLongOriginalAnimationSequenceName']) for (const name of ['', 'openUp', 'aLongOriginalNamedAnimationResource']) for (const setSpeed of [0, 1]) add({ sequence, name, setSpeed });
  for (const currentIndex of [-2, -1, 0, 13]) for (const fallbackIndex of [-1, 0, 7]) add({ play: 0, setSpeed: 1, currentIndex, fallbackIndex });
  for (const speed of [0, 0x80000000, 0xbf800000, 0x7fc12345, 0x7f800000]) for (const float of [false, true]) add({ setSpeed: 1, defaults: 1, speed, float });
  for (const mutation of [1, 2, 3, 4]) for (const defaults of [0, 1]) for (const play of [0, 1]) add({ mutation, defaults, play, setSpeed: 1 });
  add({ castFails: true }); add({ noAnimation: true }); add({ noAnimation: true, play: 0, setSpeed: 0 });
  return out;
}
export function preparePlayAnimation(c: PlayAnimationCase) {
  const base = PLAY_ANIMATION_BASE, b = Buffer.alloc(0x10000); let seed = c.seed;
  for (let i = 0; i < b.length; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[i] = seed >>> 24; }
  const at = (p: bigint, n: number) => { const offset = Number(p - base); if (offset < 0 || offset + n > b.length) throw new Error('Unmapped PlayAnimation'); return offset; };
  const m = { bytes: (p: bigint, n: number) => b.subarray(at(p, n), at(p, n) + n), read32: (p: bigint) => b.readUInt32LE(at(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(at(p, 8)), write8: (p: bigint, n: number) => { b[at(p, 1)] = n & 255; }, write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, at(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, at(p, 8)); }, string: () => '' };
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(to ? base + BigInt(to) : 0n, at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at);
  ptr(0x1038, 0x2000); ptr(0x2008, 0x2100); word(0x2010, c.count); ptr(0x4008, 0x4100); word(0x4010, c.count);
  for (let i = 0; i < 3; i++) { const mesh = 0x3000 + i * 0x1000; ptr(0x2100 + i * 8, mesh); ptr(0x4100 + i * 8, mesh); ptr(mesh + 0x228, 0x8000 + i * 0x100); word(mesh + 0xa34, c.fallbackIndex); ptr(0x8000 + i * 0x100 + 0x68, c.noAnimation ? 0 : 0x9000 + i * 0x100); }
  b[0x1070] = c.defaults; b[0x1080] = c.setSpeed; b[0x1081] = c.play; word(0x1074, c.speed); ptr(0x1078, c.float ? 0x7000 : 0); word(0x7010, c.floatBits);
  const string = (offset: number, value: string, heap: number) => { b.fill(0, offset, offset + 24); if (value.length <= 22) { b[offset] = value.length * 2; b.write(value, offset + 1); } else { word(offset, 65); b.writeBigUInt64LE(BigInt(value.length), offset + 8); ptr(offset + 16, heap); b.write(value + '\0', heap); } };
  string(0x1040, c.sequence, 0xb000); string(0x1058, c.name, 0xb100);
  ptr(0xf000, 0xf100); b.writeBigUInt64LE(0x102200000n, 0xf140);
  word(0xe000, c.castFails ? 1 : 0); word(0xe004, c.currentIndex); word(0xe008, c.mutation);
  return { base, b, m };
}
export function playAnimationRequest(c: PlayAnimationCase) { return preparePlayAnimation(c).b; }
export function playAnimationExpected(c: PlayAnimationCase) {
  const { base, b, m } = preparePlayAnimation(c), event = base + 0x1000n, trace: number[] = []; let casts = 0, line = 0, severity = 0;
  const log = (op: number, p: bigint, value: number, index = 0) => trace.push(op, Number(p - base) >>> 0, value >>> 0, index >>> 0);
  const s: PlayAnimationServices = {
    castLevelMesh: p => { log(1, p, 0); if (++casts === 1) { if (c.mutation === 1) { m.write64(event + 56n, base + 0x4000n); m.write64(base + 0x4108n, base + 0x5000n); } if (c.mutation === 2) m.write32(base + 0x2010n, 0); if (c.mutation === 3) m.write32(event + 116n, 0x40000000); if (c.mutation === 4) m.write8(event + 129n, 0); } return c.castFails ? 0n : p; },
    defaultAnimation: p => { log(2, p, 5); return 5; }, currentAnimation: (p, n) => { log(3, p, n); return c.currentIndex; },
    setSpeed: (p, index, speed) => log(4, p, speed, index), playNamed: (p, name, weight) => { log(5, p, weight); log(6, name, 0); },
    playSequence: (p, name, weight, speed, flags) => { log(7, p, weight, flags); log(8, name, speed); }, start: p => log(9, p, 0),
  };
  try { updateOriginalPlayAnimation(m, event, s); } catch (e) { if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity; }
  const header = Buffer.alloc(12 + 4096); header.writeUInt32LE(line); header.writeUInt32LE(severity, 4); header.writeUInt32LE(trace.length, 8); trace.forEach((n, i) => header.writeUInt32LE(n, 12 + i * 4));
  return Buffer.concat([header, b]);
}
