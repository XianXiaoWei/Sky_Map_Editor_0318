import fs from 'node:fs/promises';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';

const sha=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const inventory=JSON.parse(await fs.readFile('docs/Objects.level.bin类进度.json','utf8'));
const priority=['Storm','StormEnd','Sunset','SunsetEnd','SunsetEnd2','SunsetRace','TitleWater','CarryLand3','SkyHub2','Night','RainForest','DayHubCave','Prairie_Cave','Dawn'];
const levels=[...priority,...inventory.files.map(m=>m.level).filter(l=>!priority.includes(l)&&l!=='WorldEmpty'),'WorldEmpty'];
assert.equal(new Set(levels).size,33);
assert.deepEqual(levels.slice().sort(),inventory.files.map(m=>m.level).sort());
const buildFiles=['dist/main.cjs','dist/preload.cjs','dist/app.js','dist/index.html','dist/style.css','dist/classes.json','dist/native/sky-vulkan','dist/native/sky-vulkan.exe'];
const fingerprint=async()=>Object.fromEntries(await Promise.all(buildFiles.map(async file=>[file,sha(await fs.readFile(file))])));
const testedBuildPayloadSha256=await fingerprint();
const batchSize=Number(process.env.SKY_SMOKE_BATCH_SIZE??3);assert.ok(Number.isInteger(batchSize)&&batchSize>=1&&batchSize<=3);
const output='docs/model-coverage-smoke.json';
let aggregate={passed:false,maps:[],errors:[],runs:[],testedBuildPayloadSha256,scope:'Actual Electron map loading and full Vulkan compositor across all maps, in fresh processes of at most three maps per batch. Saved visible LevelMesh bindings, default animation geometry changes, FogVolume, map resets, screenshots and source preservation are checked. Desktop hardware performance and original Metal pixel parity are not claimed.'};
if(process.argv.includes('--resume')){
 aggregate=JSON.parse(await fs.readFile(output,'utf8'));
 assert.deepEqual(aggregate.testedBuildPayloadSha256,testedBuildPayloadSha256,'Verified batch build changed');
 for(const run of aggregate.runs){const bytes=await fs.readFile(run.report);assert.equal(sha(bytes),run.sha256);assert.equal(JSON.parse(bytes).passed,true);}
 delete aggregate.error;
}
try{
 for(let start=0;start<levels.length;start+=batchSize){
  const selected=levels.slice(start,start+batchSize).filter(level=>!aggregate.maps.some(m=>m.level===level));
  if(!selected.length)continue;
  const reportFile=`docs/model-coverage-batch-${String(start+1).padStart(2,'0')}-size-${batchSize}-smoke.json`;
  console.log(JSON.stringify({batch:start/batchSize+1,levels:selected}));
  execFileSync('xvfb-run',['-a',process.execPath,'tools/model-coverage-smoke.mjs'],{stdio:'inherit',env:{...process.env,SKY_SMOKE_LEVELS:selected.join(','),SKY_SMOKE_REPORT:reportFile}});
  const bytes=await fs.readFile(reportFile),report=JSON.parse(bytes);
  assert.equal(report.passed,true);assert.deepEqual(report.errors,[]);
  assert.deepEqual(report.maps.map(m=>m.level),selected);
  assert.deepEqual(await fingerprint(),testedBuildPayloadSha256,'Build changed during integration check');
  aggregate.maps.push(...report.maps);
  aggregate.runs.push({report:reportFile,sha256:sha(bytes),levels:selected});
  await fs.writeFile(output,JSON.stringify(aggregate,null,2)+'\n');
 }
 assert.deepEqual(aggregate.maps.map(m=>m.level),levels);
 aggregate.passed=true;
}catch(error){aggregate.error=String(error);process.exitCode=1;}
await fs.writeFile(output,JSON.stringify(aggregate,null,2)+'\n');
console.log(JSON.stringify({passed:aggregate.passed,maps:aggregate.maps.length,error:aggregate.error}));
