import fs from 'node:fs';
import path from 'node:path';
import { Reader, floats, lz4Encode, u32 } from '../src/core/binary';
import { readResourceAnimationPack, type ResourceAnimationPack, type ResourceAnimationClip } from '../src/core/resource-animation';

export interface AnimationResourceCase { id: string; bytes: Buffer; meshFile?: string; }
export function animationResourceCases(data: string): AnimationResourceCase[] {
  const dir = path.join(data, 'Meshes/Bin'), cases: AnimationResourceCase[] = [];
  for (const file of fs.readdirSync(dir).filter(f => f.endsWith('.mesh')).sort()) {
    const bytes = fs.readFileSync(path.join(dir, file));
    if (bytes.readUInt32LE(0) !== 28 || !bytes[72]) continue;
    if (bytes.readUInt32LE(74) !== 1) throw new Error(`Need original compressed mesh ${file}`);
    cases.push({ id: file, meshFile: path.join(dir, file), bytes: bytes.subarray(86 + bytes.readUInt32LE(78)) });
  }
  for (const version of [7, 8, 9]) for (const compressed of [false, true]) cases.push({ id: `prepared-v${version}-${compressed ? 'lz4' : 'raw'}-two-clips`, bytes: preparedAnimationPack(version, compressed) });
  return cases;
}
const name = (s: string) => { const bytes = Buffer.alloc(64); bytes.write(s); return bytes; };
const pose = () => floats([1, 2, 3, 0, 0, 0, 1, 1, 1, 1]);
/** Exercise static and dynamic channels, inclusive ranges and per-clip
 * offsets missing from the original single-clip creature resources. */
export function preparedAnimationPack(version: number, compressed: boolean): Buffer {
  const flags = Buffer.from([9, 18, 36]), clip = (start: number, end: number, index: number) => {
    const staticKeys = floats([10 + index, 20, 30, 0, 0, 0, 1, 2, 3, 4]);
    const frames = Array.from({ length: end - start + 1 }, (_, i) => floats([i + index, i + 1, i + 2, i * 0.1, i * 0.25, -i * 0.125, i % 2 ? -1 : 1, i + 1, i + 2, i + 3]));
    return Buffer.concat([u32(start), u32(end), u32(index), ...(version >= 9 ? [floats([-1, -2, -3, 4, 5, 6])] : []), flags, staticKeys, ...frames]);
  };
  const tracks = Buffer.concat([...[2, 7, 7, 7, 12].map(u32), pose(), pose(), pose(), clip(4, 5, 0), clip(10, 12, 1)]);
  const bones = Array.from({ length: 3 }, (_, i) => Buffer.concat([name(`bone${i}`), floats([1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]), u32(i)]));
  const block = lz4Encode(tracks);
  return Buffer.concat([u32(version), name('prepared-two-clips'), u32(3), u32(20), u32(30), Buffer.from([+compressed]), ...bones, pose(), pose(), pose(),
    ...(compressed ? [u32(block.length), ...(version >= 9 ? [u32(tracks.length)] : []), block] : [tracks])]);
}
export function clipNativeBytes(clip: ResourceAnimationClip): Buffer {
  const out = Buffer.alloc(128);
  const fields: [number, number][] = [[0, clip.startFrame], [4, clip.endFrame], [8, clip.field8],
    [0x30, clip.staticRotationOffset], [0x34, clip.staticScaleOffset], [0x38, clip.staticPositionOffset],
    [0x3c, clip.rotationOffset], [0x40, clip.scaleOffset], [0x44, clip.positionOffset],
    [0x48, clip.rotationIndex], [0x4c, clip.scaleIndex], [0x50, clip.positionIndex],
    [0x54, clip.staticRotationIndex], [0x58, clip.staticScaleIndex], [0x5c, clip.staticPositionIndex], [0x60, clip.flagOffset],
    [0x64, clip.scaleCount], [0x68, clip.rotationCount], [0x6c, clip.positionCount],
    [0x70, clip.staticScaleCount], [0x74, clip.staticRotationCount], [0x78, clip.staticPositionCount]];
  for (const [at, n] of fields) out.writeInt32LE(n, at);
  if (clip.bounds) { Buffer.from(clip.bounds.buffer, clip.bounds.byteOffset, 12).copy(out, 0x10); Buffer.from(clip.bounds.buffer, clip.bounds.byteOffset + 12, 12).copy(out, 0x20); }
  return out;
}
export function nativeAnimationExpected(bytes: Buffer, pack?: ResourceAnimationPack): Buffer {
  if (!pack) pack = readResourceAnimationPack(new Reader(bytes, 'animation oracle'));
  const t = pack.tracks, array = (value: ArrayBufferView | Buffer | null) => {
    const b = value ? Buffer.from(value.buffer, value.byteOffset, value.byteLength) : Buffer.alloc(0); return Buffer.concat([u32(b.length), b]);
  };
  // Native compressed Read borrows the block without advancing its parent
  // stream; the file decoder deliberately covers that block as well.
  const consumed = pack.frameCount && pack.compressed ? 81 + pack.bones.length * 172 + (pack.version >= 9 ? 8 : 4) : bytes.length;
  return Buffer.concat([u32(0), u32(0), u32(consumed), name(pack.name), u32(pack.bones.length), u32(pack.frameCount), u32(pack.sampleRate), u32(+pack.compressed), u32(0),
    ...pack.bones.flatMap(b => [name(b.name), u32(b.parentLink >>> 0)]),
    array(pack.frameCount ? Buffer.concat(pack.bones.map(b => Buffer.from(b.linkMatrix!.buffer))) : null), array(pack.defaultPose),
    array(t ? Buffer.concat(t.clips.map(clipNativeBytes)) : null), array(t?.referencePose ?? null), array(t?.scales ?? null), array(t?.rotations ?? null), array(t?.positions ?? null), array(t?.flags ?? null)]);
}
