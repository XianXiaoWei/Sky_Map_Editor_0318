import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import { cameraSampling, jitterViewProjection, correctPreviousViewProjection } from '../src/core/camera-sampling';
import { cloudRenderGraph } from '../src/core/cloud-render-graph';
import { AssetCatalog } from '../src/main/assets';
import { VulkanHost } from '../src/main/vulkan';
import { createVulkanTemporalAA } from '../src/main/vulkan-temporal-aa';
import { sampledVulkanTarget } from '../src/main/vulkan-target';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { vulkanProgramSources } from '../src/main/vulkan-program';
import { renderVulkanCloudDepth, type DepthShader } from '../src/main/vulkan-depth';

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const width = 96, height = 64, graph = cloudRenderGraph(width, height);
const texture = (values: Float32Array) => ({ format: 'rgba32f' as const, dimensions: [width, height, 1] as [number, number, number], linear: true, repeat: false, data: new Uint8Array(values.buffer) });
const flat = Float32Array.from({ length: width * height * 4 }, (_, i) => [.125, .25, .5, 1][i % 4]);
const baseProjection = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, -1, 0, 0, -.2, 0];
const fullDepth = Float32Array.from({ length: width * height * 4 }, (_, i) => {
  if (i % 4 !== 3) return 0;
  const p = Math.floor(i / 4), x = p % width, y = Math.floor(p / width);
  const value = 1 + ((x * 3 + y * 5) % 211) * .125;
  return (x + y) % 3 ? value : -value;
});

async function main() {
  const host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const report: any = { passed: false, scope: 'Native camera sampling applied to production Vulkan depth/MotionGen/MotionDilate/TemporalAa. All 32 half-order entries, eight scene phases, signed 2x2 depth selection, static opaque motion cancellation, constant color and explicit camera translation. Does not validate Metal, full cloud lighting, moving model list or complete original camera lifecycle.' };
  try {
    report.device = await host.start(); const catalog = new AssetCatalog(data), cache = '/tmp/sky-camera-temporal-shaders';
    const temporal = createVulkanTemporalAA(catalog, host, cache), shaders = {} as Record<DepthShader, Awaited<ReturnType<typeof compileVulkanShaders>>>;
    for (const p of graph.depthPasses) shaders[p.shader as DepthShader] = await compileVulkanShaders(vulkanProgramSources(catalog.program(p.shader)), cache);
    const source = sampledVulkanTarget(graph.targets.fullRGBDepth, fullDepth);
    const zeroCloud = sampledVulkanTarget(graph.targets.cloudB, new Float32Array(width / 2 * height / 2 * 4));
    const flatDepth = sampledVulkanTarget(graph.targets.depthHalfMin, Float32Array.from({ length: width / 2 * height / 2 * 4 }, (_, i) => i % 4 < 2 ? 1 : 0));
    let previous: { jitter: number[]; jitterHalf: number[] } | undefined, previousViewProj: number[] | undefined, previousShift: number[] | undefined;
    let maxStaticMotion = 0, flatMismatches = 0, selectionMismatches = 0, minMismatches = 0;
    const phases = new Set<number>(), halfPhases = new Set<number>();
    for (let frame = 0; frame < 32; frame++) {
      const s = cameraSampling(frame, width, height, previous); phases.add(s.phase); halfPhases.add(s.halfPhase);
      const depth = await renderVulkanCloudDepth(host, shaders, width, height, source, { u_texSizeHalf: [width / 2, height / 2], u_jitterHalf: s.jitterHalf as [number, number] }, true);
      const selected = depth.passes[0].frame.attachments[0];
      for (let y = 0; y < height / 2; y++) for (let x = 0; x < width / 2; x++) {
        const sx = x * 2 + Number(s.jitterHalf[0] >= 0), sy = y * 2 + Number(s.jitterHalf[1] < 0), i = (y * width / 2 + x) * 4;
        if (selected[i + 1] !== fullDepth[(sy * width + sx) * 4 + 3]) selectionMismatches++;
        const min = Math.min(...[0, 1, 2, 3].map(q => Math.abs(fullDepth[((y * 2 + (q >> 1)) * width + x * 2 + (q & 1)) * 4 + 3])));
        if (selected[i] !== min) minMismatches++;
      }
      const viewProj = jitterViewProjection(baseProjection, s.projectionShift);
      const uniforms = { u_eyePos: [0, 0, 0], u_projPlaneU: [2, 0, 0], u_projPlaneV: [0, 2, 0], u_projPlaneOrigin: [-1, -1, -1],
        u_jitter: s.jitter, u_viewProjOld: previousViewProj ? correctPreviousViewProjection(previousViewProj, s.projectionShift, previousShift!) : viewProj,
        u_aaCornerUvs0: s.u_aaCornerUvs0, u_aaCornerUvs1: s.u_aaCornerUvs1 };
      const out = await temporal.resolve(width, height, uniforms, { color: texture(flat), cloudB: zeroCloud, depthHalfMin: flatDepth });
      assert.equal(out.cameraCut, frame === 0);
      for (let i = 0; i < out.motion.length; i += 4) maxStaticMotion = Math.max(maxStaticMotion, Math.abs(out.motion[i]), Math.abs(out.motion[i + 1]));
      for (let i = 0; i < flat.length; i++) if (i % 4 !== 3 && out.resolved[i] !== flat[i]) flatMismatches++;
      previous = { jitter: s.jitter, jitterHalf: s.jitterHalf };
      previousViewProj = viewProj; previousShift = s.projectionShift;
    }
    report.checks = { frames: 32, scenePhases: phases.size, halfPositions: halfPhases.size, maxStaticMotion, flatMismatches, selectionMismatches, minMismatches };
    assert.equal(selectionMismatches, 0); assert.equal(minMismatches, 0); assert.equal(flatMismatches, 0); assert.ok(maxStaticMotion < .0002); assert.equal(phases.size, 8); assert.equal(halfPhases.size, 4);
    const s = cameraSampling(32, width, height, previous);
    const moved = await temporal.resolve(width, height, { u_eyePos: [.3, 0, 0], u_projPlaneU: [2, 0, 0], u_projPlaneV: [0, 2, 0], u_projPlaneOrigin: [-1, -1, -1],
      u_jitter: s.jitter, u_viewProjOld: correctPreviousViewProjection(previousViewProj!, s.projectionShift, previousShift!), u_aaCornerUvs0: s.u_aaCornerUvs0, u_aaCornerUvs1: s.u_aaCornerUvs1 },
      { color: texture(flat), cloudB: zeroCloud, depthHalfMin: flatDepth }, true);
    let maxMovedMotionError = 0;
    for (let i = 0; i < moved.motion.length; i += 4) maxMovedMotionError = Math.max(maxMovedMotionError, Math.abs(moved.motion[i] + 15.36), Math.abs(moved.motion[i + 1]));
    report.checks.maxMovedMotionError = maxMovedMotionError; report.checks.cameraCut = moved.cameraCut;
    assert.ok(maxMovedMotionError < .02); assert.equal(moved.cameraCut, true); report.passed = true;
  } finally { host.stop(); fs.writeFileSync('docs/camera-temporal-check.json', JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report)); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
