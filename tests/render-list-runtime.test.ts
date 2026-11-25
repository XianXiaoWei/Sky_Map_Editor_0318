import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import assert from 'node:assert/strict';
import test from 'node:test';
import {evaluateRenderList, type RenderListCase} from '../tools/render-list-cases';

const fixture = JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/render-list-native.json.gz')).toString()) as {
  report:{passed:boolean;executableSha256:string;cases:number;actualViewportUsesOriginalQueue:boolean};
  cases:{input:RenderListCase;nativeSha256:string[]}[];
};
test('RenderList and composed original Model/VertexRender reproduce independent whole native functions', () => {
  assert.equal(fixture.report.passed,true);
  assert.equal(fixture.report.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
  assert.equal(fixture.cases.length,fixture.report.cases);
  for (const row of fixture.cases) {
    const hashes=evaluateRenderList(row.input).map(s=>crypto.createHash('sha256').update(JSON.stringify(s)).digest('hex'));
    assert.deepEqual(hashes,row.nativeSha256,row.input.name);
  }
});
test('Original queue duplicate guard remains active across unregister until EndQueue', () => {
  const row=fixture.cases.find(r=>r.input.name==='unregister does not clear queued flag')!;
  const out=evaluateRenderList(row.input);
  assert.equal(Buffer.from(out[2].memory,'hex').readUInt32LE(0x108),0);
  assert.equal(Buffer.from(out[2].memory,'hex')[0x152a],1);
  assert.equal(out[3].expression,'!m_queued');
  assert.equal(out[5].line,0);
  assert.equal(Buffer.from(out[5].memory,'hex').readUInt32LE(0x108),1);
});
test('Ready is published after live format refresh and callback mutation changes remaining slots', () => {
  const row=fixture.cases.find(r=>r.input.name==='context refresh live mutation 2 ready 0')!;
  const out=evaluateRenderList(row.input);
  assert.deepEqual(out[0].events.map(e=>[e[1],e[4]]),[[0x1000,0],[0x2000,0],[0x1800,0],[0x1000,0]]);
  assert.equal(out[1].result,1);
});
test('Whole initialization, submission and reset share a real list through reinitialization', () => {
  const row=fixture.cases.find(r=>r.input.name==='whole initialize queue reset reinitialize lifecycle')!;
  const out=evaluateRenderList(row.input).map(s=>Buffer.from(s.memory,'hex'));
  assert.deepEqual(out.map(b=>b.readUInt32LE(0x108)),[0,1,0,0,1,0]);
  assert.deepEqual(out.map(b=>b.readBigUInt64LE(0x600)),[0x300001000n,0x300001000n,0n,0x300001000n,0x300001000n,0n]);
  assert.deepEqual(out.map(b=>b[0x1538]),[1,1,0,1,1,0]);
});
