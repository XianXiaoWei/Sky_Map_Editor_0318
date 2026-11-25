import fs from 'node:fs';
import { Reader, floats, u32 } from '../src/core/binary';
import { readResourceAnimationPack, type ResourceAnimationPack } from '../src/core/resource-animation';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { buildOriginalAnimationMirrorMap, finalizeOriginalAnimationPack } from '../src/core/resource-animation-finalize';
import { registerOriginalAnimationPack } from '../src/core/resource-animation-control';
import { animationResourceCases } from './resource-animation-cases';
import { prepareAnimationSkeleton } from './resource-animation-skeleton-cases';

export interface AnimationFinalizeCase {
  id: string; mode: number; metadata: number; finalized: number; human: number; variant: number; seed: number;
}
const nameBytes = (name: string) => { const b = Buffer.alloc(64); b.write(name); return b; };
/** Synthetic metadata isolates finalization branches; real-list cases use the
 * unchanged shipped AnimationList.dat, parsed by the original native reader. */
export function animationFinalizeMetadata(pack: ResourceAnimationPack, c: AnimationFinalizeCase, realList: Buffer) {
  if (c.metadata === 0) return Buffer.alloc(0);
  if (c.metadata === 1) return realList;
  const meta = (mirrored: number, kind: number, i: number) => Buffer.concat([nameBytes(`prepared-action-${i}`), ...[1, 1, kind].map(u32), floats([1]), Buffer.from([mirrored]), u32(0), floats([2]), Buffer.from([1, 1]), u32(0), u32(0)]);
  const actions = c.metadata === 2 || c.metadata === 3 ? [] : c.metadata === 4 ? [[0, 0]] : c.metadata === 5 ? [[0, 2]] : c.metadata === 6 ? [[1, 0]] : c.metadata === 7 ? [[1, 2]] : [[0, 2], [1, 0], [0, 0]];
  const fileName = c.metadata === 2 ? 'explicit-missing-pack' : c.metadata === 9 ? pack.name.toUpperCase() : pack.name;
  const file = (name: string, actions: number[][]) => Buffer.concat([nameBytes(name), u32(actions.length), ...actions.map(([mirrored, kind], i) => meta(mirrored, kind, i))]);
  // The leading file shifts metadata indices. Case 10 proves first duplicate
  // file wins even when a later duplicate contains a mirror action.
  return Buffer.concat([u32(3), u32(c.metadata === 10 ? 3 : 2), file('prepared-prefix-file', [[0, 1]]), file(fileName, actions), ...(c.metadata === 10 ? [file(fileName, [[1, 2]])] : [])]);
}
export function animationFinalizeCases(data: string) {
  const realList = fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`);
  const rows = animationResourceCases(data).map(source => ({ source, pack: readResourceAnimationPack(new Reader(source.bytes)) })).filter(({ pack }) => pack.tracks && pack.bones.every(b => b.linkMatrix));
  const result = rows.map(({ source, pack }) => {
    const requests: AnimationFinalizeCase[] = [];
    const add = (mode: number, metadata: number, finalized = 0, human = 0) => requests.push({ id: `${source.id}:finalize:${requests.length}`, mode, metadata, finalized, human, variant: -1, seed: 8101 + requests.length });
    add(0, 0); add(1, 1); add(1, 6); add(1, 7); add(2, 8); add(3, 1); add(4, 7);
    return { source, pack, requests, realList };
  });
  const names = ['L_pair', 'R_pair', 'prefixR_pair', 'prefixL_pair', '_pair', 'L_pair_extra', 'R_pair_extra', 'L_end', 'unpairedR_other', 'R', 'M_root', 'L_', 'R_', 'xL_multi_suffix', 'xR_multi_suffix'];
  const pack: ResourceAnimationPack = { name: 'prepared-mirror-pack', version: 9, frameCount: 1, sampleRate: 30, compressed: false,
    bones: names.map((name, i) => ({ name, parentLink: i < 2 ? 0 : i % 2 ? 1 : 2, linkMatrix: Float32Array.from([1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, i * 0.2, -i * 0.1, i * 0.3, 1]) })),
    defaultPose: new Float32Array(names.length * 12), tracks: null };
  for (let i = 0; i < names.length; i++) pack.defaultPose.set([1, 2, 3, -0, 0.1, -0.2, 0.3, 0.9, i, -i, 0.5, -7], i * 12);
  const requests: AnimationFinalizeCase[] = [];
  const add = (mode: number, metadata: number, variant: number, finalized = 0, human = 0) => requests.push({ id: `prepared-mirror-boundaries:${requests.length}`, mode, metadata, finalized, human, variant, seed: 9101 + requests.length });
  for (let variant = 0; variant < 18; variant++) { add(0, 0, variant); add(1, 6, variant); add(1, 7, variant); if (variant !== 4) add(4, 8, variant); }
  for (let metadata = 0; metadata <= 10; metadata++) for (const finalized of [0, 1, 255]) { add(2, metadata, 0, finalized); add(4, metadata, 0, finalized, 1); }
  result.push({ source: { id: 'prepared-mirror-boundaries', bytes: Buffer.from(JSON.stringify(pack)) }, pack, requests, realList });
  return result;
}
export function prepareAnimationFinalize(pack: ResourceAnimationPack, c: AnimationFinalizeCase) {
  const prepared = prepareAnimationSkeleton(pack, { id: c.id, mode: 0, human: c.human, prefix: '', variant: 0, seed: c.seed, boneCount: pack.bones.length });
  const { b, base } = prepared, count = c.variant === 17 ? 0 : pack.bones.length;
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at);
  b.fill(0, 0x9100, 0x9140); nameBytes(pack.name).copy(b, 0x9100);
  word(0x8a00, c.mode); word(0x8a30, +(c.metadata !== 0)); word(0x8a34, 0); word(0x9154, count);
  ptr(0x9168, 0x14000); ptr(0x9188, 0x18000); ptr(0x91d0, 0x9008); b[0x91d8] = c.finalized;
  word(0x6220, 0);
  for (let i = 0; i < pack.bones.length; i++) {
    const bone = pack.bones[i]; let parent = bone.parentLink;
    if (c.variant === 1) parent = 0;
    if (c.variant === 2) parent = i % 2 ? 0 : 1;
    if (c.variant === 3) parent = i % 2 ? 1 : 2;
    if (c.variant === 4) parent = -1;
    if (c.variant === 5) parent = 1;
    b.writeInt32LE(parent, 0xa000 + i * 0x44 + 0x40);
    if (c.variant === 6) { b.fill(0, 0xa000 + i * 0x44, 0xa000 + i * 0x44 + 64); nameBytes(i % 2 ? 'R_duplicate' : 'L_duplicate').copy(b, 0xa000 + i * 0x44); }
    if (c.variant === 16) b[0xa000 + i * 0x44] = 0xff;
    const matrix = Array.from(bone.linkMatrix ?? []);
    if (matrix.length !== 16) throw new Error('Map case requires original link matrices');
    if (c.variant >= 7 && c.variant <= 15) {
      const axes = c.variant === 7 ? [1, 1, 1] : c.variant === 8 ? [1, -1, -1] : c.variant === 9 ? [-1, 1, -1] : c.variant === 10 ? [-1, -1, 1] : c.variant === 11 ? [-0.2, -0.2, -0.2] : c.variant === 12 ? [-0.4, -0.4, -0.1] : c.variant === 13 ? [-0.4, -0.1, -0.4] : c.variant === 14 ? [-0.1, -0.4, -0.4] : [0.25, 1.5, 2.5];
      matrix.fill(0); axes.forEach((n, k) => matrix[k * 5] = n); matrix[15] = 1;
      if (c.variant === 15) { matrix[1] = 0.07; matrix[6] = -0.125; matrix[8] = 0.015; matrix[3] = 0.001; }
      matrix[12] = i * 0.125; matrix[13] = -i * 0.3; matrix[14] = 0.2;
    }
    matrix.forEach((n, k) => b.writeFloatLE(n, 0x14000 + i * 64 + k * 4));
  }
  const reference = pack.tracks?.referencePose ?? pack.defaultPose;
  Buffer.from(reference.buffer, reference.byteOffset, reference.byteLength).copy(b, 0x18000);
  return prepared;
}
export function animationFinalizeInput(pack: ResourceAnimationPack, c: AnimationFinalizeCase, realList: Buffer) {
  const metadata = animationFinalizeMetadata(pack, c, realList);
  return Buffer.concat([u32(metadata.length), metadata, prepareAnimationFinalize(pack, c).b]);
}
export function animationFinalizeExpected(pack: ResourceAnimationPack, c: AnimationFinalizeCase, realList: Buffer) {
  const { b, base, m } = prepareAnimationFinalize(pack, c), bytes = animationFinalizeMetadata(pack, c, realList);
  const library = bytes.length ? readResourceAnimationList(bytes) : null;
  let used = 0x20000;
  const allocate = (tag: number) => (allocator: bigint, size: number, alignment: number) => {
    if (allocator !== base + 0x9008n || alignment !== 16 || size < 0) throw new Error('Mirror allocator differs');
    used = (used + alignment - 1) & ~(alignment - 1); const out = used, at = b.readUInt32LE(0x8c00);
    [out, size, alignment, tag].forEach((n, i) => b.writeUInt32LE(n, 0x8c10 + (at + i) * 4)); b.writeUInt32LE(at + 4, 0x8c00);
    used += size + 16; if (used > b.length) throw new Error('Mirror arena exhausted'); return base + BigInt(out);
  };
  const finalization = { allocate: allocate(1), getAnimationLibrary: () => { b.writeUInt32LE(b.readUInt32LE(0x8a34) + 1, 0x8a34); return library; } };
  const skeleton = { allocate: allocate(0), weights: { primary: new Float32Array(b.buffer, b.byteOffset + 0x8000, 256), secondary: new Float32Array(b.buffer, b.byteOffset + 0x8400, 256) } };
  try {
    if (c.mode === 0) buildOriginalAnimationMirrorMap(m, base + 0x9100n, base + 0x9008n, finalization);
    else if (c.mode === 1 || c.mode === 2) { finalizeOriginalAnimationPack(m, base + 0x9100n, finalization); if (c.mode === 2) finalizeOriginalAnimationPack(m, base + 0x9100n, finalization); }
    else { registerOriginalAnimationPack(m, base, base + 0x9100n, { skeleton, finalization }); if (c.mode === 4) registerOriginalAnimationPack(m, base, base + 0x9100n, { skeleton, finalization }); }
  } catch (e) {
    if (!(e instanceof Error) || !('line' in e) || !('severity' in e)) throw e;
    b.writeUInt32LE(Number(e.line), 0x8a20); b.writeUInt32LE(Number(e.severity), 0x8a24);
  }
  return b;
}
