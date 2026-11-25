import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { cloudRenderGraph } from '../src/core/cloud-render-graph';
import { VulkanHost } from '../src/main/vulkan';
import { compileVulkanShaders, type VulkanShaderCompilation } from '../src/main/vulkan-shaders';
import { vulkanProgramSources } from '../src/main/vulkan-program';
import { renderVulkanCloudDepth, type DepthShader } from '../src/main/vulkan-depth';
import { sampledVulkanTarget } from '../src/main/vulkan-target';
import { bindVulkanMaterial } from '../src/main/vulkan-material';

async function main() {
  const out = path.resolve(process.argv[2]); fs.mkdirSync(out, { recursive: true });
  const data = '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
  const catalog = new AssetCatalog(data), host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const sizes = (process.argv.find(a => a.startsWith('--sizes='))?.slice(8) ?? '127x73,64x40,3x1,1x1').split(',').map(s => s.split('x').map(Number));
  const shaders = {} as Record<DepthShader, VulkanShaderCompilation>;
  const captureUV = process.argv.includes('--capture-uv');
  let captureShader: VulkanShaderCompilation | undefined;
  const sources = new Map<DepthShader, ReturnType<typeof vulkanProgramSources>>();
  const names: DepthShader[] = ['DepthDownsample', 'DepthDownsampleGather', 'DepthDownsampleQuarter'];
  for (const name of names) {
    sources.set(name, vulkanProgramSources(catalog.program(name)));
    shaders[name] = await compileVulkanShaders(sources.get(name)!);
    if (!shaders[name].success) throw new Error(shaders[name].log);
    if (captureUV && name === 'DepthDownsampleQuarter') {
      const diagnostic = sources.get(name)!.map(s => s.stage === 'frag' ? { ...s,
        text: s.text.replace('void main() {', 'layout(location=1) out vec4 diagnostic_uv;\nvoid main() {').replaceAll('return;', 'diagnostic_uv=vec4(v_uv,0.0,1.0); return;') } : s);
      captureShader = await compileVulkanShaders(diagnostic);
      if (!captureShader.success) throw new Error(captureShader.log);
    }
  }
  const save = (name: string, bytes: Uint8Array) => { const file = path.join(out, name); fs.writeFileSync(file, bytes); return file; };
  const programs = [], device = await host.start();
  try {
    for (const [width, height] of sizes) {
      const graph = cloudRenderGraph(width, height), [halfW, halfH] = graph.targets.depthHalf.dimensions;
      const jitterCases = [[0, 0], [-1, -1], [-1, 1], [1, -1], [1, 1], [0, 1], [1, 0]];
      for (const pattern of ['mixed', 'zero']) for (const [jx, jy] of jitterCases) {
        const cameraCase = `${width}x${height}-${pattern}-jitter${jx},${jy}`;
        // Distinct signed half depths, finite extrema, subnormals and both
        // zero signs. Non-alpha channels deliberately carry different values.
        const depths = [0, -0, 2 ** -24, -(2 ** -24), .03125, -.125, 1, -3, 17.5, -63, 10000, -25600, 65504];
        const pixels = Float32Array.from({ length: width * height * 4 }, (_, i) => {
          const p = Math.floor(i / 4), x = p % width, y = Math.floor(p / width);
          return i % 4 === 3 ? pattern === 'zero' ? 0 : depths[(x * 7 + y * 11) % depths.length] : [.25, -.5, 2][i % 4];
        });
        const fullDepth = sampledVulkanTarget(graph.targets.fullRGBDepth, pixels);
        const uniforms = { u_texSizeHalf: [halfW, halfH] as [number, number], u_jitterHalf: [jx * .125 / halfW, jy * .125 / halfH] as [number, number] };
        const result = await renderVulkanCloudDepth(host, shaders, width, height, fullDepth, uniforms);
        for (const { shader: name, input, frame } of result.passes) {
          const prefix = cameraCase + '-' + name, program = catalog.program(name);
          let varyingFiles: Record<string, string> | undefined, varyingCaptureOutputMatches: boolean | undefined;
          if (captureUV && name === 'DepthDownsampleQuarter') {
            await host.setMaterialScene(await bindVulkanMaterial(captureShader!, { ...input, colorFormats: [...input.colorFormats!, 'rgba32f'] }));
            const captured = await host.materialFrame(frame.width, frame.height);
            varyingCaptureOutputMatches = Buffer.from(captured.attachments[0].buffer).equals(Buffer.from(frame.attachments[0].buffer));
            varyingFiles = { v_uv: save(prefix + '-captured-uv.f32', new Uint8Array(captured.attachments[1].buffer)) };
          }
          programs.push({ name, cameraCase, width: frame.width, height: frame.height,
            varyingFiles, varyingCaptureOutputMatches,
            stride: input.stride, attributes: input.attributes, uniforms, colorFormats: input.colorFormats,
            vertices: save(prefix + '-vertices.bin', input.vertices), indices: save(prefix + '-indices.bin', new Uint8Array(input.indices.buffer)),
            textures: Object.fromEntries(Object.entries(input.textures).map(([key, t]) => [key, { ...t, data: save(prefix + '-' + key + '.bin', t.data) }])),
            outputFiles: frame.attachments.map((a, i) => save(prefix + '-native-' + i + '.f32', new Uint8Array(a.buffer))),
            airFiles: { vert: path.resolve('evidence', program.definition.vertex + '.air.ll'), frag: path.resolve('evidence', program.definition.fragment + '.air.ll') },
            vulkanFiles: Object.fromEntries(sources.get(name)!.map(s => [s.stage, save(prefix + '-vulkan.' + s.stage, Buffer.from(s.text))])) });
        }
      }
    }
    fs.writeFileSync(path.join(out, 'spec.json'), JSON.stringify({ device, translation: 'metal-air',
      airManifest: JSON.parse(fs.readFileSync('evidence/cloud-air-vulkan/manifest.json', 'utf8')), exactComparison: true,
      fixture: 'Original three depth AIR stages executed through the production Vulkan depth-chain entry. Original RGBA16F opaque signed-alpha input and RG16F/RGBA16F/RG16F floor-divided targets, nearest clamp, shader-generated indexed fullscreen vertex IDs. Explicit test dimensions, half-size/jitter uniforms and depth patterns include negative/positive depths, signed zero, subnormals, finite extrema and zero-to-25600. Quarter texture uses the recovered global binding. ' + (captureUV ? 'Quarter reference uses separately captured Vulkan float32 varying UV to isolate nearest sampling from raster interpolation at texel boundaries. Capturing UV must preserve every production output byte; CPU original vertex interpolation is checked with absolute UV tolerance 2e-6. ' : '') + 'Scene depth production and original Metal/game execution are not covered.', programs }));
  } finally { host.stop(); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
