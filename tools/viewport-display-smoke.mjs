import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-display-smoke-'));
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const report={passed:false,scope:'Real Electron and production Vulkan: three resolution controls, full effects, retained canvas during changes, DPI and persisted selection. Software Vulkan; no Windows hardware FPS acceptance.',modes:[],errors:[]};
let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));
 await page.addStyleTag({content:'#viewport{width:220px;height:180px}'});
 await page.locator('#settings-dialog').waitFor({state:'visible'});
 assert.equal(await page.locator('#viewport-quality').inputValue(),'balanced');
 assert.deepEqual(await page.locator('#viewport-quality option').evaluateAll(options=>options.map(o=>o.value)),['smooth','balanced','native']);
 await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 await page.locator('#levels').selectOption('Dawn');
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',undefined,{timeout:120000});
 const change=async mode=>{
  const before=await page.evaluate(mode=>{
   const c=document.querySelector('#viewport canvas'),select=document.querySelector('#viewport-quality'),pixels=()=>Array.from(c.getContext('2d').getImageData(0,0,c.width,c.height).data),previous={sequence:Number(c.dataset.frameSequence),width:c.width,height:c.height,pixels:pixels()};
   select.value=mode;select.dispatchEvent(new Event('change',{bubbles:true}));
   return {sequence:previous.sequence,retained:c.width===previous.width&&c.height===previous.height&&pixels().every((p,i)=>p===previous.pixels[i])};
  },mode);
  assert.equal(before.retained,true);
  await page.waitForFunction(({mode,sequence})=>{const c=document.querySelector('#viewport canvas'),s=document.querySelector('#viewport-performance');return Number(c.dataset.frameSequence)>sequence&&s.dataset.resolutionMode===mode;},{mode,sequence:before.sequence},{timeout:120000});
 };
 for(const mode of ['smooth','balanced','native']){
  await change(mode);
  // Let dynamic profiles reach their floor on this software test device.
  const sequence=await page.locator('#viewport canvas').getAttribute('data-frame-sequence');
  await page.waitForFunction(before=>Number(document.querySelector('#viewport canvas').dataset.frameSequence)>=Number(before)+6,sequence,{timeout:120000});
  const state=await page.evaluate(()=>{
   const c=document.querySelector('#viewport canvas'),s=document.querySelector('#viewport-performance'),p=c.getContext('2d').getImageData(0,0,c.width,c.height).data;let opaque=0,white=0,min=255,max=0;
   for(let i=0;i<p.length;i+=4){if(p[i+3]===255)opaque++;if(p[i]===255&&p[i+1]===255&&p[i+2]===255)white++;for(let lane=0;lane<3;lane++){min=Math.min(min,p[i+lane]);max=Math.max(max,p[i+lane]);}}
   return {mode:s.dataset.resolutionMode,width:c.width,height:c.height,displayWidth:c.clientWidth,displayHeight:c.clientHeight,ratio:devicePixelRatio,quality:c.dataset.quality,scale:Number(s.dataset.renderScale),opaqueFraction:opaque/(p.length/4),whiteFraction:white/(p.length/4),min,max,hud:s.textContent};
  });
  assert.equal(state.quality,'full');assert.equal(state.opaqueFraction,1);assert.ok(state.whiteFraction<.95);assert.ok(state.max>state.min);
  if(mode==='balanced')assert.ok(state.scale>=66&&state.scale<=100);
  if(mode==='native'){assert.equal(state.width,Math.round(state.displayWidth*Math.min(state.ratio,2)));assert.equal(state.height,Math.round(state.displayHeight*Math.min(state.ratio,2)));assert.equal(state.scale,100);}
  report.modes.push(state);
 }
 const cdp=await page.context().newCDPSession(page);
 // A getter override does not fire resolution media-query events. Exercise
 // actual Chromium DPI metrics, including the production matchMedia watcher.
 await cdp.send('Emulation.setDeviceMetricsOverride',{width:1180,height:760,deviceScaleFactor:1.5,mobile:false});
 await page.waitForFunction(()=>{const c=document.querySelector('#viewport canvas');return c.width===330&&c.height===270;},undefined,{timeout:120000});
 report.dpi={ratio:1.5,width:330,height:270};
 const info=await page.evaluate(()=>window.sky.vulkanViewportInfo());
 assert.ok(info.cloud.passes.includes('TemporalAa'));assert.ok(info.cloud.passes.includes('Tonemap'));assert.ok(info.shaders.some(s=>s.endsWith('AlphaSkirt')));
 report.fullEffectsAndSkirts={passes:info.cloud.passes,shaders:info.shaders.filter(s=>s.endsWith('AlphaSkirt'))};
 const beforePause=Number(await page.locator('#viewport canvas').getAttribute('data-frame-sequence'));
 await page.locator('#material-animation').click();
 await page.waitForFunction(before=>{const c=document.querySelector('#viewport canvas');return Number(c.dataset.frameSequence)>=before+8&&c.dataset.temporalFramesPending==='0';},beforePause,{timeout:120000});
 const paused=await page.evaluate(()=>({sequence:Number(document.querySelector('#viewport canvas').dataset.frameSequence),pending:document.querySelector('#viewport canvas').dataset.temporalFramesPending}));
 await page.waitForTimeout(2200);
 assert.equal(Number(await page.locator('#viewport canvas').getAttribute('data-frame-sequence')),paused.sequence);
 report.staticAntialiasing={additionalFrames:paused.sequence-beforePause,pending:Number(paused.pending),settlesAndStops:true};
 await page.locator('#levels').selectOption('WorldEmpty');
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 await page.reload();
 await page.locator('#viewport-quality').waitFor();assert.equal(await page.locator('#viewport-quality').inputValue(),'native');
 report.selectionPersisted=true;assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);throw error;}finally{
 if(app){const timer=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(timer);}
 await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/viewport-display-smoke.json',JSON.stringify(report,null,2)+'\n');
}
console.log(JSON.stringify(report));
