import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temp = await fs.mkdtemp(path.join(os.tmpdir(),'sky-overlay-ui-'));
let app;
const report={passed:false,runtime:process.platform+' '+process.arch,windowsTested:false,checks:[],limitation:'Overlay UI and Vulkan presentation in fixed packed-light inspection; original animated material/temporal pixel parity is checked separately and game rendering remains incomplete.'};
const watchdog=setTimeout(()=>{report.error='Isolated overlay UI check exceeded 180 seconds';app?.process().kill();},180000);
try {
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],cwd:process.cwd(),env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
  const page=await app.firstWindow(),errors=[];page.on('pageerror',error=>errors.push(error.message));
  console.log('Overlay window ready');
  await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
  await page.locator('#level-label').filter({hasText:'WorldEmpty'}).waitFor({timeout:45000});
  assert.equal(await page.locator('#wire').getAttribute('aria-pressed'),'false');
  assert.equal(await page.locator('#helper-frames').getAttribute('aria-pressed'),'false');
  assert.equal(await page.locator('#selection-outline').inputValue(),'mesh');
  assert.equal(await page.locator('#grid').evaluate(e=>e.classList.contains('active')),false);
  report.checks.push('Map grid lines, helper frames and floor grid off; selection outline defaults to actual mesh');
  await page.locator('#levels').selectOption('Dawn');await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:60000});
  await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn'&&Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>0,null,{timeout:60000});
  console.log('Dawn frame ready');
  await page.locator('#material-animation').click();
  assert.equal(await page.locator('#material-animation').getAttribute('aria-pressed'),'false');
  // Material/temporal refresh can change the underlying scene between toggles.
  // The packed inspection path isolates overlay geometry and state restoration.
  const originalFrame=await page.locator('#viewport canvas').evaluate(c=>Number(c.dataset.frameSequence));
  await page.locator('#mesh-display').selectOption('light0');
  await page.waitForFunction(s=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>s,originalFrame,{timeout:60000});
  const read=()=>page.locator('#viewport canvas').evaluate(canvas=>{const bytes=canvas.getContext('2d').getImageData(0,0,canvas.width,canvas.height).data;let hash=2166136261;for(const value of bytes)hash=Math.imul(hash^value,16777619);return {sequence:Number(canvas.dataset.frameSequence),hash:hash>>>0};});
  // BoxHelper can resubmit unchanged geometry while selected. Stability here
  // measures the pixels, while change() separately requires a completed frame.
  async function stable(){let previous=await read(),same=0;const deadline=Date.now()+45000;while(Date.now()<deadline){await page.waitForTimeout(250);const next=await read();same=next.hash===previous.hash?same+1:0;if(same===3)return next;previous=next;}throw new Error('Fixed inspection pixels did not settle');}
  async function change(action) {const before=await stable();await action();await page.waitForFunction(sequence=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>sequence,before.sequence,{timeout:60000});return {before,after:await stable()};}
  // Freeze material time and wait for camera damping/history refresh before
  // comparing overlays; running shader time changes the filled-scene pixels.
  await page.waitForTimeout(1500);
  const on=await change(()=>page.locator('#wire').click());assert.notEqual(on.before.hash,on.after.hash);
  assert.equal(await page.locator('#wire').getAttribute('aria-pressed'),'true');
  const off=await change(()=>page.locator('#wire').click());assert.equal(off.after.hash,on.before.hash);
  report.checks.push('Real Dawn mesh lines alter Vulkan packed-light pixels; hiding restores the fixed inspection scene exactly');
  const helpers=await change(()=>page.locator('#helper-frames').click());assert.notEqual(helpers.before.hash,helpers.after.hash);
  await change(()=>page.locator('#helper-frames').click());
  report.checks.push('Helper wireframes independently show and hide in Vulkan');
  console.log('Dawn wire and helper pixels verified');
  await page.locator('#mode-mesh').click();await page.locator('#mode-mesh.active').waitFor();
  await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:60000});
  await change(()=>page.locator('#tree .tree-row').filter({hasText:/^terrain0/}).first().click());
  await change(()=>page.locator('#selection-outline').selectOption('bounds'));
  const restingBounds=await stable();await page.waitForTimeout(1200);
  assert.deepEqual(await read(),restingBounds);
  console.log('Bounds idle frames verified');
  report.checks.push('Unchanged selected bounds do not trigger idle geometry uploads or frames');
  await change(()=>page.locator('#selection-outline').selectOption('hidden'));
  await change(()=>page.locator('#focus').click());
  await page.locator('#selection-outline').selectOption('mesh');
  report.checks.push('Terrain selection supports mesh, bounding box, hidden outline and focus while hidden');
  assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(errors,[]);
  report.checks.push('No game-resource edits or renderer page errors');report.passed=true;
}catch(error){report.error=String(error);throw error;}
finally {clearTimeout(watchdog);if(app){const closeTimeout=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(closeTimeout);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/viewport-overlay-smoke.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
