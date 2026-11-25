import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { execFile } from 'node:child_process';
import { promisify } from 'node:util';
import { createHash } from 'node:crypto';
import { portableShader, shaderVariables } from '../core/materials';
import { reflectSpirv, mergeSpirvDescriptors, type SpirvReflection, type SpirvDescriptor, type SpirvStage } from '../core/spirv';

let bundledShaderCache:string|undefined;
let shaderTools:Record<string,string>={};
export function configureShaderTools(tools:Record<string,string>){shaderTools=tools;}
const tool=(name:string)=>shaderTools[name]??name;
export function configureBundledShaderCache(directory?:string){bundledShaderCache=directory;}
const execute = promisify(execFile);
const options = ['-V', '--target-env', 'vulkan1.1', '-R', '--auto-map-bindings', '--auto-map-locations', '--set-default-uniform-block', 'SkyGlobals', '0', '0', '-l'];
const hash = (bytes: string | Uint8Array) => createHash('sha256').update(bytes).digest('hex');
export interface VulkanShaderArtifact { stage: SpirvStage; path: string; sha256: string; reflection: SpirvReflection; }
export interface VulkanShaderCompilation { success: boolean; log: string; key: string; cached: boolean; artifacts: VulkanShaderArtifact[]; descriptors: SpirvDescriptor[]; requiresFloat16: boolean; }
export interface VulkanShaderSource { stage: SpirvStage; text: string; format?: 'gles300' | 'vulkan450'; coordinates?: 'opengl'; }
// --auto-map-locations is explicitly not cross-stage in glslang. Original
// GLES programs often declare their varyings in different orders, and may
// leave vertex outputs unused by the fragment stage. Bind these by name.
function locateGlesVaryings(sources: VulkanShaderSource[]): VulkanShaderSource[] {
  const vertex=sources.find(s=>s.stage==='vert'),fragment=sources.find(s=>s.stage==='frag');
  if(!vertex||!fragment||vertex.format==='vulkan450'||fragment.format==='vulkan450')return sources;
  const declaration=/(^|\n)(\s*)((?:layout\([^)]*\)\s*)?)(?:(flat|smooth|noperspective)\s+)?(in|out)\s+((?:(?:highp|mediump|lowp)\s+)?(\w+)\s+(\w+)(?:\s*\[\s*(\d+)\s*\])?\s*;)/g;
  const fields=new Map<string,{type:string;count:number;location:number}>();
  for(const s of [vertex,fragment]) {
    const clean=s.text.replace(/\/\*[\s\S]*?\*\//g,'').replace(/\/\/[^\n]*/g,'');
    for(const m of clean.matchAll(declaration))if(m[5]===(s.stage==='vert'?'out':'in')) {
      if(m[3].includes('location'))throw new Error('GLES 阶段接口已有显式位置');
      const value={type:m[7],count:Number(m[9]??1),location:0},previous=fields.get(m[8]);
      if(previous&&(previous.type!==value.type||previous.count!==value.count))throw new Error(`GLES 阶段接口类型不匹配 ${m[8]}`);
      fields.set(m[8],value);
    }
  }
  let next=0;for(const name of [...fields.keys()].sort()) {const field=fields.get(name)!;field.location=next;next+=field.count*Number(/^mat(\d)/.exec(field.type)?.[1]??1);}
  return sources.map(s=>({...s,text:s.text.replace(declaration,(all,line,space,layout,qualifier,storage,body,type,name)=>{
    if(storage!==(s.stage==='vert'?'out':'in'))return all;
    const field=fields.get(name);if(!field)throw new Error(`无法定位 GLES 阶段接口 ${name}`);
    return `${line}${space}layout(location=${field.location}) ${layout}${qualifier?qualifier+' ':''}${storage} ${body}`;
  })}));
}

function validateStageInterfaces(artifacts: VulkanShaderArtifact[]) {
  const vertex=artifacts.find(a=>a.stage==='vert'),fragment=artifacts.find(a=>a.stage==='frag');
  if(!vertex||!fragment)return;
  for(const input of fragment.reflection.inputs) {
    const output=vertex.reflection.outputs.find(value=>value.location===input.location);
    if(!output||JSON.stringify(output.type)!==JSON.stringify(input.type))throw new Error(`Vulkan 阶段接口不匹配 ${input.name}@${input.location}`);
  }
}
export function vulkanShaderSource(source: string, bindings = new Map<string, number>(), stage?: SpirvStage, coordinates?: 'opengl') {
  const body = portableShader(source);
  if (!/^#version 300 es[^\n]*\n/.test(body)) throw new Error('需要原 GLSL ES 300 着色器');
  let result = body.replace(/^#version 300 es[^\n]*\n/, '#version 450\n').replace(/(^|\n)(\s*)uniform\s+((?:(?:highp|mediump|lowp)\s+)?(?:[iu]?sampler\w+)\s+(\w+))/g, (all, line, space, declaration, name) => {
    const binding = bindings.get(name);
    return binding === undefined ? all : `${line}${space}layout(set=0, binding=${binding}) uniform ${declaration}`;
  });
  if (coordinates === 'opengl') {
    if (!stage) throw new Error('OpenGL 坐标转换需要明确 shader 阶段');
    if (/\bskyVulkanOriginalMain\b|\bskyVulkanFragCoord\b|\bu_skyVulkanViewportHeight\b/.test(result)) throw new Error('shader 使用了保留的 Vulkan 坐标名称');
    if (stage === 'vert') {
      if (!/\bvoid\s+main\s*\(\s*(?:void\s*)?\)\s*\{/.test(result)) throw new Error('无法定位原顶点 shader main');
      result = result.replace(/\bvoid\s+main\s*\(\s*(?:void\s*)?\)\s*\{/, 'void skyVulkanOriginalMain() {');
      // Positive-height Vulkan viewport, OpenGL projection. A wrapper also
      // handles early returns from the original main and preserves clip W.
      result += '\nvoid main() { skyVulkanOriginalMain(); gl_Position.y = -gl_Position.y; gl_Position.z = (gl_Position.z + gl_Position.w) * 0.5; }\n';
    } else {
      const clean = result.replace(/\/\*[\s\S]*?\*\//g, '').replace(/\/\/[^\n]*/g, '');
      const screenXY = [...clean.matchAll(/\bgl_FragCoord\b(?:\.(\w+))?/g)].some(match => !match[1] || /[xy]/.test(match[1]));
      if (screenXY) {
        const hasViewport = /\buniform\s+(?:(?:highp|mediump|lowp)\s+)?vec2\s+u_viewportSize\s*;/.test(clean);
        result = result.replace(/\bgl_FragCoord\b/g, 'skyVulkanFragCoord()');
        // Original light-grid row indexing and screen effects expect lower-left
        // coordinates. Most original shaders already bind u_viewportSize.
        // Window-space Z is already [0,1] in both APIs after vertex conversion.
        const helper = `${hasViewport ? '' : 'uniform float u_skyVulkanViewportHeight;\n'}vec4 skyVulkanFragCoord() { return vec4(gl_FragCoord.x, ${hasViewport ? 'u_viewportSize.y' : 'u_skyVulkanViewportHeight'} - gl_FragCoord.y, gl_FragCoord.z, gl_FragCoord.w); }\n`;
        // The helper must follow the existing viewport declaration in GLSL.
        result = hasViewport ? result.replace(/(\buniform\s+(?:(?:highp|mediump|lowp)\s+)?vec2\s+u_viewportSize\s*;)/, '$1\n' + helper)
          : result.replace(/^#version 450[^\n]*\n/, '$&' + helper);
      }
    }
  }
  return result;
}

// Preserve original shader arithmetic. Coordinate wrappers are explicit for
// GLES game programs; recovered Vulkan/AIR sources already own their mapping.
// Compilation alone does not provide the original runtime uniform resources.
export async function compileVulkanShaders(sources: VulkanShaderSource[], output = path.join(os.tmpdir(), 'sky-vulkan-shader-cache'), useFloat16 = false): Promise<VulkanShaderCompilation> {
  if (!sources.length || sources.length > 2 || new Set(sources.map(s => s.stage)).size !== sources.length || sources.some(s => !['vert', 'frag'].includes(s.stage))) throw new Error('Vulkan shader 阶段列表无效');
  if (sources.some(s => s.format && !['gles300', 'vulkan450'].includes(s.format))) throw new Error('Vulkan shader 源格式无效');
  if (sources.some(s => s.coordinates && (s.coordinates !== 'opengl' || s.format === 'vulkan450'))) throw new Error('Vulkan shader 坐标约定无效');
  const requiresFloat16 = useFloat16 || sources.some(s => s.format === 'vulkan450' && /\bGL_EXT_shader_explicit_arithmetic_types_float16\b/.test(s.text));
  sources = [...sources].sort((a, b) => a.stage === b.stage ? 0 : a.stage === 'vert' ? -1 : 1);
  // glslang's automatic map can assign a fragment sampler to binding 0 when
  // only the vertex stage uses the default block. Reserve 0 for that block and
  // assign each named sampler once across both stages before linking.
  const samplerNames = [...new Set(sources.flatMap(s => shaderVariables(s.text, s.stage === 'vert' ? 'vertex' : 'fragment').filter(v => v.storage === 'uniform' && /sampler/.test(v.type)).map(v => v.name)))].sort();
  const bindings = new Map(samplerNames.map((name, i) => [name, i + 1]));
  sources=locateGlesVaryings(sources);
  const key = hash(JSON.stringify({ schema: 6, options, sources, useFloat16 }));
  const directory = path.join(output, key), manifest = path.join(directory, 'manifest.json');
  const artifact = async (stage: SpirvStage, file: string, sha?: string) => {
    const bytes = await fs.readFile(file);
    if (sha && sha !== hash(bytes)) throw new Error('Vulkan shader 缓存校验失败');
    return { stage, path: path.join(directory, stage + '.spv'), sha256: hash(bytes), reflection: reflectSpirv(bytes, stage) };
  };
  for(const candidate of [directory,...(bundledShaderCache?[path.join(bundledShaderCache,key)]:[])]) {
    try {
      const cached=JSON.parse(await fs.readFile(path.join(candidate,'manifest.json'),'utf8'));
      if(cached.key!==key||cached.artifacts.length!==sources.length)throw new Error('Vulkan shader 缓存布局不符');
      const artifacts=await Promise.all(sources.map(async source=>{
        const entry=cached.artifacts.find((a:VulkanShaderArtifact)=>a.stage===source.stage);
        if(!entry?.sha256)throw new Error('Vulkan shader 缓存缺少校验');
        const file=path.join(candidate,source.stage+'.spv'),result=await artifact(source.stage,file,entry.sha256);
        return {...result,path:file};
      }));
      validateStageInterfaces(artifacts);
      return {success:true,log:cached.log,key,cached:true,artifacts,descriptors:mergeSpirvDescriptors(artifacts.map(a=>a.reflection)),requiresFloat16};
    }catch(error){
      // User caches can be rebuilt. A shipped cache that exists but fails
      // integrity checks must fail explicitly instead of requiring an SDK.
      if(candidate!==directory&&(error as NodeJS.ErrnoException).code!=='ENOENT')throw error;
    }
  }
  const temp = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-vulkan-shaders-'));
  let log = '';
  try {
    const files = await Promise.all(sources.map(async s => {
      const file = path.join(temp, 'shader.' + s.stage);
      if (s.format === 'vulkan450' && !/^#version 450[^\n]*\n/.test(s.text)) throw new Error('显式 Vulkan 源需要 GLSL 450');
      await fs.writeFile(file, s.format === 'vulkan450' ? s.text : vulkanShaderSource(s.text, bindings, s.stage, s.coordinates)); return file;
    }));
    const compiled = await execute(tool('glslangValidator'), [...options, ...files], { cwd: temp, timeout: 30000, maxBuffer: 1024 * 1024 });
    log += compiled.stdout + compiled.stderr;
    const artifacts: VulkanShaderArtifact[] = [];
    for (const s of sources) {
      const file = path.join(temp, s.stage + '.spv');
      // AIR reconstruction already specifies every internal width and cast;
      // relaxed-precision conversion would alter that explicit arithmetic.
      if (useFloat16 && s.format !== 'vulkan450') {
        const half = path.join(temp, s.stage + '.half.spv');
        const converted = await execute(tool('spirv-opt'), ['--eliminate-local-single-block', '--eliminate-local-single-store', '--convert-relaxed-to-half', '--simplify-instructions', '--eliminate-dead-code-aggressive', file, '-o', half], { timeout: 30000, maxBuffer: 1024 * 1024 });
        log += converted.stdout + converted.stderr; await fs.rename(half, file);
      }
      const validated = await execute(tool('spirv-val'), ['--target-env', 'vulkan1.1', file], { timeout: 30000, maxBuffer: 1024 * 1024 });
      log += validated.stdout + validated.stderr; artifacts.push(await artifact(s.stage, file));
    }
    validateStageInterfaces(artifacts);
    const descriptors = mergeSpirvDescriptors(artifacts.map(a => a.reflection));
    const compiler = (await execute(tool('glslangValidator'), ['--version'])).stdout.trim();
    const validator = (await execute(tool('spirv-val'), ['--version'])).stdout.trim();
    log = log.replaceAll(temp + path.sep, '');
    const result = { success: true, log, key, cached: false, artifacts, descriptors, requiresFloat16 };
    // A manifest is published last; interrupted writes are never cache hits.
    await fs.mkdir(directory, { recursive: true });
    for (const a of artifacts) await fs.copyFile(path.join(temp, a.stage + '.spv'), a.path);
    await fs.writeFile(path.join(temp, 'manifest.json'), JSON.stringify({ ...result, compiler, validator, sourceSha256: sources.map(s => ({ stage: s.stage, sha256: hash(s.text) })), options }, null, 2) + '\n');
    await fs.copyFile(path.join(temp, 'manifest.json'), manifest);
    return result;
  } catch (error) {
    const e = error as Error & { stdout?: string; stderr?: string };
    log += String(e.stdout ?? '') + String(e.stderr ?? '');
    if (!e.stdout && !e.stderr) log += e.message;
    return { success: false, log: log.replaceAll(temp + path.sep, ''), key, cached: false, artifacts: [], descriptors: [], requiresFloat16 };
  } finally { await fs.rm(temp, { recursive: true, force: true }); }
}
