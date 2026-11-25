import type {ObjectNode} from './objects';
import {buildRailCache,RAIL_MARKER_OBB,railMarkerTransform, railPosition, type RailCache} from './rail';

/** Resolve the saved Marker getters into the original initialized Rail cache.
 * Missing references remain a boundary instead of connecting unrelated rails. */
export function savedRailCache(node:ObjectNode,nodes:ObjectNode[]):RailCache {
 if(node.className!=='Rail')throw new Error('鸟群需要 Rail 对象');
 const refs=node.fields.find(f=>f.name==='dataPoints')?.children??[],looped=Boolean(node.fields.find(f=>f.name==='looped')?.value);
 const points=refs.map(ref=>{
  const point=ref.kind==='reference'?nodes[Number(ref.value)]:undefined;
  if(point?.className!=='Marker')throw new Error('Rail 控制点 getter 尚未支持');
  const get=(name:string)=>point.fields.find(f=>f.name===name)?.value;
  const position=get('pos'),quaternion=get('quat'),scale=get('scale');
  if(!Array.isArray(position)||!Array.isArray(quaternion)||!Array.isArray(scale))throw new Error('Rail Marker 缺少组件');
  return {world:railMarkerTransform({position,quaternion,scale}),obb:RAIL_MARKER_OBB};
 });
 const transform=node.fields.find(f=>f.name==='transform')?.value;
 return buildRailCache(points,Array.isArray(transform)?transform:[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],looped);
}

// Editor inspection only. Serialized states do not choose active game Rails.
// Keep every reference in order; never connect across an unresolved point.
export function railInspectionPoints(node: ObjectNode, nodes: ObjectNode[], samplesPerSegment = 16): number[][] {
  if (node.className !== 'Rail' || !Number.isInteger(samplesPerSegment) || samplesPerSegment < 1 || samplesPerSegment > 64) throw new Error('Rail 检查采样参数无效');
  const refs = node.fields.find(f => f.name === 'dataPoints')?.children;
  const looped = node.fields.find(f => f.name === 'looped');
  if (!refs || refs.length < 2 || !looped) throw new Error('Rail 检查缺少原控制点或 looped 字段');
  const positions = refs.map(ref => {
    const point = ref.kind === 'reference' ? nodes[Number(ref.value)] : undefined;
    if (!point || point.className !== 'Marker') throw new Error(`Rail 控制点 #${ref.value} 的 getter 尚未支持`);
    const value = (name: string) => point.fields.find(f => f.name === name)?.value;
    const position = value('pos'), quaternion = value('quat'), scale = value('scale');
    if (!Array.isArray(position) || !Array.isArray(quaternion) || !Array.isArray(scale)) throw new Error(`Rail Marker #${point.id} 需要原默认值`);
    return railMarkerTransform({position, quaternion, scale}).slice(12, 15);
  });
  // Position spline does not read scale/roll/transform cache arrays.
  const cache: RailCache = {positions, scales: [[], [], []], rolls: [], transform: [], looped: Boolean(looped.value)};
  const steps = (positions.length - 1 + Number(cache.looped)) * samplesPerSegment;
  return Array.from({length: steps + 1}, (_, i) => railPosition(cache, Math.fround(i / steps)));
}
