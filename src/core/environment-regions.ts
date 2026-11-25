import defaults from '../../docs/environment-defaults.json';
import clumpEvidence from '../../docs/environment-clumps.json';
import { initializeEnvFade } from './environment-runtime';
import type { EnvMarker, EnvHull, EnvFadeState } from './environment';
import type { ObjectNode } from './objects';

export interface EnvironmentRegion {
  kind: 'direct' | 'clump';
  complete: boolean;
  issues: string[];
  hullNodeId: number | null;
  controllerNodeId: number | null;
  markers: EnvMarker[];
  hull: EnvHull | null;
  registration: { layer: number; falloff: number; fadeIn: number; fadeOut: number; duration: number; state: EnvFadeState } | null;
}

// Runtime diagnostics use raw saved bytes, not display values or Three.js
// decomposition. Only absent fields with an actual recovered tag are defaulted.
export function describeEnvironmentRegion(node: ObjectNode, nodes: ObjectNode[]): EnvironmentRegion | null {
  if (!['EnvNode', 'SetEnvHull'].includes(node.className)) return null;
  const issues: string[] = [];
  const bytes = (object: ObjectNode, name: string, count: number) => {
    const field = object.fields.find(field => field.name === name);
    const classDefaults = (defaults.classes as Record<string, Record<string, { encodedHex: string }>>)[object.className];
    const hex = field ? field.raw : object.className === 'Marker' && name === 'enabled' ? clumpEvidence.markerDefaults.enabled.encodedHex : classDefaults?.[name]?.encodedHex;
    if (!hex || !/^[0-9a-f]+$/i.test(hex) || hex.length !== count * 2) { issues.push(`${object.className} #${object.id}.${name} 缺少已确认的原始值`); return null; }
    return Uint8Array.from(hex.match(/../g)!, h => Number.parseInt(h, 16));
  };
  const scalar = (object: ObjectNode, name: string, type: 'float' | 'uint' | 'bool') => {
    const raw = bytes(object, name, type === 'bool' ? 1 : 4); if (!raw) return null;
    const view = new DataView(raw.buffer), value = type === 'bool' ? Number(raw[0] !== 0) : type === 'uint' ? view.getUint32(0, true) : view.getFloat32(0, true);
    if (!Number.isFinite(value)) { issues.push(`${object.className} #${object.id}.${name} 不是有限数值`); return null; }
    return value;
  };
  const vector = (object: ObjectNode, name: string) => {
    const raw = bytes(object, name, 16); if (!raw) return null;
    const view = new DataView(raw.buffer), value = Array.from({ length: 4 }, (_, i) => view.getFloat32(i*4, true));
    if (!value.every(Number.isFinite)) { issues.push(`${object.className} #${object.id}.${name} 含非有限分量`); return null; }
    return value;
  };
  const transform = (object: ObjectNode) => {
    const position = vector(object, 'pos'), quaternion = vector(object, 'quat'), scale = vector(object, 'scale');
    return position && quaternion && scale ? { position, quaternion, scale } : null;
  };
  const falloff = scalar(node, 'falloff', 'float'), layer = scalar(node, 'layer', 'uint');
  const fadeIn = scalar(node, 'fadeInTime', 'float'), fadeOut = scalar(node, 'fadeOutTime', 'float'), duration = scalar(node, 'duration', 'float');
  if (layer !== null && layer >= 4) issues.push('原版环境层必须为 0 至 3');
  const byId = new Map(nodes.map(node => [node.id, node]));
  let enabled: number | null = null, hullNodeId: number | null = null, controllerNodeId: number | null = null, hull: EnvHull | null = null;
  const markers: EnvMarker[] = [];
  if (node.className === 'EnvNode') {
    const bounds = transform(node); enabled = scalar(node, 'enabled', 'bool'); controllerNodeId = node.id;
    if (bounds && falloff !== null) hull = { ...bounds, falloff };
  } else {
    const ref = node.fields.find(field => field.name === 'hull');
    const clump = ref?.kind === 'reference' ? byId.get(Number(ref.value)) : undefined;
    if (!clump || clump.className !== 'Clump') issues.push('环境 hull 引用未解析到已支持的 Clump');
    else {
      hullNodeId = clump.id;
      const data = clump.fields.find(field => field.name === 'data');
      if (data?.kind !== 'array' || !data.children?.length) issues.push('原版环境 Clump 必须至少包含一个 Marker');
      else data.children.forEach((ref, index) => {
        const marker = ref.kind === 'reference' ? byId.get(Number(ref.value)) : undefined;
        if (!marker || marker.className !== 'Marker') { issues.push(`Clump #${clump.id} 第 ${index + 1} 项未解析到已支持的 Marker`); return; }
        const bounds = transform(marker), active = scalar(marker, 'enabled', 'bool');
        if (index === 0) { controllerNodeId = marker.id; enabled = active; }
        if (bounds && active !== null) markers.push({ id: marker.id, ...bounds, enabled: !!active });
      });
    }
  }
  const registration = issues.length || enabled === null || layer === null || falloff === null || fadeIn === null || fadeOut === null || duration === null ? null :
    { layer, falloff, fadeIn, fadeOut, duration, state: initializeEnvFade(!!enabled, duration) };
  return { kind: node.className === 'EnvNode' ? 'direct' : 'clump', complete: !!registration, issues, hullNodeId, controllerNodeId, markers, hull, registration };
}
