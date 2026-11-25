import { createHash } from 'node:crypto';
import { mkdtemp, readFile, writeFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';
import { reduceProbe, packProbeHalf, probeUniforms, type ProbeState, type ProbeSamples } from '../src/core/probe';
import { PROBE_EXECUTABLE_SHA256, PROBE_TABLE_SHA256, PROBE_HALF_TABLE_SHA256, probeMipIndices, probeHalfBase, probeHalfShift } from '../src/core/probe-tables';

async function main() {
  const executable=process.argv[2];
  if(!executable) throw new Error('Usage: tsx tools/probe-native-check.ts /path/to/Sky');
  const sha=(data:Uint8Array)=>createHash('sha256').update(data).digest('hex');
  if(sha(await readFile(executable))!==PROBE_EXECUTABLE_SHA256) throw new Error('Requires original supplied executable');
  const temporary=await mkdtemp(join(tmpdir(),'sky-probe-'));
  try {
    const runner=join(temporary,'oracle');
    const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-static','tools/native-probe-oracle.c','-o',runner],{encoding:'utf8'});
    if(build.status!==0) throw new Error(build.stderr);
    const execute=(args:string[],input?:Buffer)=>{
      const run=spawnSync('qemu-x86_64',['-cpu','max',runner,executable,...args],{input,maxBuffer:32*1024*1024});
      if(run.status!==0) throw new Error(`Probe oracle failed ${run.status}: ${run.stderr}`);
      return run.stdout;
    };
    const nativeTables=execute(['--table']), table=Buffer.alloc(32736*4);
    probeMipIndices.forEach((v,i)=>table.writeUInt32LE(v,i*4));
    if(!table.equals(nativeTables.subarray(0,130944)) || sha(table)!==PROBE_TABLE_SHA256) throw new Error('Cross-face table mismatch');
    const halfTables=Buffer.alloc(1536); probeHalfBase.forEach((v,i)=>halfTables.writeUInt16LE(v,i*2)); halfTables.set(probeHalfShift,1024);
    if(!halfTables.equals(nativeTables.subarray(130944)) || sha(halfTables)!==PROBE_HALF_TABLE_SHA256) throw new Error('Half table mismatch');
    let seed=618318;
    const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/0x100000000;};
    const chunks:Buffer[]=[], cases:{state:ProbeState;samples:ProbeSamples;hardware:boolean}[]=[];
    const bytes=(array:Float32Array)=>Buffer.from(array.buffer,array.byteOffset,array.byteLength);
    for(const count of [0,1,32,384]) for(const hardware of [false,true]) for(let kind=0;kind<4;kind++) {
      const state:ProbeState={history:Float32Array.from({length:6144*4},(_,i)=>kind===0?0:kind===1?((i>>2)%1024)/32+(i/4096|0)*16:random()*4),
        sh:Float32Array.from({length:27},()=>random()*2-1)};
      const samples:ProbeSamples={coordinates:new Float32Array(count*4),directions:new Float32Array(count*4),colors:new Float32Array(count*4)};
      for(let i=0;i<count;i++) {
        const x=random()-.5,y=random()-.5,z=random()-.5,length=Math.hypot(x,y,z);
        samples.directions.set([x/length,y/length,z/length,0],i*4);
        samples.coordinates.set([kind===2?0:i%6,kind===2?0:random(),kind===2?0:random(),0],i*4);
        samples.colors.set(Array.from({length:4},()=>kind===3?random()*-.5:random()*8),i*4);
      }
      const header=Buffer.alloc(8);header.writeUInt32LE(count);header.writeUInt32LE(Number(hardware),4);
      chunks.push(header,bytes(state.sh),bytes(state.history),bytes(samples.coordinates),bytes(samples.directions),bytes(samples.colors));
      cases.push({state,samples,hardware});
    }
    const native=execute([],Buffer.concat(chunks)), stride=27*4+8190*16+32760*2;
    if(native.length!==cases.length*stride) throw new Error('Unexpected reduction length');
    const failures:unknown[]=[], stats={shComponents:0,cubeComponents:0,halfWords:0,mismatches:0};
    for(let i=0;i<cases.length;i++) {
      const c=cases[i], result=reduceProbe(c.state,c.samples,c.hardware);
      let offset=i*stride;
      for(const [kind,actual,size] of [['sh',result.sh,4],['cube',result.cube,4],['half',result.half,2]] as const) {
        const data=new DataView(actual.buffer,actual.byteOffset,actual.byteLength);
        for(let j=0;j<actual.length;j++) {
          const expected=size===4?native.readUInt32LE(offset+j*size):native.readUInt16LE(offset+j*size);
          const value=size===4?data.getUint32(j*size,true):data.getUint16(j*size,true);
          stats[kind==='sh'?'shComponents':kind==='cube'?'cubeComponents':'halfWords']++;
          if(value!==expected) {stats.mismatches++;if(failures.length<24)failures.push({case:i,kind,index:j,actualBits:value.toString(16),nativeBits:expected.toString(16)});}
        }
        offset+=actual.byteLength;
      }
    }
    // Exercise all exponent/sign buckets, NaN payloads, halfway rounding,
    // overflow and original scalar tails. These are conversion tests only.
    const raw:number[]=[];
    for(let sign=0;sign<2;sign++) for(let exponent=0;exponent<256;exponent++)
      for(const mantissa of [0,1,0xfff,0x1000,0x1001,0x2000,0x3000,0x3fffff,0x400000,0x7fffff]) raw.push(((sign<<31)|(exponent<<23)|mantissa)>>>0);
    const halfChunks:Buffer[]=[], halfCases:{values:Float32Array;hardware:boolean}[]=[];
    for(const length of [0,1,2,3,4,5,7,16,raw.length]) for(const hardware of [false,true]) {
      const bits=Uint32Array.from(length<raw.length ? raw.slice(1130,1130+length) : raw);
      const values=new Float32Array(bits.buffer), h=Buffer.alloc(8);h.writeUInt32LE(length);h.writeUInt32LE(Number(hardware),4);
      halfChunks.push(h,bytes(values));halfCases.push({values,hardware});
    }
    const nativeHalf=execute(['--half'],Buffer.concat(halfChunks));let offset=0,conversionWords=0;
    for(const [index,c] of halfCases.entries()) {
      const actual=packProbeHalf(c.values,c.hardware);
      for(let j=0;j<actual.length;j++) {const expected=nativeHalf.readUInt16LE(offset+j*2);conversionWords++;
        if(actual[j]!==expected){stats.mismatches++;if(failures.length<24)failures.push({kind:'halfConversion',case:index,index:j,actualBits:actual[j].toString(16),nativeBits:expected.toString(16)});}}
      offset+=actual.byteLength;
    }
    if(offset!==nativeHalf.length) throw new Error('Unexpected half conversion length');
    const flushed=execute(['--flush'],Buffer.concat(cases.map(c=>bytes(c.state.sh))));
    const nativeSampler=execute(['--sampler']);
    if(nativeSampler.length!==72) throw new Error('Unexpected sampler capture length');
    const samplerFields=Array.from({length:9},(_,i)=>nativeSampler.readUInt32LE(i*4));
    const metalSampler=Array.from({length:9},(_,i)=>nativeSampler.readUInt32LE(36+i*4));
    if(JSON.stringify(samplerFields)!==JSON.stringify([2,2,2,0,0,2,4294966296,1000,1])
      || JSON.stringify(metalSampler)!==JSON.stringify([0,0,2,1,1,2,3296329728,1148846080,1])) throw new Error('Original sampler descriptor mismatch');
    const flushStride=36*12+136;
    if(flushed.length!==cases.length*flushStride) throw new Error('Unexpected native flush length');
    let flushComponents=0,uploadsVerified=0;
    for(const [index,c] of cases.entries()) {
      let at=index*flushStride;
      for(let mip=0;mip<6;mip++) for(let face=0;face<6;face++) {
        const n=32>>mip, word=32768-32*n*n+4*n*n*face;
        if(flushed.readUInt32LE(at)!==face || flushed.readUInt32LE(at+4)!==mip || flushed.readUInt32LE(at+8)!==word)
          throw new Error('Original mip-major upload layout mismatch');
        at+=12;uploadsVerified++;
      }
      const uniforms=probeUniforms(c.state.sh), lanes=[...uniforms.u_averageProbeColor,0,
        ...uniforms.u_probeShR0,...uniforms.u_probeShR1,c.state.sh[24],
        ...uniforms.u_probeShG0,...uniforms.u_probeShG1,c.state.sh[25],
        ...uniforms.u_probeShB0,...uniforms.u_probeShB1,c.state.sh[26],...uniforms.u_probeShRGB2];
      const actual=bytes(new Float32Array(lanes));
      for(let j=0;j<34;j++) {flushComponents++;const value=actual.readUInt32LE(j*4),expected=flushed.readUInt32LE(at+j*4);
        if(value!==expected){stats.mismatches++;if(failures.length<24)failures.push({kind:'flushUniform',case:index,index:j,actualBits:value.toString(16),nativeBits:expected.toString(16)});}}
    }
    const report={executableSha256:PROBE_EXECUTABLE_SHA256,passed:stats.mismatches===0,comparison:'exact float32 and uint16 bits; no tolerance',
      runtime:'QEMU x86_64 -cpu max; original 0x10005cb80 constructor, 0x10006103b reduction and 0x1007ec050 half conversion',
      oracleIsolation:'Original job prologue jumps to reduction after stack guard setup; scene raycast/color stage is explicit supplied input. Imported bzero bound to memset.',
      limitation:'Does not validate scene intersections/material colors, original sample jitter, full startup, Metal driver or viewport parity.',
      sampler:{fields:samplerFields,metalSetters:metalSampler,scope:'Original descriptor copy and Metal API setter arguments; GPU creation captured, no Metal driver'},
      table:{sha256:sha(table),indices:probeMipIndices.length,outputPixels:2046,crossFaceTaps:2736},cases:cases.length,...stats,conversionWords,flushComponents,uploadsVerified,failures};
    await writeFile('docs/probe-native-check.json',JSON.stringify(report,null,2)+'\n');
    if(report.passed) {
      const index=cases.findIndex(c=>c.hardware&&c.samples.colors.length===128), c=cases[index], start=index*stride;
      await writeFile('tests/fixtures/probe-native.json',JSON.stringify({executableSha256:PROBE_EXECUTABLE_SHA256,
        state:{historyBase64:bytes(c.state.history).toString('base64'),sh:Array.from(c.state.sh)},
        samples:Object.fromEntries(Object.entries(c.samples).map(([k,v])=>[k,Array.from(v)])),hardware:c.hardware,
        shHex:native.subarray(start,start+108).toString('hex'),cubeSha256:sha(native.subarray(start+108,start+108+8190*16)),
        halfSha256:sha(native.subarray(start+108+8190*16,start+stride))},null,2)+'\n');
    }
    console.log(JSON.stringify({...report,failures:report.failures}));
    if(!report.passed)process.exitCode=1;
  } finally {await rm(temporary,{recursive:true,force:true});}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
