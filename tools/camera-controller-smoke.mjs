import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-camera-ui-'));
let app;
const report={passed:false,runtime:process.platform+' '+process.arch,windowsTested:false,checks:[],limitation:'Remote mouse camera controls and Vulkan presentation; original terrain/environment rendering remains incomplete.'};
try {
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'.'],cwd:process.cwd(),env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
  const page=await app.firstWindow(),errors=[];page.on('pageerror',error=>errors.push(error.message));
  await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
  await page.locator('#level-label').filter({hasText:'WorldEmpty'}).waitFor({timeout:45000});
  await page.locator('#levels').selectOption('Dawn');await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:60000});
  await page.waitForFunction(()=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>0);
  const read=()=>page.locator('#viewport canvas').evaluate(canvas=>{const data=canvas.getContext('2d').getImageData(0,0,canvas.width,canvas.height).data;let hash=2166136261;for(const value of data)hash=Math.imul(hash^value,16777619);return {sequence:Number(canvas.dataset.frameSequence),hash:hash>>>0,position:JSON.parse(canvas.dataset.cameraPosition),forward:JSON.parse(canvas.dataset.cameraForward),projection:JSON.parse(canvas.dataset.cameraProjection)};});
  async function changed(action) {
    const before=await read();await action();await page.waitForFunction(sequence=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>sequence,before.sequence,{timeout:60000});
    assert.notEqual((await read()).hash,before.hash);
  }
  await page.waitForTimeout(1000);
  await page.locator('#mode-mesh').click();await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:60000});
  await page.locator('#tree .tree-row').filter({hasText:/^terrain0/}).first().click();
  const selection=await page.locator('#inspector').textContent();
  for(const action of ['相机平移向右','相机旋转向左','相机放大','相机缩小'])
    await changed(()=>page.getByRole('button',{name:action,exact:true}).click());
  report.checks.push('Pan, orbit and zoom clicks change actual Vulkan pixels without keyboard shortcuts');
  for(const action of [()=>page.getByRole('button',{name:'相机放大',exact:true}).click(),async()=>{
    const box=await page.locator('#viewport canvas').boundingBox();await page.mouse.move(box.x+box.width*.4,box.y+box.height*.6);await page.mouse.wheel(0,-180);
  }]) {
    await page.waitForTimeout(350);const before=await read();await changed(action);await page.waitForTimeout(450);const after=await read();
    assert.deepEqual(after.projection,before.projection);
    const delta=after.position.map((v,i)=>v-before.position[i]),distance=Math.hypot(...delta),alignment=delta.reduce((v,d,i)=>v+d*before.forward[i],0)/distance;
    assert.ok(distance>0.01&&alignment>0.99999,`Zoom must move the camera forward: ${distance}/${alignment}`);
  }
  report.checks.push('Zoom button and mouse wheel move actual camera position along its forward axis while the full projection matrix stays unchanged');
  const editCamera=await read();await page.locator('#mode-bin').click();await page.locator('#mode-mesh').click();await page.waitForTimeout(450);
  const returned=await read();assert.deepEqual(returned.position,editCamera.position);assert.deepEqual(returned.projection,editCamera.projection);
  report.checks.push('Switching Objects and Meshes edit modes retains the editor camera position and projection');
  for(const action of ['拖动平移','拖动旋转','拖动缩放']) {
    await changed(async()=>{const box=await page.getByRole('button',{name:action,exact:true}).boundingBox();
      await page.mouse.move(box.x+box.width/2,box.y+box.height/2);await page.mouse.down();
      await page.mouse.move(box.x+box.width/2+38,box.y+box.height/2-26,{steps:5});await page.mouse.up();});
  }
  report.checks.push('Captured left-button drag works for pan, orbit and zoom');
  const up=page.getByRole('button',{name:'相机平移向上',exact:true}),box=await up.boundingBox();
  await changed(async()=>{await page.mouse.move(box.x+box.width/2,box.y+box.height/2);await page.mouse.down();await page.waitForTimeout(650);
    await page.mouse.move(box.x-80,box.y+box.height/2);await page.mouse.up();});
  await page.waitForTimeout(500);const stopped=await read();await page.waitForTimeout(600);assert.deepEqual(await read(),stopped);
  assert.equal(await page.locator('#camera-controller .pressed').count(),0);
  report.checks.push('Holding an arrow repeats; releasing outside the panel stops immediately');
  await changed(()=>page.getByRole('button',{name:'相机聚焦所选',exact:true}).click());
  await page.waitForTimeout(300);
  await changed(()=>page.getByRole('button',{name:'相机显示全景',exact:true}).click());
  assert.equal(await page.locator('#inspector').textContent(),selection);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');
  report.checks.push('Focus and frame buttons work; camera interactions preserve the selected terrain and do not edit assets');
  const heading=page.locator('#camera-controller .camera-heading');await heading.click();assert.equal(await heading.getAttribute('aria-expanded'),'false');
  assert.equal(await page.locator('#camera-controller .camera-controls-body').isVisible(),false);await heading.click();
  const panel=await page.locator('#camera-controller').boundingBox(),viewport=await page.locator('#viewport').boundingBox();
  assert.ok(panel.x+panel.width<=viewport.x+viewport.width && panel.y>=viewport.y && panel.y+panel.height<viewport.y+viewport.height);
  const toolbar=await page.locator('.viewport-toolbar').boundingBox();assert.ok(toolbar.x+toolbar.width<panel.x);
  report.checks.push('Top-right controller can collapse and does not overlap the object toolbar');
  assert.deepEqual(errors,[]);await page.screenshot({path:'docs/camera-controller-preview.png'});report.passed=true;
}catch(error){report.error=String(error);throw error;}
finally{if(app)await app.close().catch(()=>{});await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/camera-controller-smoke.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
