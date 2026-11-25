import { animationResourceCases, type AnimationResourceCase } from './resource-animation-cases';
import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { Reader, u32, floats } from '../src/core/binary';
import { findResourceAnimationFile, type ResourceAnimationList } from '../src/core/resource-animation-list';
import { createOriginalNamedAnimationRequest, createOriginalResourceAnimationRequest, findOriginalResourceAnimationAction, RESOURCE_ANIMATION_REQUEST_POOLS, type ResourceAnimationRequestInput } from '../src/core/resource-animation-request';
import { resourceAnimationClipForRange, resourceAnimationHasRange, resourceAnimationLoopSigns } from '../src/core/resource-animation-loop';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';

export const ANIMATION_REQUEST_BASE = 0x450000000n, ANIMATION_CONTROLLER_BYTES = 0x6300, ANIMATION_MASK_BYTES = 0x1820;
export interface AnimationRequestCase { id: string; mode: number; input: ResourceAnimationRequestInput; name: string; seed: number; counts: [number, number, number]; required: number; packCount: number; }
const defaults: ResourceAnimationRequestInput = { start: 1, stop: 1, kind: 0, packIndex: 0, speedMult: 0.6, weight: 0.35, weightMult: 0.75, action: 0, delay: 0, fadeRate: 1.5, mirrored: 0, rootMotionY: 0, rootMotionXZ: 0, flag62: 0, fileIndex: 0, actionIndex: 0, easingFunction: 0, easingPower: 2, field5c: 17, playheadIndex: -1 };
export function animationRequestCases(data: string, list: ResourceAnimationList) {
  return animationResourceCases(data).flatMap(source => {
    const pack = readResourceAnimationPack(new Reader(source.bytes)); if (!pack.frameCount || !pack.tracks?.clips.length) return [];
    const requests: AnimationRequestCase[] = [], add = (changes: Partial<ResourceAnimationRequestInput> = {}, mode = 0, name = '', counts: [number, number, number] = [0, 0, 0], required = 0, packCount = 1) => {
      requests.push({ id: `${source.id}:${requests.length}`, mode, input: { ...defaults, ...changes }, name, seed: requests.length + 101, counts, required, packCount });
    };
    const clip = pack.tracks.clips[0], start = clip.startFrame + 1, stop = clip.endFrame + 1;
    for (const kind of [0, 1, 2] as const) for (const delay of [0, 0.2, -0.5]) add({ start, stop, kind, delay, action: kind === 1 ? 1 : 0, mirrored: 255, rootMotionY: 3, rootMotionXZ: 9, flag62: 7 }, 0, '', [2, 3, 4]);
    for (const playheadIndex of [0, 151, 152, 167, 168, 192, 193]) add({ start, stop, playheadIndex });
    for (const kind of [0, 1, 2] as const) { const counts: [number, number, number] = [0, 0, 0]; counts[kind] = RESOURCE_ANIMATION_REQUEST_POOLS[kind].capacity; add({ start, stop, kind }, 0, '', counts); }
    add({ start: 0, stop }, 0); add({ start, stop: pack.frameCount + 1 });
    add({ start, stop, packIndex: -1, action: 255, delay: -0.25 });
    if (stop > start) { add({ start, stop: start }); add({ start, stop: stop - 1 }); }
    const file = findResourceAnimationFile(list, pack.name);
    if (file) {
      for (const metadata of file.metaDatas) if (!metadata.mirrored) add({}, 1, metadata.name);
      add({}, 2, file.metaDatas[0]?.name ?? '', [0, 0, 0], 0, 2);
      add({}, 2, (file.metaDatas[0]?.name ?? '').toUpperCase());
    }
    add({}, 2, 'MissingCreatureAnimation'); add({}, 2, 'MissingCreatureAnimation', [0, 0, 0], 1);
    add({}, 1, 'MissingCreatureAnimation');
    return [{ source, pack, requests }];
  });
}
export function prepareAnimationRequest(pack: ResourceAnimationPack, c: AnimationRequestCase) {
  const b = Buffer.alloc(0x10000), base = ANIMATION_REQUEST_BASE; let seed = c.seed >>> 0;
  for (let i = 0; i < b.length; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[i] = seed >>> 24; }
  const offset = (p: bigint, n: number) => { const at = Number(p - base); if (at < 0 || at + n > b.length) throw new Error('Unmapped animation request'); return at; };
  const m = { bytes: (p: bigint, n: number) => b.subarray(offset(p, n), offset(p, n) + n), read32: (p: bigint) => b.readUInt32LE(offset(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(offset(p, 8)), write8: (p: bigint, n: number) => { b[offset(p, 1)] = n & 255; }, write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, offset(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, offset(p, 8)); }, string: () => '' };
  b[20] = 0; c.counts.forEach((n, i) => b.writeInt32LE(n, 8 + i * 4)); b.writeInt32LE(41, 0x5864); b.writeInt32LE(53, 0x5868);
  b.writeInt32LE(c.packCount, 0x6220); for (let i = 0; i < c.packCount; i++) b.writeBigUInt64LE(base + 0xa000n, 0x6020 + i * 8);
  for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < pool.capacity; i++) b.writeBigUInt64LE(base + 0x7000n + BigInt((pool.index + i) * 32), pool.first + i * 0x70 + 0x68);
  b.writeUInt32LE(pack.sampleRate, 0xa050);
  const services = { hasRange: (_p: bigint, start: number, stop: number) => resourceAnimationHasRange(pack, start, stop), clipForRange: (_p: bigint, start: number, stop: number) => resourceAnimationClipForRange(pack, start, stop), loopSigns: (_p: bigint, start: number, length: number, ptr: bigint) => {
    const result = resourceAnimationLoopSigns(pack, start, length, m.bytes(ptr, Math.ceil(pack.bones.length / 8))); m.bytes(ptr, result.mask.length).set(result.mask); return result.negative;
  } };
  return { b, base, m, services };
}
export function animationRequestInput(pack: ResourceAnimationPack, c: AnimationRequestCase) {
  const { b } = prepareAnimationRequest(pack, c), p = c.input, name = Buffer.alloc(64); name.write(c.name);
  const words = [p.start, p.stop, p.kind, p.packIndex, p.action, p.mirrored, p.rootMotionY, p.rootMotionXZ, p.flag62, p.fileIndex, p.actionIndex, p.easingFunction, p.field5c, p.playheadIndex, c.required];
  return Buffer.concat([u32(c.mode), ...words.map(n => u32(n >>> 0)), floats([p.speedMult, p.weight, p.weightMult, p.delay, p.fadeRate, p.easingPower]), name, b.subarray(0, ANIMATION_CONTROLLER_BYTES), b.subarray(0x7000, 0x7000 + ANIMATION_MASK_BYTES)]);
}
export function animationRequestExpected(pack: ResourceAnimationPack, list: ResourceAnimationList, c: AnimationRequestCase) {
  const { b, base, m, services } = prepareAnimationRequest(pack, c); let line = 0, severity = 0, result = -1234567;
  try {
    if (c.mode === 0) result = createOriginalResourceAnimationRequest(m, base, c.input, services);
    else if (c.mode === 1) result = createOriginalNamedAnimationRequest(m, base, list, Array(c.packCount).fill(pack), c.name, c.input.weight, services, c.input.playheadIndex);
    else {
      const found = findOriginalResourceAnimationAction(list, Array(c.packCount).fill(pack), c.name, !!c.required);
      result = found ? list.metaDataCount + 1 : 0;
      b.writeInt32LE(found?.packIndex ?? -77, 0x6200); b.writeInt32LE(found?.fileIndex ?? -88, 0x6204); b.writeInt32LE(found?.actionIndex ?? -99, 0x6208);
    }
  } catch (e) { if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity; }
  return Buffer.concat([u32(line), u32(severity), u32(result >>> 0), b.subarray(0, ANIMATION_CONTROLLER_BYTES), b.subarray(0x7000, 0x7000 + ANIMATION_MASK_BYTES)]);
}
