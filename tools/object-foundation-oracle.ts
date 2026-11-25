import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { foundationCases, foundationRegistry, foundationEventBarn, type FoundationCase } from './object-foundation-cases';
import { evaluateFoundation, type FoundationResult } from './object-foundation-evaluate';
const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = digest(fs.readFileSync(executable));
assert.equal(executableSha256, '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
const cases = foundationCases().filter(c=>!process.env.SKY_FOUNDATION_FILTER||c.name.includes(process.env.SKY_FOUNDATION_FILTER)), chunks: Buffer[] = [];
const uints = (values: number[]) => { const b = Buffer.alloc(values.length * 4); values.forEach((v, i) => b.writeUInt32LE(v >>> 0, i * 4)); return b; };
chunks.push(uints([cases.length]));
for (const c of cases) { const query = Buffer.from(c.query); chunks.push(uints([c.kind, c.id, Number(c.nullObject), query.length]), foundationRegistry(c), Buffer.from(c.objectHex, 'hex'), query);if(c.tgcl)chunks.push(foundationEventBarn(c)); }
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-object-foundation-')); let output: Buffer;
try {
  const runner = path.join(temp, 'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc', ['-O2', '-Wall', '-Wextra', 'tools/native-object-foundation-oracle.c', '-lm', '-o', runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64', ['-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, executable], { input: Buffer.concat(chunks), timeout: 180000, maxBuffer: 256e6 });
  if (run.status !== 0) throw new Error(`${run.status}: ${run.stderr}`); output = run.stdout;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
let at = 0; const u32 = () => { const v = output.readUInt32LE(at); at += 4; return v; };
assert.equal(u32(), cases.length);
const rows: { input: FoundationCase; native: FoundationResult }[] = [], failures: unknown[] = [];
for (const input of cases) {
  const line = u32(), severity = u32(), count = u32(), result = output.readBigUInt64LE(at).toString(); at += 8;
  const services = Array.from({ length: count }, () => [u32(), u32(), u32()]);
  const objectHex = output.subarray(at, at + 0x200).toString('hex'); at += 0x200;
  const registrySha256 = digest(output.subarray(at, at + 0x10000)); at += 0x10000;
  const native:FoundationResult = { line, severity, result, services, objectHex, registrySha256 };
  if(input.tgcl){native.eventBarnHex=output.subarray(at,at+0x5100).toString('hex');at+=0x5100;}
  if(input.tgcl?.trigger){native.loadHeapBaseline=u32();const frames=u32();native.frames=Array.from({length:frames},()=>{const objectHex=output.subarray(at,at+0x200).toString('hex');at+=0x200;return {objectHex,barnSequence:u32()};});}
  if(input.tgcl?.eventClass==='SetFloat'){const count=u32();native.math=Array.from({length:count},()=>[u32(),u32()]);}
  const actual = evaluateFoundation(input,native.math);
  try { assert.deepEqual(actual, native); } catch { failures.push({ name: input.name, actual, native }); }
  rows.push({ input, native });
}
assert.equal(at, output.length);
const scope = 'Forty named unmodified whole bodies: case-sensitive registered-name lookup, metadata-ID lookup, vptr repair, Float placement/heap construction and null-safe release, ObjectFactory CreateObject/ReleaseObject/GetObjectInitPriority, ValueBarn Initialize/CreateValue/ReleaseValue/OnLevelUnload, Event constructor 0x10032eea0, FloatMult placement 0x100719090 and execution 0x1007191a0, FloatAdd placement 0x100719390/execution 0x1007194a0, SetFloat placement 0x1007175d0/load 0x1007176e0/enable 0x1007176f0/resume 0x100717710/update 0x100717730, recursive ReadFields 0x10040b390, EventBarn Initialize 0x10032e4a0, CreateEvent<Event> 0x100039f40 and single-node release 0x10032f350. Original loader pointer-fixup 0x10040d2aa..0x10040d311 is an explicitly bounded SUBRANGE. Constructor preserves value/backlink/padding; all 184 corpus Float values retained. Factory covers nearest registered base, repeated getter, 0/1-argument reflected calls, receiver address versus result pointer storage, signed priority/zero on failed Module cast and missing-type/factory/method/cast failures. ValueBarn covers all 80 links, slot exhaustion, failed cast after pop, null/backlink-free release and unload reset. Added continuous creation through original ValueBarn/EventBarn→field-load→deferred fixup→FloatMult→priority/release→ValueBarn unload/recreate sequences, covering all 27 pointer aliases in three serialized orders and 14 real FloatMult subgraphs. EventBarn initializes 1280 native links, fills Event storage with original 0xcd before construction, registers loaded/active/Barn state and returns released slots to its free list. Corpus Float values and autoStart bytes are preserved; original reference indices are remapped into the local object table of up to four nodes while preserving graph relationships and original node order. All three numeric Event Object* pointers are body+8; field writes use the body. Prepared inherited autoStart member offset +0xc is evidenced by Event registration 0x100332290. Virtual metadata conversions/casts/reflection, schema/default-cache preparation, size/alignment, heap allocation/free/clear and registry startup remain explicit services. Trigger cases execute original CreateTriggerEvent 0x10032ecf0, uint32 hinted insertion 0x1003320e0, insert balancing 0x1001a7bb0, nonempty recursive destruction 0x10032fa30, GetMaxTypeIdx 0x10032f1d0, OnLevelLoad 0x10032e540, Update 0x10032ea90, Dispatch 0x10032f5b0, both original sorters 0x100330980/0x1003315d0 and Enable/SetEnabled/Start 0x10032e2f0/0x10032e2c0/0x10032ef60. All 14 real FloatMult subgraphs run through original trigger registration, field load, fixup and automatic load/update, without direct multiplication calls in automatic mode. All 31 real FloatAdd and all 4 real SetFloat configurations also execute original construction, trigger registration, original-order field load/reference remapping, OnLevelLoad and Update, with original enable/stop/re-enable requests. Compare loaded scalar fields, optional pointer fallbacks, aliased feedback, upper-before-lower clamping, one-shot same-frame finish, SetFloat load/reset/capture, variable GameTime scaling and progress completion. SetFloat logf/expf remain Linux libm service outputs captured as input/result bit pairs and replayed with input verification; original macOS libm and target-hardware math are not established. Compare every frame including the post-load state, Barn sequence counter, low Barn allocation, high load-heap baseline and complete registry/tree memory. Unique exhaustion, class-index limits, callback counter mutation/reload, uint8 wrapping, tree rotations/reuse and nonempty cleanup retain original failure side effects. Pool and scratch/load-heap boundaries remain explicit services; a vtable service queries the original max function by default and supplies boundary maxima/mutations for diagnostic cases. Reflection routes original constructor, allocation/registration and release bodies but uses a prepared single-slot release lookup. No complete TGCL/scene loading, game UI lifecycle or hardware parity is established.';
const report = { passed: failures.length === 0, executableSha256, routineCount: 40, subranges:1, cases: cases.length, comparedBytes: cases.length * (0x10000 + 0x200)+cases.filter(c=>c.tgcl).length*0x5100+rows.reduce((n,r)=>n+(r.native.frames?.length??0)*0x204+(r.input.tgcl?.trigger?4:0)+(r.native.math?.length??0)*8,0), scope,
  byKind: Object.fromEntries([...new Set(cases.map(c => c.kind))].map(k => [k, cases.filter(c => c.kind === k).length])), actualFloatInstances: cases.filter(c => c.name.startsWith('corpus-float-')).length,
  constructorConsumerSequences: cases.filter(c => c.kind === 6).length, valueBarnConsumerSequences: cases.filter(c => c.kind === 14).length,
  factoryValueBarnConsumerSequences: cases.filter(c => c.kind === 15).length,
  factoryTgclConsumerSequences:cases.filter(c=>c.kind===16).length,
  completedFactoryTgclConsumerSequences:rows.filter(r=>r.input.tgcl&&!r.native.line).length,
  unpublishedFieldFailureCases:cases.filter(c=>c.tgcl?.truncatedFields).length,
  eventCreationFailureCases:cases.filter(c=>c.tgcl?.eventFailure).length,
  standaloneEventConstructorCases:cases.filter(c=>c.kind>=17&&c.kind<=20).length,
  actualFloatMultSubgraphs:cases.filter(c=>c.tgcl?.source&&!c.tgcl.trigger).length,
  triggerCreationCases:cases.filter(c=>c.tgcl?.trigger).length,
  completedAutomaticSequences:rows.filter(r=>r.input.tgcl?.trigger?.autoDispatch&&!r.native.line).length,
  automaticCreationFailureCases:rows.filter(r=>r.input.tgcl?.trigger&&r.native.line).length,
  actualAutomaticFloatMultSubgraphs:cases.filter(c=>c.tgcl?.trigger&&c.tgcl.source&&!c.tgcl.eventClass).length,
  actualAutomaticFloatAddSubgraphs:cases.filter(c=>c.tgcl?.source&&c.tgcl.eventClass==='FloatAdd').length,
  actualAutomaticSetFloatSubgraphs:cases.filter(c=>c.tgcl?.source&&c.tgcl.eventClass==='SetFloat').length,
  numericAutomaticSequences: Object.fromEntries(['FloatMult','FloatAdd','SetFloat'].map(name=>[name,rows.filter(r=>r.input.tgcl?.trigger?.autoDispatch&&(r.input.tgcl.eventClass??'FloatMult')===name&&!r.native.line).length])),
  comparedMathServicePairs:rows.reduce((n,r)=>n+(r.native.math?.length??0),0),
  comparedFrameSnapshots:rows.reduce((n,r)=>n+(r.native.frames?.length??0),0),
  completeOriginalGameRuntime: false, failures };
if(!process.env.SKY_FOUNDATION_FILTER)fs.writeFileSync('docs/object-foundation-oracle.json', JSON.stringify(report, null, 2) + '\n');
if (report.passed&&!process.env.SKY_FOUNDATION_FILTER) fs.writeFileSync('tests/fixtures/object-foundation-native.json.gz', zlib.gzipSync(JSON.stringify({ executableSha256, scope, cases: rows }), { level: 9 }));
if(failures.length)fs.writeFileSync('/root/sky-research/trigger-foundation-failure.json',JSON.stringify(failures,null,2));
console.log(JSON.stringify({ ...report, failures: failures.slice(0, 2).map((f:any)=>({name:f.name,actualLine:f.actual.line,nativeLine:f.native.line,actualServices:f.actual.services,nativeServices:f.native.services,objectEqual:f.actual.objectHex===f.native.objectHex,barnEqual:f.actual.eventBarnHex===f.native.eventBarnHex,registryEqual:f.actual.registrySha256===f.native.registrySha256,framesEqual:JSON.stringify(f.actual.frames)===JSON.stringify(f.native.frames)})) })); if (!report.passed) process.exitCode = 1;
