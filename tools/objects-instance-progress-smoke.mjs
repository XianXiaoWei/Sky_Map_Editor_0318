import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-object-list-ui-'));
const source=JSON.parse(await fs.readFile('docs/Objects.level.bin对象实现清单.json','utf8'));
const report={passed:false,objects:source.objects.length,classes:source.classes.length,groups:source.groups.length,levels:source.files.length,checks:[],errors:[]};let app;
try{
 assert.deepEqual(source.classification.primary,['功能分类','单独类','全部实例']);
 const byClass=new Map(source.classes.map(c=>[c.name,source.objects.filter(o=>o.className===c.name)]));
 for(const c of source.classes){
  const d=JSON.parse(await fs.readFile(path.join('docs',c.json),'utf8')),members=byClass.get(c.name);
  assert.equal(d.className,c.name);assert.equal(d.functionalTasks.length,5);assert.equal(d.classProgress.checkpoints.length,10);
  assert.deepEqual(d.instances.map(o=>o.key),members.map(o=>o.key));assert.deepEqual(c.objectKeys,members.map(o=>o.key));
  const md=await fs.readFile(path.join('docs',c.markdown),'utf8');assert.ok(md.includes(c.functionRole));
 }
 assert.equal(new Set(source.classes.flatMap(c=>c.objectKeys)).size,source.objects.length);
 assert.equal(source.classes.filter(c=>!c.instances).length,3);
 report.checks.push('All 283 standalone class JSON/Markdown lists preserve function, 5 tasks, 10 checkpoints and every one of the 49,824 unique instances; zero-instance declarations retained');
 const main=path.join(temporary,'main.cjs');
 await fs.writeFile(main,`const {app,BrowserWindow}=require('electron');app.whenReady().then(()=>{const window=new BrowserWindow({width:1450,height:1000,webPreferences:{nodeIntegration:false,contextIsolation:true}});window.loadFile(${JSON.stringify(path.resolve('docs/Objects.level.bin对象实现清单.html'))});});`);
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu',main],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',error=>report.errors.push(error.message));
 await page.waitForFunction(()=>document.body.dataset.ready==='true'||document.body.dataset.error,{},{timeout:45000});
 assert.equal(await page.locator('body').getAttribute('data-error'),null);assert.equal(await page.locator('#rows tr[data-class]').count(),100);assert.equal(await page.locator('#level').count(),0);
 assert.equal(await page.evaluate(()=>REPORT.objects.length),source.objects.length);assert.match(await page.locator('#coverage').innerText(),/49,824/);
 const sorted=await page.evaluate(()=>filtered.map(c=>c.name));await page.locator('#next').click();assert.equal(await page.locator('#rows tr[data-class]').first().getAttribute('data-class'),sorted[100]);await page.locator('#previous').click();
 report.checks.push('Offline gzip defaults to function-grouped classes, with class pagination and no map primary filter');
 for(const group of source.groups){await page.locator('#category').selectOption(group.id);assert.equal(await page.evaluate(()=>filtered.length),group.classCount);}
 await page.locator('#category').selectOption('sound');assert.ok(await page.getByRole('button',{name:'SoundEmitter',exact:true}).count());
 await page.locator('#category').selectOption('');
 for(const c of source.classes){
  await page.locator('#class').selectOption(c.name);
  const observed=await page.evaluate(()=>{
   const results={count:filtered.length,endpoints:[],checkpoints:[]};
   for(const o of filtered.length?[filtered[0],filtered.at(-1)]:[]){openObject(o);results.endpoints.push(document.getElementById('detail').dataset.key);results.checkpoints.push(document.querySelectorAll('#detail > .dialog-body > .checklist > .checkpoint').length);document.getElementById('detail').close();}
   return results;
  });
  const members=byClass.get(c.name);assert.equal(observed.count,members.length);
  assert.deepEqual(observed.endpoints,members.length?[members[0].key,members.at(-1).key]:[]);assert.ok(observed.checkpoints.every(n=>n===10));
 }
 report.checks.push('Every class selects all of its cross-map instances, preserving first/last identity, own checklist and empty declarations; sound has an independent group');
 await page.locator('#back-classes').click();await page.locator('#search').fill('FloatMult');await page.getByRole('button',{name:'FloatMult',exact:true}).click();
 assert.equal(await page.locator('#detail').getAttribute('data-class'),'FloatMult');assert.equal(await page.locator('#detail .checkpoint').count(),10);await page.locator('#show-instances').click();assert.equal(await page.evaluate(()=>filtered.length),byClass.get('FloatMult').length);
 await page.locator('#back-classes').click();await page.locator('#class').selectOption('Clump');const clumps=byClass.get('Clump');await page.locator('#next').click();assert.equal(await page.locator('#rows tr[data-key]').first().getAttribute('data-key'),clumps[100].key);
 await page.locator('#back-classes').click();await page.locator('#scope').selectOption('complete');assert.equal(await page.locator('#rows tr[data-key]').count(),0);
 await page.locator('#scope').selectOption('dependencies');assert.equal(await page.evaluate(()=>filtered.length),source.objects.filter(o=>o.references.length).length);
 const owner=source.objects.find(o=>o.references.length);await page.locator('#scope').selectOption('all');await page.locator('#search').fill(owner.key);await page.locator(`#rows tr[data-key="${owner.key}"] .object-button`).click();
 await page.locator('#detail details').nth(2).locator('summary').click();await page.locator('#detail .dependency').first().click();assert.equal(await page.locator('#detail').getAttribute('data-key'),owner.references[0].target);
 await page.getByRole('button',{name:'关闭对象详情'}).click();report.checks.push('Class detail opens all instances; instance pagination, runtime/dependency filters and reference navigation preserve exact identity');
 await page.locator('#search').fill('');await page.screenshot({path:'evidence/objects-instance-progress-desktop.png'});
 await page.setViewportSize({width:430,height:900});await page.locator('#search').fill(owner.key);await page.locator(`#rows tr[data-key="${owner.key}"] .object-button`).click();assert.equal(await page.locator('#detail').evaluate(d=>d.open),true);await page.getByRole('button',{name:'关闭对象详情'}).click();
 assert.deepEqual(report.errors,[]);report.checks.push('Narrow viewport keeps search, object detail and close controls usable');report.passed=true;
}finally{if(app)await app.close();await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/objects-instance-progress-ui-check.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
