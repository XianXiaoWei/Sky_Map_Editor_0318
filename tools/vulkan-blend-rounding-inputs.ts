import fs from 'node:fs';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
async function main() {
  const file=path.resolve(process.argv[2]),spec=JSON.parse(fs.readFileSync(file,'utf8'));
  const compiled=await compileVulkanShaders([
    {stage:'vert',format:'vulkan450',text:'#version 450\nlayout(location=0) in vec2 a_position;void main(){gl_Position=vec4(a_position,0.5,1.0);}\n'},
    {stage:'frag',format:'vulkan450',text:'#version 450\nuniform sampler2D u_texture;layout(location=0) out vec4 result;void main(){result=texelFetch(u_texture,ivec2(gl_FragCoord.xy),0);}\n'}]);
  const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  try {
    spec.device=await host.start();
    for(const c of spec.fixtures){
      const scenes=[];
      for(const [i,file] of [c.base,c.source].entries()){
        const input:VulkanMaterialInput={shader:'independent blend rounding',state:i?8:4,stride:8,attributes:{a_position:{format:'vec2',offset:0}},
          colorFormats:[c.format],vertices:new Uint8Array(new Float32Array([-1,-1,1,-1,1,1,-1,1]).buffer),indices:new Uint32Array([0,1,2,0,2,3]),uniforms:{},
          textures:{u_texture:{format:'rgba16f',dimensions:[c.width,c.height,1],linear:false,repeat:false,data:fs.readFileSync(file)}}};
        scenes.push(await bindVulkanMaterial(compiled,input));
      }
      await host.setMaterialBatch(scenes);const frame=await host.materialFrame(c.width,c.height);fs.writeFileSync(c.output,new Uint8Array(frame.attachments[0].buffer));
    }
    fs.writeFileSync(file,JSON.stringify(spec));
  } finally {host.stop();}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
