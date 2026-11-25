import { Reader, applyPatches, floats, type Patch } from './binary';
import registeredProperties from '../../docs/native-properties.json';
const nativeProperties = registeredProperties as Record<string, Record<string, { typeGetter: string }>>;
export interface Property { id: number; name: string; type: number; size: number; classIndex: number; }
export interface ClassDecl { id: number; name: string; properties: Property[]; }
export interface Field { id: string; name: string; kind: string; offset: number; length: number; value: unknown; raw: string; encoding?: string; nativeType?: string; children?: Field[]; }
export interface ObjectNode { id: number; name: string; classIndex: number; className: string; offset: number; length: number; fields: Field[]; }
export class ObjectsDocument {
  classes: ClassDecl[] = []; nodes: ObjectNode[] = []; fields = new Map<string, Field>(); changes = new Map<string, Patch>();
  header: number[]; end = 0;
  constructor(public source: Buffer) {
    const r = new Reader(source, 'Objects.level.bin');
    if (r.take(4).toString() !== 'TGCL') throw new Error('Objects 不是 TGCL 格式');
    this.header = Array.from({ length: 10 }, () => r.u32());
    const [version, nc, np, nn, , co, po, so, no, size] = this.header;
    if (version !== 1 || size !== source.length || nc > 10000 || np > 100000 || nn > 1000000 || co < 44 || co + nc * 12 > po || po + np * 16 > so || so > no || no > size) throw new Error('TGCL 头部校验失败');
    const nameAt = (offset: number) => { if (offset < 0 || so + offset >= no) throw new Error('名称池偏移无效'); const end = source.indexOf(0, so + offset); if (end < 0 || end >= no) throw new Error('名称池字符串截断'); return source.subarray(so + offset, end).toString(); };
    const properties: Property[] = [];
    r.p = po; for (let i = 0; i < np; i++) { const type = r.u32(), name = nameAt(r.u32()), bytes = r.u32(), classIndex = r.u32(); if (type > 3) throw new Error(`未经确认的 TGCL 字段类型 ${type}`); properties.push({ id: i, name, type, size: bytes, classIndex }); }
    r.p = co; for (let i = 0; i < nc; i++) { const name = nameAt(r.u32()), start = r.u32(), count = r.u32(); if (start + count > np) throw new Error('类字段范围无效'); this.classes.push({ id: i, name, properties: properties.slice(start, start + count) }); }
    r.p = no;
    for (let i = 0; i < nn; i++) { const start = r.p, ci = r.u32(), name = r.cstr(); if (!this.classes[ci]) throw new Error(`无效类索引 ${ci}`); const fields = this.readFields(r, ci, `n${i}`, 0); this.nodes.push({ id: i, name, classIndex: ci, className: this.classes[ci].name, offset: start, length: r.p - start, fields }); }
    this.end = r.p;
    if (r.p !== size) throw new Error(`TGCL 剩余 ${size - r.p} 字节，拒绝不完整解析`);
  }
  private readFields(r: Reader, ci: number, prefix: string, depth: number): Field[] {
    if (depth > 64 || !this.classes[ci]) throw new Error('递归类结构无效');
    return this.classes[ci].properties.map((p, i) => {
      const offset = r.p, id = `${prefix}/p${i}`; let kind = 'raw', value: unknown, children: Field[] | undefined;
      if (p.type === 0) {
        const b = r.take(p.size); value = b.toString('hex');
        if (p.size === 1) { kind = 'u8'; value = b[0]; }
        if (p.size === 2) { kind = 'u16'; value = b.readUInt16LE(); }
        if (p.size === 4) { kind = 'bits32'; value = { uint: b.readUInt32LE(), int: b.readInt32LE(), float: Number.isFinite(b.readFloatLE()) ? b.readFloatLE() : null }; }
        if (p.size === 8) { kind = 'bits64'; value = b.toString('hex'); }
        if (p.size === 12 || p.size === 16 || p.size === 64) { kind = p.size === 64 ? 'matrix4' : 'vector'; const ns = Array.from({ length: p.size / 4 }, (_, j) => b.readFloatLE(j * 4)); if (ns.every(Number.isFinite)) value = ns; else kind = 'raw'; }
      } else if (p.type === 1) { kind = 'string'; value = r.cstr(); }
      else if (p.type === 2) { kind = 'reference'; value = r.u32(); }
      else {
        kind = 'array'; const count = r.count(); value = count; children = [];
        for (let j = 0; j < count; j++) {
          if (p.classIndex === 0xffffffff) { const at = r.p, v = r.u32(); const child: Field = { id: `${id}/a${j}`, name: `[${j}]`, kind: 'reference', offset: at, length: 4, value: v, raw: r.data.subarray(at, r.p).toString('hex') }; children.push(child); this.fields.set(child.id, child); }
          else { const at = r.p; const child: Field = { id: `${id}/a${j}`, name: `[${j}] ${this.classes[p.classIndex]?.name ?? '?'}`, kind: 'struct', offset: at, length: 0, value: null, raw: '', children: this.readFields(r, p.classIndex, `${id}/a${j}`, depth + 1) }; child.length = r.p - at; children.push(child); }
        }
      }
      const getter = nativeProperties[this.classes[ci].name]?.[p.name]?.typeGetter;
      const primitive = getter?.match(/^__Z17GetMetaTypeByTypeI([bifjtdh])ERK8MetaTypev$/)?.[1];
      const encoding = primitive ? ({ b: 'bool', i: 'int', f: 'float', j: 'uint', t: 'uint', d: 'double', h: 'uint' } as Record<string, string>)[primitive] : undefined;
      const field: Field = { id, name: p.name, kind, offset, length: r.p - offset, value, raw: r.data.subarray(offset, r.p).toString('hex'), encoding, nativeType: getter, children }; this.fields.set(id, field); return field;
    });
  }
  edit(id: string, value: unknown, representation?: string) {
    const f = this.fields.get(id); if (!f) throw new Error('字段不存在');
    representation ??= f.encoding;
    let b: Buffer;
    const integer = (v: unknown, min: number, max: number) => { const n = Number(v); if (!Number.isInteger(n) || n < min || n > max) throw new Error('整数超出范围'); return n; };
    if (f.kind === 'string') { if (typeof value !== 'string' || value.includes('\0')) throw new Error('字符串不能包含 NUL'); b = Buffer.from(value + '\0'); }
    else if (f.kind === 'vector' || f.kind === 'matrix4') { if (!Array.isArray(value) || value.length !== f.length / 4) throw new Error('向量/矩阵长度无效'); b = floats(value.map(Number)); }
    else if (['bits32', 'u8', 'u16', 'reference'].includes(f.kind)) {
      b = Buffer.alloc(f.length);
      if (f.kind === 'bits32' && representation === 'float') b = floats([Number(value)]);
      else if (f.kind === 'bits32' && representation === 'int') b.writeInt32LE(integer(value, -2147483648, 2147483647));
      else { const n = integer(value, 0, f.encoding === 'bool' ? 1 : f.length === 1 ? 255 : f.length === 2 ? 65535 : 0xffffffff); if (f.kind === 'reference' && n !== 0xffffffff && n >= this.nodes.length) throw new Error('对象引用不存在'); if (f.length === 1) b.writeUInt8(n); else if (f.length === 2) b.writeUInt16LE(n); else b.writeUInt32LE(n); }
    } else if (f.kind === 'raw' || f.kind === 'bits64') { if (typeof value !== 'string' || !/^[0-9a-f]*$/i.test(value) || value.length !== f.length * 2) throw new Error('十六进制长度错误'); b = Buffer.from(value, 'hex'); }
    else throw new Error('数组结构暂不支持改变长度');
    if (b.equals(this.source.subarray(f.offset, f.offset + f.length))) this.changes.delete(id); else this.changes.set(id, { offset: f.offset, length: f.length, data: b });
  }
  serialize(): Buffer { if (!this.changes.size) return Buffer.from(this.source); const b = applyPatches(this.source, [...this.changes.values()]); b.writeUInt32LE(b.length, 40); new ObjectsDocument(b); return b; }
  view() { return { header: this.header, classes: this.classes, nodes: this.nodes, bytes: this.source.length }; }
}
