import { constructOriginalMoveObjectAlongRail, loadOriginalMoveObjectAlongRail, enableOriginalMoveObjectAlongRail, finishOriginalMoveObjectAlongRail, unloadOriginalMoveObjectAlongRail, type MoveObjectAlongRailLoadServices, type MoveObjectAlongRailEnableServices } from '../src/core/move-object-along-rail-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { numericFloatBits as bits } from '../src/core/object-numeric-runtime';
import { railClosestPoint, type RailCache } from '../src/core/rail';
import { buildRailArcTable, railDistanceAtParameter } from '../src/core/rail-arc';
import fishInputs from '../tests/fixtures/fish-group-rail-lifecycle-inputs.json';
export const MOVE_RAIL_ARENA = 0x50000, MOVE_RAIL_ROW = 128, MOVE_RAIL_BASE = 0x440000000n;
export interface MoveRailCase { label: string; mode: number; steps?: number; words?: [number, number][]; bytes?: [number, number][]; pointers?: [number, number][]; vectors?: [number, number[]][]; railCache?: RailCache; }
export function moveObjectAlongRailCases(): MoveRailCase[] {
  const cases: MoveRailCase[] = [], add = (label: string, changes: Partial<MoveRailCase> = {}) => cases.push({ label, mode: 2, ...changes });
  for (const classId of [0, 1, 0xffffffff]) add('placement preserves unwritten storage ' + classId, { mode: 0, words: [[0x48b38, classId]] });
  for (const objects of [0, 1, 2, 5]) for (const network of [0, 1]) {
    add('whole load allocation network ' + [objects, network], { mode: 1, words: [[0x4010, objects]], bytes: [[0x10a0, network]] });
    add('whole load enable finish unload ' + [objects, network], { mode: 5, words: [[0x4010, objects]], bytes: [[0x10a0, network]] });
  }
  for (const network of [0, 1]) for (const objects of [0, 0x4000]) add('load null or empty Clump ' + [network, objects], { mode: 1, pointers: [[0x1040, objects]], words: [[0x4010, 0]], bytes: [[0x10a0, network]] });
  for (const count of [0, 1, 14, 15, 16, 17, 255]) add('network allocation unsigned count ' + count, { mode: 1, bytes: [[0x10a0, 1], [0x31168, count]] });
  add('network autoStart assertion after allocation', { mode: 1, bytes: [[0x10a0, 1], [0x100c, 0]] });
  for (const network of [0, 1]) add('Finish only changes nonnetwork active byte ' + network, { mode: 3, steps: 3, bytes: [[0x10a0, network], [0x10e0, 127]] });
  for (const first of [0, 0x6000]) for (const second of [0, 0x8000]) add('Unload null and repeated release ' + [first, second], { mode: 4, steps: 2, pointers: [[0x10b0, first], [0x10c0, second]] });
  for (const time of [-Infinity, -1, -0, 0, 0.00001, 0.0001, 0.001, 25.5, 35, Infinity, NaN]) for (const speed of [0, 1]) add('Enable native time clamp ' + [time, speed], { words: [[0x1050, bits(time)]], bytes: [[0x1058, speed]] });
  for (const speed of [-Infinity, -2, -0, 0.00001, 0.0001, 1, 20, Infinity, NaN]) add('Enable speed-derived duration ' + speed, { words: [[0x1054, bits(speed)]], bytes: [[0x1058, 1]] });
  for (const start of [0, 1]) for (const network of [0, 1]) for (const w of [0, -0, 1, -3, Infinity, NaN]) add('record padding scale W and phase cleared lanes ' + [start, network, w], { steps: 2, bytes: [[0x105a, start], [0x10a0, network]], words: [[0x4f020, bits(w)]] });
  for (const axis of [[0, 0, 0, 0], [0.000001, 0, 0, 0], [0.00001, 0, 0, 0], [0.000011, 0, 0, 0], [1, 2, 3, 4], [0, -1, 0, -3], [NaN, 0, 0, 0], [Infinity, 0, 0, 0]]) {
    for (const column of [0, 16, 32]) add('four-lane scale XYZ normalization ' + [column, axis], { vectors: [[0x5080 + column, axis.map(bits)]] });
  }
  for (const n of [0, 1, 1073741823, 2147483647, -1, -2147483648]) add('ordered three random calls signed integer ' + n, { words: Array.from({ length: 16 }, (_, i) => [0x4f100 + i * 4, n]) });
  for (const distance of [-1, -0, 0, 20, 100, Infinity, NaN]) add('closest offset ordered maximum ' + distance, { words: [[0x4f240, bits(distance)]] });
  add('empty target list skips unwritten scale W', { words: [[0x4010, 0]] });
  add('Object cast assertion preserves partial records', { bytes: [[0x51f0, 3]] });
  for (const kind of [1, 2, 3, 4, 5, 6]) for (const action of [1, 2, 3, 4, 5, 6, 8, 9]) add('Enable callback live field order ' + [kind, action], { words: [[0x4f00c, kind], [0x4f010, action], [0x4f014, 1]] });
  for (const kind of [7, 9]) for (const action of [1, 2, 6, 7]) add('Load callback rereads ' + [kind, action], { mode: 1, bytes: [[0x10a0, 1]], words: [[0x4f00c, kind], [0x4f010, action], [0x4f014, 1], [0x4f018, 15]] });
  add('Unload callback changes second pointer before reread', { mode: 4, words: [[0x4f00c, 8], [0x4f010, 5], [0x4f014, 1]], pointers: [[0x10c0, 0x18000]] });
  cases.push(...fishInputs.cases as MoveRailCase[]); return cases;
}
export function prepareMoveObjectAlongRail(c: MoveRailCase) {
  const b = Buffer.alloc(MOVE_RAIL_ARENA), base = MOVE_RAIL_BASE;
  const word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at), ptr = (at: number, to: number) => b.writeBigUInt64LE(to ? base + BigInt(to) : 0n, at);
  const vector = (at: number, ns: number[]) => ns.forEach((n, i) => word(at + i * 4, n));
  for (let i = 0; i < 0xf8; i++) b[0x1000 + i] = (i * 71 + 31) & 255;
  if (c.mode !== 0) {
    b.fill(0, 0x1000, 0x10f8); b[0x100c] = 1;
    ptr(0x1038, 0x4400); ptr(0x1040, 0x4000); ptr(0x10b0, 0x6000); ptr(0x10c0, 0x18000);
    word(0x1050, bits(35)); word(0x1054, bits(20)); b[0x105a] = 1;
    word(0x10b8, bits(123)); word(0x10c8, bits(0.75)); word(0x10cc, bits(40)); b[0x10d0] = 255; word(0x10d4, 123);
    b[0x10d8] = 7; word(0x10dc, 8); b[0x10e0] = 3; b.writeDoubleLE(123, 0x10e8); word(0x10f0, 0xffffffff);
  }
  ptr(0x2160, 0x32000); ptr(0x25d0, 0x30000); word(0x32024, bits(17.25)); b[0x31168] = 2;
  for (const [clump, members, count] of [[0x4000, 0x4100, 3], [0x4200, 0x4300, 2]]) {
    ptr(clump + 8, members); word(clump + 16, count);
    for (let i = 0; i < 5; i++) ptr(members + i * 8, 0x5000 + i * 0x100);
  }
  word(0x4418, bits(100)); word(0x4618, bits(200));
  for (let i = 0; i < 5; i++) {
    const at = 0x5080 + i * 0x100;
    vector(at, [2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4, 0, i + 1, i + 2, i + 3, 1].map(bits));
  }
  for (const at of [0x6000, 0x8000, 0x10000, 0x18000]) for (let i = 0; i < 0x1000; i++) b[at + i] = (i * 43 + 17) & 255;
  ptr(0x48000, 0x48800); b.writeBigUInt64LE(0x102220000n, 0x48840); word(0x48a38, 83); word(0x48b38, 93);
  word(0x4f000, c.steps ?? 1); word(0x4f014, 1); word(0x4f020, bits(-7));
  for (let i = 0; i < 16; i++) { word(0x4f100 + i * 4, (i * 139852381 + 178913) & 0x7fffffff); word(0x4f200 + i * 4, bits(i * 0.025)); word(0x4f240 + i * 4, bits(i * 3 + 10)); }
  for (const [at, n] of c.words ?? []) word(at, n); for (const [at, n] of c.bytes ?? []) b[at] = n & 255;
  for (const [at, n] of c.pointers ?? []) ptr(at, n); for (const [at, ns] of c.vectors ?? []) vector(at, ns);
  if (c.railCache) {
    const cache = c.railCache, arc = buildRailArcTable(cache, 32);
    ptr(0x4408, 0x20000); word(0x4414, arc.pairs.length); word(0x4418, bits(arc.totalLength));
    word(0x4428, cache.positions.length); b[0x442c] = +cache.looped; ptr(0x4490, 0x21000);
    vector(0x4450, cache.transform.map(bits));
    cache.positions.forEach((p, i) => vector(0x21000 + i * 16, [...p, 1].map(bits)));
    arc.pairs.forEach((p, i) => vector(0x20000 + i * 8, p.map(bits)));
  }
  const offset = (p: bigint, n: number) => { const at = Number(p - base); if (at < 0 || at + n > b.length) throw new Error('Unmapped MoveObjectAlongRail runtime'); return at; };
  const m = {
    bytes: (p: bigint, n: number) => b.subarray(offset(p, n), offset(p, n) + n), read32: (p: bigint) => b.readUInt32LE(offset(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(offset(p, 8)),
    write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, offset(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, offset(p, 8)); }, write8: (p: bigint, n: number) => { b[offset(p, 1)] = n & 255; }, string: () => '',
  };
  return { b, base, m };
}
export function evaluateMoveObjectAlongRail(c: MoveRailCase): Buffer {
  const { b, base, m } = prepareMoveObjectAlongRail(c), trace: Buffer[] = [], counts = Array(16).fill(0);
  let line = 0, severity = 0, mutated = false, randomCount = 0, nearestCount = 0, distanceCount = 0, allocationCount = 0;
  const word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at), u32 = (at: number) => b.readUInt32LE(at), ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at);
  const record = (kind: number, first: bigint | number = 0, second: bigint | number = 0) => { const r = Buffer.alloc(MOVE_RAIL_ROW); [kind, first, second].forEach((n, i) => r.writeBigUInt64LE(BigInt(n), i * 8)); trace.push(r); counts[kind]++; return r; };
  const mutate = (kind: number) => {
    if (mutated || kind !== u32(0x4f00c) || counts[kind] !== u32(0x4f014)) return; mutated = true;
    switch (u32(0x4f010)) {
      case 1: word(0x4010, 0); break; case 2: ptr(0x1040, 0x4200); break; case 3: ptr(0x1038, 0x4600); break;
      case 4: word(0x4418, bits(50)); break; case 5: ptr(0x10c0, 0x8000); break; case 6: b[0x10a0] ^= 1; break;
      case 7: word(0x31168, u32(0x4f018)); break; case 8: b[0x105a] ^= 1; break; case 9: word(0x4f100 + (randomCount % 16) * 4, 0x7fffffff); break;
    }
  };
  const load: MoveObjectAlongRailLoadServices = {
    allocationTag: base + 0x48c00n,
    allocate: (heap, size, tag, alignment) => { const p = base + BigInt(allocationCount++ % 2 ? 0x18000 : 0x10000), r = record(7, heap, size); [tag, alignment, p].forEach((n, i) => r.writeBigUInt64LE(BigInt(n), 24 + i * 8)); mutate(7); return p; },
    release: (heap, p) => { record(8, heap, p); mutate(8); },
    networkState: manager => { const p = base + 0x31000n; record(9, manager, p); mutate(9); return p; },
  };
  const enable: MoveObjectAlongRailEnableServices = {
    objectMetadata: () => { const p = base + 0x48000n; record(1, p); mutate(1); return p; },
    castObject: (metadata, object, source) => { const cast = object && m.bytes(object + 0xf0n, 1)[0] !== 3 ? object : 0n, r = record(2, metadata, object); r.writeBigUInt64LE(source, 24); r.writeBigUInt64LE(cast, 32); mutate(2); return cast; },
    transform: object => { const out = new Uint8Array(m.bytes(object + 0x80n, 64)); record(3, object).set(out, 32); mutate(3); return out; },
    nearest: (rail, position) => { const n = u32(0x4f200 + (nearestCount++ % 16) * 4); record(4, rail, n).set(position, 32); mutate(4); return n; },
    distanceAtParameter: (rail, parameter) => { const n = u32(0x4f240 + (distanceCount++ % 16) * 4); record(5, rail, n).writeUInt32LE(parameter, 24); mutate(5); return n; },
    random: () => { const n = u32(0x4f100 + (randomCount++ % 16) * 4); record(6, n); mutate(6); return n | 0; }, initialScaleWBits: () => u32(0x4f020),
  };
  if (c.railCache) {
    const cache = c.railCache, arc = buildRailArcTable(cache, 32);
    enable.nearest = (_rail, position) => { const v = new DataView(position.buffer, position.byteOffset, 16); return bits(railClosestPoint(cache, [0, 4, 8].map(at => v.getFloat32(at, true))).parameter); };
    enable.distanceAtParameter = (_rail, parameter) => { const v = Buffer.alloc(4); v.writeUInt32LE(parameter); return bits(railDistanceAtParameter(arc, cache, v.readFloatLE())); };
  }
  const event = base + 0x1000n, game = base + 0x2000n, heap = base + 0x3000n;
  try {
    for (let step = 0; step < u32(0x4f000); step++) {
      if (c.mode === 0) { enable.objectMetadata(); constructOriginalMoveObjectAlongRail(b.subarray(0x1000, 0x10f8), u32(0x48b38), { eventClassId: u32(0x48a38), eventVptr: 0x100c14ea0n }); }
      else if (c.mode === 1) loadOriginalMoveObjectAlongRail(m, event, game, heap, load);
      else if (c.mode === 2) enableOriginalMoveObjectAlongRail(m, event, game, enable);
      else if (c.mode === 3) finishOriginalMoveObjectAlongRail(m, event);
      else if (c.mode === 4) unloadOriginalMoveObjectAlongRail(m, event, heap, load);
      else { loadOriginalMoveObjectAlongRail(m, event, game, heap, load); enableOriginalMoveObjectAlongRail(m, event, game, enable); finishOriginalMoveObjectAlongRail(m, event); unloadOriginalMoveObjectAlongRail(m, event, heap, load); }
    }
  } catch (e) {
    if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity;
    const r = record(10, line, severity); r.write(e.expression, 24, 64); r.write(e.file, 88, 32);
  }
  const h = Buffer.alloc(16); [line, severity, trace.length, 0].forEach((n, i) => h.writeUInt32LE(n, i * 4)); return Buffer.concat([h, b, ...trace]);
}
