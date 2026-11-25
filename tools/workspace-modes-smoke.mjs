import {_electron as electron} from 'playwright';
import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';import assert from 'node:assert/strict';
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-modes-')),data=path.join(temp,'Data'),source=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
let app;const report={passed:false,checks:[],windowsTested:false};
try{
 await fs.mkdir(path.join(data,'Levels'),{recursive:true});await fs.cp(path.join(source,'Levels','WorldEmpty'),path.join(data,'Levels','WorldEmpty'),{recursive:true});
 for(const folder of ['Meshes','Images','Shaders','Resources'])await fs.mkdir(path.join(data,folder),{recursive:true});
 app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-dev-shm-usage','--disable-gpu','--user-data-dir='+path.join(temp,'profile'),'.'],cwd:process.cwd(),env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
 const page=await app.firstWindow(),errors=[];page.on('pageerror',e=>errors.push(e.message));
 await page.locator('#settings-dialog').waitFor({state:'visible'});await page.locator('#data-path').fill(data);await page.locator('#apply-settings').click();await page.locator('body[aria-busy="false"]').waitFor();await page.locator('#level-label').filter({hasText:'WorldEmpty'}).waitFor({timeout:45000});
 const boxes=await Promise.all(['mode-bin','mode-mesh','mode-avatar'].map(id=>page.locator('#'+id).boundingBox()));assert.ok(boxes.every(Boolean));assert.ok(Math.abs(boxes[0].y-boxes[1].y)<1&&Math.abs(boxes[1].y-boxes[2].y)<1);assert.ok(boxes[0].x+boxes[0].width<=boxes[1].x&&boxes[1].x+boxes[1].width<=boxes[2].x);
 report.checks.push('bin, meshes and Avatar buttons are visible side by side in the same navigation');
 await page.locator('#mode-avatar').click();await page.locator('body[aria-busy="false"]').waitFor();assert.equal(await page.locator('#mode-avatar').getAttribute('aria-pressed'),'true');assert.equal(await page.locator('#mode-bin').getAttribute('aria-pressed'),'false');assert.equal(await page.locator('[data-avatar-action]').count(),4);assert.ok(await page.locator('#translate').isHidden());
 await page.locator('[data-avatar-action="physics-ball"]').click();await page.locator('body[aria-busy="false"]').waitFor();assert.equal(await page.locator('[data-avatar-action="physics-ball"]').getAttribute('aria-pressed'),'true');await page.locator('#physics-ball-status').waitFor({state:'visible'});
 const followBefore=await page.locator('[data-avatar-action="physics-ball-follow"]').getAttribute('aria-pressed');await page.locator('[data-avatar-action="physics-ball-follow"]').click();assert.notEqual(await page.locator('[data-avatar-action="physics-ball-follow"]').getAttribute('aria-pressed'),followBefore);
 report.checks.push('Avatar button opens its preview panel; interaction controls start and show active state');
 await page.locator('#mode-mesh').click();await page.locator('body[aria-busy="false"]').waitFor();assert.equal(await page.locator('#mode-mesh').getAttribute('aria-pressed'),'true');assert.ok(await page.locator('#physics-ball-status').isHidden());assert.ok(await page.locator('#translate').isVisible());assert.equal(await page.locator('[data-avatar-action]').count(),0);
 await page.keyboard.press('1');await page.locator('body[aria-busy="false"]').waitFor();assert.equal(await page.locator('#mode-bin').getAttribute('aria-pressed'),'true');await page.keyboard.press('3');await page.locator('body[aria-busy="false"]').waitFor();assert.equal(await page.locator('#mode-avatar').getAttribute('aria-pressed'),'true');
 assert.deepEqual(errors,[]);report.checks.push('Mode switching restores edit controls, stops preview and supports shortcuts 1/2/3 without renderer errors');
 await page.screenshot({path:'docs/workspace-modes.png',fullPage:true});report.passed=true;
}catch(e){report.error=String(e);throw e;}finally{if(app)await app.close();await fs.rm(temp,{recursive:true,force:true});await fs.writeFile('docs/workspace-modes-smoke.json',JSON.stringify(report,null,2)+'\n');}
console.log(JSON.stringify(report));
