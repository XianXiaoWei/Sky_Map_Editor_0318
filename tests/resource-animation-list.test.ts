import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import { gunzipSync } from 'node:zlib';
import { animationListCases, animationListExpected } from '../tools/resource-animation-list-cases';
import { readResourceAnimationList, findResourceAnimationFile, resourceAnimationNameHash } from '../src/core/resource-animation-list';
import { AssetCatalog } from '../src/main/assets';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
test('Compiled AnimationList complete file/actions/sound/emitter bytes and hashes match the original v1/v2/v3 machine code', () => {
  const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/resource-animation-list-native.json.gz')).toString()), cases = animationListCases(data); assert.equal(cases.length, fixture.cases.length);
  cases.forEach((c, i) => { const row = fixture.cases[i]; assert.equal(row.id, c.id); assert.equal(sha(c.bytes), row.sourceSha256); assert.equal(sha(animationListExpected(c.bytes)), row.nativeSha256, c.id); });
});
test('Catalog preserves original named creature/flower actions and rejects incomplete or unknown animation tables', () => {
  const catalog = new AssetCatalog(data), list = catalog.animationList(); assert.equal(list.files.length, 186); assert.equal(list.metaDataCount, 2255);
  const bird = findResourceAnimationFile(list, 'CHARBIRDANIM')!, flower = findResourceAnimationFile(list, 'CharEnvFlowerAnim')!;
  assert.deepEqual(bird.metaDatas.find(m => m.name === 'critterMove')!.sounds.map(s => s.effect), ['ravenflap']);
  assert.deepEqual(bird.metaDatas.filter(m => ['critterMove', 'critterIdle'].includes(m.name)).map(m => [m.name, m.start, m.stop]), [['critterMove', 1, 10], ['critterIdle', 21, 24]]);
  assert.deepEqual(flower.metaDatas.map(m => [m.name, m.start, m.stop]), [['closedLoop', 1, 30], ['openUp', 31, 60], ['openLoop', 61, 90], ['closeDown', 91, 120]]);
  assert.equal(findResourceAnimationFile(list, 'AbsentAnimation'), null); assert.equal(resourceAnimationNameHash(''), 'cbf29ce484222325');
  const source = fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`); assert.throws(() => readResourceAnimationList(source.subarray(0, source.length - 1)), /越界/);
  const version = Buffer.from(source); version.writeUInt32LE(4); assert.throws(() => readResourceAnimationList(version), /版本/);
  assert.throws(() => readResourceAnimationList(Buffer.concat([source, Buffer.from([0])])), /未解释/);
  const count = Buffer.from(source); count.writeUInt32LE(512, 4); assert.throws(() => readResourceAnimationList(count), /超限/);
});
