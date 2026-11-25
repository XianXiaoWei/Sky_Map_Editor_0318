import {_electron as electron} from 'playwright';import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';import crypto from 'node:crypto';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-nature-event-ui-')),hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const report={passed:false,checks:[],maps:[],errors:[],scope:'Actual Electron inspector buttons, shared original EventBarn state, full Vulkan frames, reset/map cleanup and corpus preservation. Creature AI/animation, Candle owner records, extinguish audio and nature rendering remain pending.'};let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1300,900));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.addStyleTag({content:'#viewport{width:180px;height:140px}'});
 const read=()=>page.evaluate(()=>window.sky.environmentRuntimeInfo());
 const choose=async event=>{await page.locator('#search').fill(event.kind);await page.locator(`#tree [data-node-id="${event.id}"]`).click();await page.locator('#environment-event-start').waitFor({state:'visible'});};
 const trigger=async event=>{await choose(event);await page.locator('#environment-event-start').waitFor({state:'visible'});await page.waitForFunction(()=>!document.querySelector('#environment-event-start').disabled);const before=(await read()).events.find(e=>e.id===event.id).starts;await page.locator('#environment-event-start').click();await page.waitForFunction(async({id,before})=>(await window.sky.environmentRuntimeInfo()).events.find(e=>e.id===id).starts===before+1,{id:event.id,before});};
 for(const level of ['Dawn','Prairie_Village','DuskMid','WorldEmpty']){
  const filename=path.join(data,'Levels',level,'Objects.level.bin'),sha=hash(await fs.readFile(filename));
  await page.locator('#search').fill('');await page.locator('#levels').selectOption(level);await page.waitForFunction(level=>document.querySelector('#viewport canvas')?.dataset.level===level,level,{timeout:180000});
  const initial=await read();assert.equal(await page.locator('#viewport canvas').getAttribute('data-quality'),'full');
  if(level==='Dawn'){
   const event=initial.events.find(e=>e.kind==='SetFlame'&&e.available);assert.ok(event);await trigger(event);const after=await read();assert.equal(after.events.find(e=>e.id===event.id).running,false);assert.ok(after.nature.flames.some(f=>f.lit&&f.intensity===1));report.checks.push('Dawn inspector triggers a direct Flame light-on event through the shared Barn');
   const blocked=initial.events.find(e=>e.kind==='OnFlame'&&!e.available);await choose(blocked);await page.waitForFunction(()=>document.querySelector('#environment-event-start').disabled&&document.querySelector('#environment-event-start').nextElementSibling.textContent.length>0);assert.match(await page.locator('#environment-event-start').locator('..').textContent(),/OnFlame.*未接入/);report.checks.push('Unavailable Flame chains disable the inspector button and explain the missing dependency');
  }
  if(level==='Prairie_Village'){
   const event=initial.events.find(e=>e.kind==='BirdV2ParamSwap'&&e.available);await trigger(event);const swapped=(await read()).nature.birds;assert.ok(swapped.some((b,i)=>b.boidParams!==initial.nature.birds[i].boidParams));
   const guides=initial.events.find(e=>e.kind==='SetBirdGuidesEnabled'&&e.available);await trigger(guides);report.checks.push('Prairie_Village inspector executes parameter and guide switches in the current shared creature storage');
   await page.evaluate(()=>window.sky.resetEnvironmentRuntime());assert.deepEqual((await read()).nature.birds,initial.nature.birds);report.checks.push('Reset reconstructs original saved creature references');
  }
  if(level==='DuskMid'){
   const event=initial.events.find(e=>e.kind==='SetDarkCreaturesNetworked'&&e.available);await trigger(event);assert.ok((await read()).nature.darkCreatures.some(c=>c.networked));report.checks.push('DuskMid inspector executes the native DarkCreature network flag event');
  }
  if(level==='WorldEmpty'){assert.deepEqual(initial.nature.birds,[]);assert.deepEqual(initial.nature.flames,[]);assert.deepEqual(initial.nature.darkCreatures,[]);assert.deepEqual(initial.events,[]);report.checks.push('Switching to WorldEmpty releases the previous nature/event state');}
  assert.equal(hash(await fs.readFile(filename)),sha);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');report.maps.push({level,sourceSha256:sha,sourceUnchanged:true,events:initial.events.filter(e=>['SetFlame','BirdV2ParamSwap','SetBirdGuidesEnabled','SetDarkCreaturesNetworked'].includes(e.kind))});console.log(JSON.stringify({stage:'map-verified',level}));
 }
 assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);if(app){const page=await app.firstWindow();report.status=await page.locator('#status').textContent();await page.screenshot({path:'/root/sky-research/nature-event-ui-failure.png'});}process.exitCode=1;
}finally{if(app){const timer=setTimeout(()=>{report.forcedTestShutdown=true;app.process().kill('SIGKILL');},8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/nature-event-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,checks:report.checks,error:report.error}));
