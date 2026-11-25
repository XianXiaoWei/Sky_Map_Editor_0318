import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { MeshesDocument } from '../src/core/meshes';
import { decodeCloudVolume, sampleCloudDistance, type CloudVolumeSource } from '../src/core/cloud-volume';
import { lz4Encode, u32, floats, Reader } from '../src/core/binary';

const binary = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const sha = digest(fs.readFileSync(binary));
if (sha !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original Sky 0.3.18 executable');
const executable = '/root/sky-research/cloud-oracle';
const compile = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-no-pie', 'tools/native-cloud-oracle.c', '-lm', '-o', executable], { encoding: 'utf8' });
if (compile.status !== 0) throw new Error(compile.stderr);
function input(src: CloudVolumeSource, scalar = 1, vertices: Buffer = Buffer.alloc(0), indices: Buffer = Buffer.alloc(0)) {
  const header = Buffer.alloc(24); src.origin.forEach((n, i) => header.writeInt32LE(n, i * 4)); src.dimensions.forEach((n, i) => header.writeInt32LE(n, 12 + i * 4));
  const coords = Buffer.alloc(src.coordinates.length * 2); src.coordinates.forEach((n, i) => coords.writeInt16LE(n, i * 2));
  return Buffer.concat([header, u32(src.activeBlocks), ...src.compressed.map(b => u32(b.length)), floats([scalar]), u32(src.distanceResolution), u32(src.ambienceResolution), u32(vertices.length / 16), u32(indices.length / 2), Buffer.from(src.sparse), coords, ...src.compressed, vertices, indices]);
}
function points(src: CloudVolumeSource) {
  const positions: number[][] = [], step = 16 / src.distanceResolution;
  // Every block's center, positive boundary, face, diagonal corner and near-grid
  // outside probes. Original float coordinates are what the oracle receives.
  for (let i = 0; i < src.activeBlocks; i += Math.max(1, Math.floor(src.activeBlocks / 64))) {
    const base = src.origin.map((n, axis) => (n + src.coordinates[i * 3 + axis]) * 16);
    for (const offset of [[8, 8, 8], [16, 8, 8], [16, 16, 16], [step / 2, step / 2, step / 2], [16 - step / 4, 16 + step / 4, 8.375]]) positions.push(base.map((n, axis) => Math.fround(n + offset[axis])));
  }
  for (const factor of [-1, -.0001, 0, .5, 1, 1.0001]) positions.push(src.origin.map((n, axis) => Math.fround((n + src.dimensions[axis] * factor) * 16)));
  return positions;
}
function verify(name: string, src: CloudVolumeSource, scalar?: number, vb?: Buffer, ib?: Buffer) {
  // Exercise the original proxy format construction in the small fixtures too.
  vb ??= Buffer.alloc(48); ib ??= Buffer.from([0,0,1,0,2,0]);
  const volume = decodeCloudVolume(src), positions = points(src);
  const process = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', executable, binary], { input: Buffer.concat([input(src, scalar, vb, ib), u32(positions.length), ...positions.map(floats)]), maxBuffer: 100 * 1024 * 1024 });
  if (process.status !== 0) throw new Error(`${name}: native status ${process.status}, ${process.signal}, ${process.stderr.toString()}`);
  const r = new Reader(process.stdout, 'cloud native');
  if (r.u32() !== 5) throw new Error('Native texture count');
  const textures = volume.textures.map(t => {
    const dimensions = [r.u32(), r.u32(), r.u32()], format = r.u32(), kind = r.u32();
    if (JSON.stringify(dimensions) !== JSON.stringify(t.dimensions) || format !== (t.channels === 4 ? 6 : 2) || kind !== 1) throw new Error(`${name}/${t.name}: texture descriptor mismatch`);
    const bytes = r.take(t.data.length);
    if (!bytes.equals(Buffer.from(t.data))) {
      const index = bytes.findIndex((b, i) => b !== t.data[i]); throw new Error(`${name}/${t.name}: byte ${index} original ${bytes[index]}, editor ${t.data[index]}`);
    }
    return { name: t.name, dimensions, format, bytes: bytes.length, sha256: digest(bytes) };
  });
  const vertexCount = r.u32(), stride = r.u32(), attributeCount = r.u32();
  const attributes = Array.from({ length: attributeCount }, () => ({ semantic: r.u32(), format: r.u32(), offset: r.u32(), buffer: r.u32() }));
  if (vertexCount !== (vb?.length ?? 0) / 16 || stride !== 16 || JSON.stringify(attributes) !== JSON.stringify([{ semantic: 1, format: 3, offset: 0, buffer: 0 }, { semantic: 3, format: 24, offset: 12, buffer: 0 }])) throw new Error(`${name}: cloud proxy native vertex format mismatch`);
  if (r.u32() !== positions.length) throw new Error('Native point count');
  const distances = positions.map(p => ({ position: p, native: r.f32(), editor: sampleCloudDistance(volume, p) }));
  const difference = distances.find(p => Object.is(p.native, p.editor) === false);
  if (difference) throw new Error(`${name}: distance differs ${JSON.stringify(difference)}`);
  if (r.p !== r.data.length) throw new Error('Native trailing bytes');
  console.log(`${name}: 5 textures byte-identical; ${positions.length} CPU distance samples exact`);
  return { name, blocks: src.activeBlocks, distanceResolution: src.distanceResolution, ambienceResolution: src.ambienceResolution, textures, proxyFormat: { vertexCount, stride, attributes }, distanceSamples: distances.length, ...(name.startsWith('fixture') ? { source: { ...src, sparse: [...src.sparse], coordinates: [...src.coordinates], compressed: src.compressed.map(b => b.toString('base64')) }, distances } : {}) };
}
const fixtures = [];
for (const [i, coordinates] of [[[0, 0, 0]], [[0, 0, 0], [1, 0, 0]], [[0, 0, 0], [1, 1, 0], [0, 1, 1]], [[0, 0, 0], [1, 0, 0], [0, 1, 0], [0, 0, 1], [1, 1, 1]]].entries()) {
  const blocks = coordinates.length, dr = i % 2 ? 8 : 4, ar = dr / 2;
  fixtures.push(verify(`fixture${i}`, { origin: [-2, 1, -3], dimensions: [2, 2, 2], activeBlocks: blocks, distanceResolution: dr, ambienceResolution: ar, sparse: Uint8Array.from([0, 255, 23, 24, 128, 12, 254, 255]), coordinates: Int16Array.from(coordinates.flat()), compressed: [lz4Encode(Buffer.from(Array.from({ length: blocks * dr ** 3 }, (_, j) => (j * 13 + 71) % 256))), lz4Encode(Buffer.from(Array.from({ length: blocks * ar ** 3 * 8 }, (_, j) => (j * 29 + 17) % 256))), lz4Encode(Buffer.from(Array.from({ length: blocks * ar ** 3 }, (_, j) => (j * 37 + 97) % 256)))] }));
}
const levels = [], root = path.join(path.dirname(binary), '../Data/Levels');
for (const name of fs.readdirSync(root).sort()) {
  const file = path.join(root, name, 'BstBaked.meshes'); if (!fs.existsSync(file)) continue;
  const d = new MeshesDocument(fs.readFileSync(file)), c = d.cloud; if (!c) continue;
  const coordinates = new Int16Array(c.activeBlocks * 3); for (let i = 0; i < coordinates.length; i++) coordinates[i] = d.lod.readInt16LE(c.coordinatesOffset + i * 2);
  const proxy = c.proxy!;
  levels.push(verify(name, { origin: c.origin, dimensions: c.dimensions, activeBlocks: c.activeBlocks, distanceResolution: c.distanceResolution, ambienceResolution: c.ambienceResolution, sparse: d.lod.subarray(c.sparseOffset, c.sparseOffset + c.dimensions.reduce((a, b) => a * b, 1)), coordinates, compressed: c.chunks.map(s => d.lod.subarray(s.offset, s.offset + s.length)) }, c.sunOcclusionScale, d.lod.subarray(proxy.vertexOffset, proxy.vertexOffset + proxy.vertexCount * 16), Buffer.from(new Uint16Array(proxy.indices).buffer)));
}
fs.writeFileSync('tests/fixtures/cloud-native.json', JSON.stringify({ executableSha256: sha, fixtures }, null, 2) + '\n');
fs.writeFileSync('docs/cloud-oracle.json', JSON.stringify({ executableSha256: sha, scope: 'Original CloudBarn load, raw LZ4 decoder, sparse mapping, positive border packing, five texture descriptors and upload bytes, original CPU distance interpolation, original Vertex name/count/attribute/stride construction. Mock resource/texture/collision/upload objects, uniform registration and zeroed allocator. No original GPU or wind/noise/interaction execution. Unused atlas slots are undefined in-game; zero in both editor and this oracle.', levels, fixtures: fixtures.map(({ source, distances, ...row }) => row) }, null, 2) + '\n');
