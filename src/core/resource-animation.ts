import { Reader, lz4Decode } from './binary';

export interface ResourceBone { name: string; parentLink: number; linkMatrix: Float32Array | null; }
export interface ResourceAnimationClip {
  startFrame: number; endFrame: number; field8: number; bounds: Float32Array | null;
  staticScaleOffset: number; staticRotationOffset: number; staticPositionOffset: number;
  scaleOffset: number; rotationOffset: number; positionOffset: number;
  flagOffset: number;
  staticScaleIndex: number; staticRotationIndex: number; staticPositionIndex: number;
  scaleIndex: number; rotationIndex: number; positionIndex: number;
  staticScaleCount: number; staticRotationCount: number; staticPositionCount: number;
  scaleCount: number; rotationCount: number; positionCount: number;
}
export interface ResourceAnimationTracks {
  clips: ResourceAnimationClip[];
  // Animation pose -> Transform stores 0x100099595..0x1000995ae
  // establish scale/rotation/position order. Original 48-byte SIMD layout:
  // scale at 0, quaternion at 4,
  // position at 8; the unused fourth scale/position lanes stay zero.
  referencePose: Float32Array;
  scales: Float32Array; rotations: Float32Array; positions: Float32Array;
  flags: Uint8Array;
}
export interface ResourceAnimationPack {
  version: number; name: string; frameCount: number; sampleRate: number;
  compressed: boolean; bones: ResourceBone[];
  defaultPose: Float32Array; tracks: ResourceAnimationTracks | null;
}
const signedCount = (r: Reader, max: number) => {
  const n = r.i32(); if (n < 0 || n > max) throw new Error(`${r.label}: 数量超限 ${n}`); return n;
};
const fixedName = (r: Reader) => {
  const b = r.take(64), end = b.indexOf(0); return b.subarray(0, end < 0 ? 64 : end).toString('utf8');
};
function readFloats(r: Reader, n: number): Float32Array {
  const bytes = r.take(n * 4), out = new Float32Array(n);
  for (let i = 0; i < n; i++) {
    out[i] = bytes.readFloatLE(i * 4);
    if (!Number.isFinite(out[i])) throw new Error(`${r.label}: 非有限动画分量`);
  }
  return out;
}
function readPoses(r: Reader, count: number): Float32Array {
  const out = new Float32Array(count * 12);
  for (let i = 0; i < count; i++) {
    out.set(readFloats(r, 3), i * 12);
    out.set(readFloats(r, 4), i * 12 + 4);
    out.set(readFloats(r, 3), i * 12 + 8);
  }
  return out;
}

/** AnimationPack track reader 0x1000e4a20, clip reader 0x1000e4c40
 * and bone-index finalization 0x1000e46e0. Offsets count keys, not floats.
 * Clip names and playback policy belong to the external AnimationList. */
export function readResourceAnimationTracks(r: Reader, boneCount: number, version: number): ResourceAnimationTracks {
  if (!Number.isInteger(boneCount) || boneCount < 1 || boneCount > 256 || version < 7 || version > 9)
    throw new Error('动画轨道骨骼数量或版本无效');
  const clipCount = r.count(4096), scaleKeyCount = r.count(10000000), rotationKeyCount = r.count(10000000), positionKeyCount = r.count(10000000), extra = r.count(10000000);
  const flagCount = clipCount * boneCount + extra;
  // Validate the declared payload before allocating its decoded arrays.
  const minimumBytes = boneCount * 40 + clipCount * (12 + (version >= 9 ? 24 : 0) + boneCount) + scaleKeyCount * 12 + rotationKeyCount * 16 + positionKeyCount * 12;
  if (minimumBytes > r.data.length - r.p || flagCount > 256000000) throw new Error('动画轨道声明数量超过数据长度');
  const referencePose = readPoses(r, boneCount), scales = new Float32Array(scaleKeyCount * 3), rotations = new Float32Array(rotationKeyCount * 4), positions = new Float32Array(positionKeyCount * 3), flags = new Uint8Array(flagCount);
  const clips: ResourceAnimationClip[] = []; let scaleAt = 0, rotationAt = 0, positionAt = 0, f = 0;
  for (let i = 0; i < clipCount; i++) {
    const startFrame = signedCount(r, 10000000), endFrame = signedCount(r, 10000000), field8 = r.i32(), bounds = version >= 9 ? readFloats(r, 6) : null;
    if (endFrame < startFrame) throw new Error('动画帧区间倒置');
    const clipFlags = r.take(boneCount), flagOffset = f;
    if (f + boneCount > flags.length) throw new Error('动画骨骼标记越界');
    flags.set(clipFlags, f); f += boneCount;
    const ids = (bit: number) => Uint8Array.from(Array.from(clipFlags, (value, bone) => value & bit ? bone : -1).filter(bone => bone >= 0));
    const staticScales = ids(8), staticRotations = ids(16), staticPositions = ids(32), dynamicScales = ids(1), dynamicRotations = ids(2), dynamicPositions = ids(4);
    const readKeys = (output: Float32Array, offset: number, count: number, width: number) => {
      if (offset + count > output.length / width) throw new Error('动画关键帧数量越界');
      output.set(readFloats(r, count * width), offset * width);
    };
    const staticScaleOffset = scaleAt, staticRotationOffset = rotationAt, staticPositionOffset = positionAt;
    readKeys(scales, scaleAt, staticScales.length, 3); scaleAt += staticScales.length;
    readKeys(rotations, rotationAt, staticRotations.length, 4); rotationAt += staticRotations.length;
    readKeys(positions, positionAt, staticPositions.length, 3); positionAt += staticPositions.length;
    const scaleOffset = scaleAt, rotationOffset = rotationAt, positionOffset = positionAt;
    const frames = endFrame - startFrame + 1;
    if (scaleAt + dynamicScales.length * frames > scaleKeyCount || rotationAt + dynamicRotations.length * frames > rotationKeyCount || positionAt + dynamicPositions.length * frames > positionKeyCount) throw new Error('动画帧区间超过轨道容量');
    // The original stream interleaves channel blocks once per frame.
    for (let frame = 0; frame < frames && (dynamicScales.length || dynamicRotations.length || dynamicPositions.length); frame++) {
      readKeys(scales, scaleAt, dynamicScales.length, 3); scaleAt += dynamicScales.length;
      readKeys(rotations, rotationAt, dynamicRotations.length, 4); rotationAt += dynamicRotations.length;
      readKeys(positions, positionAt, dynamicPositions.length, 3); positionAt += dynamicPositions.length;
    }
    const append = (indices: Uint8Array) => {
      const at = f; if (f + indices.length > flags.length) throw new Error('动画骨骼索引数量越界');
      flags.set(indices, f); f += indices.length; return at;
    };
    const staticScaleIndex = append(staticScales), staticRotationIndex = append(staticRotations), staticPositionIndex = append(staticPositions), scaleIndex = append(dynamicScales), rotationIndex = append(dynamicRotations), positionIndex = append(dynamicPositions);
    clips.push({ startFrame, endFrame, field8, bounds, staticScaleOffset, staticRotationOffset, staticPositionOffset, scaleOffset, rotationOffset, positionOffset, flagOffset,
      staticScaleIndex, staticRotationIndex, staticPositionIndex, scaleIndex, rotationIndex, positionIndex,
      staticScaleCount: staticScales.length, staticRotationCount: staticRotations.length, staticPositionCount: staticPositions.length, scaleCount: dynamicScales.length, rotationCount: dynamicRotations.length, positionCount: dynamicPositions.length });
  }
  if (scaleAt !== scaleKeyCount || rotationAt !== rotationKeyCount || positionAt !== positionKeyCount || f !== flagCount) throw new Error('动画轨道计数未完整消费');
  return { clips, referencePose, scales, rotations, positions, flags };
}

/** Embedded Mesh AnimationPack.Read 0x1000e5db0. A stripped pack contains
 * only bone names/links: its poses and clips must come from an animpack.
 * This decodes saved resources; AnimationList finalization is separate. */
export function readResourceAnimationPack(r: Reader): ResourceAnimationPack {
  const version = r.u32(); if (version < 7 || version > 9) throw new Error(`未经核实的 AnimationPack 版本 ${version}`);
  const name = fixedName(r), boneCount = signedCount(r, 256), frameCount = signedCount(r, 10000000), sampleRate = signedCount(r, 1000000), compression = r.u8();
  if (compression > 1 || frameCount > 0 && sampleRate === 0) throw new Error('动画包头部无效');
  const bones: ResourceBone[] = [];
  for (let i = 0; i < boneCount; i++) {
    const name = fixedName(r); let linkMatrix: Float32Array | null = null;
    if (frameCount > 0) linkMatrix = readFloats(r, 16); else r.take(64);
    bones.push({ name, linkMatrix, parentLink: r.i32() });
  }
  let defaultPose: Float32Array = new Float32Array(0), tracks: ResourceAnimationTracks | null = null;
  if (frameCount > 0) {
    if (!boneCount) throw new Error('动画包缺少骨骼');
    defaultPose = readPoses(r, boneCount);
    if (compression) {
      const n = r.count(100000000), capacity = version >= 9 ? r.count(256000000) : 0x400000;
      if (!capacity) throw new Error('动画解压容量无效');
      const tr = new Reader(lz4Decode(r.take(n), capacity), 'AnimationPack tracks');
      tracks = readResourceAnimationTracks(tr, boneCount, version);
      if (tr.p !== tr.data.length) throw new Error(`动画轨道未解释字节 ${tr.data.length - tr.p}`);
    } else tracks = readResourceAnimationTracks(r, boneCount, version);
  }
  return { version, name, frameCount, sampleRate, compressed: !!compression, bones, defaultPose, tracks };
}
