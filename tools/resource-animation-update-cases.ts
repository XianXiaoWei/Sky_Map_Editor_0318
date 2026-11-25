import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { animationResourceCases } from './resource-animation-cases';
import { Reader, u32, floats } from '../src/core/binary';
import { prepareAnimationPrimary, ANIMATION_PRIMARY_BASE } from './resource-animation-primary-cases';
import { constructOriginalTransformNode, setOriginalTransformParent, markOriginalTransformDirty } from '../src/core/transform-node-runtime';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from '../src/core/resource-animation-request';
import { originalResourceAnimationUpdateServices, updateOriginalResourceAnimation } from '../src/core/resource-animation-update';
import { sampleOriginalResourceAnimationRequest } from '../src/core/resource-animation-request-sample';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
import fishInputs from '../tests/fixtures/fish-group-animation-update-inputs.json';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

export interface AnimationUpdateCase { id: string; seed: number; count: number; human: number; dynamic: number; body: number; variant: number; frames: number; scene?: typeof fishInputs.groups[number]; }
export function animationUpdateCases(data: string) {
  return animationResourceCases(data).flatMap(source => {
    const pack = readResourceAnimationPack(new Reader(source.bytes));
    if (!pack.frameCount || !pack.tracks?.clips.length) return [];
    const requests: AnimationUpdateCase[] = [];
    for (const count of [0, 1, 3]) for (const human of [0, 1]) for (const dynamic of [0, 1]) for (const body of [0, 0.37, 1.25]) {
      const seed = requests.length + 917;
      requests.push({ id: `${source.id}:update:${requests.length}`, seed, count, human, dynamic, body, variant: requests.length % 4, frames: count ? 6 : 2 });
    }
    return [{ source, pack, requests }];
  });
}

export function fishGroupAnimationUpdateCases(data: string) {
  const source = animationResourceCases(data).find(c => c.id === 'CharFishGroupAnim.mesh');
  if (!source) throw new Error('Missing original fish resource');
  const pack = readResourceAnimationPack(new Reader(source.bytes)), sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
  const requests: AnimationUpdateCase[] = fishInputs.groups.map((scene, i) => {
    if (sha(fs.readFileSync(path.join(data, 'Levels', scene.level, 'Objects.level.bin'))) !== scene.sourceSha256 || sha(fs.readFileSync(source.meshFile!)) !== scene.meshSha256 || pack.name !== scene.packName) throw new Error('Original fish input source changed');
    return { id: `${scene.level}:${scene.fishId}:shared-animation`, seed: 2011 + i, count: 0, human: 0, dynamic: 0, body: 0, variant: 256, frames: 60, scene };
  });
  return [{ source, pack, requests }];
}

export function prepareAnimationUpdate(pack: ResourceAnimationPack, c: AnimationUpdateCase) {
  const input = { id: c.id, seed: c.seed, count: c.count, delta: 1 / 60, clockOnly: 0, variant: c.variant === 2 ? 2 : 0 };
  const primary = prepareAnimationPrimary(pack, input, 0), b = Buffer.alloc(0x40000), base = ANIMATION_PRIMARY_BASE;
  primary.b.copy(b);
  for (const kind of [1, 2] as const) {
    const layer = prepareAnimationPrimary(pack, { ...input, variant: c.variant === 1 ? 1 : input.variant }, kind), pool = RESOURCE_ANIMATION_REQUEST_POOLS[kind];
    layer.b.copy(b, pool.first, pool.first, pool.first + pool.capacity * 0x70);
    b.writeUInt32LE(layer.b.readUInt32LE(pool.count), pool.count);
    layer.b.copy(b, 0x7000 + pool.index * 32, 0x7000 + pool.index * 32, 0x7000 + (pool.index + pool.capacity) * 32);
  }
  const at = (p: bigint, n: number) => { const offset = Number(p - base); if (offset < 0 || offset + n > b.length) throw new Error('Unmapped animation update'); return offset; };
  const m = {
    bytes: (p: bigint, n: number) => b.subarray(at(p, n), at(p, n) + n),
    read32: (p: bigint) => b.readUInt32LE(at(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(at(p, 8)),
    write8: (p: bigint, n: number) => { b[at(p, 1)] = n & 255; },
    write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, at(p, 4)); },
    write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, at(p, 8)); }, string: () => '',
  };
  b[0x5830] = c.human; b.writeFloatLE(c.body, 0x5834);
  b.writeBigUInt64LE(base + 0x22000n, 0x5840); b.writeBigUInt64LE(base + 0x27000n, 0xa068);
  b.writeUInt32LE(0, 0x5a10); b.writeUInt32LE(c.variant === 3 ? 1 : 0, 0x6000);
  for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) for (let i = 0; i < c.count; i++) {
    const p = pool.first + i * 0x70;
    b[p + 0x62] = (i + c.variant) % 2;
    // Valid effect indices exercise native flush gates; consumers retain
    // ownership and their mutations are part of the ordered native trace.
    b.writeInt32LE(i, p + 4); b.writeInt32LE(i + 1, p + 8);
    if (c.variant === 1 && i === 0) { b.writeInt32LE(-1, p + 12); b[p + 0x4f] = 1; }
  }
  // Raw absolute packs with negative scale are not finalized additive delta
  // packs. Keep their synthetic scalar-tail powf requests in its finite
  // domain; positive-scale packs still exercise fractional additive weights.
  const negativeScale = pack.tracks!.scales.some(n => n < 0) || pack.tracks!.referencePose.some((n, i) => i % 12 < 3 && n < 0);
  if (negativeScale) for (let i = 0; i < c.count; i++) {
    const p = 0x4998 + i * 0x70;
    b[p + 0x4f] = 0; b.writeFloatLE(c.variant === 2 ? 0 : 1, p + 0x14);
  }
  if (c.scene) {
    const counts = [0, 0, 0];
    for (const request of c.scene.requests) {
      const pool = RESOURCE_ANIMATION_REQUEST_POOLS[request.kind], index = counts[request.kind]++, p = pool.first + index * 0x70;
      Buffer.from(request.bytesHex, 'hex').copy(b, p);
      const mask = 0x7000 + (pool.index + index) * 32;
      b.writeBigUInt64LE(base + BigInt(mask), p + 0x68);
      Buffer.from(request.maskHex, 'hex').copy(b, mask);
    }
    counts.forEach((count, kind) => b.writeUInt32LE(count, RESOURCE_ANIMATION_REQUEST_POOLS[kind].count));
    b.writeUInt32LE(c.scene.sequenceCounter, 0x5864); b.writeUInt32LE(c.scene.playheadCounter, 0x5868);
  }
  for (let node = 0; node <= pack.bones.length; node++) constructOriginalTransformNode(m, base + 0xb000n + BigInt(node * 0xf0));
  for (let bone = 0; bone < pack.bones.length; bone++) setOriginalTransformParent(m, base + 0xb000n + BigInt((bone + 1) * 0xf0), base + 0xb000n + BigInt(pack.bones[bone].parentLink * 0xf0));
  b.writeFloatLE(0.3, 0xb000); b.writeFloatLE(-0.2, 0xb004); b.writeFloatLE(0.7, 0xb008);
  b.writeFloatLE(1.2, 0xb010); b.writeFloatLE(0.8, 0xb014); b.writeFloatLE(1.1, 0xb018);
  b.writeFloatLE(1.3, 0xb020); b.writeFloatLE(0.9, 0xb024); b.writeFloatLE(0.6, 0xb028);
  b.writeFloatLE(Math.sin(0.13), 0xb038); b.writeFloatLE(Math.cos(0.13), 0xb03c);
  markOriginalTransformDirty(m, base + 0xb000n);
  const paletteBytes = (pack.bones.length + 1) * 64;
  b.fill(0x6d, 0x22000, 0x22000 + paletteBytes);
  pack.bones.forEach((bone, i) => Buffer.from(bone.linkMatrix!.buffer, bone.linkMatrix!.byteOffset, 64).copy(b, 0x27000 + i * 64));
  const weights = { primary: new Float32Array(256), secondary: new Float32Array(256) };
  for (let i = 0; i < 256; i++) {
    weights.primary[i] = c.variant === 0 || c.scene ? 1 : 0.3 + (i % 7) * 0.1;
    weights.secondary[i] = i % 4 ? 1 : 0;
  }
  Buffer.from(weights.primary.buffer).copy(b, 0x31000); Buffer.from(weights.secondary.buffer).copy(b, 0x31400);
  const trace: number[] = [], rsqrtInputs: number[] = [];
  const log = (op: number, p: bigint, n = 0, extra = 0) => trace.push(op, Number(p - base) >>> 0, n >>> 0, extra >>> 0);
  const frameDelta = (frame: number) => Math.fround(c.scene ? (frame ? 0.1 : 0) : [0, 1 / 60, 0.267, 0.75, 1 / 60, 0.1][frame % 6]);
  const beforeFrame = (frame: number) => {
    if (frame === 3) { m.write32(base + 0xb000n, bits(-0.35)); markOriginalTransformDirty(m, base + 0xb000n); }
  };
  const output = () => Buffer.concat([u32(0), u32(0), b.subarray(0, 0x6300), b.subarray(0x7000, 0x8820), b.subarray(0xb000, 0xb000 + primary.nodeBytes), b.subarray(0x22000, 0x22000 + paletteBytes), u32(trace.length), ...trace.map(u32)]);
  return { b, base, m, weights, log, trace, rsqrtInputs, nodeBytes: primary.nodeBytes, paletteBytes, frameDelta, beforeFrame, output };
}

export function animationUpdateExpected(pack: ResourceAnimationPack, c: AnimationUpdateCase, powTrace?: Buffer) {
  const p = prepareAnimationUpdate(pack, c); let powAt = 0;
  const power = (a: number, exponent: number) => {
    if (!powTrace) return bits(Math.pow(value(a), value(exponent)));
    if (powAt + 12 > powTrace.length || powTrace.readUInt32LE(powAt) !== a || powTrace.readUInt32LE(powAt + 4) !== exponent) throw new Error(`${c.id}: powf inputs differ at ${powAt}`);
    const result = powTrace.readUInt32LE(powAt + 8); powAt += 12; return result;
  };
  const services = originalResourceAnimationUpdateServices(p.m, {
    weights: p.weights, dynamicBodyEnabled: () => !!c.dynamic,
    sample: (address, request) => sampleOriginalResourceAnimationRequest(p.m, address, pack, request),
    rsqrt: input => { p.rsqrtInputs.push(input); return bits(1 / Math.fround(Math.sqrt(value(input)))); }, pow: power, clock: { pow: power },
    processRequest: (controller, request, secondary) => {
      p.log(1, request, +secondary);
      if (c.variant === 3) { p.m.write8(request + 0x60n, 0); p.m.write32(controller + 0x5860n, p.m.read32(controller + 0x5860n) + 1); }
    },
    updateSounds: (sounds, delta) => p.log(2, sounds, bits(delta)), updateEmitters: (emitters, delta) => p.log(3, emitters, bits(delta)),
    scene: () => { p.log(4, p.base); return c.variant & 1 ? p.base + 0x33000n : 0n; },
    debugBonesEnabled: () => !!(c.variant & 1), debugBoundsEnabled: () => !!(c.variant & 2), drawBones: controller => p.log(5, controller), drawBounds: controller => p.log(6, controller),
  });
  const frames: Buffer[] = [];
  for (let frame = 0; frame < c.frames; frame++) {
    p.beforeFrame(frame); updateOriginalResourceAnimation(p.m, p.base, p.frameDelta(frame), services); frames.push(p.output());
  }
  if (powTrace && powAt !== powTrace.length) throw new Error('Unused native update powf calls');
  return { ...p, output: Buffer.concat(frames), frameOutputs: frames };
}

export function animationUpdateInput(pack: ResourceAnimationPack, c: AnimationUpdateCase, reciprocalInputs: number[]) {
  const p = prepareAnimationUpdate(pack, c);
  return Buffer.concat([u32(c.frames), u32(c.variant), u32(c.dynamic), p.b.subarray(0, 0x6300), p.b.subarray(0x7000, 0x8820), p.b.subarray(0xb000, 0xb000 + p.nodeBytes), p.b.subarray(0x22000, 0x22000 + p.paletteBytes), p.b.subarray(0x31000, 0x31800), u32(reciprocalInputs.length), ...reciprocalInputs.map(u32)]);
}
