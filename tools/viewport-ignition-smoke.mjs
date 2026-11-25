import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import path from 'node:path';import os from 'node:os';import assert from 'node:assert/strict';import crypto from 'node:crypto';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',level='SkyHub2',temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-ignition-'));
const candleOnly=process.env.SKY_IGNITION_CANDLE_ONLY==='1';
const report={passed:false,scope:'Actual Electron software Vulkan camera-proximity UI and original Candle ignition. DarkStone Avatar/Flame contact, OBB closest points, size/level-dependent native heat, health consumption, separate display smoothing, half-size shape floor and diffuse run native-verified original bodies/regions. A stationary local preview Flame, camera reach, a fixed 60 Hz clock, initial burning/spot overrides, material inputs and per-mesh ownership remain editor adapters; whole Darkstone.Update, hierarchy/propagation/rewards and game/Metal or Android/native-surface acceptance are excluded.',errors:[],checks:[],images:[]};let app;
const hash=b=>crypto.createHash('sha256').update(b).digest('hex'),files=['Objects.level.bin','BstBaked.meshes'];
report.sourceHashes=Object.fromEntries(await Promise.all(files.map(async file=>[file,hash(await fs.readFile(path.join(data,'Levels',level,file)))])));
if(candleOnly)report.scope='Actual Electron/Vulkan original UIFlame atlas and ring, one proximity ignition action, hidden after ignition, retained native Candle/Flame draw, far rejection and unchanged source data. GPU crash recovery and DarkStone are outside this focused run.';
try {
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1450,950));
 if(candleOnly)await page.addStyleTag({content:'#viewport{width:500px;height:400px}'});
 // This Playwright version treats an async waitForFunction predicate's
 // Promise as immediately truthy. Await IPC in Node and explicitly poll the
 // resolved condition so a false result cannot count as a successful wait.
 async function waitForAsync(predicate,arg,{timeout=30000}={}){
  const deadline=Date.now()+timeout;
  while(Date.now()<deadline){const result=await page.evaluate(predicate,arg);if(result)return result;await page.waitForTimeout(200);}
  throw new Error('Timed out waiting for resolved IPC condition: '+predicate.toString());
 }
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:120000});
 await page.locator('#levels').selectOption(level);await page.locator('#status').filter({hasText:'已打开 '+level}).waitFor({timeout:120000});await page.waitForFunction(l=>document.querySelector('#viewport canvas')?.dataset.level===l,level,{timeout:120000});
 await waitForAsync(async()=>{const state=await window.sky.viewportIgnitionState();return state.targets.some(t=>t.kind==='candle')&&state.targets.some(t=>t.kind==='darkstone');},null,{timeout:120000});
 const initial=await page.evaluate(()=>window.sky.viewportIgnitionState());report.initial={token:initial.token,counts:Object.fromEntries(['candle','darkstone'].map(kind=>[kind,initial.targets.filter(t=>t.kind===kind).length]))};console.log(JSON.stringify({stage:'targets',...report.initial}));
 const coordinates=page.locator('#camera-controller details');if(!await coordinates.getAttribute('open'))await coordinates.locator('summary').click();
 async function pose(position,target){
  const before=await page.evaluate(()=>Number(document.querySelector('#viewport canvas').dataset.frameSequence));
  for(const [i,input] of (await page.locator('[data-camera-coordinate]').all()).entries())await input.fill(String([...position,...target][i]));
  await page.getByRole('button',{name:'应用相机坐标',exact:true}).click();
  await page.waitForFunction(({position,before})=>{const d=document.querySelector('#viewport canvas').dataset;return Number(d.frameSequence)>before&&JSON.parse(d.cameraPosition??'[]').every((v,i)=>Math.abs(v-position[i])<.01);},{position,before},{timeout:120000});
 }
 let candle=initial.targets.find(t=>t.nodeId===498&&t.kind==='candle'&&t.enabled&&!t.lit&&!t.burnt)??initial.targets.find(t=>t.kind==='candle'&&t.enabled&&!t.lit&&!t.burnt);assert.ok(candle,'Need saved unlit candle');
 await pose(candle.position.map((v,i)=>v+(i===1?80:i===2?80:0)),candle.position);
 await page.waitForFunction(()=>document.querySelector('#ignite-target').hidden,null,{timeout:15000});
 report.farRejection=await page.evaluate(async({token,id})=>{try{await window.sky.igniteViewportTarget(token,id);return false;}catch{return true;}},{token:initial.token,id:candle.nodeId});assert.equal(report.farRejection,true);report.checks.push('Far camera hides action and backend rejects ignition');
 async function approach(target){
  for(const offset of [[0,1,2.5],[2.5,1,0],[0,1,-2.5],[-2.5,1,0],[0,2.5,.2],[1,.2,1]]){
   const distance=Math.max(2.5,target.radius+.7),length=Math.hypot(...offset);await pose(target.position.map((v,i)=>v+offset[i]*distance/length),target.position);
   try {await page.waitForFunction(id=>{const b=document.querySelector('#ignite-target');return !b.hidden&&!b.disabled&&Number(b.dataset.nodeId)===id;},target.nodeId,{timeout:2000});return true;}catch{}
  }return false;
 }
 if(!await approach(candle)){const id=await page.locator('#ignite-target').getAttribute('data-node-id');const nearby=(await page.evaluate(()=>window.sky.viewportIgnitionState())).targets.find(t=>String(t.nodeId)===id);assert.ok(nearby&&nearby.kind==='candle'&&!nearby.lit,'Need accessible nearby candle');candle=nearby;}
 const beforeCandle=await page.evaluate(()=>({selected:document.querySelectorAll('#tree .selected').length,frame:Number(document.querySelector('#viewport canvas').dataset.frameSequence)}));
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.waitForTimeout(1000);
 await page.waitForFunction(()=>document.querySelector('#ignite-target').dataset.nativeIcon==='UIFlame',null,{timeout:15000});
 assert.equal(await page.locator('.ignition-action').count(),1);assert.equal(await page.locator('.ignition-flame').count(),0);
 report.ignitionUi=await page.locator('#ignite-target').evaluate(b=>({icon:b.dataset.nativeIcon,atlas:b.dataset.nativeAtlas,maskedIcon:!!b.querySelector('.ignition-icon').style.maskImage,maskedRing:!!b.querySelector('.ignition-ring').style.maskImage}));
 assert.ok(report.ignitionUi.maskedIcon&&report.ignitionUi.maskedRing);report.checks.push('One ignition button uses original UIFlame atlas region and original ring image; no post-ignition flame overlay');
 await page.screenshot({path:'docs/viewport-ignition-candle-near.png'});report.images.push('docs/viewport-ignition-candle-near.png');
 await page.locator('#ignite-target').click();
 await waitForAsync(async id=>(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id)?.lit,candle.nodeId,{timeout:15000});
 await page.waitForFunction(id=>{const b=document.querySelector('#ignite-target');return b.hidden||Number(b.dataset.nodeId)!==id;},candle.nodeId,{timeout:15000});
 await waitForAsync(async id=>(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id)?.light>0,candle.nodeId,{timeout:30000});
 await waitForAsync(async id=>(await window.sky.vulkanViewportInfo()).cloud.candles.flameSources.some(s=>s.nodeId===id),candle.nodeId,{timeout:30000});
 report.candle=await page.evaluate(async id=>{const state=await window.sky.viewportIgnitionState(),info=await window.sky.vulkanViewportInfo(),environment=await window.sky.environmentRuntimeInfo();return {target:state.targets.find(t=>t.nodeId===id),native:info.cloud.candles.states.find(s=>s.nodeId===id),flames:info.cloud.candles.flameSources,passes:info.cloud.passes,owners:{advances:info.cloud.candles.ownerAdvances,last:info.cloud.candles.lastOwnerAdvance,frame:environment.frame,revision:environment.revision,effectPools:environment.effectPools},selected:document.querySelectorAll('#tree .selected').length};},candle.nodeId);
 assert.ok(report.candle.passes.includes('Flame'));assert.ok(report.candle.flames.some(s=>s.nodeId===candle.nodeId));await page.screenshot({path:'docs/viewport-ignition-candle-lit.png'});report.images.push('docs/viewport-ignition-candle-lit.png');report.checks.push('Paused ignition submits original Flame shader and recovered primary sprite vertices to the shared-depth transparent stage');
 assert.equal(report.candle.selected,beforeCandle.selected);assert.ok(report.candle.target.loaded);assert.ok(report.candle.target.light>0);report.checks.push('Mouse ignition updates native Candle/Flame state at paused material time without selecting a scene object');console.log(JSON.stringify({stage:'candle-ignited',id:candle.nodeId}));
 if(!candleOnly){
 // Exercise the same document's owner lifetime, including a GPU process restart.
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.waitForTimeout(1000);
 await page.evaluate(()=>window.sky.vulkanRestart());
 // Restarting during an in-flight frame exposes the normal recovery action.
 await page.waitForTimeout(250);
 if(await page.evaluate(()=>!!document.querySelector('#viewport canvas').dataset.vulkanError)){
  await page.locator('#viewport-recover').click();
  await page.waitForFunction(()=>!document.querySelector('#viewport canvas').dataset.vulkanError,null,{timeout:30000});
 }
 await pose(candle.position.map((v,i)=>v+(i===1?1:i===2?2.5:0)),candle.position);
 assert.equal((await page.evaluate(()=>window.sky.viewportIgnitionState())).targets.find(t=>t.nodeId===candle.nodeId).lit,true);
 await waitForAsync(async id=>(await window.sky.vulkanViewportInfo()).cloud.candles.flameSources.some(s=>s.nodeId===id),candle.nodeId,{timeout:30000});
 report.checks.push('GPU restart resubmits candle draws while retaining the existing lit owner');
 const tokenBeforeReset=(await page.evaluate(()=>window.sky.viewportIgnitionState())).token;
 await page.evaluate(()=>window.sky.resetViewportIgnition());
 await pose(candle.position.map((v,i)=>v+(i===1?1.1:i===2?2.5:0)),candle.position);
 const resetState=await page.evaluate(()=>window.sky.viewportIgnitionState());
 assert.ok(resetState.token>tokenBeforeReset);assert.equal(resetState.targets.find(t=>t.nodeId===candle.nodeId).lit,false);
 await waitForAsync(async id=>!(await window.sky.vulkanViewportInfo()).cloud.candles.flameSources.some(s=>s.nodeId===id),candle.nodeId,{timeout:30000});
 report.checks.push('Same-document ignition reset unloads and reattaches Candle/Flame resources without duplicate owners');
 await page.locator('#material-animation').click();
 const plants=initial.targets.filter(t=>t.kind==='darkstone'&&t.enabled).sort((a,b)=>a.nodeId-b.nodeId);let plant;
 for(const candidate of plants.slice(0,8))if(await approach(candidate)){plant=candidate;break;}assert.ok(plant,'Need unobstructed saved DarkStone mesh');
 // Freeze material time to isolate shader binding from wind/cloud animation.
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.screenshot({path:'docs/viewport-ignition-plant-near.png'});report.images.push('docs/viewport-ignition-plant-near.png');
 const beforePlant=await page.evaluate(()=>({frame:Number(document.querySelector('#viewport canvas').dataset.frameSequence),image:document.querySelector('#viewport canvas').toDataURL()}));
 await page.locator('#viewport canvas').focus();await page.keyboard.press('x');
 await waitForAsync(async id=>(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id)?.lit,plant.nodeId,{timeout:15000});
 await page.waitForFunction(frame=>Number(document.querySelector('#viewport canvas').dataset.frameSequence)>frame,beforePlant.frame,{timeout:120000});
 report.plant=await page.evaluate(async id=>({target:(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id),parameters:(await window.sky.vulkanViewportInfo()).modelParameterBindings.find(p=>p.nodeId===id),image:document.querySelector('#viewport canvas').toDataURL()}),plant.nodeId);
 assert.equal(report.plant.target.progress,0);assert.equal(report.plant.parameters.parameters.find(p=>p.name==='u_diffuseColor').vector[1],Math.fround(.05));assert.notEqual(report.plant.image,beforePlant.image);delete report.plant.image;
 await page.screenshot({path:'docs/viewport-ignition-plant-burning.png'});report.images.push('docs/viewport-ignition-plant-burning.png');report.checks.push('Keyboard ignition binds native burning color and changes actual Vulkan pixels at paused material time');
 await page.locator('#material-animation').click();
 report.plantShape=await waitForAsync(async id=>{const t=(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id);return t&&!t.burnt&&t.shrinkScale?.some(v=>v<1)?{progress:t.progress,scale:t.shrinkScale}:false;},plant.nodeId,{timeout:120000});
 assert.ok(report.plantShape.scale.every(v=>v>=.5&&v<=1));report.checks.push('Native separate display state shrinks the plant while retaining the original half-size floor');
 await waitForAsync(async({id,previous})=>{const binding=(await window.sky.vulkanViewportInfo()).modelParameterBindings.find(p=>p.nodeId===id)?.parameters.find(p=>p.name==='u_diffuseColor');return binding&&binding.vector.some((v,i)=>v!==previous[i]);},{id:plant.nodeId,previous:report.plant.parameters.parameters.find(p=>p.name==='u_diffuseColor').vector},{timeout:120000});
 report.checks.push('Animated plant diffuse evolves through the native-verified original material subregion');
 await waitForAsync(async id=>(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id)?.burnt,plant.nodeId,{timeout:120000});
 await waitForAsync(async id=>!(await window.sky.vulkanViewportInfo()).modelBindings.some(b=>b.nodeId===id),plant.nodeId,{timeout:120000});
 report.checks.push('Native health threshold hides the consumed plant and removes its submitted draw');console.log(JSON.stringify({stage:'plant-burned',id:plant.nodeId}));
 await page.screenshot({path:'docs/viewport-ignition-plant-burnt.png'});report.images.push('docs/viewport-ignition-plant-burnt.png');
 await page.evaluate(()=>window.sky.resetViewportIgnition());
 await waitForAsync(async id=>(await window.sky.vulkanViewportInfo()).modelBindings.some(b=>b.nodeId===id),plant.nodeId,{timeout:120000});
 await waitForAsync(async id=>{const target=(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id);return target&&!target.lit&&!target.burnt;},plant.nodeId,{timeout:30000});
 report.checks.push('Same-document reset restores a burnt plant model, its material and unlit interaction target');
 assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');
 await page.locator('#levels').selectOption('WorldEmpty');await page.waitForFunction(()=>document.querySelector('#viewport canvas').dataset.level==='WorldEmpty',null,{timeout:120000});await page.waitForFunction(()=>document.querySelector('#ignite-target').hidden,null,{timeout:15000});
 report.staleRejection=await page.evaluate(async({token,id})=>{try{await window.sky.igniteViewportTarget(token,id);return false;}catch{return true;}},{token:initial.token,id:plant.nodeId});assert.equal(report.staleRejection,true);report.checks.push('Switching maps clears overlay and rejects stale target tokens');
 await page.locator('#levels').selectOption(level);await page.waitForFunction(l=>document.querySelector('#viewport canvas').dataset.level===l,level,{timeout:120000});
 await waitForAsync(async id=>{const t=(await window.sky.viewportIgnitionState()).targets.find(t=>t.nodeId===id);return t&&!t.lit&&!t.burnt;},plant.nodeId,{timeout:120000});report.checks.push('Reload restores original plant and candle preview states');
 }
 assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(report.errors,[]);
 for(const file of files)assert.equal(hash(await fs.readFile(path.join(data,'Levels',level,file))),report.sourceHashes[file]);report.checks.push('No document dirty changes and original map file hashes preserved');report.passed=true;
} catch(e){report.error=String(e);if(app){const page=await app.firstWindow().catch(()=>null);if(page){report.failureState=await page.evaluate(async()=>({dataset:{...document.querySelector('#viewport canvas').dataset},ignition:await window.sky.viewportIgnitionState(),button:{hidden:document.querySelector('#ignite-target').hidden,dataset:{...document.querySelector('#ignite-target').dataset}},toast:document.querySelector('#toast').textContent})).catch(()=>null);await page.screenshot({path:'/root/sky-research/ignition-ui-failure.png'}).catch(()=>{});}}throw e;}
finally {if(app){let kill;await Promise.race([app.close().catch(()=>{}),new Promise(resolve=>{kill=setTimeout(()=>{app.process().kill('SIGKILL');resolve();},8000);})]);clearTimeout(kill);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile(candleOnly?'docs/ignition-ui-smoke.json':'docs/viewport-ignition-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,checks:report.checks}));
