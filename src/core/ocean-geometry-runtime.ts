/** Original Ocean's 96 by 96 camera projection/sphere intersection grid,
 * 0x1004d67d0. Camera vectors, libm and RSQRTSS are caller services. GPU buffer
 * mapping/queuing and the surrounding Ocean.Update remain separate owners. */
export interface OceanGeometryInput {
 eye:number[];sphere:number[];axis:number[];planeU:number[];planeV:number[];planeOrigin:number[];tanHalfFov:number;
}
export interface OceanGeometryMath {
 rsqrt(value:number):number;asin(value:number):number;sincos(value:number):{sin:number;cos:number};pow(value:number,exponent:number):number;
}
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b),div=(a:number,b:number)=>f(a/b);
const dot=(a:number[],b:number[])=>add(mul(a[2],b[2]),add(mul(a[0],b[0]),mul(a[1],b[1])));
const plus=(a:number[],b:number[])=>a.map((n,i)=>add(n,b[i])),minus=(a:number[],b:number[])=>a.map((n,i)=>sub(n,b[i])),times=(a:number[],s:number)=>a.map(n=>mul(n,s));
const min=(a:number,b:number)=>a<b?a:b,max=(a:number,b:number)=>a>b?a:b;
export function buildOriginalOceanGeometry(input:OceanGeometryInput,math:OceanGeometryMath){
 const eye=[...input.eye.slice(0,3),1].map(f),sphere=input.sphere.map(f),center=[...sphere.slice(0,3),0],radius=sphere[3];
 let u=[...input.planeU.slice(0,3),0].map(f),v=[...input.planeV.slice(0,3),0].map(f),origin=[...input.planeOrigin.slice(0,3),0].map(f);
 const axis=[...input.axis.slice(0,3),0].map(f),towardsCenter=minus(center,eye),square=dot(towardsCenter,towardsCenter);
 const halfAngle=mul(f(math.asin(div(radius,f(Math.sqrt(square))))),.5),q=math.sincos(halfAngle),qv=times(axis,f(q.sin)),qw=f(q.cos);
 const normalize=(vector:number[])=>{const length=dot(vector,vector),r=f(math.rsqrt(length)),half=length===0?0:mul(length,.5),refined=mul(r,sub(1.5,mul(r,mul(r,half))));return times(vector,refined);};
 const d=normalize(towardsCenter),[x,y,z]=d,[qx,qy,qz]=qv;
 // Quaternion product order is retained from the original SIMD/scalar body.
 const t=add(mul(qz,z),add(mul(qx,x),mul(qy,y))),
  a=sub(add(mul(qw,y),mul(qz,x)),mul(qx,z)),
  b=sub(add(mul(qw,x),mul(qy,z)),mul(qz,y)),
  c=sub(add(mul(qw,z),mul(qx,y)),mul(qy,x));
 const rotated=[add(mul(qy,c),sub(add(mul(qx,t),mul(qw,b)),mul(qz,a))),
  add(mul(qz,b),sub(add(mul(qy,t),mul(qw,a)),mul(qx,c))),
  add(mul(qx,a),sub(add(mul(qw,c),mul(qz,t)),mul(qy,b))),0];
 const midpoint=plus(plus(origin,u.map((n,i)=>mul(n,i===3?0:.5))),v.map((n,i)=>mul(n,i===3?0:.5))),denominator=dot(midpoint,rotated),projected=minus(rotated.map(n=>div(n,denominator)),midpoint);
 const horizon=div(dot(projected,v),dot(v,v));
 // The original height estimate uses double precision here, independently
 // of the float dot products used for ray/sphere intersection below.
 const height=min(100,max(1,f(eye[1]+radius-Math.sqrt(radius*radius-eye[0]*eye[0]+eye[2]*eye[2]))));
 const padding=div(1,mul(height,f(input.tanHalfFov))),xpad=mul(padding,f(.05)),ypad=mul(padding,f(.3));
 origin=minus(minus(origin,times(u,xpad)),times(v,ypad));u=times(u,add(add(xpad,xpad),1));
 const upper=min(add(mul(ypad,f(.2)),1),add(horizon,.5));v=times(v,add(ypad,upper));
 const doubleC=f((eye[0]-sphere[0])**2+(eye[1]-sphere[1])**2+(eye[2]-sphere[2])**2-radius*radius),distance=f(Math.sqrt(sub(square,mul(radius,radius))));
 const vertices=new Uint8Array(96*96*16).fill(0xa5),view=new DataView(vertices.buffer);let lastHit=0,rows=0;
 for(let row=0;row<96;row++){
  if(height<100&&lastHit<row)break;
  const rowOffset=times(v,mul(mul(f(math.pow(div(f(row),95),f(.75))),95),f(1/95)));
  for(let column=0;column<96;column++){
   const ray=plus(plus(times(u,mul(f(column),f(1/95))),origin),rowOffset),aa=dot(ray,ray),bb=dot(minus(eye,center),ray),disc=sub(mul(bb,bb),mul(aa,doubleC));
   let position:number[],color:number[]=[0,0,0,0];
   if(disc>=0&&f(Math.sqrt(disc))>=bb){
    lastHit=max(lastHit,row+1);position=plus(eye,times(ray,div(-add(bb,f(Math.sqrt(disc))),aa)));color=[0,127,0,0];
   }else position=plus(center,times(normalize(minus(plus(eye,times(ray,distance)),center)),radius));
   const offset=(row*96+column)*16;view.setFloat32(offset,position[0],true);view.setFloat32(offset+4,min(0,add(position[1],f(.1))),true);view.setFloat32(offset+8,position[2],true);
   color.forEach((n,i)=>{vertices[offset+12+i]=n&255;});
  }rows=row+1;
 }
 const indexCount=Math.min(95,lastHit)*570,indices=new Uint32Array(indexCount);let at=0;
 for(let row=0;row<Math.min(95,lastHit);row++)for(let col=0;col<95;col++){const a=row*96+col;indices.set([a,a+1,a+96,a+1,a+97,a+96],at);at+=6;}
 return {vertices,indices,indexCount,rows,lastHit,height,projection:{u,v,origin,doubleC,distance}};
}
