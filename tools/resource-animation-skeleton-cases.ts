import { animationResourceCases } from './resource-animation-cases';
import { Reader } from '../src/core/binary';
import { readResourceAnimationPack, type ResourceAnimationPack, type ResourceBone } from '../src/core/resource-animation';
import { initializeOriginalResourceAnimationMasks, initializeOriginalResourceAnimationSkeleton } from '../src/core/resource-animation-skeleton';
import { sortOriginalAnimationBoneIndices } from '../src/core/resource-animation-bone-sort';
import { constructOriginalTransformNode, markOriginalTransformDirty, setOriginalTransformParent } from '../src/core/transform-node-runtime';
import { mirrorOriginalAnimationRotation } from '../src/core/resource-animation-mirror';
import { registerOriginalAnimationPack } from '../src/core/resource-animation-control';
export const ANIMATION_SKELETON_BASE = 0x490000000n;
export interface AnimationSkeletonCase { id: string; mode: number; human: number; prefix: string; variant: number; seed: number; boneCount: number; }
export function animationSkeletonCases(data: string) {
  const sources = animationResourceCases(data).map(source => ({ source, pack: readResourceAnimationPack(new Reader(source.bytes)) }));
  const rows = sources.map(({ source, pack }) => {
    const requests: AnimationSkeletonCase[] = [];
    const add = (mode: number, human: number, prefix: string, variant: number) => requests.push({ id: `${source.id}:skeleton:${requests.length}`, mode, human, prefix, variant, seed: requests.length + 1703, boneCount: pack.bones.length });
    for (const prefix of ['', 'rig:', 'rig_', 'X_']) {
      add(0, 0, prefix, 0); if (pack.defaultPose.length) {
        add(0, 1, prefix, 0); add(6, 0, prefix, 0); add(6, 1, prefix, 0);
      }
    }
    add(3, 0, '', 0);
    if (pack.defaultPose.length) for (const human of [0, 255]) for (const variant of [0, 1, 2, 3]) add(5, human, '', variant);
    return { source, pack, requests };
  });
  const source = { id: 'prepared-skeleton-boundaries', bytes: Buffer.from('prepared-skeleton-boundaries-v1') };
  const names = ['R_legRoot', 'L_legRoot', 'M_hip', 'L_foot', 'M_spine', 'L_knee', 'R_foot', 'R_knee'];
  const parents = [0, 0, 0, 6, 3, 2, 8, 1];
  const bones: ResourceBone[] = names.map((name, i) => ({ name, parentLink: parents[i], linkMatrix: null }));
  const pack: ResourceAnimationPack = { name: 'prepared', version: 9, bones, defaultPose: new Float32Array(bones.length * 12), frameCount: 1, sampleRate: 30, compressed: false, tracks: null };
  const requests: AnimationSkeletonCase[] = [];
  for (let variant = 0; variant < 7; variant++) for (const human of [0, 1]) requests.push({ id: `${source.id}:mask:${variant}:${human}`, mode: 1, human, prefix: '', variant, seed: 3000 + variant, boneCount: bones.length });
  for (let variant = 0; variant <= 21; variant++) requests.push({ id: `${source.id}:transform:${variant}`, mode: 2, human: 0, prefix: '', variant, seed: 4000 + variant, boneCount: bones.length });
  for (const boneCount of [0, 1, 2, 3, 4, 5, 6, 29, 30, 31, 32, 63, 128, 256]) for (const variant of [10, 11, 12, 13, 14, 15]) requests.push({ id: `${source.id}:sort:${boneCount}:${variant}`, mode: 3, human: 0, prefix: '', variant, seed: 5000 + variant, boneCount });
  for (const boneCount of [0, 1, 256, 257, 0xffffffff]) for (const human of [0, 1]) requests.push({ id: `${source.id}:limit:${boneCount}:${human}`, mode: 4, human, prefix: '', variant: 0, seed: 6000 + boneCount, boneCount });
  rows.push({ source, pack, requests }); return rows;
}
export function prepareAnimationSkeleton(pack: ResourceAnimationPack, c: AnimationSkeletonCase) {
  const b = Buffer.alloc(0x60000), base = ANIMATION_SKELETON_BASE; let seed = c.seed;
  for (let i = 0; i < b.length; i++) { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; b[i] = seed >>> 24; }
  const at = (p: bigint, n: number) => { const offset = Number(p - base); if (offset < 0 || offset + n > b.length) throw new Error('Unmapped animation skeleton'); return offset; };
  const m = { bytes: (p: bigint, n: number) => b.subarray(at(p, n), at(p, n) + n), read32: (p: bigint) => b.readUInt32LE(at(p, 4)), read64: (p: bigint) => b.readBigUInt64LE(at(p, 8)), write8: (p: bigint, n: number) => { b[at(p, 1)] = n & 255; }, write32: (p: bigint, n: number) => { b.writeUInt32LE(n >>> 0, at(p, 4)); }, write64: (p: bigint, n: bigint) => { b.writeBigUInt64LE(n, at(p, 8)); }, string: (p: bigint) => { const offset = at(p, 1), end = b.indexOf(0, offset); return b.subarray(offset, end).toString('utf8'); } };
  const ptr = (offset: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), offset), word = (offset: number, n: number) => b.writeUInt32LE(n >>> 0, offset);
  word(0x8a00, c.mode); word(0x8a04, c.boneCount); word(0x8a08, c.human); word(0x8a0c, c.variant);
  word(0x8a10, 2); word(0x8a14, 1); word(0x8a20, 0); word(0x8a24, 0);
  word(0x8c00, 0); b.fill(0, 0x8c10, 0x8e10);
  ptr(0, 0x9008); ptr(0x6020, 0x9100); ptr(0x6018, 0x9100); ptr(0x9160, 0xa000); ptr(0x9158, 0x11000);
  word(0x9154, c.boneCount); word(0x9148, pack.frameCount); word(0x5850, 0); b[0x5830] = c.human;
  if (c.mode === 6) word(0x6220, 0);
  word(0x5810, 0);
  const count = Math.min(256, c.boneCount), records = b.subarray(0xa000, 0xa000 + 257 * 0x44); records.fill(0);
  for (let i = 0; i < count; i++) {
    let name = (pack.bones[i]?.name ?? `bone${i.toString().padStart(3, '0')}`), parent = pack.bones[i]?.parentLink ?? 0;
    if (c.mode === 1) {
      if (c.variant === 1 && name === 'L_legRoot') name = 'L_legRootNext';
      if (c.variant === 2 && name === 'R_legRoot') name = 'R_legRootNext';
      if (c.variant === 3 && name === 'M_hip') name = 'M_hipNext';
      if (c.variant === 4) name = `A_${i}`;
      if (c.variant === 5) name = `Z_${i}`;
      if (c.variant === 6) parent = 0;
    }
    if (c.mode === 3 && c.variant >= 10) {
      const n = c.variant === 10 ? i : c.variant === 11 ? count - i : c.variant === 12 ? i % 2 : c.variant === 13 ? 0 : c.variant === 14 ? (Math.imul(i + c.seed, 717) % Math.max(1, count)) : Math.abs(i - Math.floor(count / 2));
      name = `name${n.toString().padStart(3, '0')}`; parent = 0;
    }
    if (c.mode === 4) parent = 0;
    const encoded = Buffer.from(c.prefix + name); if (encoded.length >= 64) throw new Error('Skeleton prepared name too long');
    encoded.copy(records, i * 0x44); records.writeInt32LE(parent, i * 0x44 + 0x40);
    b.writeUInt16LE(i, 0x5610 + i * 2);
  }
  Buffer.from(pack.defaultPose.buffer, pack.defaultPose.byteOffset, pack.defaultPose.byteLength).copy(b, 0x11000);
  if (c.mode === 5) {
    ptr(0x91e0, 0x14000); word(0x8a10, Math.min(c.variant, count - 1));
    for (let bone = 0; bone < count; bone++) {
      const record = 0x14000 + bone * 0x90;
      for (let q = 0; q < 4; q++) for (let lane = 0; lane < 4; lane++) {
        const n = c.variant === 2 ? (lane === 3 ? 1 : -0) : pack.defaultPose[(bone % pack.bones.length) * 12 + 4 + lane] + (q + 1) * (lane + 1) * 0.01;
        b.writeFloatLE(n, record + 0x40 + q * 16 + lane * 4);
      }
      b[record + 0x88] = c.variant & 1;
    }
    for (let lane = 0; lane < 4; lane++) b.writeFloatLE(pack.defaultPose[4 + lane], 0x1e010 + lane * 4);
  }
  if (c.mode === 1) sortOriginalAnimationBoneIndices(m, base, base + 0xa000n, count);
  if (c.mode === 2) {
    const node = (i: number) => base + 0x20000n + BigInt(i * 0xf0);
    for (let i = 0; i < 8; i++) constructOriginalTransformNode(m, node(i));
    setOriginalTransformParent(m, node(2), node(0)); setOriginalTransformParent(m, node(3), node(0));
    setOriginalTransformParent(m, node(4), node(2)); setOriginalTransformParent(m, node(5), node(4));
    for (let i = 0; i < 8; i++) m.write8(node(i) + 0xe0n, 0);
    if (c.variant === 0) word(0x8a10, 3);
    if (c.variant === 1) word(0x8a10, 2);
    if (c.variant === 2) word(0x8a14, -1);
    if (c.variant === 3) word(0x8a14, 0);
    if (c.variant === 4) word(0x8a14, 2);
    if (c.variant === 5) m.write64(node(3) + 0xd0n, 0n);
    if (c.variant === 6) m.write64(node(3) + 0xc0n, node(1));
    if (c.variant === 7) m.write64(node(0) + 0xd8n, node(2));
    if (c.variant === 8) { word(0x8a10, 3); m.write64(node(0) + 0xd8n, node(2)); }
    if (c.variant === 9) { word(0x8a10, 3); m.write64(node(2) + 0xc8n, 0n); }
    if (c.variant === 10) { word(0x8a10, 3); m.write64(node(2) + 0xc0n, node(1)); }
    if (c.variant === 11) { word(0x8a10, 6); m.write64(node(6) + 0xc8n, node(7)); }
    if (c.variant === 12) { word(0x8a10, 6); m.write64(node(6) + 0xd0n, node(7)); }
    if (c.variant === 13) { m.write64(node(1) + 0xd8n, node(7)); m.write64(node(7) + 0xc0n, node(0)); }
    if (c.variant === 14) m.write8(node(2) + 0xe0n, 1);
    if (c.variant === 15) m.write8(node(4) + 0xe0n, 1);
    if (c.variant === 16) { word(0x8a10, 6); word(0x8a14, -1); }
    if (c.variant === 17) { word(0x8a10, 3); word(0x8a14, 0); }
    if (c.variant === 18) { word(0x8a10, 0); word(0x8a14, -1); }
    if (c.variant === 19) { word(0x8a10, 6); word(0x8a14, 1); }
    if (c.variant === 20) b.fill(0xa7, 0x201e0, 0x202d0);
    if (c.variant === 21) word(0x8a10, 0);
  }
  return { b, base, m };
}
export function animationSkeletonInput(pack: ResourceAnimationPack, c: AnimationSkeletonCase) { return prepareAnimationSkeleton(pack, c).b; }
export function animationSkeletonExpected(pack: ResourceAnimationPack, c: AnimationSkeletonCase) {
  const { b, base, m } = prepareAnimationSkeleton(pack, c);
  const weights = { primary: new Float32Array(b.buffer, b.byteOffset + 0x8000, 256), secondary: new Float32Array(b.buffer, b.byteOffset + 0x8400, 256) };
  let used = 0x20000;
  const skeleton = {
    weights, allocate: (allocator: bigint, size: number, alignment: number) => {
      if (allocator !== base + 0x9008n || alignment !== 16) throw new Error('Skeleton allocation dependencies differ');
      used = (used + alignment - 1) & ~(alignment - 1); const out = used, at = b.readUInt32LE(0x8c00);
      [out, size, alignment, 0].forEach((n, i) => b.writeUInt32LE(n, 0x8c10 + (at + i) * 4)); b.writeUInt32LE(at + 4, 0x8c00);
      used += size + 16; return base + BigInt(out);
    },
  };
  try {
    if (c.mode === 0 || c.mode === 4) initializeOriginalResourceAnimationSkeleton(m, base, base + 0xa000n, c.boneCount, skeleton);
    else if (c.mode === 6) registerOriginalAnimationPack(m, base, base + 0x9100n, { skeleton, finalizePack: () => {} });
    else if (c.mode === 1) initializeOriginalResourceAnimationMasks(m, base, weights);
    else if (c.mode === 3) sortOriginalAnimationBoneIndices(m, base, base + 0xa000n, c.boneCount);
    else if (c.mode === 5) mirrorOriginalAnimationRotation(m, base + 0x1e000n, base + 0x9100n, base + 0x1e010n, b.readUInt32LE(0x8a10), c.human);
    else if (c.mode === 2) {
      const node = base + 0x20000n + BigInt(b.readUInt32LE(0x8a10) * 0xf0), parent = b.readInt32LE(0x8a14);
      if (c.variant === 20) constructOriginalTransformNode(m, node);
      else if (c.variant === 21) markOriginalTransformDirty(m, node);
      else setOriginalTransformParent(m, node, parent < 0 ? 0n : base + 0x20000n + BigInt(parent * 0xf0));
    }
  } catch (e) {
    if (!(e instanceof Error) || !('line' in e) || !('severity' in e)) throw e;
    b.writeUInt32LE(Number(e.line), 0x8a20); b.writeUInt32LE(Number(e.severity), 0x8a24);
  }
  return b;
}
