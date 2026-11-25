import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import assert from 'node:assert/strict';import {execFileSync} from 'node:child_process';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-set-float-ui-')),sourceData=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const report={passed:false,checks:[],scope:'Actual DayHubCave SetFloat #43 runs its saved time=0 endpoint. A separate prepared map links SetFloat #43 to TransformObject #270 and original PlatformRain_01 LevelMesh #339 through Enable #444; its changed controls are recorded. Electron/Vulkan editor visualization and JS Math fallback, not complete original Model/GPU, automatic scene startup, collision or Avatar. Source Objects/meshes and prepared saved documents remain unchanged.',windowsTested:false};let app;
try{
 const data=path.join(temp,'Data'),preparedName='Prepared_SetFloat_Platform',originalHashes={};
 const linkTree=async(from,to)=>{await fs.mkdir(to,{recursive:true});for(const item of await fs.readdir(from)){const src=path.join(from,item),dst=path.join(to,item);if((await fs.stat(src)).isDirectory())await linkTree(src,dst);else await fs.link(src,dst).catch(async e=>{if(e.code!=='EXDEV')throw e;await fs.copyFile(src,dst);});}};
 await fs.mkdir(path.join(data,'Levels'),{recursive:true});
 for(const item of await fs.readdir(sourceData)){if(item==='Levels')continue;const src=path.join(sourceData,item),dst=path.join(data,item);if((await fs.stat(src)).isDirectory())await linkTree(src,dst);else await fs.copyFile(src,dst);}
 for(const name of ['CandleSpace','DayHubCave','WorldEmpty']){await linkTree(path.join(sourceData,'Levels',name),path.join(data,'Levels',name));for(const file of ['Objects.level.bin','BstBaked.meshes']){const relative=`Levels/${name}/${file}`;originalHashes[relative]=hash(await fs.readFile(path.join(sourceData,relative)));}}
 const preparedDir=path.join(data,'Levels',preparedName);await fs.mkdir(preparedDir);
 for(const item of await fs.readdir(path.join(data,'Levels','DayHubCave'))){if(item==='Objects.level.bin')continue;const src=path.join(data,'Levels','DayHubCave',item),dst=path.join(preparedDir,item);if((await fs.stat(src)).isDirectory())await linkTree(src,dst);else await fs.link(src,dst);}
 report.prepared=JSON.parse(execFileSync('node_modules/.bin/tsx',['tools/set-float-map-preview-map.ts',path.join(sourceData,'Levels','DayHubCave','Objects.level.bin'),path.join(preparedDir,'Objects.level.bin')],{encoding:'utf8'}));
 report.prepared.map=preparedName;report.prepared.sha256=hash(await fs.readFile(path.join(preparedDir,'Objects.level.bin')));
 console.log('Prepared temporary map and assets.');
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow(),errors=[];page.setDefaultTimeout(30000);page.on('pageerror',e=>errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1350,950));
 await page.exposeFunction('reportViewportToast',text=>console.log('Viewport: '+text));await page.evaluate(()=>{const e=document.querySelector('#toast');new MutationObserver(()=>{if(e.classList.contains('error-toast'))window.reportViewportToast(e.textContent);}).observe(e,{childList:true,attributes:true,subtree:true});});
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();await page.locator('body[aria-busy="false"]').waitFor();
 console.log('Editor Data initialized.');
 await page.locator('#mesh-display').selectOption('light0');await page.locator('#bake-channel').selectOption('0');
 const level=async name=>{await page.locator('#levels').selectOption(name);await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});await page.waitForFunction(name=>document.querySelector('#viewport canvas')?.dataset.level===name,name,{timeout:60000});};
 const state=()=>page.locator('#viewport canvas').evaluate(e=>e.dataset.objectPlayback?JSON.parse(e.dataset.objectPlayback):null),frame=()=>page.locator('#viewport canvas').evaluate(e=>Number(e.dataset.frameSequence));
 await level('DayHubCave');await page.locator('#search').fill('SetFloat');await page.locator('[data-node-id="43"]').click();assert.ok(await page.locator('#object-playback-start').isEnabled());await page.locator('#object-playback-start').click();
 const actual=await state();assert.equal(actual.kind,'SetFloat');assert.equal(actual.error,null);assert.equal(actual.running,false);assert.equal(actual.values.find(v=>v.id===874).value,1);report.actual=actual;
 await page.locator('#object-playback-stop').click();assert.equal(await state(),null);assert.equal(await page.locator('#object-playback-values').innerText(),'');report.checks.push('Actual DayHubCave #43 writes saved targetValue 1 and finishes during initial dispatch because its saved time is 0');
 console.log('Actual SetFloat endpoint passed.');
 await level(preparedName);await page.locator('#search').fill('Enable');await page.locator('[data-node-id="444"]').click();assert.ok(await page.locator('#object-playback-start').isEnabled());
 await page.locator('#mesh-display').selectOption('light0');await page.locator('#bake-channel').selectOption('0');await page.locator('#wire').click();
 await page.evaluate(()=>{window.setFloatWitness=[];const c=document.querySelector('#viewport canvas');new MutationObserver(()=>{const raw=c.dataset.objectPlayback;if(raw)window.setFloatWitness.push(JSON.parse(raw));}).observe(c,{attributes:true,attributeFilter:['data-object-playback']});});
 await page.evaluate(()=>{document.querySelector('#object-playback-start').click();document.querySelector('#object-playback-pause').click();});
 const initial=await state();assert.ok(initial.paused);report.initial=initial;
 const firstFrame=await frame();await page.waitForFunction(n=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>n,firstFrame,{timeout:30000});
 await page.screenshot({path:'docs/set-float-map-preview-before.png'});
 await page.locator('#object-playback-pause').click();await page.waitForFunction(()=>window.setFloatWitness.some(s=>s.values.some(v=>v.id===874&&v.value>.4)&&s.objects.some(o=>o.id===339)),null,{timeout:30000});
 await page.locator('#object-playback-pause').click();const moving=await state();assert.equal(moving.error,null);assert.ok(moving.paused);assert.notDeepEqual(moving.objects,initial.objects);report.moving=moving;
 await page.waitForTimeout(300);assert.deepEqual(await state(),moving);const movedFrame=await frame();await page.waitForFunction(n=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>n,movedFrame,{timeout:30000});
 await page.screenshot({path:'docs/set-float-map-preview-moving.png'});report.screenshots=['docs/set-float-map-preview-before.png','docs/set-float-map-preview-moving.png'];
 console.log('Shared Float, moving model, pause and screenshots passed.');
 report.checks.push('Prepared shared Float #874 increases and changes original LevelMesh #339 matrix in the map; Pause freezes the complete event/value/object state');
 await page.locator('#object-playback-pause').click();await page.waitForFunction(()=>{const raw=document.querySelector('#viewport canvas')?.dataset.objectPlayback;const s=raw&&JSON.parse(raw);return s&&s.values.some(v=>v.id===874&&v.value===1)&&s.events.some(e=>e.kind==='SetFloat'&&!e.running);},null,{timeout:45000});
 report.complete=await state();await page.locator('#object-playback-stop').click();assert.equal(await state(),null);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');
 await page.evaluate(()=>{document.querySelector('#object-playback-start').click();document.querySelector('#object-playback-pause').click();});assert.deepEqual((await state()).values,initial.values);assert.deepEqual((await state()).objects,initial.objects);
 report.checks.push('Resume reaches exact target 1; Stop/Restart restores the saved Float input and model transform');
 await page.locator('#mode-mesh').click();await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});assert.equal(await state(),null);await page.locator('#mode-bin').click();await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});
 await page.locator('#search').fill('Enable');await page.locator('[data-node-id="444"]').click();await page.locator('#object-playback-start').click();await level('WorldEmpty');assert.equal(await state(),null);assert.deepEqual(errors,[]);
 for(const [relative,expected] of Object.entries(originalHashes)){assert.equal(hash(await fs.readFile(path.join(sourceData,relative))),expected);assert.equal(hash(await fs.readFile(path.join(data,relative))),expected);}assert.equal(hash(await fs.readFile(path.join(preparedDir,'Objects.level.bin'))),report.prepared.sha256);
 report.checks.push('Mode/map cleanup clears live controllers and targets, without renderer errors or source/prepared file changes');report.passed=true;
}catch(error){report.error=String(error);if(app?.windows().length){report.viewportError=await app.windows()[0].locator('#toast').textContent().catch(()=>null);await app.windows()[0].screenshot({path:'/root/sky-research/set-float-map-preview-ui-failure.png'}).catch(()=>{});}throw error;}
finally{if(app){const timer=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/set-float-map-preview-smoke.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
