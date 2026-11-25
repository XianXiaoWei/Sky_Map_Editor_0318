import fs from 'node:fs';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';

async function main() {
  const directory = path.resolve(process.argv[2]), width = 512, height = 512;
  const cloud = fs.readFileSync('evidence/cloud-air-vulkan/CloudCore0.frag', 'utf8');
  const helpers = cloud.slice(cloud.indexOf('float air_quantize('), cloud.indexOf('layout('));
  const sources = [{ stage: 'vert' as const, format: 'vulkan450' as const, text: '#version 450\nin vec2 a_position; void main(){gl_Position=vec4(a_position,0.0,1.0);}\n' },
    { stage: 'frag' as const, format: 'vulkan450' as const, text: '#version 450\n#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require\n' + helpers + `
uniform vec2 u_size;
layout(binding=1,set=0) uniform sampler2D u_values;
layout(location=0) out vec4 result;
void main(){float v=textureLod(u_values,gl_FragCoord.xy/u_size,0.0).r; result=vec4(air_quantize(v),float(float16_t(v)),0.0,1.0);}
` }];
  const compiled = await compileVulkanShaders(sources);
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  try {
    const device = await host.start();
    const scene = await bindVulkanMaterial(compiled, { shader: 'AIR half rounding probe', stride: 8, state: 4, attributes: { a_position: { format: 'vec2', offset: 0 } },
      vertices: new Uint8Array(new Float32Array([-1,-1,1,-1,1,1,-1,1]).buffer), indices: new Uint32Array([0,1,2,0,2,3]), uniforms: { u_size: [width,height] },
      textures: { u_values: { format: 'r32f', dimensions: [width,height,1], linear: false, repeat: false, data: fs.readFileSync(path.join(directory,'values.f32')) } } });
    await host.setMaterialScene(scene); const frame = await host.materialFrame(width,height);
    fs.writeFileSync(path.join(directory,'actual.f32'),new Uint8Array(frame.attachments[0].buffer)); fs.writeFileSync(path.join(directory,'device.json'),JSON.stringify(device));
  } finally { host.stop(); }
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
