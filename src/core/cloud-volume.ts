import { lz4Decode } from './binary';

export interface CloudVolumeSource {
  origin: number[];
  dimensions: number[];
  activeBlocks: number;
  distanceResolution: number;
  ambienceResolution: number;
  sparse: Uint8Array;
  coordinates: Int16Array;
  compressed: Buffer[];
}
export interface CloudTexture {
  name: 'CloudSparseGrid' | 'CloudPackedDistGrid' | 'CloudPackedAmb0Grid' | 'CloudPackedAmb1Grid' | 'CloudPackedAmb2Grid';
  dimensions: [number, number, number];
  channels: 1 | 4;
  data: Uint8Array;
}
export interface CloudVolume {
  origin: number[];
  dimensions: number[];
  distanceResolution: number;
  ambienceResolution: number;
  atlasBlocksPerRow: number;
  blockIndices: Int32Array;
  sparse: Uint8Array;
  coordinates: Int16Array;
  distance: Uint8Array;
  ambience01: Uint8Array;
  ambience2: Uint8Array;
  textures: CloudTexture[];
  bindings: { u_cloudBinMinWorld: number[]; u_cloudBinRangeWorld: number[]; u_cloudPackedBinDimInv: number; u_cloudVoxelScales: number[] };
}
const MAX_BYTES = 256 * 1024 * 1024;
function size(n: number, label: string) {
  if (!Number.isSafeInteger(n) || n < 0 || n > MAX_BYTES) throw new Error(`${label}: 云数据大小超限`);
  return n;
}
const gridIndex = (x: number, y: number, z: number, dimensions: number[]) => (z * dimensions[1] + y) * dimensions[0] + x;

// CloudBarn::Load, 0x1002129f0. Block coordinates are signed int16 XYZ;
// block-major voxels and the atlas both store X fastest. The added positive
// faces/edges/corner sample the adjacent active block, otherwise repeat the
// current block's last sample on each overflowing axis.
export function decodeCloudVolume(src: CloudVolumeSource): CloudVolume {
  const { dimensions, activeBlocks, distanceResolution: dr, ambienceResolution: ar } = src;
  if (src.origin.length !== 3 || !src.origin.every(Number.isInteger) || dimensions.length !== 3 || dimensions.some(n => !Number.isInteger(n) || n <= 0)) throw new Error('云网格尺寸或原点无效');
  const cells = size(dimensions.reduce((a, b) => a * b, 1), '稀疏网格');
  if (!Number.isInteger(activeBlocks) || activeBlocks <= 0 || activeBlocks > cells || src.coordinates.length !== activeBlocks * 3 || src.sparse.length !== cells) throw new Error('云稀疏表/块坐标数量错误');
  if (![dr, ar].every(n => Number.isInteger(n) && n > 0 && n <= 256) || src.compressed.length !== 3) throw new Error('云块分辨率或数据流无效');
  // Native ceil(sqrt(float32(activeBlocks))); byte atlas coordinates reserve 255
  // for missing blocks, so the highest usable coordinate is 254.
  const rows = Math.ceil(Math.fround(Math.sqrt(Math.fround(activeBlocks))));
  if (rows > 255) throw new Error('云纹理块坐标超过原版 byte 范围');
  const lengths = [size(activeBlocks * dr ** 3, '距离场'), size(activeBlocks * ar ** 3 * 8, '照明01'), size(activeBlocks * ar ** 3, '照明2')];
  const [distance, ambience01, ambience2] = src.compressed.map((b, i) => {
    const decoded = lz4Decode(b, lengths[i]);
    if (decoded.length !== lengths[i]) throw new Error(`云 ${['Dist', 'Amb01', 'Amb2'][i]} 解压长度错误：${decoded.length} / ${lengths[i]}`);
    return Uint8Array.from(decoded);
  });
  const blockIndices = new Int32Array(cells).fill(-1);
  const sparseData = new Uint8Array(size(cells * 4, '稀疏纹理')).fill(255);
  for (let i = 0; i < cells; i++) sparseData[i * 4 + 2] = src.sparse[i];
  for (let i = 0; i < activeBlocks; i++) {
    const [x, y, z] = src.coordinates.subarray(i * 3, i * 3 + 3);
    if ([x, y, z].some((n, axis) => n < 0 || n >= dimensions[axis])) throw new Error(`云块 ${i} 坐标越界`);
    const cell = gridIndex(x, y, z, dimensions);
    if (blockIndices[cell] !== -1) throw new Error(`云块 ${i} 坐标重复`);
    blockIndices[cell] = i;
    sparseData[cell * 4] = i % rows; sparseData[cell * 4 + 1] = Math.floor(i / rows);
  }
  const atlas = (resolution: number, streams: { name: CloudTexture['name']; channels: 1 | 4; source: Uint8Array; stride: number; offset: number }[]): CloudTexture[] => {
    const edge = resolution + 1, width = rows * edge;
    const voxels = size(width * width * edge, '云图集');
    const textures = streams.map(s => ({ name: s.name, dimensions: [width, width, edge] as [number, number, number], channels: s.channels, data: new Uint8Array(size(voxels * s.channels, s.name)) }));
    for (let b = 0; b < activeBlocks; b++) {
      const bx = src.coordinates[b * 3], by = src.coordinates[b * 3 + 1], bz = src.coordinates[b * 3 + 2];
      const ax = b % rows, ay = Math.floor(b / rows);
      for (let z = 0; z <= resolution; z++) for (let y = 0; y <= resolution; y++) for (let x = 0; x <= resolution; x++) {
        let sourceBlock = b, sx = x, sy = y, sz = z;
        if (x === resolution || y === resolution || z === resolution) {
          const nx = bx + (x === resolution ? 1 : 0), ny = by + (y === resolution ? 1 : 0), nz = bz + (z === resolution ? 1 : 0);
          const neighbor = nx < dimensions[0] && ny < dimensions[1] && nz < dimensions[2] ? blockIndices[gridIndex(nx, ny, nz, dimensions)] : -1;
          if (neighbor !== -1) { sourceBlock = neighbor; sx %= resolution; sy %= resolution; sz %= resolution; }
          else { sx = Math.min(x, resolution - 1); sy = Math.min(y, resolution - 1); sz = Math.min(z, resolution - 1); }
        }
        const sourceVoxel = ((sourceBlock * resolution + sz) * resolution + sy) * resolution + sx;
        const destVoxel = (z * width + ay * edge + y) * width + ax * edge + x;
        for (let c = 0; c < streams.length; c++) {
          const s = streams[c], data = textures[c].data;
          for (let k = 0; k < s.channels; k++) data[destVoxel * s.channels + k] = s.source[sourceVoxel * s.stride + s.offset + k];
        }
      }
    }
    // The original allocator leaves unused atlas slots unspecified. They are
    // unreachable through the sparse map. Zero those slots for deterministic
    // editor storage; this is not a fabricated lighting sample.
    return textures;
  };
  return { origin: [...src.origin], dimensions: [...dimensions], distanceResolution: dr, ambienceResolution: ar, atlasBlocksPerRow: rows,
    blockIndices, sparse: Uint8Array.from(src.sparse), coordinates: src.coordinates.slice(), distance, ambience01, ambience2,
    textures: [{ name: 'CloudSparseGrid', dimensions: [...dimensions] as [number, number, number], channels: 4, data: sparseData },
      ...atlas(dr, [{ name: 'CloudPackedDistGrid', channels: 1, source: distance, stride: 1, offset: 0 }]),
      ...atlas(ar, [{ name: 'CloudPackedAmb0Grid', channels: 4, source: ambience01, stride: 8, offset: 0 }, { name: 'CloudPackedAmb1Grid', channels: 4, source: ambience01, stride: 8, offset: 4 }, { name: 'CloudPackedAmb2Grid', channels: 1, source: ambience2, stride: 1, offset: 0 }])],
    bindings: { u_cloudBinMinWorld: src.origin.map(n => Math.fround(n * 16)), u_cloudBinRangeWorld: dimensions.map(n => Math.fround(n * 16)), u_cloudPackedBinDimInv: Math.fround(1 / rows), u_cloudVoxelScales: [Math.fround(16 / dr), Math.fround(16 / ar), Math.fround(1 / (dr + 1)), Math.fround(1 / (ar + 1))] } };
}

// CloudBarn::SampleDistance, 0x100213dd0, and coordinates 0x100216670.
// This is the original CPU collision field. Missing cells collapse to -6/4
// according to the sparse byte sign; the GPU retains that byte's full distance.
export type CloudDistanceField=Pick<CloudVolume,'origin'|'dimensions'|'distanceResolution'|'blockIndices'|'sparse'|'distance'>;
export function sampleCloudDistance(volume: CloudDistanceField, position: ArrayLike<number>): number {
  if (position.length !== 3 || !Array.from(position).every(n => Number.isFinite(n) && Math.abs(n) <= 3.4028234663852886e38)) throw new Error('云采样坐标必须是有限 float32 XYZ');
  const f = Math.fround, n = volume.distanceResolution, step = f(16 / n);
  const s = Array.from(position, (v, axis) => f(f(f(v) / step) - f(f(volume.origin[axis]) * n)));
  const fraction = s.map(v => f(f(v - Math.floor(v)) + .5) % 1);
  const block = s.map(v => Math.floor(f(v / n)));
  const int32 = (v: number) => v < -2147483648 || v >= 2147483648 ? -2147483648 : Math.trunc(v);
  // The original converts the block product via a zero-extended register.
  const local = s.map((v, axis) => int32(Math.floor(f(v - f((block[axis] * n) >>> 0))) - (fraction[axis] >= .5 ? 1 : 0)));
  const tap = (x: number, y: number, z: number) => {
    const coords = [local[0] + x, local[1] + y, local[2] + z];
    const neighbor = block.map((b, axis) => int32(f(f(b) + Math.floor(f(f(coords[axis]) / n)))));
    if (neighbor.some((b, axis) => b < 0 || b >= volume.dimensions[axis])) return 4;
    const cell = gridIndex(neighbor[0], neighbor[1], neighbor[2], volume.dimensions), ordinal = volume.blockIndices[cell];
    if (ordinal < 0) return f(f(volume.sparse[cell] / 255) * 110 - 10) < 0 ? -6 : 4;
    const xyz = coords.map(v => (v >>> 0) % n);
    return f(f(volume.distance[((ordinal * n + xyz[2]) * n + xyz[1]) * n + xyz[0]] / 255) * 10 - 6);
  };
  const lerp = (a: number, b: number, t: number) => f(f(f(1 - t) * a) + f(t * b));
  const plane = (z: number) => lerp(lerp(tap(0, 0, z), tap(1, 0, z), fraction[0]), lerp(tap(0, 1, z), tap(1, 1, z), fraction[0]), fraction[1]);
  return lerp(plane(0), plane(1), fraction[2]);
}
