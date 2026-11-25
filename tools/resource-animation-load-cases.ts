import { u32 } from '../src/core/binary';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { unlinkOriginalResourceRef } from '../src/core/resource-ref-runtime';
import { loadOriginalResourceAnimation, loadOriginalResourceAnimationPack } from '../src/core/resource-animation-load';
import { animationFinalizeCases, animationFinalizeMetadata, prepareAnimationFinalize, type AnimationFinalizeCase } from './resource-animation-finalize-cases';
import type { ResourceAnimationPack } from '../src/core/resource-animation';

export interface AnimationLoadCase extends AnimationFinalizeCase { group: number; resources: number; missingObserved: number; }
export function animationLoadCases(data: string) {
  return animationFinalizeCases(data).filter(row => row.source.id !== 'prepared-mirror-boundaries').map(row => {
    const requests: AnimationLoadCase[] = [];
    const add = (group: number, resources: number, missingObserved = 0, metadata = 1, variant = -1) => requests.push({ id: `${row.source.id}:load:${requests.length}`, group, resources, missingObserved, metadata, variant, mode: 0, finalized: 0, human: 0, seed: 11001 + requests.length });
    for (const resources of [0, 1, 2, 3]) { add(0, resources); add(1, resources); }
    add(0, 1, 1); add(0, 2, 2); add(0, 3, 2);
    add(0, 1, 0, 7); add(0, 2, 0, 7); add(0, 3, 0, 7);
    for (const group of [2, 3, 4, 5, 6, 7]) add(group, 3);
    add(0, 1, 0, 1, 17); add(0, 2, 0, 1, 17); add(0, 3, 0, 1, 18); add(0, 3, 0, 1, 19);
    return { ...row, requests };
  });
}
export function prepareAnimationLoad(pack: ResourceAnimationPack, c: AnimationLoadCase) {
  const prepared = prepareAnimationFinalize(pack, c), { b, base } = prepared;
  const ptr = (at: number, to: number) => b.writeBigUInt64LE(base + BigInt(to), at), word = (at: number, n: number) => b.writeUInt32LE(n >>> 0, at);
  word(0x8a38, +(c.group !== 0)); word(0x8a3c, c.resources); word(0x8a40, c.missingObserved); word(0x8a44, 0);
  word(0x9600, 0); b.fill(0, 0x9700, 0x9f70);
  for (const resource of [0x1d000, 0x1e000]) {
    ptr(resource, 0x1f000); b.writeBigUInt64LE(0n, resource + 64); b.writeBigUInt64LE(0n, resource + 72); ptr(resource + 80, resource);
  }
  ptr(0x1d100, 0x9100); b.copy(b, 0x1e070, 0x9100, 0x91f0);
  if (c.variant === 18) word(0x1e0c4, pack.bones.length + 1);
  if (c.variant === 19) b.writeBigUInt64LE(0n, 0x1d100);
  for (const [offset, to] of [[0x30, 0x100], [0x38, 0x120], [0x40, 0x140]]) b.writeBigUInt64LE(0x4a0000000n + BigInt(to), 0x1f000 + offset);
  const name = (at: number, name: string) => { b.fill(0, at, at + 64); b.write(name, at); };
  name(0x1c800, c.group === 3 ? pack.name.toUpperCase() : pack.name);
  word(0x1c400, c.group === 2 ? 0 : c.group === 7 ? 2 : 1); ptr(0x1c408, 0x1c500); ptr(0x1c410, 0x1c580);
  ptr(0x1c500, 0x1c600); name(0x1c600, pack.name);
  word(0x1c508, c.group === 4 ? 0 : c.group === 5 || c.group === 6 ? 3 : 1);
  for (let i = 0; i < 3; i++) { ptr(0x1c510 + i * 8, 0x1c700 + i * 64); name(0x1c700 + i * 64, c.group === 6 && i !== 1 ? 'explicit-missing-resource' : pack.name); }
  ptr(0x1c580, 0x1c600); word(0x1c588, 3); for (let i = 0; i < 3; i++) ptr(0x1c590 + i * 8, 0x1c700 + i * 64);
  return prepared;
}
export function animationLoadInput(pack: ResourceAnimationPack, c: AnimationLoadCase, realList: Buffer) {
  const metadata = animationFinalizeMetadata(pack, c, realList);
  return Buffer.concat([u32(metadata.length), metadata, prepareAnimationLoad(pack, c).b]);
}
export function animationLoadExpected(pack: ResourceAnimationPack, c: AnimationLoadCase, realList: Buffer) {
  const { b, base, m } = prepareAnimationLoad(pack, c), bytes = animationFinalizeMetadata(pack, c, realList);
  const library = bytes.length ? readResourceAnimationList(bytes) : null;
  let used = 0x20000, refCount = 0;
  const log = (kind: number, a: number, other: number) => { const count = b.readUInt32LE(0x9600); [kind, a, other].forEach((n, i) => b.writeUInt32LE(n, 0x9700 + count * 12 + i * 4)); b.writeUInt32LE(count + 1, 0x9600); };
  const allocate = (tag: number) => (allocator: bigint, size: number, alignment: number) => {
    if (allocator !== base + 0x9008n || alignment !== 16 || size < 0) throw new Error('Load allocator differs');
    used = (used + alignment - 1) & ~(alignment - 1); const out = used, at = b.readUInt32LE(0x8c00);
    [out, size, alignment, tag].forEach((n, i) => b.writeUInt32LE(n, 0x8c10 + (at + i) * 4)); b.writeUInt32LE(at + 4, 0x8c00);
    used += size + 16; if (used > b.length) throw new Error('Load arena exhausted'); return base + BigInt(out);
  };
  const finalization = { allocate: allocate(1), getAnimationLibrary: () => { b.writeUInt32LE(b.readUInt32LE(0x8a34) + 1, 0x8a34); return library; } };
  const skeleton = { allocate: allocate(0), weights: { primary: new Float32Array(b.buffer, b.byteOffset + 0x8000, 256), secondary: new Float32Array(b.buffer, b.byteOffset + 0x8400, 256) } };
  const services = {
    temporaryRef: () => { const id = refCount++; log(1, id, 0); return base + 0x1c000n + BigInt(id * 32); },
    refs: { callback: (slot: 0x30 | 0x38 | 0x40, resource: bigint, ref: bigint) => {
      const offset = Number(resource - base), id = Number((ref - base - 0x1c000n) / 32n); log(3, offset, (slot << 16) | id);
      if (slot === 0x38 && c.missingObserved === (offset === 0x1d000 ? 1 : 2)) unlinkOriginalResourceRef(m, ref);
    } },
    meshType: () => base + 0x9020n, animationPackType: () => base + 0x9030n,
    lookup: (manager: bigint, type: bigint, name: bigint) => {
      if (manager !== base + 0x9040n) throw new Error('Load manager differs');
      log(2, Number(type - base), Number(name - base));
      if (m.string(name) === 'explicit-missing-resource') return 0n;
      const mesh = type === base + 0x9020n, flag = mesh ? 1 : 2; return c.resources & flag ? base + BigInt(mesh ? 0x1d000 : 0x1e000) : 0n;
    },
    registration: { skeleton, finalization },
  };
  try {
    if (c.group) b.writeUInt32LE(loadOriginalResourceAnimation(m, base, base + 0x9040n, base + 0x1c800n, base + 0x1c400n, services), 0x8a44);
    else loadOriginalResourceAnimationPack(m, base, base + 0x9040n, base + 0x1c800n, services);
  } catch (e) {
    if (!(e instanceof Error) || !('line' in e) || !('severity' in e)) throw e;
    b.writeUInt32LE(Number(e.line), 0x8a20); b.writeUInt32LE(Number(e.severity), 0x8a24);
  }
  return b;
}
