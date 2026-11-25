import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { ObjectsDocument } from '../src/core/objects';
import { describeEnvironment } from '../src/core/environment-storage';
import { initialAmbienceFields } from '../src/core/ambience-initial';
import { ORIGINAL_AMBIENCE_WHITE, originalAmbiencePlanetSphere } from '../src/core/ambience-sun-runtime';
import { evaluateAmbienceSunCase, type AmbienceSunCase, type AmbienceSunTrace } from './ambience-sun-cases';
import type { EnvValue } from '../src/core/environment';

const executable = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha = (b: Uint8Array) => crypto.createHash('sha256').update(b).digest('hex');
const executableSha256 = sha(fs.readFileSync(executable));
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires original Sky executable');
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const cases: AmbienceSunCase[] = [];
function add(label: string, sun: Record<string, EnvValue>, sky: Record<string, EnvValue>, eye: number[]) {
  cases.push({ label, input: { color: sun.sunColor as number[], intensity: Number(sun.sunInt), angleXZ: Number(sun.sunAngleXZ), angleY: Number(sun.sunAngleY),
    cheapFog: Number(sky.cheapFogEnabled), atmosphereDensity: Number(sky.atmosphereDensity),
    tints: { tintBot: sky.tintBot as number[], tintMidBot: sky.tintMidBot as number[], tintMidMid: sky.tintMidMid as number[], tintMidTop: sky.tintMidTop as number[], tintTop: sky.tintTop as number[] },
    eye: [...eye.slice(0,3),1], planetSphere: originalAmbiencePlanetSphere(eye), white: [...ORIGINAL_AMBIENCE_WHITE] } });
}
const initial = initialAmbienceFields([...ORIGINAL_AMBIENCE_WHITE],1).outputs;
for (const eye of [[0,0,0],[12,-100,7],[300,800,-50],[100,3000,200]]) add(`no-EnvNode/${eye.join(',')}`, initial.AmbienceSun, initial.AmbienceSky, eye);
for (const angleY of [-90,-1,0,2.9,30,90,120]) for (const angleXZ of [0,47,180]) for (const cheapFog of [0,1]) for (const density of [0,1,5])
  add(`boundary/${angleY}/${angleXZ}/${cheapFog}/${density}`, { ...initial.AmbienceSun, sunAngleXZ: angleXZ, sunAngleY: angleY, sunInt: .7 }, { ...initial.AmbienceSky, cheapFogEnabled: cheapFog, atmosphereDensity: density }, [12,500,-30]);
const preparedCases = cases.length, hashes: Record<string,string> = {};
let corpusNodes = 0, corpusEnvNodes = 0;
for (const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file = path.join(data,'Levels',level,'Objects.level.bin'); if (!fs.existsSync(file)) continue;
  const bytes = fs.readFileSync(file), nodes = new ObjectsDocument(bytes).nodes; hashes[level] = sha(bytes);
  for (const node of nodes.filter(n=>['EnvNode','SetEnvDefault','SetEnvHull'].includes(n.className))) {
    const info = describeEnvironment(node,nodes), sun = info.groups.find(g=>g.className==='AmbienceSun')!, sky = info.groups.find(g=>g.className==='AmbienceSky')!;
    if (!sun.complete || !sky.complete) throw new Error(`${level}/#${node.id}: missing sun/sky storage`);
    const eye = info.region?.hull?.position ?? [0,0,0];
    add(`${level}/#${node.id}/${node.className}`, Object.fromEntries(sun.fields.map(f=>[f.name,f.value!])), Object.fromEntries(sky.fields.map(f=>[f.name,f.value!])), eye);
    corpusNodes++; if (node.className==='EnvNode') corpusEnvNodes++;
  }
}
const bytes = Buffer.alloc(4 + cases.length * 164); bytes.writeUInt32LE(cases.length);
for (const [i,c] of cases.entries()) {
  const s = c.input, colors = ['tintBot','tintMidBot','tintMidMid','tintMidTop','tintTop'].flatMap(name=>s.tints[name as keyof typeof s.tints]);
  const floats = [...s.color,s.angleXZ,s.angleY,s.intensity,s.atmosphereDensity,...colors,...s.eye,...s.planetSphere,...s.white!];
  floats.forEach((v,j)=>bytes.writeFloatLE(v,4+i*164+j*4)); bytes.writeUInt32LE(s.cheapFog>>>0,4+i*164+160);
}
const temp = fs.mkdtempSync(path.join(os.tmpdir(),'sky-ambience-sun-'));
let native: Buffer;
try {
  const runner = path.join(temp,'oracle');
  const build = spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-ambience-sun-oracle.c','-lm','-o',runner]);
  if (build.status !== 0) throw new Error(build.stderr.toString());
  const run = spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:bytes,maxBuffer:20e6,timeout:60000});
  if (run.status !== 0) throw new Error(`Native sun failed: ${run.status} ${run.stderr}`);
  native=run.stdout;
} finally { fs.rmSync(temp,{recursive:true,force:true}); }
const white = Buffer.alloc(16); ORIGINAL_AMBIENCE_WHITE.forEach((v,i)=>white.writeFloatLE(v,i*4));
if (!native.subarray(0,16).equals(white) || native.readUInt32LE(16)!==cases.length) throw new Error('Original Color initializer or case count differs');
let offset=20, libmCalls=0;const failures:unknown[]=[], jsDifferences:unknown[]=[], fixtures:unknown[]=[];
for (const c of cases) {
  const output=native.subarray(offset,offset+52);offset+=52;
  const count=native.readUInt32LE(offset);offset+=4;
  const trace:AmbienceSunTrace=Array.from({length:count},()=>{const t=Array.from({length:4},(_,j)=>native.readUInt32LE(offset+j*4)) as [number,number,number,number];offset+=16;return t;});libmCalls+=count;
  try {const result=evaluateAmbienceSunCase(c,trace);if(!result.bytes.equals(output))failures.push({label:c.label,actual:result.bytes.toString('hex'),native:output.toString('hex')});}
  catch(e){failures.push({label:c.label,error:String(e)});}
  try {const js=evaluateAmbienceSunCase(c);if(!js.bytes.equals(output))jsDifferences.push({label:c.label,actual:js.bytes.toString('hex'),native:output.toString('hex')});}catch(e){jsDifferences.push({label:c.label,error:String(e)});}
  fixtures.push({case:c,trace,native:output.toString('base64')});
}
if(offset!==native.length)throw new Error('Invalid native output length');
const scope='Whole original Color static initializer 0x10077dcb0; original Ambience.Update derived-sun instructions 0x10005b39c..0x10005b6e2, original direction helper 0x100064550, original sky Gaussian sampler 0x100064820. Explicit camera position/prior planet sphere and traced Linux sinf/cosf/powf/expf/exp2f services. Compare every libm argument/result bit and 13 output float32 lanes; regular and cheapFog branches. Corpus saved public groups are prepared inputs, not proof of event/default enable or full scene initialization. Full Ambience update/probes, original startup/planet timing, non-finite/invalid memory, macOS libm, GPU/image parity remain separate.';
const report={passed:failures.length===0,executableSha256,scope,cases:cases.length,preparedCases,corpusNodes,corpusEnvNodes,sourceMaps:Object.keys(hashes).length,libmCalls,comparedOutputBytes:cases.length*52+16,jsMathDifferingCases:jsDifferences.length,failures,sourceHashes:hashes};
fs.writeFileSync('docs/ambience-sun-oracle.json',JSON.stringify(report,null,2)+'\n');fs.writeFileSync('docs/ambience-sun-js-boundary.json',JSON.stringify({scope:'JS libm versus original instructions with Linux float libm; differences are not original macOS parity failures',cases:cases.length,differences:jsDifferences},null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/ambience-sun-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,cases:fixtures})));
console.log(JSON.stringify({...report,sourceHashes:undefined}));if(!report.passed)process.exitCode=1;
