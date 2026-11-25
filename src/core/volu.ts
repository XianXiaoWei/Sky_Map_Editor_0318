// Noise::LoadTexture 0x1004ba510; CloudBarn::Initialize 0x100211690.
// The 4096-byte header contains opaque exporter bytes. Only the fields read
// by the native loader are interpreted, and the original buffer is retained.
export interface VolumeTexture {
  version: 4; name: string; resolution: number; source: Buffer;
  voxels: Uint8Array; samples: Float32Array;
}
export function readVolumeTexture(source: Buffer): VolumeTexture {
  if (source.length < 4096 || source.toString('ascii', 0, 4) !== 'VOLU') throw new Error('VOLU 头部无效或截断');
  if (source.readUInt32LE(4) !== 4) throw new Error('未经核实的 VOLU 版本');
  if (source.readUInt32LE(0x110) !== 1 || source.readUInt32LE(0x114) !== 1) throw new Error('不支持的 VOLU 格式或通道');
  const resolution = source.readUInt32LE(0x10c), count = resolution ** 3;
  if (!resolution || !Number.isSafeInteger(count) || count > 64 * 1024 * 1024 || source.length !== 4096 + count) throw new Error('VOLU 尺寸或数据长度无效');
  const rawName = source.subarray(8, 0x108), end = rawName.indexOf(0);
  const name = rawName.subarray(0, end < 0 ? rawName.length : end).toString('utf8');
  const voxels = source.subarray(4096), samples = new Float32Array(count);
  // Native: float32(byte / 255), extend to double, multiply by two,
  // subtract one, then round back to float32. Keep both rounding steps.
  for (let i = 0; i < count; i++) samples[i] = Math.fround(Math.fround(voxels[i] / 255) * 2 - 1);
  return { version: 4, name, resolution, source, voxels, samples };
}
export function cloudNoiseTexture(volume: VolumeTexture) {
  if (volume.resolution !== 64 || volume.samples.length !== 64 ** 3 || !volume.samples.every(Number.isFinite)) throw new Error('原实体云噪声需要 64³ 有限采样');
  const samples = volume.samples, n = 64, data = new Uint8Array(n ** 3);
  let min = 1, max = 0;
  for (const sample of samples) { const value = Math.fround(sample * .5 + .5); min = Math.min(min, value); max = Math.max(max, value); }
  const range = Math.fround(max - min), epsilon = Math.fround(.00001), scale = Math.fround(255.99);
  if (!(range > epsilon || range < -epsilon)) data.fill(255);
  else for (let z = 0; z < n; z++) for (let y = 0; y < n; y++) for (let x = 0; x < n; x++) {
    const value = Math.fround(samples[(z * n + y) * n + x] * .5 + .5);
    const normalized = Math.max(0, Math.min(1, Math.fround(Math.fround(value - min) / range)));
    // Native explicitly transposes the first and third file axes.
    data[(x * n + y) * n + z] = Math.trunc(Math.fround(normalized * scale));
  }
  return { format: 'r8' as const, dimensions: [n, n, n] as [number, number, number], linear: true, repeat: true, data };
}
// CloudBarn::SampleNoise 0x100214810 uses world * 6 and wrapped integer
// taps. The GPU shader uses (world - wind) * .046875; these differ in the
// original and must remain distinct. This function reproduces the CPU path.
export function sampleCloudNoise(texture: { dimensions: number[]; data: Uint8Array }, position: ArrayLike<number>) {
  if (texture.dimensions.length !== 3 || texture.dimensions.some(n => n !== 64) || texture.data.length !== 64 ** 3) throw new Error('CPU 云噪声需要 64³ 纹理');
  if (position.length !== 3 || !Array.from(position).every(n => Number.isFinite(n) && Math.abs(n) <= 3.4028234663852886e38)) throw new Error('云噪声坐标必须是有限 float32 XYZ');
  const f = Math.fround, scaled = Array.from(position, n => f(f(n) * 6));
  const integer = scaled.map(n => { const v = Math.floor(n); return !Number.isFinite(v) || v < -2147483648 || v >= 2147483648 ? -2147483648 : v; });
  const fraction = scaled.map((n, i) => f(n - f(integer[i])));
  const tap = (x: number, y: number, z: number) => f(texture.data[(((integer[2] + z) & 63) * 64 + ((integer[1] + y) & 63)) * 64 + ((integer[0] + x) & 63)] / 255);
  const lerp = (a: number, b: number, t: number) => f(f(f(1 - t) * a) + f(t * b));
  const plane = (z: number) => lerp(lerp(tap(0, 0, z), tap(1, 0, z), fraction[0]), lerp(tap(0, 1, z), tap(1, 1, z), fraction[0]), fraction[1]);
  return lerp(plane(0), plane(1), fraction[2]);
}
