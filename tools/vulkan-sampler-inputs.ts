import fs from 'node:fs';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';

async function main() {
  const file = path.resolve(process.argv[2]), spec = JSON.parse(fs.readFileSync(file, 'utf8'));
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  try {
    spec.device = await host.start();
    for (const fixture of spec.fixtures) {
      const compiled = await compileVulkanShaders((['vert', 'frag'] as const).map(stage => ({ stage, format: 'vulkan450' as const, text: fs.readFileSync(fixture[stage], 'utf8') })));
      const textures: VulkanMaterialInput['textures'] = Object.fromEntries(Object.entries(fixture.textures as Record<string, VulkanMaterialInput['textures'][string] & { data: string }>).map(([name, t]) => [name, { ...t, data: fs.readFileSync(t.data) }]));
      const input: VulkanMaterialInput = { shader: fixture.name, stride: 8, state: 4,
        vertices: new Uint8Array(new Float32Array([-1,-1,1,-1,1,1,-1,1]).buffer), indices: new Uint32Array([0,1,2,0,2,3]),
        attributes: { a_position: { format: 'vec2', offset: 0 } }, uniforms: fixture.uniforms, textures, colorFormats: fixture.colorFormats };
      await host.setMaterialScene(await bindVulkanMaterial(compiled, input));
      const frame = await host.materialFrame(fixture.width, fixture.height);
      fs.writeFileSync(fixture.output, new Uint8Array(frame.attachments[0].buffer));
    }
    fs.writeFileSync(file, JSON.stringify(spec));
  } finally { host.stop(); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
