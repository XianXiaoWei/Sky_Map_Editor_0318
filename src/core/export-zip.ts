const crcTable = Uint32Array.from({length: 256}, (_, n) => {
  for (let i = 0; i < 8; i++) n = n & 1 ? 0xedb88320 ^ (n >>> 1) : n >>> 1;
  return n >>> 0;
});
export function createStoredZip(entries: { name: string; bytes: Uint8Array }[]): Uint8Array {
  const encoder = new TextEncoder(), parts: Uint8Array[] = [], central: Uint8Array[] = []; let offset = 0, centralSize = 0;
  for (const entry of entries) {
    if (!entry.name || entry.name.startsWith('/') || entry.name.split('/').some(s => s === '..') || entry.name.includes('\\')) throw new Error('导出文件名无效');
    const name = encoder.encode(entry.name); let crc = 0xffffffff;
    for (const byte of entry.bytes) crc = crcTable[(crc ^ byte) & 255] ^ (crc >>> 8); crc = (crc ^ 0xffffffff) >>> 0;
    const local = new Uint8Array(30 + name.length), lv = new DataView(local.buffer);
    lv.setUint32(0, 0x04034b50, true); lv.setUint16(4, 20, true); lv.setUint16(6, 0x800, true); lv.setUint16(12, 0x21, true);
    lv.setUint32(14, crc, true); lv.setUint32(18, entry.bytes.length, true); lv.setUint32(22, entry.bytes.length, true); lv.setUint16(26, name.length, true); local.set(name, 30);
    const directory = new Uint8Array(46 + name.length), dv = new DataView(directory.buffer);
    dv.setUint32(0, 0x02014b50, true); dv.setUint16(4, 20, true); dv.setUint16(6, 20, true); dv.setUint16(8, 0x800, true); dv.setUint16(14, 0x21, true);
    dv.setUint32(16, crc, true); dv.setUint32(20, entry.bytes.length, true); dv.setUint32(24, entry.bytes.length, true); dv.setUint16(28, name.length, true); dv.setUint32(42, offset, true); directory.set(name, 46);
    parts.push(local, entry.bytes); central.push(directory); offset += local.length + entry.bytes.length; centralSize += directory.length;
  }
  if (entries.length > 65535 || offset + centralSize > 0xffffffff) throw new Error('导出超出 ZIP32 大小');
  const end = new Uint8Array(22), ev = new DataView(end.buffer);
  ev.setUint32(0, 0x06054b50, true); ev.setUint16(8, entries.length, true); ev.setUint16(10, entries.length, true); ev.setUint32(12, centralSize, true); ev.setUint32(16, offset, true);
  const result = new Uint8Array(offset + centralSize + end.length); let at = 0;
  for (const part of [...parts, ...central, end]) { result.set(part, at); at += part.length; } return result;
}
