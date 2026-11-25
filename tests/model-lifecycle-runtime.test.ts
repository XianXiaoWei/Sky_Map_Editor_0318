import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateModelLifecycle,prepareModelLifecycle} from '../tools/model-lifecycle-cases';
import {destroyOriginalModel} from '../src/core/model-lifecycle-runtime';
test('Model destruction and same-slot recreation match independent original machine-code memory/callback fixtures',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/model-lifecycle-native.json.gz')).toString());
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateModelLifecycle(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
test('Destroy clears original ownership but keeps LOD count, transform and ordinary flags',()=>{
 const {b,m,base}=prepareModelLifecycle({label:'preserve',mode:0,lods:0,extras:0});const matrix=Buffer.from(b.subarray(0x1160,0x11a0));
 destroyOriginalModel(m,base+0x1000n,base+0xeb00n,{resetMeshInstance(){},resetVertexData(){},destroyVertexData(){},destroyVertexRender(){},free(){},releaseAnimation(){},destroyAnimationState(){},removeCollision(){},destroyAuxiliary(){}});
 assert.equal(m.read64(base+0x1008n),0n);assert.equal(b[0x1226],0);assert.deepEqual(b.subarray(0x1160,0x11a0),matrix);assert.equal(b[0x1227],0xa5);
});
