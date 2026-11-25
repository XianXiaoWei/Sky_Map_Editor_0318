import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { AssetCatalog } from '../src/main/assets';
import { ObjectsDocument } from '../src/core/objects';
import { describeMaterial, materialBindings, portableShader } from '../src/core/materials';

const args = process.argv.slice(2), data = args.find(a => !a.startsWith('--')) ?? process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
let previous: any;
if (args.includes('--reuse-compiled')) { try { previous = JSON.parse(fs.readFileSync('docs/shader-audit.json', 'utf8')); } catch {} }
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-shaders-'));
function validate(files: string[]) {
  try { const log = execFileSync('glslangValidator', ['-l', ...files], { encoding: 'utf8', timeout: 15000 }); return { success: true, log: log.trim() }; }
  catch (e) { const error = e as { stdout?: string; stderr?: string; message: string }; return { success: false, log: `${error.stdout ?? ''}${error.stderr ?? ''}${error.message}`.trim() }; }
}
try {
  const validator = execFileSync('glslangValidator', ['--version'], { encoding: 'utf8' }).trim(), catalog = new AssetCatalog(data);
  const sources = fs.readdirSync(path.join(data, 'Shaders/Bin')).filter(n => /\.(vert|frag)$/.test(n)).sort();
  const stages = sources.map(name => {
    const file = path.join(data, 'Shaders/Bin', name), original = fs.readFileSync(file, 'utf8'), portable = path.join(temp, name);
    fs.writeFileSync(portable, portableShader(original));
    const sha256 = crypto.createHash('sha256').update(original).digest('hex'), prior = previous?.stages?.find((s: any) => s.name === name && s.sha256 === sha256);
    return { name, sha256, reused: !!prior, original: prior?.original ?? validate([file]), webgl2Compatible: prior?.webgl2Compatible ?? validate([portable]) };
  });
  const programs = [...catalog.shaders.values()].map(definition => {
    if (definition.backend === 'metal') return { ...definition, skipped: 'requires-metal-reconstruction' };
    try {
      const program = catalog.program(definition.name);
      const unchanged = stages.find(s => s.name === definition.vertex)?.reused && stages.find(s => s.name === definition.fragment)?.reused;
      const prior = unchanged ? previous?.programs?.find((p: any) => p.vertex === definition.vertex && p.fragment === definition.fragment && p.original && p.webgl2Compatible) : undefined;
      return { ...definition, reused: !!prior, original: prior?.original ?? validate([path.join(data, 'Shaders/Bin', definition.vertex), path.join(data, 'Shaders/Bin', definition.fragment)]), webgl2Compatible: prior?.webgl2Compatible ?? validate([path.join(temp, definition.vertex), path.join(temp, definition.fragment)]), attributes: program.variables.filter(v => v.storage === 'in' && v.stage === 'vertex') };
    } catch (e) { return { ...definition, error: String(e) }; }
  });
  const maps = fs.readdirSync(path.join(data, 'Levels')).map(level => {
    const doc = new ObjectsDocument(fs.readFileSync(path.join(data, 'Levels', level, 'Objects.level.bin'))), assets = new AssetCatalog(data, level);
    const materials = doc.nodes.filter(n => ['LevelMesh', 'LevelMaterial'].includes(n.className)).map(node => {
      const material = describeMaterial(node);
      if (!material.custom) return { nodeId: node.id, className: node.className, shader: material.shaderName, custom: false };
      try {
        const program = assets.program(material.shaderName), bindings = materialBindings(material, program);
        return { nodeId: node.id, className: node.className, shader: material.shaderName, custom: true, unresolvedUniforms: bindings.filter(b => b.source === 'unresolved' || b.source === 'global').map(b => b.variable.name), nativeGlobalUniforms: bindings.filter(b => b.nativeGlobal).map(b => b.nativeGlobal), invalidParameters: bindings.filter(b => b.parameter && b.problem).map(b => ({ name: b.variable.name, problem: b.problem })), missingImages: material.parameters.filter(p => p.texture && !assets.image(p.texture).exists).map(p => p.texture) };
      } catch (e) { return { nodeId: node.id, className: node.className, shader: material.shaderName, custom: true, error: String(e) }; }
    });
    return { level, materials };
  });
  const entries = maps.flatMap(m => m.materials), custom = entries.filter(e => e.custom);
  const summary = { sourceFiles: stages.length, originalStagesPassed: stages.filter(s => s.original.success).length, portableStagesPassed: stages.filter(s => s.webgl2Compatible.success).length, shaderDeclarations: programs.length, originalPairsPassed: programs.filter(p => 'original' in p && p.original.success).length, portablePairsPassed: programs.filter(p => 'webgl2Compatible' in p && p.webgl2Compatible.success).length, levels: maps.length, modelAndMaterialNodes: entries.length, customNodes: custom.length, resolvedCustomNodes: custom.filter(e => !('error' in e)).length, invalidParameterNodes: custom.filter(e => 'invalidParameters' in e && e.invalidParameters?.length).length, missingImageNodes: custom.filter(e => 'missingImages' in e && e.missingImages?.length).length };
  fs.writeFileSync('docs/shader-audit.json', JSON.stringify({ validator, summary, limitation: 'Offline compile/link and declaration checks only. No GPU draw, original rendering state, shader uniform upload, baking, or Windows execution is verified by this report.', stages, programs, maps }, null, 2));
  console.log(JSON.stringify(summary, null, 2));
  const failures = stages.filter(s => !s.webgl2Compatible.success).map(s => ({ name: s.name, log: s.webgl2Compatible.log })); if (failures.length) console.log(JSON.stringify(failures, null, 2));
  if (summary.portablePairsPassed !== programs.filter(p => p.backend !== 'metal').length || failures.length) process.exitCode = 1;
} finally { fs.rmSync(temp, { recursive: true, force: true }); }
