import {_electron as electron} from 'playwright';
import crypto from 'node:crypto';import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';import assert from 'node:assert/strict';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-performance-'));
const report={passed:false,mode:process.env.SKY_PERF_MODE??'balanced',maps:[],errors:[],scope:'Actual Electron/native Vulkan; continuous camera navigation at the selected product resolution setting, presented frames, browser timer delay, scene and material upload counts. Device and actual effect path are recorded; Windows hardware frame rate is not inferred.'};
report.testedBuildPayloadSha256={};for(const name of ['main.cjs','preload.cjs','app.js','index.html','style.css','classes.json','author-appreciation.png','native/sky-vulkan','native/sky-vulkan.exe']){const file='dist/'+name;report.testedBuildPayloadSha256[file]=crypto.createHash('sha256').update(await fs.readFile(file)).digest('hex');}
let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1000,720));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:120000});
 if(report.mode!=='baseline'){assert.ok(['smooth','balanced','native'].includes(report.mode),'Performance mode must be a current product resolution option');await page.locator('#viewport-quality').selectOption(report.mode);}
 report.device=await page.evaluate(()=>window.sky.vulkanInfo());
 const levels=process.env.SKY_PERF_MAPS==='all'?await page.locator('#levels option').evaluateAll(options=>options.map(o=>o.value).filter(Boolean)):(process.env.SKY_PERF_MAPS??'Prairie_ButterflyFields,SkyHub2').split(',');
 for(const level of levels){
  await page.locator('#levels').selectOption(level);await page.waitForFunction(l=>document.querySelector('#viewport canvas')?.dataset.level===l,level,{timeout:180000});
  await page.locator('body[aria-busy="false"]').waitFor({timeout:180000});
  const loadedSequence=await page.locator('#viewport canvas').evaluate(c=>Number(c.dataset.frameSequence));
  await page.waitForFunction(seq=>Number(document.querySelector('#viewport canvas').dataset.frameSequence)>seq+2,loadedSequence,{timeout:180000});
  const before=await page.evaluate(()=>window.sky.vulkanViewportInfo());
  console.log(JSON.stringify({level,ready:true,frameTiming:before.frameTiming}));
  let profiler;if(process.env.SKY_PERF_CPU_PROFILE==='1'){profiler=await page.context().newCDPSession(page);await profiler.send('Profiler.enable');await profiler.send('Profiler.setSamplingInterval',{interval:1000});await profiler.send('Profiler.start');}
  const initialPosition=await page.locator('#viewport canvas').getAttribute('data-camera-position');
  await page.evaluate(()=>{window.perfSamples=[];window.perfLast=performance.now();window.perfTimer=setInterval(()=>{const now=performance.now(),c=document.querySelector('#viewport canvas'),s=document.querySelector('#viewport-performance');window.perfSamples.push({t:now,delay:Math.max(0,now-window.perfLast-100),sequence:Number(c.dataset.frameSequence),ms:Number(s.dataset.frameMs),width:c.width,height:c.height});window.perfLast=now;},100);});
  await page.locator('#viewport canvas').evaluate(c=>c.focus());await page.keyboard.down('a');await page.waitForTimeout(Number(process.env.SKY_PERF_SECONDS??12)*1000);await page.keyboard.up('a');
  const samples=await page.evaluate(()=>{clearInterval(window.perfTimer);return window.perfSamples;});
  const after=await page.evaluate(()=>window.sky.vulkanViewportInfo()),elapsed=(samples.at(-1).t-samples[0].t)/1000,frames=samples.at(-1).sequence-samples[0].sequence;
  if(profiler){const {profile}=await profiler.send('Profiler.stop');const name=`docs/performance-${report.mode}-${level}.cpuprofile`;await fs.writeFile(name,JSON.stringify(profile));report.cpuProfile=name;await profiler.detach();}
  report.startupFramesExcluded=3;report.gpuFrameTiming=await page.locator('#viewport canvas').evaluate(c=>c.dataset.gpuFrameTiming?JSON.parse(c.dataset.gpuFrameTiming):undefined);
  const tail=samples.filter(s=>s.t>=samples.at(-1).t-4000);
  const entry={level,effectPath:after.quality,elapsed,frames,fps:frames/elapsed,settledFps:(tail.at(-1).sequence-tail[0].sequence)/((tail.at(-1).t-tail[0].t)/1000),maxTimerDelay:Math.max(...samples.map(s=>s.delay)),lastFrameMs:samples.at(-1).ms,resolution:[samples.at(-1).width,samples.at(-1).height],frameTiming:after.frameTiming,lod:after.lod,geometryUploads:after.geometryUploads-before.geometryUploads,sceneUploads:after.sceneUploads-before.sceneUploads,materialUploads:after.materialUploads-before.materialUploads,orderUpdates:after.orderUpdates-before.orderUpdates,cameraMoved:initialPosition!==await page.locator('#viewport canvas').getAttribute('data-camera-position'),samples};report.maps.push(entry);console.log(JSON.stringify({...entry,samples:undefined}));
  assert.ok(frames>0);assert.equal(entry.sceneUploads,0,'Navigation must not rebuild geometry');
  assert.equal(entry.cameraMoved,true,'Measure actual navigation rather than idle rendering');
  assert.equal(await page.locator('#viewport canvas').getAttribute('data-vulkan-error'),null);
  if(['Dawn','SkyHub2'].includes(level))await page.locator('#viewport').screenshot({path:`docs/performance-${report.mode}-${level}.png`});
 }
 assert.deepEqual(report.errors,[]);report.passed=true;
}catch(e){report.error=String(e);throw e;}finally{if(app){const timer=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile(process.env.SKY_PERF_REPORT??'docs/performance-'+report.mode+'.json',JSON.stringify(report,null,2)+'\n');}
