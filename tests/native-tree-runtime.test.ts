import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import type { NativeTreeCase } from '../tools/native-tree-cases';
import { evaluateNativeTree } from '../tools/native-tree-evaluate';

const fixture: { cases: { input: NativeTreeCase; native: ReturnType<typeof evaluateNativeTree> }[] } =
  JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/native-tree-native.json.gz')).toString());
for (const [name, accepts] of [
  ['uint32 boundaries and neighbor hints', (name: string) => name.startsWith('boundaries-') || name.startsWith('reverse-')],
  ['duplicate keys and alternating tree rotations', (name: string) => name.startsWith('alternating-')],
  ['random insertions, recoloring and balancing', (name: string) => name.startsWith('random-')],
  ['all existing hints across ascending and descending trees', (name: string) => name.startsWith('all-hints-')],
] as const) {
  test(`Original native type tree: ${name}`, () => {
    const cases = fixture.cases.filter(row => accepts(row.input.name));
    assert.ok(cases.length);
    for (const row of cases) assert.deepEqual(evaluateNativeTree(row.input), row.native, row.input.name);
  });
}
