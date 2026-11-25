import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { MeshesDocument } from '../src/core/meshes';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
import { cloudRenderGraph } from '../src/core/cloud-render-graph';
import { sampledVulkanTarget } from '../src/main/vulkan-target';
import { renderVulkanCloudDepth, type DepthShader } from '../src/main/vulkan-depth';
import type { VulkanShaderCompilation } from '../src/main/vulkan-shaders';

// Original cloud shaders executed on the production native host. The cloud
// fields come from a real level; camera/light/noise are explicit TEST inputs.
async function main() {
  const out = path.resolve(process.argv[2]); fs.mkdirSync(out, { recursive: true });
  const air = process.argv.includes('--air');
  const airDirectory = process.argv.find(a => a.startsWith('--air-directory='))?.slice(16) ?? 'evidence/cloud-air-vulkan';
  const airManifest = air ? JSON.parse(fs.readFileSync(path.resolve(airDirectory, 'manifest.json'), 'utf8')) : undefined;
  const graphMode = process.argv.includes('--graph');
  const depthGraph = process.argv.includes('--depth-graph');
  if (depthGraph && (!air || !graphMode)) throw new Error('--depth-graph requires --air --graph');
  const sizeArgument = process.argv.find(a => a.startsWith('--size='))?.slice(7) ?? (graphMode ? '64x40' : '16x16');
  const [width, height] = sizeArgument.split('x').map(Number), graph = cloudRenderGraph(width, height);
  const data = '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
  const level = process.argv.find(a => a.startsWith('--level='))?.slice(8) ?? 'Dawn', doc = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level, 'BstBaked.meshes'))), volume = doc.cloudVolume()!;
  const catalog = new AssetCatalog(data), host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const device = await host.start();
  const identity = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  const n = volume.distanceResolution;
  let minimum = -1;
  for (let i = 0; i < volume.distance.length; i++) {
    const x = i % n, y = Math.floor(i/n) % n, z = Math.floor(i/n**2) % n;
    if (x && y && z && x < n-1 && y < n-1 && z < n-1 && (minimum < 0 || volume.distance[i] < volume.distance[minimum])) minimum = i;
  }
  if (minimum < 0) throw new Error('Cloud fixture has no interior voxel');
  const block = Math.floor(minimum / n ** 3), voxel = minimum % n ** 3;
  const xyz = [voxel % n, Math.floor(voxel / n) % n, Math.floor(voxel / n ** 2)];
  const point = volume.origin.map((v,i) => (v+volume.coordinates[block*3+i])*16+(xyz[i]+.5)*16/n);
  const eye = point;
  const uniforms: Record<string, unknown> = { ...volume.bindings, u_jitter: [0,0], u_jitterHalf: [0,0], u_viewportSize: [width,height],
    u_projPlaneU: [.125,0,0], u_projPlaneV: [0,.125,0], u_projPlaneOrigin: [-.0625,-.0625,1], u_eyePos: eye,
    u_sunDir: [0,-1,0], u_sunColor: [1,.9,.8], u_averageSkyColor: [.2,.3,.4], u_pointLight: [0,0,0],
    u_time: 3.2, u_waterSimTerms: [0,0,0,0], u_randomOffset: [.1,.2,.3], u_cloudWindMove: [.1,.2,.3], u_cloudWindScroll: [.5,.5,.5],
    u_cloudMat: [.6,.7,.8,doc.cloud!.sunOcclusionScale], u_cloudNoiseTweaks: [.75,-10,4,0], u_cloudUndulationScale: .25, u_viewProjOld: identity,
    u_localAvatarPos: [1000,1000,1000], u_viewProj: identity };
  type Texture = VulkanMaterialInput['textures'][string];
  const textureNames = { CloudSparseGrid: 'u_cloudSparse', CloudPackedDistGrid: 'u_cloudDist', CloudPackedAmb0Grid: 'u_cloudAmb0', CloudPackedAmb1Grid: 'u_cloudAmb1', CloudPackedAmb2Grid: 'u_cloudAmb2' };
  const textures: Record<string, Texture> = {};
  for (const t of volume.textures) textures[textureNames[t.name]] = { format: t.channels === 1 ? 'r8' : 'rgba8', dimensions: t.dimensions, linear: t.name !== 'CloudSparseGrid', repeat: false, data: t.data };
  const constant = (rgba: number[]): Texture => ({ format: 'rgba32f', dimensions: [1,1,1], linear: false, repeat: false, data: new Uint8Array(new Float32Array(rgba).buffer) });
  textures.u_cloudNoise3D = catalog.cloudNoise();
  // Depth/water/blue-noise inputs are deliberately stated test dependencies.
  textures.u_depthQuarterTex = constant([10000,10000,0,0]); textures.u_depthHalfTex = constant([10000,10000,0,-1]);
  textures.u_waterSim = constant([0,0,0,0]); textures.u_texBlueNoise = constant([.25,.5,.75,1]);
  if (graphMode) {
    const pixels = graph.targets.cloudA.dimensions[0] * graph.targets.cloudA.dimensions[1];
    textures.u_cloudTex0 = sampledVulkanTarget(graph.targets.cloudA, Float32Array.from({ length: pixels * 4 }, (_, i) => [.25,.5,.75,1][i % 4]));
  }
  const quad = new Float32Array([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]);
  const programs: unknown[] = [];
  const save = (name: string, bytes: Uint8Array) => { const file = path.join(out, name); fs.writeFileSync(file, bytes); return file; };
  try {
    for (const cameraCase of ['outside', 'inside']) {
    uniforms.u_eyePos = cameraCase === 'inside' ? point : [point[0],point[1],point[2]-32];
    for (const name of graphMode ? ['CloudCore', ...graph.passes.map(p => p.shader)] : ['CloudFluffySuperCoarse', 'CloudFluffyCoarse', 'CloudFluffy', 'CloudCore']) {
    if (depthGraph && name === 'CloudFluffySuperCoarse') {
      const shaders = {} as Record<DepthShader, VulkanShaderCompilation>;
      const depthSources = new Map<DepthShader, { stage: 'vert' | 'frag'; format: 'vulkan450'; text: string }[]>();
      for (const name of graph.depthPasses.map(p => p.shader as DepthShader)) {
        const program = catalog.program(name);
        const sources = (['vert', 'frag'] as const).map(stage => ({ stage, format: 'vulkan450' as const,
          text: fs.readFileSync(path.resolve(airDirectory, stage === 'vert' ? program.definition.vertex : program.definition.fragment), 'utf8') }));
        depthSources.set(name, sources); shaders[name] = await compileVulkanShaders(sources);
      }
      const [halfW, halfH] = graph.targets.depthHalf.dimensions;
      const depths = [0, -.25, .5, -2, 8, 32, 10000];
      const fullDepth = sampledVulkanTarget(graph.targets.fullRGBDepth, Float32Array.from({ length: width * height * 4 }, (_, i) =>
        i % 4 === 3 ? depths[(Math.floor(i / 4) * 5 + Math.floor(i / 4 / width)) % depths.length] : [.25, .5, .75][i % 4]));
      const depthUniforms = { u_texSizeHalf: [halfW, halfH] as [number, number], u_jitterHalf: [-.125 / halfW, .125 / halfH] as [number, number] };
      const result = await renderVulkanCloudDepth(host, shaders, width, height, fullDepth, depthUniforms);
      uniforms.u_jitterHalf = depthUniforms.u_jitterHalf;
      textures.u_depthHalfTex = result.depthHalf; textures.u_depthQuarterTex = result.depthQuarter;
      for (const { shader: name, input, frame } of result.passes) {
        const prefix = cameraCase + '-' + name, program = catalog.program(name);
        programs.push({ name, cameraCase, width: frame.width, height: frame.height, stride: input.stride, attributes: input.attributes,
          uniforms: input.uniforms, colorFormats: input.colorFormats, vertices: save(prefix + '-vertices.bin', input.vertices),
          indices: save(prefix + '-indices.bin', new Uint8Array(input.indices.buffer)),
          textures: Object.fromEntries(Object.entries(input.textures).map(([key, t]) => [key, { ...t, data: save(prefix + '-' + key + '.bin', t.data) }])),
          outputFiles: frame.attachments.map((a, i) => save(prefix + '-native-' + i + '.f32', new Uint8Array(a.buffer))),
          airFiles: { vert: path.resolve('evidence', program.definition.vertex + '.air.ll'), frag: path.resolve('evidence', program.definition.fragment + '.air.ll') },
          vulkanFiles: Object.fromEntries(depthSources.get(name)!.map(s => [s.stage, save(prefix + '-vulkan.' + s.stage, Buffer.from(s.text))])) });
      }
    }
      const prefix = cameraCase + '-' + name;
      const program = catalog.program(name);
      const airFiles = air ? { vert: path.resolve('evidence', program.definition.vertex + '.air.ll'), frag: path.resolve('evidence', program.definition.fragment + '.air.ll') } : undefined;
      const sources = air ? (['vert', 'frag'] as const).map(stage => ({ stage, format: 'vulkan450' as const, text: fs.readFileSync(path.resolve(airDirectory, stage === 'vert' ? program.definition.vertex : program.definition.fragment), 'utf8') })) : [{ stage: 'vert' as const, text: program.vertexSource }, { stage: 'frag' as const, text: program.fragmentSource }];
      const compiled = await compileVulkanShaders(sources, path.resolve(air ? 'dist/native/air-shaders' : 'dist/native/shaders'), !air);
      const core = name === 'CloudCore';
      const pass = graphMode ? graph.passes.find(p => p.shader === name) : undefined;
      const [stageWidth, stageHeight] = pass ? pass.outputs[0].dimensions : [width, height];
      uniforms.u_viewportSize = [stageWidth, stageHeight];
      const vertices = core ? new Uint8Array(new Float32Array([-1,-1,-2,1,-1,-2,1,1,-2,-1,1,-2]).buffer) : new Uint8Array(quad.buffer);
      let packed = vertices;
      if (core) {
        packed = new Uint8Array(4*16); for (let i=0;i<4;i++) { packed.set(vertices.subarray(i*12,i*12+12),i*16); packed[i*16+14]=128; }
      }
      const input: VulkanMaterialInput = { shader: name, stride: 16, vertices: packed, indices: new Uint32Array([0,1,2,0,2,3]), state: 4,
        attributes: core ? { a_position: { format: 'vec3', offset: 0 }, a_normal: { format: 'snorm4', offset: 12 } } : { a_position: { format: 'vec2', offset: 0 }, a_uv: { format: 'vec2', offset: 8 } },
        uniforms: core ? { ...uniforms, u_time: 0, u_cloudUndulationScale: 0 } : uniforms, textures,
        colorFormats: pass ? pass.outputs.map(t => t.format) : graphMode ? ['rgba16f'] : undefined };
      const scene = await bindVulkanMaterial(compiled, input); await host.setMaterialScene(scene);
      const frame = await host.materialFrame(stageWidth,stageHeight);
      const outputFiles = frame.attachments.map((a,i) => save(prefix+'-native-'+i+'.f32',new Uint8Array(a.buffer)));
      const textureFiles = Object.fromEntries(compiled.descriptors.filter(d=>d.kind==='combined-image-sampler').map(d=> {
        const t = textures[d.name]; return [d.name,{...t,data:save(prefix+'-'+d.name+'.bin',t.data)}];
      }));
      const vertexFile = save(prefix+'.vert', Buffer.from(program.vertexSource)), fragmentFile = save(prefix+'.frag',Buffer.from(program.fragmentSource));
      programs.push({ name, cameraCase, vertexFile, fragmentFile, airFiles, stride: input.stride, vertices: save(prefix+'-vertices.bin',packed), indices: save(prefix+'-indices.bin',new Uint8Array(input.indices.buffer)), attributes: input.attributes,
        uniforms: { ...input.uniforms }, textures: textureFiles, outputFiles, outputs: compiled.artifacts.find(a=>a.stage==='frag')!.reflection.outputs, width:stageWidth,height:stageHeight, colorFormats: input.colorFormats,
        vulkanFiles: Object.fromEntries(sources.map(s => [s.stage, save(prefix + '-vulkan.' + s.stage, Buffer.from(s.text))])) });
      if (name === 'CloudFluffySuperCoarse' || name === 'CloudFluffyCoarse') {
        const red = Float32Array.from({length:stageWidth*stageHeight},(_,i)=>frame.attachments[0][i*4]);
        const t: Texture = pass ? sampledVulkanTarget(pass.outputs[0], frame.attachments[0]) : {format:'r32f',dimensions:[stageWidth,stageHeight,1],linear:false,repeat:false,data:new Uint8Array(red.buffer)};
        textures[name === 'CloudFluffySuperCoarse' ? 'u_cloudCoarseTTex' : 'u_cloudTTex'] = t;
      } else if (name === 'CloudFluffy' && !graphMode) textures.u_cloudTex0 = {format:'rgba32f',dimensions:[stageWidth,stageHeight,1],linear:false,repeat:false,data:new Uint8Array(frame.attachments[0].buffer)};
    }
    }
    const spec = {device,level,blocks:volume.coordinates.length/3,translation:air?'metal-air':'glsl-relaxed',graphMode,depthGraph,airManifest,viewport:[width,height],fixture:`Real ${level} sparse/distance/ambience upload fields and original Tex3D/CloudFluffy.vol normalization/transpose. Explicit test camera, lighting, depth/water/blue-noise inputs. `+(depthGraph ? 'Original three depth AIR passes execute through the production native depth entry and feed half/quarter outputs to cloud shaders, from an explicitly constructed signed-alpha full-depth fixture. ' : '')+(graphMode ? 'Original floor-divided 1/8, 1/4 and 1/2 cloud target dimensions and R16F/RGBA16F formats; half storage feeds preceding-target dependencies. CloudCore runs in Opaque before depth and cloud fullscreen passes with explicitly initialized history. Stage viewport uniforms are test inputs. Cloud render list, opaque scene depth generation and game image parity are not executed.' : 'Equal-sized stages isolate shader translation. Fine feeds Core solely as a test fixture; actual Core executes earlier in Opaque and reads existing CloudA contents.'),programs};
    fs.writeFileSync(path.join(out,'spec.json'),JSON.stringify(spec));
  } finally { host.stop(); }
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
