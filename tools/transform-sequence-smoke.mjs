import {_electron as electron} from 'playwright';import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';import assert from 'node:assert/strict';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-transform-sequence-ui-')),report={passed:false,checks:[],scope:'Real StormEnd #512/#433 TransformObject completion cycle displayed in Electron/Vulkan with Marker helper frames. Original recovered EventBarn update drives editor matrices; this is editor visualization, not full original game rendering.',windowsTested:false};let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow(),errors=[];page.setDefaultTimeout(30000);page.setDefaultNavigationTimeout(45000);page.on('pageerror',e=>errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1350,950));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus');await page.locator('#apply-settings').click();await page.locator('body[aria-busy="false"]').waitFor();await page.locator('#levels').selectOption('StormEnd');await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='StormEnd',null,{timeout:60000});await page.locator('#search').fill('TransformObject');await page.locator('[data-node-id="512"]').click();assert.ok(await page.locator('#object-playback-start').isEnabled());
 await page.locator('#helper-frames').click();assert.equal(await page.locator('#helper-frames').getAttribute('aria-pressed'),'true');
 await page.evaluate(()=>{
  window.sequenceWitness=[];const canvas=document.querySelector('#viewport canvas');
  new MutationObserver(()=>{const raw=canvas?.dataset.objectPlayback;if(!raw)return;const state=JSON.parse(raw);window.sequenceWitness.push({events:state.events,objects:state.objects});}).observe(canvas,{attributes:true,attributeFilter:['data-object-playback']});
 });
 await page.locator('#object-playback-start').click();
 const state=()=>page.locator('#viewport canvas').evaluate(e=>e.dataset.objectPlayback?JSON.parse(e.dataset.objectPlayback):null);
 await page.waitForFunction(()=>window.sequenceWitness.some(s=>s.events.some(e=>e.id===512&&e.running)),null,{timeout:15000});
 const initial=await state();assert.equal(initial.events.length,2);assert.ok(initial.objects.length);report.checks.push('Actual StormEnd #512 starts its saved five-second transform with both shared events registered');
 await page.waitForFunction(()=>window.sequenceWitness.some(s=>s.events.some(e=>e.id===433&&e.starts>0)),null,{timeout:20000});
 await page.waitForFunction(()=>window.sequenceWitness.slice(-5).some(s=>s.events.some(e=>e.id===512&&e.starts>=2&&e.running&&e.elapsed>0.05&&e.elapsed<2)),null,{timeout:20000});
 const moving=await state();assert.equal(moving.error,null);assert.notDeepEqual(moving.objects,initial.objects);report.moving=moving;report.checks.push('Original completion request enables zero-duration #433 and returns to #512; scene Marker transforms change');
 await page.locator('#object-playback-pause').click();const paused=await state();await page.waitForTimeout(300);assert.deepEqual(await state(),paused);report.checks.push('Pausing a cycle freezes every event and every affected Marker matrix');
 await page.screenshot({path:'docs/transform-sequence-map-preview.png'});report.screenshot='docs/transform-sequence-map-preview.png';
 console.log('Cycle handoff, restart, pause and screenshot passed.');
 await page.locator('#helper-frames').click();
 await page.locator('#object-playback-stop').click();assert.equal(await state(),null);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');report.checks.push('Stopping clears the entire cycle and leaves saved Objects/meshes clean');
 console.log('Stop and clean saved state passed.');
 await page.locator('#object-playback-start').click();await page.locator('#mode-mesh').click();await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});assert.equal(await state(),null);
 console.log('Mesh mode cleanup passed.');
 await page.locator('#mode-bin').click();await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});await page.locator('#levels').selectOption('WorldEmpty');await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});assert.equal(await state(),null);assert.deepEqual(errors,[]);report.checks.push('Mode/map cleanup stops both events without renderer errors');report.passed=true;
}catch(error){report.error=String(error);if(app?.windows().length)await app.windows()[0].screenshot({path:'/root/sky-research/transform-sequence-ui-failure.png'}).catch(()=>{});throw error;}
finally{if(app){const timer=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/transform-sequence-smoke.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
