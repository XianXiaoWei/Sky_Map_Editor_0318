import {visibilityAdd as add,visibilityMul as mul} from './visibility-float';
import {queryVisibilityViewBounds,type VisibilitySphereState} from './visibility-spheres';
import type {VisibilityReciprocal} from './visibility-transform';

/** Original numeric AABB query 0x100721ce0. Separate min/max arrays have
 * stride 16; W lanes are not coordinates. Every product is selected with the
 * original MIN/MAX operand order before summation and view translation.
 * Unlike sphere queries, disabled/no-camera/no-mip always initialize statuses
 * and there is no sphere-distance rejection. Debug drawing is excluded.
 */
export function queryVisibilityAabbs(state:VisibilitySphereState,minima:Float32Array,maxima:Float32Array,count:number,output:Uint32Array,reciprocal:VisibilityReciprocal,minimum:(a:number,b:number)=>number,maximum:(a:number,b:number)=>number):void {
  queryVisibilityViewBounds(state,count,output,true,reciprocal,maximum,(index,view)=>{
    if(minima.length<count*4||maxima.length<count*4)throw new Error('Visibility AABB source range');
    const at=index*4;
    const dot=(row:number,select:(a:number,b:number)=>number)=>{
      const parts=[0,1,2].map(axis=>select(mul(view[row+axis*4],minima[at+axis]),mul(view[row+axis*4],maxima[at+axis])));
      return add(view[row+12],add(add(parts[0],parts[1]),parts[2]));
    };
    return {minimum:[0,1,2].map(row=>dot(row,minimum)),maximum:[0,1,2].map(row=>dot(row,maximum)),distanceOutside:false};
  });
}
