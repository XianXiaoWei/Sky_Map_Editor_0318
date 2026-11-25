import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-lod-smoke-')),report={passed:false,scope:'Actual Electron/Vulkan near/far/near model LOD, stable draw and material ownership, retained high-detail picking geometry. Does not establish original fade/occlusion parity or Windows hardware FPS.',checks:[],errors:[]};let app;
try {
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1000,720));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');await page.locator('#apply-settings').click();await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:120000});
 await page.locator('#levels').selectOption('Dawn');await page.locator('#status').filter({hasText:'已打开 Dawn'}).waitFor({timeout:180000});await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',null,{timeout:120000});
 const initial=await page.evaluate(()=>window.sky.vulkanViewportInfo()),nodeId=534,binding=initial.modelBindings.find(b=>b.nodeId===nodeId&&!b.beamoPass);assert.ok(binding);assert.ok(initial.lod.eligibleOwners>0);report.initial={lod:initial.lod,draws:initial.draws};console.log(JSON.stringify({stage:'ready',lod:initial.lod}));
 const target=binding.model.slice(12,15);await page.locator('#camera-controller details summary').click();
 async function pose(position){
  const before=await page.locator('#viewport canvas').evaluate(c=>Number(c.dataset.frameSequence));
  for(const [i,input] of (await page.locator('[data-camera-coordinate]').all()).entries())await input.fill(String([...position,...target][i]));await page.getByRole('button',{name:'应用相机坐标',exact:true}).click();
  await page.waitForFunction(({before,position})=>{const c=document.querySelector('#viewport canvas');return Number(c.dataset.frameSequence)>before&&JSON.parse(c.dataset.cameraPosition??'[]').every((p,i)=>Math.abs(p-position[i])<.01);},{before,position},{timeout:120000});
  const info=await page.evaluate(()=>window.sky.vulkanViewportInfo());console.log(JSON.stringify({stage:'camera',position,triangles:info.modelBindings.find(b=>b.nodeId===nodeId&&!b.beamoPass)?.triangles}));return info;
 }
 const nearPosition=target.map((v,i)=>v+(i===1?3:i===2?5:0)),farPosition=target.map((v,i)=>v+(i===1?150:i===2?200:0));
 const near=await pose(nearPosition),far=await pose(farPosition),returned=await pose(nearPosition),draw=info=>info.modelBindings.find(b=>b.nodeId===nodeId&&!b.beamoPass);
 report.samples=[near,far,returned].map(info=>({lod:info.lod,draw:draw(info),sceneUploads:info.sceneUploads,materialUploads:info.materialUploads,geometryUploads:info.geometryUploads,draws:info.draws}));
 assert.equal(draw(near).triangles,668);assert.equal(draw(far).triangles,86);assert.equal(draw(returned).triangles,668);assert.equal(draw(near).verticesSha256,draw(returned).verticesSha256);
 assert.equal(near.draws,far.draws);assert.equal(near.draws,returned.draws);assert.equal(near.sceneUploads,returned.sceneUploads);assert.equal(near.materialUploads,returned.materialUploads);assert.ok(returned.geometryUploads>near.geometryUploads);assert.deepEqual(draw(near).model,draw(returned).model);
 report.checks.push('StupaBell LOD0 668 triangles -> LOD1 86 -> exact LOD0 vertex hash','LOD switches keep draw count, materials and scene upload count fixed');
 assert.equal(await page.locator('#viewport canvas').getAttribute('data-vulkan-error'),null);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(report.errors,[]);await page.locator('#viewport').screenshot({path:'docs/model-lod-viewport-smoke.png'});report.passed=true;
}catch(error){report.error=String(error);process.exitCode=1;}finally{if(app){const timer=setTimeout(()=>app.process().kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/model-lod-viewport-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,checks:report.checks,error:report.error}));
