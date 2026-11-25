/** Profile the existing full cloud check without changing its pixels, passes
 * or historical report. Measures host wall time/CPU and binary transfer, not
 * Windows GPU timestamps or complete original-game frame equivalence. */
import fs from 'node:fs';
import path from 'node:path';
import {VulkanHost} from '../src/main/vulkan';

const target=process.env.SKY_FULL_PROFILE_REPORT??'/root/sky-research/full-preview-baseline.json';
const historical='docs/viewport-cloud-check.json',saved=fs.existsSync(historical)?fs.readFileSync(historical):undefined;
const proto=VulkanHost.prototype as any;
const totals:Record<string,{calls:number;milliseconds:number;responseBytes:number}>={};
const writes:Record<string,{calls:number;bytes:number}>={};
const started=performance.now(),cpu=process.cpuUsage();
for(const name of ['setViewportCore','setMaterialScene','setCachedMaterialScene','setMaterialBatch','setFullStage','fullFrame','viewportHDR','viewportAlpha','materialFrame']) {
  const original=proto[name];
  proto[name]=async function(...args:any[]) {
    const began=performance.now(),result=await original.apply(this,args);
    const row=totals[name]??={calls:0,milliseconds:0,responseBytes:0};row.calls++;row.milliseconds+=performance.now()-began;
    if(result?.attachments)row.responseBytes+=result.attachments.reduce((n:number,b:Float32Array)=>n+b.byteLength,0);
    if(result?.pixels)row.responseBytes+=result.pixels.byteLength;
    return result;
  };
}
const originalWrite=proto.write;
proto.write=async function(bytes:Buffer) {
  const operation=String(bytes.readUInt32LE(0)),row=writes[operation]??={calls:0,bytes:0};row.calls++;row.bytes+=bytes.length;
  return originalWrite.call(this,bytes);
};
process.once('beforeExit',()=>{
  const result=fs.existsSync(historical)?JSON.parse(fs.readFileSync(historical,'utf8')):undefined;
  const usage=process.cpuUsage(cpu),report={passed:process.exitCode!==1&&result?.passed===true,scope:'Real full terrain/cloud/transparent/depth/TAA/Tonemap preview from viewport-cloud-check. Host CPU and binary transport timings on Linux software Vulkan; no Windows GPU/FPS or full-game effect acceptance.',elapsedMs:performance.now()-started,hostCpuMs:(usage.user+usage.system)/1000,totals,writes,readbackBytes:Object.values(totals).reduce((n,r)=>n+r.responseBytes,0),uploadedBytes:Object.values(writes).reduce((n,r)=>n+r.bytes,0),viewport:result};
  fs.mkdirSync(path.dirname(target),{recursive:true});fs.writeFileSync(target,JSON.stringify(report,null,2)+'\n');
  if(saved)fs.writeFileSync(historical,saved);else if(fs.existsSync(historical))fs.unlinkSync(historical);
  console.log(JSON.stringify({...report,viewport:undefined}));
});
process.env.SKY_CHECK_WIDTH??='320';process.env.SKY_CHECK_FRAMES='2';
if(process.argv.length===2)process.argv.push('Dawn');
void import('./viewport-cloud-check');
