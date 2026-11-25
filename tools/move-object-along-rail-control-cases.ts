import { prepareMoveObjectAlongRail, MOVE_RAIL_ROW, type MoveRailCase } from './move-object-along-rail-cases';
import { beginOriginalMoveObjectAlongRailUpdate, type MoveObjectAlongRailUpdateControlServices } from '../src/core/move-object-along-rail-update-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';

const doubleWords = (at: number, n: number): [number, number][] => { const b = Buffer.alloc(8); b.writeDoubleLE(n); return [[at, b.readUInt32LE()], [at + 4, b.readUInt32LE(4)]]; };
export function moveRailControlCases(): MoveRailCase[] {
  const cases: MoveRailCase[] = [], add = (label: string, changes: Partial<MoveRailCase> = {}) => cases.push({ label, mode: 7, ...changes });
  for (const active of [0, 1, 255]) for (const count of [0, 1, 3]) add(`active/objects ${active}/${count}`, { bytes: [[0x10e0, active]], words: [[0x4010, count]] });
  for (const time of [-1, 0, 0.0001, 0.001, 0.001001, 1, 25.5, 35, Infinity, NaN]) for (const count of [0, 1]) add(`duration assertion ${time}/${count}`, { words: [[0x1050, bits(time)], [0x4010, count]] });
  for (const clockScale of [-1, -0, 0, 0.5, 1, 2, Infinity, NaN]) for (const debug of [0, 1]) add(`clock/debug clamp ${clockScale}/${debug}`, { words: [[0x32020, bits(clockScale)], [0x4f030, debug], [0x4f034, bits(0.75)]] });
  for (const delta of [-0.1, -0, 0, 0.0001, 1 / 60, 0.267, 2]) add(`frame delta ${delta}`, { words: [[0x32014, bits(delta)]] });
  for (const elapsed of [-10, -0, 0, 0.5, 17.5, 35, 36, 70]) for (const easeIn of [0, 3, 35]) for (const easeOut of [0, 5]) add(`elapsed/eases ${elapsed}/${easeIn}/${easeOut}`, { words: [[0x32024, bits(17.25 + elapsed)], [0x1048, bits(easeIn)], [0x104c, bits(easeOut)]] });
  for (const elapsed of [0.1, 17.5, 17.5001, 50]) for (const last of [0, 10]) for (const wrap of [0, 1]) add(`smoothing reset ${elapsed}/${last}/${wrap}`, { words: [[0x32024, bits(17.25 + elapsed)], [0x10cc, bits(last)]], bytes: [[0x10d8, wrap]] });
  for (const looped of [0, 1]) for (const wrap of [0, 1]) for (const finished of [0, 1]) for (const flag of [0, 1]) for (const updates of [0, 2, 3]) add(`empty finish ${looped}/${wrap}/${finished}/${flag}/${updates}`, { words: [[0x4010, 0], [0x32024, bits(87.25)], [0x10d4, updates]], bytes: [[0x442c, looped], [0x1059, wrap], [0x10d0, finished], [0x10d8, flag]] });
  for (const authority of [0, 1, 255]) for (const index of [0, 1, 2, 0xffffffff]) for (const objective of [0, 1]) for (const active of [0, 1]) add(`network ${authority}/${index}/${objective}/${active}`, { bytes: [[0x10a0, 1], [0x31068, active], [0x31168, 2], [0x350f0, objective], [0x4f038, authority]], words: [[0x10f0, index]], pointers: [[0x10a8, objective ? 0x35000 : 0]], steps: 2 });
  for (const clockScale of [0, 1, 2]) for (const authority of [0, 1]) add(`network selected double clock ${clockScale}/${authority}`, { bytes: [[0x10a0, 1], [0x4f038, authority]], words: [[0x10f0, 0], [0x32020, bits(clockScale)], ...doubleWords(0x320b8, 30), ...doubleWords(0x320c8, 45)], steps: 2 });
  for (const enabled of [0, 1]) for (const active of [0, 1]) add(`network live objective ${enabled}/${active}`, { bytes: [[0x10a0, 1], [0x4f038, 1], [0x350f0, enabled], [0x31068, active]], words: [[0x10f0, 0]], pointers: [[0x10a8, 0x35000]] });
  for (const count of [0, 1, 3]) for (const looped of [0, 1]) for (const lead of [-10, 0, 10]) for (const max of [0, 2]) add(`avatar tracking ${count}/${looped}/${lead}/${max}`, { bytes: [[0x1064, 1], [0x442c, looped]], words: [[0x4010, count], [0x1068, bits(lead)], [0x106c, bits(max)], [0x1070, bits(-1)]] });
  for (const desired of [-100, 0, 5, 100, NaN]) for (const minimum of [-2, 0, 3]) add(`tracking min/max gap ${desired}/${minimum}`, { bytes: [[0x1064, 1]], words: [[0x4f240, bits(desired)], [0x4f244, bits(5)], [0x106c, bits(2)], [0x1070, bits(minimum)]] });
  for (const kind of [1, 2, 3, 4, 5, 9, 12, 13, 14, 15, 16, 17, 18]) for (const action of [1, 2, 3, 4, 6]) add(`callback rereads ${kind}/${action}`, { bytes: [[0x10a0, 1], [0x1064, kind <= 5 || kind === 15 ? 1 : 0], [0x4f038, 1], [0x350f0, 1]], words: [[0x10f0, 0], [0x4f00c, kind], [0x4f010, action]], pointers: [[0x10a8, 0x35000]] });
  return cases;
}

export function prepareMoveRailControl(c: MoveRailCase) {
  const defaults: Partial<MoveRailCase> = {
    words: [[0x32020, bits(1)], [0x32014, bits(1 / 60)], [0x10d4, 0], [0x10c8, bits(0)], [0x10cc, bits(0)], [0x10b8, bits(0)], ...doubleWords(0x10e8, 17.25), ...doubleWords(0x320b8, 17.25), ...doubleWords(0x320c8, 17.25), ...doubleWords(0x33070, 17.25)],
    bytes: [[0x10d0, 0], [0x10d8, 0], [0x33068, 1], [0x350f0, 1]],
    pointers: [[0x2178, 0x34000], [0x34040, 0x34800], [0x2280, 0x36800], [0x36018, 0x37000], [0x1098, 0x35200]],
    vectors: [[0x37010, [5, 7, 9, 1].map(bits)]],
  };
  return prepareMoveObjectAlongRail({ ...c, words: [...defaults.words!, ...(c.words ?? [])], bytes: [...defaults.bytes!, ...(c.bytes ?? [])], pointers: [...defaults.pointers!, ...(c.pointers ?? [])], vectors: [...defaults.vectors!, ...(c.vectors ?? [])] });
}

export function evaluateMoveRailControl(c: MoveRailCase, powTrace?: Buffer): Buffer {
  const { b, base, m } = prepareMoveRailControl(c), trace: Buffer[] = [], counts = Array(32).fill(0);
  let line = 0, severity = 0, mutated = false, nearestCount = 0, distanceCount = 0, expAt = 0;
  const u32 = (at: number) => b.readUInt32LE(at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at), ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at);
  const record = (kind: number, first: bigint | number = 0, second: bigint | number = 0) => { const r = Buffer.alloc(MOVE_RAIL_ROW); [kind, first, second].forEach((n, i) => r.writeBigUInt64LE(BigInt(n), i * 8)); trace.push(r); counts[kind]++; return r; };
  const mutate = (kind: number) => {
    if (mutated || kind !== u32(0x4f00c) || counts[kind] !== u32(0x4f014)) return;
    mutated = true;
    switch (u32(0x4f010)) {
      case 1: word(0x4010, 0); break; case 2: ptr(0x1040, 0x4200); break; case 3: ptr(0x1038, 0x4600); break;
      case 4: word(0x4418, bits(50)); break; case 6: b[0x10a0] ^= 1; break;
    }
  };
  const s: MoveObjectAlongRailUpdateControlServices = {
    debugScaleBits: () => u32(0x4f030) ? u32(0x4f034) : undefined,
    writableNetworkState: manager => { const p = base + 0x31000n; record(9, manager, p); mutate(9); return p; },
    readableNetworkState: manager => { const p = base + 0x33000n; record(12, manager, p); mutate(12); return p; },
    hasSessionAuthority: session => { const n = b[0x4f038]; record(13, session, n); mutate(13); return n; },
    objectiveEnabled: objective => { const n = m.bytes(objective + 0xf0n, 1)[0]; record(14, objective, n); mutate(14); return n; },
    localAvatar: barn => { const p = base + 0x36000n; record(15, barn, p); mutate(15); return p; },
    objectMetadata: () => { const p = base + 0x48000n; record(1, p); mutate(1); return p; },
    castObject: (meta, object, source) => { const p = object && m.bytes(object + 0xf0n, 1)[0] !== 3 ? object : 0n, r = record(2, meta, object); r.writeBigUInt64LE(source, 24); r.writeBigUInt64LE(p, 32); mutate(2); return p; },
    transform: object => { const out = new Uint8Array(m.bytes(object + 0x80n, 64)); record(3, object).set(out, 32); mutate(3); return out; },
    nearest: (rail, position) => { const n = u32(0x4f200 + (nearestCount++ % 16) * 4); record(4, rail, n).set(position, 32); mutate(4); return n; },
    distanceAtParameter: (rail, parameter) => { const n = u32(0x4f240 + (distanceCount++ % 16) * 4); record(5, rail, n).writeUInt32LE(parameter, 24); mutate(5); return n; },
    exp: input => {
      let result = bits(Math.exp(value(input)));
      if (powTrace) { if (expAt + 8 > powTrace.length || powTrace.readUInt32LE(expAt) !== input) throw new Error(`${c.label}: expf input differs at ${expAt}`); result = powTrace.readUInt32LE(expAt + 4); expAt += 8; }
      record(18, input, result); mutate(18); return result;
    },
    fmod: (numerator, denominator) => { const n = bits(value(numerator) % value(denominator)); record(19, numerator, denominator).writeUInt32LE(n, 24); return n; },
    setObjectEnabled: (object, enabled) => { record(16, object, enabled); mutate(16); },
    finishEvent: event => { record(17, event); mutate(17); m.write8(event + 224n, 0); },
  };
  try {
    for (let step = 0; step < u32(0x4f000); step++) {
      const result = beginOriginalMoveObjectAlongRailUpdate(m, base + 0x1000n, base + 0x2000n, s);
      if (result.objectPhaseReady) record(11);
    }
  } catch (e) {
    if (!(e instanceof NativeObjectFoundationFailure)) throw e;
    line = e.line; severity = e.severity;
    const r = record(10, line, severity); r.write(e.expression, 24, 64); r.write(e.file, 88, 32);
  }
  if (powTrace && expAt !== powTrace.length) throw new Error('Unused native expf calls');
  const h = Buffer.alloc(16); [line, severity, trace.length, 0].forEach((n, i) => h.writeUInt32LE(n, i * 4));
  return Buffer.concat([h, b, ...trace]);
}
