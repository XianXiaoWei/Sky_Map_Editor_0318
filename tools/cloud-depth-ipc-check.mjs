import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import assert from 'node:assert/strict';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const temp = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-depth-ipc-'));
await fs.writeFile('docs/cloud-depth-ipc-check.json', JSON.stringify({ passed: false, complete: false, status: 'Built IPC check started' }) + '\n');
let app;
try {
  app = await electron.launch({ executablePath: path.resolve('node_modules/electron/dist/electron'),
    args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu', '--user-data-dir=' + temp, '.'],
    env: { ...process.env, XDG_CONFIG_HOME: path.join(temp, 'config') }, timeout: 45000 });
  const page = await app.firstWindow();
  const result = await page.evaluate(async data => {
    await window.sky.setData(data);
    const device = await window.sky.vulkanInfo(), cases = [];
    for (const value of [0, 0x3c00, 0xc200]) { // alpha = 0, 1, -3
      const bytes = new Uint8Array(4 * 4 * 8), raw = new DataView(bytes.buffer);
      for (let i = 0; i < 16; i++) raw.setUint16(i * 8 + 6, value, true);
      const targets = await window.sky.vulkanCloudDepth(4, 4,
        { format: 'rgba16f', dimensions: [4, 4, 1], linear: false, repeat: false, data: bytes },
        { u_texSizeHalf: [2, 2], u_jitterHalf: [0, 0] });
      cases.push({ value, half: { ...targets.depthHalf, data: Array.from(targets.depthHalf.data) },
        quarter: { ...targets.depthQuarter, data: Array.from(targets.depthQuarter.data) } });
    }
    return { device, cases };
  }, data);
  for (const c of result.cases) {
    assert.deepEqual(c.half.dimensions, [2, 2, 1]); assert.equal(c.half.format, 'rgba16f');
    assert.deepEqual(c.quarter.dimensions, [1, 1, 1]); assert.equal(c.quarter.format, 'rg16f');
    const codes = t => Array.from(new Uint16Array(Uint8Array.from(t.data).buffer));
    assert.deepEqual(codes(c.half), Array(16).fill(c.value));
    assert.deepEqual(codes(c.quarter), Array(2).fill(c.value & 0x7fff));
  }
  await fs.writeFile('docs/cloud-depth-ipc-check.json', JSON.stringify({ passed: true, complete: true, scope: 'Built Electron main/preload depth IPC calls the native Vulkan three-pass chain with explicit constant signed-alpha fixtures. No game asset writes or complete scene rendering.', ...result }, null, 2) + '\n');
  console.log(JSON.stringify({ passed: true, cases: result.cases.length, device: result.device.device }));
} finally {
  if (app) await app.close();
  await fs.rm(temp, { recursive: true, force: true });
}
