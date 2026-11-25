import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-beamo-env-'));
const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
const files=['Objects.level.bin','BstBaked.meshes'];
const report={passed:false,level:'Dawn',errors:[],bindings:[],checks:[],scope:'Actual Electron inspector and shared viewport environment owner. Bake acceptance and material identities are inspected; complete Beamo drawing, Barn loading and original environment startup remain pending.'};
report.sourceHashes=Object.fromEntries(await Promise.all(files.map(async file=>[file,hash(await fs.readFile(path.join(data,'Levels','Dawn',file)))])));
let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',e=>report.errors.push(e.message));
 await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1450,950));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:60000});
 await page.locator('#mesh-display').selectOption('light0');
 if(await page.locator('#material-animation').getAttribute('aria-pressed')==='true')await page.locator('#material-animation').click();
 await page.locator('#levels').selectOption('Dawn');
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',null,{timeout:120000});
 await page.waitForTimeout(500);
 for(const className of ['Beamo','BeamoDecal']){
  await page.locator('#search').fill(className);
  const rows=page.locator('#tree .tree-row');let selected;
  for(const row of await rows.all()){
   const nodeId=Number(await row.getAttribute('data-node-id'));
   const info=await page.evaluate(id=>window.sky.beamoBakeInfo(id).catch(()=>null),nodeId);
   if(info?.className===className&&info.accepted){selected=row;report.bindings.push(info);break;}
  }
  assert.ok(selected,`Original accepted ${className} must exist`);await selected.click();
  await page.locator('#inspect-beamo-bake').click();await page.locator('[data-beamo-bake]').waitFor();
  const actual=JSON.parse(await page.locator('[data-beamo-bake]').getAttribute('data-beamo-bake'));
  assert.deepEqual(actual,report.bindings.at(-1));assert.ok(actual.bake.lods.some(l=>l.extraPresent));
  assert.ok(actual.materials.length>0);assert.equal(actual.completeOriginalClass,false);
 }
 report.checks.push('Both original classes inspect accepted GUID/LOD records and material links through the new IPC and inspector');
 const read=()=>page.evaluate(()=>window.sky.environmentRuntimeInfo());
 const before=await read();assert.ok(before.nodes.length>0);await page.waitForTimeout(400);assert.deepEqual(await read(),before);
 const enabled=before.nodes.find(n=>n.enabled);assert.ok(enabled);
 const changed=await page.evaluate(id=>window.sky.setEnvironmentEnabled(id,false),enabled.id);
 assert.equal(changed.nodes.find(n=>n.id===enabled.id).enabled,false);assert.equal(changed.revision,before.revision+1);
 // Camera repaints sample the shared owner without advancing the paused clock.
 await page.locator('#focus').click();await page.waitForTimeout(500);assert.deepEqual(await read(),changed);
 await page.evaluate(id=>window.sky.setEnvironmentEnabled(id,true),enabled.id);
 report.environment={before,changed};report.checks.push('Paused sky/model sampling and camera repaints preserve shared timers; toggling changes only runtime enabled state and revision');
 await page.screenshot({path:'docs/beamo-environment-Dawn-inspector.png'});
 await page.locator('#levels').selectOption('WorldEmpty');await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',null,{timeout:60000});
 const empty=await read();assert.deepEqual(empty.nodes,[]);report.environment.empty=empty;
 await page.locator('#levels').selectOption('Dawn');await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',null,{timeout:120000});await page.waitForTimeout(400);
 const reset=await read();assert.deepEqual(reset.nodes,before.nodes);assert.equal(reset.revision,before.revision);
 report.environment.reset=reset;report.checks.push('Map switches create a fresh environment owner and restore the original initial state');
 assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(report.errors,[]);
 for(const file of files)assert.equal(hash(await fs.readFile(path.join(data,'Levels','Dawn',file))),report.sourceHashes[file]);
 report.passed=true;
}catch(error){report.error=String(error);if(app){const page=await app.firstWindow().catch(()=>null);if(page){report.status=await page.locator('#status').textContent().catch(()=>null);report.toast=await page.locator('#toast').textContent().catch(()=>null);await page.screenshot({path:'/root/sky-research/beamo-environment-ui-failure.png'}).catch(()=>{});}}process.exitCode=1;}
finally{if(app){const kill=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(kill);}await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/beamo-environment-map-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify({passed:report.passed,bindings:report.bindings.map(b=>({nodeId:b.nodeId,className:b.className,accepted:b.accepted})),checks:report.checks,error:report.error}));
