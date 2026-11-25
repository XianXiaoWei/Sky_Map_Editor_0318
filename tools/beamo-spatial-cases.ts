import {prepareOriginalBeamoSpatialRecord} from '../src/core/beamo-spatial-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const BEAMO_SPATIAL_BASE=0x360000000n;
export interface BeamoSpatialCase {label:string;matrix:string;boundsBits:number[];distanceBits:number;enableBits:number;decal?:boolean;decalDistanceBits?:number;collision?:number;baked?:number;colorBits?:number[];materialFlags?:number[];geometryId?:number;resourceMissing?:number;minW?:number;maxW?:number;flags?:number;recordIndex?:number;scaleBits?:number;returnPointer?:string;}
export function prepareBeamoSpatial(c:BeamoSpatialCase){
 const b=Buffer.alloc(0x4000,0xa5),base=BEAMO_SPATIAL_BASE,at=(a:bigint)=>Number(a-base);
 const m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 const u=(off:number,n:number)=>m.write32(base+BigInt(off),n),p=(off:number,n:number)=>m.write64(base+BigInt(off),base+BigInt(n)),offset=(c.recordIndex??0)*384;
 for(const table of [0x100,0x400]){const r=table+offset;p(r+8,0x1000);m.write64(base+BigInt(r+0x10),c.decal?0n:base+0x1000n);p(r+0x18,0x1780);p(r+0x20,0x2800);p(r+0xd8,0x2400);u(r+0xb4,c.decalDistanceBits??0x42c80000);b[r+0xbc]=c.collision??0;}
 for(const object of [0x1000,0x1200]){p(object,0x3e00);Buffer.from(c.matrix,'base64').copy(b,object+0x10);u(object+0x98,c.distanceBits);u(object+0xa8,c.enableBits);u(object+0xb0,c.scaleBits??0x3f800000);}
 p(0x17c8,0x1800);c.boundsBits.forEach((n,i)=>u(0x1804+i*4,n));p(0x2200+0x10,0x2000);u(0x2110,c.geometryId??73);
 for(const mat of [0x2400,0x2600]){b[mat+0x20]=c.materialFlags?.[0]??1;b[mat+0x22]=mat===0x2400?c.materialFlags?.[1]??3:7;b[mat+0x23]=mat===0x2400?c.materialFlags?.[2]??4:8;(c.colorBits??[0x3f000000,0x3e800000,0x3f800000,0x3f800000]).forEach((n,i)=>u(mat+0xd0+i*4,n));}
 p(0x2828,0x2900);p(0x2908,0x2a00);m.write64(base+0x3008n,c.decal?0n:base+0x1000n);p(0x3020,0x100);p(0x3030,0x100+offset+8);p(0x3058,0x2b00);u(0x3068,c.baked??0);
 m.write64(base+0x3090n,c.resourceMissing===1?0n:base+0x2200n);if(c.resourceMissing===2)m.write64(base+0x2210n,0n);u(0x30cc,c.minW??0);u(0x30bc,c.maxW??0);u(0x3d00,c.flags??0);m.write64(base+0x3d08n,BigInt(offset));m.write64(base+0x3d10n,BigInt(c.returnPointer??'0x360002c00'));m.write64(base+0x3e18n,0x100197ab0n);m.write64(base+0x3e40n,0x1001987d0n);
 return{b,m,base,offset:BigInt(offset)};
}
export function evaluateBeamoSpatial(c:BeamoSpatialCase,powf:(x:number,y:number)=>number){
 const {b,m,base,offset}=prepareBeamoSpatial(c),calls:bigint[][]=[],flags=c.flags??0;let line=0,severity=0;
 const call=(kind:number,values:(number|bigint)[])=>{const t=[BigInt(kind),...values.map(BigInt)];calls.push(t);return t;};
 try{prepareOriginalBeamoSpatialRecord(m,base+0x3000n,offset,{
  getTransform:(out,obj,vptr)=>{call(1,[out,obj,vptr]);m.bytes(out,64).set(m.bytes(obj+0x10n,64));if(flags&1)m.write64(base+0x3020n,base+0x400n);if(flags&2)m.write64(base+0x3008n,0n);if(flags&4)m.write64(base+0x3008n,base+0x1200n);if(flags&8)m.write32(base+0x1804n,0x44400000);if(flags&16)m.write32(base+0x30ccn,0x3f800000);},
  powf:(x,y)=>{const r=powf(x,y);call(2,[x,y,r]);return r;},
  collisionScale:(obj,vptr)=>{const result=m.read32(obj+0xb0n);call(3,[obj,vptr,result]);if(flags&32)m.write64(base+0x3020n,base+0x400n);if(flags&64)m.write64(m.read64(base+0x3020n)+offset+0xd8n,base+0x2600n);return result;},
  registerCollision:(owner,id,matrix,descriptor,callback)=>{const t=call(4,[owner,id,matrix,descriptor,callback]);for(let i=0;i<7;i++)t.push(m.read64(descriptor+BigInt(i*8)));for(let i=0;i<2;i++)t.push(m.read64(callback+BigInt(i*8)));for(let i=0;i<8;i++)t.push(m.read64(matrix+BigInt(i*8)));if(flags&128)m.write64(base+0x3020n,base+0x400n);if(flags&256)m.write32(descriptor+0x34n,0x43210000);return m.read64(base+0x3d10n);}
 });}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const trace=Buffer.alloc(12+calls.length*192);trace.writeUInt32LE(line);trace.writeUInt32LE(severity,4);trace.writeUInt32LE(calls.length,8);calls.forEach((t,i)=>t.forEach((n,j)=>trace.writeBigUInt64LE(BigInt.asUintN(64,n),12+i*192+j*8)));
 return Buffer.concat([trace,b]);
}
