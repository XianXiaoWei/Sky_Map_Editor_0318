import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { vulkanProgramSources } from '../src/main/vulkan-program';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { renderVulkanCloudPass } from '../src/main/vulkan-cloud';
import { VulkanHost } from '../src/main/vulkan';

async function main() {
  const out = path.resolve(process.argv[2]), fineSpec = JSON.parse(fs.readFileSync(process.argv[3],'utf8')), cardSpec = JSON.parse(fs.readFileSync(process.argv[4],'utf8'));
  fs.mkdirSync(out,{recursive:true});
  const catalog = new AssetCatalog('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan')), fine = fineSpec.programs.find((p:any) => p.name==='CloudFluffy' && p.cameraCase==='outside');
  const cards = ['CloudCard','CloudQuadParticleFluffy'].map(name => cardSpec.programs.find((p:any) => p.name===name && p.cameraCase==='63x37-depth10000'));
  const inputs = [fine,...cards].map(p => ({ shader:p.name,stride:p.stride,attributes:p.attributes,uniforms:{...p.uniforms,u_viewportSize:[fine.width,fine.height]},state:4,colorFormats:['rgba16f','rgba16f'],
    vertices:fs.readFileSync(p.vertices),indices:new Uint32Array(Uint8Array.from(fs.readFileSync(p.indices)).buffer),
    textures:Object.fromEntries(Object.entries(p.textures).map(([key,t]:[string,any])=>[key,{...t,data:fs.readFileSync(t.data)}])) } as VulkanMaterialInput));
  const draws=[];
  for(const input of inputs)draws.push({input,compiled:await compileVulkanShaders(vulkanProgramSources(catalog.program(input.shader)))});
  const save = (name:string,a:Float32Array) => {const file=path.join(out,name);fs.writeFileSync(file,new Uint8Array(a.buffer));return file;};
  const device=await host.start();
  try {
    const standalone=[];
    for(const draw of draws){await host.setMaterialScene(await bindVulkanMaterial(draw.compiled,draw.input));const frame=await host.materialFrame(fine.width,fine.height);standalone.push(frame.attachments.map((a,i)=>save(draw.input.shader+'-standalone-'+i+'.f32',a)));}
    const result=await renderVulkanCloudPass(host,fine.width*2,fine.height*2,draws[0],draws.slice(1));
    const outputs=result.frame.attachments.map((a,i)=>save('combined-'+i+'.f32',a));
    const first=await renderVulkanCloudPass(host,fine.width*2,fine.height*2,draws[0],draws.slice(1,2));
    const firstOutputs=first.frame.attachments.map((a,i)=>save('first-'+i+'.f32',a));
    const empty=await renderVulkanCloudPass(host,fine.width*2,fine.height*2,draws[0],[]);
    const emptyOutputs=empty.frame.attachments.map((a,i)=>save('empty-'+i+'.f32',a));
    fs.writeFileSync(path.join(out,'spec.json'),JSON.stringify({device,width:fine.width,height:fine.height,standalone,outputs,firstOutputs,emptyOutputs,
      shaders:inputs.map(i=>i.shader),scope:'Original fine AIR plus CloudCard/CloudQuadParticleFluffy AIR drawn in ONE native Cloud pass through the production entry. Real Dawn cloud atlas/noise fields; explicit test vertex streams/cameras/depth/lighting/resources. Ordered list is supplied; actual object generation, Scene sorting and game image parity remain separate.'}));
  } finally {host.stop();}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
