import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import assert from 'node:assert/strict';
import {spawnSync} from 'node:child_process';
import {createRenderListCases, evaluateRenderList, type RenderListSnapshot} from './render-list-cases';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (b: Buffer | string) => crypto.createHash('sha256').update(b).digest('hex');
const sha = digest(fs.readFileSync(executable));
assert.equal(sha, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases = createRenderListCases(), header = Buffer.alloc(4); header.writeUInt32LE(cases.length);
const input = Buffer.concat([header, ...cases.map(c => {
  const h = Buffer.alloc(4 + c.actions.length * 20); h.writeUInt32LE(c.actions.length);
  c.actions.forEach((ac, i) => ac.forEach((n, j) => h.writeUInt32LE(n >>> 0, 4 + i * 20 + j * 4)));
  return Buffer.concat([h, Buffer.from(c.memory, 'hex')]);
})]);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-render-list-'));
let output: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-render-list-oracle.c', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  if (build.stderr.length) process.stderr.write(build.stderr);
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], {input, timeout:60000, maxBuffer:100e6});
  if (run.status !== 0) throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);
  output = run.stdout;
} finally {fs.rmSync(temp, {recursive:true, force:true});}
let at = 4, snapshots = 0, serviceCalls = 0;
const u32 = () => {const n = output.readUInt32LE(at); at += 4; return n;};
const string = (n: number) => {const b = output.subarray(at, at+n); at += n; return b.subarray(0,b.indexOf(0)).toString();};
assert.equal(output.readUInt32LE(0), cases.length);
const rows = cases.map(input => {
  const expected: RenderListSnapshot[] = input.actions.map(() => {
    const result = u32(), line = u32(), severity = u32(), source = string(32), expression = string(128);
    const count = u32(), events = Array.from({length:count}, () => Array.from({length:6},u32));
    const memory = output.subarray(at,at+32768).toString('hex'); at += 32768;
    snapshots++; serviceCalls += count;
    return {result,line,severity,source,expression,events,memory};
  });
  const actual = evaluateRenderList(input);
  for (let i=0;i<expected.length;i++) {
    if (JSON.stringify(actual[i]) !== JSON.stringify(expected[i])) {
      const before = Buffer.from(actual[i].memory,'hex'), after = Buffer.from(expected[i].memory,'hex');
      const differences = Array.from(before.keys()).filter(i=>before[i]!==after[i]).slice(0,24).map(i=>({offset:'0x'+i.toString(16),actual:before[i],native:after[i]}));
      const failure = {case:input.name,action:i,differences,actual:{...actual[i],memory:undefined},native:{...expected[i],memory:undefined}};
      fs.writeFileSync('/root/sky-research/render-list-oracle-failure.json',JSON.stringify(failure,null,2)+'\n');
      throw new Error(JSON.stringify(failure));
    }
  }
  return {input, nativeSha256:expected.map(s=>digest(JSON.stringify(s)))};
});
assert.equal(at,output.length);
assert.equal(digest(fs.readFileSync(executable)),sha);
const report = {
  passed:true, executableSha256:sha, cases:cases.length, preparedCases:cases.length, actualMapCases:0,
  snapshots, comparedBytes:output.length-4, serviceCalls,
  entries:['0x1007b97b0','0x1007b9820','0x1007b9990','0x1007f65d0','0x1007f6540','0x1007f6770','0x1007ba080','0x1007b9fc0'],
  composition:['Whole original VertexRender Initialize 0x1007f5e90 → real register/context lookup → whole format initializer 0x1007f5fb0, graphics services explicit.', 'Whole original Model submit 0x10046b780 → whole VertexRender queue → primitive count and real RenderList append; debug disabled.', 'Whole original Renderable reset 0x1007f6b80 → real unregister → whole RenderPipeline free 0x1007c0cc0 with prepared zero-UBO reflection; graphics/free services explicit.'],
  scope:'Fixed registration holes/duplicates/capacity failure, stable unregister and unchanged tail/queued flag, exact queue gates, indexed/non-indexed chunks, uint32 overflow, optional/aliased context outputs and format refresh with live registration/capacity callbacks. All cases are prepared ABI inputs. GPU program/parameters/copy/format refresh/assertions are explicit services.',
  actualViewportUsesOriginalQueue:false, completeSceneRestored:false, completeModelRestored:false,
  remaining:['Original Scene/Barn allocation and queue-count frame ownership', 'Original sort modes and distance functions beyond prior mode 3 evidence', 'Full Model constructor, automatic LOD/Visibility/animation/loader', 'GPU format/program lifecycle and actual Windows hardware performance'],
};
fs.writeFileSync('docs/render-list-oracle.json',JSON.stringify(report,null,2)+'\n');
fs.writeFileSync('tests/fixtures/render-list-native.json.gz',zlib.gzipSync(JSON.stringify({report,cases:rows}),{level:9}));
console.log(JSON.stringify(report));
