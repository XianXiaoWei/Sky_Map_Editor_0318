import {MODEL_RENDER_STATES} from './model-render-state';
import type {ObjectNode} from './objects';
import {describeMaterial,type MaterialDescriptor,type ShaderProgram} from './materials';
import {defaultLevelMaterialDescriptor} from './level-material-runtime';
import {MODEL_NATIVE_TEXTURE_GLOBALS} from './model-global-textures';
import {MODEL_PROBE_GLOBALS} from './model-probe-globals';

// Model constructor 0x100467d07..0x100467e0b: position/color share
// float3+UNORM4, normal is SNORM4, and UV0/1 are two half4 attributes.
// This is an interleaved upload adapter for those original separate streams.
export const MODEL_VERTEX_STRIDE=48;
export const MODEL_ATTRIBUTES={a_position:{format:'vec3',offset:0},a_color:{format:'unorm4',offset:12},a_normal:{format:'snorm4',offset:16},a_uv:{format:'half4',offset:20},
  a_uv0:{format:'half4',offset:20},a_uv1:{format:'half4',offset:28},a_light0:{format:'unorm4',offset:36},a_light1:{format:'unorm4',offset:40},a_light2:{format:'unorm4',offset:44}} as const;
export function effectiveLevelMeshMaterial(node:ObjectNode,level:string){
  const material=defaultLevelMaterialDescriptor(describeMaterial(node),level);
  // Original LevelMesh update 0x10040238c..0x100402396 selects Black
  // when a texture value's C-string is empty. This is a transient binding;
  // retain the serialized empty string in Objects.level.bin.
  if(!material.custom)return material;
  return {...material,parameters:material.parameters.map(p=>p.nativeType===2?{...p,texture:p.texture.split('\0')[0]||'Black'}:p)};
}
export const MODEL_PREVIEW_GLOBALS=new Set(['u_viewProj','u_modelViewProj','u_model','u_modelIT','u_worldToLevel','u_eyePos','u_sunDir','u_sunColor','u_averageSkyColor','u_pointLight','u_probeCube','u_viewportSize','u_lightShadowConsts',
  'u_lightOffsetsTex','u_lightCountsTex','u_lightPositionsTex','u_lightColorsTex','u_time','u_windScroll1','u_windScroll2','u_averageProbeColor','u_probeCenter','u_jitterHalf','u_cloudTex1','u_depthHalfTex',...Object.keys(MODEL_PROBE_GLOBALS),'u_waterSim','u_waterSimTerms','u_puddleSimNorm']);
export const MODEL_SIMULATION_GLOBALS:Readonly<Record<string,string>>={u_waterSim:'sampler2D',u_waterSimTerms:'vec4',u_puddleSimNorm:'sampler2D'};
/** Reject incomplete bindings before they can silently become zero uniforms
 * or gray diagnostic vertices. Scene probes/light grids remain explicit
 * adapters shared with terrain, not restored original scene services. */
export function modelDrawBoundary(node:ObjectNode,level:string,program:ShaderProgram,baked:boolean,animated=false):string|null {
  const material=effectiveLevelMeshMaterial(node,level);
  return materialDrawBoundary(material,program,baked,animated);
}
export function materialDrawBoundary(material:MaterialDescriptor,program:ShaderProgram,baked:boolean,animated=false,convention:'model'|'material'='model',attributes:Record<string,unknown>=MODEL_ATTRIBUTES):string|null {
  if(animated)return 'Native skinning/animation unavailable';
  if(!Object.hasOwn(MODEL_RENDER_STATES,program.definition.group))return `RenderList ${program.definition.group}`;
  if(program.definition.name!==material.shaderName)return 'Material shader identity';
  for(const v of program.variables){
    if(v.storage==='in'&&v.stage==='vertex'){
      if(!(v.name in attributes))return `Vertex attribute ${v.name}`;
      if(v.name.startsWith('a_light')&&!baked)return 'Baked vertex lighting unavailable';
    }
    if(v.storage==='uniform'&&v.name in MODEL_NATIVE_TEXTURE_GLOBALS&&(v.type!=='sampler2D'||v.count!==1))return `Native texture global type ${v.name}`;
    if(v.storage==='uniform'&&v.name in MODEL_PROBE_GLOBALS&&(v.type!==MODEL_PROBE_GLOBALS[v.name]||v.count!==1))return `Scene probe global type ${v.name}`;
    if(v.storage==='uniform'&&v.name in MODEL_SIMULATION_GLOBALS&&(v.type!==MODEL_SIMULATION_GLOBALS[v.name]||v.count!==1))return `Scene simulation global type ${v.name}`;
    if(v.storage==='uniform'&&!MODEL_PREVIEW_GLOBALS.has(v.name)&&!(v.name in MODEL_NATIVE_TEXTURE_GLOBALS)){
      const matches=material.parameters.filter(p=>p.name===v.name);
      if(matches.length!==1)return `Uniform ${v.name}: ${matches.length} parameters`;
      const p=matches[0];
      if(v.count!==1)return `Uniform array ${v.name}`;
      if(v.type==='sampler2D'){if(p.nativeType!==(convention==='material'?1:material.custom?2:1)||!p.texture)return `Texture ${v.name}`;}
      else if(v.type==='float'||/^vec[234]$/.test(v.type)){
        const count=v.type==='float'?1:Number(v.type.slice(3));
        if((convention==='material'?p.nativeType!==0:material.custom&&p.nativeType!==(count===1?0:1))||p.vector.length<count||!p.vector.slice(0,count).every(Number.isFinite))return `Value ${v.name}`;
      }else return `Uniform type ${v.name}: ${v.type}`;
    }
  }
  return null;
}
