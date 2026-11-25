import { Reader, lz4Decode } from './binary';
import { readResourceAnimationPack, type ResourceAnimationPack } from './resource-animation';
export interface ResourceMeshLOD { positions: Float32Array; packedPositions?: Uint8Array; packedSkin?: Uint8Array; skinCounts?: [number, number, number, number]; normals: Float32Array; packedNormals?: Int8Array; packedUvs?: Uint8Array; uvs: Float32Array; colors: Float32Array; indices: Uint32Array; bakeVertexCount: number; bakeRemap?: Uint32Array; bounds?: number[]; secondaryBounds?: number[]; lodDistance?: number; }
export interface ResourceMesh extends ResourceMeshLOD { name: string; version: number; animated: boolean; animation?: ResourceAnimationPack; lods: number; levels: ResourceMeshLOD[]; }
export function readResourceMesh(data: Buffer): ResourceMesh {
  // Mesh.Load reads the AnimationPack from the original file stream,
  // after the compressed LOD block, rather than from the decoded LODs.
  const r = new Reader(data, 'Mesh resource'), version = r.u32(); if (version !== 28) throw new Error(`未经核实的资源 Mesh 版本 ${version}`);
  const rawName = r.take(64), name = rawName.subarray(0, Math.max(0, rawName.indexOf(0))).toString(), lods = r.count(32), animated = !!r.u8(), extra = r.u8(), compression = r.u32();
  if (compression > 1 || !lods) throw new Error('资源 Mesh 头部无效');
  let pr = r;
  if (compression) { const n = r.count(100000000), decodedSize = r.count(256000000); const raw = lz4Decode(r.take(n)); if (raw.length !== decodedSize) throw new Error('资源 Mesh 解压长度不匹配'); pr = new Reader(raw, 'Mesh LOD'); }
  const levels: ResourceMeshLOD[] = [];
  for (let lod = 0; lod < lods; lod++) {
    const lodDistance = pr.f32(); const bounds = [...pr.vec3(), ...pr.vec3()], secondaryBounds = [...pr.vec3(), ...pr.vec3()]; const vc = pr.count(1000000), ic = pr.count(10000000), counts = Array.from({ length: 5 }, () => pr.count(10000000));
    const skinCounts = Array.from({ length: 4 }, () => pr.count(1000000)) as [number, number, number, number];
    if (animated && skinCounts.reduce((a, b) => a + b, 0) !== vc) throw new Error('原蒙皮分组与顶点数量不符');
    if (ic % 3) throw new Error('资源三角形数量无效');
    const pos = pr.take(vc * 16), norm = pr.take(vc * 4), uv = pr.take(vc * 16), packedSkin = animated ? Uint8Array.from(pr.take(vc * 8)) : undefined;
    const indices = new Uint32Array(ic); for (let i = 0; i < ic; i++) { indices[i] = pr.u32(); if (indices[i] >= vc) throw new Error('资源网格索引越界'); }
    pr.take(ic * 4); if (counts[0]) pr.take(vc * 4);
    let bakeRemap: Uint32Array | undefined;
    if (counts[1]) { bakeRemap = new Uint32Array(vc); for (let i = 0; i < vc; i++) { const index = pr.u32(); if (index >= counts[1]) throw new Error('模型烘焙顶点映射越界'); bakeRemap[i] = index; } }
    pr.take(counts[2] * 4 + counts[3] * 4 + counts[4] * 8);
    {
      const positions = new Float32Array(vc * 3), normals = new Float32Array(vc * 3), uvs = new Float32Array(vc * 8), colors = new Float32Array(vc * 4);
      for (let i = 0; i < vc; i++) { for (let j = 0; j < 3; j++) { positions[i * 3 + j] = pos.readFloatLE(i * 16 + j * 4); normals[i * 3 + j] = Math.max(-1, norm.readInt8(i * 4 + j) / 127); if (!Number.isFinite(positions[i * 3 + j])) throw new Error('资源网格包含非有限坐标'); }
        for (let j = 0; j < 4; j++) colors[i * 4 + j] = pos[i * 16 + 12 + j] / 255;
        for (let j = 0; j < 8; j++) uvs[i * 8 + j] = halfFloat(uv.readUInt16LE(i * 16 + j * 2));
      }
      levels.push({ positions, packedPositions:Uint8Array.from(pos), packedSkin, skinCounts: animated ? skinCounts : undefined, normals, packedNormals:Int8Array.from(new Int8Array(norm.buffer,norm.byteOffset,norm.byteLength)), packedUvs:Uint8Array.from(uv), uvs, colors, indices, bakeVertexCount: counts[1], bakeRemap, bounds, secondaryBounds, lodDistance });
    }
  }
  if (extra) { const vc = pr.count(1000000), ic = pr.count(10000000); pr.take(vc * 12 + ic * 4); }
  if (compression && pr.p !== pr.data.length) throw new Error(`资源 LOD 未解释字节 ${pr.data.length - pr.p}`);
  const animation = animated ? readResourceAnimationPack(r) : undefined;
  if (animated && r.p !== r.data.length) throw new Error(`资源动画包未解释字节 ${r.data.length - r.p}`);
  return { name, version, animated, animation, lods, levels, ...levels[0] };
}
export function halfFloat(n: number) { const sign = n & 0x8000 ? -1 : 1, e = (n >> 10) & 31, m = n & 1023; return e === 0 ? sign * m * 2 ** -24 : e === 31 ? m ? NaN : sign * Infinity : sign * (1 + m / 1024) * 2 ** (e - 15); }
export const DIRECTORY_PURPOSES: Record<string, string> = {
  Levels: '关卡对象、烘焙几何与资源声明', Meshes: '模型顶点、索引、骨骼与动画资源', Images: 'PNG 纹理和颜色贴图', Shaders: 'GLSL 着色器源码与 Mac Metal 编译产物',
  Tex3D: 'VOLU 三维噪声纹理；云 shader 引用的采样资源', BlobPrefabs: '预制对象的 TGCL 数据', Audio: '音频、FMOD bank 与声音资源',
  Scripts: '脚本资源', Vars: '变量与默认配置', Resources: '资源声明', Fonts: '字体', Replays: '录制的回放数据'
};
