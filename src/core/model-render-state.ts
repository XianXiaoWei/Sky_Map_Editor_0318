import evidence from '../../docs/model-render-state.json';
import fogEvidence from '../../docs/fog-volume-render-state.json';

export const MODEL_RENDER_STATES={Opaque:0,AlphaTestOpaque:6,Skybox:11,FogVolume:12,Decal:1,Ghostly:0,BlendedBackground:9,BlendedWithBackfaces:10,Blended:9} as const;
export const materialUsesAlphaPass=(state:number)=>state===9||state===10;
export type ModelRenderGroup=keyof typeof MODEL_RENDER_STATES;
export function modelRenderStateCode(group:string):number {
  if(!Object.hasOwn(MODEL_RENDER_STATES,group))throw new Error(`尚未接入原版模型绘制组 ${group}`);
  return MODEL_RENDER_STATES[group as ModelRenderGroup];
}
/** Descriptor state executed in the original Compositor/Metal kernels.
 * Scene sort/registration and native GPU ownership remain separate services. */
export function modelRenderState(group:string){
  modelRenderStateCode(group);
  const state=(group==='FogVolume'?fogEvidence:evidence).captureWithAlphaDepth.renderLists.find(r=>r.name===group);
  if(!state)throw new Error(`缺少原版模型绘制组 ${group} 的状态证据`);
  return structuredClone(state);
}
export function materialDrawRank(state:number,group?:string){
  if(group==='Ghostly')return 2.5;
  if(state===11)return .5;
  if(state===0||state===6)return 0;
  if(state===1)return 1;
  if(state===2)return 2;
  return group==='BlendedBackground'?3:group==='BlendedWithBackfaces'?4:5;
}
