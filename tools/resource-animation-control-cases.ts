import type { ResourceAnimationList } from '../src/core/resource-animation-list';
import type { ResourceAnimationPack } from '../src/core/resource-animation';
import { animationRequestCases, animationRequestInput, prepareAnimationRequest, ANIMATION_CONTROLLER_BYTES, ANIMATION_MASK_BYTES, type AnimationRequestCase } from './resource-animation-request-cases';
import { currentOriginalAnimation, playOriginalDefaultAnimation, registerOriginalAnimationPack, setOriginalAnimationSpeed } from '../src/core/resource-animation-control';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';
import { numericFloatBits as bits } from '../src/core/object-numeric-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { u32 } from '../src/core/binary';
import { resourceAnimationHasRange } from '../src/core/resource-animation-loop';
import { findResourceAnimationFile } from '../src/core/resource-animation-list';

export function animationControlCases(data: string, list: ResourceAnimationList) {
  return animationRequestCases(data, list).map(source => {
    const cases: AnimationRequestCase[] = [], template = source.requests[0];
    const add = (mode: number, c: Partial<AnimationRequestCase> = {}, input: Partial<AnimationRequestCase['input']> = {}) => cases.push({ ...template, id: `${source.source.id}:control:${cases.length}`, mode, seed: cases.length + 401, counts: [0, 0, 0], required: 0, packCount: 1, ...c, input: { ...template.input, ...input } });
    for (const packCount of [0, 1, 2]) for (const required of [0, 1]) {
      // In a deliberately gapped pack the original full-range fallback enters
      // its diagnostic's invalid (-1, -1) metadata lookup and faults. These
      // controls cover valid loaded packs, not that malformed fallback domain.
      if (packCount && (required || !findResourceAnimationFile(list, source.pack.name)?.metaDatas.length) && !resourceAnimationHasRange(source.pack, 0, source.pack.frameCount - 1)) continue;
      add(3, { packCount, required });
    }
    for (const kind of [-1, 0, 1, 2, 3]) for (const required of [0, 1, 2, 3, 4, 5, 6]) add(4, { counts: [4, 4, 4], required }, { kind: kind as 0 });
    for (const playheadIndex of [0, 151, 152, 167, 168, 192, 193]) for (const speedMult of [0, -0, 1, -2, 1e-40, 3.4028234663852886e38, Infinity, -Infinity, NaN]) add(5, {}, { playheadIndex, speedMult });
    for (const packCount of [0, 1, 63, 64]) for (const required of [0, 1, 2, 3]) add(6, { packCount, required });
    return { ...source, requests: cases };
  });
}

export function prepareAnimationControl(pack: ResourceAnimationPack, c: AnimationRequestCase) {
  const out = prepareAnimationRequest(pack, c), { b, base, m } = out;
  b.writeUInt32LE(pack.frameCount, 0xa048); b.writeUInt32LE(pack.bones.length, 0xa054);
  b.writeBigUInt64LE(base + 0xb000n, 0xa060); b.writeBigUInt64LE(base + 0xa000n, 0x6018);
  if (c.mode === 4) {
    for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < 4; i++) {
      const at = pool.first + i * 0x70;
      b[at + 0x4f] = 1; b.writeFloatLE(0.5, at + 20); b.writeInt32LE(0, at + 4); b.writeInt32LE(0, at + 8);
      if (i === 3) {
        if (c.required === 1) b[at + 0x4f] = 0;
        if (c.required === 2) b.writeFloatLE(-0.5, at + 20);
        if (c.required === 3) b.writeUInt32LE(0x7fc12345, at + 20);
        if (c.required === 4) b.writeInt32LE(-1, at + 4);
        if (c.required === 5) b.writeInt32LE(-1, at + 8);
      }
      if (c.required === 6) b[at + 0x4f] = 0;
    }
  }
  if (c.mode === 6) {
    for (let at = 0x6200; at < 0x6210; at += 4) b.writeUInt32LE(0, at);
    if (c.required === 1) b.writeUInt32LE(0, 0xa054);
    if (c.required === 2) b.writeUInt32LE(0, 0xa048);
    if (c.required === 3) { b.writeBigUInt64LE(base + 0xc000n, 0x6018); b.writeUInt32LE(pack.bones.length + 1, 0xc054); }
  }
  return { ...out, b, base, m };
}
export function animationControlInput(pack: ResourceAnimationPack, c: AnimationRequestCase) {
  const input = animationRequestInput(pack, { ...c, input: { ...c.input, speedMult: 1 } }), { b } = prepareAnimationControl(pack, c);
  input.writeUInt32LE(bits(c.input.speedMult), 64);
  b.copy(input, 152, 0, ANIMATION_CONTROLLER_BYTES);
  b.copy(input, 152 + ANIMATION_CONTROLLER_BYTES, 0x7000, 0x7000 + ANIMATION_MASK_BYTES);
  return input;
}
export function animationControlExpected(pack: ResourceAnimationPack, list: ResourceAnimationList, c: AnimationRequestCase) {
  const { b, base, m, services } = prepareAnimationControl(pack, c); let line = 0, severity = 0, result = -1234567;
  try {
    if (c.mode === 3) result = playOriginalDefaultAnimation(m, base, c.required ? { version: 3, files: [], metaDataCount: 0 } : list, Array(c.packCount).fill(pack), services);
    if (c.mode === 4) result = currentOriginalAnimation(m, base, c.input.kind);
    if (c.mode === 5) setOriginalAnimationSpeed(m, base, c.input.playheadIndex, bits(c.input.speedMult));
    if (c.mode === 6) registerOriginalAnimationPack(m, base, base + 0xa000n, {
      initializeSkeleton: (controller, bones, count) => { m.write32(controller + 0x6200n, Number(bones - base)); m.write32(controller + 0x6204n, count); },
      finalizePack: ptr => { m.write32(base + 0x6208n, Number(ptr - base)); m.write32(base + 0x620cn, m.read32(base + 0x6220n)); },
    });
  } catch (e) { if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity; }
  return Buffer.concat([u32(line), u32(severity), u32(result >>> 0), b.subarray(0, ANIMATION_CONTROLLER_BYTES), b.subarray(0x7000, 0x7000 + ANIMATION_MASK_BYTES)]);
}
