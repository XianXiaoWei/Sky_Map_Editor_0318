import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import assert from 'node:assert/strict';

const layoutFixture=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-index-native.json','utf8')).cases.find(c=>c.name==='Dawn');
const drawCases=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-draw-native.json','utf8')).cases.filter(c=>c.name.startsWith('Dawn-'));
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-card-plan-ipc-'));
const reportPath='docs/cloud-card-plan-ipc-check.json';await fs.writeFile(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
let app;
try {
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-gpu','--disable-dev-shm-usage','--user-data-dir='+temp,'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
  const page=await app.firstWindow();
  const result=await page.evaluate(async drawCases=>{
    await window.sky.setData('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');
    await window.sky.openLevel('Dawn');
    const layout=await window.sky.cloudCardLayout(),draws=[];
    for(const c of drawCases)draws.push(await window.sky.cloudCardDrawPlan(c.eye,c.visibleOrder,c.sort));
    let rejected=false;try{await window.sky.cloudCardDrawPlan([0,0,0],[0,0],true);}catch{rejected=true;}
    return {cards:layout.cards,order:Array.from(layout.renderOrder),ranges:layout.ranges,indices:Array.from(layout.indices),vertexCount:layout.vertexCount,draws,rejected};
  },drawCases);
  assert.ok(result.rejected);
  assert.deepEqual(result.order,layoutFixture.ranges.map(r=>r.sourceIndex));
  assert.deepEqual(result.ranges,layoutFixture.ranges);assert.deepEqual(result.indices,layoutFixture.indices);
  assert.equal(result.cards.length,layoutFixture.cards.length);
  for(const [i,card] of result.cards.entries()){
    const bytes=Buffer.alloc(16);card.sphere.forEach((v,j)=>bytes.writeFloatLE(v,j*4));assert.equal(bytes.toString('hex'),layoutFixture.cards[i].sphereHex);
  }
  for(const [i,draws] of result.draws.entries())assert.deepEqual(draws.map(({distanceSquared,indexOffset,indexCount})=>({distanceSquared,indexOffset,indexCount})),drawCases[i].draws);
  const comparedDraws=result.draws.reduce((n,draws)=>n+draws.length,0);
  const report={passed:true,complete:true,scope:'Built Electron main/preload reads real Dawn TGCL/Mesh resources, preserves original group sort/index layout, and returns optional distance-ordered draw plans for explicitly supplied visibility order/eye. Compared against independent original machine-code fixtures. No automatic visibility, dynamic vertex generation or full viewport acceptance.',cards:result.cards.length,indexComponents:result.indices.length,drawCases:drawCases.length,comparedDraws,invalidVisibilityRejected:result.rejected};
  await fs.writeFile(reportPath,JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
} finally {if(app)await app.close();await fs.rm(temp,{recursive:true,force:true});}
