import { constructOriginalOnRegion, enableOriginalOnRegion, updateOriginalOnRegion, originalRegionPointInObb, type OnRegionServices } from '../src/core/on-region-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { numericFloatBits as bits } from '../src/core/object-numeric-runtime';
import { constructOriginalPlayAnimation } from '../src/core/play-animation-runtime';
export const ON_REGION_ARENA = 0x50000, ON_REGION_ROW = 192, ON_REGION_BASE = 0x440000000n;
export interface OnRegionCase { label: string; mode: number; steps?: number; words?: [number, number][]; bytes?: [number, number][]; pointers?: [number, number][]; vectors?: [number, number[]][]; }
export function onRegionCases(): OnRegionCase[] {
  const cases: OnRegionCase[] = [], add = (label: string, changes: Partial<OnRegionCase> = {}) => cases.push({ label, mode: 0, ...changes });
  for (const enter of [0, 1]) for (const once of [0, 1]) for (const every of [0, 1]) for (const who of [0, 1, 2, 3]) for (const require of [0, 1, 2, 3]) {
    add('whole flags ' + [enter, once, every, who, require], { steps: 3, bytes: [[0x1050, enter], [0x1051, once], [0x1052, every], [0x1053, +(who === 3)], [0x1054, +(who === 0 || who === 2)], [0x1055, +(who === 1 || who === 2)], [0x1056, +(require === 1)], [0x105c, +(require === 2)], [0x105d, +(require === 3)]] });
  }
  add('Barn not ready retains every private field', { words: [[0x4f004, 0]] });
  for (const count of [0, 1, 2, 15, 16, 17, 20]) for (const enter of [0, 1]) add('region distinct SIMD ' + [count, enter], { steps: 2, words: [[0x4010, count]], bytes: [[0x105d, 1], [0x1050, enter], [0x1053, 1]] });
  for (const minimum of [-1, 0, 1, 2, 16, 0x7fffffff, 0x80000000]) for (const previous of [0, 1, 0xffffffff]) add('signed minimum ' + [minimum, previous], { words: [[0x1058, minimum], [0x1060, previous]], bytes: [[0x105c, 1]] });
  for (const active of [0, 1, 2, 16, 0xffffffff]) add('saved active count ' + active, { words: [[0x4f008, active]], bytes: [[0x1056, 1]] });
  for (const kind of [0, 1, 2, 3]) add('object Marker LevelMesh cast ' + kind, { pointers: [[0x1048, 0x4200]], bytes: [[0x70f0, kind]] });
  for (const kind of [0, 2, 3]) add('region cast assertion ' + kind, { bytes: [[0x50f0, kind]] });
  for (const first of [0, 1, 2]) for (const replacement of [0x7000, 0x7100]) add('cast source reference rewrite ' + [first, replacement], { pointers: [[0x1048, 0x4200]], words: [[0x4f018, first + 1], [0x4f01c, replacement]] });
  for (const service of [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]) for (const mutation of [1, 2, 3, 4, 5, 6, 7, 8, 9]) add('live callback fields ' + [service, mutation], { steps: 2, words: [[0x4f00c, service], [0x4f010, mutation], [0x4f014, 0]], bytes: [[0x1052, 1], [0x1055, 1]] });
  for (const position of [[0, 0, 0, 1], [1, 2, 3, 0], [1, 2, 3, -4], [NaN, 2, 3, 1], [Infinity, 0, 0, 1], [2.0099, 2, 3, 1], [2.01, 2, 3, 1], [2.0101, 2, 3, 1], [-0.01, 2, 3, 1]]) {
    for (const who of ['camera', 'local', 'remote']) add('actual geometry ' + who + position, { mode: 1, steps: 3, bytes: [[0x1053, +(who === 'camera')], [0x1054, +(who === 'local')], [0x1055, +(who === 'remote')]], vectors: [[who === 'camera' ? 0x4f090 : who === 'local' ? 0x9010 : 0x9090, position.map(bits)]] });
  }
  add('actual mesh center to regions', { mode: 1, pointers: [[0x1048, 0x4200]], bytes: [[0x70f0, 2]] });
  for (const tolerance of [-1, 0, 0.01, 1, NaN]) for (const x of [-3, -1.001, -1, 0, 1, 1.001, 3, NaN]) add('whole tolerant point predicate ' + [tolerance, x], { mode: 4, words: [[0x4f020, bits(tolerance)]], vectors: [[0x4f090, [x, 0, 0, 1].map(bits)]] });
  for (const axis of [0, 0.000001, 0.00001, 0.000011, 0.5, 3, Infinity, NaN]) add('predicate degenerate axis ' + axis, { mode: 4, vectors: [[0x4f100, [axis, 0, 0, 0].map(bits)]] });
  for (const classId of [0, 1, 0xffffffff]) add('whole constructor untouched bytes ' + classId, { mode: 2, words: [[0x48b38, classId]] });
  for (const classId of [0, 1, 0xffffffff]) add('whole PlayAnimation constructor untouched bytes ' + classId, { mode: 5, words: [[0x48b38, classId]] });
  add('whole enable clears both counters', { mode: 3 });
  return cases;
}
export function prepareOnRegion(c: OnRegionCase) {
  const b = Buffer.alloc(ON_REGION_ARENA), base = ON_REGION_BASE;
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(to ? base + BigInt(to) : 0n, at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at);
  const vector = (at: number, v: number[]) => v.forEach((n, i) => word(at + i * 4, n));
  const matrix = (at: number, center: number[]) => [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, ...center].forEach((n, i) => word(at + i * 4, bits(n)));
  for (let i = 0; i < 0x88; i++) b[0x1000 + i] = (i * 71 + 31) & 255;
  if (c.mode !== 2 && c.mode !== 5) b.fill(0, 0x1000, 0x1088);
  word(0x1060, 0); word(0x1064, 0); b[0x1068] = 0; b[0x105e] = 0;
  if (c.mode === 2 || c.mode === 3) { word(0x1060, 0xdeadbeef); word(0x1064, 0xfacefeed); b[0x1068] = 255; b[0x105e] = 127; }
  ptr(0x1038, 0x4000); ptr(0x1040, 0x4400); ptr(0x1048, 0); word(0x1058, 2); b[0x1050] = 1; b[0x1051] = 1; b[0x1054] = 1;
  ptr(0x2280, 0x3000); ptr(0x2070, 0x3200);
  for (const [clump, members, count] of [[0x4000, 0x4100, 2], [0x4200, 0x4300, 2], [0x4400, 0x4500, 0], [0x4600, 0x4700, 0]]) { ptr(clump + 8, members); word(clump + 16, count); }
  for (let i = 0; i < 20; i++) { const at = 0x5000 + i * 0x100; ptr(0x4100 + i * 8, at); ptr(at, 0x48900); vector(at + 16, [1, 2, 3, 1].map(bits)); b[at + 64] = 1; b[at + 0xf0] = 1; matrix(at + 0x80, [1 + i * 0.1, 2, 3, 1]); }
  for (const [index, at, kind] of [[0, 0x7000, 1], [1, 0x7100, 2]]) { ptr(0x4300 + index * 8, at); ptr(at, 0x48900); vector(at + 16, [1, 2, 3, 1].map(bits)); b[at + 0xf0] = kind; matrix(at + 0x80, [1, 2, 3, 1]); }
  for (let i = 0; i < 16; i++) { const avatar = 0x10000 + i * 0x2400; ptr(avatar + 24, 0x9000 + i * 0x80); b[avatar + 0x1ef8] = +(i === 0); b[avatar + 0x21b2] = +(i === 1); vector(0x9010 + i * 0x80, [1, 2, 3, 1].map(bits)); }
  for (let i = 0; i < 3; i++) ptr(0x48000 + i * 0x100, 0x48800);
  b.writeBigUInt64LE(0x102220000n, 0x48840); b.writeBigUInt64LE(0x102220020n, 0x48918); b.writeBigUInt64LE(0x102220040n, 0x48920);
  word(0x48a38, 83); word(0x48b38, 184);
  word(0x4f000, c.steps ?? 1); word(0x4f004, 1); word(0x4f008, 2); word(0x4f020, bits(0.01)); vector(0x4f080, [0, 0, 0, -3].map(bits)); vector(0x4f090, [1, 2, 3, 1].map(bits)); matrix(0x4f100, [0, 0, 0, 1]);
  for (let i = 0; i < 32; i++) word(0x4f200 + i * 4, +(i % 3 !== 2));
  for (const [at, n] of c.words ?? []) word(at, n); for (const [at, n] of c.bytes ?? []) b[at] = n & 255; for (const [at, to] of c.pointers ?? []) ptr(at, to); for (const [at, v] of c.vectors ?? []) vector(at, v);
  const offset = (p: bigint, n: number) => { const at = Number(p - base); if (at < 0 || at + n > b.length) throw new Error('Unmapped OnRegion runtime'); return at; };
  const m = {
    bytes: (p: bigint, n: number) => b.subarray(offset(p, n), offset(p, n) + n), read32: (p: bigint) => b.readUInt32LE(offset(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(offset(p, 8)),
    write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, offset(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, offset(p, 8)); }, write8: (p: bigint, n: number) => { b[offset(p, 1)] = n & 255; }, string: () => '',
  };
  return { b, base, m };
}
export function evaluateOnRegion(c: OnRegionCase): Buffer {
  const { b, base, m } = prepareOnRegion(c), trace: Buffer[] = []; let line = 0, severity = 0, result = 0, contains = 0, mutationDone = false;
  const word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at), ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at), u32 = (at: number) => b.readUInt32LE(at);
  const record = (kind: number, first: bigint | number = 0, second: bigint | number = 0) => { const r = Buffer.alloc(ON_REGION_ROW); [kind, first, second].forEach((n, i) => r.writeBigUInt64LE(BigInt(n), i * 8)); trace.push(r); return r; };
  const mutate = (kind: number) => {
    if (mutationDone || kind !== u32(0x4f00c)) return; mutationDone = true;
    switch (u32(0x4f010)) {
      case 1: b[0x1053] = 1; break; case 2: ptr(0x1048, 0x4200); break; case 3: word(0x4010, u32(0x4f014)); break;
      case 4: b[0x105d] = 1; b[0x1050] = 0; break; case 5: b[0x1051] = 1; b[0x1068] = 1; break; case 6: b[0x1050] ^= 1; break;
      case 7: b[0x5040] = 0; break; case 8: ptr(0x1040, 0x4600); break; case 9: b[0x1054] = 0; b[0x1055] = 1; break;
    }
  };
  const s: OnRegionServices = {
    avatarBarnReady: barn => { const on = u32(0x4f004) & 255; record(1, barn, on); mutate(1); return on; },
    activeAvatarCount: (barn, local) => { const n = u32(0x4f008); record(2, barn, local); mutate(2); return n | 0; },
    avatarAt: (barn, i) => { record(3, barn, i); mutate(3); return base + 0x10000n + BigInt(i * 0x2400); },
    cameraPosition: owner => { const out = new Uint8Array(b.subarray(0x4f090, 0x4f0a0)); record(4, owner).set(out, 32); mutate(4); return out; },
    avatarEnabled: avatar => { const on = m.bytes(avatar + 0x21b2n, 1)[0]; record(5, avatar, on); mutate(5); return on; },
    metadata: kind => { const index = ['Object', 'Marker', 'LevelMesh'].indexOf(kind), p = base + 0x48000n + BigInt(index * 0x100); record(6, index, p); mutate(6); return p; },
    cast: (meta, object, source) => {
      const kind = Number(meta - base - 0x48000n) / 0x100, r = record(7, meta, object); r.writeBigUInt64LE(source, 24);
      const type = object ? m.bytes(object + 0xf0n, 1)[0] : -1, cast = object && (kind === 0 && type !== 3 || kind === 1 && type === 1 || kind === 2 && type === 2) ? object : 0n;
      if (u32(0x4f018) === kind + 1 && u32(0x4f01c)) object = base + BigInt(u32(0x4f01c)); r.writeBigUInt64LE(object, 32); r.writeBigUInt64LE(cast, 40); mutate(7); return { object, cast };
    },
    transform: object => { const out = new Uint8Array(m.bytes(object + 0x80n, 64)); record(8, object).set(out, 32); mutate(8); return out; },
    localObb: object => { const out = new Uint8Array(b.subarray(0x4f100, 0x4f140)); record(9, object).set(out, 32); mutate(9); return out; },
    pointInObb: (point, box, tolerance) => {
      if (c.mode === 1) return +originalRegionPointInObb(point, box, tolerance);
      const on = u32(0x4f200 + (contains++ % 32) * 4), r = record(10, on); r.writeFloatLE(tolerance, 24); r.set(point, 32); r.set(box, 48); mutate(10); return on & 255;
    },
    setClumpEnabled: (clump, on) => { record(11, clump, on); m.write8(clump + 32n, on); mutate(11); },
    start: event => { record(12, event); m.write8(event + 37n, 1); mutate(12); }, initialPositionWBits: () => u32(0x4f08c),
  };
  try {
    for (let i = 0; i < u32(0x4f000); i++) {
      if (c.mode === 0 || c.mode === 1) updateOriginalOnRegion(m, base + 0x1000n, base + 0x2000n, s);
      else if (c.mode === 2) { s.metadata('Object'); constructOriginalOnRegion(b.subarray(0x1000, 0x1070), u32(0x48b38), { eventClassId: u32(0x48a38), eventVptr: 0x100c14ea0n }); }
      else if (c.mode === 3) enableOriginalOnRegion(m, base + 0x1000n);
      else if (c.mode === 5) { s.metadata('Object'); constructOriginalPlayAnimation(b.subarray(0x1000, 0x1088), u32(0x48b38), { eventClassId: u32(0x48a38), eventVptr: 0x100c14ea0n }); }
      else result = +originalRegionPointInObb(b.subarray(0x4f090, 0x4f0a0), b.subarray(0x4f100, 0x4f140), b.readFloatLE(0x4f020));
    }
  } catch (e) {
    if (!(e instanceof NativeObjectFoundationFailure)) throw e;
    line = e.line; severity = e.severity; const r = record(13, line, severity); r.write(e.expression, 24, 64); r.write('./Clump.h', 88, 64);
  }
  const header = Buffer.alloc(16); [line, severity, trace.length, result].forEach((n, i) => header.writeUInt32LE(n, i * 4));
  return Buffer.concat([header, b, ...trace]);
}
