import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';
import {MeshesDocument} from '../src/core/meshes';
import {nativeMaterialDefs,nativeMaterialParameters,skirtSurfaces} from '../src/core/mesh-surfaces';
import {bakedGeometry} from '../src/renderer/baked-renderer';
import {BAKED_VERTEX_ATTRIBUTES} from '../src/main/vulkan-baked';
import {AssetCatalog} from '../src/main/assets';
import {VulkanHost} from '../src/main/vulkan';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import {bindVulkanMaterial,type VulkanMaterialInput} from '../src/main/vulkan-material';

const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const digest=(bytes:Uint8Array)=>createHash('sha256').update(bytes).digest('hex');
const snorm=(byte:number)=>Math.max(-1,(byte>127?byte-256:byte)/127);
const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
const report={passed:false,scope:'Original SkirtBarn format 24 adapted to SNORM4; all map packed attributes, GPU attribute fetch and all six original MaterialDefBarn skirt GLSL pairs on explicit controlled inputs. This is not original Metal screenshot parity or Windows GT 1030 validation.',maps:[] as object[],attributeFetch:{} as object,shaders:[] as object[]};
const identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
type Texture=VulkanMaterialInput['textures'][string];
const image=(rgba:number[]):Texture=>({format:'rgba32f',dimensions:[1,1,1],linear:false,repeat:true,data:new Uint8Array(Float32Array.from(rgba).buffer)});
async function main(){
 try{
  for(const level of fs.readdirSync(path.join(data,'Levels'))){
   const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
   const original=fs.readFileSync(file),doc=new MeshesDocument(original),defs=nativeMaterialDefs(level);let skirts=0,vertices=0,negativeW=0,positiveW=0;
   for(const record of doc.geometries.filter(g=>g.kind==='skirt')){
    const view=doc.geometryView(record),geometry=bakedGeometry(view),attribute=geometry.getAttribute('a_userData1');
    assert.ok(attribute.array instanceof Int8Array);assert.equal(attribute.normalized,true);
    for(let v=0;v<record.vertexCount;v++)for(let lane=0;lane<4;lane++){
     const byte=doc.lod[record.vertexOffset+v*40+36+lane];assert.equal(attribute.getComponent(v,lane),snorm(byte));
     if(lane===3){if(snorm(byte)<0)negativeW++;if(snorm(byte)>0)positiveW++;}
    }
    assert.deepEqual(new Uint8Array(attribute.array.buffer,attribute.array.byteOffset,attribute.array.byteLength),view.userData1);
    skirtSurfaces(view,defs);geometry.dispose();skirts++;vertices+=record.vertexCount;
   }
   assert.equal(digest(doc.serialize()),digest(original));assert.equal(digest(fs.readFileSync(file)),digest(original));
   report.maps.push({level,skirts,vertices,negativeW,positiveW,sourceUnchanged:true});
  }
  await host.start();
  // Fetch every possible stored byte through the actual production descriptor.
  const fetch=await compileVulkanShaders([
   {stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 a_position;layout(location=1) in vec4 a_userData1;layout(location=0) out vec4 value;void main(){gl_Position=vec4(a_position,0,1);value=a_userData1;}'},
   {stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec4 value;layout(location=0) out vec4 color;void main(){color=value;}'}
  ],'/tmp/sky-skirt-check-shaders');
  const vertices=new Uint8Array(256*4*12),v=new DataView(vertices.buffer),indices=new Uint32Array(256*6);
  for(let byte=0;byte<256;byte++){
   const x=byte/128-1,right=(byte+1)/128-1;
   [[x,-1],[right,-1],[right,1],[x,1]].forEach((p,i)=>{const at=(byte*4+i)*12;v.setFloat32(at,p[0],true);v.setFloat32(at+4,p[1],true);for(let lane=0;lane<4;lane++)vertices[at+8+lane]=(byte+lane)%256;});
   indices.set([0,1,2,0,2,3].map(i=>byte*4+i),byte*6);
  }
  await host.setMaterialScene(await bindVulkanMaterial(fetch,{shader:'skirt-fetch',state:4,stride:12,vertices,indices,attributes:{a_position:{format:'vec2',offset:0},a_userData1:{...BAKED_VERTEX_ATTRIBUTES.a_userData1,offset:8}},uniforms:{},textures:{}}));
  const values=(await host.materialFrame(256,1)).attachments[0];let maxError=0;
  for(let byte=0;byte<256;byte++)for(let lane=0;lane<4;lane++)maxError=Math.max(maxError,Math.abs(values[byte*4+lane]-snorm((byte+lane)%256)));
  assert.ok(maxError<1e-7);report.attributeFetch={storedByteCases:256,components:1024,maxError};
  const catalog=new AssetCatalog(data,'Dawn'),defs=nativeMaterialDefs('Dawn'),size=16;
  const matrix=[1,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,1];
  for(const shader of ['RockFaceShAlphaSkirt','RockFaceRainShAlphaSkirt','SandShAlphaSkirt','SandRainShAlphaSkirt','GrassShAlphaSkirt','CloudShAlphaSkirt']){
   const program=catalog.program(shader),compiled=await compileVulkanShaders(vulkanProgramSources(program),'/tmp/sky-skirt-check-shaders');
   const def=[...defs,...nativeMaterialDefs('RainMid')].find(d=>d.shaderName===shader.replace('AlphaSkirt',''))!;assert.ok(def);
   const uniforms:Record<string,unknown>=Object.fromEntries(nativeMaterialParameters(def).filter(p=>p.vector.length).map(p=>[p.name,p.vector.length===1?p.vector[0]:p.vector]));
   Object.assign(uniforms,{u_viewProj:matrix,u_model:identity,u_modelIT:identity,u_worldToLevel:identity,u_eyePos:[0,10,0],u_sunDir:[0,-1,0],u_sunColor:[1,.9,.8],u_averageSkyColor:[.25,.35,.5],u_pointLight:[0,0,0],u_viewportSize:[size,size],u_lightShadowConsts:[0,0,0,1],u_time:0,u_waterSimTerms:[0,0,0,0],u_windScroll1:[0,0,0],u_windScroll2:[0,0,0],u_localAvatarPos:[0,10,0],u_skirtDRange:5});
   const textures:VulkanMaterialInput['textures']={};
   for(const d of compiled.descriptors.filter(d=>d.kind==='combined-image-sampler')){
    if(d.type.element?.kind==='uint')textures[d.name]={format:'rgba8ui',dimensions:[1,1,1],linear:false,repeat:false,data:new Uint8Array(4)};
    else if(d.type.dimension==='Cube')textures[d.name]={format:'rgba32f',dimensions:[32,32,6],mipLevels:6,linear:false,repeat:false,data:new Uint8Array(Float32Array.from({length:8190*4},(_,i)=>i%4===3?1:.5).buffer)};
    else textures[d.name]=image(d.name==='u_puddleSimNorm'||d.name==='u_waterSim'||d.name.startsWith('u_light')?[0,0,0,0]:[.5,.5,.5,1]);
   }
   let maxAlphaError=0,changedCases=0;
   for(const byte of [0,1,8,16,32,64,127,128,192,255]){
    const bytes=new Uint8Array(4*40),view=new DataView(bytes.buffer);
    [[-1,.05,-1],[1,.05,-1],[1,.05,1],[-1,.05,1]].forEach((p,i)=>{p.forEach((n,lane)=>view.setFloat32(i*40+lane*4,n,true));bytes.set([0,127,0,0],i*40+12);bytes.set([def.materialId,0,0,0],i*40+16);bytes.set([255,0,0,0],i*40+20);bytes.set([128,128,128,255,128,220,128,0,128,255,128,32],i*40+24);bytes.set([0,127,0,byte],i*40+36);});
    const input:VulkanMaterialInput={shader,state:4,stride:40,vertices:bytes,indices:Uint32Array.from([0,2,1,0,3,2]),attributes:BAKED_VERTEX_ATTRIBUTES,uniforms,textures};
    const alpha=(factor:number)=>{if(shader.startsWith('Cloud'))return Math.max(0,Math.min(factor,1))**2;const t=factor*5;if(shader.startsWith('Rock'))return t<=.001?0:t;if(shader.startsWith('Sand'))return Math.max(0,Math.min(2*t-.5,1));const a=4*t-1.5;return a<=.0001?0:Math.min(a,1);};
    await host.setMaterialScene(await bindVulkanMaterial(compiled,input));const corrected=(await host.materialFrame(size,size)).attachments[0];
    const at=(8*size+8)*4,wanted=alpha(snorm(byte));maxAlphaError=Math.max(maxAlphaError,Math.abs(corrected[at+3]-wanted));
    assert.ok(corrected.every(Number.isFinite),shader+' finite output');
    await host.setMaterialScene(await bindVulkanMaterial(compiled,{...input,attributes:{...BAKED_VERTEX_ATTRIBUTES,a_userData1:{format:'unorm4',offset:36}}}));
    const old=(await host.materialFrame(size,size)).attachments[0];assert.ok(Math.abs(old[at+3]-alpha(byte/255))<1e-6,`${shader} byte ${byte}: ${old[at+3]} != ${alpha(byte/255)}`);
    if(Math.abs(old[at+3]-corrected[at+3])>.01)changedCases++;
   }
   assert.ok(maxAlphaError<1e-6);assert.ok(changedCases>=3);
   report.shaders.push({shader,cases:10,maxAlphaError,changedCases,originalSourcesSha256:[digest(Buffer.from(program.vertexSource)),digest(Buffer.from(program.fragmentSource))]});
  }
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/skirt-render-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify(report));
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
