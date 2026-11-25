import { _electron as electron } from 'playwright';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
const fineSpec=JSON.parse(await fs.readFile(process.argv[2],'utf8')),cardSpec=JSON.parse(await fs.readFile(process.argv[3],'utf8'));
const combined=JSON.parse(await fs.readFile(process.argv[4],'utf8'));
const layoutFixtures=JSON.parse(await fs.readFile('tests/fixtures/cloud-card-layout-native.json','utf8'));
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-cloud-pass-ipc-'));
const reportPath='docs/cloud-pass-ipc-check.json';await fs.writeFile(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
const fine=fineSpec.programs.find(p=>p.name==='CloudFluffy'&&p.cameraCase==='outside');
const cards=['CloudCard','CloudQuadParticleFluffy'].map(name=>cardSpec.programs.find(p=>p.name===name&&p.cameraCase==='63x37-depth10000'));
// Keep atlas payloads binary-sized and share identical textures between draws.
// Expanding every byte to a JSON number exhausted Node's heap during IPC setup.
const inputs=[],payloads={};
async function payload(file) {
  const bytes=await fs.readFile(file),key=crypto.createHash('sha256').update(bytes).digest('hex');
  if(!Object.hasOwn(payloads,key))payloads[key]=bytes.toString('base64');
  return key;
}
for(const p of [fine,...cards]) {
  const textures={};for(const [name,t] of Object.entries(p.textures))textures[name]={...t,data:await payload(t.data)};
  inputs.push({shader:p.name,stride:p.stride,attributes:p.attributes,uniforms:{...p.uniforms,u_viewportSize:[fine.width,fine.height]},textures,state:4,colorFormats:['rgba16f','rgba16f'],
    vertices:await payload(p.vertices),indices:await payload(p.indices)});
}
let app;
try {
  app=await electron.launch({executablePath:path.resolve('node_modules/electron/dist/electron'),args:['--no-sandbox','--disable-gpu','--disable-dev-shm-usage','--user-data-dir='+temp,'.'],env:{...process.env,XDG_CONFIG_HOME:path.join(temp,'config')},timeout:45000});
  const page=await app.firstWindow();const result=await page.evaluate(async ({inputs,payloads})=>{
    await window.sky.setData('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');
    await window.sky.openLevel('Dawn');
    const layout=await window.sky.cloudCardLayout();
    const decoded=new Map();
    const bytes=key=>{
      if(!decoded.has(key)){
        const raw=atob(payloads[key]),data=new Uint8Array(raw.length);
        for(let i=0;i<raw.length;i++)data[i]=raw.charCodeAt(i);
        decoded.set(key,data);
      }
      return decoded.get(key);
    };
    const draws=inputs.map(p=>({...p,vertices:bytes(p.vertices),indices:new Uint32Array(bytes(p.indices).buffer),textures:Object.fromEntries(Object.entries(p.textures).map(([name,t])=>[name,{...t,data:bytes(t.data)}]))}));
    const targets=await window.sky.vulkanCloudPass(127,73,draws[0],draws.slice(1));
    let rejected=false;try{await window.sky.vulkanCloudPass(127,73,draws[0],[{...draws[1],shader:'CloudCore'}]);}catch(e){rejected=String(e).includes('不属于原 Cloud 列表');}
    return {state:await window.sky.cloudListRenderState(),rejected,layout,
      targets:[targets.cloudA,targets.cloudB].map(t=>({...t,data:Array.from(t.data)}))};
  },{inputs,payloads});
  assert.ok(result.rejected);assert.equal(result.state.depth.test,false);assert.equal(result.state.depth.write,false);
  const expectedLayout=layoutFixtures.cases.find(c=>c.name==='Dawn');
  assert.equal(result.layout.cards.length,expectedLayout.cards.length);
  for(const [i,card] of result.layout.cards.entries()){
    const bytes=Buffer.alloc(16);card.sphere.forEach((v,j)=>bytes.writeFloatLE(v,j*4));
    assert.equal(bytes.toString('hex'),expectedLayout.cards[i].sphereHex);
    assert.equal(card.group,expectedLayout.cards[i].group);
  }
  for(const [i,t] of result.targets.entries()){
    assert.equal(t.format,'rgba16f');assert.deepEqual(t.dimensions,[63,36,1]);
    const frame=await fs.readFile(combined.outputs[i]),codes=new DataView(Uint8Array.from(t.data).buffer);
    // Expand returned half storage and compare the native fixture float32 bytes.
    for(let j=0;j<frame.length/4;j++){
      const code=codes.getUint16(j*2,true),e=code>>>10&31,m=code&1023,s=code&32768?-1:1;
      const value=s*(e?(1+m/1024)*2**(e-15):m*2**-24);
      assert.equal(value,frame.readFloatLE(j*4));
    }
  }
  await fs.writeFile(reportPath,JSON.stringify({passed:true,complete:true,scope:'Built Electron main/preload executes fine + two original Cloud shaders in one native pass from explicit fixtures, verifies returned half bytes and rejects Opaque CloudCore in Cloud list. Dawn CloudCard world sphere/component IPC matches original load oracle in explicit TGCL order. Does not generate draw vertices, recover original registration order or certify Metal.',size:[63,36],comparedComponents:63*36*8,cloudCardLayoutCards:result.layout.cards.length,cloudCardLayoutGroups:result.layout.groupCount,opaqueProxyRejected:true},null,2)+'\n');
  console.log(JSON.stringify({passed:true,comparedComponents:63*36*8,cloudCardLayoutCards:result.layout.cards.length,opaqueProxyRejected:true}));
} finally {if(app)await app.close();await fs.rm(temp,{recursive:true,force:true});}
