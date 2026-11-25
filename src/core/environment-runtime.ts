import evidence from '../../docs/environment-runtime.json';
import { blendEnvLayers, envClumpWeight, envHullWeight, ENV_WEIGHT_EPSILON, stepEnvFade, type EnvFadeState, type EnvFadeTiming, type EnvFieldSpec, type EnvHull, type EnvMarker, type EnvValue, type WeightedEnv } from './environment';

import {setNativeMarkerTransform} from './marker-transform-runtime';
const f = Math.fround;
export interface EnvFrameClock { delta: number; timeScale: number; debugEnabled?: boolean; debugScale?: number; }

// 0x10031b6e0: registration initializes each parameter group's own fade state.
// A zero duration starts at alpha=1 even when the shared node is disabled.
export function initializeEnvFade(enabled: boolean, duration: number): EnvFadeState {
  const d = f(duration);
  return { enabled, wasEnabled: enabled, remaining: enabled ? f(d + ENV_WEIGHT_EPSILON) : ENV_WEIGHT_EPSILON, alpha: d === 0 ? 1 : 0 };
}

// 0x100319a30 uses time.delta(+0x14), timeScale(+0x20), optional debug scale.
export function environmentFrameDelta(clock: EnvFrameClock) {
  const debug = clock.debugEnabled ? clock.debugScale : 1;
  if (debug === undefined || ![clock.delta, clock.timeScale, debug].every(Number.isFinite)) throw new Error('环境帧时间必须完整且有限');
  return Math.min(evidence.maxFrameDelta, Math.max(ENV_WEIGHT_EPSILON, f(f(clock.delta) * f(f(clock.timeScale) * f(debug)))));
}

export interface EnvRuntimeVariable {
  name: string;
  fields: EnvFieldSpec[];
  output: Record<string, EnvValue>;
  defaults?: Record<string, EnvValue>;
}
interface EnvRuntimeEntry {
  id: number;
  layer: number;
  timing: EnvFadeTiming;
  values: Record<string, Record<string, EnvValue>>;
}
export type EnvRuntimeNode = EnvRuntimeEntry & (
  { enabled: boolean; hull: EnvHull; markers?: never; falloff?: never } |
  { markers: EnvMarker[]; falloff: number; enabled?: never; hull?: never }
);
const enabledOf = (node: EnvRuntimeNode) => node.markers ? node.markers[0].enabled : node.enabled;
function writeEnabled(node: EnvRuntimeNode, enabled: boolean) { if (node.markers) node.markers[0].enabled = enabled; else node.enabled = enabled; }
const falloffOf = (node: EnvRuntimeNode) => node.markers ? node.falloff : node.hull.falloff;

// Verified direct-EnvNode and Marker Clump paths. The Level queue adapter supplies
// original variable/EnvNode order; manual and event-driven callers supply their
// actual append order and initialized values. Unknown events are not inferred.
export class EnvironmentRuntime {
  readonly variables: EnvRuntimeVariable[];
  readonly nodes: EnvRuntimeNode[];
  readonly states: EnvFadeState[][];
  constructor(variables: EnvRuntimeVariable[], nodes: EnvRuntimeNode[]) {
    if (!variables.length || variables.length > evidence.limits.variables || new Set(variables.map(v => v.name)).size !== variables.length) throw new Error('原版环境参数组数量或名称无效');
    if (new Set(nodes.map(node => node.id)).size !== nodes.length) throw new Error('环境节点 ID 重复');
    const counts = [0, 0, 0, 0];
    for (const node of nodes) {
      if (!Number.isInteger(node.layer) || node.layer < 0 || node.layer >= 4) throw new Error('原版环境层必须为 0 至 3');
      if (++counts[node.layer] > evidence.limits.hullsPerVariablePerLayer) throw new Error('原版环境每层最多 96 个范围');
      if (node.markers && !node.markers.length) throw new Error('原版环境 Clump 范围必须至少包含一个 Marker');
      if (![falloffOf(node), node.timing.fadeIn, node.timing.fadeOut, node.timing.duration].every(Number.isFinite)) throw new Error('环境时间与范围需要有限数值');
      for (const variable of variables) for (const field of variable.fields) {
        if (node.values[variable.name]?.[field.name] === undefined) throw new Error(`环境节点缺少已初始化参数 ${variable.name}.${field.name}`);
      }
    }
    this.variables = structuredClone(variables); this.nodes = structuredClone(nodes);
    // Canonicalize Marker IDs so two SetEnvHull entries share the same enabled
    // byte, even when input was reconstructed from serialized references.
    const markers = new Map<number, EnvMarker>();
    for (const node of this.nodes) if (node.markers) node.markers = node.markers.map(marker => {
      const prior = markers.get(marker.id);
      if (prior && JSON.stringify(prior) !== JSON.stringify(marker)) throw new Error('同一 Marker 的环境输入冲突');
      if (!prior) markers.set(marker.id, marker);
      return prior ?? marker;
    });
    this.states = variables.map(() => this.nodes.map(node => initializeEnvFade(enabledOf(node), node.timing.duration)));
    // Validate supplied outputs/defaults without changing them at registration.
    for (const variable of this.variables) blendEnvLayers(variable.fields, variable.defaults, [[], [], [], []], variable.output);
  }
  setEnabled(id: number, enabled: boolean) {
    const nodes = this.nodes.filter(node => node.id === id); if (!nodes.length) throw new Error('环境节点不存在');
    for (const node of nodes) writeEnabled(node, enabled);
  }
  setControllerEnabled(id:number,enabled:boolean) {
    let found=false;
    for(const node of this.nodes){
      if(!node.markers&&node.id===id){node.enabled=enabled;found=true;}
      for(const marker of node.markers??[])if(marker.id===id){marker.enabled=enabled;found=true;}
    }
    return found;
  }
  setControllerTransform(id:number,matrix:Uint8Array) {
    const bounds:Array<Pick<EnvHull,'position'|'quaternion'|'scale'>>=[];
    for(const node of this.nodes){if(node.markers)bounds.push(...node.markers.filter(marker=>marker.id===id));else if(node.id===id)bounds.push(node.hull);}
    if(!bounds.length)return false;
    const storage=new Uint8Array(80),v=new DataView(storage.buffer);bounds[0].scale.forEach((n,i)=>v.setFloat32(48+i*4,n,true));setNativeMarkerTransform(storage,matrix);
    const vector=(offset:number)=>Array.from({length:4},(_,i)=>v.getFloat32(offset+i*4,true));
    for(const b of bounds){b.position=vector(16);b.quaternion=vector(32);b.scale=vector(48);}
    return true;
  }
  registerDefault(name:string,values:Record<string,EnvValue>) {
    const variable=this.variables.find(variable=>variable.name===name);
    if(!variable)throw new Error(`没有注册环境参数组 ${name}`);
    blendEnvLayers(variable.fields,values,[[],[],[],[]],variable.output);
    variable.defaults=structuredClone(values);
  }
  /** RegisterClump appends fresh per-variable timers on every event update;
   * repeated registrations retain old entries, matching the native owner. */
  registerNode(node:EnvRuntimeNode) {
    const existing=this.nodes.filter(other=>other.layer===node.layer).length;
    if(existing>=evidence.limits.hullsPerVariablePerLayer)throw new Error('原版环境每层最多 96 个范围');
    // Reuse constructor validation; marker pointers are canonicalized against
    // the current owner so repeated events share the controller enabled byte.
    const candidate=new EnvironmentRuntime(this.variables,[node]).nodes[0];
    if(candidate.markers)candidate.markers=candidate.markers.map(marker=>{
      const existing=this.nodes.flatMap(node=>node.markers??[]).find(other=>other.id===marker.id);
      return existing??marker;
    });
    this.nodes.push(candidate);
    for(const states of this.states)states.push(initializeEnvFade(enabledOf(candidate),candidate.timing.duration));
  }
  advance(clock: EnvFrameClock) {
    const delta = environmentFrameDelta(clock);
    // All variables share the node's enabled byte, but own independent timers.
    // A prior variable expiring can disable the node before a later one steps.
    for (let v = 0; v < this.variables.length; v++) for (let layer = 0; layer < 4; layer++) {
      this.nodes.forEach((node, index) => {
        if (node.layer !== layer) return;
        const state = stepEnvFade({ ...this.states[v][index], enabled: enabledOf(node) }, node.timing, delta);
        this.states[v][index] = state; writeEnabled(node, state.enabled);
      });
    }
    return delta;
  }
  sample(point: number[],diagnostics=true) {
    const results = this.variables.map((variable, v) => {
      const layers: WeightedEnv[][] = [[], [], [], []];
      this.nodes.forEach((node, index) => layers[node.layer].push({ weight: node.markers ? envClumpWeight(point, node.markers, node.falloff, this.states[v][index].alpha) : envHullWeight(point, node.hull, this.states[v][index].alpha), values: node.values[variable.name] }));
      const result = blendEnvLayers(variable.fields, variable.defaults, layers, variable.output);
      variable.output = result.values;
      return { name: variable.name, ...result };
    });
    return { variables: results, nodes: diagnostics?this.nodes.map((node, index) => ({ id: node.id, enabled: enabledOf(node), states: this.states.map(states => ({ ...states[index], enabled: enabledOf(node) })) })):[] };
  }
  update(clock: EnvFrameClock, point: number[]) {
    const delta = this.advance(clock);
    return { delta, ...this.sample(point) };
  }
}
