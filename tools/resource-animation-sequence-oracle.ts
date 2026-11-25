import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { readResourceAnimationList } from '../src/core/resource-animation-list';
import { u32 } from '../src/core/binary';
import { animationSequenceCases, animationSequenceInput, animationSequenceExpected } from './resource-animation-sequence-cases';
import { ORIGINAL_ANIMATION_SEQUENCE_REGISTRY_SOURCE } from '../src/core/animation-sequence-registry';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky', data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', executableSha256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20', sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
if (sha(fs.readFileSync(executable)) !== executableSha256) throw new Error('Original executable SHA differs');
const listBytes = fs.readFileSync(path.join(data, 'Meshes/Bin/AnimationList.dat')), list = readResourceAnimationList(listBytes);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-animation-sequence-')), cases = animationSequenceCases(data, list), failures: unknown[] = [], rows: unknown[] = []; let comparedBytes = 0, comparedCases = 0;
try {
  const runner = path.join(temp, 'oracle'), build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-resource-animation-sequence-oracle.c', '-o', runner]); if (build.status !== 0) throw new Error(build.stderr.toString());
  for (let start = 0; start < cases.length; start += 3) {
    const batch = cases.slice(start, start + 3), input = Buffer.concat([u32(listBytes.length), listBytes, u32(batch.length), ...batch.flatMap(c => [u32(c.source.bytes.length), c.source.bytes, u32(c.requests.length), ...c.requests.map(r => animationSequenceInput(c.pack, list, r))])]);
    const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input, timeout: 60000, maxBuffer: 90000000 }); if (run.status !== 0) throw new Error(`${run.status}:${run.signal}:${run.stderr}`);
    let at = 4;
    for (const c of batch) {
      const count = run.stdout.readUInt32LE(at); at += 4; if (count !== c.requests.length) throw new Error('Native request count differs');
      for (const request of c.requests) {
        const expected = animationSequenceExpected(c.pack, list, request), native = run.stdout.subarray(at, at + expected.length); at += expected.length; comparedBytes += expected.length; comparedCases++;
        if (!expected.equals(native)) { const differences = []; for (let i = 0; i < expected.length && differences.length < 20; i++) if (expected[i] !== native[i]) differences.push({ at: i, actual: expected[i], native: native[i] }); failures.push({ resource: c.source.id, request: request.id, mode: request.mode, name: request.name, differences }); }
        rows.push({ id: request.id, sourceSha256: sha(c.source.bytes), requestSha256: sha(animationSequenceInput(c.pack, list, request)), nativeSha256: sha(native) });
      }
    }
    if (at !== run.stdout.length) throw new Error('Trailing native output'); if (failures.length) break;
  }
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
const report = { passed: !failures.length, executableSha256, animationListSha256: sha(listBytes), resources: cases.length, comparedCases, comparedBytes, originalRegistryCases: cases.reduce((n,c)=>n+c.requests.filter(r=>r.mode===11).length,0), originalRegistrySource: ORIGINAL_ANIMATION_SEQUENCE_REGISTRY_SOURCE, scope: 'Unmodified PlaySequence/PlaySequenceByIndex, MakeSpace and fade consumer, with original list/pack readers, FindNamed, PlayRange and loop signs. Full controller/mask arenas, outputs and assertion writes compared. Prepared nonempty sequences cover signed-char hashes and pack restrictions, duration/overlap branches, sequence counter wrap, 1.1 eviction ceiling, full-record compaction and numeric flag62 suppression. Mode 11 compares actual FishGroup sequences from the entire original static initializer against the complete portable captured registry, preserving indices 488/489, resource restriction and Disturb-to-Swim two-action timing. Empty/negative-index sequences, Model/creature resource lifecycle, animation pose mixing and dynamic viewport remain pending.', failures };
fs.writeFileSync('docs/resource-animation-sequence-oracle.json', JSON.stringify(report, null, 2) + '\n'); if (report.passed) fs.writeFileSync('tests/fixtures/resource-animation-sequence-native.json.gz', gzipSync(JSON.stringify({ executableSha256, animationListSha256: sha(listBytes), cases: rows }), { level: 9 })); console.log(JSON.stringify(report)); if (!report.passed) process.exitCode = 1;
