import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { MeshesDocument } from '../src/core/meshes';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { vulkanProgramSources } from '../src/main/vulkan-program';
import { bindVulkanMaterial, type VulkanMaterialInput } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';

async function main() {
  const out = path.resolve(process.argv[2]); fs.mkdirSync(out, { recursive: true });
  const data = '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
  const level = process.argv.find(a => a.startsWith('--level='))?.slice(8) ?? 'Dawn';
  const doc = new MeshesDocument(fs.readFileSync(path.join(data, 'Levels', level, 'BstBaked.meshes'))), volume = doc.cloudVolume()!;
  const catalog = new AssetCatalog(data), host = new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const point = volume.origin.map((v, i) => (v + volume.coordinates[i]) * 16 + 8);
  const matrix = [1,0,0,0,0,1,0,0,0,0,1,0,-point[0],-point[1],1-point[2],10];
  const inverse = [1,0,0,0,0,1,0,0,0,0,1,0,point[0]/10,point[1]/10,(point[2]-1)/10,.1];
  const identity = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  const uniforms = { ...volume.bindings, u_sunDir: [0,-1,0], u_sunColor: [1,.9,.8], u_averageSkyColor: [.2,.3,.4], u_pointLight: [0,0,0],
    u_time: 0, u_waterSimTerms: [0,0,0,0], u_cloudWindScroll: [0,0,0], u_cloudWindMove: [0,0,0],
    u_cloudMat: [.6,.7,.8,doc.cloud!.sunOcclusionScale], u_cloudNoiseTweaks: [.75,-10,4,0], u_cloudUndulationScale: 0,
    u_viewProj: matrix, u_viewProjOld: matrix, u_viewProjInv: inverse, u_proj: identity, u_eyePos: [point[0],point[1],point[2]-40],
    u_jitter: [0,0], u_jitterHalf: [0,0], u_projPlaneU: [.125,0,0], u_projPlaneV: [0,.125,0], u_projPlaneOrigin: [-.0625,-.0625,1], u_animCellsX: 2, u_animCellsY: 2 };
  type Texture = VulkanMaterialInput['textures'][string];
  const textures: Record<string, Texture> = {}, names: Record<string, string> = { CloudSparseGrid: 'u_cloudSparse', CloudPackedDistGrid: 'u_cloudDist', CloudPackedAmb0Grid: 'u_cloudAmb0', CloudPackedAmb1Grid: 'u_cloudAmb1', CloudPackedAmb2Grid: 'u_cloudAmb2' };
  for (const t of volume.textures) textures[names[t.name]] = { format: t.channels === 1 ? 'r8' : 'rgba8', dimensions: t.dimensions, linear: t.name !== 'CloudSparseGrid', repeat: false, data: t.data };
  const constant = (rgba: number[]): Texture => ({ format: 'rgba32f', dimensions: [1,1,1], linear: false, repeat: false, data: new Uint8Array(new Float32Array(rgba).buffer) });
  textures.u_cloudNoise3D = catalog.cloudNoise(); textures.u_waterSim = constant([0,0,0,0]); textures.u_texPerturb = constant([.5,.5,0,1]);
  textures.u_alphaTex = constant([1,1,1,1]); textures.u_texture = constant([1,1,1,1]);
  const save = (name: string, data: Uint8Array) => { const file = path.join(out, name); fs.writeFileSync(file, data); return file; };
  const programs = [], device = await host.start();
  try {
    for (const name of ['CloudCard', 'CloudQuadParticleFluffy']) {
      const program = catalog.program(name), sources = vulkanProgramSources(program), compiled = await compileVulkanShaders(sources);
      if (!compiled.success) throw new Error(compiled.log);
      for (const depth of [10000, -10000, 0]) for (const [width, height] of [[16,16], [63,37]]) {
        textures.u_depthHalfTex = constant([depth, depth, depth, depth]);
        const attributes: VulkanMaterialInput['attributes'] = {}, vertices: number[] = [];
        const fields: [string, number, string][] = name === 'CloudCard' ? [['a_position',3,'vec3'],['a_normal',4,'vec4'],['a_uv',4,'vec4'],['a_light0',4,'vec4'],['a_light1',4,'vec4']] :
          [['a_position',3,'vec3'],['a_userdata0',3,'vec3'],['a_color',4,'vec4'],['a_uv0',4,'vec4'],['a_uv1',4,'vec4'],['a_uv2',4,'vec4'],['a_userdata3',1,'float']];
        let stride = 0; for (const [field, count, format] of fields) { attributes[field] = { format: format as keyof typeof import('../src/core/vulkan-protocol').VULKAN_ATTRIBUTE_FORMATS, offset: stride }; stride += count * 4; }
        for (const [i, [x,y]] of [[-1,-1],[1,-1],[1,1],[-1,1]].entries()) {
          const values: Record<string, number[]> = name === 'CloudCard' ? {
            a_position: [point[0]+x*10,point[1]+y*10,point[2]], a_normal: [0,0,1,1], a_uv: [(x+1)/2,(y+1)/2,0,0], a_light0: [.5,.5,.5,1], a_light1: [.2,.3,.5,.1] } :
            { a_position: point, a_userdata0: [0,0,0], a_color: [.6,.7,.8,.75], a_uv0: [0,0,1,1], a_uv1: [20,.25,0,0], a_uv2: [.5,.2,.3,1], a_userdata3: [[-1,1,.25,-.25][i]] };
          for (const [field] of fields) vertices.push(...values[field]);
        }
        const input: VulkanMaterialInput = { shader: name, stride, attributes, state: 4, colorFormats: ['rgba16f','rgba16f'],
          vertices: new Uint8Array(new Float32Array(vertices).buffer), indices: new Uint32Array([0,1,2,0,2,3]), uniforms: { ...uniforms, u_viewportSize: [width,height] }, textures };
        await host.setMaterialScene(await bindVulkanMaterial(compiled, input));
        const frame = await host.materialFrame(width,height), cameraCase = `${width}x${height}-depth${depth}`, prefix = name + '-' + cameraCase;
        programs.push({ name, cameraCase, width, height, allowPartialCoverage: true, stride, attributes, colorFormats: input.colorFormats, uniforms: input.uniforms,
          vertices: save(prefix + '-vertices.bin', input.vertices), indices: save(prefix + '-indices.bin', new Uint8Array(input.indices.buffer)),
          textures: Object.fromEntries(compiled.descriptors.filter(d => d.kind === 'combined-image-sampler').map(d => [d.name, { ...textures[d.name], data: save(prefix + '-' + d.name + '.bin', textures[d.name].data) }])),
          outputFiles: frame.attachments.map((a,i) => save(prefix + '-native-' + i + '.f32',new Uint8Array(a.buffer))),
          airFiles: { vert: path.resolve('evidence', program.definition.vertex+'.air.ll'), frag: path.resolve('evidence', program.definition.fragment+'.air.ll') },
          vulkanFiles: Object.fromEntries(sources.map(s => [s.stage,save(prefix+'-vulkan.'+s.stage,Buffer.from(s.text))])) });
      }
    }
    fs.writeFileSync(path.join(out,'spec.json'),JSON.stringify({ device, translation:'metal-air', level,
      airManifest: JSON.parse(fs.readFileSync('evidence/cloud-air-vulkan/manifest.json','utf8')),
      fixture: 'Original CloudCard and CloudQuadParticleFluffy AIR on real level cloud atlas/noise inputs. Explicit test quad/particle vertex attributes, lighting, matrix, perturb/alpha/water textures and positive/negative/zero depth. Shader standalone output before Cloud blending; arbitrary level object generation and original game/Metal behavior are not covered.', programs }));
  } finally { host.stop(); }
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
