import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';

const source=path.resolve(process.env.SKY_PACKAGE_ROOT??'release/shader-hotfix-test/SkyMapEditor-Windows-x64');
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const levels=(process.env.SKY_SMOKE_LEVELS??'Dawn,Rain,RainEnd,CandleSpace').split(',');
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-shader-package-')),runtime=path.join(temp,'runtime'),profile=path.join(temp,'profile');
const report={passed:false,packaged:false,compilerExecutablesAvailable:false,emptyInitialProfile:true,maps:[],errors:[],windowsHardwareTested:false,scope:'Shipped ASAR and patched shader resources on Linux/Vulkan with no compiler executable or prior shader cache.'};
let app,page;
try{
 await fs.cp('node_modules/electron/dist',runtime,{recursive:true});await fs.rename(path.join(runtime,'electron'),path.join(runtime,'SkyMapEditor'));
 await fs.copyFile(path.join(source,'resources/app.asar'),path.join(runtime,'resources/app.asar'));
 report.asarSha256=crypto.createHash('sha256').update(await fs.readFile(path.join(runtime,'resources/app.asar'))).digest('hex');
 await fs.mkdir(path.join(runtime,'resources/native'),{recursive:true});await fs.copyFile('dist/native/sky-vulkan',path.join(runtime,'resources/native/sky-vulkan'));
 await fs.cp(path.join(source,'resources/vulkan-shaders'),path.join(runtime,'resources/vulkan-shaders'),{recursive:true});
 app=await electron.launch({executablePath:path.join(runtime,'SkyMapEditor'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+profile],cwd:temp,env:{...process.env,PATH:path.join(temp,'no-compiler'),LP_NUM_THREADS:'1',OMP_NUM_THREADS:'1',GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 assert.equal(await app.evaluate(({app})=>app.isPackaged),true);report.packaged=true;
 page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));
 await page.addStyleTag({content:'#viewport{width:160px;height:120px}'});
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 for(const level of levels){
  await page.locator('#levels').selectOption(level);
  await page.waitForFunction(level=>document.querySelector('#viewport canvas')?.dataset.level===level&&document.body.getAttribute('aria-busy')==='false',level,{timeout:240000});
  const sequence=await page.locator('#viewport canvas').evaluate(c=>Number(c.dataset.frameSequence));
  await page.waitForFunction(n=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>n+1,sequence,{timeout:120000});
  const modes=[];
  for(const mode of ['smooth','balanced','native']){
   const before=await page.locator('#viewport canvas').evaluate(c=>Number(c.dataset.frameSequence));await page.locator('#viewport-quality').selectOption(mode);
   await page.waitForFunction(n=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>n,before,{timeout:90000});modes.push(mode);
  }
  const info=await page.evaluate(()=>window.sky.vulkanViewportInfo());assert.equal(info.quality,'full');assert.ok(info.cloud.passes.includes('Tonemap'));
  assert.equal(await page.locator('#viewport canvas').getAttribute('data-vulkan-error'),null);
  report.maps.push({level,frames:info.cloud.frames,passes:info.cloud.passes,water:info.cloud.water,modes});console.log(JSON.stringify({level,frames:info.cloud.frames,passes:info.cloud.passes}));
 }
 assert.deepEqual(report.errors,[]);
 const shaderCache=path.join(profile,'vulkan-shaders');report.shaderCacheEntries=await fs.readdir(shaderCache).catch(e=>{if(e.code==='ENOENT')return [];throw e;});assert.deepEqual(report.shaderCacheEntries,[]);
 const diagnostics=await fs.readFile(path.join(profile,'render-diagnostics.log'),'utf8');assert.doesNotMatch(diagnostics,/glslangValidator|ENOENT|vulkanFrame Error/);
 report.passed=true;
}catch(error){report.error=String(error);process.exitCode=1;if(page&&!page.isClosed())report.failure=await page.evaluate(()=>({status:document.querySelector('#status')?.textContent,toast:document.querySelector('#toast')?.textContent,canvas:document.querySelector('#viewport canvas')?.dataset})).catch(()=>null);}
finally{
 if(app){const child=app.process(),timer=setTimeout(()=>child.kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}
 await fs.writeFile(process.env.SKY_SMOKE_REPORT??'docs/shader-bundle-package-smoke.json',JSON.stringify(report,null,2)+'\n');await fs.rm(temp,{recursive:true,force:true});console.log(JSON.stringify({passed:report.passed,maps:report.maps.length,error:report.error}));
}
