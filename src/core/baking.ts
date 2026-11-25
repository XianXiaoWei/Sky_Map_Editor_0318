import type { ResourceMeshLOD } from './resources';

export interface BakeStream { id: string; name: string; guid: number; lod: number; uniform: boolean; count: number; light: Uint8Array; extra: Uint8Array; }
export interface BoundBake { vertexCount: number; sampleCount: number; uniform: boolean; sampleIndices: Uint32Array; packed: Uint8Array; channels: [Float32Array, Float32Array, Float32Array]; }
export type PackedBake = Omit<BoundBake, 'channels'>;

// Original LevelData loader 0x1003f4dfa..0x1003f4f60 compares the
// bake sample count with Mesh LOD +0x40, then expands each 12-byte
// sample using Mesh LOD +0x98 (u32 per render vertex). Uniform data
// uses sample 0. The following opaque byte block is not that map.
export function expandBakeLighting(mesh: ResourceMeshLOD, stream: BakeStream): PackedBake {
  const vertexCount = mesh.positions.length / 3;
  if (!Number.isInteger(vertexCount) || stream.count !== mesh.bakeVertexCount) throw new Error('烘焙采样数与模型 LOD 不匹配');
  if (stream.light.length !== (stream.uniform ? 12 : stream.count * 12)) throw new Error('烘焙照明流长度无效');
  if (vertexCount && !stream.uniform && (!mesh.bakeRemap || mesh.bakeRemap.length !== vertexCount)) throw new Error('模型缺少原版烘焙顶点映射');
  const packed = new Uint8Array(vertexCount * 12), sampleIndices = new Uint32Array(vertexCount);
  for (let i = 0; i < vertexCount; i++) {
    const sample = stream.uniform ? 0 : mesh.bakeRemap![i]; if (sample >= stream.count && !stream.uniform) throw new Error('烘焙顶点映射越界');
    sampleIndices[i] = sample; packed.set(stream.light.subarray(sample * 12, sample * 12 + 12), i * 12);
  }
  return { vertexCount, sampleCount: stream.uniform ? 1 : stream.count, uniform: stream.uniform, sampleIndices, packed };
}
export function bakeChannels(bake: PackedBake): BoundBake {
  const channels: BoundBake['channels'] = [new Float32Array(bake.vertexCount * 4), new Float32Array(bake.vertexCount * 4), new Float32Array(bake.vertexCount * 4)];
  for (let i = 0; i < bake.vertexCount; i++) for (let c = 0; c < 3; c++) for (let j = 0; j < 4; j++) channels[c][i * 4 + j] = bake.packed[i * 12 + c * 4 + j] / 255;
  return { ...bake, channels };
}
export function bindBake(mesh: ResourceMeshLOD, stream: BakeStream): BoundBake {
  return bakeChannels(expandBakeLighting(mesh, stream));
}

export interface DecodedLight { ambient: number[]; skyMix: number; sunVisibility: number; direction: number[]; directionAmount: number; pointLightScale: number; }
// Exact expressions from original Mesh49525.frag (lines 63..72), before
// multiplying by environment uniforms. This is a decoder, not a baker.
export function decodeLight(bytes: ArrayLike<number>): DecodedLight {
  if (bytes.length !== 12 || !Array.from(bytes).every(n => Number.isInteger(n) && n >= 0 && n <= 255)) throw new Error('照明记录需要 12 个 byte');
  const p = Array.from(bytes, n => n / 255);
  return { ambient: p.slice(0, 3).map(n => n * n / p[3]), skyMix: p[4], sunVisibility: p[5] * p[5], direction: p.slice(8, 11).map(n => n * 2.007874 - 1.007874), directionAmount: p[11], pointLightScale: p[7] * 2 ** (255 * p[6] - 128) };
}
