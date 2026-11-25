import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';

const data='/root/sky-research/original-runtime-corpus',temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-author-ui-'));
const hash=bytes=>createHash('sha256').update(bytes).digest('hex');
const profiles=[['douyin','https://v.douyin.com/bND5tY3shLY/'],['kuaishou','https://v.kuaishou.com/n7yZI5Xw'],['bilibili','https://b23.tv/h075pRB'],['xiaohongshu','https://xhslink.cn/o/5oNuwxXZexs'],['github','https://github.com/XianXiaoWei']];
const report={passed:false,scope:'Production desktop Electron/preload/IPC and author dialog in Linux Chromium. System browser launch is captured at shell.openExternal; Windows native browser launch is not inferred.',checks:[],errors:[]};let app;
try{
 const source=path.join(data,'Levels/WorldEmpty/Objects.level.bin'),sourceSha=hash(await fs.readFile(source));
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();page.on('pageerror',error=>report.errors.push(error.message));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='WorldEmpty',undefined,{timeout:120000});
 await app.evaluate(({shell})=>{globalThis.authorOpened=[];shell.openExternal=async url=>{globalThis.authorOpened.push(url);};});
 const before=await page.evaluate(()=>window.sky.environmentRuntimeInfo());
 await page.locator('#author').click();await page.locator('#author-dialog').waitFor({state:'visible'});
 assert.equal(await page.locator('#author-title').textContent(),'作者介绍');assert.equal(await page.locator('.author-card').count(),5);
 for(const [id,url] of profiles){
  const card=page.locator(`.author-card[data-platform="${id}"]`);assert.equal(await card.locator('a').getAttribute('href'),url);
  await card.locator('a').click();await card.locator('button').click();await page.waitForFunction(()=>document.querySelector('#author-message').textContent.includes('已复制'));
  assert.equal(await app.evaluate(({clipboard})=>clipboard.readText()),url);
 }
 assert.deepEqual(await app.evaluate(()=>globalThis.authorOpened),profiles.map(([,url])=>url));
 await page.evaluate(()=>Object.defineProperty(navigator,'clipboard',{configurable:true,value:{writeText:()=>Promise.reject(new Error('Test fallback'))}}));
 await page.locator('.author-card[data-platform="douyin"] button').click();assert.equal(await app.evaluate(({clipboard})=>clipboard.readText()),profiles[0][1]);
 assert.equal(await page.locator('.author-copy-buffer').count(),0);report.checks.push('Five exact social links, dedicated desktop IPC, system-browser dispatch and both clipboard paths');
 const qr=page.locator('.author-qr-preview img');await qr.evaluate(img=>img.decode());assert.deepEqual(await qr.evaluate(img=>[img.naturalWidth,img.naturalHeight]),[1040,1040]);
 const original=await fs.readFile('/storage/emulated/0/Download/地图编辑器/赞赏码.png');
 for(const name of ['src/renderer/author-appreciation.png','dist/author-appreciation.png'])assert.equal(hash(await fs.readFile(name)),hash(original));
 report.qr={width:1040,height:1040,sha256:hash(original),originalBytesPreserved:true};
 for(const [width,height] of [[1500,940],[1000,680]]){
  await app.evaluate(({BrowserWindow},{width,height})=>BrowserWindow.getAllWindows()[0].setSize(width,height),{width,height});
  await page.waitForTimeout(250);
  assert.equal(await page.locator('#author-dialog').evaluate(el=>el.scrollWidth>el.clientWidth),false);
  assert.equal(await page.locator('header').evaluate(el=>el.scrollWidth>el.clientWidth),false);
  await page.screenshot({path:`evidence/author-profile-${width}.png`});
 }
 await page.locator('.author-qr-preview').click();assert.equal(await page.locator('#author-content').isVisible(),false);assert.equal(await page.locator('#author-appreciation').isVisible(),true);
 await page.screenshot({path:'evidence/author-appreciation.png'});
 await page.locator('#author-appreciation button').click();assert.equal(await page.locator('#author-content').isVisible(),true);
 await page.keyboard.press('Escape');assert.equal(await page.locator('#author-dialog').isVisible(),false);assert.equal(await page.locator('#author').evaluate(el=>el===document.activeElement),true);
 await page.locator('#author').click();await page.locator('#close-author').click();assert.equal(await page.locator('#author-dialog').isVisible(),false);
 report.checks.push('Original QR thumbnail, full-size view and return; desktop/minimum-window layouts; close/Escape/focus return');
 const {frame:beforeFrame,...beforeState}=before;
 const {frame:afterFrame,...afterState}=await page.evaluate(()=>window.sky.environmentRuntimeInfo());
 assert.deepEqual(afterState,beforeState);assert.ok(afterFrame>=beforeFrame);assert.equal(hash(await fs.readFile(source)),sourceSha);
 assert.equal(await page.locator('#dirty').textContent(),'所有修改已保存');assert.deepEqual(report.errors,[]);
 report.sourceUnchanged=true;report.checks.push('Editor shared runtime state, source map and saved status remain unchanged');report.passed=true;
}catch(error){report.error=String(error);process.exitCode=1;if(app)await (await app.firstWindow()).screenshot({path:'/root/sky-research/author-ui-failure.png'}).catch(()=>{});}
finally{
 if(app){const timer=setTimeout(()=>app.process().kill('SIGKILL'),8000);await app.close().catch(()=>{});clearTimeout(timer);}
 await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/author-profile-smoke.json',JSON.stringify(report,null,2)+'\n');
}
console.log(JSON.stringify(report));
