import graph from '../../docs/cloud-render-graph.json';
import meshStates from '../../docs/meshes-render-state.json';

export const CLOUD_LIST_MATERIAL_STATE = 8;

// This descriptor is appended after fine fullscreen in the same Cloud pass.
// Its depth index 0 is the original no-test/no-write state, not Opaque.
export function cloudListRenderState() {
  const pass = graph.passes.find(p => p.name === 'Cloud')!;
  const list = pass.draws.find(d => d.kind === 'list')!;
  const depth = meshStates.captureWithAlphaDepth.renderLists.find(r => r.depth.index === list.depthState)!.depth;
  return { group: 'Cloud', materialState: CLOUD_LIST_MATERIAL_STATE, listIndex: list.index,
    depth: structuredClone(depth), cullEnum: list.cullEnum, bias: [...list.bias!], colors: structuredClone(list.colors!) };
}
