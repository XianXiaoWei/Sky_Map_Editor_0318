import {materialDrawRank,materialUsesAlphaPass} from './model-render-state';
import type {VulkanBakedDraw,VulkanModelDraw} from './vulkan-protocol';
type Draw=VulkanBakedDraw|VulkanModelDraw;
// Pose uploads replace the vertex stream without replacing the draw.
const localCenters=new WeakMap<Draw,{vertices:Uint8Array;indices:Uint32Array;center:number[]}>();

/** Editor ordering adapter: recovered list order, then back-to-front bounds
 * for transparent instances. Native Scene sort keys/registration are pending. */
export function orderViewportMaterialDraws(draws:Draw[],eye?:number[]){
  const distance=(draw:Draw)=>{
    if(!eye||!materialUsesAlphaPass(draw.state))return 0;
    let cached=localCenters.get(draw);
    if(!cached||cached.vertices!==draw.vertices||cached.indices!==draw.indices){const view=new DataView(draw.vertices.buffer,draw.vertices.byteOffset,draw.vertices.byteLength),lo=[Infinity,Infinity,Infinity],hi=[-Infinity,-Infinity,-Infinity];
      for(const ix of draw.indices)for(let lane=0;lane<3;lane++){const value=view.getFloat32(ix*draw.stride+lane*4,true);lo[lane]=Math.min(lo[lane],value);hi[lane]=Math.max(hi[lane],value);}
      cached={vertices:draw.vertices,indices:draw.indices,center:lo.map((v,i)=>(v+hi[i])/2)};localCenters.set(draw,cached);
    }
    const p=cached.center;
    const m='model' in draw?draw.model:null;
    const world=m?[0,1,2].map(i=>m[i]*p[0]+m[4+i]*p[1]+m[8+i]*p[2]+m[12+i]):p;
    return world.reduce((n,v,i)=>n+(v-eye[i])**2,0);
  };
  return draws.map((draw,index)=>({draw,index,rank:materialDrawRank(draw.state,'group' in draw?draw.group:undefined),distance:distance(draw)}))
    .sort((a,b)=>a.rank-b.rank||b.distance-a.distance||a.index-b.index).map(v=>v.draw);
}
