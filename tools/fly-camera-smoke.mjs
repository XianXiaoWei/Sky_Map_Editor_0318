import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import assert from 'node:assert/strict';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temporary = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-fly-camera-'));
const report = { passed: false, runtime: process.platform + ' ' + process.arch, windowsTested: false, checks: [] };
let app;
try {
  app = await electron.launch({ executablePath: path.resolve('node_modules/electron/dist/electron'), args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--user-data-dir=' + path.join(temporary, 'profile'), '.'], cwd: process.cwd(), env: { ...process.env, XDG_CONFIG_HOME: path.join(temporary, 'config') }, timeout: 45000 });
  const page = await app.firstWindow(), errors = []; page.on('pageerror', error => errors.push(error.message));
  await page.locator('#settings-dialog').waitFor({ state: 'visible' }); await page.locator('#data-path').fill(data); await page.locator('#apply-settings').click();
  await page.locator('#level-label').filter({ hasText: /^WorldEmpty$/ }).waitFor({ timeout: 60000 });
  await page.locator('#status').filter({ hasText: '已打开 WorldEmpty' }).waitFor({ timeout: 60000 });
  await page.locator('body[aria-busy="false"]').waitFor();
  const canvas = page.locator('#viewport canvas');
  await page.waitForFunction(() => document.querySelector('#viewport canvas')?.dataset.level === 'WorldEmpty' && document.querySelector('#viewport canvas')?.dataset.cameraPosition);
  const pose = () => canvas.evaluate(c => ({ position: JSON.parse(c.dataset.cameraPosition), forward: JSON.parse(c.dataset.cameraForward) }));
  const distance = (a, b) => Math.hypot(...a.map((v, i) => v - b[i]));
  const dot = (a, b) => a.reduce((n, v, i) => n + v * b[i], 0);
  const samePose = (a,b) => { assert.ok(distance(a.position,b.position)<1e-7);assert.ok(distance(a.forward,b.forward)<1e-9); };
  const settle = async () => { await page.waitForTimeout(650); const a = await pose(); await page.waitForTimeout(350); samePose(await pose(), a); return a; };
  async function hold(key, milliseconds = 450) { await canvas.focus(); await page.keyboard.down(key); await page.waitForTimeout(milliseconds); await page.keyboard.up(key); return settle(); }
  await settle();
  for (const key of ['w', 's', 'a', 'd', 'q', 'e']) {
    const before = await pose(), after = await hold(key), delta = after.position.map((v, i) => v - before.position[i]);
    assert.ok(distance(before.position, after.position) > 1, key + ' must move the displayed camera');
    if (key === 'w' || key === 's') assert.ok(dot(delta, before.forward) * (key === 'w' ? 1 : -1) > 1);
    if (key === 'a' || key === 'd') assert.ok(dot(delta, [-before.forward[2], 0, before.forward[0]]) * (key === 'd' ? 1 : -1) > 1);
    if (key === 'q' || key === 'e') { assert.ok(delta[1] * (key === 'e' ? 1 : -1) > 1); assert.ok(Math.abs(delta[0]) < 1e-7 && Math.abs(delta[2]) < 1e-7); }
    assert.equal(await page.locator('#scale').evaluate(e => e.classList.contains('active')), false);
  }
  report.checks.push('All six keys move the camera used by the completed Vulkan frame; S does not activate object scaling; key release stops motion');
  const beforeNormal = await pose(), afterNormal = await hold('w'), normal = distance(beforeNormal.position, afterNormal.position);
  await page.keyboard.down('Shift'); const beforeFast = await pose(), afterFast = await hold('w'); await page.keyboard.up('Shift');
  report.speedRatio = distance(beforeFast.position, afterFast.position) / normal; assert.ok(report.speedRatio > 1.8 && report.speedRatio < 4.5);
  report.checks.push('Shift accelerates keyboard flight');
  await page.locator('#mode-mesh').click(); await page.locator('body[aria-busy="false"]').waitFor(); await settle();
  const box = await canvas.boundingBox(), x = box.x + box.width * .45, y = box.y + box.height * .6;
  const beforeLook = await pose(); await page.mouse.move(x, y); await page.mouse.down({ button: 'right' }); await page.mouse.move(x + 90, y + 35, { steps: 8 }); await page.mouse.up({ button: 'right' });
  const afterLook = await settle(); assert.ok(distance(beforeLook.position, afterLook.position) < 1e-7); assert.ok(distance(beforeLook.forward, afterLook.forward) > .05); assert.equal(await page.locator('#context-menu').isVisible(), false);
  await page.mouse.click(x, y, { button: 'right' }); assert.equal(await page.locator('#context-menu').isVisible(), true);
  await page.mouse.move(x - 100, y - 80); await page.mouse.down({ button: 'right' }); await page.mouse.move(x - 40, y - 80, { steps: 5 }); await page.mouse.up({ button: 'right' }); await settle();
  assert.equal(await page.locator('#context-menu').isVisible(), false);
  report.checks.push('Right drag rotates view around a fixed eye; a plain right click retains the meshes menu');
  await canvas.focus(); await page.keyboard.down('w'); await page.waitForTimeout(120); await page.locator('#settings').click();
  await page.locator('#settings-dialog').waitFor({ state: 'visible' }); const blocked = await settle();
  await page.locator('#data-path').fill('wasdqe'); await page.waitForTimeout(450); samePose(await pose(), blocked); await page.keyboard.up('w');
  await page.locator('#data-path').fill(data); await page.locator('.close-settings').click();
  await canvas.focus(); await page.keyboard.down('w'); await page.waitForTimeout(120); await page.evaluate(() => window.dispatchEvent(new Event('blur'))); const blurred = await settle();
  await page.waitForTimeout(450); samePose(await pose(), blurred); await page.keyboard.up('w');
  report.checks.push('Dialogs, text input and lost window focus stop flight without stuck keys');
  assert.equal(await page.locator('#dirty').textContent(), '所有修改已保存'); assert.deepEqual(errors, []);
  await page.screenshot({ path: 'docs/fly-camera-preview.png' }); report.passed = true;
} catch (error) { report.error = String(error); throw error; }
finally { if (app) await app.close().catch(() => {}); await fs.rm(temporary, { recursive: true, force: true }); await fs.writeFile('docs/fly-camera-smoke.json', JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report)); }
