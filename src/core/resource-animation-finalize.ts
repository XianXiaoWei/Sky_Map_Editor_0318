import type { ModelBakeMemory } from './model-baked-runtime';
import { findResourceAnimationFile, type ResourceAnimationList } from './resource-animation-list';
import { mirrorOriginalAnimationRotation } from './resource-animation-mirror';
import { cloudCardInverse } from './cloud-card-inverse';
import { transformNativeObb } from './marker-transform-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b);
export interface ResourceAnimationMirrorMapServices {
  /** Original pack allocator, animation allocation tag and 16-byte alignment.
   * Padding in returned storage is retained, including unpaired reverse slots. */
  allocate(allocator: bigint, size: number, alignment: number): bigint;
}
export interface ResourceAnimationFinalizationServices extends ResourceAnimationMirrorMapServices {
  /** Loaded owner library. The original queries it twice before FindFile and
   * once per metadata entry; missing libraries leave finalization pending. */
  getAnimationLibrary(): ResourceAnimationList | null;
}
export class OriginalAnimationMirrorArithmeticBoundary extends Error {
  constructor(readonly operation: string) { super(`原动画镜像 ${operation} 超出已验证的有限算术范围`); }
}

/** Inline raw Matrix->Quaternion in BuildMirrorMap. Unlike Marker.SetTransform,
 * this neither normalizes axes nor normalizes the resulting quaternion. */
function rotation(matrix: Uint8Array) {
  const v = new DataView(matrix.buffer, matrix.byteOffset, 64), n = (i: number) => v.getFloat32(i * 4, true);
  const [a, b, c] = [0, 4, 8].map(i => [n(i), n(i + 1), n(i + 2)]);
  if (![...a, ...b, ...c].every(Number.isFinite)) throw new OriginalAnimationMirrorArithmeticBoundary('matrix quaternion input');
  const traceNegative = add(add(a[0], b[1]), c[2]) < 0;
  const greaterZx = c[2] > a[0], greaterZy = c[2] > b[1];
  const swapX = (b[1] > a[0] || greaterZx) && traceNegative;
  const swapY = (b[1] <= a[0] || greaterZy) && traceNegative;
  const swapZ = !(greaterZx && greaterZy) && traceNegative;
  const k = add(add(add(swapX ? -a[0] : a[0], swapY ? -b[1] : b[1]), swapZ ? -c[2] : c[2]), 1);
  const factor = mul(f(1 / f(Math.sqrt(k))), 0.5);
  const q3 = mul(factor, sub(b[2], swapX ? -c[1] : c[1]));
  let q4 = mul(factor, sub(c[0], swapY ? -a[2] : a[2]));
  let q5 = mul(factor, sub(a[1], swapZ ? -b[0] : b[0]));
  let q0 = mul(factor, k), q1: number, q2: number;
  if (swapZ) { q1 = q5; q5 = q4; q2 = q3; } else { q1 = q4; q2 = q0; }
  if (swapX) { q4 = q2; q2 = q5; } else q4 = q5;
  if (!swapZ) q0 = q3;
  const q = swapX ? [q1, q0, q4, q2] : [q0, q1, q4, q2];
  if (!q.every(Number.isFinite)) throw new OriginalAnimationMirrorArithmeticBoundary('matrix quaternion result');
  return q;
}
const reflectMatrix = () => {
  const b = new Uint8Array(64), v = new DataView(b.buffer);
  [-1, 1, 1, 1].forEach((n, i) => v.setFloat32(i * 20, n, true)); return b;
};

/** Complete finite/nonsingular BuildMirrorMap 0x1000e6a40. Last-underscore
 * suffix pairing preserves first match and asymmetric reverse-map overwrites. */
export function buildOriginalAnimationMirrorMap(m: ModelBakeMemory, pack: bigint, allocator: bigint, s: ResourceAnimationMirrorMapServices) {
  const allocationCount = m.read32(pack + 0x54n) | 0;
  const map = s.allocate(allocator, allocationCount * 0x90, 16); m.write64(pack + 0xe0n, map);
  const count = m.read32(pack + 0x54n) | 0;
  if (count <= 0) return;
  const bones = m.read64(pack + 0x60n), links = m.read64(pack + 0x68n);
  // Compare C-string bytes, including prefixes that are not valid UTF-8.
  const names = Array.from({ length: count }, (_, i) => {
    const raw = m.bytes(bones + BigInt(i * 0x44), 64), end = raw.indexOf(0);
    if (end < 0) throw new Error('原动画骨骼名称未终止');
    const name = raw.slice(0, end), underscore = name.lastIndexOf(95);
    return { name, underscore, side: underscore > 0 ? name[underscore - 1] : 0 };
  });
  const record = (i: number) => map + BigInt(i * 0x90);
  for (let i = 0; i < count; i++) {
    m.write32(record(i) + 0x80n, i);
    const source = names[i];
    if (source.side !== 76 && source.side !== 82) continue;
    const suffix = source.name.subarray(source.underscore);
    for (let j = 0; j < count; j++) {
      const target = names[j];
      if (i === j || target.side !== (source.side === 76 ? 82 : 76)) continue;
      const other = target.name.subarray(target.underscore);
      if (suffix.length === other.length && suffix.every((byte, k) => byte === other[k])) { m.write32(record(i) + 0x80n, j); break; }
    }
  }
  const matrix = (bone: number) => m.bytes(links + BigInt(bone * 64), 64);
  const writeRotation = (p: bigint, q: number[], conjugate: boolean) => q.forEach((n, i) => m.write32(p + BigInt(i * 4), bits(n) ^ (conjugate && i < 3 ? 0x80000000 : 0)));
  for (let i = 0; i < count; i++) {
    const p = record(i), mapped = m.read32(p + 0x80n) | 0;
    const parent = m.read32(bones + BigInt(i * 0x44 + 0x40)) | 0, mappedParent = m.read32(bones + BigInt(mapped * 0x44 + 0x40)) | 0;
    m.write32(record(mapped) + 0x84n, i);
    const both = parent > 0 && mappedParent > 0; m.write8(p + 0x88n, +both);
    if (both) {
      const source = matrix(parent - 1), target = matrix(mappedParent - 1);
      const v = new DataView(target.buffer, target.byteOffset, 64);
      let inverse: number[];
      try { inverse = cloudCardInverse(Array.from({ length: 16 }, (_, k) => v.getFloat32(k * 4, true))); }
      catch { throw new OriginalAnimationMirrorArithmeticBoundary('inverse'); }
      const inverseBytes = new Uint8Array(64), iv = new DataView(inverseBytes.buffer);
      inverse.forEach((n, k) => iv.setFloat32(k * 4, n, true));
      m.bytes(p, 64).set(transformNativeObb(transformNativeObb(source, reflectMatrix()), inverseBytes));
      writeRotation(p + 0x50n, rotation(target), true);
      writeRotation(p + 0x60n, rotation(source), false);
    } else m.bytes(p, 64).set(reflectMatrix());
    writeRotation(p + 0x40n, rotation(matrix(mapped)), false);
    writeRotation(p + 0x70n, rotation(matrix(i)), true);
  }
}

/** Original Finalize 0x1000e62a0. Uses actual loaded metadata; additive type
 * alone does not generate mirrors. Reference position uses XYZ plus matrix
 * translation (ignoring the input W), writing all four output lanes. */
export function finalizeOriginalAnimationPack(m: ModelBakeMemory, pack: bigint, s: ResourceAnimationFinalizationServices) {
  if (m.bytes(pack + 0xd8n, 1)[0] || !s.getAnimationLibrary()) return;
  const library = s.getAnimationLibrary(); if (!library) throw new Error('原动画库在 Finalize 中失效');
  const raw = m.bytes(pack, 64), end = raw.indexOf(0);
  if (end < 0) throw new Error('原动画包名称未终止');
  const file = findResourceAnimationFile(library, new TextDecoder().decode(raw.subarray(0, end)));
  if (!file) return;
  let mirrored = false, additive = false;
  for (let i = 0; i < file.metaDatas.length; i++) {
    const current = s.getAnimationLibrary(); if (!current) throw new Error('原动画库在元数据扫描中失效');
    const metadata = current.files.flatMap(f => f.metaDatas)[file.metaDataStart + i];
    if (!metadata) throw new Error('原动画元数据索引缺失');
    if (metadata.mirrored) mirrored = true;
    if ((metadata.animType | 0) === 2) additive = true;
  }
  if (mirrored) {
    buildOriginalAnimationMirrorMap(m, pack, m.read64(pack + 0xd0n), s);
    const count = m.read32(pack + 0x54n) | 0;
    const out = s.allocate(m.read64(pack + 0xd0n), count * 48, 16); m.write64(pack + 0x90n, out);
    for (let i = 0; i < (m.read32(pack + 0x54n) | 0); i++) {
      const record = m.read64(pack + 0xe0n) + BigInt(i * 0x90);
      const source = m.read64(pack + 0x88n) + BigInt(m.read32(record + 0x80n) * 48), pose = out + BigInt(i * 48);
      m.bytes(pose, 16).set(m.bytes(source, 16));
      mirrorOriginalAnimationRotation(m, pose + 16n, pack, source + 16n, i, +additive);
      const xyz = [0, 1, 2].map(k => value(m.read32(source + BigInt(32 + k * 4))));
      for (let lane = 0; lane < 4; lane++) {
        const n = (col: number) => value(m.read32(record + BigInt(col * 16 + lane * 4)));
        m.write32(pose + BigInt(32 + lane * 4), bits(add(add(add(mul(xyz[0], n(0)), mul(xyz[1], n(1))), mul(xyz[2], n(2))), n(3))));
      }
    }
  }
  m.write8(pack + 0xd8n, 1);
}
