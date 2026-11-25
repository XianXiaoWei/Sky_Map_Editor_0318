import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';

// Exercise the shipped ASAR with a Linux host. This does not test Windows.
const build = JSON.parse(await fs.readFile('docs/preview-package.json', 'utf8'));
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temp = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-preview-smoke-'));
const runtime = path.join(temp, 'electron');
const report = {
  version: build.version,
  scope: 'Shipped ASAR and packaged resource paths on a Linux host with Linux Vulkan helper',
  runtime: process.platform + ' ' + process.arch,
  windowsRuntimeVerified: false,
  checks: [],
};
const errors = [];
let app;
let page;
try {
  await fs.cp('node_modules/electron/dist', runtime, { recursive: true });
  await fs.rename(path.join(runtime, 'electron'), path.join(runtime, 'SkyMapEditor'));
  await fs.copyFile(path.join(build.extractedDirectory, 'resources/app.asar'), path.join(runtime, 'resources/app.asar'));
  await fs.mkdir(path.join(runtime, 'resources/native'), { recursive: true });
  await fs.copyFile('dist/native/sky-vulkan', path.join(runtime, 'resources/native/sky-vulkan'));
  await fs.chmod(path.join(runtime, 'resources/native/sky-vulkan'), 0o755);
  await fs.cp(path.join(build.extractedDirectory,'resources/vulkan-shaders'),path.join(runtime,'resources/vulkan-shaders'),{recursive:true});
  app = await electron.launch({
    executablePath: path.join(runtime, 'SkyMapEditor'),
    args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--user-data-dir=' + path.join(temp, 'profile')],
    cwd: temp,
    env: { ...process.env, PATH:path.join(temp,'no-shader-tools'),XDG_CONFIG_HOME: path.join(temp, 'config') },
    timeout: 45000,
  });
  const packaged = await app.evaluate(({ app }) => ({ packaged: app.isPackaged, path: app.getAppPath() }));
  report.packaged = packaged;
  assert.equal(packaged.packaged, true);
  assert.ok(packaged.path.endsWith('/resources/app.asar'));
  report.checks.push('Actual packaged ASAR startup');
  page = await app.firstWindow();
  page.on('pageerror', error => errors.push(error.message));
  await page.evaluate(() => {
    const present = CanvasRenderingContext2D.prototype.putImageData;
    CanvasRenderingContext2D.prototype.putImageData = function (...args) {
      present.apply(this, args);
      this.canvas.dataset.previewFrame = String(Number(this.canvas.dataset.previewFrame ?? 0) + 1);
    };
    window.previewErrors = [];
    new MutationObserver(() => {
      const toast = document.querySelector('#toast.error-toast');
      if (toast && !toast.hidden) window.previewErrors.push(toast.textContent);
    }).observe(document.querySelector('#toast'), { attributes: true, childList: true });
  });
  await page.locator('#settings-dialog').waitFor({ state: 'visible' });
  await page.locator('#data-path').fill(data);
  await page.locator('#apply-settings').click();
  await page.locator('#level-label').filter({ hasText: /^WorldEmpty$/ }).waitFor({ timeout: 60000 });
  await page.locator('#levels').selectOption('Dawn');
  await page.locator('#level-label').filter({ hasText: /^Dawn$/ }).waitFor({ timeout: 60000 });
  await page.locator('#mode-mesh').click();
  await page.locator('#mode-mesh.active').waitFor();
  await page.locator('body[aria-busy="false"]').waitFor();
  await page.waitForFunction(() => document.querySelector('#viewport canvas')?.dataset.backend === 'Vulkan');
  report.checks.push('Data selection and Dawn BstBaked.meshes loading without editing');
  report.vulkan = await page.evaluate(() => window.sky.vulkanInfo());
  assert.equal(report.vulkan.backend, 'Vulkan');
  for (const mode of ['material', 'light0', 'light1', 'light2', 'ambient', 'skirt']) {
    const previous = await page.locator('#mesh-display').inputValue();
    const frame = await page.locator('#viewport canvas').getAttribute('data-preview-frame');
    await page.locator('#mesh-display').selectOption(mode);
    if (previous !== mode) await page.waitForFunction(before => Number(document.querySelector('#viewport canvas').dataset.previewFrame ?? 0) > before, Number(frame ?? 0));
    await page.waitForFunction(() => {
      const canvas = document.querySelector('#viewport canvas');
      if (!canvas?.width || !canvas.height) return false;
      const rgba = canvas.getContext('2d').getImageData(0, 0, canvas.width, canvas.height).data;
      for (let i = 4; i < rgba.length; i += 4)
        if (rgba[i] !== rgba[0] || rgba[i + 1] !== rgba[1] || rgba[i + 2] !== rgba[2]) return true;
      return false;
    });
  }
  report.checks.push('Six diagnostic display choices, newly presented mode frames and nonuniform Vulkan RGBA canvas');
  const lastFrame = Number(await page.locator('#viewport canvas').getAttribute('data-preview-frame') ?? 0);
  await page.locator('#mesh-display').selectOption('material');
  await page.waitForFunction(before => Number(document.querySelector('#viewport canvas').dataset.previewFrame ?? 0) > before, lastFrame);
  assert.equal(await page.locator('#empty').isVisible(), false);
  assert.deepEqual(await page.evaluate(() => window.previewErrors), []);
  await page.screenshot({ path: path.resolve('docs/preview-screenshot.png'), fullPage: true });
  assert.deepEqual(errors, []);
  // Inspect a cloud-visible map; Dawn's initial editor camera can have
  // terrain covering every cloud sample. Diagnostics must be completed-frame
  // snapshots even while the following animated frame is in progress.
  await page.locator('#levels').selectOption('Prairie_ButterflyFields');
  await page.locator('#level-label').filter({hasText:/^Prairie_ButterflyFields$/}).waitFor({timeout:60000});
  await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='Prairie_ButterflyFields',undefined,{timeout:60000});
  const beforeCloud=(await page.evaluate(()=>window.sky.vulkanViewportInfo())).cloud.frames;
  report.animatedCloudSnapshots=await page.evaluate(async before=>{const samples=[],deadline=Date.now()+60000;while(Date.now()<deadline){const info=await window.sky.vulkanViewportInfo();if(info.cloud.frames>0){if(!info.cloud.passes.includes('Tonemap'))throw new Error('Partial cloud diagnostics');samples.push(info.cloud.frames);}if(info.cloud.frames>=before+2)return samples;await new Promise(resolve=>setTimeout(resolve,100));}throw new Error('Cloud animation did not advance');},beforeCloud);
  await page.locator('#material-animation').click();
  report.cloud=await page.evaluate(async()=>{const deadline=Date.now()+60000;while(Date.now()<deadline){const info=await window.sky.vulkanViewportInfo();if(info.cloud?.passes.includes('Tonemap')&&info.cloud?.statistics.CloudA.max[3]>0)return info;await new Promise(resolve=>setTimeout(resolve,100));}throw new Error('No completed cloud-visible frame');});
  assert.equal(report.cloud.cloud.active,true);
  assert.ok(report.cloud.cloud.passes.includes('CloudCore'));
  assert.ok(report.cloud.cloud.passes.includes('CloudFluffy'));
  assert.ok(report.cloud.cloud.passes.includes('FogUpsample'));
  assert.ok(report.cloud.cloud.passes.includes('Tonemap'));
  for(const pass of ['MotionGen','MotionDilate','TemporalAa'])assert.ok(report.cloud.cloud.passes.includes(pass));
  assert.equal(report.cloud.cloud.sampling.phase,report.cloud.cloud.sampling.frame&7);
  assert.ok(report.cloud.cloud.sampling.jitter.every(v=>v!==0));
  assert.ok(report.cloud.cloud.sampling.jitterHalf.every(v=>v!==0));
  assert.ok(report.cloud.textureSampling.some(t=>t.mipLevels>1));
  assert.ok(report.cloud.cloud.statistics.CloudA.max[3]>0);
  assert.equal(await page.locator('#physics-ball').isVisible(),false);
  report.checks.push('Actual packaged CloudCore/depth/coarse/fine MRT/CloudCard/FogUpsample/MotionGen/MotionDilate/TemporalAa/Tonemap chain, native scene/half sampling and mipmapped materials; nonzero cloud alpha, animation advances, deferred ball UI hidden');
  const paused=await page.evaluate(async()=>{let old=-1,quietSince=Date.now(),last;const deadline=Date.now()+60000;while(Date.now()<deadline){last=await window.sky.vulkanViewportInfo();if(last.cloud.frames!==old){old=last.cloud.frames;quietSince=Date.now();}if(Date.now()-quietSince>Math.max(1500,last.cloud.lastMilliseconds*2+500))return last.cloud;await new Promise(resolve=>setTimeout(resolve,100));}throw new Error('Paused cloud did not settle');});
  const viewport=await page.locator('#viewport canvas').boundingBox();await page.mouse.move(viewport.x+viewport.width*.5,viewport.y+viewport.height*.5);await page.mouse.wheel(0,-180);
  const navigated=await page.evaluate(async before=>{const deadline=Date.now()+60000;while(Date.now()<deadline){const info=await window.sky.vulkanViewportInfo();if(info.cloud.frames>=before+2)return info.cloud;await new Promise(resolve=>setTimeout(resolve,100));}throw new Error('Paused camera did not refresh cloud history');},paused.frames);
  assert.equal(navigated.wind.time,paused.wind.time);assert.deepEqual(navigated.randomOffset,paused.randomOffset);assert.ok(navigated.passes.includes('Tonemap'));
  assert.equal(navigated.sampling.frame-paused.sampling.frame,navigated.frames-paused.frames);
  assert.equal(navigated.sampling.phase,navigated.sampling.frame&7);
  report.pausedCloudNavigation={before:paused.frames,after:navigated.frames,time:paused.wind.time};
  report.checks.push('Paused camera navigation refreshes CloudCore history with a second frame while shader time remains frozen');
  await page.screenshot({path:path.resolve('docs/preview-screenshot.png'),fullPage:true});
  await page.locator('#levels').selectOption('CandleSpace');
  await page.locator('#level-label').filter({hasText:/^CandleSpace$/}).waitFor({timeout:60000});
  await page.waitForFunction(()=>document.querySelector('#viewport canvas')?.dataset.level==='CandleSpace',undefined,{timeout:60000});
  report.cloudOnly=await page.evaluate(async()=>{const deadline=Date.now()+60000;while(Date.now()<deadline){const info=await window.sky.vulkanViewportInfo();if(info.cloud?.active&&info.cloud.frames>=2&&info.cloud.passes.includes('TemporalAa'))return {draws:info.draws,frames:info.cloud.frames,passes:info.cloud.passes};await new Promise(resolve=>setTimeout(resolve,100));}throw new Error('Cloud-only CandleSpace pipeline/history refresh did not execute');});
  assert.equal(report.cloudOnly.draws,0);assert.ok(report.cloudOnly.passes.includes('CloudFluffy'));
  report.checks.push('Paused CandleSpace runs cloud history refresh with zero terrain/skirt material draws');
  const pose=()=>page.locator('#viewport canvas').evaluate(c=>({position:JSON.parse(c.dataset.cameraPosition),forward:JSON.parse(c.dataset.cameraForward)}));
  const beforeFlight=await pose();await page.locator('#viewport canvas').focus();await page.keyboard.down('w');await page.waitForTimeout(300);await page.keyboard.up('w');
  await page.waitForFunction(before=>{const c=document.querySelector('#viewport canvas'),p=JSON.parse(c.dataset.cameraPosition);return Math.hypot(...p.map((v,i)=>v-before[i]))>1;},beforeFlight.position,{timeout:60000});
  await page.waitForTimeout(2000);const beforeLook=await pose(),flyBox=await page.locator('#viewport canvas').boundingBox();
  await page.mouse.move(flyBox.x+flyBox.width*.4,flyBox.y+flyBox.height*.55);await page.mouse.down({button:'right'});await page.mouse.move(flyBox.x+flyBox.width*.4+70,flyBox.y+flyBox.height*.55+25,{steps:6});await page.mouse.up({button:'right'});
  await page.waitForFunction(before=>{const c=document.querySelector('#viewport canvas'),p=JSON.parse(c.dataset.cameraForward);return Math.hypot(...p.map((v,i)=>v-before[i]))>.03;},beforeLook.forward,{timeout:60000});
  report.flyCamera={before:beforeFlight,after:await pose()};assert.equal(await page.locator('#context-menu').isVisible(),false);
  await page.locator('#material-animation').click();const beforeAnimation=(await page.evaluate(()=>window.sky.vulkanViewportInfo())).cloud.frames;
  await page.waitForFunction(async before=>(await window.sky.vulkanViewportInfo()).cloud.frames>=before+2,beforeAnimation,{timeout:60000});
  report.checks.push('Packaged WASD flight and right-button look work on cloud-only CandleSpace; resuming cloud animation advances completed frames without terrain');
  assert.deepEqual(errors,[]);assert.deepEqual(await page.evaluate(()=>window.previewErrors),[]);
  report.checks.push('No renderer page errors');
  report.success = true;
} catch (error) {
  report.success = false;
  report.error = String(error);
  report.rendererErrors = errors;
  if(page)report.failureState=await page.evaluate(async()=>({level:document.querySelector('#level-label')?.textContent,busy:document.body.getAttribute('aria-busy'),canvas:{...document.querySelector('#viewport canvas')?.dataset},toast:document.querySelector('#toast')?.textContent,previewErrors:window.previewErrors,viewport:await window.sky.vulkanViewportInfo()})).catch(e=>({error:String(e)}));
  throw error;
} finally {
  if (app) await app.close();
  await fs.rm(temp, { recursive: true, force: true });
  await fs.writeFile('docs/preview-package-smoke.json', JSON.stringify(report, null, 2) + '\n');
  console.log(JSON.stringify(report));
}
