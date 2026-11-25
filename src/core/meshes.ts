import { Reader, applyPatches, floats, lz4Decode, lz4Encode, u32, type Patch } from './binary';
import type { BakeStream } from './baking';
import { decodeCloudVolume, type CloudVolume } from './cloud-volume';
import type {TerrainBinSource} from './terrain-bin-geometry';
export interface GeometryRecord { id: string; kind: 'terrain' | 'skirt' | 'occluder' | 'cloud'; name: string; vertexCount: number; indexCount: number; stride: number; vertexOffset: number; indices: Uint32Array; bounds?: number[]; linkedId?: number; recordOffset: number; recordEnd: number; metadata?: Record<string, unknown>; }
export interface BakeRecord { id: string; name: string; guid: number; uniform: boolean; submeshes: { count: number; indexBytes: number; lightOffset: number; lightLength: number; indexOffset: number }[]; }
export interface CloudRecord { offset: number; end: number; origin: number[]; dimensions: number[]; originOffset: number; sunOcclusionScale: number; materialScalarOffset: number; distanceResolution: number; ambienceResolution: number; sparseOffset: number; coordinatesOffset: number; activeBlocks: number; chunks: { name: string; offset: number; length: number }[]; proxy?: GeometryRecord; }
export class MeshesDocument {
  // Logical regions inside decompressed LOD0, not top-level TOC chunks.
  logicalSegments: {name:string;offset:number;length:number;records:number}[]=[];
  version: number; lod: Buffer; lodOffset: number; lodLength: number; geometries: GeometryRecord[] = []; bakes: BakeRecord[] = []; cloud?: CloudRecord;
  patches = new Map<string, Patch>(); additions: Buffer[] = []; skirtCountOffset = 0; skirtEnd = 0; skirtCount = 0; sections: { tag: string; offset: number; length: number }[] = [];
  constructor(public source: Buffer) {
    const r = new Reader(source, 'BstBaked.meshes');
    if (r.take(4).toString() !== 'LVL0') throw new Error('Meshes 不是 LVL0 格式'); this.version = r.u32();
    if (![51, 52].includes(this.version)) throw new Error(`当前针对 Sky 0.3.18 核实的 meshes 版本为 51/52，输入 ${this.version}`);
    const count = r.u8(); r.take(3); if (count > 10) throw new Error('LVL0 目录数量无效');
    if (source.length < 132) throw new Error('LVL0 目录头截断');
    for (let i = 0; i < count; i++) { const tag = r.take(4).toString('ascii'), offset = r.u32(), length = r.u32(); if (offset < 132 || offset + length > source.length) throw new Error('LVL0 段越界'); this.sections.push({ tag, offset, length }); }
    const tags = new Set<string>();
    for (const s of this.sections) {
      if (tags.has(s.tag)) throw new Error(`LVL0 段重复：${s.tag}`); tags.add(s.tag);
    }
    for (const s of this.sections) {
      for (const other of this.sections) if (s !== other && s.length && other.length && s.offset < other.offset + other.length && other.offset < s.offset + s.length) throw new Error('LVL0 段重叠');
      // Empty sections may mark a boundary, but cannot point inside data that
      // serialization would replace with a differently sized compressed block.
      if (!s.length && this.sections.some(other => other.offset < s.offset && s.offset < other.offset + other.length)) throw new Error('LVL0 空段位于其他段内部');
    }
    const s = this.sections.find(x => x.tag === 'LOD0'); if (!s) throw new Error('找不到 LOD0'); this.lodOffset = s.offset; this.lodLength = s.length; this.lod = lz4Decode(source.subarray(s.offset, s.offset + s.length)); this.parse();
  }
  private geometry(r: Reader, kind: GeometryRecord['kind'], id: string, stride: number, vc: number, ic: number, start: number): GeometryRecord {
    if (vc > 65536 || ic > 10000000 || ic % 3) throw new Error(`${kind}: 无效几何数量 ${vc}/${ic}`);
    const vertexOffset = r.p; r.take(vc * stride);
    return { id, kind, name: id, vertexCount: vc, indexCount: ic, stride, vertexOffset, indices: new Uint32Array(0), recordOffset: start, recordEnd: 0 };
  }
  private index(r: Reader, count: number, vc: number): Uint32Array { const ns = new Uint32Array(count); for (let i = 0; i < count; i++) { ns[i] = r.u16(); if (ns[i] >= vc) throw new Error('几何索引越界'); } return ns; }
  private parse() {
    const r = new Reader(this.lod, 'LOD0');
    const meshes = r.count(100000);
    for (let i = 0; i < meshes; i++) {
      const name = r.string(), guid = r.u32(), count = r.count(10000), uniform = r.u8(); if (uniform > 1) throw new Error('烘焙标记无效');
      const submeshes: BakeRecord['submeshes'] = [];
      for (let j = 0; j < count; j++) { const vc = r.count(), indexBytes = r.count(20000000), lightOffset = r.p, lightLength = uniform ? 12 : vc * 12; r.take(lightLength); const indexOffset = r.p; r.take(indexBytes); submeshes.push({ count: vc, indexBytes, lightOffset, lightLength, indexOffset }); }
      this.bakes.push({ id: `bake${i}`, name, guid, uniform: !!uniform, submeshes });
    }
    const terrainStart=r.p;
    this.logicalSegments.push({name:'Mesh.bin',offset:0,length:r.p,records:meshes});
    const terrain = r.count(100000);
    for (let i = 0; i < terrain; i++) {
      // Serializer::Bool writes one bit; the following byte-aligned read skips the remaining bits.
      const start = r.p, linkedId = r.u32(), flags = r.u8(), bounds = [...r.vec3(), ...r.vec3()], vc = r.count(65536), ic = r.count(10000000);
      const g = this.geometry(r, 'terrain', `terrain${i}`, 36, vc, ic, start); g.linkedId = linkedId; g.bounds = bounds;
      const collisionBytes = r.count(100000000); r.take(collisionBytes); const gridBounds = [...r.vec3(), ...r.vec3()], cellSize = r.f32(), dimensions = [r.u32(), r.u32(), r.u32()], np = r.count(1000000);
      const patchIndices: number[] = [], patchFlags: number[] = []; for (let j = 0; j < np; j++) { patchIndices.push(r.u32()); patchFlags.push(r.u32()); }
      const nec = r.count(1000000), ne = r.count(5000000), ni = r.count(10000000); const edges: [number, number][] = [];
      for (let j = 0; j < ne; j++) edges.push([r.u16(), r.u16()]); const refs = Array.from({ length: ni }, () => r.u16()), edgeCounts = Array.from({ length: nec }, () => r.u32());
      if (ne) {
        if (ni !== ic || nec !== np || patchIndices.reduce((a, b) => a + b, 0) !== ni) throw new Error('地形边表计数不一致');
        g.indices = new Uint32Array(ic); let ebase = 0, at = 0;
        for (let p = 0; p < np; p++) { for (let j = 0; j < patchIndices[p]; j++) { const enc = refs[at], e = edges[ebase + (enc >> 1)]; if (!e || e[enc & 1] >= vc) throw new Error('地形边引用无效'); g.indices[at++] = e[enc & 1]; } ebase += edgeCounts[p]; }
      } else g.indices = this.index(r, ic, vc);
      let patchStart = 0;
      const patches = patchIndices.map((count, p) => { const patch = { start: patchStart, count, raw: patchFlags[p], edgeCount: edgeCounts[p] ?? 0 }; patchStart += count; return patch; });
      g.metadata = { flags, collisionBytes, gridBounds, cellSize, dimensions, patchCount: np, patches, edgeCount: ne }; g.recordEnd = r.p; this.geometries.push(g);
    }
    const cloudStart = r.p, present = r.u32();
    this.logicalSegments.push({name:'Terrain.bin',offset:terrainStart,length:cloudStart-terrainStart,records:terrain});
    if (present) {
      const originOffset = r.p, origin = [r.i32(), r.i32(), r.i32()], dimensions = [r.i32(), r.i32(), r.i32()];
      if (dimensions.some(n => n < 0) || dimensions.reduce((a, b) => a * b, 1) > 100000000) throw new Error('云网格尺寸无效');
      const sparseOffset = r.p; r.take(dimensions.reduce((a, b) => a * b, 1)); const activeBlocks = r.count(10000000), coordinatesOffset = r.p; r.take(activeBlocks * 6);
      const sizes = [r.count(100000000), r.count(100000000), r.count(100000000)]; const chunks = sizes.map((length, i) => { const offset = r.p; r.take(length); return { name: ['Dist', 'Amb01', 'Amb2'][i], offset, length }; });
      const materialScalarOffset = r.p, sunOcclusionScale = r.f32(), distanceResolution = r.u32(), ambienceResolution = r.u32(), vc = r.count(65536), ic = r.count(10000000);
      const proxy = this.geometry(r, 'cloud', 'cloud-proxy', 16, vc, ic, cloudStart); proxy.indices = this.index(r, ic, vc);
      proxy.recordEnd = r.p; proxy.metadata = { distanceResolution, ambienceResolution }; this.cloud = { offset: cloudStart, end: r.p, origin, dimensions, originOffset, sunOcclusionScale, materialScalarOffset, distanceResolution, ambienceResolution, sparseOffset, coordinatesOffset, activeBlocks, chunks, proxy }; this.geometries.push(proxy);
    }
    this.logicalSegments.push({name:'Cloud.bin',offset:cloudStart,length:r.p-cloudStart,records:present?1:0});
    this.skirtCountOffset = r.p; this.skirtCount = r.count(100000);
    for (let i = 0; i < this.skirtCount; i++) { const start = r.p, vc = r.count(65536); const g = this.geometry(r, 'skirt', `skirt${i}`, 40, vc, 0, start); const ic = r.count(10000000); if (ic % 3) throw new Error('裙边三角形数量无效'); g.indexCount = ic; g.indices = this.index(r, ic, vc); g.recordEnd = r.p; this.geometries.push(g); }
    this.skirtEnd = r.p;
    this.logicalSegments.push({name:'Skirt.bin',offset:this.skirtCountOffset,length:r.p-this.skirtCountOffset,records:this.skirtCount});
    const occluderStart=r.p,no = r.count(100000);
    for (let i = 0; i < no; i++) { const start = r.p, vc = r.count(65536), ic = r.count(10000000); const g = this.geometry(r, 'occluder', `occluder${i}`, 16, vc, ic, start); g.indices = this.index(r, ic, vc); g.recordEnd = r.p; this.geometries.push(g); }
    if (r.p !== this.lod.length) throw new Error(`LOD0 未解析数据 ${this.lod.length - r.p} 字节 @${r.p}`);
    this.logicalSegments.push({name:'Occluder.bin',offset:occluderStart,length:r.p-occluderStart,records:no});
  }
  geometryView(g: GeometryRecord) {
    const positions = new Float32Array(g.vertexCount * 3), normals = new Float32Array(g.vertexCount * 3), packedNormals = new Int8Array(g.vertexCount * 4), materialIds = new Uint8Array(g.vertexCount * 4), weights = new Uint8Array(g.vertexCount * 4), light = new Uint8Array(g.vertexCount * 12), userData1 = new Uint8Array(g.kind === 'skirt' ? g.vertexCount * 4 : 0);
    const modified = this.patches.get(`geometry:${g.id}`)?.data ?? this.lod.subarray(g.vertexOffset, g.vertexOffset + g.vertexCount * g.stride);
    for (let i = 0; i < g.vertexCount; i++) { const p = i * g.stride; for (let j = 0; j < 3; j++) positions[i * 3 + j] = modified.readFloatLE(p + j * 4);
      for (let j = 0; j < 4; j++) packedNormals[i*4+j] = modified.readInt8(p+12+j); for (let j = 0; j < 3; j++) normals[i*3+j] = Math.max(-1, packedNormals[i*4+j]/127);
      if (g.stride >= 36) { materialIds.set(modified.subarray(p + 16, p + 20), i * 4); weights.set(modified.subarray(p + 20, p + 24), i * 4); light.set(modified.subarray(p + 24, p + 36), i * 12); }
      if (g.kind === 'skirt') userData1.set(modified.subarray(p+36,p+40),i*4);
    }
    // CloudBarn's native descriptor binds semantic 3 / format 24 at byte 12
    // (SNORM4), consumed by CloudCore. Visibility's original 0x10071ecd0
    // and 0x10071f8d2 read Occluder bytes 12..14 as signed normal components
    // for depth bias. Its CPU path consumes raw integers, not this diagnostic
    // normalized view. Byte 15 is preserved; its full semantics remain open.
    return { ...g, positions, normals, packedNormals, materialIds, weights, light, userData1 };
  }
  /** Original serialized bin partition/grid inputs for CPU creation parity.
   * The transform must be supplied by the object runtime, not guessed here.
   * Geometry edits are reflected by geometryView; collision/job rebuilding is
   * still required before using altered terrain in a complete game runtime.
   */
  terrainBinSource(g:GeometryRecord,transform:ArrayLike<number>):TerrainBinSource {
    if(g.kind!=='terrain'||!this.geometries.includes(g))throw new Error('Terrain geometry record required');
    const metadata=g.metadata!,bins=metadata.patches as {count:number;raw:number}[],gridBounds=metadata.gridBounds as number[],view=this.geometryView(g);
    return {vertexCount:g.vertexCount,indices:g.indices.slice(),positions:view.positions,materialIds:view.materialIds,weights:view.weights,bins:bins.map(b=>({count:b.count,raw:b.raw})),gridOrigin:gridBounds.slice(0,3),cellSize:Number(metadata.cellSize),transform:Float32Array.from(transform)};
  }
  editGeometry(id: string, positions?: ArrayLike<number>, ids?: ArrayLike<number>, weights?: ArrayLike<number>) {
    const g = this.geometries.find(x => x.id === id); if (!g) throw new Error('几何不存在');
    if (positions && g.kind === 'terrain') throw new Error('原版地形碰撞树/区块重建尚未逆向完成；地形只允许保存材质编辑');
    if (positions && g.kind === 'cloud') throw new Error('云代理位置变更需要同步距离场与碰撞；该编辑重建逻辑尚未完成');
    if ((ids || weights) && g.stride < 36) throw new Error('此几何没有材质字段');
    if (positions && positions.length !== g.vertexCount * 3 || ids && ids.length !== g.vertexCount * 4 || weights && weights.length !== g.vertexCount * 4) throw new Error('顶点字段数量错误');
    const b = Buffer.from(this.patches.get(`geometry:${id}`)?.data ?? this.lod.subarray(g.vertexOffset, g.vertexOffset + g.vertexCount * g.stride));
    for (let i = 0; i < g.vertexCount; i++) {
      if (positions) { for (let j = 0; j < 3; j++) { const n = Number(positions[i * 3 + j]); if (!Number.isFinite(n) || Math.abs(n) > 3.4e38) throw new Error('坐标必须是有限 float32'); b.writeFloatLE(n, i * g.stride + j * 4); } }
      for (const [values, offset] of [[ids, 16], [weights, 20]] as const) if (values) for (let j = 0; j < 4; j++) { const n = values[i * 4 + j]; if (!Number.isInteger(n) || n < 0 || n > 255) throw new Error('材质数据必须是 byte'); b[i * g.stride + offset + j] = n; }
    }
    if (positions && g.stride >= 36) recomputePackedNormals(b, g.indices, g.stride);
    this.patches.set(`geometry:${id}`, { offset: g.vertexOffset, length: b.length, data: b });
  }
  cloudVolume(): CloudVolume | undefined {
    const c = this.cloud; if (!c) return;
    const coordinates = new Int16Array(c.activeBlocks * 3);
    for (let i = 0; i < coordinates.length; i++) coordinates[i] = this.lod.readInt16LE(c.coordinatesOffset + i * 2);
    const origin = this.patches.get('cloud-origin')?.data;
    return decodeCloudVolume({ origin: origin ? [0, 4, 8].map(at => origin.readInt32LE(at)) : c.origin, dimensions: c.dimensions,
      activeBlocks: c.activeBlocks, distanceResolution: c.distanceResolution, ambienceResolution: c.ambienceResolution,
      sparse: this.lod.subarray(c.sparseOffset, c.sparseOffset + c.dimensions.reduce((a, b) => a * b, 1)), coordinates,
      compressed: c.chunks.map(s => this.lod.subarray(s.offset, s.offset + s.length)) });
  }
  editCloud(origin: number[], sunOcclusionScale: number) {
    if (!this.cloud) throw new Error('地图无云数据'); if (origin.length !== 3 || !origin.every(n => Number.isInteger(n) && n >= -2147483648 && n <= 2147483647)) throw new Error('云原点必须是 int32 XYZ');
    // The proxy uses world coordinates and is registered with CollisionGeoBarn.
    // Origin-only mutation would move the field while leaving that proxy behind.
    if (origin.some((n, i) => n !== this.cloud!.origin[i])) throw new Error('云原点变更需要同步代理几何与碰撞；该编辑重建逻辑尚未完成');
    if (!Number.isFinite(sunOcclusionScale) || sunOcclusionScale <= 0 || sunOcclusionScale > 3.4028234663852886e38) throw new Error('云太阳遮蔽系数必须是大于 0 的有限 float32');
    const b = Buffer.alloc(12); origin.forEach((n, i) => b.writeInt32LE(n, i * 4)); this.patches.set('cloud-origin', { offset: this.cloud.originOffset, length: 12, data: b });
    this.patches.set('cloud-material-scalar', { offset: this.cloud.materialScalarOffset, length: 4, data: floats([sunOcclusionScale]) });
  }
  editBake(id: string, sub: number, light: number[]) {
    const b = this.bakes.find(x => x.id === id)?.submeshes[sub]; if (!b || light.length !== 12 || !light.every(n => Number.isInteger(n) && n >= 0 && n <= 255)) throw new Error('烘焙记录需要 12 个原始 byte');
    const bytes = Buffer.alloc(b.lightLength); for (let i = 0; i < bytes.length; i++) bytes[i] = light[i % 12]; this.patches.set(`${id}/${sub}`, { offset: b.lightOffset, length: b.lightLength, data: bytes });
  }
  bakeData(id: string, lod: number): BakeStream {
    const bake = this.bakes.find(b => b.id === id), record = bake?.submeshes[lod]; if (!bake || !record || !Number.isInteger(lod)) throw new Error('烘焙 LOD 不存在');
    const light = this.patches.get(`${id}/${lod}`)?.data ?? this.lod.subarray(record.lightOffset, record.lightOffset + record.lightLength);
    return { id, lod, name: bake.name, guid: bake.guid, uniform: bake.uniform, count: record.count, light: Uint8Array.from(light), extra: Uint8Array.from(this.lod.subarray(record.indexOffset, record.indexOffset + record.indexBytes)) };
  }
  editBakeSample(id: string, lod: number, sample: number, light: number[]) {
    const stream = this.bakeData(id, lod), record = this.bakes.find(b => b.id === id)!.submeshes[lod];
    if (!Number.isInteger(sample) || sample < 0 || sample >= (stream.uniform ? 1 : stream.count)) throw new Error('烘焙采样索引越界');
    if (light.length !== 12 || !light.every(n => Number.isInteger(n) && n >= 0 && n <= 255)) throw new Error('照明记录需要 12 个 byte');
    const bytes = Buffer.from(stream.light); bytes.set(light, sample * 12); this.patches.set(`${id}/${lod}`, { offset: record.lightOffset, length: record.lightLength, data: bytes });
  }
  addSkirt(positions: number[], indices: number[], material = 0) {
    const vc = positions.length / 3; if (!Number.isInteger(vc) || !vc || vc > 65536 || indices.length % 3 || !indices.every(n => Number.isInteger(n) && n >= 0 && n < vc) || !Number.isInteger(material) || material < 0 || material > 255) throw new Error('新增几何无效');
    const vb = Buffer.alloc(vc * 40), ib = Buffer.alloc(indices.length * 2); const p = floats(positions);
    for (let i = 0; i < vc; i++) { p.copy(vb, i * 40, i * 12, i * 12 + 12); vb[i * 40 + 16] = material; vb[i * 40 + 20] = 255; }
    indices.forEach((n, i) => ib.writeUInt16LE(n, i * 2)); recomputePackedNormals(vb, indices, 40);
    this.additions.push(Buffer.concat([u32(vc), vb, u32(indices.length), ib]));
  }
  serialize(): Buffer {
    if (!this.patches.size && !this.additions.length) return Buffer.from(this.source);
    const ps = [...this.patches.values()]; if (this.additions.length) { ps.push({ offset: this.skirtCountOffset, length: 4, data: u32(this.skirtCount + this.additions.length) }, { offset: this.skirtEnd, length: 0, data: Buffer.concat(this.additions) }); }
    const raw = applyPatches(this.lod, ps), compressed = lz4Encode(raw);
    const out = applyPatches(this.source, [{ offset: this.lodOffset, length: this.lodLength, data: compressed }]);
    this.sections.forEach((s, i) => { if (s.tag === 'LOD0') out.writeUInt32LE(compressed.length, 20 + i * 12); else if (s.offset >= this.lodOffset + this.lodLength) out.writeUInt32LE(s.offset + compressed.length - this.lodLength, 16 + i * 12); });
    new MeshesDocument(out); return out;
  }
  view() { return { version: this.version, bytes: this.source.length, decompressedBytes: this.lod.length, sections: this.sections, bakes: this.bakes, cloud: this.cloud, geometries: this.geometries.map(g => this.geometryView(g)) }; }
}
export function recomputePackedNormals(vertices: Buffer, indices: ArrayLike<number>, stride: number) {
  const normals = new Float64Array(vertices.length / stride * 3);
  for (let t = 0; t < indices.length; t += 3) {
    const [a, b, c] = [indices[t], indices[t + 1], indices[t + 2]]; const v = (i: number, k: number) => vertices.readFloatLE(i * stride + k * 4);
    const ab = [0, 1, 2].map(k => v(b, k) - v(a, k)), ac = [0, 1, 2].map(k => v(c, k) - v(a, k)); const n = [ab[1] * ac[2] - ab[2] * ac[1], ab[2] * ac[0] - ab[0] * ac[2], ab[0] * ac[1] - ab[1] * ac[0]];
    for (const i of [a, b, c]) for (let j = 0; j < 3; j++) normals[i * 3 + j] += n[j];
  }
  for (let i = 0; i < normals.length / 3; i++) { const n = [normals[i * 3], normals[i * 3 + 1], normals[i * 3 + 2]], l = Math.hypot(...n) || 1; for (let j = 0; j < 3; j++) vertices.writeInt8(Math.round(n[j] / l * 127), i * stride + 12 + j); }
}
