export class Reader {
  p = 0;
  constructor(public data: Buffer, public label = 'binary') {}
  take(n: number): Buffer {
    if (!Number.isSafeInteger(n) || n < 0 || this.p + n > this.data.length) throw new Error(`${this.label}: 数据越界 @0x${this.p.toString(16)}, size=${n}`);
    const b = this.data.subarray(this.p, this.p + n); this.p += n; return b;
  }
  u8() { return this.take(1)[0]; }
  u16() { return this.take(2).readUInt16LE(); }
  u32() { return this.take(4).readUInt32LE(); }
  i32() { return this.take(4).readInt32LE(); }
  f32() { return this.take(4).readFloatLE(); }
  vec3() { return [this.f32(), this.f32(), this.f32()]; }
  cstr() { const end = this.data.indexOf(0, this.p); if (end < 0) throw new Error(`${this.label}: 未终止字符串`); const s = this.take(end - this.p).toString('utf8'); this.take(1); return s; }
  string() { return this.take(this.count(1024 * 1024)).toString('utf8'); }
  count(max = 2000000) { const n = this.u32(); if (n > max) throw new Error(`${this.label}: 数量超限 ${n}`); return n; }
}
export const u32 = (n: number) => { const b = Buffer.alloc(4); b.writeUInt32LE(n); return b; };
export const floats = (ns: number[]) => { const b = Buffer.alloc(ns.length * 4); ns.forEach((n, i) => { if (!Number.isFinite(n) || Math.abs(n) > 3.4028234663852886e38) throw new Error('必须是有限 float32'); b.writeFloatLE(n, i * 4); }); return b; };
export function lz4Decode(src: Buffer, limit = 256 * 1024 * 1024): Buffer {
  // Raw LZ4 block, not the LZ4 frame format. The game's TOC has compressed lengths only.
  let output = Buffer.alloc(Math.min(Math.max(src.length * 4, 256), limit)); let p = 0, q = 0;
  function reserve(n: number) { if (q + n > limit) throw new Error('LZ4 解压大小超限'); if (q + n > output.length) { const next = Buffer.alloc(Math.min(limit, Math.max(q + n, output.length * 2))); output.copy(next, 0, 0, q); output = next; } }
  function length(n: number) { if (n === 15) { let x; do { if (p >= src.length) throw new Error('LZ4 长度截断'); x = src[p++]; n += x; } while (x === 255); } return n; }
  while (p < src.length) {
    const token = src[p++], n = length(token >> 4); if (p + n > src.length) throw new Error('LZ4 字面量截断'); reserve(n); src.copy(output, q, p, p + n); p += n; q += n;
    if (p === src.length) break;
    if (p + 2 > src.length) throw new Error('LZ4 偏移截断'); const offset = src.readUInt16LE(p); p += 2;
    if (!offset || offset > q) throw new Error('LZ4 无效匹配偏移'); const count = length(token & 15) + 4; reserve(count);
    for (let j = 0; j < count; j++) output[q + j] = output[q + j - offset]; q += count;
  }
  return output.subarray(0, q);
}
export function lz4Encode(src: Buffer): Buffer {
  // Valid literal-only block. No undocumented compressor dependency, exact decoded bytes.
  const n = src.length, parts: Buffer[] = [Buffer.from([Math.min(n, 15) << 4])];
  if (n >= 15) { let extra = n - 15; while (extra >= 255) { parts.push(Buffer.from([255])); extra -= 255; } parts.push(Buffer.from([extra])); }
  parts.push(src); return Buffer.concat(parts);
}
export interface Patch { offset: number; length: number; data: Buffer; }
export function applyPatches(source: Buffer, patches: Patch[]): Buffer {
  const sorted = [...patches].sort((a, b) => a.offset - b.offset); const parts: Buffer[] = []; let at = 0;
  for (const patch of sorted) { if (patch.offset < at || patch.offset + patch.length > source.length) throw new Error('补丁重叠或越界'); parts.push(source.subarray(at, patch.offset), patch.data); at = patch.offset + patch.length; }
  parts.push(source.subarray(at)); return Buffer.concat(parts);
}
