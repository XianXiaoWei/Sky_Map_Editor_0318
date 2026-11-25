import type { ObjectNode } from './objects';
import type { ResourceMesh } from './resources';
import { cloudCardIndexLayout } from './cloud-card-indices';
import { cloudCardInverse } from './cloud-card-inverse';
import {cloudCardDynamicVertices} from './cloud-card-dynamic';
import {cloudCardDrawPlan} from './cloud-card-draw';

// The caller supplies CloudCard registration order. TGCL source order is an
// explicit editor input; the game's complete registration schedule is pending.
export function cloudCardLevelLayout(nodes: ObjectNode[], resource: (name: string) => ResourceMesh) {
  const cards = nodes.filter(n => n.className === 'CloudCard').map(node => {
    const name = node.fields.find(f => f.name === 'meshName')?.value;
    const world = node.fields.find(f => f.name === 'transform')?.value;
    if (typeof name !== 'string' || !Array.isArray(world)) throw new Error('CloudCard 缺少模型或矩阵');
    const mesh = resource(name).levels[0];
    if (!mesh.bounds) throw new Error('CloudCard 模型缺少原包围盒');
    // Original object +0x70 is the serialized alphaMult field, not a generic
    // opacity property. Using a missing opacity name silently produced 1.
    const value=node.fields.find(f=>f.name==='alphaMult')?.value;
    const alphaMult=typeof value==='object'&&value!==null&&!Array.isArray(value)?Number((value as {float?:number}).float):Number(value);
    if(value===undefined||!Number.isFinite(alphaMult))throw new Error('CloudCard 缺少原 alphaMult');
    return { nodeId: node.id, meshName: name,alphaMult, source: { mesh, bounds: mesh.bounds, world } };
  });
  const layout = cloudCardIndexLayout(cards.map(c => c.source));
  return { cards: cards.map((c, i) => ({ nodeId: c.nodeId, meshName: c.meshName,alphaMult:c.alphaMult, sphere: layout.spheres[i], group: layout.groups[i],
    world: c.source.world.map(Math.fround), inverseWorld: cloudCardInverse(c.source.world) })), groupCount: layout.groupCount,
    renderOrder: layout.order, ranges: layout.ranges, indices: layout.indices, vertexCount: layout.vertexCount,
    scope: '原 CloudCardBarn 世界球/连接组/组排序/累计索引/逆矩阵；输入为 TGCL 顺序，完整注册/遮挡分类仍待恢复' };
}

// Exact stream and ordered original index slices ready for the existing Cloud
// pass. Visibility and baked/default lighting remain explicit caller inputs.
export function cloudCardLevelDynamic(nodes:ObjectNode[],resource:(name:string)=>ResourceMesh,eye:number[],visibleOrder:number[],sortByDistance:boolean,fallbackLighting:Uint8Array,lighting:Record<number,Uint8Array>={}){
  const layout=cloudCardLevelLayout(nodes,resource),sources=layout.cards.map(card=>({world:card.world,opacity:card.alphaMult,mesh:resource(card.meshName).levels[0],lighting:lighting[card.nodeId]}));
  const dynamic=cloudCardDynamicVertices(sources,layout.ranges,visibleOrder,eye,fallbackLighting),draws=cloudCardDrawPlan(layout.cards.map(c=>c.sphere),layout.ranges,visibleOrder,eye,sortByDistance),indices=new Uint32Array(draws.reduce((n,d)=>n+d.indexCount,0));
  let at=0;for(const draw of draws){indices.set(layout.indices.subarray(draw.indexOffset,draw.indexOffset+draw.indexCount),at);at+=draw.indexCount;}
  return {...dynamic,indices,draws,stride:28,attributes:{a_position:{format:'vec3' as const,offset:0},a_uv:{format:'half2' as const,offset:12},a_normal:{format:'snorm4' as const,offset:16},a_light0:{format:'unorm4' as const,offset:20},a_light1:{format:'unorm4' as const,offset:24}},
    scope:dynamic.scope+'; TGCL registration input, original ordered index slices; full visibility classification and default lighting generation excluded'};
}
