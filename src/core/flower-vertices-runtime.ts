import type {ModelBakeMemory} from './model-baked-runtime';
import {itemFloatBytes,itemFloats,itemView} from './item-effect-arithmetic';

const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
/** Original integer noise shared by FlowerBarn's distribution and attributes. */
export function originalFlowerNoise(seed:number){
 const n=(seed<<13)^seed;
 return (Math.imul(n,Math.imul(Math.imul(n,n),0x3d73)+0xc0ae5)+0x5208dd0d)&0x7fffffff;
}
const signedNoise=(seed:number)=>sub(1,mul(f(originalFlowerNoise(seed)),2**-30));
const unitNoise=(seed:number)=>mul(add(signedNoise(seed),1),.5);
const polynomial=(n:number)=>(Math.imul(n,Math.imul(Math.imul(n,n),0x3d73)+0xc0ae5)+0x5208dd0d)&0x7fffffff;
export interface FlowerGroundHit {distance:number;triangle:number;mesh:bigint;}
export interface FlowerVertexServices {
 contains(point:number[],region:bigint):boolean;
 trace(origins:number[][],direction:number[],distance:number,options:Uint8Array):FlowerGroundHit[];
 material(mesh:bigint,triangle:number):number;
 normal(mesh:bigint,triangle:number):number[];
 lighting(mesh:bigint,triangle:number):Uint8Array;
 defaultUserByte():number;
}
/** Whole normal FlowerBarn.GenerateVertices 0x100350c40. The actual ground
 * collision/material/normal/light services remain supplied by their owner.
 * No guessed plane, random replacement distribution or fallback material. */
export function generateOriginalFlowerVertices(m:ModelBakeMemory,barn:bigint,cluster:bigint,sphere:bigint,
 outputs:readonly bigint[],success:Uint8Array,count:number,seed:number,instant:boolean,s:FlowerVertexServices){
 if(!Number.isInteger(count)||count<0||count>1024||outputs.length<count||success.length<count)throw new Error('Original flower candidate batch invalid');
 success.fill(0,0,count);
 const read=(p:bigint)=>itemView(m.bytes(p,4)).getFloat32(0,true),v=itemFloats(m.bytes(sphere,16));
 const density=read(cluster),groups=Array.from({length:4},()=>[] as {index:number;patch:bigint;origin:number[]}[]);
 const first=barn+0xed0n+BigInt(m.bytes(cluster+10n,1)[0])*0x110n,patchCount=m.bytes(cluster+14n,1)[0];
 const patchAt=(i:number)=>barn+0xed0n+BigInt(m.bytes(cluster+10n+BigInt(i),1)[0])*0x110n;
 for(let i=0;i<count;i++){
  const k=(seed+i)|0,base=Math.imul(k,10),hashSeed=(Math.imul(k,81920)^base)|0;
  let next=(base|1)+1;
  let z=add(v[2],add(mul(unitNoise(base|1),v[3]),mul(sub(unitNoise(base|1),1),v[3])));
  // The first x noise is computed from (k<<14)*5 XOR k*10, i.e. the
  // pre-xorshift seed. Use the polynomial directly rather than hash twice.
  const u=mul(add(sub(1,mul(f(polynomial(hashSeed)),2**-30)),1),.5);
  let px=add(v[0],add(mul(sub(u,1),v[3]),mul(u,v[3]))),patch=first;
  if(patchCount>=2){const threshold=mul(unitNoise(next),density);next=(base|1)+2;
   let accumulated=read(first+0x70n);
   if(!(accumulated>threshold))for(let j=1;j<patchCount;j++){patch=patchAt(j);if(j+1>=patchCount)break;accumulated=add(accumulated,read(patch+0x70n));if(accumulated>threshold)break;}
  }else next=(base|1)+1;
  const origin=[px,v[1],z,0],shape=m.read32(patch+0x7cn);
  if(shape===1){const matrix=itemFloats(m.bytes(patch+0xd0n,64)),local=[0,1,2].map(lane=>add(add(add(mul(px,matrix[lane]),mul(v[1],matrix[4+lane])),mul(z,matrix[8+lane])),matrix[12+lane]));
   const length=add(add(mul(local[0],local[0]),mul(local[1],local[1])),mul(local[2],local[2]));if(!(1>=length))continue;
  }else if(shape===2&&!s.contains(origin,patch+0x90n))continue;
  const jitter=read(patch+0x74n);if(jitter>0){px=add(px,mul(signedNoise(next),jitter));z=add(z,mul(signedNoise(next+1),jitter));origin[0]=px;origin[2]=z;}
  origin[1]=add(origin[1],2);
  const cell=(n:number,center:number)=>{const normalized=f(sub(add(n,v[3]),center)/add(v[3],v[3])),lane=add(normalized,normalized);if(!Number.isFinite(lane))return 0;return Math.min(1,Math.max(0,Math.trunc(lane)));};
  const group=groups[cell(px,v[0])|cell(z,v[2])<<1];if(group.length===256)throw new Error('Original flower quadrant capacity exceeded');group.push({index:i,patch,origin});
 }
 const options=Uint8Array.from([1,0,0,0,0x8f,0xff,0xff,0xff,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
 const hits=groups.map(group=>{const hit=s.trace(group.map(c=>c.origin),[0,-1,0,0],4,options);if(hit.length!==group.length)throw new Error('Original flower ground batch size differs');return hit;});
 for(let group=0;group<4;group++)for(let j=0;j<groups[group].length;j++){
  const candidate=groups[group][j],hit=hits[group][j],{patch,index,origin}=candidate;
  if(!hit.mesh)continue;const collision=m.read64(hit.mesh+0x1d0n);if(!collision||m.bytes(collision+8n,1)[0]&1)continue;
  if(s.material(hit.mesh,hit.triangle)!==m.bytes(patch+0x84n,1)[0])continue;
  const y=add(origin[1],mul(hit.distance,-1)),normal=s.normal(hit.mesh,hit.triangle),light=s.lighting(hit.mesh,hit.triangle);
  if(normal.length<3||light.length!==8)throw new Error('Original flower ground normal/light unavailable');
  const k=(seed+index)|0,base=Math.imul(k,10);
  const colorU=mul(add(sub(1,mul(f(polynomial(Math.imul(k,81920)^base)),2**-30)),1),.5),sizeU=unitNoise(base|1),heightU=unitNoise((base|1)+1);
  const colorMin=itemFloats(m.bytes(patch+0x40n,16)),colorMax=itemFloats(m.bytes(patch+0x50n,16));
  const size=add(mul(read(patch+0x64n),sizeU),mul(read(patch+0x60n),sub(1,sizeU))),height=add(mul(read(patch+0x68n),sub(1,heightU)),mul(read(patch+0x6cn),heightU));
  const out=m.bytes(outputs[index],32);out.set(itemFloatBytes([origin[0],y,origin[2]]));
  for(let lane=0;lane<3;lane++){out[12+lane]=Math.trunc(Math.min(127,Math.max(-128,mul(normal[lane],normal[lane]>=0?127:128))));out[16+lane]=Math.trunc(Math.min(255,Math.max(0,mul(add(mul(colorU,colorMax[lane]),mul(sub(1,colorU),colorMin[lane])),255))));}
  out[15]=m.read32(patch+0x80n)?127:0;out[19]=instant?255:0;out[20]=s.defaultUserByte();
  out[21]=Math.trunc(mul(Math.min(1,Math.max(0,add(mul(size,.5),height))),255));out[22]=Math.trunc(mul(Math.min(1,Math.max(0,size)),255));out[23]=0;out.set(light,24);success[index]=1;
 }
}
