import type { ResourceAnimationPack, ResourceAnimationTracks, ResourceAnimationClip } from './resource-animation';

export interface ResourceAnimationSample {
  clipIndex: number;
  frames: [number, number, number, number];
  weights: Float32Array;
  scaleWeights: Float32Array;
  fixQuaternionSigns: boolean;
}
const f = Math.fround, add = (a: number, b: number) => f(a + b), mul = (a: number, b: number) => f(a * b);
const dot = (a: Float32Array, b: Float32Array) => add(add(mul(a[0], b[0]), mul(a[2], b[2])), add(mul(a[1], b[1]), mul(a[3], b[3])));

/** Animation sample-state constructor 0x1000e42d0. The original caller
 * supplies four absolute frames and the interpolation fraction; clip timing
 * and looping are intentionally not inferred from frameCount/sampleRate. */
export function resourceAnimationSample(pack: ResourceAnimationPack, frames: [number, number, number, number], fraction: number, clipIndex = 0, fixQuaternionSigns = false): ResourceAnimationSample {
  const clips = pack.tracks?.clips;
  if (!clips?.length) throw new Error('动画采样缺少原轨道');
  const selected = clips.length === 1 ? 0 : clipIndex;
  if (!Number.isInteger(selected) || selected < 0 || selected >= clips.length) throw new Error('动画片段索引越界');
  if (!Number.isFinite(fraction) || !Number.isFinite(f(fraction))) throw new Error('动画采样比例必须是有限 float32');
  const clip = clips[selected];
  if (frames.some(frame => !Number.isInteger(frame) || frame < clip.startFrame || frame > clip.endFrame)) throw new Error('动画采样帧超出片段');
  const t = f(fraction), c = Math.min(1, Math.max(0, t)), c3 = mul(c, mul(c, c));
  const smooth = mul(c3, add(mul(c, add(mul(c, 6), -15)), 10)), half = mul(t, 0.5), three = mul(t, 3);
  const weights = Float32Array.from([
    mul(half, add(mul(f(2 - t), t), -1)),
    add(mul(half, mul(add(three, -5), t)), 1),
    mul(half, add(mul(f(4 - three), t), 1)),
    mul(half, mul(add(t, -1), t))
  ]);
  return { clipIndex: selected, frames: frames.map(frame => frame - clip.startFrame) as ResourceAnimationSample['frames'], weights,
    scaleWeights: Float32Array.of(smooth, f(1 - smooth)), fixQuaternionSigns: !!fixQuaternionSigns && (frames[2] < frames[1] || frames[3] < frames[1]) };
}
function applyStatic(out: Float32Array, tracks: ResourceAnimationTracks, indices: number, count: number, offset: number, source: Float32Array, width: number, lane: number) {
  for (let i = 0; i < count; i++) out.set(source.subarray((offset + i) * width, (offset + i + 1) * width), tracks.flags[indices + i] * 12 + lane);
}
function normalize(q: Float32Array) {
  const length = f(Math.sqrt(dot(q, q)));
  if (length > f(0.00001)) for (let lane = 0; lane < 4; lane++) q[lane] = f(q[lane] / length);
  return q;
}
function sampleRotations(out: Float32Array, tracks: ResourceAnimationTracks, clip: ResourceAnimationClip, state: ResourceAnimationSample, signMask?: Uint8Array) {
  for (let i = 0; i < clip.rotationCount; i++) {
    const bone = tracks.flags[clip.rotationIndex + i], values = state.frames.map(frame => {
      const at = (clip.rotationOffset + frame * clip.rotationCount + i) * 4; return tracks.rotations.subarray(at, at + 4);
    });
    const q = new Float32Array(4);
    if (state.fixQuaternionSigns && signMask![bone >> 3] & (1 << (bone & 7))) {
      const sign2 = dot(values[1], values[2]) < 0 ? -1 : 1;
      for (let lane = 0; lane < 4; lane++) q[lane] = add(mul(values[1][lane], state.weights[1]), mul(mul(values[2][lane], state.weights[2]), sign2));
      const sign0 = dot(values[0], q) < 0 ? -1 : 1;
      for (let lane = 0; lane < 4; lane++) q[lane] = add(q[lane], mul(mul(values[0][lane], state.weights[0]), sign0));
      const sign3 = dot(values[3], q) < 0 ? -1 : 1;
      for (let lane = 0; lane < 4; lane++) q[lane] = add(q[lane], mul(mul(values[3][lane], state.weights[3]), sign3));
    } else {
      for (let lane = 0; lane < 4; lane++) q[lane] = add(add(add(mul(values[0][lane], state.weights[0]), mul(values[1][lane], state.weights[1])), mul(values[2][lane], state.weights[2])), mul(values[3][lane], state.weights[3]));
    }
    out.set(normalize(q), bone * 12 + 4);
  }
}
/** Non-retargeted AnimationPack sampler 0x1000e5020 via wrapper
 * 0x1000e6900. Original static channels, smoothed two-frame scales,
 * four-frame normalized quaternion/position interpolation and loop sign mask.
 * Retargeting requires AnimationList-owned maps and a different reference
 * pose. Pose padding is normalized to zero; XYZ and quaternion are data. */
export function sampleResourceAnimation(pack: ResourceAnimationPack, state: ResourceAnimationSample, signMask?: Uint8Array): Float32Array {
  const tracks = pack.tracks, clip = tracks?.clips[state.clipIndex];
  if (!tracks || !clip) throw new Error('动画采样缺少片段');
  if (state.frames.length !== 4 || state.frames.some(frame => !Number.isInteger(frame) || frame < 0 || frame > clip.endFrame - clip.startFrame) ||
      state.weights.length !== 4 || state.scaleWeights.length !== 2 || ![...state.weights, ...state.scaleWeights].every(Number.isFinite)) throw new Error('动画采样状态无效');
  if (state.fixQuaternionSigns && (!signMask || signMask.length < Math.ceil(pack.bones.length / 8))) throw new Error('动画循环四元数符号掩码缺失');
  const out = tracks.referencePose.slice();
  applyStatic(out, tracks, clip.staticScaleIndex, clip.staticScaleCount, clip.staticScaleOffset, tracks.scales, 3, 0);
  applyStatic(out, tracks, clip.staticRotationIndex, clip.staticRotationCount, clip.staticRotationOffset, tracks.rotations, 4, 4);
  applyStatic(out, tracks, clip.staticPositionIndex, clip.staticPositionCount, clip.staticPositionOffset, tracks.positions, 3, 8);
  for (let i = 0; i < clip.scaleCount; i++) {
    const bone = tracks.flags[clip.scaleIndex + i], a = (clip.scaleOffset + state.frames[1] * clip.scaleCount + i) * 3, b = (clip.scaleOffset + state.frames[2] * clip.scaleCount + i) * 3;
    for (let lane = 0; lane < 3; lane++) out[bone * 12 + lane] = add(mul(tracks.scales[a + lane], state.scaleWeights[1]), mul(tracks.scales[b + lane], state.scaleWeights[0]));
  }
  sampleRotations(out, tracks, clip, state, signMask);
  for (let i = 0; i < clip.positionCount; i++) {
    const bone = tracks.flags[clip.positionIndex + i], at = state.frames.map(frame => (clip.positionOffset + frame * clip.positionCount + i) * 3);
    for (let lane = 0; lane < 3; lane++) out[bone * 12 + lane + 8] = add(add(add(mul(tracks.positions[at[0] + lane], state.weights[0]), mul(tracks.positions[at[1] + lane], state.weights[1])), mul(tracks.positions[at[2] + lane], state.weights[2])), mul(tracks.positions[at[3] + lane], state.weights[3]));
  }
  return out;
}
