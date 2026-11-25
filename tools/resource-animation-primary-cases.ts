import { animationResourceCases } from './resource-animation-cases';
import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { Reader, u32, floats } from '../src/core/binary';
import { prepareAnimationRequest } from './resource-animation-request-cases';
import { createOriginalResourceAnimationRequest, type ResourceAnimationRequestInput } from '../src/core/resource-animation-request';
import { updateOriginalResourceAnimationPrimary } from '../src/core/resource-animation-primary';
import { resourceAnimationSample, sampleResourceAnimation } from '../src/core/resource-animation-sample';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';

export const ANIMATION_PRIMARY_BASE = 0x460000000n;
export interface AnimationPrimaryCase { id: string; count: number; seed: number; delta: number; clockOnly: number; variant: number; }
export function animationPrimaryCases(data: string) {
  return animationResourceCases(data).flatMap(source => {
    const pack = readResourceAnimationPack(new Reader(source.bytes)); if (!pack.frameCount || !pack.tracks?.clips.length) return [];
    const requests: AnimationPrimaryCase[] = [];
    for (const count of [0, 1, 2, 4, 7]) for (const clockOnly of [0, 255]) for (const delta of [0, 1 / 60, 0.266]) for (const variant of [0, 1, 2]) requests.push({ id: `${source.id}:${requests.length}`, count, seed: requests.length + 123, delta, clockOnly, variant });
    return [{ source, pack, requests }];
  });
}
export function prepareAnimationPrimary(pack: ResourceAnimationPack, c: AnimationPrimaryCase, kind: 0 | 1 | 2 = 0) {
  const first = pack.tracks!.clips[0], raw: ResourceAnimationRequestInput = { start: first.startFrame + 1, stop: first.endFrame + 1, kind: 0, packIndex: 0, speedMult: 1, weight: 1, weightMult: 1, action: 0, delay: 0, fadeRate: 1.5, mirrored: 0, rootMotionY: 0, rootMotionXZ: 0, flag62: 0, fileIndex: -1, actionIndex: -1, easingFunction: 0, easingPower: 2, field5c: 17, playheadIndex: -1 };
  raw.kind = kind;
  const prior = prepareAnimationRequest(pack, { id: '', mode: 0, input: raw, name: '', seed: c.seed, counts: [0, 0, 0], required: 0, packCount: 1 });
  const b = Buffer.alloc(0x20000); prior.b.copy(b); const base = ANIMATION_PRIMARY_BASE;
  const offset = (p: bigint, n: number) => { const at = Number(p - base); if (at < 0 || at + n > b.length) throw new Error('Unmapped primary'); return at; };
  const m = { bytes: (p: bigint, n: number) => b.subarray(offset(p, n), offset(p, n) + n), read32: (p: bigint) => b.readUInt32LE(offset(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(offset(p, 8)), write8: (p: bigint, n: number) => { b[offset(p, 1)] = n & 255; }, write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, offset(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, offset(p, 8)); }, string: () => '' };
  for (const pool of [{ first: 0x18, index: 0, capacity: 152 }, { first: 0x4298, index: 152, capacity: 16 }, { first: 0x4998, index: 168, capacity: 25 }]) for (let i = 0; i < pool.capacity; i++) b.writeBigUInt64LE(base + 0x7000n + BigInt((pool.index + i) * 32), pool.first + i * 0x70 + 0x68);
  b.writeBigUInt64LE(base + 0xa000n, 0x6018); b.writeBigUInt64LE(base + 0xa000n, 0x6020); b.writeBigUInt64LE(base + 0xb000n, 0x5838);
  b.writeUInt32LE(pack.bones.length, 0xa054); b.writeUInt32LE(pack.sampleRate, 0xa050); b.writeBigUInt64LE(base + 0x1b000n, 0xa058);
  Buffer.from(pack.defaultPose.buffer, pack.defaultPose.byteOffset, pack.defaultPose.byteLength).copy(b, 0x1b000);
  // Every untouched Transform byte participates in the comparison.
  let seed = c.seed; const nodeBytes = (pack.bones.length + 1) * 0xf0;
  for (let i = 0; i < nodeBytes; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[0xb000 + i] = seed >>> 24; }
  if (kind !== 0) {
    b[0x5830] = 0;
    for (let bone = 0; bone < pack.bones.length; bone++) {
      const node = 0xb000 + (bone + 1) * 0xf0, at = bone * 12;
      for (let lane = 0; lane < 4; lane++) { b.writeFloatLE(pack.defaultPose[at + 8 + lane], node + lane * 4); b.writeFloatLE(pack.defaultPose[at + lane], node + 32 + lane * 4); b.writeFloatLE(pack.defaultPose[at + 4 + lane], node + 48 + lane * 4); }
    }
  }
  const services = { ...prior.services, loopSigns: (_p: bigint, start: number, length: number, mask: bigint) => prior.services.loopSigns(_p, start, length, mask - base + prior.base) };
  // Bind masks in this new arena, preserving every spare mask bit.
  for (let i = 0; i < c.count; i++) {
    const clip = pack.tracks!.clips[i % pack.tracks!.clips.length], start = clip.startFrame + 1, stop = clip.endFrame + 1;
    const p = { ...raw, start, stop, weight: c.variant === 2 ? (i & 1 ? 0 : 0.00005) : (i + 1) * 0.17, speedMult: 0.6 + i * 0.1, delay: -(i * 0.13), rootMotionY: i & 1, rootMotionXZ: (i >> 1) & 1, action: c.variant === 1 ? 1 : 0, packIndex: c.variant === 2 && i & 1 ? -1 : 0 };
    createOriginalResourceAnimationRequest(m, base, p, services);
  }
  prior.b.subarray(0x7000, 0x8820).copy(b, 0x7000);
  const rsqrtInputs: number[] = [];
  const sample = (_p: bigint, request: bigint) => {
    const at = Number(request - base); if (b[at + 0x4c]) throw new Error('Primary oracle mirror not prepared');
    const frames = [0x38, 0x3c, 0x40, 0x44].map(n => b.readInt32LE(at + n)) as [number, number, number, number], state = resourceAnimationSample(pack, frames, b.readFloatLE(at + 0x48), b.readInt32LE(at + 0x10), !!b[at + 0x61]);
    return sampleResourceAnimation(pack, state, m.bytes(m.read64(request + 0x68n), Math.ceil(pack.bones.length / 8)));
  };
  const rsqrt = (input: number) => { rsqrtInputs.push(input); return bits(1 / Math.fround(Math.sqrt(value(input)))); };
  return { base, b, m, sample, rsqrt, rsqrtInputs, nodeBytes };
}
export function animationPrimaryExpected(pack: ResourceAnimationPack, c: AnimationPrimaryCase) {
  const p = prepareAnimationPrimary(pack, c); updateOriginalResourceAnimationPrimary(p.m, p.base, c.delta, c.clockOnly, p);
  return { ...p, output: Buffer.concat([u32(0), u32(0), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes)]) };
}
export function animationPrimaryInput(pack: ResourceAnimationPack, c: AnimationPrimaryCase, reciprocalInputs: number[]) {
  const p = prepareAnimationPrimary(pack, c);
  return Buffer.concat([u32(c.clockOnly), floats([c.delta]), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes), u32(reciprocalInputs.length), ...reciprocalInputs.map(u32)]);
}
