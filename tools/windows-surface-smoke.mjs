import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const reportPath=process.env.SKY_WINDOWS_SURFACE_REPORT??'docs/windows-surface-smoke.json';
const requireFull=process.env.SKY_WINDOWS_REQUIRE_FULL==='1';
const canvasCheck=process.env.SKY_DESKTOP_CANVAS_CHECK==='1';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-desktop-surface-'));
const report={passed:false,scope:'Production Electron desktop UI and XCB Vulkan presentation on Linux. Tests native replies, navigation, incremental editing, DPI, resizing and map cleanup. Does not validate Win32 HWND/transparent-window composition or Windows hardware FPS.',windowsTested:false,maps:[],errors:[]};
if(canvasCheck)report.scope='Production opaque Electron window and GPU-resident full Vulkan graph with final Canvas2D presentation on Linux software Vulkan. Verifies actual nonwhite canvas pixels, original resources, navigation, edits, resize and DPI. Windows hardware remains untested.';
const hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const sources={};for(const level of ['WorldEmpty','Dawn','SkyHub2'])for(const name of ['Objects.level.bin','BstBaked.meshes']){const file=path.join(data,'Levels',level,name);sources[file]=hash(await fs.readFile(file));}
let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config'),SKY_DESKTOP_SURFACE_TEST:canvasCheck?'0':'1'},timeout:45000});
 const page=await app.firstWindow();page.setDefaultTimeout(60000);page.on('pageerror',error=>report.errors.push(error.message));
 await app.evaluate(({ipcMain})=>{
  globalThis.surfaceSmoke={calls:{},surfaceFrames:0,pixelBytes:0};
  for(const [name,original] of [...ipcMain._invokeHandlers]){ipcMain.removeHandler(name);ipcMain.handle(name,async(...args)=>{const method=name.replace('sky:',''),stats=globalThis.surfaceSmoke;stats.calls[method]=(stats.calls[method]??0)+1;const result=await original(...args);if(method==='vulkanFrame'&&result.ok){if(result.value.surface)stats.surfaceFrames++;stats.pixelBytes+=result.value.pixels?.byteLength??0;}return result;});}
 });
 const calls=()=>app.evaluate(()=>({...globalThis.surfaceSmoke,calls:{...globalThis.surfaceSmoke.calls}}));
 const state=()=>page.locator('#viewport canvas').evaluate(e=>({dataset:{...e.dataset},resolution:[e.width,e.height],opacity:getComputedStyle(e).opacity}));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 const ready=async level=>{await page.waitForFunction(l=>document.body.getAttribute('aria-busy')!=='true'&&document.querySelector('#viewport canvas')?.dataset.level===l,level,{timeout:300000});if(!canvasCheck){const sequence=Number((await state()).dataset.frameSequence);await page.waitForFunction(s=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>s,sequence,{timeout:60000});}};
 await ready('WorldEmpty');console.log('Production desktop viewport initialized.');report.device=await page.evaluate(()=>window.sky.vulkanInfo());assert.equal(report.device.nativeSurface,!canvasCheck);assert.equal(await page.evaluate(()=>document.documentElement.classList.contains('desktop-native-surface')),!canvasCheck);assert.equal((await state()).opacity,canvasCheck?'1':'0');
 if(canvasCheck)report.window=await app.evaluate(({BrowserWindow})=>({count:BrowserWindow.getAllWindows().length,background:BrowserWindow.getAllWindows()[0].getBackgroundColor()}));
 if(requireFull){assert.deepEqual(await page.locator('#viewport-quality option').evaluateAll(options=>options.map(option=>option.value)),['full']);assert.equal(await page.locator('#viewport-quality').inputValue(),'full');assert.deepEqual(await page.locator('#mesh-display option').evaluateAll(options=>options.map(option=>option.value)),['material']);assert.deepEqual(await page.locator('#bake-channel option').evaluateAll(options=>options.map(option=>option.value)),['-1']);report.fullEffectsOnly=true;}
 for(const level of (process.env.SKY_WINDOWS_MAPS??'Dawn,SkyHub2,Dawn').split(',')){
  const began=performance.now();await page.locator('#levels').selectOption(level);await ready(level);console.log('Loaded '+level);const loadMs=performance.now()-began;
  const before=await state(),uploads=await page.evaluate(()=>window.sky.vulkanViewportInfo());
  const viewport=await page.locator('#viewport canvas').boundingBox();assert.ok(viewport);await page.bringToFront();await page.mouse.click(viewport.x+viewport.width*.5,viewport.y+viewport.height*.5);await page.locator('#viewport canvas').focus();await page.keyboard.down('w');
  const started=performance.now();await page.waitForTimeout(2200);await page.keyboard.up('w');
  // A slow software frame may still contain the camera snapshot taken before
  // keydown. Wait for a completed moved frame rather than sampling that one.
  await page.waitForFunction(before=>{const data=document.querySelector('#viewport canvas')?.dataset;return data&&Number(data.frameSequence)>Number(before.frameSequence)&&data.cameraPosition!==before.cameraPosition;},before.dataset,{timeout:60000});
  const after=await state(),info=await page.evaluate(()=>window.sky.vulkanViewportInfo());
  const frames=Number(after.dataset.frameSequence)-Number(before.dataset.frameSequence),elapsed=performance.now()-started;
  if(requireFull){assert.equal(after.dataset.quality,'full');assert.equal(info.quality,'full');assert.equal(info.cloud.active,true);assert.equal(info.cloud.statistics.transport.gpuResident,true);assert.equal(info.cloud.statistics.transport.intermediateFrameReadbacks,0);}
  const entry={level,loadMs,frames,navigationStatusFps:frames/(elapsed/1000),cameraMoved:before.dataset.cameraPosition!==after.dataset.cameraPosition,resolution:after.resolution,draws:info.draws,triangles:info.triangles,geometrySha256:info.geometrySha256,frameTiming:info.frameTiming,fullTransport:requireFull?info.cloud.statistics.transport:undefined,visibleDraws:info.visibleDraws,sceneReuploads:info.sceneUploads-uploads.sceneUploads,materialReuploads:info.materialUploads-uploads.materialUploads};
  if(canvasCheck){
   entry.canvas=await page.locator('#viewport canvas').evaluate(canvas=>{const p=canvas.getContext('2d').getImageData(0,0,canvas.width,canvas.height).data;let min=255,max=0,white=0,opaque=0;for(let i=0;i<p.length;i+=4){min=Math.min(min,p[i],p[i+1],p[i+2]);max=Math.max(max,p[i],p[i+1],p[i+2]);white+=Number(p[i]>=250&&p[i+1]>=250&&p[i+2]>=250);opaque+=Number(p[i+3]===255);}return {min,max,whiteFraction:white/(p.length/4),opaqueFraction:opaque/(p.length/4),opacity:getComputedStyle(canvas).opacity};});
   assert.equal(entry.canvas.opacity,'1');assert.equal(entry.canvas.opaqueFraction,1);assert.ok(entry.canvas.max-entry.canvas.min>20);assert.ok(entry.canvas.whiteFraction<.95,`${level} canvas is white`);
   await page.locator('#viewport').screenshot({path:`/root/sky-research/white-screen-${level}-${report.maps.length}.png`});
  }
  assert.equal(entry.cameraMoved,true);assert.ok(frames>0);assert.equal(entry.sceneReuploads,0);assert.equal(entry.materialReuploads,0);report.maps.push(entry);console.log(JSON.stringify(entry));
 }
 const info=await page.evaluate(()=>window.sky.vulkanViewportInfo()),model=info.modelBindings.find(b=>!b.beamoPass);assert.ok(model);
 await page.locator('#search').fill('LevelMesh');await page.locator(`#tree [data-node-id="${model.nodeId}"]`).click();
 const before=await state(),counts=await calls(),began=performance.now();
 await page.locator('input[title="transform[12]"]').evaluate(input=>{input.value=String(Number(input.value)+3);input.dispatchEvent(new Event('change',{bubbles:true}));});
 const poseDeadline=Date.now()+60000;while((await calls()).calls.vulkanModelTransforms<=(counts.calls.vulkanModelTransforms??0)){if(Date.now()>poseDeadline)throw new Error('Incremental pose RPC did not arrive');await page.waitForTimeout(100);}
 const poseSequence=Number((await state()).dataset.frameSequence);await page.waitForFunction(sequence=>document.body.getAttribute('aria-busy')!=='true'&&Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>sequence,poseSequence,{timeout:60000});
 const changed=await page.evaluate(()=>window.sky.vulkanViewportInfo()),afterCalls=await calls();
 assert.equal(changed.sceneUploads,info.sceneUploads);assert.equal(changed.materialUploads,info.materialUploads);assert.equal(changed.geometrySha256,info.geometrySha256);assert.ok(afterCalls.calls.vulkanModelTransforms> (counts.calls.vulkanModelTransforms??0));
 console.log('Incremental model edit passed.');report.interaction={nodeId:model.nodeId,translation:3,responseMs:performance.now()-began,poseRequests:afterCalls.calls.vulkanModelTransforms-(counts.calls.vulkanModelTransforms??0),sceneReuploads:0,materialReuploads:0,geometryUnchanged:true};
 // Exercise the production bounds bridge and DPR watcher without Win32 claims.
 await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1250,820));await page.waitForTimeout(500);await ready('Dawn');
 const cdp=await page.context().newCDPSession(page);await cdp.send('Emulation.setDeviceMetricsOverride',{width:1250,height:820,deviceScaleFactor:1.5,mobile:false});await page.waitForTimeout(500);await ready('Dawn');
 const bounds=await page.evaluate(()=>{const canvas=document.querySelector('#viewport canvas');const rect=canvas.getBoundingClientRect();return {ratio:devicePixelRatio,physicalWidth:Math.round(rect.width*devicePixelRatio),renderWidth:canvas.width,renderHeight:canvas.height};});assert.ok(bounds.renderWidth>1);assert.ok(bounds.renderWidth<=bounds.physicalWidth);if(!canvasCheck)assert.ok((await calls()).calls.vulkanSurfaceBounds>=3);report.resizeAndDpi=bounds;
 await page.locator('#undo').click();await page.waitForFunction(()=>document.querySelector('#dirty').textContent==='所有修改已保存');
 await page.locator('#levels').selectOption('WorldEmpty');await ready('WorldEmpty');report.empty=await page.evaluate(()=>window.sky.vulkanViewportInfo());assert.equal(report.empty.levelMeshDraws,0);
 report.transport=await calls();if(canvasCheck){assert.equal(report.transport.surfaceFrames,0);assert.ok(report.transport.pixelBytes>0);assert.equal(report.window.count,1);assert.equal(report.window.background.toLowerCase(),'#0c121b');}else{assert.ok(report.transport.surfaceFrames>0);assert.equal(report.transport.pixelBytes,0);}assert.deepEqual(report.errors,[]);
 for(const [file,expected] of Object.entries(sources))assert.equal(hash(await fs.readFile(file)),expected);
 report.sourceHashesUnchanged=true;report.passed=true;
}catch(error){report.error=String(error);if(app?.windows().length){const page=app.windows()[0];report.toast=await page.locator('#toast').textContent().catch(()=>null);report.status=await page.locator('#status').textContent().catch(()=>null);await page.screenshot({path:'/root/sky-research/windows-surface-ui-failure.png'}).catch(()=>{});}throw error;
}finally{if(app){const timer=setTimeout(()=>app.process().kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile(reportPath,JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,maps:report.maps,interaction:report.interaction,transport:report.transport}));
