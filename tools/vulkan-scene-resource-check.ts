import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
import { vulkanTextureDataBytes } from '../src/core/vulkan-protocol';

async function main() {
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const report: Record<string, unknown> = { scope: 'Vulkan resource upload and shader sampling; analytical fixtures, not game image parity', passed: false };
  try {
    report.device = await host.start();
    const vertex = '#version 450\nlayout(location=0) in vec3 a_position;void main(){gl_Position=vec4(a_position,1.0);}\n';
    const fragment = `#version 450
uniform samplerCube u_probeCube;
uniform usampler2D u_counts;
uniform uvec4 u_expected;
layout(location=0) out vec4 color;
void main(){
  int pixel=int(gl_FragCoord.x),face=pixel/3,level=pixel%3;
  vec3 directions[6]=vec3[6](vec3(1,0,0),vec3(-1,0,0),vec3(0,1,0),vec3(0,-1,0),vec3(0,0,1),vec3(0,0,-1));
  color=textureLod(u_probeCube,directions[face],float(level));
  color.a=all(equal(texelFetch(u_counts,ivec2(0),0),u_expected))?1.0:0.0;
}
`;
    const compiled = await compileVulkanShaders([{ stage: 'vert', format: 'vulkan450', text: vertex }, { stage: 'frag', format: 'vulkan450', text: fragment }]);
    assert.equal(compiled.success, true, compiled.log);
    const cube = new Float32Array(vulkanTextureDataBytes([4, 4, 6], 3, 4, 3) / 4);
    let at = 0;
    for (let level = 0; level < 3; level++) for (let face = 0; face < 6; face++)
      for (let pixel = 0; pixel < (4 >> level) ** 2; pixel++) { cube.set([face + 1, level + 10, 123, .5], at); at += 4; }
    const specs = [
      ['r8ui', new Uint8Array([251]), [251, 0, 0, 1]],
      ['rg8ui', new Uint8Array([251, 193]), [251, 193, 0, 1]],
      ['r16ui', new Uint16Array([65521]), [65521, 0, 0, 1]],
      ['rg16ui', new Uint16Array([65521, 513]), [65521, 513, 0, 1]],
      ['r32ui', new Uint32Array([0xffffffff]), [0xffffffff, 0, 0, 1]],
      ['rgba8ui', new Uint8Array([251, 193, 137, 79]), [251, 193, 137, 79]],
    ] as const;
    const cases: Record<string, unknown>[] = [];
    for (const [format, counts, expected] of specs) {
      const input: VulkanMaterialInput = { shader: 'analytical-cube-and-light-counts', state: 6, stride: 12,
        vertices: new Uint8Array(new Float32Array([-1,-1,0,1,-1,0,1,1,0,-1,1,0]).buffer), indices: new Uint32Array([0,1,2,0,2,3]),
        attributes: { a_position: { format: 'vec3', offset: 0 } }, uniforms: { u_expected: [...expected] },
        textures: { u_probeCube: { format: 'rgba32f', dimensions: [4,4,6], mipLevels: 3, linear: true, repeat: false, data: new Uint8Array(cube.buffer) },
          u_counts: { format, dimensions: [1,1,1], linear: false, repeat: false, data: new Uint8Array(counts.buffer) } } };
      const scene = await bindVulkanMaterial(compiled, input);
      await host.setMaterialScene(scene);
      const frame = await host.materialFrame(18, 1), values = frame.attachments[0];
      for (let pixel = 0; pixel < 18; pixel++) assert.deepEqual(Array.from(values.subarray(pixel * 4, pixel * 4 + 4)), [Math.floor(pixel / 3) + 1, pixel % 3 + 10, 123, 1]);
      await assert.rejects(bindVulkanMaterial(compiled, { ...input, textures: { ...input.textures, u_counts: { ...input.textures.u_counts, format: 'rgba8' } } }), /类型/);
      cases.push({ integerFormat: format, cubeFaces: 6, mipLevels: 3, pixelsVerified: 18 });
    }
    // R8 mip offsets are not necessarily four-byte aligned on the wire.
    // The native staging layer aligns each copy without altering texel bytes.
    const small = await compileVulkanShaders([{ stage: 'vert', format: 'vulkan450', text: vertex }, { stage: 'frag', format: 'vulkan450', text: '#version 450\nuniform sampler2D u_texture;layout(location=0) out vec4 color;void main(){color=vec4(textureLod(u_texture,vec2(.5),float(int(gl_FragCoord.x))).r);}\n' }]);
    assert.equal(small.success, true, small.log);
    await host.setMaterialScene(await bindVulkanMaterial(small, { shader: 'unaligned-r8-mips', state: 6, stride: 12,
      vertices: new Uint8Array(new Float32Array([-1,-1,0,1,-1,0,1,1,0,-1,1,0]).buffer), indices: new Uint32Array([0,1,2,0,2,3]),
      attributes: { a_position: { format: 'vec3', offset: 0 } }, uniforms: {},
      textures: { u_texture: { format: 'r8', dimensions: [8,8,1], mipLevels: 4, linear: false, repeat: false,
        data: new Uint8Array([...Array(64).fill(0), ...Array(16).fill(255), ...Array(4).fill(0), 255]) } } }));
    assert.deepEqual(Array.from((await host.materialFrame(4,1)).attachments[0]), [...Array(4).fill(0), ...Array(4).fill(1), ...Array(4).fill(0), ...Array(4).fill(1)]);
    report.cases = cases; report.componentsVerified = 6 * 18 * 4 + 16; report.passed = true;
  } catch (error) { report.error = String(error); throw error; }
  finally { host.stop(); await fs.writeFile('docs/vulkan-scene-resource-check.json', JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report)); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
