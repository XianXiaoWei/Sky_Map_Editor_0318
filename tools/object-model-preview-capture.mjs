import {_electron as electron} from 'playwright';import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-model-preview-'));
const report={passed:false,runtime:process.platform+' '+process.arch,scope:'Current editor resource geometry/packed bake/inspector preview only. LevelMesh static mesh and diagnostic material; Beamo has a helper placeholder, not original BeamoBarn model drawing. No animation, complete class runtime or original-game image parity is implied.',images:[],errors:[]};let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1450,950));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:60000});
 await page.locator('#levels').selectOption('Dawn');await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:90000});await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',null,{timeout:60000});
 for(const className of ['LevelMesh','Beamo']){
  await page.locator('#search').fill(className);const rows=page.locator('#tree .tree-row');assert.ok(await rows.count());
  // Prefer a nonglobal LevelMesh to keep focus useful, using the source label.
  const candidate=className==='LevelMesh'?rows.filter({hasText:/Rock|Stone|Cliff|Gate|Cube|Door/i}):rows;
  const row=await candidate.count()?candidate.first():rows.first();const nodeId=await row.getAttribute('data-node-id'),label=await row.innerText();await row.click();assert.equal(await page.locator('#selection-type').innerText(),className);
  if(className==='Beamo')await page.locator('#helper-frames').click();
  await page.locator('#focus').click();await page.waitForTimeout(1800);
  const info=await page.evaluate(()=>window.sky.vulkanViewportInfo()),file=`docs/${className}-current-preview.png`;await page.screenshot({path:file});
  report.images.push({className,level:'Dawn',nodeId:Number(nodeId),label,file,viewport:info,scope:className==='LevelMesh'?'Static resource mesh/diagnostic preview with current inspector':'Helper and inspector only; actual Beamo model drawing is incomplete'});
 }
 assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);throw error;}finally{if(app){const kill=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(kill);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/object-model-preview-check.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify(report));
