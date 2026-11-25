import type { Field, ObjectNode } from './objects';
import environmentEvidence from '../../docs/environment-evidence.json';

import { readResourceDeclarations } from './resource-manifest';
export { readResourceDeclarations, type ResourceDeclaration } from './resource-manifest';
export interface ShaderDefinition { name: string; vertex: string; fragment: string; defines: string; hash: number; group: string; source: string; line: number; backend?: 'metal'; nativeSource?: string; }
export interface ShaderVariable { name: string; type: string; count: number; stage: 'vertex' | 'fragment'; storage: 'uniform' | 'in'; }
export interface ShaderProgram { definition: ShaderDefinition; vertexSource: string; fragmentSource: string; variables: ShaderVariable[]; }
export interface ShaderParameter { name: string; nativeType: number; vector: number[]; texture: string; fieldId: string; }
export interface MaterialDescriptor { nodeId: number; name: string; materialId: number; custom: boolean; shaderName: string; parameters: ShaderParameter[]; baseColor?: number[]; }
export interface NativeGlobalBinding { name: string; kind: string; components: number; source: { owner: string; nativeOffset: number } | null; registrationCall: string; }
export interface ParameterBinding { variable: ShaderVariable; parameter?: ShaderParameter; source: 'parameter' | 'camera' | 'global' | 'unresolved'; nativeGlobal?: NativeGlobalBinding; problem?: string; }
const nativeGlobals = new Map(environmentEvidence.ambienceUniforms.map(binding => [binding.name, binding]));

// Original x86_64 instructions 0x1007d120b..0x1007d123f:
// signed char addition, h >> 5, multiply by four, truncate to uint16.
// Whitespace and define order are significant. Do not sort or trim the input.
export function shaderVariantHash(defines: string) {
  let hash = 0;
  for (const byte of new TextEncoder().encode(defines)) { if (!byte) break; hash = (((hash + (byte < 128 ? byte : byte - 256)) * 4) + (hash >>> 5)) & 0xffff; }
  return hash;
}
export function shaderFileName(source: string, defines: string) {
  if (!/^[\w.-]+\.(vert|frag)$/.test(source)) throw new Error(`未经支持的 shader 源名称 ${source}`);
  const at = source.indexOf('.'); return source.slice(0, at) + shaderVariantHash(defines) + source.slice(at);
}
export function readShaderDefinitions(source: string, origin: string): ShaderDefinition[] {
  return readResourceDeclarations(source).filter(d => d.type === 'Shader' && typeof d.fields.vs === 'string' && typeof d.fields.fs === 'string').map(d => {
    const defines = typeof d.fields.defines === 'string' ? d.fields.defines : '';
    if (typeof d.fields.source === 'string' && d.fields.source.endsWith('.metal')) return { name: d.name, vertex: String(d.fields.vs), fragment: String(d.fields.fs), defines, hash: shaderVariantHash(defines), group: String(d.fields.group ?? ''), source: origin, line: d.line, backend: 'metal' as const, nativeSource: d.fields.source };
    return { name: d.name, vertex: shaderFileName(String(d.fields.vs), defines), fragment: shaderFileName(String(d.fields.fs), defines), defines, hash: shaderVariantHash(defines), group: String(d.fields.group ?? ''), source: origin, line: d.line };
  });
}
export function shaderVariables(source: string, stage: 'vertex' | 'fragment'): ShaderVariable[] {
  const clean = source.replace(/\/\*[\s\S]*?\*\//g, '').replace(/\/\/[^\n]*/g, '');
  return [...clean.matchAll(/(?:^|\n)\s*(?:layout\([^)]*\)\s*)?(uniform|in)\s+(?:(?:highp|mediump|lowp)\s+)?(\w+)\s+(\w+)(?:\s*\[\s*(\d+)\s*\])?\s*;/g)].map(m => ({ storage: m[1] as 'uniform' | 'in', type: m[2], name: m[3], count: m[4] ? Number(m[4]) : 1, stage }));
}
export function portableShader(source: string) {
  // Derivatives are core in ES 3 / WebGL2. Keep the shader body unchanged.
  return source.replace(/^#extension GL_OES_standard_derivatives[^\n]*\n/gm, '');
}
function scalar(f: Field | undefined): number { return f?.kind === 'bits32' ? (f.value as { uint: number }).uint : Number(f?.value ?? 0); }
export function describeMaterial(node: ObjectNode): MaterialDescriptor {
  const field = (name: string) => node.fields.find(f => f.name === name);
  const mesh = node.className === 'LevelMesh';
  const parameters = (field('shaderParams')?.children ?? []).map(p => {
    const get = (name: string) => p.children?.find(f => f.name === name);
    return { name: String(get(mesh ? 'uniformName' : 'name')?.value ?? ''), nativeType: scalar(get(mesh ? 'valueType' : 'type')), vector: Array.from(get(mesh ? 'vecValue' : 'vec')?.value as number[] ?? []), texture: String(get(mesh ? 'texValue' : 'tex')?.value ?? ''), fieldId: p.id };
  });
  return { nodeId: node.id, name: String(field('name')?.value || field('resourceName')?.value || node.name), materialId: scalar(field('material')), custom: !!scalar(field('useCustomShader')), shaderName: String(field('shaderName')?.value ?? ''), parameters, baseColor: field('baseColor')?.value as number[] | undefined };
}
export function materialBindings(material: MaterialDescriptor, program: ShaderProgram): ParameterBinding[] {
  const seen = new Set<string>();
  return program.variables.filter(v => v.storage === 'uniform' && !seen.has(v.name) && !!seen.add(v.name)).map(variable => {
    const parameters = material.parameters.filter(p => p.name === variable.name), parameter = parameters[0];
    if (parameter) {
      const size = /^vec([234])$/.exec(variable.type)?.[1];
      let problem: string | undefined;
      if (parameters.length > 1) problem = '重复参数；原版覆盖顺序待确认';
      else if (variable.count !== 1) problem = '数组 uniform 尚未绑定';
      else if (variable.type === 'sampler2D') { if (!parameter.texture) problem = '纹理名称为空'; }
      else if (variable.type === 'float' || size) { const n = size ? Number(size) : 1; if (parameter.vector.length < n || !parameter.vector.slice(0, n).every(Number.isFinite)) problem = '数值分量无效'; }
      else problem = `尚未实现 ${variable.type} 参数上传`;
      return { variable, parameter, source: 'parameter', problem };
    }
    if (['u_model', 'u_modelIT', 'u_viewProj', 'u_eyePos', 'u_viewportSize'].includes(variable.name)) return { variable, source: 'camera' };
    const nativeGlobal = nativeGlobals.get(variable.name);
    if (nativeGlobal) return { variable, source: 'global', nativeGlobal, problem: '原版全局来源已确认；运行时数值与 GPU 上传待完成' };
    return { variable, source: 'unresolved', problem: '原版环境、默认参数或渲染管线绑定待逆向' };
  });
}
