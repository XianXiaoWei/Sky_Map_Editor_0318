import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { u32 } from '../src/core/binary';
import { numericFloatBits as bits, numericFloatValue as value } from '../src/core/object-numeric-runtime';
import { animationUpdateCases, fishGroupAnimationUpdateCases, animationUpdateInput, animationUpdateExpected } from './resource-animation-update-cases';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const resourceFilter = process.env.SKY_ANIMATION_RESOURCE;
const realOnly = process.env.SKY_ANIMATION_REAL_ONLY === '1';
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-update-')), cases = (realOnly ? fishGroupAnimationUpdateCases(data) : animationUpdateCases(data)).filter(c => !resourceFilter || c.source.id === resourceFilter);
const failures: unknown[] = [], rows: unknown[] = [], reciprocals = new Map<number, number>();
let comparedBytes = 0, comparedCases = 0, comparedFrames = 0, serviceCalls = 0;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-update-oracle.c', '-o', runner, '-lm']);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  for (const c of cases) {
    const prepared = c.requests.map(request => ({ request, expected: animationUpdateExpected(c.pack, request) }));
    const input = Buffer.concat([u32(1), u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...prepared.map(p => animationUpdateInput(c.pack, p.request, p.expected.rsqrtInputs))]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 80000000 });
    if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    if (run.stdout.readUInt32LE(0) !== 1 || run.stdout.readUInt32LE(4) !== c.requests.length) throw new Error('Native framing differs');
    let at = 8;
    for (const p of prepared) {
      const native = run.stdout.subarray(at, at + p.expected.output.length); at += p.expected.output.length;
      const powCount = run.stdout.readUInt32LE(at); at += 4;
      const powTrace = run.stdout.subarray(at, at + powCount * 12); at += powTrace.length;
      let replay;
      try { replay = animationUpdateExpected(c.pack, p.request, powTrace); }
      catch (error) { fs.writeFileSync('/root/sky-research/animation-update-failed-request.json', JSON.stringify(p.request)); fs.writeFileSync('/root/sky-research/animation-update-failed-pow.bin', powTrace); throw error; }
      const expected = replay.output;
      if (JSON.stringify(replay.rsqrtInputs) !== JSON.stringify(p.expected.rsqrtInputs)) throw new Error('Scale powf changed quaternion reciprocal inputs');
      comparedBytes += expected.length; comparedCases++; comparedFrames += p.request.frames; serviceCalls += replay.trace.length / 4;
      if (!expected.equals(native)) {
        const differences = [];
        for (let i = 0; i < expected.length && differences.length < 32; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] });
        failures.push({ resource: c.source.id, request: p.request.id, input: p.request, differences });
        fs.writeFileSync('/root/sky-research/animation-update-failure-actual.bin', expected); fs.writeFileSync('/root/sky-research/animation-update-failure-native.bin', native);
      }
      const count = run.stdout.readUInt32LE(at); at += 4;
      if (count !== p.expected.rsqrtInputs.length) throw new Error(`${p.request.id}: reciprocal count differs (${count})`);
      const pairs = run.stdout.subarray(at, at + count * 8); at += count * 8;
      for (let i = 0; i < count; i++) {
        const inputBits = pairs.readUInt32LE(i * 8), outputBits = pairs.readUInt32LE(i * 8 + 4), proposed = bits(1 / Math.fround(Math.sqrt(value(inputBits))));
        if (inputBits !== p.expected.rsqrtInputs[i] || proposed !== outputBits) failures.push({ id: p.request.id, reciprocal: { inputBits, outputBits, proposed } });
        reciprocals.set(inputBits, outputBits);
      }
      rows.push({ id: p.request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationUpdateInput(c.pack, p.request, p.expected.rsqrtInputs)), nativeSha256: sha(native), frameSha256: replay.frameOutputs.map(sha), powTrace: powTrace.toString('base64'), rsqrtPairs: pairs.toString('base64') });
      if (failures.length) break;
    }
    if (failures.length) break;
    if (at !== run.stdout.length) throw new Error('Trailing native output');
    console.log(`checked ${c.source.id}: ${c.requests.length} shared-controller runs`);
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = {
  passed: !failures.length, executableSha256, resources: cases.length, allResourcesCompared: !resourceFilter && !realOnly, actualFishConfigurations: realOnly ? cases[0].requests.length : 0, comparedCases, comparedFrames, comparedBytes, serviceCalls, reciprocalInputs: reciprocals.size,
  scope: realOnly
    ? 'Five actual saved fish EventBarn graphs supply original Disturb and any auto-start SwimAround request records, range/sign masks and sequence counters. All 300 frames execute unmodified original Animation.Update, primary/default pose, secondary clock/sample/blend, empty additive phase, Transform dirty/lazy world caches and palette/effect flush on shared storage. Entire controller, masks, Transform nodes/cache/padding, palettes and ordered effect/scene calls match each frame, including the exact-zero negative fade weight and retirement of Disturb into live Swim plus retained delayed no-pack fallback. Pack bytes and map sources are SHA-bound and request capture is reproducible. The root transform change is prepared input; Model/Avatar allocation, effects and scene callbacks remain explicit services. RSQRTPS inputs additionally execute on QEMU reference CPU. Fish rail motion, actual Model/resource lifecycle, visible scene ownership and Windows acceptance remain pending; this does not count as a complete creature.'
    : 'Whole original Animation.Update calls unmodified primary, secondary, additive and flush bodies on the same controller across consecutive frames. Original pack reader, request clock, sample, weighted pose blend, Transform lazy world-cache traversal, dirty propagation and palette multiplication execute unmodified. Every controller, mask, Transform cache/padding and palette byte and ordered effect/scene call is compared each frame. Cases cover empty/default poses, priority, transitions/compaction, changing root transform, human/nonhuman dynamic masks including unclamped blend, SIMD groups/tails and zero/large deltas. Global weight arrays are explicit live owner input, not inferred from mesh names. Synthetic additive requests on raw negative-scale packs use unit weights to stay in finite powf domain; positive-scale packs exercise fractional weights. Sound/emitter/debug consumers remain traced services. powf results are native libc traces with verified arguments/order; RSQRTPS inputs independently execute on the QEMU reference CPU, without an Intel/AMD approximation parity claim. This closes the shared animation update composition; Model/resource loading, creature owners, scene rendering and complete creature classes remain pending.',
  wholeAnimationUpdateVerified: !failures.length, wholeTransformWorldCacheVerified: !failures.length, completeCreatureClasses: 0, failures,
};
const reportName = realOnly ? 'fish-group-animation-update-oracle' : 'resource-animation-update-oracle';
const fixtureName = realOnly ? 'fish-group-animation-update-native' : 'resource-animation-update-native';
if (!resourceFilter) fs.writeFileSync(`docs/${reportName}.json`, JSON.stringify(report, null, 2) + '\n');
if (report.passed && !resourceFilter) fs.writeFileSync(`tests/fixtures/${fixtureName}.json.gz`, gzipSync(JSON.stringify({ executableSha256, cases: rows }), { level: 9 }));
console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
