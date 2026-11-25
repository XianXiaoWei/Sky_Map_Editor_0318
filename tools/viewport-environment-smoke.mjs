import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-environment-ui-'));
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const report={passed:false,runtime:process.platform+' '+process.arch,images:[],checks:[],limitation:'Static map defaults and spatial environment, spherical atmosphere background and original Sun shader. Original terrain/skirt GLSL now renders real map packed attributes and textures, with HDR linear blending and preview display adaptation. Scene probe, point lights, shadows, original model shading, full lighting and original luminance feedback remain incomplete; cloud depth/coarse/fine/Card/FogUpsample/Tonemap are now connected with explicit editor exposure adaptation.'};
let app;
try {
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
 const page=await app.firstWindow(),errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.locator('#level-label').filter({hasText:'WorldEmpty'}).waitFor({timeout:45000});
 const read=()=>page.locator('#viewport canvas').evaluate(canvas=>{const data=canvas.getContext('2d').getImageData(0,0,canvas.width,canvas.height).data;let nonblack=0;const colors=new Set();for(let i=0;i<data.length;i+=4){if(data[i]+data[i+1]+data[i+2]>15)nonblack++;colors.add(data.slice(i,i+3).join(','));}return {sequence:Number(canvas.dataset.frameSequence),nonblack,colors:colors.size,pixels:data.length/4};});
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty');
 const empty=await read();assert.ok(empty.nonblack>empty.pixels*.1);assert.ok(empty.colors>10);report.checks.push('Empty map presents an actual Vulkan atmosphere, not a solid background');
 await fs.mkdir('docs/shader-effects',{recursive:true});
 const emptyFile='docs/shader-effects/WorldEmpty-viewport.png';await page.screenshot({path:emptyFile});report.images.push({level:'WorldEmpty',file:emptyFile,...empty});
 for(const name of ['Dawn','Prairie_ButterflyFields','Sunset']) {
  await page.locator('#levels').selectOption(name);await page.locator('#status').filter({hasText:'已打开 '+name}).waitFor({timeout:60000});
  await page.waitForFunction(level=>document.querySelector('#viewport canvas')?.dataset.level===level,name,{timeout:60000});await page.waitForTimeout(2500);
  const image=await read();assert.ok(image.nonblack>image.pixels*.25);assert.ok(image.colors>30);
  const materials=await page.evaluate(()=>window.sky.vulkanViewportInfo());assert.ok(materials.draws>0);assert.ok(materials.triangles>0);assert.ok(materials.textures.length>0);image.materials=materials;
  const file='docs/shader-effects/'+name+'-viewport.png';await page.screenshot({path:file});report.images.push({level:name,file,...image});
  const sequence=image.sequence;
  for(let i=0;i<8;i++)await page.getByRole('button',{name:'相机放大',exact:true}).click();
  await page.waitForFunction(seq=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>seq,sequence,{timeout:45000});await page.waitForTimeout(2500);
  const detail=await read(),detailFile='docs/shader-effects/'+name+'-detail.png';await page.screenshot({path:detailFile});report.images.push({level:name,file:detailFile,...detail,view:'Controller zoom; editor inspection camera, not original game spawn'});
  assert.ok(detail.colors>30);
  if(name==='Prairie_ButterflyFields'){
   const before=detail.sequence;await page.locator('#mesh-display').selectOption('light0');
   await page.waitForFunction(seq=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>seq,before,{timeout:45000});assert.equal((await page.evaluate(()=>window.sky.vulkanViewportInfo())).draws,0);
   const raw=await read();await page.locator('#mesh-display').selectOption('material');
   await page.waitForFunction(seq=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>seq,raw.sequence,{timeout:45000});assert.ok((await page.evaluate(()=>window.sky.vulkanViewportInfo())).draws>0);
   report.checks.push('Raw lighting inspection clears original material draws; restoring material mode rebuilds real terrain shaders');
  }
 }
 const before=await read();await page.getByRole('button',{name:'相机旋转向上',exact:true}).click();await page.waitForFunction(seq=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>seq,before.sequence,{timeout:45000});
 assert.notEqual((await read()).colors,before.colors);assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(errors,[]);
 report.checks.push('Map switches load original terrain/skirt shader batches and textures; orbit changes the frame and preserves source assets');report.passed=true;
}catch(error){report.error=String(error);if(app){const p=await app.firstWindow();report.status=await p.locator('#status').textContent();report.toast=await p.locator('#toast').textContent();await p.screenshot({path:'docs/shader-effects/failure.png'});}throw error;}
finally{if(app)await app.close().catch(()=>{});await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/viewport-environment-smoke.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
