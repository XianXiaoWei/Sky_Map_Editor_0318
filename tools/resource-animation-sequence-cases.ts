import { animationRequestCases, animationRequestInput, prepareAnimationRequest, ANIMATION_CONTROLLER_BYTES, ANIMATION_MASK_BYTES, type AnimationRequestCase } from './resource-animation-request-cases';
import { readResourceAnimationList, resourceAnimationNameHash, findResourceAnimationFile, type ResourceAnimationList } from '../src/core/resource-animation-list';
import type { ResourceAnimationPack } from '../src/core/resource-animation';
import { fadeOriginalAnimationSequence, makeOriginalAnimationSpace, playOriginalAnimationSequence, playOriginalAnimationSequenceByIndex } from '../src/core/resource-animation-sequence';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { u32 } from '../src/core/binary';
import { resourceAnimationHasRange } from '../src/core/resource-animation-loop';
import fs from 'node:fs';
import path from 'node:path';
import { loadOriginalAnimationSequenceRegistry } from '../src/core/animation-sequence-registry';
export interface AnimationSequenceCase extends AnimationRequestCase { variant: number; steps: number; queryIndex: number; reserve: number; forced: number; duration: number; fadeDelay: number; stepName: string; }
export function animationSequenceCases(data: string, list: ResourceAnimationList) {
  return animationRequestCases(data, list).map((source, sourceIndex) => {
    const template = source.requests[0], requests: AnimationSequenceCase[] = [];
    const file = findResourceAnimationFile(list, source.pack.name);
    const metadata = file?.metaDatas.find(m => !m.mirrored && resourceAnimationHasRange(source.pack, m.start - 1, m.stop - 1));
    const add = (mode: number, input: Partial<AnimationSequenceCase['input']> = {}, changes: Partial<AnimationSequenceCase> = {}) => requests.push({
      ...template, mode, id: `${source.source.id}:sequence:${requests.length}`, name: 'éSequence', seed: requests.length + 1801,
      counts: [0, 0, 0], variant: 0, steps: 3, queryIndex: 0, reserve: 1, forced: 0, duration: 0.3, fadeDelay: -0.2, stepName: metadata?.name ?? 'MissingAnimation', ...changes,
      input: { ...template.input, speedMult: 1, weight: 0.4, field5c: 0xf1020304, ...input },
    });
    if (metadata) {
      for (const mode of [7, 8]) for (const variant of [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) add(mode, {}, { variant });
      for (const speedMult of [0.2, -1, 2.7]) add(8, { speedMult });
      add(8, {}, { steps: 1 });
    }
    if (source.pack.name === 'CharFishGroupAnim') {
      for (const name of ['SwimAround', 'Disturb']) for (const speedMult of [0.2, 0.5, 1, 2.7, -1]) for (const weight of [0, 0.4, 1]) {
        add(11, { speedMult, weight }, { name });
      }
      add(11, {}, { name: 'Disturb', variant: 6 });
      add(11, {}, { name: 'SwimAround', variant: 10 });
    }
    for (const kind of [0, 1, 2] as const) for (const forced of [0, 255]) for (const variant of [0, 1, 2, 3, 4]) add(10, { kind }, { forced, variant, counts: [4, 4, 4] });
    if (sourceIndex === 0) for (const kind of [0, 1, 2] as const) for (const reserve of [-1, 0, 1, 2, RESOURCE_ANIMATION_REQUEST_POOLS[kind].capacity - 1, RESOURCE_ANIMATION_REQUEST_POOLS[kind].capacity]) for (const variant of [0, 1, 2, 3, 4, 5, 6]) {
      const counts: [number, number, number] = [0, 0, 0]; counts[kind] = RESOURCE_ANIMATION_REQUEST_POOLS[kind].capacity;
      add(9, { kind }, { reserve, variant, counts });
    }
    return { ...source, requests };
  });
}
export function prepareAnimationSequence(pack: ResourceAnimationPack, list: ResourceAnimationList, c: AnimationSequenceCase) {
  const out = prepareAnimationRequest(pack, c), { b, base, m } = out;
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at);
  b.writeBigUInt64LE(c.variant === 3 && c.mode === 7 ? 0n : base + 0xa000n, 0x6018);
  b.fill(0, 0xa000, 0xa040); b.write(pack.name, 0xa000); word(0xa050, pack.sampleRate);
  word(0x5868, c.variant === 6 ? -1 : c.variant === 10 ? 0x7fffffff : 0x37);
  b.fill(0, 0xb000, 0x10000);
  word(0xe000, c.variant === 1 ? 2 : 1); ptr(0xe008, 0xe800); ptr(0xe010, 0xe900);
  const nameHash = BigInt('0x' + resourceAnimationNameHash(c.name)), packHash = BigInt('0x' + resourceAnimationNameHash(pack.name));
  for (const sequence of [0xe800, 0xe900]) {
    b.writeBigUInt64LE(c.variant === 2 ? 0n : nameHash, sequence + 8);
    b.writeBigUInt64LE(c.variant === 1 && sequence === 0xe800 ? packHash ^ 1n : c.variant === 0 ? packHash : 0n, sequence + 0x10);
    word(sequence + 0x18, c.steps); b.writeFloatLE(0.2, sequence + 0xa0); b[sequence + 0xa4] = c.variant === 9 ? 8 : 0;
    for (let i = 0; i < c.steps; i++) ptr(sequence + 0x20 + i * 8, 0xed00 + i * 0x40);
  }
  for (let i = 0; i < c.steps; i++) {
    const step = 0xed00 + i * 0x40, text = 0xd000 + i * 0x80;
    b.write(c.variant === 4 && i === 1 ? 'MissingSequenceStep' : c.stepName, text); ptr(step + 8, text);
    b.writeFloatLE(0.15 + i * 0.05, step); b.writeFloatLE(1 + i * 0.25, step + 0x18); b.writeFloatLE(0.6 + i * 0.2, step + 0x1c);
    b.writeFloatLE(i % 2 || c.variant === 8 ? 0.9 + i * 0.1 : 0, step + 0x20);
  }
  if (c.mode === 9 || c.mode === 10) for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < c.counts[pool.count / 4 - 2]; i++) {
    const p = pool.first + i * 0x70;
    b[p + 0x4f] = c.variant === 1 ? 0 : 1;
    b.writeFloatLE(c.variant === 2 ? 1.1 : c.variant === 3 ? 1.3 : c.variant === 5 ? -0.1 : 0.2 + (i % 4) * 0.2, p + 20);
    if (c.variant === 4) word(p + 20, 0x7fc12345);
    if (c.variant === 6 && i % 2) b[p + 0x4f] = 0;
    word(p + 12, c.variant === 1 ? -1 : 0); b[p + 0x62] = c.variant === 2 ? 1 : c.variant === 3 ? 2 : 0;
  }
  const memory = { ...m, string: (p: bigint) => { const at = Number(p - base); if (at < 0 || at >= b.length) throw new Error('Sequence string address invalid'); const end = b.indexOf(0, at); return b.subarray(at, end).toString('utf8'); } };
  let registry = base + 0xe000n;
  if (c.mode === 11) {
    const registryBase = 0x460000000n, storage = Buffer.alloc(1024 * 1024); let used = 0;
    const at = (p: bigint, n: number) => { const offset = Number(p - registryBase); if (offset < 0 || offset + n > storage.length) throw new Error('Unmapped sequence registry'); return offset; };
    const owner = {
      bytes: (p: bigint, n: number) => storage.subarray(at(p, n), at(p, n) + n),
      read32: (p: bigint) => storage.readUInt32LE(at(p, 4)), read64: (p: bigint) => storage.readBigUInt64LE(at(p, 8)),
      write8: (p: bigint, n: number) => { storage[at(p, 1)] = n & 255; },
      write32: (p: bigint, n: number) => { storage.writeUInt32LE(n >>> 0, at(p, 4)); },
      write64: (p: bigint, n: bigint) => { storage.writeBigUInt64LE(n, at(p, 8)); },
      string: (p: bigint) => { const offset = at(p, 1); return storage.subarray(offset, storage.indexOf(0, offset)).toString('utf8'); },
    };
    registry = loadOriginalAnimationSequenceRegistry(owner, (n, align) => { used = Math.ceil(used / align) * align; const p = registryBase + BigInt(used); used += n; at(p, n); return p; });
    const combined = {
      bytes: (p: bigint, n: number) => (p >= registryBase ? owner : memory).bytes(p, n),
      read32: (p: bigint) => (p >= registryBase ? owner : memory).read32(p), read64: (p: bigint) => (p >= registryBase ? owner : memory).read64(p),
      write8: (p: bigint, n: number) => (p >= registryBase ? owner : memory).write8(p, n),
      write32: (p: bigint, n: number) => (p >= registryBase ? owner : memory).write32(p, n),
      write64: (p: bigint, n: bigint) => (p >= registryBase ? owner : memory).write64(p, n),
      string: (p: bigint) => (p >= registryBase ? owner : memory).string(p),
    };
    return { ...out, m: combined, services: { ...out.services, registry, list, packs: [pack] } };
  }
  return { ...out, m: memory, services: { ...out.services, registry, list, packs: [pack] } };
}
export function animationSequenceInput(pack: ResourceAnimationPack, list: ResourceAnimationList, c: AnimationSequenceCase) {
  const input = animationRequestInput(pack, c), { b } = prepareAnimationSequence(pack, list, c);
  input.writeInt32LE(c.queryIndex, 4); input.writeInt32LE(c.reserve, 8); input.writeUInt32LE(c.forced, 20);
  input.writeUInt32LE(c.variant === 7 ? 1 : c.queryIndex, 56); input.writeFloatLE(c.duration, 80); input.writeFloatLE(c.fadeDelay, 76);
  b.copy(input, 152, 0, ANIMATION_CONTROLLER_BYTES); b.copy(input, 152 + ANIMATION_CONTROLLER_BYTES, 0x7000, 0x7000 + ANIMATION_MASK_BYTES);
  return Buffer.concat([input, b.subarray(0xb000, 0x10000)]);
}
export function animationSequenceExpected(pack: ResourceAnimationPack, list: ResourceAnimationList, c: AnimationSequenceCase) {
  const { b, base, m, services } = prepareAnimationSequence(pack, list, c); let line = 0, severity = 0, result = -1234567;
  try {
    if (c.mode === 7 || c.mode === 11) result = playOriginalAnimationSequence(m, base, c.name, c.input.weight, c.input.speedMult, c.input.field5c, services);
    if (c.mode === 8) playOriginalAnimationSequenceByIndex(m, base, c.variant === 7 ? 1 : c.queryIndex, c.input.weight, c.input.speedMult, c.input.field5c, services);
    if (c.mode === 9) makeOriginalAnimationSpace(m, base, c.input.kind, c.reserve);
    if (c.mode === 10) result = +fadeOriginalAnimationSequence(m, base, c.input.kind, c.forced, Math.fround(c.duration), Math.fround(c.fadeDelay), services);
  } catch (e) { if (!(e instanceof NativeObjectFoundationFailure)) throw e; line = e.line; severity = e.severity; }
  return Buffer.concat([u32(line), u32(severity), u32(result >>> 0), b.subarray(0, ANIMATION_CONTROLLER_BYTES), b.subarray(0x7000, 0x7000 + ANIMATION_MASK_BYTES), b.subarray(0xb000, 0x10000)]);
}
export function sequenceTestList(data: string) { const bytes = fs.readFileSync(path.join(data, 'Meshes/Bin/AnimationList.dat')); return { bytes, list: readResourceAnimationList(bytes) }; }
