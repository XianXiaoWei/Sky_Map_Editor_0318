import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus', temp = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-animation-resource-ui-'));
const sha = b => crypto.createHash('sha256').update(b).digest('hex'), audit = JSON.parse(await fs.readFile('docs/resource-animation-audit.json', 'utf8'));
const report = { passed: false, resources: [], missingResources: [], maps: [], errors: [], scope: 'Actual Electron resourceMesh IPC preserves original skin/default pose/key/flag bytes. Default-pose flower geometry reaches native Vulkan model bindings with the saved material. Full viewport, map switch/unload and unchanged source files checked. Controller/creature AI/plant interaction remains pending.' }; let app;
try {
  app = await electron.launch({ executablePath: path.resolve('node_modules/electron/dist/electron'), args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--user-data-dir=' + path.join(temp, 'profile'), '.'],
    env: { ...process.env, GALLIVM_PERF: 'nopt', SKY_WINDOWS_CANVAS: '1', SKY_WINDOWS_NATIVE: '0', XDG_CONFIG_HOME: path.join(temp, 'config') }, timeout: 45000 });
  const page = await app.firstWindow(); page.on('pageerror', e => report.errors.push(e.message));
  await app.evaluate(({ BrowserWindow }) => BrowserWindow.getAllWindows()[0].setSize(1300, 900));
  await page.locator('#settings-dialog').waitFor({ state: 'visible' }); await page.locator('#data-path').fill(data); await page.locator('#apply-settings').click();
  await page.waitForFunction(() => document.querySelector('#viewport canvas')?.dataset.level === 'WorldEmpty', undefined, { timeout: 120000 });
  if (await page.locator('#material-animation').getAttribute('aria-pressed') === 'true') await page.locator('#material-animation').click();
  await page.addStyleTag({ content: '#viewport{width:180px;height:140px}' });
  for (const name of ['CharBirdAnim', 'CharBirdLowAnim', 'CharSkyRayCAnim', 'CharSkyRayMotherAnim', 'CharCrabAAnim', 'CharDarkCreatureAnim_CompOcc_CompEdges', 'CharEnvFlowerAnim', 'CharSkyKid_Body_Perfect_StripAnim_CompOcc_CompEdges']) {
    const expected = audit.records.find(r => r.file === name + '.mesh'); assert.ok(expected);
    const actual = await page.evaluate(async name => {
      const m = await window.sky.resourceMesh(name), p = m.animation;
      const digest = async a => Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', new Uint8Array(a.buffer, a.byteOffset, a.byteLength))), b => b.toString(16).padStart(2, '0')).join('');
      const skin = new Uint8Array(m.levels.reduce((n, lod) => n + lod.packedSkin.length, 0)); let at = 0;
      for (const lod of m.levels) { skin.set(lod.packedSkin, at); at += lod.packedSkin.length; }
      return { bones: p.bones.length, frames: p.frameCount, sampleRate: p.sampleRate, clips: p.tracks?.clips.length ?? 0, skinBytes: skin.length,
        skinSha256: await digest(skin), defaultPoseSha256: await digest(p.defaultPose), positionKeysSha256: p.tracks ? await digest(p.tracks.positions) : null,
        rotationKeysSha256: p.tracks ? await digest(p.tracks.rotations) : null, scaleKeysSha256: p.tracks ? await digest(p.tracks.scales) : null,
        flagIndexSha256: p.tracks ? await digest(p.tracks.flags) : null, externalAnimationRequired: p.frameCount === 0,
        floatArrayPreserved: p.defaultPose instanceof Float32Array, skinArrayPreserved: m.packedSkin instanceof Uint8Array };
    }, name);
    for (const key of ['bones', 'frames', 'sampleRate', 'clips', 'skinBytes', 'skinSha256', 'defaultPoseSha256', 'positionKeysSha256', 'rotationKeysSha256', 'scaleKeysSha256', 'flagIndexSha256', 'externalAnimationRequired']) assert.deepEqual(actual[key], expected[key], name + ':' + key);
    assert.equal(actual.floatArrayPreserved, true); assert.equal(actual.skinArrayPreserved, true);
    assert.equal(sha(await fs.readFile(path.join(data, 'Meshes/Bin', name + '.mesh'))), expected.sourceSha256);
    report.resources.push({ name, ...actual, sourceUnchanged: true });
  }
  const missing = await page.evaluate(async () => { try { await window.sky.resourceMesh('CharSkyRayYoungAnim'); return null; } catch (error) { return String(error); } });
  assert.match(missing, /不存在|ENOENT|not found|missing/i); report.missingResources.push({ name: 'CharSkyRayYoungAnim', error: missing, explicitFailure: true });
  const list=await page.evaluate(()=>window.sky.resourceAnimationList()); assert.equal(list.files.length,186); assert.equal(list.metaDataCount,2255);
  const flowerAnimations=list.files.find(f=>f.name==='CharEnvFlowerAnim').metaDatas.map(m=>[m.name,m.start,m.stop]);
  assert.deepEqual(flowerAnimations,[['closedLoop',1,30],['openUp',31,60],['openLoop',61,90],['closeDown',91,120]]); report.animationList={files:186,metadata:2255,flowerAnimations};
  for (const level of ['Dawn', 'Prairie_Village', 'DuskMid', 'DayHubCave', 'WorldEmpty']) {
    const file = path.join(data, 'Levels', level, 'Objects.level.bin'), source = sha(await fs.readFile(file));
    await page.locator('#levels').selectOption(level); await page.waitForFunction(level => document.querySelector('#viewport canvas')?.dataset.level === level, level, { timeout: 180000 });
    assert.equal(await page.locator('#viewport canvas').getAttribute('data-quality'), 'full');
    const environment = await page.evaluate(() => window.sky.environmentRuntimeInfo());
    if (level === 'WorldEmpty') { assert.deepEqual(environment.nature.birds, []); assert.deepEqual(environment.nature.darkCreatures, []); assert.deepEqual(environment.nature.flames, []); }
    assert.equal(sha(await fs.readFile(file)), source); assert.equal(await page.locator('#dirty').textContent(), '所有修改已保存');
    const viewport = await page.evaluate(() => window.sky.vulkanViewportInfo());
    if(level==='DayHubCave'){
      const flower = viewport.modelBindings.find(m=>m.nodeId===896); assert.ok(flower, 'Original animated flower must reach Vulkan draw bindings');
      assert.equal(flower.shader,'UnlitColor'); assert.ok(flower.triangles>0);
      assert.ok(!viewport.modelBoundaries.some(b=>b.nodeId===896)); report.flowerDraw=flower;
      await page.locator('#tree [data-node-id="896"]').evaluate(el=>{for(let parent=el.parentElement;parent;parent=parent.parentElement)if(parent.tagName==='DETAILS')parent.open=true;});
      await page.addStyleTag({content:'#viewport{width:700px;height:540px}'});
      await page.locator('#tree [data-node-id="896"]').click(); await page.locator('#focus').evaluate(el=>el.click());
      const sequence = Number(await page.locator('#viewport canvas').getAttribute('data-frame-sequence'));
      await page.waitForFunction(sequence=>Number(document.querySelector('#viewport canvas')?.dataset.frameSequence)>sequence,sequence,{timeout:120000});
      await page.screenshot({path:'docs/resource-skinning-flower-render.png'});
      report.flowerCamera=JSON.parse(await page.locator('#viewport canvas').getAttribute('data-camera-position'));
      await page.addStyleTag({content:'#viewport{width:180px;height:140px}'});
    }
    report.maps.push({ level, fullVulkan: true, sourceUnchanged: true,modelDraws:viewport.modelDraws,flowerBound:level==='DayHubCave' }); console.log(JSON.stringify({ stage: 'map-verified', level }));
  }
  assert.deepEqual(report.errors, []); report.passed = true;
} catch (error) {
  report.error = String(error); process.exitCode = 1;
  if (app) { const page = await app.firstWindow(); report.status = await page.locator('#status').textContent(); await page.screenshot({ path: '/root/sky-research/resource-animation-ui-failure.png' }); }
} finally {
  if (app) { const timer = setTimeout(() => { report.forcedTestShutdown = true; app.process().kill('SIGKILL'); }, 8000); await app.close().catch(() => {}); clearTimeout(timer); }
  await fs.rm(temp, { recursive: true, force: true }); await fs.writeFile('docs/resource-skinning-smoke.json', JSON.stringify(report, null, 2) + '\n');
}
console.log(JSON.stringify({ passed: report.passed, resources: report.resources.length, maps: report.maps.length, error: report.error }));
