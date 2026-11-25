import { animationResourceCases } from './resource-animation-cases';
import { Reader } from '../src/core/binary';
import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { constructOriginalResourceAnimation, flushOriginalResourceAnimation } from '../src/core/resource-animation-lifecycle';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';
import { transformNativeObb } from '../src/core/marker-transform-runtime';
import { numericFloatBits as bits } from '../src/core/object-numeric-runtime';
export const ANIMATION_LIFECYCLE_BASE = 0x480000000n;
export interface AnimationLifecycleCase { id: string; seed: number; mode: number; clockOnly: number; variant: number; count: number; scene: number; audio: number; human: number; }
export function animationLifecycleCases(data: string) {
  return animationResourceCases(data).flatMap(source => {
    const pack = readResourceAnimationPack(new Reader(source.bytes)); if (!pack.frameCount || !pack.tracks?.clips.length) return [];
    const requests: AnimationLifecycleCase[] = [], add = (mode: number, clockOnly: number, variant: number, count: number, scene: number, audio = 0, human = 0) => requests.push({ id: `${source.id}:lifecycle:${requests.length}`, seed: requests.length + 761, mode, clockOnly, variant, count, scene, audio, human });
    for (const audio of [0, 1]) for (const human of [0, 1]) add(0, 0, 0, 0, 0, audio, human);
    for (const clockOnly of [0, 255]) for (const variant of [0, 1, 2, 3, 4, 5]) for (const count of [0, 1, 4]) add(1, clockOnly, variant, count, variant % 2);
    return [{ source, pack, requests }];
  });
}
export function prepareAnimationLifecycle(pack: ResourceAnimationPack, c: AnimationLifecycleCase) {
  const b = Buffer.alloc(0x20000), base = ANIMATION_LIFECYCLE_BASE; let seed = c.seed;
  for (let i = 0; i < b.length; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[i] = seed >>> 24; }
  const at = (p: bigint, n: number) => { const offset = Number(p - base); if (offset < 0 || offset + n > b.length) throw new Error('Unmapped animation lifecycle'); return offset; };
  const m = { bytes: (p: bigint, n: number) => b.subarray(at(p, n), at(p, n) + n), read32: (p: bigint) => b.readUInt32LE(at(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(at(p, 8)), write8: (p: bigint, n: number) => { b[at(p, 1)] = n & 255; }, write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, at(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, at(p, 8)); }, string: () => '' };
  const ptr = (offset: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), offset), word = (offset: number, n: number) => b.writeUInt32LE(n >>> 0, offset);
  word(0x8000, c.mode); word(0x8004, c.clockOnly); word(0x8008, bits(1 / 60)); word(0x800c, c.variant); word(0x8010, c.scene); word(0x8014, c.variant % 4); word(0x8018, c.audio); word(0x801c, 1); word(0x8020, c.human);
  word(0x8800, 0); b.fill(0, 0x9000, 0xa000);
  ptr(0x6018, 0xa000); ptr(0x5838, 0xb000); ptr(0x5840, 0x16000); word(0xa054, pack.bones.length); ptr(0xa068, 0x1b000);
  for (let i = 0; i < pack.bones.length; i++) Buffer.from(pack.bones[i].linkMatrix!.buffer, pack.bones[i].linkMatrix!.byteOffset, 64).copy(b, 0x1b000 + i * 64);
  for (let i = 0; i <= pack.bones.length; i++) {
    const angle = (i + 1) * 0.02, v = [Math.cos(angle), Math.sin(angle), 0, 0, -Math.sin(angle), Math.cos(angle), 0, 0, 0, 0, 1, 0, i * 0.1, -i * 0.2, i * 0.03, 1];
    v.forEach((n, lane) => b.writeFloatLE(n, 0x10000 + i * 64 + lane * 4));
  }
  word(0x5a10, c.variant === 1 ? 2 : 0); word(0x6000, c.variant === 2 ? 3 : 0);
  for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) {
    word(pool.count, c.count);
    for (let i = 0; i < c.count; i++) {
      const p = pool.first + i * 0x70;
      word(p + 4, c.variant === 1 && i === 0 ? -1 : 0); word(p + 8, c.variant === 2 && i === 0 ? -1 : 0);
      word(p + 20, [bits(0.02), bits(0.01), bits(0.009), 0x7fc12345][i % 4]);
      word(p + 0x54, [0, bits(-1), bits(0.2), 0x7fc12345][i % 4]);
      word(p + 0x34, c.variant === 3 && i === 0 ? -1 : i + 4);
      b[p + 0x60] = (i + c.variant) % 3 !== 1 ? 1 : 0;
    }
  }
  const log = (op: number, p: bigint, n = 0, extra = 0) => { const offset = b.readUInt32LE(0x8800); if (offset + 4 > 1024) throw new Error('Lifecycle trace overflow'); [op, Number(p - base), n, extra].forEach((v, i) => word(0x9000 + (offset + i) * 4, v)); word(0x8800, offset + 4); };
  return { b, base, m, log };
}
export function animationLifecycleInput(pack: ResourceAnimationPack, c: AnimationLifecycleCase) { return prepareAnimationLifecycle(pack, c).b; }
export function animationLifecycleExpected(pack: ResourceAnimationPack, c: AnimationLifecycleCase) {
  const { b, base, m, log } = prepareAnimationLifecycle(pack, c);
  if (c.mode === 0) constructOriginalResourceAnimation(m, base, c.audio ? base + 0xe000n : 0n, base + 0xe100n, base + 0xe200n, c.human ? base + 0xe300n : 0n, {
    constructSounds: (out, controller, audio, human) => log(2, out, Number(audio - base), Number(human - base)),
    constructEmitters: (out, controller, emitters) => log(3, out, Number(emitters - base), Number(controller - base)),
    soundVolumeBits: out => { log(4, out); return bits(0.375); },
  });
  else flushOriginalResourceAnimation(m, base, Math.fround(1 / 60), c.clockOnly, {
    worldMatrix: p => { log(1, p); return m.bytes(base + 0x10000n + (p - m.read64(base + 0x5838n)) / 0xf0n * 64n, 64); },
    multiplyMatrices: (left, right) => { const out = new Uint8Array(64); transformNativeObb(left, right, out); return out; },
    processRequest: (controller, p, secondary) => {
      log(5, p, +secondary);
      if (c.variant === 4) { m.write32(controller + 0x5860n, m.read32(controller + 0x5860n) + 1); m.write8(p + 0x60n, 0); }
      if (c.variant === 5) m.write32(controller + (secondary ? 12n : 8n), 1);
    },
    updateSounds: (p, delta) => log(6, p, bits(delta)), updateEmitters: (p, delta) => log(7, p, bits(delta)),
    scene: () => { log(8, base); return c.scene ? base + 0xf000n : 0n; },
    debugBonesEnabled: () => !!(c.variant % 4 & 1), debugBoundsEnabled: () => !!(c.variant % 4 & 2),
    drawBones: p => log(9, p), drawBounds: p => log(10, p),
  });
  return b;
}
