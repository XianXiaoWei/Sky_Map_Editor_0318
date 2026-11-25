import {test} from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import {createHash} from 'node:crypto';
import {flameSpriteCases,evaluateFlameSprite,type FlameSpriteCase} from '../tools/flame-sprite-cases';
import evidence from '../docs/flame-sprite-native.json';
test('Original primary Flame sprite, aliasing Add/Reset and camera-facing vertices match independent native memory and service traces',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/flame-sprite-native.json.gz')).toString()) as {executableSha256:string;cases:{input:FlameSpriteCase;nativeSha256:string;trace:string[]}[]};
 const inputs=flameSpriteCases();assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.cases.length,inputs.length);
 // JSON turns -0 into 0. Recreate the original input definition so signed-zero
 // source bytes are still covered by the independent full-memory hash.
 for(const [i,row] of fixture.cases.entries()){assert.deepEqual(JSON.parse(JSON.stringify(inputs[i])),row.input);const actual=evaluateFlameSprite(inputs[i],row.trace.map(v=>Buffer.from(v,'base64')));assert.equal(createHash('sha256').update(actual).digest('hex'),row.nativeSha256,row.input.label);}
});
