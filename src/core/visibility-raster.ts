import { visibilityAdd as add, visibilitySub as sub, visibilityMul as mul, visibilityRound, visibilityDaz } from './visibility-float';
import type { VisibilityReciprocal } from './visibility-transform';

export interface VisibilityTriangleSelection {triangles:Uint32Array;count:number;}
export const qemuVisibilityMin=(a:number,b:number):number=>visibilityDaz(a)<visibilityDaz(b)?a:b;
const intAdd=(a:number,b:number)=>(a+b)|0;
const intSub=(a:number,b:number)=>(a-b)|0;
function convert(value:number):number {
  value=visibilityDaz(value);
  return !Number.isFinite(value)||value>=0x80000000||value< -0x80000000 ? -0x80000000 : Math.trunc(value)|0;
}

/** Original complete 0x10071ee60 body, excluding stack-cookie bookkeeping.
 * Raster buffer uses four lanes per 2x2 tile. Only floor(indexCount/12)*12
 * indices are visited; there is no scalar triangle tail. Explicit snapshots
 * include guard words, original list count/capacity and CPU reciprocal/MIN.
 * The nullable selected list controls the mixed-depth diversion, not clipping.
 */
export function rasterVisibilityTriangles(depth:Float32Array,width:number,height:number,vertices:Float32Array,indices:Uint16Array,indexCount:number,selection:VisibilityTriangleSelection|null,reciprocal:VisibilityReciprocal,minimum:(a:number,b:number)=>number):void {
  const guard=Math.max(32,height%2?width+(width%2?2:0):0);
  if(!Number.isInteger(width)||!Number.isInteger(height)||width<1||height<1||!Number.isSafeInteger(width*height)||depth.length<width*height+guard)throw new Error('Visibility raster buffer range');
  if(!Number.isInteger(indexCount)||indexCount<0||indexCount>indices.length||vertices.length%4)throw new Error('Visibility triangle range');
  if(selection&&(!Number.isInteger(selection.count)||selection.count<0||selection.count>selection.triangles.length))throw new Error('Visibility selection range');
  const visited=Math.floor(indexCount/12)*12;
  for(let i=0;i<visited;i++)if(indices[i]*4+3>=vertices.length)throw new Error('Visibility vertex index');
  for(let index=0;index<visited;index+=3) {
    const ids=[indices[index]*4,indices[index+1]*4,indices[index+2]*4];
    const x=ids.map(i=>convert(add(vertices[i],0.5))),y=ids.map(i=>convert(add(vertices[i+1],0.5))),z=ids.map(i=>vertices[i+2]);
    const minX=Math.max(0,Math.min(...x))&-2,maxX=Math.min(width,intAdd(Math.max(...x),1));
    const minY=Math.max(0,Math.min(...y))&-2,maxY=Math.min(height,intAdd(Math.max(...y),1));
    if(maxX<=minX||maxY<=minY)continue;
    if(selection&&!z.every(v=>visibilityDaz(v)>0)) {
      if(z.some(v=>visibilityDaz(v)>0)&&selection.count<selection.triangles.length)selection.triangles[selection.count++]=index/3;
      continue;
    }
    const dy20=intSub(y[2],y[0]),dy01=intSub(y[0],y[1]),dy12=intSub(y[1],y[2]);
    const dx02=intSub(x[0],x[2]),dx10=intSub(x[1],x[0]),dx21=intSub(x[2],x[1]);
    const area=intSub(Math.imul(dx10,dy20),Math.imul(dx02,dy01));
    if(area<=0)continue;
    const fArea=visibilityRound(area);
    let r=reciprocal.rcp(fArea);r=mul(r,sub(2,mul(fArea,r)));r=mul(r,sub(2,mul(fArea,r)));
    const slope1=mul(sub(z[1],z[0]),r),slope2=mul(sub(z[2],z[0]),r);
    const c0=intSub(Math.imul(x[0],y[1]),Math.imul(x[1],y[0]));
    const c1=intSub(Math.imul(x[2],y[0]),Math.imul(x[0],y[2]));
    const c2=intSub(Math.imul(x[1],y[2]),Math.imul(x[2],y[1]));
    const e0:number[]=[],e1:number[]=[],e2:number[]=[];
    for(let lane=0;lane<4;lane++) {
      const px=minX+(lane&1),py=minY+(lane>>>1);
      e0.push(intAdd(intAdd(Math.imul(py,dx10),c0),Math.imul(px,dy01)));
      e1.push(intAdd(intAdd(Math.imul(py,dx02),c1),Math.imul(px,dy20)));
      e2.push(intAdd(intAdd(Math.imul(py,dx21),c2),Math.imul(px,dy12)));
    }
    const stepX=add(mul(visibilityRound(intAdd(dy20,dy20)),slope1),mul(visibilityRound(intAdd(dy01,dy01)),slope2));
    for(let py=minY;py<maxY;py+=2) {
      const a=e0.slice(),b=e1.slice(),c=e2.slice();
      const values=b.map((v,lane)=>add(add(mul(visibilityRound(v),slope1),z[0]),mul(visibilityRound(a[lane]),slope2)));
      for(let px=minX;px<maxX;px+=2) {
        const offset=py*width+px*2;
        if(offset<0||offset+4>depth.length)throw new Error(`Visibility raster write ${offset} outside ${depth.length} words (${width}x${height}, ${px}/${py}, bbox ${minX}/${maxX}/${minY}/${maxY})`);
        for(let lane=0;lane<4;lane++) {
          if((a[lane]|b[lane]|c[lane])>0) {
            const old=depth[offset+lane],next=minimum(values[lane],old);
            // Retain forwarded buffer NaN payloads and signed-zero bits.
            if(!Object.is(next,old))depth[offset+lane]=next;
          }
          a[lane]=intAdd(a[lane],intAdd(dy01,dy01));b[lane]=intAdd(b[lane],intAdd(dy20,dy20));c[lane]=intAdd(c[lane],intAdd(dy12,dy12));
          values[lane]=add(stepX,values[lane]);
        }
      }
      for(let lane=0;lane<4;lane++) {
        e0[lane]=intAdd(e0[lane],intAdd(dx10,dx10));e1[lane]=intAdd(e1[lane],intAdd(dx02,dx02));e2[lane]=intAdd(e2[lane],intAdd(dx21,dx21));
      }
    }
  }
}
