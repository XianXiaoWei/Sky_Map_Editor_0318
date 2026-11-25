import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-shake-capture-'));let app;
try{
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow();await app.evaluate(({BrowserWindow})=>BrowserWindow.getAllWindows()[0].setSize(1200,900));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus');await page.locator('#apply-settings').click();await page.locator('body[aria-busy="false"]').waitFor();
 await page.locator('#mode-avatar').click();await page.locator('body[aria-busy="false"]').waitFor();await page.locator('#levels').selectOption('Dawn');await page.locator('body[aria-busy="false"]').waitFor({timeout:60000});
 await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Dawn',null,{timeout:60000});
 const id=await page.locator('#avatar-camera-event option').evaluateAll(options=>options.find(o=>!o.disabled&&o.textContent.includes('SetCameraShake'))?.value);if(!id)throw new Error('No complete SetCameraShake candidate');
 await page.locator('#avatar-camera-event').selectOption(id);await page.locator('#avatar-camera-event-start').click();await page.waitForFunction(()=>JSON.parse(document.querySelector('#avatar-camera-event-status').dataset.state).positionShake?.some(v=>Math.abs(v)>.01),null,{timeout:30000});
 await page.screenshot({path:'docs/avatar-camera-shake-preview.png'});console.log(JSON.stringify({captured:'docs/avatar-camera-shake-preview.png',event:id}));
}finally{if(app){const timer=setTimeout(()=>app.process().kill(),8000);await app.close().catch(()=>{});clearTimeout(timer);}await fs.rm(temp,{recursive:true,force:true});}
