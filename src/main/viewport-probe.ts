import {PROBE_BASE_PIXELS,probeShBasis,reduceProbe} from '../core/probe';
import {vulkanProbeBindings} from './vulkan-probe';

/** Project the existing atmosphere preview cubemap onto SH with solid-angle
 * weights. These are editor lighting inputs, not original scene ray casts.
 * The original reduction supplies seam mips/half packing and the original
 * flush layout supplies uniforms, keeping cube and diffuse lighting together. */
export function viewportProbeBindings(history:Float32Array,center:number[]){
 if(history.length!==PROBE_BASE_PIXELS*4)throw new Error('预览探针立方体长度无效');
 const sums=new Float64Array(27);let totalWeight=0;
 for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++){
  const u=2*(x+.5)/32-1,v=2*(y+.5)/32-1;
  const direction=[[1,-v,-u],[-1,-v,u],[u,1,v],[u,-1,-v],[u,-v,1],[-u,-v,-1]][face];
  const length=Math.hypot(...direction),weight=1/(length*length*length),basis=probeShBasis(direction.map(value=>value/length));
  totalWeight+=weight;
  const at=(face*1024+y*32+x)*4;
  for(let coefficient=0;coefficient<9;coefficient++)for(let lane=0;lane<3;lane++)sums[coefficient*3+lane]+=history[at+lane]*basis[coefficient]*weight;
 }
 const sh=Float32Array.from(sums,value=>value*4*Math.PI/totalWeight),empty=new Float32Array(0);
 const reduced=reduceProbe({history,sh:new Float32Array(27)},{coordinates:empty,directions:empty,colors:empty},true);
 return vulkanProbeBindings({sh,half:reduced.half,center});
}
