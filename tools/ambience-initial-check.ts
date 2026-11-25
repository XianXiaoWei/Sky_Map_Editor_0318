import { createHash } from 'node:crypto';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import evidence from '../docs/ambience-initial-fields.json';
import { initialAmbienceFields } from '../src/core/ambience-initial';

async function main() {
  const executable=process.argv[2];if(!executable)throw new Error('Supply original Sky executable');
  if(createHash('sha256').update(await fs.readFile(executable)).digest('hex')!==evidence.executableSha256)throw new Error('Executable version mismatch');
  const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-ambience-initial-'));
  try {
    const runner=path.join(temp,'oracle');
    const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-static','tools/native-atmosphere-oracle.c','-lm','-o',runner],{encoding:'utf8'});
    if(build.status!==0)throw new Error(build.stderr);
    const inputs=[{quality:0,color:[1,1,1,1]},{quality:1,color:[1,1,1,1]},{quality:4,color:[.25,.5,.75,0]},{quality:0xffffffff,color:[2,3,4,.5]}];
    const bytes=Buffer.concat(inputs.map(input=>{const b=Buffer.alloc(20);b.writeUInt32LE(input.quality);input.color.forEach((v,i)=>b.writeFloatLE(v,4+i*4));return b;}));
    const run=spawnSync('qemu-x86_64',['-cpu','max',runner,executable,'--initial'],{input:bytes});
    if(run.status!==0 || run.stdout.length!==inputs.length*0x290)throw new Error(`Original initialization oracle failed (${run.status}): ${run.stderr}`);
    let comparedBytes=0;const failures:unknown[]=[];
    for(const [i,input] of inputs.entries()) {
      const actual=initialAmbienceFields(input.color,input.quality);
      for(const group of evidence.groups)for(const field of group.fields) {
        const start=group.offset+field.nativeOffset;
        const native=run.stdout.subarray(i*0x290+start,i*0x290+start+field.bytes),output=Buffer.from(actual.storage.subarray(start,start+field.bytes));
        comparedBytes+=field.bytes;
        if(!output.equals(native))failures.push({case:i,group:group.className,field:field.name,actual:output.toString('hex'),native:native.toString('hex')});
      }
    }
    const report={passed:failures.length===0,executableSha256:evidence.executableSha256,cases:inputs.length,groups:evidence.groups.length,fieldsPerCase:evidence.groups.reduce((n,g)=>n+g.fields.length,0),comparedBytes,
      scope:'Original Ambience.Initialize field stores 0x100059a50..0x100059c4c; endpoint routed to original checked epilogue; unrelated noise generation callback is a no-op',
      limitation:'Color global and settings are explicit inputs; six groups only; no GPU initialization, map events, FogVolume/Cloud initial values or game-image comparison.',failures};
    await fs.writeFile('docs/ambience-initial-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
    if(report.passed)await fs.writeFile('tests/fixtures/ambience-initial-native.json',JSON.stringify({executableSha256:evidence.executableSha256,scope:report.scope,
      cases:inputs.map((input,i)=>({...input,nativeHex:run.stdout.subarray(i*0x290,(i+1)*0x290).toString('hex')}))},null,2)+'\n');
    if(!report.passed)process.exitCode=1;
  }finally{await fs.rm(temp,{recursive:true,force:true});}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
