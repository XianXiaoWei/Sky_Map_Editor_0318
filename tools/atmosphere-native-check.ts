import { createHash } from 'node:crypto';
import { mkdtemp, readFile, writeFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';
import { sampleSkyTints, sampleCheapFogTints, sampleAtmosphereRay, skyTintLookup, type SkyTints, type AtmosphereRayInput } from '../src/core/atmosphere';

async function main() {
const executable = process.argv[2];
if (!executable) throw new Error('Usage: tsx tools/atmosphere-native-check.ts /path/to/Sky');
const executableSha256 = createHash('sha256').update(await readFile(executable)).digest('hex');
if (executableSha256 !== '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20') throw new Error('Requires the original supplied executable');
const f = Math.fround;
let seed = 318641;
const random = () => { seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0; return seed / 0x100000000; };
const vec = () => Array.from({length: 4}, () => f(random()*2));
const bytes: Buffer[] = [], cases: {kind: string; input: unknown; expected: number[]}[] = [];
function tag(value: number) { const out=Buffer.alloc(4); out.writeUInt32LE(value); bytes.push(out); }
function floats(values: Iterable<number>) { const array=Array.from(values), out=Buffer.alloc(array.length*4); array.forEach((v,i)=>out.writeFloatLE(v,i*4)); bytes.push(out); }
const tints: SkyTints[] = [
  {tintBot:[1,0,0,1],tintMidBot:[1,.2,0,1],tintMidMid:[1,1,0,1],tintMidTop:[0,0,1,1],tintTop:[0,.05,1,1]},
  ...Array.from({length: 12},()=>({tintBot:vec(),tintMidBot:vec(),tintMidMid:vec(),tintMidTop:vec(),tintTop:vec()}))
];
for (const colors of tints) for (const coordinate of [-1,-.25,0,.1,.25,.5,.75,1,1.25,2]) for (const sharpness of [0,1,10,50]) {
  for (const cheap of [false,true]) {
    const height=f(.25+random()*12);
    tag(cheap?1:0); floats([coordinate,sharpness,height]);
    floats([...colors.tintBot,...colors.tintMidBot,...colors.tintMidMid,...colors.tintMidTop,...colors.tintTop]);
    cases.push({kind:cheap?'cheapFog':'sky',input:{colors,coordinate,sharpness,height},expected:cheap?sampleCheapFogTints(colors,coordinate,sharpness,height):sampleSkyTints(colors,coordinate,sharpness)});
  }
}
for (let i=0;i<240;i++) {
  const direction=i<6?[[1,0,0,0],[-1,0,0,0],[0,1,0,0],[0,-1,0,0],[0,0,1,0],[0,0,-1,0]][i]:[random()-.5,random()-.5,random()-.5,0];
  const length=Math.hypot(...direction.slice(0,3)); for(let j=0;j<3;j++)direction[j]=f(direction[j]/length);
  const input:AtmosphereRayInput={eye:[f(random()*1000),f(i%8===0?0:random()*2400),f(random()*1000),1],direction,
    planetSphere:[0,-640000,0,640000],sunDirection:[f(-Math.SQRT1_2),f(-Math.SQRT1_2),0,0],
    sunColor:vec(),averageSkyboxColor:vec(),atmosphereSunColor:vec(),atmosphereDensity:f(i%7===0?0:random()*.02),
    fogDensity:f(i%11===0?0:random()*.02),fogHeight:f(.1+random()*5),atmosphereSample:f(random()*10),
    // Native and TS use identical LUT bytes, so this independently checks rays.
    tintLookup:skyTintLookup(tints[i%tints.length])};
  tag(2); floats([...input.eye,...input.direction,...input.planetSphere,...input.sunDirection,...input.sunColor,...input.averageSkyboxColor,...input.atmosphereSunColor,
    input.atmosphereDensity,input.fogDensity,input.fogHeight,input.atmosphereSample,...input.tintLookup]);
  cases.push({kind:'ray',input:{...input,tintLookup:Array.from(input.tintLookup)},expected:sampleAtmosphereRay(input)});
}
const temporary=await mkdtemp(join(tmpdir(),'sky-atmosphere-'));
try {
  const runner=join(temporary,'oracle');
  const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-static','tools/native-atmosphere-oracle.c','-lm','-o',runner],{encoding:'utf8'});
  if(build.status!==0)throw new Error(build.stderr);
  const run=spawnSync('qemu-x86_64',['-cpu','max',runner,executable],{input:Buffer.concat(bytes),maxBuffer:16*1024*1024});
  if(run.status!==0)throw new Error(`Native atmosphere oracle failed ${run.status}: ${run.stderr}`);
  if(run.stdout.length!==cases.length*16)throw new Error('Unexpected native output length');
  let mismatches=0,maxAbsoluteError=0,maxUlp=0,nonfiniteComponents=0;
  const failures:unknown[]=[];
  const perKind:Record<string,{components:number;mismatches:number;maxAbsoluteError:number;maxUlp:number}>={};
  const bits=(v:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(v);return b.readUInt32LE();};
  const ordered=(v:number)=>{const b=bits(v);return b&0x80000000?0x80000000-(b&0x7fffffff):0x80000000+b;};
  cases.forEach((c,i)=>c.expected.forEach((value,lane)=>{
    const native=run.stdout.readFloatLE(i*16+lane*4), finite=Number.isFinite(value)&&Number.isFinite(native);
    const error=finite?Math.abs(value-native):0, ulp=finite?Math.abs(ordered(value)-ordered(native)):0;
    if(!finite)nonfiniteComponents++;
    const stats=perKind[c.kind]??={components:0,mismatches:0,maxAbsoluteError:0,maxUlp:0}; stats.components++;
    maxAbsoluteError=Math.max(maxAbsoluteError,error);maxUlp=Math.max(maxUlp,ulp);
    stats.maxAbsoluteError=Math.max(stats.maxAbsoluteError,error);stats.maxUlp=Math.max(stats.maxUlp,ulp);
    if(bits(value)!==bits(native)){mismatches++;stats.mismatches++;if(failures.length<24)failures.push({case:i,kind:c.kind,lane,actual:Number.isFinite(value)?value:String(value),native:Number.isFinite(native)?native:String(native),actualBits:bits(value).toString(16),nativeBits:bits(native).toString(16),error,ulp,input:c.input});}
  }));
  const report={executableSha256,passed:mismatches===0,comparison:'exact float32 bits; no tolerance',
    runtime:'QEMU x86_64 -cpu max; unmodified game functions 0x100064820, 0x100064a20, 0x100064c60; imported expf/exp2f bound to Linux libm',
    limitation:'Explicit runtime inputs; does not validate event initialization, macOS libm, probe generation or the viewport.',
    cases:cases.length,components:cases.length*4,nonfiniteComponents,mismatches,maxAbsoluteError,maxUlp,perKind,failures};
  await writeFile('docs/atmosphere-native-check.json',JSON.stringify(report,null,2)+'\n');
  if(report.passed) {
    const selected=[0,19,36,79,160,519,1000,1040,1041,1042,1043,1044,1045,1139,1279];
    await writeFile('tests/fixtures/atmosphere-native.json',JSON.stringify({executableSha256,runtime:report.runtime,
      cases:selected.map(index=>({kind:cases[index].kind,input:cases[index].input,nativeHex:run.stdout.subarray(index*16,index*16+16).toString('hex')}))},null,2)+'\n');
  }
  console.log(JSON.stringify({...report,failures:failures.length}));
  if(!report.passed)process.exitCode=1;
} finally {await rm(temporary,{recursive:true,force:true});}
}
main().catch(error=>{console.error(error);process.exitCode=1;});
