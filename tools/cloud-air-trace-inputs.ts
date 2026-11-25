import fs from 'node:fs';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';

// Instrumented arithmetic tracing is diagnostic only. The production shader
// source and normal acceptance reports are never changed by this runner.
async function main() {
  const file = path.resolve(process.argv[2]), directory = path.dirname(file), spec = JSON.parse(fs.readFileSync(file, 'utf8'));
  const compiled = await compileVulkanShaders((['vert', 'frag'] as const).map(stage => ({ stage, format: 'vulkan450' as const, text: fs.readFileSync(spec[stage], 'utf8') })));
  const textures: VulkanMaterialInput['textures'] = Object.fromEntries(Object.entries(spec.textures as Record<string, VulkanMaterialInput['textures'][string] & { data: string }>).map(([name, t]) => [name, { ...t, data: fs.readFileSync(t.data) }]));
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  try {
    const device = await host.start();
    const scene = await bindVulkanMaterial(compiled, { shader: 'AIR instrumented trace', stride: 8, state: 4,
      vertices: new Uint8Array(new Float32Array([-1,-1,1,-1,1,1,-1,1]).buffer), indices: new Uint32Array([0,1,2,0,2,3]),
      attributes: { a_position: { format: 'vec2', offset: 0 } }, uniforms: spec.uniforms, textures });
    await host.setMaterialScene(scene); const frame = await host.materialFrame(spec.width, spec.height);
    frame.attachments.forEach((a, i) => fs.writeFileSync(path.join(directory, `trace-${i}.f32`), new Uint8Array(a.buffer)));
    fs.writeFileSync(path.join(directory,'device.json'),JSON.stringify(device));
  } finally { host.stop(); }
}
void main().catch(e => { console.error(e); process.exitCode = 1; });
