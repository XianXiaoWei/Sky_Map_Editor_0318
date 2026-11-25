import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';

const data = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
async function main() {
const catalog = new AssetCatalog(data), programs = [];
// Persist validated SPIR-V with reflection next to the native host. The files
// can be used without installing a compiler on the eventual target machine.
for (const definition of catalog.shaders.values()) {
  if (definition.backend === 'metal') {
    programs.push({ ...definition, status: 'requires-metal-reconstruction' }); continue;
  }
  const p = catalog.program(definition.name);
  const compiled = await compileVulkanShaders([{ stage: 'vert', text: p.vertexSource }, { stage: 'frag', text: p.fragmentSource }], path.resolve('dist/native/shaders'));
  const { artifacts, ...result } = compiled;
  programs.push({ ...definition, ...result, artifacts: artifacts.map(a => ({ ...a, path: path.relative(process.cwd(), a.path) })) });
  console.log(`${definition.name}: ${compiled.success ? compiled.cached ? 'validated cache' : 'SPIR-V validated' : 'FAILED: ' + compiled.log}`);
}
const summary = { declarations: programs.length, glslPairs: programs.filter(p => p.backend !== 'metal').length, validatedPairs: programs.filter(p => 'success' in p && p.success).length, metalPrograms: programs.filter(p => p.backend === 'metal').length };
fs.writeFileSync('docs/vulkan-shader-audit.json', JSON.stringify({ summary, scope: 'Original shader bodies, ES-to-Vulkan version adaptation, paired compilation/linking, spirv-val, persisted binary hashes, input/output and descriptor/UBO reflection. Does not verify original resource values, draw scheduling, Metal-only reconstruction, GPU image parity or Windows execution.', programs }, null, 2) + '\n');
console.log(JSON.stringify(summary));
if (summary.validatedPairs !== summary.glslPairs) process.exitCode = 1;
}
void main().catch(error => { console.error(error); process.exitCode = 1; });
