import evidence from '../../docs/meshes-render-state.json';

export type BakedPass = 'opaque' | 'decal' | 'skirt';
export type BakedRenderGroup = 'Opaque' | 'Decal' | 'Skirts';
export const bakedRenderGroups: Record<BakedPass, BakedRenderGroup> = { opaque:'Opaque', decal:'Decal', skirt:'Skirts' };

// Captured from original Compositor descriptor writes + AddRenderList storage.
// Scene capacity/sort fields are deliberately not interpreted as GPU state.
export function bakedRenderState(group: string) {
  if (!['Opaque','Decal','Skirts'].includes(group)) throw new Error(`尚未接入原版绘制组 ${group}`);
  const list=evidence.captureWithAlphaDepth.renderLists.find(r=>r.name===group);
  if (!list) throw new Error(`缺少原版绘制组 ${group} 的状态证据`);
  return structuredClone(list);
}
export function bakedPassOrder(pass: BakedPass) {
  const lists=evidence.captureWithAlphaDepth.renderLists.filter(r=>Object.values(bakedRenderGroups).includes(r.name as BakedRenderGroup));
  return lists.findIndex(r=>r.name===bakedRenderGroups[pass]);
}

// Mode 3 uses the original shader descriptor handle, not a material ID or
// VertexRender pipeline handle. Real handle allocation remains unresolved.
export function bakedShaderSortKey(initialized: boolean, shaderHandle: number | null) {
  if(!initialized || shaderHandle===null)return -1;
  if(!Number.isInteger(shaderHandle)||shaderHandle<0||shaderHandle>0xffffffff)throw new Error('需要明确的原版 uint32 shader 句柄');
  return shaderHandle|0;
}
