import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';import crypto from 'node:crypto';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-model-animation-preview-')),sha=b=>crypto.createHash('sha256').update(b).digest('hex');
const report={passed:false,errors:[],scope:'Actual saved DayHubCave #896 flower: named action UI, clock/sampling/skinning, packed pose IPC, native Vulkan geometry patches with material reuse, pause/stop/map switch and unchanged source. Bird/ray/crab resource sampling is separately tested; autonomous creature AI, Model/Barn lifecycle, mirrored/external packs, layered animations and original dynamic RSQRTSS are not claimed.'};let app;
async function poll(page,predicate,timeout=120000){const start=Date.now();while(Date.now()-start<timeout){const info=await page.evaluate(()=>window.sky.vulkanViewportInfo());if(predicate(info))return info;await page.waitForTimeout(200);}throw new Error('Animation viewport verification timed out');}
try{
 const source=await fs.readFile(path.join(data,'Levels/DayHubCave/Objects.level.bin')),meshSource=await fs.readFile(path.join(data,'Meshes/Bin/CharEnvFlowerAnim.mesh'));
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1300,900));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.addStyleTag({content:'#viewport{width:180px;height:140px}'});await page.locator('#levels').selectOption('DayHubCave');
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='DayHubCave',undefined,{timeout:180000});
 await page.locator('#tree [data-node-id="896"]').evaluate(el=>{for(let p=el.parentElement;p;p=p.parentElement)if(p.tagName==='DETAILS')p.open=true;});
 await page.locator('#tree [data-node-id="896"]').click();await page.locator('#focus').evaluate(el=>el.click());
 await page.locator('#inspect-model-animation').click();await page.locator('#model-animation-action').selectOption('closedLoop');
 report.before=await page.evaluate(()=>window.sky.vulkanViewportInfo());assert.ok(report.before.modelBindings.some(d=>d.nodeId===896));
 await page.locator('#model-animation-play').click();report.playing=await poll(page,info=>info.geometryUploads>=4);assert.notEqual(report.playing.geometrySha256,report.before.geometrySha256);assert.ok(report.playing.geometryUploads>=4);
 await page.locator('#model-animation-pause').click();await page.waitForFunction(()=>document.querySelector('#model-animation-status')?.textContent?.includes('已暂停'));
 await page.waitForTimeout(1000);report.paused=await page.evaluate(()=>window.sky.vulkanViewportInfo());await page.waitForTimeout(1000);const stable=await page.evaluate(()=>window.sky.vulkanViewportInfo());
 assert.equal(stable.geometrySha256,report.paused.geometrySha256);assert.equal(stable.geometryUploads,report.paused.geometryUploads);assert.equal(stable.sceneUploads,report.playing.sceneUploads);assert.equal(stable.materialUploads,report.playing.materialUploads);
 await page.screenshot({path:'docs/model-animation-preview-paused.png'});
 await page.locator('#model-animation-stop').click();await poll(page,info=>info.geometrySha256===report.before.geometrySha256);
 report.stopped=await page.evaluate(()=>window.sky.vulkanViewportInfo());
 await page.locator('#model-animation-play').click();await page.locator('#levels').selectOption('WorldEmpty');await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 report.afterSwitch=await page.evaluate(()=>window.sky.vulkanViewportInfo());assert.equal(report.afterSwitch.modelDraws,0);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');
 assert.equal(sha(await fs.readFile(path.join(data,'Levels/DayHubCave/Objects.level.bin'))),sha(source));assert.equal(sha(await fs.readFile(path.join(data,'Meshes/Bin/CharEnvFlowerAnim.mesh'))),sha(meshSource));
 assert.deepEqual(report.errors,[]);report.sourceUnchanged=true;report.passed=true;
}catch(error){report.error=String(error);process.exitCode=1;if(app){const page=await app.firstWindow();report.status=await page.locator('#status').textContent();report.viewport=await page.locator('#viewport canvas').evaluate(el=>({...el.dataset})).catch(()=>null);report.diagnostics=await fs.readFile(path.join(await app.evaluate(({app})=>app.getPath('userData')),'render-diagnostics.log'),'utf8').catch(()=>null);await page.screenshot({path:'docs/model-animation-preview-failure.png'});}}
finally{if(app){const timer=setTimeout(()=>app.process().kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/model-animation-preview-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,geometryUploads:report.playing?.geometryUploads,error:report.error}));
