import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import { MeshesDocument } from '../src/core/meshes';
import { lz4Decode, lz4Encode, applyPatches } from '../src/core/binary';
import { digest, saveAtomic, assetPath } from '../src/core/storage';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const read = (level: string, file: string) => fs.readFileSync(path.join(data, 'Levels', level, file));
test('All 33 levels parse completely and preserve every original byte without edits', () => {
  for (const level of fs.readdirSync(path.join(data, 'Levels'))) {
    for (const [file, Codec] of [['Objects.level.bin', ObjectsDocument], ['BstBaked.meshes', MeshesDocument]] as const) { const source = read(level, file); assert.deepEqual(new Codec(source).serialize(), source, `${level}/${file}`); }
  }
});
test('WorldEmpty string resizing changes only the field and header file size', () => {
  const source = read('WorldEmpty', 'Objects.level.bin'), d = new ObjectsDocument(source), field = [...d.fields.values()].find(f => f.name === 'worldName')!; const value = '测试地图 VeryLongName'; d.edit(field.id, value); const actual = d.serialize(), expected = applyPatches(source, [{ offset: field.offset, length: field.length, data: Buffer.from(value + '\0') }]); expected.writeUInt32LE(expected.length, 40); assert.deepEqual(actual, expected); assert.equal(new ObjectsDocument(actual).fields.get(field.id)?.value, value);
});
test('Integer and float bit interpretations are explicit; unchanged NaN-like bits are preserved', () => {
  const d = new ObjectsDocument(read('WorldEmpty', 'Objects.level.bin')); const field = [...d.fields.values()].find(f => f.name === 'gridSize')!; d.edit(field.id, 512, 'uint'); const out = new ObjectsDocument(d.serialize()); assert.equal((out.fields.get(field.id)?.value as any).uint, 512); assert.throws(() => d.edit(field.id, -1, 'uint')); assert.throws(() => d.edit(field.id, Infinity, 'float')); assert.throws(() => d.edit(field.id, 1.5, 'int'));
});
test('Dawn nested string and Marker vectors roundtrip without changing object references', () => {
  const source = read('Dawn', 'Objects.level.bin'), d = new ObjectsDocument(source), marker = d.nodes.find(n => n.className === 'Marker')!, pos = marker.fields.find(f => f.name === 'pos')!; d.edit(pos.id, [1, 2, 3, 0]); const s = [...d.fields.values()].find(f => f.kind === 'string' && f.id.split('/').length > 3)!; d.edit(s.id, 'LongerNestedValue'); const out = new ObjectsDocument(d.serialize()); assert.deepEqual(out.fields.get(pos.id)?.value, [1, 2, 3, 0]); assert.equal(out.fields.get(s.id)?.value, 'LongerNestedValue'); assert.equal(out.nodes.length, d.nodes.length);
  for (const f of d.fields.values()) if (f.kind === 'reference') assert.equal(out.fields.get(f.id)?.value, f.value);
});
test('Terrain material patches preserve every collision, edge table and bake byte', () => {
  const d = new MeshesDocument(read('Dawn', 'BstBaked.meshes')), g = d.geometries.find(g => g.kind === 'terrain' && g.vertexCount)!, view = d.geometryView(g), ids = view.materialIds.slice(), weights = view.weights.slice(); ids[0] = 5; weights.set([255, 0, 0, 0]); d.editGeometry(g.id, undefined, ids, weights); const out = new MeshesDocument(d.serialize()); for (let i = 0; i < d.lod.length; i++) { const local = i - g.vertexOffset, vertex = Math.floor(local / 36), channel = local % 36; if (vertex >= 0 && vertex < g.vertexCount && channel >= 16 && channel < 24) continue; assert.equal(out.lod[i], d.lod[i], `unexpected edit at ${i}`); } assert.equal(out.geometryView(out.geometries.find(x => x.id === g.id)!).materialIds[0], 5); assert.throws(() => d.editGeometry(g.id, view.positions), /碰撞/);
});
test('WorldEmpty new skirt uses original 40-byte layout and retains the empty occluder', () => {
  const d = new MeshesDocument(read('WorldEmpty', 'BstBaked.meshes')); d.addSkirt([0, 0, 0, 10, 0, 0, 0, 0, 10], [0, 2, 1], 7); const out = new MeshesDocument(d.serialize()), skirt = out.geometries.find(g => g.kind === 'skirt')!; assert.equal(skirt.stride, 40); assert.deepEqual([...skirt.indices], [0, 2, 1]); assert.equal(skirt.vertexCount, 3); assert.equal(out.geometryView(skirt).materialIds[0], 7); assert.equal(out.geometries.find(g => g.kind === 'occluder')?.vertexCount, 0); out.editGeometry(skirt.id, [0, 1, 0, 10, 2, 0, 0, 3, 10]); const modified = new MeshesDocument(out.serialize()); assert.deepEqual([...modified.geometryView(modified.geometries.find(g => g.kind === 'skirt')!).positions], [0, 1, 0, 10, 2, 0, 0, 3, 10]);
});
test('LZ4 overlaps, literal-only encoding and malformed buffers', () => { for (const n of [0, 1, 14, 15, 16, 255, 1024, 100000]) { const b = crypto.randomBytes(n); assert.deepEqual(lz4Decode(lz4Encode(b)), b); } assert.deepEqual(lz4Decode(Buffer.from([0x14, 65, 1, 0, 0x50, 66, 67, 68, 69, 70])), Buffer.from('AAAAAAAAABCDEF')); assert.throws(() => lz4Decode(Buffer.from([0, 0, 0]))); assert.throws(() => lz4Decode(Buffer.from([0xf0]))); assert.throws(() => lz4Decode(lz4Encode(Buffer.alloc(100)), 20)); });
test('Truncated and invalid headers reject without emitting an editable partial document', () => { const o = read('WorldEmpty', 'Objects.level.bin'), m = read('WorldEmpty', 'BstBaked.meshes'); for (const b of [o.subarray(0, 20), o.subarray(0, o.length - 1)]) assert.throws(() => new ObjectsDocument(b)); for (const b of [m.subarray(0, 8), m.subarray(0, m.length - 1)]) assert.throws(() => new MeshesDocument(b)); const bad = Buffer.from(o); bad.writeUInt32LE(0xffffffff, 24); assert.throws(() => new ObjectsDocument(bad)); });
test('Meshes rejects ambiguous directories before allowing edits', () => {
  const source = read('WorldEmpty', 'BstBaked.meshes'), length = source.readUInt32LE(20);
  const second = (tag: string, offset: number, size: number) => { const b = Buffer.from(source); b[8] = 2; b.write(tag, 24, 4, 'ascii'); b.writeUInt32LE(offset, 28); b.writeUInt32LE(size, 32); return b; };
  assert.throws(() => new MeshesDocument(second('LOD0', 132, length)), /重复/);
  assert.throws(() => new MeshesDocument(second('TEST', 133, length - 1)), /重叠/);
  assert.throws(() => new MeshesDocument(second('TEST', 133, 0)), /空段/);
});
test('Meshes resizing preserves opaque sections and relocates an empty end marker with an unsorted directory', () => {
  const source = read('WorldEmpty', 'BstBaked.meshes'), before = Buffer.from('opaque prefix'), after = Buffer.from('opaque suffix');
  const lod = source.subarray(132), start = 132 + before.length, end = start + lod.length;
  const b = Buffer.concat([source.subarray(0, 132), before, lod, after]); b[8] = 4;
  const sections = [['POST', end, after.length], ['LOD0', start, lod.length], ['PRE0', 132, before.length], ['END0', end, 0]] as const;
  sections.forEach(([tag, offset, length], i) => { b.write(tag, 12 + i * 12, 4, 'ascii'); b.writeUInt32LE(offset, 16 + i * 12); b.writeUInt32LE(length, 20 + i * 12); });
  const doc = new MeshesDocument(b); assert.deepEqual(doc.serialize(), b);
  doc.addSkirt([0, 0, 0, 1, 0, 0, 0, 0, 1], [0, 2, 1]); const saved = doc.serialize(), out = new MeshesDocument(saved);
  const get = (tag: string) => out.sections.find(s => s.tag === tag)!;
  for (const [tag, original] of [['PRE0', before], ['POST', after]] as const) { const s = get(tag); assert.deepEqual(saved.subarray(s.offset, s.offset + s.length), original); }
  assert.equal(get('END0').offset, get('LOD0').offset + get('LOD0').length); assert.equal(get('POST').offset, get('END0').offset);
  assert.equal(get('PRE0').offset, 132); assert.equal(get('LOD0').offset, start); assert.equal(out.skirtCount, 1);
});
test('Atomic replacement makes a recoverable backup and refuses an external overwrite', () => { const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-save-test-')); try { const filename = path.join(dir, 'Objects.level.bin'), old = Buffer.from('old bytes'), next = Buffer.from('new bytes'); fs.writeFileSync(filename, old); const result = saveAtomic(filename, digest(old), next); assert.deepEqual(fs.readFileSync(result.backup), old); assert.deepEqual(fs.readFileSync(filename), next); fs.writeFileSync(filename, 'external'); assert.throws(() => saveAtomic(filename, result.hash, old), /其他程序/); assert.equal(fs.readFileSync(filename, 'utf8'), 'external'); assert.throws(() => assetPath(dir, '../no-file')); } finally { fs.rmSync(dir, { recursive: true, force: true }); } });
