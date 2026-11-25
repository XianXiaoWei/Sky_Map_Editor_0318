import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { readVolumeTexture, cloudNoiseTexture, sampleCloudNoise } from '../src/core/volu';
import { Reader, u32, floats } from '../src/core/binary';

const binary = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const data = path.resolve(path.dirname(binary), '../Data');
const digest = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = digest(fs.readFileSync(binary));
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original Sky 0.3.18 executable');
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-volu-oracle-'));
try {
  const executable = path.join(temp, 'oracle');
  execFileSync('x86_64-linux-gnu-gcc', ['-O2', '-no-pie', 'tools/native-volu-oracle.c', '-o', executable]);
  const run = (mode: string, input?: Buffer) => new Reader(execFileSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', executable, binary, data, mode], { input, maxBuffer: 32 * 1024 * 1024, timeout: 30000 }), 'VOLU native');
  const rows = [];
  for (const file of ['PerlinNoise.vol', 'CloudNoise.vol', 'CloudFluffy.vol']) {
    const v = readVolumeTexture(fs.readFileSync(path.join(data, 'Tex3D', file))), r = run('Data/Tex3D/' + file);
    if (r.u32() !== v.resolution) throw new Error('Native VOLU dimensions differ');
    const bytes = r.take(v.samples.byteLength), expected = Buffer.from(v.samples.buffer);
    if (!bytes.equals(expected) || r.p !== r.data.length) throw new Error(file + ': original float decode differs');
    rows.push({ file, name: v.name, resolution: v.resolution, voxels: v.voxels.length, sourceSha256: digest(v.source), samplesSha256: digest(bytes), passed: true });
    console.log(`${file}: ${v.samples.length} float32 samples byte-identical`);
  }
  const positions: number[][] = [];
  const values = [-10.666667, -10.666666, -.16666667, -.00001, 0, .125, .16666667, 10.666666, 10.666667];
  for (const x of values) for (const y of values) for (const z of values) positions.push([x,y,z].map(Math.fround));
  let seed = 0x573318;
  const random = () => { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; return Math.fround((seed / 2 ** 32 - .5) * 2000); };
  for (let i = 0; i < 256; i++) positions.push([random(),random(),random()]);
  const r = run('initialize', Buffer.concat([u32(positions.length), ...positions.map(floats)])), slots = [], count = r.u32();
  for (let i = 0; i < count; i++) {
    const slot = r.u32(), resolution = r.u32(), bytes = r.take(resolution ** 3 * 4);
    const file = slot === 0 ? 'PerlinNoise.vol' : slot === 17 ? 'CloudFluffy.vol' : undefined;
    if (!file) throw new Error('Unexpected native file-backed noise slot');
    const v = readVolumeTexture(fs.readFileSync(path.join(data, 'Tex3D', file)));
    if (resolution !== v.resolution || !bytes.equals(Buffer.from(v.samples.buffer))) throw new Error('Native Noise initialization differs');
    slots.push({ slot, pointerOffset: '0x' + (0x60 + slot * 8).toString(16), file, resolution });
  }
  const v = readVolumeTexture(fs.readFileSync(path.join(data, 'Tex3D/CloudFluffy.vol'))), texture = cloudNoiseTexture(v);
  const dimensions = [r.u32(), r.u32(), r.u32()], format = r.u32(), kind = r.u32();
  const bytes = r.take(texture.data.length);
  if (dimensions.some(n => n !== 64) || format !== 2 || kind !== 1 || !bytes.equals(Buffer.from(texture.data))) throw new Error('Native CloudNoise3D upload differs');
  console.log('Native Noise slots 0/17 and CloudNoise3D 64³ normalization/transpose byte-identical');
  if (r.u32() !== positions.length) throw new Error('Native noise sample count');
  const samples = positions.map(position => ({ position, native: r.f32() }));
  for (const sample of samples) if (!Object.is(sample.native, sampleCloudNoise(texture, sample.position))) throw new Error('Native CPU noise sample differs: ' + JSON.stringify(sample));
  if (r.p !== r.data.length) throw new Error('Native trailing bytes');
  console.log(`${samples.length} native CPU repeat/trilinear noise samples exact`);
  const report = { executableSha256, scope: 'Unchanged original VOLU float decoding, Noise file selection and CloudBarn normalization/axis transpose. Mock resource file I/O/heap and sampler/GPU calls. Excludes GPU/Metal game rendering.', files: rows, loadedSlots: slots, cloudNoise: { source: 'Tex3D/CloudFluffy.vol', uniform: 'u_cloudNoise3D', dimensions, format, bytes: bytes.length, sha256: digest(bytes), linear: true, repeat: true, passed: true } };
  fs.writeFileSync('docs/volu-oracle.json', JSON.stringify({ ...report, cpuNoise: { function: '0x100214810', scale: 6, samples } }, null, 2) + '\n');
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
