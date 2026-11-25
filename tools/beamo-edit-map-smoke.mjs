import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-beamo-edit-'));
const report={passed:false,level:'SkyHub2',scope:'Actual inspector translation and shared LevelMaterial texture edits, GPU scene submission/completed frames, undo and map cleanup. Unsaved editor projection, not native Barn hot reload or full original lifecycle.',checks:[],errors:[]};
const hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const files=['Objects.level.bin','BstBaked.meshes'];
report.sourceHashes=Object.fromEntries(await Promise.all(files.map(async file=>[file,hash(await fs.readFile(path.join(data,'Levels/SkyHub2',file)))])));
let app;
const stage=name=>{report.stage=name;console.log(JSON.stringify({stage:name,time:new Date().toISOString()}));};
try{
 stage('launch');
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 app.process().stderr?.on('data',chunk=>process.stderr.write(chunk));
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));
 await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1450,950));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:60000});
 await page.locator('#levels').selectOption('SkyHub2');await page.locator('#status').filter({hasText:'已打开 SkyHub2'}).waitFor({timeout:120000});
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='SkyHub2',null,{timeout:120000});
 stage('map-loaded');
 await page.locator('#material-animation').click();
 const state=()=>page.evaluate(async()=>({dataset:{...document.querySelector('#viewport canvas').dataset},info:await window.sky.vulkanViewportInfo()}));
 const waitScene=async (before,expected={})=>{
  const deadline=Date.now()+180000;let last;
  while(Date.now()<deadline){
   last=await state();const {dataset:d,info}=last;
   const status=await page.locator('#status').textContent();if(status==='Vulkan 视口不可用')throw new Error(await page.locator('#toast').textContent());
   if(Number(d.renderedSceneRevision)>Number(before.dataset.renderedSceneRevision)&&Number(d.frameSequence)>Number(before.dataset.frameSequence)&&d.renderedGeometrySha256===info.geometrySha256&&info.beamoInstances===before.info.beamoInstances&&(!expected.geometrySha256||info.geometrySha256===expected.geometrySha256)&&(!expected.changedFrom||info.geometrySha256!==expected.changedFrom)&&(!expected.texture||info.textures.includes(expected.texture)))return last;
   await new Promise(resolve=>setTimeout(resolve,250));
  }
  throw new Error('Expected completed scene not displayed: '+JSON.stringify({expected,dataset:last?.dataset,geometrySha256:last?.info.geometrySha256}));
 };
 const original=await state(),binding=original.info.modelBindings.find(b=>b.beamoPass==='primary'&&b.group==='Opaque'&&b.materialNodeId===1959);
 assert.ok(binding,'Original shared Beamo material must be drawn');const nodeId=binding.beamoNodeIds?.[0]??binding.nodeId;
 report.nodeId=nodeId;report.materialNodeId=binding.materialNodeId;
 const geometry=()=>page.evaluate(async id=>{const g=await window.sky.beamoGeometry(id),bytes=new Uint8Array(g.vertices);const digest=await crypto.subtle.digest('SHA-256',bytes);return {matrix:g.matrix,vertexSha256:[...new Uint8Array(digest)].map(x=>x.toString(16).padStart(2,'0')).join('')};},nodeId);
 const initialGeometry=await geometry();report.originalScene={geometrySha256:original.info.geometrySha256,renderedGeometrySha256:original.dataset.renderedGeometrySha256,beamoInstances:original.info.beamoInstances};
 stage('translate');
 await page.locator('#search').fill('Beamo');await page.locator(`#tree .tree-row[data-node-id="${nodeId}"]`).click();
 const input=page.locator('input[title="transform[12]"]');const oldX=Number(await input.inputValue());
 await input.fill(String(oldX+8));await input.press('Tab');await page.locator('#status').filter({hasText:'已编辑 Beamo.transform'}).waitFor({timeout:120000});
 const translated=await waitScene(original,{changedFrom:original.info.geometrySha256}),nextGeometry=await geometry();assert.equal(nextGeometry.matrix[12],Math.fround(oldX+8));assert.notEqual(nextGeometry.vertexSha256,initialGeometry.vertexSha256);assert.notEqual(translated.info.geometrySha256,original.info.geometrySha256);assert.equal(translated.info.beamoInstances,original.info.beamoInstances);
 report.checks.push({name:'inspector-translation',originalX:oldX,editedX:nextGeometry.matrix[12],originalGeometry:initialGeometry.vertexSha256,editedGeometry:nextGeometry.vertexSha256,renderedSceneRevision:translated.dataset.renderedSceneRevision});
 stage('undo-translation');
 await page.locator('#undo').click();await page.locator('#dirty').filter({hasText:'所有修改已保存'}).waitFor({timeout:120000});const restored=await waitScene(translated,{geometrySha256:original.info.geometrySha256});assert.equal((await geometry()).vertexSha256,initialGeometry.vertexSha256);assert.equal(restored.info.geometrySha256,original.info.geometrySha256);
 await page.locator('#search').fill('LevelMaterial');await page.locator('#tree .tree-row[data-node-id="1959"]').click();
 await page.locator('[data-field-id="n1959/p7"] > details > summary').click();await page.locator('[data-field-id="n1959/p7/a2"] > details > summary').click();
 const texture=page.locator('[data-field-id="n1959/p7/a2/p0"] input');report.originalTexture=await texture.inputValue();await texture.fill('Black');await texture.press('Tab');
 stage('material-texture');
 await page.locator('#status').filter({hasText:'已编辑 LevelMaterial.tex'}).waitFor({timeout:180000});const materialEdit=await waitScene(restored,{texture:'Black',changedFrom:original.info.geometrySha256});assert.ok(materialEdit.info.textures.includes('Black'));assert.notEqual(materialEdit.info.geometrySha256,restored.info.geometrySha256);assert.equal(materialEdit.info.beamoInstances,original.info.beamoInstances);
 assert.deepEqual(await geometry(),initialGeometry,'A material-only edit must retain original geometry bytes and transform');
 const owners=materialEdit.info.modelBindings.filter(b=>b.beamoPass==='primary'&&b.materialNodeId===1959).flatMap(b=>b.beamoNodeIds??[b.nodeId]);assert.deepEqual(owners,binding.beamoNodeIds??[binding.nodeId]);
 report.checks.push({name:'shared-material-texture',texture:'Black',owners:owners.length,renderedSceneRevision:materialEdit.dataset.renderedSceneRevision});
 stage('undo-material');
 await page.locator('#undo').click();await page.locator('#dirty').filter({hasText:'所有修改已保存'}).waitFor({timeout:120000});const materialRestored=await waitScene(materialEdit,{geometrySha256:original.info.geometrySha256});assert.equal(materialRestored.info.geometrySha256,original.info.geometrySha256);
 stage('map-cleanup');await page.locator('#levels').selectOption('WorldEmpty');await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:120000});const empty=await state();assert.equal(empty.info.modelDraws,0);assert.equal(empty.info.beamoInstances,0);report.checks.push({name:'undo-and-map-cleanup',emptyModelDraws:empty.info.modelDraws});
 assert.deepEqual(report.errors,[]);for(const file of files)assert.equal(hash(await fs.readFile(path.join(data,'Levels/SkyHub2',file))),report.sourceHashes[file]);report.passed=true;
}catch(error){report.error=String(error);console.error(error);await fs.writeFile('docs/beamo-edit-map-smoke.json',JSON.stringify(report,null,2)+'\n');if(app){const page=await app.firstWindow().catch(()=>null);if(page){report.status=await page.locator('#status').textContent().catch(()=>null);report.toast=await page.locator('#toast').textContent().catch(()=>null);await page.screenshot({path:'/root/sky-research/beamo-edit-ui-failure.png'}).catch(()=>{});}}throw error;}
finally{if(app){let kill;await Promise.race([app.close().catch(()=>{}),new Promise(resolve=>{kill=setTimeout(()=>{app.process().kill('SIGKILL');resolve();},8000);})]);clearTimeout(kill);}await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/beamo-edit-map-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,checks:report.checks.length,nodeId:report.nodeId}));
