import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits,numericFloatValue} from './object-numeric-runtime';
export interface VertexDataMemory {
 bytes(address:bigint,length:number):Uint8Array;
 read32(address:bigint):number;read64(address:bigint):bigint;
 write32(address:bigint,value:number):void;write64(address:bigint,value:bigint):void;
}
export interface VertexListServices {
 variables():bigint;lock(variables:bigint):void;unlock():void;
}
/** Complete normal AutoLister constructor 0x1007f6ca0. Lock internals are
 * independent services; the global and tail are re-read after each mutation. */
export function registerOriginalVertexData(m:VertexDataMemory,entry:bigint,s:VertexListServices):void {
 s.lock(s.variables());let variables=s.variables();
 const checked=(v:bigint)=>{if(!v)throw new NativeObjectFoundationFailure('../../Code/Base/AutoLister.h',56,3,'ms_vars');return v;};
 checked(variables);let previous=m.read64(variables+72n);
 if(previous){m.write64(previous+8n,entry);previous=m.read64(variables+72n);}
 m.write64(entry,previous);variables=s.variables();checked(variables);
 m.write64(variables+72n,entry);m.write64(entry+8n,0n);s.unlock();
}
/** Whole normal 0x1007f5010, the 0x438-byte Vertex.cpp data constructor.
 * It preserves padding and auto-registers its embedded +0x400 list node. */
export function constructOriginalVertexData(m:VertexDataMemory,out:bigint,s:VertexListServices):void {
 for(const at of [0x134,0x150,0x178,0x1a0,0x1c8,0x1f0,0x218,0x250,0x288,0x2c0,0x2f8,0x330,0x368,0x3a0,0x3d8])m.write64(out+BigInt(at),0n);
 for(const at of [0x140,0x160,0x188,0x1b0,0x1d8,0x200,0x228,0x260,0x298,0x2d0,0x308,0x340,0x378,0x3b0,0x3e8])m.write32(out+BigInt(at),0);
 m.bytes(out+0x3f8n,1)[0]=0;
 registerOriginalVertexData(m,out+0x400n,s);
 m.bytes(out,0x134).fill(0);m.bytes(out+0x148n,0x2b0).fill(0);
 const name=m.bytes(out+0x418n,27);name.fill(0);name.set(new TextEncoder().encode('Unnamed'));m.bytes(out+0x433n,1)[0]=0;m.write64(out+0x410n,out);
}
const identity=[[0x3f800000,0,0,0],[0,0x3f800000,0,0],[0,0,0x3f800000,0],[0,0,0,0x3f800000]];
/** Whole 0x1007f5b20 plus its unchanged forwarding entry 0x1007f5d80,
 * the 0x540-byte Vertex.cpp render-data default constructor. Default OBB
 * basis is a caller/global dependency, multiplied before storing any axes. */
export function constructOriginalRenderData(m:VertexDataMemory,out:bigint,defaultMatrix:()=>bigint):void {
 const v=(at:number,values:number[])=>values.forEach((n,i)=>m.write32(out+BigInt(at+i*4),n));
 const w8=(at:number,n:number)=>{m.bytes(out+BigInt(at),1)[0]=n;};
 const w16=(at:number,n:number)=>{w8(at,n&255);w8(at+1,n>>>8);};
 m.write64(out,0n);identity.forEach((axis,i)=>v(16+i*16,axis));
 const matrix=defaultMatrix(),axes=Array.from({length:3},(_,i)=>Array.from({length:4},(_,j)=>{
  const bits=m.read32(matrix+BigInt(i*16+j*4));if(j===3)return 0;
  return (bits&0x7fffffff)>0x7f800000?(bits|0x400000)>>>0:numericFloatBits(numericFloatValue(bits)*numericFloatValue(0x4e6e6b28));
 }));axes.forEach((axis,i)=>v(80+i*16,axis));v(128,identity[3]);
 w16(0x1ec,0x101);w8(0x1ee,0);m.write64(out+0x1f0n,1n);m.write64(out+0x1f8n,1n);m.write64(out+0x200n,0n);
 w16(0x208,0x101);w8(0x20a,0);m.write64(out+0x20cn,1n);m.write64(out+0x214n,1n);m.write64(out+0x21cn,0n);
 w16(0x224,0x101);w8(0x226,0);m.write64(out+0x228n,1n);m.write64(out+0x230n,1n);m.write32(out+0x238n,0);m.write32(out+0x23cn,0);
 w16(0x240,0x101);w8(0x242,0);m.write32(out+0x244n,1);v(0x248,[0,1,0,0]);m.write32(out+0x258n,0);w16(0x25c,1);m.write64(out+0x260n,0n);m.write32(out+0x268n,0);m.write32(out+0x3d4n,0xffffffff);
 for(const at of [0x410,0x438,0x460,0x4b0,0x4d8])m.write64(out+BigInt(at),0n);
 for(const at of [0x420,0x448,0x470,0x488,0x48c,0x498,0x4c0,0x4e8,0x508])m.write32(out+BigInt(at),0);
 v(0x4f8,[0,0,0,0]);m.write32(out+0x50cn,0xffffffff);m.write32(out+0x510n,0xffffffff);m.write64(out+0x51an,0n);m.write64(out+0x514n,0n);m.write32(out+0x524n,4);
 for(const at of [0x528,0x529,0x52a,0x538])w8(at,0);
}
