import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {decodePng} from '../src/core/png';

const ui=JSON.parse(fs.readFileSync('docs/float-condition-map-preview-smoke.json','utf8'));assert.equal(ui.passed,true);
assert.deepEqual(ui.initialCamera,ui.movingCamera);
const files=['docs/float-condition-map-preview-viewport-before.png','docs/float-condition-map-preview-viewport-moving.png'],buffers=files.map(f=>fs.readFileSync(f)),[a,b]=buffers.map(decodePng);
assert.equal(a.width,b.width);assert.equal(a.height,b.height);let changed=0;
for(let i=0;i<a.rgba.length;i+=4)if(Math.max(...[0,1,2].map(c=>Math.abs(a.rgba[i+c]-b.rgba[i+c])))>8)changed++;
assert.ok(changed>500);
const report={passed:true,scope:'Actual Electron/Vulkan viewport screenshots from a prepared DayHubCave condition/delay/platform chain, using light0 baked inspection and original wire overlay. Full world/projection/view-projection camera matrices agree exactly. Rendered object snapshots match the paused runtime objects before each screenshot. Pixel change establishes visible output, not original material parity.',width:a.width,height:a.height,changedPixelsAbove8:changed,viewportPixels:a.width*a.height,cameraUnchanged:true,files:files.map((file,i)=>({file,sha256:crypto.createHash('sha256').update(buffers[i]).digest('hex')})),windowsTested:false};
fs.writeFileSync('docs/float-condition-map-preview-screenshot-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
