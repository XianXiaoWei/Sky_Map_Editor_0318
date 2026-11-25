import * as THREE from 'three';
import type { GeometryRecord } from '../core/meshes';
import { terrainSurfaces, skirtSurfaces, type MaterialDef, type SurfacePlan } from '../core/mesh-surfaces';
import { portableShader, type ShaderProgram } from '../core/materials';
import { bakedRenderState, bakedRenderGroups, bakedPassOrder, type BakedRenderGroup } from '../core/mesh-render-state';

export type BakedView = GeometryRecord & { positions: Float32Array; normals: Float32Array; packedNormals: Int8Array; materialIds: Uint8Array; weights: Uint8Array; light: Uint8Array; userData1: Uint8Array };
export type BakedDisplay = 'material' | 'light0' | 'light1' | 'light2' | 'ambient' | 'skirt';

// Diagnostic fragment outputs are deliberately separate from original shaders.
// They show original attributes and native material colors, without invented
// lights, texture averages or normalization of material weights.
export const bakedDiagnosticVertex = `
precision highp float;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 u_matColor;
uniform float u_materialId;
in vec3 position;
in vec4 a_material0;
in vec4 a_material1;
in vec4 a_light0;
in vec4 a_light1;
in vec4 a_light2;
in vec4 a_userData1;
out vec4 v_color;
out vec4 v_light0;
out vec4 v_light1;
out vec4 v_light2;
out vec4 v_skirt;
void main() {
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  v_light0=a_light0; v_light1=a_light1; v_light2=a_light2; v_skirt=a_userData1;
  // Terrain.vert: UNORM8 IDs multiplied by 256, original unscaled weights.
  ivec4 ids=ivec4(a_material0*256.0);
  v_color=vec4(u_matColor, dot(vec4(equal(ids,ivec4(int(u_materialId)))),a_material1));
}`;
export const bakedDiagnosticFragment = `
precision highp float;
uniform int u_mode;
uniform bool u_opaque;
in vec4 v_color;
in vec4 v_light0;
in vec4 v_light1;
in vec4 v_light2;
in vec4 v_skirt;
out vec4 fragColor;
void main() {
  vec3 color; float alpha=1.0;
  if (u_mode==0) { color=v_color.rgb; alpha=u_opaque?1.0:v_color.a; if(alpha<=0.0) discard; }
  else if (u_mode==1) color=v_light0.rgb;
  else if (u_mode==2) color=v_light1.rgb;
  else if (u_mode==3) color=v_light2.rgb;
  // Exact ambient decoder from original fragment shaders; zero divisor is
  // undefined source lighting, displayed in magenta rather than synthesized.
  else if (u_mode==4) color=v_light0.a>0.0?v_light0.rgb*v_light0.rgb/v_light0.a:vec3(1.0,0.0,1.0);
  else color=v_skirt.rgb;
  fragColor=vec4(color,alpha);
}`;
const displayModes: Record<BakedDisplay, number> = { material:0, light0:1, light1:2, light2:3, ambient:4, skirt:5 };

export function bakedGeometry(g: BakedView) {
  if (g.stride < 36 || g.packedNormals.length !== g.vertexCount*4 || g.light.length !== g.vertexCount*12) throw new Error('缺少原版地形/裙边顶点流');
  const geometry = new THREE.BufferGeometry();
  geometry.setAttribute('position',new THREE.BufferAttribute(g.positions,3));
  geometry.setAttribute('normal',new THREE.BufferAttribute(g.normals,3));
  geometry.setAttribute('a_position',geometry.attributes.position);
  geometry.setAttribute('a_normal',new THREE.BufferAttribute(g.packedNormals,4,true));
  geometry.setAttribute('a_material0',new THREE.BufferAttribute(g.materialIds,4,true));
  geometry.setAttribute('a_material1',new THREE.BufferAttribute(g.weights,4,true));
  for (let c=0;c<3;c++) {
    const stream=new Uint8Array(g.vertexCount*4);
    for(let v=0;v<g.vertexCount;v++)stream.set(g.light.subarray(v*12+c*4,v*12+c*4+4),v*4);
    geometry.setAttribute('a_light'+c,new THREE.BufferAttribute(stream,4,true));
  }
  // SkirtBarn slot 3 / semantic 25 uses native format 24, the same SNORM4
  // format as packed normals. Reinterpret bytes; do not change saved data.
  const skirtData=g.kind==='skirt'?new Int8Array(g.userData1.buffer,g.userData1.byteOffset,g.userData1.byteLength):new Int8Array(g.vertexCount*4);
  geometry.setAttribute('a_userData1',new THREE.BufferAttribute(skirtData,4,true));
  geometry.setIndex(new THREE.BufferAttribute(g.indices,1));
  return geometry;
}
function diagnosticMaterial(def: MaterialDef | undefined, opaque: boolean, mode: BakedDisplay, wire: boolean, group?: BakedRenderGroup) {
  const mat = new THREE.RawShaderMaterial({ glslVersion:THREE.GLSL3, vertexShader:bakedDiagnosticVertex, fragmentShader:bakedDiagnosticFragment,
    uniforms:{u_matColor:{value:new THREE.Vector3().fromArray(def?.color??[.4,.4,.4])},u_materialId:{value:def?.materialId??0},u_mode:{value:displayModes[mode]},u_opaque:{value:opaque}},
    ...(group?nativeBakedState(group):{side:THREE.DoubleSide,transparent:!opaque,depthWrite:opaque,depthFunc:THREE.LessEqualDepth}), wireframe:wire, toneMapped:false });
  mat.userData.scope='编辑器材质/属性检查；非完整游戏光照';
  if(group)mat.userData.nativeRenderState=bakedRenderState(group);
  return mat;
}
export function createBakedObject(g: BakedView, defs: MaterialDef[], display: BakedDisplay, wire: boolean) {
  const object=new THREE.Mesh(bakedGeometry(g),diagnosticMaterial(undefined,true,display,wire));
  object.userData.geometryId=g.id; object.userData.bakedView=g; object.userData.bakedDefs=defs;
  rebuildBakedSurfaces(object, display, wire); return object;
}
export function rebuildBakedSurfaces(object: THREE.Mesh, display: BakedDisplay, wire: boolean) {
  const g=object.userData.bakedView as BakedView, defs=object.userData.bakedDefs as MaterialDef[];
  const plan=g.kind==='terrain'?terrainSurfaces(g,defs):skirtSurfaces(g,defs);
  for(const child of [...object.children]) if(child instanceof THREE.Mesh) { child.geometry.dispose(); for(const mat of Array.isArray(child.material)?child.material:[child.material]) mat.dispose();object.remove(child); }
  object.userData.surfacePlan=plan;
  // Original index stream stays on the parent, so triangles omitted by the
  // native material scanner remain selectable and can be painted.
  for(const pass of ['opaque','decal','skirt'] as const) {
    const batches=plan.batches.filter(b=>b.pass===pass); if(!batches.length)continue;
    const geometry=new THREE.BufferGeometry();
    for(const [name,attribute] of Object.entries(object.geometry.attributes))geometry.setAttribute(name,attribute);
    geometry.setIndex(new THREE.BufferAttribute(plan.indices,1));
    const materials=batches.map((b,i)=>{geometry.addGroup(b.start,b.count,i);const material=diagnosticMaterial(defs[b.materialIndex],pass==='opaque','material',wire,bakedRenderGroups[pass]);
      material.userData.nativeBaked={shader:b.shaderName,materialIndex:b.materialIndex};return material;});
    const child=new THREE.Mesh(geometry,materials);child.userData.geometryId=g.id;
    child.renderOrder=bakedPassOrder(pass)*100;object.add(child);
  }
  setBakedDisplay(object,display);
}
export function setBakedDisplay(object: THREE.Mesh, mode: BakedDisplay) {
  if(!object.userData.bakedView)return;
  const mat=object.material as THREE.RawShaderMaterial;mat.uniforms.u_mode.value=displayModes[mode];mat.visible=mode!=='material';
  object.children.forEach(child=>child.visible=mode==='material');
}
export function updateBakedAttributes(object: THREE.Mesh, display: BakedDisplay, wire: boolean) {
  object.geometry.attributes.a_normal.needsUpdate=true;
  object.geometry.attributes.a_material0.needsUpdate=true;object.geometry.attributes.a_material1.needsUpdate=true;
  rebuildBakedSurfaces(object,display,wire);
}
export function syncBakedNormals(g: BakedView) {
  for(let v=0;v<g.vertexCount;v++)for(let c=0;c<3;c++)g.packedNormals[v*4+c]=Math.round(Math.max(-1,Math.min(1,g.normals[v*3+c]))*127);
}
export function surfacePlan(object: THREE.Mesh): SurfacePlan | undefined { return object.userData.surfacePlan; }

// Original GLSL can use these exact vertex streams once its complete uniform
// resources and render state are provided. No substitute cubemap, fabricated
// light-grid texture or guessed environment value is injected by this API.
export type NativeBakedState = Required<Pick<THREE.ShaderMaterialParameters, 'side' | 'transparent' | 'depthTest' | 'depthWrite' | 'depthFunc' | 'blending'>> & Pick<THREE.ShaderMaterialParameters,
  'colorWrite' | 'blendSrc' | 'blendDst' | 'blendSrcAlpha' | 'blendDstAlpha' | 'blendEquation' | 'blendEquationAlpha' | 'polygonOffset' | 'polygonOffsetFactor' | 'polygonOffsetUnits'>;

// OpenGL projection/front-face convention belongs to the editor camera. Metal
// flips winding between offscreen and backbuffer passes. This adapter restores
// the captured back-face policy, without importing Metal's screen convention.
export function nativeBakedState(group: string): NativeBakedState {
  const s=bakedRenderState(group), color=s.colors[0];
  if(s.depth.compare!=='lessEqual'||s.depth.stencil||s.cull!=='back'||!color.rgbWrite||s.depthBias[2]!==0)throw new Error(`尚未支持原版 ${group} 状态组合`);
  if(color.blend && (color.sourceRGB!=='sourceAlpha'||color.destinationRGB!=='oneMinusSourceAlpha'||color.alphaWrite||color.operationRGB!=='add'))throw new Error(`尚未支持原版 ${group} 混合状态`);
  return {side:THREE.FrontSide,transparent:color.blend,depthTest:s.depth.test,depthWrite:s.depth.write,depthFunc:THREE.LessEqualDepth,
    colorWrite:color.rgbWrite,blending:color.blend?THREE.CustomBlending:THREE.NoBlending,
    blendSrc:THREE.SrcAlphaFactor,blendDst:THREE.OneMinusSrcAlphaFactor,blendEquation:THREE.AddEquation,
    // Three has one colorWrite switch. ZERO/ONE alpha blending preserves the
    // framebuffer alpha, matching the native RGB-only target write mask.
    blendSrcAlpha:THREE.ZeroFactor,blendDstAlpha:THREE.OneFactor,blendEquationAlpha:THREE.AddEquation,
    polygonOffset:s.depthBias.some(v=>v!==0),polygonOffsetUnits:s.depthBias[0],polygonOffsetFactor:s.depthBias[1]};
}
export function nativeBakedGroupMaterial(program: ShaderProgram, bindings: Record<string, unknown>) {
  const material=nativeBakedMaterial(program,bindings,nativeBakedState(program.definition.group));
  material.userData.nativeRenderState=bakedRenderState(program.definition.group);return material;
}
export function nativeBakedMaterial(program: ShaderProgram, bindings: Record<string, unknown>, state: NativeBakedState) {
  const required=[...new Map(program.variables.filter(v=>v.storage==='uniform').map(v=>[v.name,v])).values()];
  const missing=required.filter(v=>bindings[v.name]===undefined || bindings[v.name]===null).map(v=>v.name);
  if(missing.length)throw new Error(`原版 ${program.definition.name} 缺少 uniform：${missing.join(', ')}`);
  for(const name of ['side','transparent','depthTest','depthWrite','depthFunc','blending'] as const)if(state[name]===undefined)throw new Error(`缺少明确的渲染状态 ${name}`);
  if(state.blending===THREE.CustomBlending)for(const name of ['blendSrc','blendDst','blendSrcAlpha','blendDstAlpha','blendEquation','blendEquationAlpha'] as const)if(state[name]===undefined)throw new Error(`缺少明确的混合状态 ${name}`);
  const uniforms=Object.fromEntries(required.map(v=>{
    let value:any=bindings[v.name];let valid=false;
    if(v.count!==1)throw new Error(`原版 uniform 数组 ${v.name} 尚未接入`);
    if(v.type==='float'){if(Array.isArray(value)&&value.length===1)value=value[0];valid=typeof value==='number'&&Number.isFinite(value);}
    else if(/^vec[234]$/.test(v.type)){const n=Number(v.type.at(-1)), values=Array.isArray(value)||ArrayBuffer.isView(value)?Array.from(value as ArrayLike<number>):value?.toArray?.();valid=values?.length===n&&values.every(Number.isFinite);}
    else if(v.type==='mat4'||v.type==='mat3')valid=!!value?.[v.type==='mat4'?'isMatrix4':'isMatrix3'];
    else if(v.type==='samplerCube')valid=!!value?.isCubeTexture;
    else if(v.type==='sampler3D')valid=!!value?.isData3DTexture;
    else if(v.type==='sampler2D')valid=!!value?.isTexture&&!value.isCubeTexture&&!value.isData3DTexture;
    else if(v.type==='usampler2D')valid=!!value?.isDataTexture&&[THREE.RedIntegerFormat,THREE.RGIntegerFormat,THREE.RGBAIntegerFormat].includes(value.format)&&[THREE.UnsignedByteType,THREE.UnsignedShortType,THREE.UnsignedIntType].includes(value.type);
    else if(v.type==='bool')valid=typeof value==='boolean';
    else if(v.type==='int'||v.type==='uint')valid=typeof value==='number'&&Number.isInteger(value)&&(v.type!=='uint'||value>=0);
    if(!valid)throw new Error(`原版 uniform ${v.name} 需要有效 ${v.type} 输入`);
    return [v.name,{value}];
  }));
  const source=(s: string)=>portableShader(s).replace(/^#version 300 es\s*\n/,'');
  const material=new THREE.RawShaderMaterial({glslVersion:THREE.GLSL3,vertexShader:source(program.vertexSource),fragmentShader:source(program.fragmentSource),uniforms,...state,toneMapped:false});
  material.userData.scope='原版 shader 与显式输入；完整 Level 管线仍取决于调用方';return material;
}
