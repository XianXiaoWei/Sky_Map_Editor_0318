import {visibilityAdd as add,visibilitySub as sub,visibilityMul as mul,visibilityFloatBits as bits,visibilityFloatFromBits as fromBits,visibilityDaz as daz} from './visibility-float';
import type {VisibilityReciprocal} from './visibility-transform';
import type {VisibilityMip} from './visibility-depth';

export interface VisibilitySphereState {
  /** Original stored Camera+0x140 view matrix and +0x180 projection matrix. */
  camera: {view:ArrayLike<number>;projection:ArrayLike<number>} | null;
  disabled:boolean;
  frustumOnly:boolean;
  distanceLimit:number;
  mips:readonly VisibilityMip[];
  /** Explicit contiguous depth allocation, in four-word 2x2 tiles. */
  depth:Float32Array;
}

export interface VisibilityViewBounds {minimum:number[];maximum:number[];distanceOutside:boolean;}

/** Numeric path of 0x100720dd0. Diagnostics are disabled. Each sphere is
 * world xyz/radius. Status zero discards; 0xffffffff keeps. Disabled/no-camera
 * queries preserve the caller's status snapshot unless initialize is true.
 * CPU reciprocal/MAX capabilities remain explicit. Original heap/resource,
 * camera preparation, debug drawing and hardware behavior are not inferred.
 */
export function queryVisibilitySpheres(state:VisibilitySphereState,spheres:Float32Array,count:number,output:Uint32Array|null,initialize:boolean,reciprocal:VisibilityReciprocal,maximum:(a:number,b:number)=>number):void {
  queryVisibilityViewBounds(state,count,output,initialize,reciprocal,maximum,(index,view)=>{
    if(spheres.length<count*4)throw new Error('Visibility sphere source range');
    const at=index*4,x=spheres[at],y=spheres[at+1],z=spheres[at+2],r=spheres[at+3];
    const dot=(row:number)=>add(add(add(mul(x,view[row]),mul(y,view[row+4])),mul(z,view[row+8])),view[row+12]);
    const center=[dot(0),dot(1),dot(2)],limit=add(r,Math.fround(state.distanceLimit));
    const squared=add(mul(center[2],center[2]),add(mul(center[1],center[1]),mul(center[0],center[0])));
    return {minimum:center.map(v=>sub(v,r)),maximum:center.map(v=>add(v,r)),distanceOutside:daz(mul(limit,limit))<daz(squared)};
  });
}

/** Shared original sphere/AABB screen projection and tiled-depth instructions.
 * Bounding volumes must be prepared by their own original view transforms. */
export function queryVisibilityViewBounds(state:VisibilitySphereState,count:number,output:Uint32Array|null,initialize:boolean,reciprocal:VisibilityReciprocal,maximum:(a:number,b:number)=>number,bounds:(index:number,view:Float32Array)=>VisibilityViewBounds):void {
  if(!Number.isSafeInteger(count)||count<0||count>0xffffffff)throw new Error('Visibility sphere count');
  if(!count||!output)return;
  if(output.length<count)throw new Error('Visibility sphere status range');
  if(state.disabled||!state.camera||(!state.mips.length&&!state.frustumOnly)) {
    if(initialize)output.fill(0xffffffff,0,count);
    return;
  }
  const view=Float32Array.from(state.camera.view),projection=Float32Array.from(state.camera.projection);
  if(view.length!==16||projection.length!==16)throw new Error('Visibility sphere camera matrices');
  if(state.mips.length>20)throw new Error('Visibility sphere mip count');
  for(const mip of state.mips) {
    if(!Number.isInteger(mip.width)||!Number.isInteger(mip.height)||mip.width<2||mip.height<2||mip.width%2||mip.height%2||!Number.isSafeInteger(mip.offset)||mip.offset<0||mip.offset+mip.width*mip.height>state.depth.length)throw new Error('Visibility sphere depth snapshot range');
  }
  const refine=(v:number,negative:boolean)=>{
    let r=reciprocal.rcp(v);
    // The near and far instructions use different signs of the denominator.
    r=mul(r,negative?add(mul(r,-v),2):sub(2,mul(r,v)));
    return mul(r,negative?add(mul(r,-v),2):sub(2,mul(r,v)));
  };
  const uintFloat=(v:number)=>{
    const low=fromBits((v&0xffff)|0x4b000000),high=fromBits((v>>>16)|0x53000000);
    return add(low,add(high,fromBits(0xd3000080)));
  };
  const cvt=(v:number)=>{v=daz(v);return Number.isFinite(v)&&v>=-0x80000000&&v<0x80000000?Math.trunc(v)|0:-0x80000000;};
  for(let base=0;base<count;base+=4) {
    const lanes=Array.from({length:4},(_,lane)=>{
      const volume=bounds(Math.min(base+lane,count-1),view);
      const [xm,ym,zm]=volume.minimum,[xp,yp,zp]=volume.maximum;
      const pxp=mul(projection[0],xp),pxm=mul(projection[0],xm),pyp=mul(projection[5],yp),pym=mul(projection[5],ym);
      const outside=daz(zm)>0||daz(pxp)<daz(zm)||daz(pyp)<daz(zm)||daz(-zm)<daz(pxm)||daz(-zm)<daz(pym)||volume.distanceOutside;
      const near=daz(zp)>0;
      if(state.frustumOnly)return {outside,near};
      const farR=refine(-zp,true),nearR=refine(-zm,false);
      const xmax=mul(pxp,daz(xp)<0?nearR:farR),xmin=mul(pxm,daz(xm)<0?farR:nearR);
      const ymax=mul(pyp,daz(yp)<0?nearR:farR),ymin=mul(pym,daz(ym)<0?farR:nearR);
      const depth=mul(add(mul(zp,projection[10]),projection[14]),farR);
      const extent=maximum(mul(uintFloat(state.mips[0].width),sub(xmax,xmin)),mul(uintFloat(state.mips[0].height),sub(ymax,ymin)));
      return {outside,near,xmin,xmax,ymin,ymax,depth,exponent:(bits(extent)|0)>>23};
    });
    // Original VPADDQ adds paired 64-bit words, rather than four int32 lanes.
    // Preserve its carry from each even lane into the following odd lane.
    const mipIndices=lanes.map((lane,i)=>{
      const exponent=lane.exponent??0;
      const level=i%2?(exponent-130+(((lanes[i-1].exponent??0)>>>0)>=129?1:0))|0:(exponent-129)|0;
      return Math.min(Math.max(level,0),state.mips.length-1);
    });
    for(let i=0;i<4&&base+i<count;i++) {
      const lane=lanes[i];
      if(lane.outside||lane.near){output[base+i]=lane.near&&!lane.outside?0xffffffff:0;continue;}
      if(state.frustumOnly){output[base+i]=0xffffffff;continue;}
      const mip=state.mips[mipIndices[i]];
      const coordinate=(v:number,logical:number,stored:number)=>Math.max(Math.min(cvt(mul(logical,add(mul(v,0.5),0.5))),stored-1),0);
      const xmin=coordinate(lane.xmin!,mip.logicalWidth,mip.width),xmax=coordinate(lane.xmax!,mip.logicalWidth,mip.width);
      const ymin=coordinate(lane.ymin!,mip.logicalHeight,mip.height),ymax=coordinate(lane.ymax!,mip.logicalHeight,mip.height);
      const accum=[0,0,0,0];
      for(let y=ymin&0x7ffffffe;y<=(ymax&0x7ffffffe);y+=2)for(let x=xmin&0x7ffffffe;x<=(xmax&0x7ffffffe);x+=2) {
        const at=mip.offset+(y>>>1)*mip.width*2+x*2;
        for(let k=0;k<4;k++)if(x+(k&1)>=xmin&&x+(k&1)<=xmax&&y+(k>>>1)>=ymin&&y+(k>>>1)<=ymax)accum[k]=maximum(accum[k],state.depth[at+k]);
      }
      const max=maximum(maximum(accum[1],accum[0]),maximum(accum[3],accum[2]));
      output[base+i]=daz(max)>=daz(lane.depth!)?0xffffffff:0;
    }
  }
}
