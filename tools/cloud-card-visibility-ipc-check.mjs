import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import assert from 'node:assert/strict';

const visibilityCases=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-visibility-native.json','utf8')).cases.filter(c=>c.name.startsWith('Dawn-'));
const drawCases=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-draw-native.json','utf8')).cases.filter(c=>c.name.startsWith('visibility-Dawn-'));
const facingCases=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-facing-native.json','utf8')).cases.filter(c=>c.name.startsWith('Dawn-'));
assert.equal(visibilityCases.length,8);assert.equal(drawCases.length,32);
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-card-visibility-ipc-'));
const reportPath='docs/cloud-card-visibility-ipc-check.json';await fs.writeFile(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
const hex=values=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeFloatLE(v,i*4));return b.toString('hex');};
let app;
try {
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-gpu','--disable-dev-shm-usage','--user-data-dir='+temp,'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
  const page=await app.firstWindow();
  await page.waitForURL('**/index.html');await page.waitForLoadState();
  const result=await page.evaluate(async ({visibilityCases,drawCases})=>{
    await window.sky.setData('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');
    await window.sky.openLevel('Dawn');
    const layout=await window.sky.cloudCardLayout(),plans=[];
    for(const c of drawCases) {
      const v=visibilityCases.find(v=>c.name.startsWith(`visibility-${v.name}-`));
      plans.push(await window.sky.cloudCardVisibilityDrawPlan(v.viewProjection,c.eye,v.visibilityStatuses,v.enabled,c.sort));
    }
    const first=visibilityCases[0],statuses=first.visibilityStatuses;
    const disabled=await window.sky.cloudCardVisibilityDrawPlan([], [0,0,0], statuses, false, true);
    const rejected=[];
    for(const invalid of [[],statuses.map(()=>-1),statuses.map(()=>2**32)]) {
      try {await window.sky.cloudCardVisibilityDrawPlan(first.viewProjection,[0,0,0],invalid,true,true);rejected.push(false);}catch{rejected.push(true);}
    }
    return {layout,plans,disabled,rejected};
  },{visibilityCases,drawCases});
  assert.ok(result.rejected.every(Boolean));assert.equal(result.disabled.draws.length,0);assert.equal(result.disabled.planes.length,0);
  let candidates=0,visible=0;
  const nativeLayout=facingCases.find(c=>c.eye.every(v=>v===0)&&c.visibleOrder.length===78&&c.visibleOrder[0]===0);
  assert.ok(nativeLayout);
  assert.equal(hex(result.layout.cards.flatMap(c=>c.inverseWorld)),nativeLayout.inversesHex);
  for(const [i,c] of drawCases.entries()) {
    const expected=visibilityCases.find(v=>c.name.startsWith(`visibility-${v.name}-`)),actual=result.plans[i];
    assert.equal(hex(actual.planes.flat()),expected.planesHex);
    assert.deepEqual(actual.candidateOrder,expected.candidateOrder);assert.deepEqual(actual.visibleOrder,expected.visibleOrder);
    assert.deepEqual(actual.visibleStatuses,expected.visibleStatuses);assert.equal(hex(actual.visibleSpheres.flat()),expected.visibleSpheresHex);
    assert.deepEqual(actual.draws.map(({distanceSquared,indexOffset,indexCount})=>({distanceSquared,indexOffset,indexCount})),c.draws);
    const nativeFacing=facingCases.find(v=>v.eye.every((n,j)=>n===c.eye[j])&&v.visibleOrder.length===78&&v.visibleOrder[0]===0);
    assert.ok(nativeFacing,c.name);assert.deepEqual(actual.facing.map(v=>v.sourceIndex),expected.visibleOrder);
    for(const v of actual.facing)assert.equal(hex(v.direction),nativeFacing.directionsHex.slice(v.sourceIndex*32,v.sourceIndex*32+32),c.name);
    candidates+=actual.candidateOrder.length;visible+=actual.draws.length;
  }
  const report={passed:true,complete:true,cards:78,visibilityCases:visibilityCases.length,drawCases:drawCases.length,comparedCandidates:candidates,comparedDraws:visible,
    disabledDraws:result.disabled.draws.length,invalidStatusesRejected:result.rejected.length,
    inverseComponents:78*16,facingComponents:visible*4,
    scope:'Built Electron main/preload with real Dawn TGCL/model layout, explicit view-projection/eye/Visibility statuses and enabled/sort flags. Original inverse matrices, local camera directions, six planes, candidate order, compacted fields and final ranges are compared to separate original inverse/facing, visibility and draw fixtures. Actual occlusion queries/buffers, axis-angle/dynamic vertices, full viewport and original Metal/game execution are excluded.'};
  await fs.writeFile(reportPath,JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
} finally {if(app)await app.close();await fs.rm(temp,{recursive:true,force:true});}
