import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';import crypto from 'node:crypto';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const audit=JSON.parse(await fs.readFile('docs/model-coverage-audit.json','utf8'));
const inventory=JSON.parse(await fs.readFile('docs/Objects.level.bin类进度.json','utf8'));
const preferred=['Storm','SkyHub2','Night','RainForest','DayHubCave','Prairie_Cave','Dawn'];
const levels=process.env.SKY_SMOKE_LEVELS?.split(',')??[...preferred,...inventory.files.map(m=>m.level).filter(l=>!preferred.includes(l)&&l!=='WorldEmpty'),'WorldEmpty'];
const reportFile=process.env.SKY_SMOKE_REPORT??'docs/model-coverage-smoke.json';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-model-coverage-')),sha=b=>crypto.createHash('sha256').update(b).digest('hex');
const report={passed:false,maps:[],errors:[],scope:'Actual Electron map loading and full Vulkan compositor, saved visible LevelMesh bindings, default animation startup and per-model packed geometry changes, FogVolume pass, screenshots, map resets and source preservation. File/dependency coverage is separate from this GPU integration check. Desktop hardware performance and original Metal pixel parity are not claimed.'};let app,appProcess,checking=true,stderr='';
async function poll(page,predicate,timeout=120000){const start=Date.now();while(Date.now()-start<timeout){const info=await page.evaluate(()=>window.sky.vulkanViewportInfo());if(predicate(info))return info;await page.waitForTimeout(250);}throw new Error('Model viewport polling timed out');}
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 appProcess=app.process();appProcess.stderr?.on('data',bytes=>{stderr=(stderr+bytes.toString()).slice(-8192);});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1300,900));await page.addStyleTag({content:'#viewport{width:180px;height:140px}'});
 page.on('crash',()=>{if(checking)report.rendererCrashed=true;});page.on('close',()=>{if(checking)report.windowClosedDuringCheck=true;});
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 for(const level of levels){
  const file=path.join(data,'Levels',level,'Objects.level.bin'),beforeSource=sha(await fs.readFile(file));
  await page.locator('#levels').selectOption(level);await page.waitForFunction(level=>{
   if(document.querySelector('#status')?.textContent==='Vulkan 视口不可用')throw new Error(document.querySelector('#toast')?.textContent||'Vulkan viewport failed');
   return document.querySelector('#viewport canvas')?.dataset.level===level;
  },level,{timeout:240000});
  let first=await poll(page,i=>i.cloud?.frames>0||level==='WorldEmpty');
  const canvas=await page.locator('#viewport canvas').evaluate(c=>({width:c.width,height:c.height,quality:c.dataset.quality,defaults:JSON.parse(c.dataset.modelAnimationDefaults??'[]'),png:c.toDataURL('image/png').split(',')[1]}));
  assert.equal(canvas.quality,'full');assert.deepEqual(canvas.defaults.filter(d=>d.error),[],level+' default animation errors');
  const expected=audit.rows.filter(r=>r.level===level&&r.savedVisible&&!r.materialBoundary&&r.group!=='FogVolume'),ids=new Set(first.modelBindings?.filter(d=>!d.beamoPass).map(d=>d.nodeId));
  const missing=expected.filter(r=>!ids.has(r.id)).map(r=>({id:r.id,name:r.name,shader:r.shader}));assert.deepEqual(missing,[],level+' visible model bindings');
  const moving=audit.rows.filter(r=>r.level===level&&r.savedVisible&&r.autoAvailable&&r.sampleChanged&&!r.materialBoundary);
  let changed=[];
  if(moving.length){const before=new Map(first.modelBindings.map(d=>[d.nodeId,d.verticesSha256])),observed=new Set();first=await poll(page,i=>{for(const r of moving)if(i.modelBindings?.some(d=>d.nodeId===r.id&&d.verticesSha256!==before.get(r.id)))observed.add(r.id);changed=[...observed];return changed.length===moving.length;},90000);}
  const fogExpected=audit.rows.filter(r=>r.level===level&&r.group==='FogVolume'&&r.savedVisible);
  if(fogExpected.length){assert.ok(first.cloud.passes.includes('FogVolume'));assert.deepEqual(first.cloud.fogVolumes.renderedNodeIds.slice().sort((a,b)=>a-b),fogExpected.map(r=>r.id).sort((a,b)=>a-b));}
  const screenshot=`docs/model-coverage-${level}.png`;await fs.writeFile(screenshot,Buffer.from(canvas.png,'base64'));assert.equal(sha(await fs.readFile(file)),beforeSource);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');
  report.maps.push({level,width:canvas.width,height:canvas.height,visibleModelBindings:expected.length,draws:first.modelDraws,defaultAnimations:canvas.defaults.length,changedAnimatedNodeIds:changed,fogVolumes:first.cloud?.fogVolumes,passes:first.cloud?.passes,modelBoundaries:first.modelBoundaries,screenshot,sourceUnchanged:true});
  await fs.writeFile(reportFile,JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({level,draws:first.modelDraws,defaults:canvas.defaults.length,changed:changed.length,fog:fogExpected.length}));
 }
 assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);process.exitCode=1;if(app){report.processExit={code:appProcess?.exitCode,signal:appProcess?.signalCode};const page=app.windows()[0];if(page&&!page.isClosed()){report.status=await page.locator('#status').textContent().catch(()=>null);report.toast=await page.locator('#toast').textContent().catch(()=>null);await page.screenshot({path:'docs/model-coverage-failure.png'}).catch(()=>{});}report.diagnostics=await fs.readFile(path.join(temp,'profile','render-diagnostics.log'),'utf8').catch(()=>null);}}
finally{checking=false;if(app&&appProcess){const timer=setTimeout(()=>appProcess.kill('SIGKILL'),8000);await app.close().catch(()=>{});if(appProcess.exitCode===null&&appProcess.signalCode===null)appProcess.kill('SIGKILL');clearTimeout(timer);}if(!report.passed)report.browserStderr=stderr;await fs.rm(temp,{recursive:true,force:true});await fs.writeFile(reportFile,JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,maps:report.maps.length,error:report.error}));
