import type {ModelBakeMemory,ModelBakeArithmeticServices} from './model-baked-runtime';
import {NativeModelBakeArithmeticBoundary} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value,truncateOriginalFloatToInt} from './object-numeric-runtime';

const nan=(n:number)=>(n&0x7fffffff)>0x7f800000;
function arithmetic(s?:ModelBakeArithmeticServices){
 const calc=(op:'add'|'sub'|'mul'|'div',a:number,b:number):number=>{
  if(nan(a)&&nan(b)&&a!==b){if(s)return s.resolveDualNaN(op,a,b);throw new NativeModelBakeArithmeticBoundary(op,a,b);}
  if(nan(a))return(a|0x400000)>>>0;if(nan(b))return(b|0x400000)>>>0;
  const x=value(a),y=value(b),r=op==='add'?x+y:op==='sub'?x-y:op==='mul'?x*y:x/y;
  return Number.isNaN(r)?0xffc00000:bits(r);
 };
 return{add:(a:number,b:number)=>calc('add',a,b),sub:(a:number,b:number)=>calc('sub',a,b),mul:(a:number,b:number)=>calc('mul',a,b),div:(a:number,b:number)=>calc('div',a,b),sqrt:(a:number)=>nan(a)?(a|0x400000)>>>0:value(a)<0?0xffc00000:bits(Math.sqrt(value(a)))};
}
export interface BeamoSpatialServices {
 arithmetic?:ModelBakeArithmeticServices;
 /** Original virtual +0x18 ABI: output first, object second. */
 getTransform(out:bigint,object:bigint,vptr:bigint):void;
 /** Imported powf input/output bit patterns. macOS libm is a separate capability. */
 powf(inputBits:number,exponentBits:number):number;
 collisionScale(object:bigint,vptr:bigint):number;
 registerCollision(owner:bigint,geometryId:number,matrix:bigint,descriptor:bigint,callback:bigint):bigint;
}
/** Whole original color conversion 0x10077d4b0: three powf calls and untouched
 * alpha bits. Input is captured before any call, including aliased output. */
export function convertOriginalBeamoCollisionColor(m:ModelBakeMemory,out:bigint,color:bigint,exponent:number,s:Pick<BeamoSpatialServices,'powf'|'arithmetic'>){
 const input=[0,1,2,3].map(i=>m.read32(color+BigInt(i*4))),a=arithmetic(s.arithmetic);
 const clamped=value(exponent)>value(0x00800000)?exponent:0x00800000,power=a.div(0x3f800000,clamped);
 const result=input.slice(0,3).map(n=>s.powf(n,power));result.push(input[3]);
 result.forEach((n,i)=>m.write32(out+BigInt(i*4),n));
}
/** Barn.Load 0x10019579b..0x100195bc5, after resolved Mesh/bake selection.
 * The live loader context retains original min/max W scratch lanes; no guessed
 * padding is supplied. Table/Beamo pointers reload after GetTransform, while
 * collision writes keep the cached record even if later services change them.
 * CollisionGeo registration and virtual/imported operations remain services.
 * This generates the sphere consumed by uploadOriginalBeamoBarn on the same
 * record address; it does not perform resource IO or synthesize a Model. */
export function prepareOriginalBeamoSpatialRecord(m:ModelBakeMemory,context:bigint,recordOffset:bigint,s:BeamoSpatialServices){
 const read=(a:bigint)=>Array.from({length:4},(_,i)=>m.read32(a+BigInt(i*4))),store=(a:bigint,v:number[])=>v.forEach((n,i)=>m.write32(a+BigInt(i*4),n));
 const a=arithmetic(s.arithmetic),initial=m.read64(context+0x20n)+recordOffset,lod=m.read64(m.read64(initial+0x18n)+0x48n);
 store(context+0x80n,[m.read32(lod+12n),0,0,0]);store(context+0x70n,[m.read32(lod+4n),m.read32(lod+8n),0,0]);
 store(context+0xd0n,[m.read32(lod+16n),m.read32(lod+20n),m.read32(lod+24n),0]);
 const object=m.read64(m.read64(context+0x30n)),temporary=context+0x140n;
 s.getTransform(temporary,object,m.read64(object));
 const min=[m.read32(context+0x70n),m.read32(context+0x74n),m.read32(context+0x80n),m.read32(context+0xccn)],max=read(context+0xd0n);max[3]=m.read32(context+0xbcn);
 const record=m.read64(context+0x20n)+recordOffset,matrix=Array.from({length:4},(_,i)=>read(temporary+BigInt(i*16)));
 matrix.forEach((v,i)=>store(record+0x30n+BigInt(i*16),v));
 const delta=max.map((v,i)=>a.sub(v,min[i]));
 const diagonal=Array.from({length:4},(_,i)=>a.add(a.add(a.mul(delta[0],matrix[0][i]),a.mul(delta[1],matrix[1][i])),a.mul(delta[2],matrix[2][i]))),square=diagonal.map(v=>a.mul(v,v));
 const radius=a.mul(a.sqrt(a.add(a.add(square[0],square[2]),a.add(square[1],square[3]))),0x3f000000);
 m.write32(record+0xb0n,radius);store(context+0xc0n,min);store(context+0xb0n,max);
 const half=[0x3f000000,0x3f000000,0x3f000000,0],center=min.map((v,i)=>a.mul(a.add(v,max[i]),half[i]));center[3]=0x3f800000;
 const extent=delta.map((v,i)=>a.mul(v,half[i])),axes=[[0x3f800000,0,0,0],[0,0x3f800000,0,0],[0,0,0x3f800000,0]];
 const local=axes.map((axis,i)=>axis.map(v=>a.mul(extent[i],v))).concat([center]);
 local.forEach((v,i)=>store(context+0xe0n+BigInt(i*16),v));
 const world=local.map((column,col)=>Array.from({length:4},(_,row)=>{
  // Operand order also matters when distinct NaN payloads reach the service.
  const p=column.map((v,i)=>i===0||(col===3&&i<3)?a.mul(matrix[i][row],v):a.mul(v,matrix[i][row]));
  return col===0?a.add(a.add(a.add(p[0],p[1]),p[2]),p[3]):a.add(p[3],a.add(p[2],a.add(p[0],p[1])));
 }));
 world.forEach((v,i)=>store(temporary+BigInt(i*16),v));world.forEach((v,i)=>store(record+0x70n+BigInt(i*16),v));
 const beamo=m.read64(context+8n),accepted=m.read32(context+0x68n)&255;
 if(beamo){
  let distance=m.read32(beamo+0x98n);
  if(value(distance)<=0){distance=a.mul(0x42855555,m.read32(record+0xb0n));distance=a.add(distance,distance);m.write32(beamo+0x98n,distance);}
  m.write32(record+0xb4n,value(m.read32(beamo+0xa8n))!==0?distance:0x7f7fffff);
 }
 if(!m.bytes(record+0xbcn,1)[0])return record;
 const handle=m.read64(context+0x90n),resource=handle?m.read64(handle+0x10n):0n;
 if(!resource)throw new NativeObjectFoundationFailure('./Mesh.h',110,3,'Observed()');
 const geometry=m.read32(resource+0x110n);m.bytes(temporary,48).fill(0);m.write64(temporary+0x30n,0x3f800000ffffffffn);
 if(accepted){m.write64(temporary,m.read64(m.read64(m.read64(record+0x20n)+0x28n)+8n));m.write64(temporary+8n,0xc0000001cn);}
 convertOriginalBeamoCollisionColor(m,context+0xe0n,m.read64(record+0xd8n)+0xd0n,0x400ccccd,s);
 m.write32(context+8n,geometry);
 const color=read(context+0xe0n).map(n=>{const scaled=a.mul(0x437f0000,n),lower=value(scaled)>0?scaled:0,upper=value(lower)<255?lower:0x437f0000;return truncateOriginalFloatToInt(upper)&255;});
 m.write32(record+0xf8n,color[0]|color[1]<<8|color[2]<<16|color[3]<<24);
 let material=m.read64(record+0xd8n);m.write64(temporary+0x20n,material+0x21n);m.write64(temporary+0x28n,0x19n);
 if(m.bytes(material+0x20n,1)[0]){m.write64(temporary+0x10n,record+0xf8n);m.write64(temporary+0x18n,0x1cn);}
 m.write32(temporary+0x30n,2);
 const scaleObject=m.read64(m.read64(context+0x30n));m.write32(temporary+0x34n,s.collisionScale(scaleObject,m.read64(scaleObject)));
 m.write64(record+0xc0n,record);const callback=m.bytes(record+0xc8n,7);callback[0]=1;callback[1]=0;callback[2]=1;callback[5]=1;callback[6]=1;
 material=m.read64(record+0xd8n);callback[3]=m.bytes(material+0x22n,1)[0];callback[4]=m.bytes(material+0x23n,1)[0];
 const instance=s.registerCollision(m.read64(context+0x58n),m.read32(context+8n),record+0x30n,temporary,record+0xc0n);m.write64(record+0xd0n,instance);
 return record;
}
