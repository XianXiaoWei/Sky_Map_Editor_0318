import {_electron as electron} from 'playwright';import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';import crypto from 'node:crypto';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-texture-nature-ui-')),hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const report={passed:false,scope:'Actual Electron IPC and full Vulkan canvas; New diffuse-probe model bindings, Image aliases, shared FlowerPatch/Water/CandleObject native slots, map changes and source preservation. Effect drawing/lifecycle and Windows GT 1030 FPS remain pending.',maps:[],aliases:[],errors:[]};let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await page.addStyleTag({content:'#viewport{width:180px;height:140px}'});
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 for(const name of ['Dawn','Storm','SkyHub2','Prairie_Cave','WorldEmpty']){
  const file=path.join(data,'Levels',name,'Objects.level.bin'),before=hash(await fs.readFile(file));
  await page.locator('#levels').selectOption(name);await page.waitForFunction(level=>document.querySelector('#viewport canvas')?.dataset.level===level,name,{timeout:120000});
  const state=await page.evaluate(async()=>{
   const c=document.querySelector('#viewport canvas'),p=c.getContext('2d').getImageData(0,0,c.width,c.height).data;let white=0,opaque=0;for(let i=0;i<p.length;i+=4){if(p[i]===255&&p[i+1]===255&&p[i+2]===255)white++;if(p[i+3]===255)opaque++;}
   return {quality:c.dataset.quality,width:c.width,height:c.height,whiteFraction:white/(p.length/4),opaqueFraction:opaque/(p.length/4),screenshotData:c.toDataURL('image/png').split(',')[1],environment:await window.sky.environmentRuntimeInfo(),viewport:await window.sky.vulkanViewportInfo()};
  });
  assert.equal(state.quality,'full');assert.ok(state.whiteFraction<.95);assert.equal(state.opaqueFraction,1);
  if(name==='Dawn')assert.equal(state.environment.effectPools.find(p=>p.className==='FlowerPatch').count,54);
  const expected={Dawn:44,Storm:819,SkyHub2:4}[name];if(expected!==undefined)assert.ok(state.viewport.modelBindings.some(b=>b.nodeId===expected),'Newly unblocked model #'+expected);
  if(name==='Dawn')assert.ok(state.environment.effectPools.find(p=>p.className==='CandleObject').count>0);
  if(name==='Prairie_Cave')assert.equal(state.environment.effectPools.find(p=>p.className==='Water').count,4);
  if(name==='WorldEmpty'){assert.ok(state.environment.effectPools.every(p=>p.count===0));assert.equal(state.viewport.modelDraws,0);}
  const screenshot=`docs/texture-nature-${name}-viewport.png`;await fs.writeFile(screenshot,Buffer.from(state.screenshotData,'base64'));
  assert.equal(hash(await fs.readFile(file)),before);report.maps.push({name,width:state.width,height:state.height,quality:state.quality,whiteFraction:state.whiteFraction,opaqueFraction:state.opaqueFraction,pools:state.environment.effectPools,modelDraws:state.viewport.modelDraws,screenshot,screenshotSha256:hash(await fs.readFile(screenshot)),sourceSha256:before,sourceUnchanged:true});
  console.log(JSON.stringify({stage:'map-verified',name}));
 }
 for(const name of ['HeatTex','BasicGeoAtlas1','LifeForceMural02Sh','BirdStripTex']){
  const result=await page.evaluate(async name=>({info:await window.sky.imageInfo(name),url:await window.sky.image(name)}),name);assert.ok(result.info.exists);assert.ok(result.url.startsWith('data:image/png;base64,'));
  const source=result.info.declaration.fields.source,sourceBytes=await fs.readFile(path.join(data,'Images/Bin',source));assert.equal(hash(Buffer.from(result.url.split(',')[1],'base64')),hash(sourceBytes));report.aliases.push({name,source,sourceSha256:hash(sourceBytes),ipcBytesMatch:true});
 }
 assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);if(app){const page=await app.firstWindow();report.status=await page.locator('#status').textContent();await page.screenshot({path:'/root/sky-research/texture-nature-ui-failure.png'});}throw error;}finally{
 if(app){const timer=setTimeout(()=>{report.forcedTestShutdown=true;app.process().kill('SIGKILL');},8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/texture-nature-smoke.json',JSON.stringify(report,null,2)+'\n');
}
console.log(JSON.stringify({passed:report.passed,maps:report.maps.length,aliases:report.aliases.length}));
