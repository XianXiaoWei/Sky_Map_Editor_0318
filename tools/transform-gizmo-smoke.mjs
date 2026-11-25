import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import crypto from 'node:crypto';
import {execFileSync} from 'node:child_process';

const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-transform-ui-'));
const report={passed:false,checks:[],errors:[],scope:'Actual Vulkan canvas selection and translation/rotation/scale handles; Linux software Vulkan, not Windows hardware FPS.'};
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sourceFile=path.join(data,'Levels/DayHubCave/Objects.level.bin'),hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const originalHash=hash(await fs.readFile(sourceFile));
let app;
try {
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,GALLIVM_PERF:'nopt',SKY_WINDOWS_CANVAS:'1',SKY_WINDOWS_NATIVE:'0',XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));
 await page.addStyleTag({content:'#viewport{width:420px;height:360px}'});
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 await page.locator('#levels').selectOption('DayHubCave');await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='DayHubCave',undefined,{timeout:120000});
 for(const id of ['translate','rotate','scale']){const result=await page.locator('#'+id).evaluate(e=>{const r=e.getBoundingClientRect(),hit=document.elementFromPoint(r.x+r.width/2,r.y+r.height/2);return !!hit&&(hit===e||e.contains(hit));});assert.ok(result,`${id} reachable at 420px without hiding product controls`);}
 report.toolbar={width:420,translate:true,rotate:true,scale:true,cameraPanelVisible:await page.locator('#camera-controller').isVisible()};
 console.log('map ready');await page.locator('#search').fill('LevelMesh');
 const sequence=()=>page.evaluate(()=>Number(document.querySelector('#viewport canvas').dataset.frameSequence));
 const next=async before=>page.waitForFunction(before=>{const c=document.querySelector('#viewport canvas');if(c.dataset.vulkanError)throw new Error(c.dataset.vulkanError);return Number(c.dataset.frameSequence)>before;},before,{timeout:90000});
 let before=await sequence();await page.locator('#tree .tree-row[data-node-id="339"]').click();await next(before);console.log('selected');
 before=await sequence();await page.locator('#focus').click();await next(before);
 for(const mode of ['translate','rotate','scale']){
  before=await sequence();await page.locator('#'+mode).click();await next(before);
  const dataset=await page.locator('#viewport canvas').evaluate(c=>({...c.dataset})),matrix=JSON.parse(dataset.transformMatrix),origin=new THREE.Vector3().fromArray(matrix,12);
  const camera=new THREE.PerspectiveCamera();camera.projectionMatrix.fromArray(JSON.parse(dataset.cameraProjection));camera.matrixWorld.fromArray(JSON.parse(dataset.cameraMatrix));camera.matrixWorldInverse.copy(camera.matrixWorld).invert();camera.position.setFromMatrixPosition(camera.matrixWorld);
  const fov=2*Math.atan(1/camera.projectionMatrix.elements[5]),radius=origin.distanceTo(camera.position)*Math.min(1.9*Math.tan(fov/2),7)*.8/4;
  const x=mode==='scale'?new THREE.Vector3().fromArray(matrix,0).normalize():new THREE.Vector3(1,0,0),y=new THREE.Vector3(0,1,0),rect=await page.locator('#viewport canvas').boundingBox();
  const screen=p=>{const v=p.clone().project(camera);return {x:rect.x+(v.x+1)*rect.width/2,y:rect.y+(1-v.y)*rect.height/2};};
  let start,end,axis;
  const candidates=mode==='rotate'?Array.from({length:72},(_,i)=>{const a=i*Math.PI/36;return [origin.clone().addScaledVector(x,Math.cos(a)*radius*.5).addScaledVector(y,Math.sin(a)*radius*.5),origin.clone().addScaledVector(x,Math.cos(a+.45)*radius*.5).addScaledVector(y,Math.sin(a+.45)*radius*.5),'Z'];}):[.5,.45,.35,.65,.25,-.5].map(t=>[origin.clone().addScaledVector(x,radius*t),origin.clone().addScaledVector(x,radius*(t+.2*Math.sign(t))),'X']);
  for(const [p,q,wanted] of candidates){const a=screen(p),b=screen(q);if(a.x<rect.x||a.x>rect.x+rect.width||a.y<rect.y+100||a.y>rect.y+rect.height-45)continue;const unobstructed=await page.evaluate(({a,b})=>[a,b].every(p=>document.elementFromPoint(p.x,p.y)?.tagName==='CANVAS'),{a,b});if(!unobstructed)continue;await page.mouse.move(a.x,a.y);const hovered=await page.locator('#viewport canvas').getAttribute('data-transform-axis');if(hovered===wanted){start=a;end=b;axis=hovered;break;}}
  assert.ok(start,`Find an actual ${mode} handle through Three picking`);
  await page.mouse.down();await page.mouse.move(end.x,end.y,{steps:8});await page.mouse.up();
  await page.waitForFunction(old=>{const c=document.querySelector('#viewport canvas');if(c.dataset.vulkanError)throw new Error(c.dataset.vulkanError);return c.dataset.transformMatrix!==old;},dataset.transformMatrix,{timeout:90000});
  const transformed=JSON.parse(await page.locator('#viewport canvas').getAttribute('data-transform-matrix'));assert.ok(transformed.every(Number.isFinite));assert.notDeepEqual(transformed,matrix);
  await page.locator('#dirty').filter({hasText:'未保存'}).waitFor();
  const visibility=await page.evaluate(async()=>{
   const originalRaf=window.requestAnimationFrame,waiting=[];window.requestAnimationFrame=callback=>{waiting.push(callback);return 999999;};
   let binding;
   try{
    await new Promise(resolve=>setTimeout(resolve,600));const info=await window.sky.vulkanViewportInfo();binding=info.modelBindings.find(d=>d.nodeId===339);if(!binding?.triangles)throw new Error('Selected model has no drawable triangles');
    const canvas=document.querySelector('#viewport canvas'),vp=JSON.parse(canvas.dataset.viewProjection),camera=JSON.parse(canvas.dataset.cameraMatrix),width=192,height=Math.max(1,Math.round(192*canvas.height/canvas.width)),draw=()=>window.sky.vulkanFrame(width,height,vp,camera,undefined,undefined,'basic');
    const visible=await draw(),hidden=binding.model.slice();hidden[12]+=1e8;hidden[13]+=1e8;hidden[14]+=1e8;
    await window.sky.vulkanModelTransforms([{nodeId:339,matrix:hidden}]);const absent=await draw();await window.sky.vulkanModelTransforms([{nodeId:339,matrix:binding.model}]);const restored=await draw();
    let changedPixels=0,stablePixels=0;for(let i=0;i<visible.pixels.length;i+=4){let stable=true,change=0;for(let k=0;k<3;k++){stable&&=Math.abs(visible.pixels[i+k]-restored.pixels[i+k])<=1;change=Math.max(change,Math.abs(visible.pixels[i+k]-absent.pixels[i+k]));}if(stable){stablePixels++;if(change>=5)changedPixels++;}}
    return {nodeId:339,triangles:binding.triangles,width,height,changedPixels,stablePixels,method:'Frozen A/B/A Vulkan frames, target model alone moved out of view and restored'};
   }finally{if(binding)await window.sky.vulkanModelTransforms([{nodeId:339,matrix:binding.model}]);window.requestAnimationFrame=originalRaf;for(const callback of waiting)originalRaf.call(window,callback);}
  });
  assert.ok(visibility.changedPixels>10,`${mode} model must contribute visible pixels after editing`);
  const screenshot=`docs/transform-${mode}-viewport.png`;await fs.writeFile(screenshot,Buffer.from(await page.locator('#viewport canvas').evaluate(c=>c.toDataURL('image/png').split(',')[1]),'base64'));
  report.checks.push({mode,axis,before:matrix,after:transformed,visibility,frameSequence:await sequence(),active:await page.locator('#'+mode).evaluate(e=>e.classList.contains('active')),screenshot});
  console.log(JSON.stringify(report.checks.at(-1)));
 }
 const pose=await page.locator('#viewport canvas').getAttribute('data-transform-matrix'),dirty=await page.locator('#dirty').textContent();
 if(process.env.SKY_TRANSFORM_SKIP_RECOVERY!=='1'){
 const children=execFileSync('ps',['-o','pid=','-o','comm=','--ppid',String(app.process().pid)],{encoding:'utf8'}),native=children.split('\n').map(l=>l.trim().split(/\s+/)).find(([,name])=>name==='sky-vulkan');assert.ok(native,'Isolated test app owns its Vulkan child');process.kill(Number(native[0]),'SIGKILL');
 // The three gizmo checks above use real pointer events. Crash recovery
 // triggers invalidation directly so Playwright's paint acknowledgement
 // cannot block on the renderer we deliberately killed.
 await page.locator('#rotate').evaluate(button=>button.click());await page.locator('#viewport-recover').waitFor({state:'visible',timeout:90000});
 before=await sequence();await page.locator('#viewport-recover').click();await page.waitForFunction(before=>{const c=document.querySelector('#viewport canvas');return !c.dataset.vulkanError&&Number(c.dataset.frameSequence)>before;},before,{timeout:90000});assert.equal(await page.locator('#viewport-recover').isVisible(),false);assert.equal(await page.locator('#viewport canvas').getAttribute('data-transform-matrix'),pose);assert.equal(await page.locator('#dirty').textContent(),dirty);
 report.recovery={isolatedNativeCrash:true,frameSequence:await sequence(),unsavedEditRetained:true,poseRetained:true};
 }else report.scope+=' This focused run verifies the three actual gizmos and visible Vulkan pixels; native process crash/recovery is excluded.';
 assert.equal(hash(await fs.readFile(sourceFile)),originalHash);report.sourceUnchanged=true;
 assert.deepEqual(report.errors,[]);report.passed=true;
}catch(error){report.error=String(error);if(app){const page=app.windows()[0];if(page&&!page.isClosed()){report.status=await page.locator('#status').textContent({timeout:3000}).catch(()=>null);report.toast=await page.locator('#toast').textContent({timeout:3000}).catch(()=>null);report.dataset=await page.locator('#viewport canvas').evaluate(c=>({...c.dataset})).catch(()=>null);}}throw error;}
finally {if(app){const timer=setTimeout(()=>app.process().kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}report.diagnostics=await fs.readFile(path.join(temp,'profile','render-diagnostics.log'),'utf8').catch(()=>undefined);await fs.rm(temp,{recursive:true,force:true});await fs.writeFile(process.env.SKY_TRANSFORM_REPORT??'docs/transform-gizmo-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,checks:report.checks.length}));
