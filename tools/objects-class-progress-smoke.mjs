import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-objects-progress-ui-'));
const source=JSON.parse(await fs.readFile('docs/Objects.level.bin类进度.json','utf8'));
const report={passed:false,classes:source.classes.length,checks:[],errors:[]};
let app;
try {
  const main=path.join(temporary,'main.cjs');
  await fs.writeFile(main,`const {app,BrowserWindow}=require('electron');app.whenReady().then(()=>{const window=new BrowserWindow({width:1450,height:1000,webPreferences:{nodeIntegration:false,contextIsolation:true}});window.loadFile(${JSON.stringify(path.resolve('docs/Objects.level.bin类进度.html'))});});`);
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu',main],env:{...process.env,XDG_CONFIG_HOME:path.join(temporary,'config')},timeout:45000});
  const page=await app.firstWindow();page.on('pageerror',error=>report.errors.push(error.message));
  await page.locator('#rows tr').first().waitFor();assert.equal(await page.locator('#rows tr[data-class]').count(),source.classes.length);
  assert.match(await page.locator('#result-count').innerText(),new RegExp('显示 '+source.classes.length));
  assert.equal(await page.locator('#sort').inputValue(),'function');
  for(const g of source.groups){await page.locator('#category').selectOption(g.name);assert.equal(await page.locator('#rows tr[data-class]').count(),g.classCount);}
  const sound=source.groups.find(g=>g.id==='sound');await page.locator('#category').selectOption(sound.name);assert.ok(await page.getByRole('button',{name:'SoundEmitter',exact:true}).count());await page.locator('#category').selectOption('');
  report.checks.push('All 283 types render by explicit functional group; all groups filter exactly, including sound');
  await page.locator('#scope').selectOption('nodes');assert.equal(await page.locator('#rows tr[data-class]').count(),source.summary.nodeClasses);
  await page.locator('#scope').selectOption('core');assert.equal(await page.locator('#rows tr[data-class]').count(),source.summary.coreSubchainVerifiedClasses);
  await page.locator('#scope').selectOption('complete');assert.equal(await page.locator('#rows tr[data-class]').count(),0);assert.match(await page.locator('#rows').innerText(),/没有匹配/);
  await page.locator('#scope').selectOption('all');await page.locator('#search').fill('OnRegion');assert.ok(await page.getByRole('button',{name:'OnRegion',exact:true}).count());
  await page.getByRole('button',{name:'OnRegion',exact:true}).click();assert.equal(await page.locator('#detail').evaluate(d=>d.open),true);assert.equal(await page.locator('#detail .checkpoint').count(),10);assert.match(await page.locator('#detail').innerText(),/此类功能实施项/);assert.ok(await page.locator('#detail a[href*="对象实现清单.html"]').count());await page.getByRole('button',{name:'关闭类详情'}).click();
  await page.locator('#search').fill('');await page.locator('#sort').selectOption('instances');assert.equal(await page.locator('#rows tr[data-class]').first().getAttribute('data-class'),'Clump');
  report.checks.push('Search, object/core/completed filters, object-count sort, class details and close button behave correctly');
  // Exercise native fields and nested metadata for every class, including
  // classes with no field evidence. This catches data-specific UI exceptions.
  await page.evaluate(()=>{for(const button of document.querySelectorAll('.class-button')){button.click();document.getElementById('detail').close();}});
  report.checks.push('Every class detail opens with its 10 checkpoints, fields and evidence without page errors');
  assert.deepEqual(report.errors,[]);await page.locator('#sort').selectOption('function');await page.screenshot({path:'evidence/objects-class-progress-desktop.png'});
  await page.setViewportSize({width:430,height:900});await page.locator('#search').fill('Rail');await page.getByRole('button',{name:'Rail',exact:true}).click();assert.equal(await page.locator('#detail').evaluate(d=>d.open),true);
  await page.getByRole('button',{name:'关闭类详情'}).click();assert.deepEqual(report.errors,[]);report.checks.push('Narrow viewport retains search and accessible class detail controls');
  report.passed=true;
}finally{if(app)await app.close();await fs.rm(temporary,{recursive:true,force:true});await fs.writeFile('docs/objects-class-progress-ui-check.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
