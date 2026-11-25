import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
import { AssetCatalog } from '../src/main/assets';
import { vulkanProgramSources } from '../src/main/vulkan-program';

async function main() {
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const report:Record<string,unknown>={passed:false,scope:'Original GLES to Vulkan coordinate mapping; analytical rasterization and real terrain program compilation, not game image parity'};
  try {
    report.device=await host.start();
    const width=8,height=4;
    const vert='#version 300 es\nin vec3 a_position;void main(){gl_Position=vec4(a_position,1);return;}\n';
    const frag='#version 300 es\nprecision highp float;uniform highp vec2 u_viewportSize;\nlayout(location=0) out vec4 color;void main(){color=vec4(gl_FragCoord.xy/u_viewportSize,gl_FragCoord.zw);}\n';
    const shader=await compileVulkanShaders([{stage:'vert',text:vert,coordinates:'opengl'},{stage:'frag',text:frag,coordinates:'opengl'}]);
    assert.equal(shader.success,true,shader.log);
    await host.setMaterialScene(await bindVulkanMaterial(shader,{shader:'opengl-coordinates',state:0,stride:12,
      vertices:new Uint8Array(new Float32Array([-1,-1,-.5,1,-1,-.5,1,1,-.5,-1,1,-.5]).buffer),indices:new Uint32Array([0,1,2,0,2,3]),
      attributes:{a_position:{format:'vec3',offset:0}},uniforms:{u_viewportSize:[width,height]},textures:{}}));
    const values=(await host.materialFrame(width,height)).attachments[0];
    for(let row=0;row<height;row++)for(let column=0;column<width;column++)
      assert.deepEqual(Array.from(values.subarray((row*width+column)*4,(row*width+column+1)*4)),[(column+.5)/width,(height-row-.5)/height,.25,1]);
    report.componentsVerified=values.length;report.earlyReturn=true;report.backFaceCulling=true;
    const catalog=new AssetCatalog(process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data','Dawn');
    const programs=[];
    for(const name of ['RockFaceSh','RockFaceRainSh','SandSh','SandRainSh','GrassSh','CloudSh']) {
      const program=catalog.program(name),compiled=await compileVulkanShaders(vulkanProgramSources(program));
      assert.equal(compiled.success,true,`${name}: ${compiled.log}`);
      programs.push({name,key:compiled.key,descriptors:compiled.descriptors.map(d=>d.name),artifacts:compiled.artifacts.map(a=>({stage:a.stage,sha256:a.sha256}))});
    }
    report.terrainPrograms=programs;report.passed=true;
  }catch(error){report.error=String(error);throw error;}
  finally{host.stop();await fs.writeFile('docs/vulkan-game-coordinate-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({...report,terrainPrograms:(report.terrainPrograms as unknown[])?.length}));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
