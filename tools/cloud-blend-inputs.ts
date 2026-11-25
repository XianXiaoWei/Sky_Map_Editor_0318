import fs from 'node:fs';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
import { CLOUD_LIST_MATERIAL_STATE } from '../src/core/cloud-render-state';
import type { VulkanColorFormat } from '../src/core/vulkan-protocol';

async function main() {
  const out = path.resolve(process.argv[2]); fs.mkdirSync(out, { recursive: true });
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const width = 16, height = 8, cases = [], device = await host.start();
  try {
    for (const count of [2, 4]) for (const format of ['rgba16f', 'rgba32f'] as VulkanColorFormat[]) {
      const fragment = '#version 450\n' + Array.from({ length: count }, (_, i) => `uniform vec4 u_color${i};layout(location=${i}) out vec4 color${i};`).join('\n') + '\nvoid main(){' + Array.from({ length: count }, (_, i) => `color${i}=u_color${i};`).join('') + '}\n';
      const base = await compileVulkanShaders([{ stage: 'vert', format: 'vulkan450', text: '#version 450\nlayout(location=0) in vec3 a_position;void main(){gl_Position=vec4(a_position,1.0);}\n' }, { stage: 'frag', format: 'vulkan450', text: fragment }]);
      const overlay = await compileVulkanShaders([{ stage: 'vert', format: 'vulkan450', text: '#version 450\nuniform float u_z;layout(location=0) in vec2 a_screen;void main(){gl_Position=vec4(a_screen,u_z,1.0);}\n' }, { stage: 'frag', format: 'vulkan450', text: fragment }]);
      const colors = [
        [[.25, .5, .75, .125], [8, -4, 16, .5], [1, 2, 3, .25], [2, 4, 6, .5]],
        [[.75, -.25, .5, .5], [12, 16, -4, .25], [8, 16, 32, .75], [16, 8, 4, 1]],
        [[-.5, .25, 1, .25], [-8, 4, 8, .5], [4, 2, 1, .5], [1, 2, 4, .25]],
      ].map(c => c.slice(0, count));
      const inputs = colors.map((c, i): VulkanMaterialInput => ({ shader: 'analytical-blend-' + i, state: i === 0 ? 6 : CLOUD_LIST_MATERIAL_STATE,
        colorFormats: Array(count).fill(format), stride: i === 0 ? 12 : 8,
        vertices: new Uint8Array(new Float32Array(i === 0 ? [-1,-1,.1,1,-1,.1,1,1,.1,-1,1,.1] : i === 1 ? [-1,-1,0,-1,0,1,-1,1] : [-1,-1,1,-1,1,0,-1,0]).buffer),
        // Reversed winding for the first Cloud draw; native Cloud culls neither face.
        indices: new Uint32Array(i === 1 ? [0,2,1,0,3,2] : [0,1,2,0,2,3]),
        attributes: i === 0 ? { a_position: { format: 'vec3', offset: 0 } } : { a_screen: { format: 'vec2', offset: 0 } },
        uniforms: { ...Object.fromEntries(c.map((rgba, n) => ['u_color' + n, rgba])), u_z: i === 1 ? .9 : .8 }, textures: {} }));
      const scenes = [];
      for (const [i, input] of inputs.entries()) scenes.push(await bindVulkanMaterial(i === 0 ? base : overlay, input));
      const save = (name: string, a: Float32Array) => { const file = path.join(out, name); fs.writeFileSync(file, new Uint8Array(a.buffer)); return file; };
      await host.setMaterialBatch(scenes);
      const frames = [await host.materialFrame(width, height), await host.materialFrame(width, height)];
      cases.push({ format, count, colors, width, height, kind: 'two-cloud-overlays',
        files: frames.map((f, n) => f.attachments.map((a, i) => save(`${format}-${count}-repeat${n}-${i}.f32`, a))) });
      await host.setMaterialScene(scenes[0]);
      const reset = await host.materialFrame(width, height);
      cases.push({ format, count, colors: [colors[0]], width, height, kind: 'single-scene-reset', files: [reset.attachments.map((a, i) => save(`${format}-${count}-reset-${i}.f32`, a))] });
      await host.setMaterialBatch([scenes[0], { ...scenes[1], indices: new Uint32Array(0) }]);
      const empty = await host.materialFrame(width, height);
      cases.push({ format, count, colors: [colors[0]], width, height, kind: 'empty-cloud-draw', files: [empty.attachments.map((a, i) => save(`${format}-${count}-empty-${i}.f32`, a))] });
    }
    fs.writeFileSync(path.join(out, 'spec.json'), JSON.stringify({ device, cases }));
  } finally { host.stop(); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
