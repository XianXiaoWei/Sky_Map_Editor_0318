import { NativeObjectFoundationFailure, type NativeObjectMemory } from '../src/core/object-foundation-runtime';
import { constructNativeMarker, setNativeMarkerEnabled, getNativeMarkerEnabledByte } from '../src/core/marker-runtime';
import { getNativeMarkerTransform, setNativeMarkerTransform, getNativeMarkerLocalObb, getNativeMarkerWorldObb, transformNativeObb } from '../src/core/marker-transform-runtime';
import { applyNativeMarkerGetMatrix, applyNativeMarkerSetTransform, getNativeObjectTransform, getNativeObjectLocalObb, getNativeObjectExtents, setNativeObjectTransform, type NativeMarkerMatrixWrapperServices, type NativeObjectTransformServices } from '../src/core/object-transform-runtime';
import { setNativeObjectEnabled, getNativeObjectEnabled, type NativeObjectEnabledServices } from '../src/core/object-enabled-runtime';
import type { MarkerTransformCase } from './marker-transform-cases';
export interface MarkerTransformResult {line:number;severity:number;life:number[];services:number[][];marker:string;transform:string;local:string;world:string;extents:string;reused:string;}
const R=0x230000000n,O=0x240000000n,B=0x290000000n;
export function evaluateMarkerTransform(c: MarkerTransformCase): MarkerTransformResult {
 const bytes=Buffer.alloc(0x7000),ptr=(at:number,value:bigint)=>bytes.writeBigUInt64LE(value,at),body=Buffer.from(c.marker,'hex'),matrix=Buffer.from(c.matrix,'hex'),local=Buffer.from(c.local,'hex');
 const out=Array.from({length:3},()=>Buffer.alloc(64,0xa5)),ext=Buffer.alloc(16,0xa5),reused=Buffer.alloc(80,0xa5),life=[0,0,0,0],services:number[][]=[];
 let bodyAddress=c.op===3?B+0xb0n:O,line=0,severity=0;
 ptr(0x98+12*8,R+0x5000n);ptr(0x5050,R+0x6000n);ptr(0x5650,R+0x6080n);
 if(c.flags&32){ptr(0x5030,0x102310000n);ptr(0x5650,R+0x6000n);ptr(0x5050,R+0x6080n);}
 const names=['GetEnabled','GetObb','GetTransform','SetEnabled','SetTransform'],members=[0x11n,0x21n,0x19n,0x10043cff0n,0x10043ccd0n];
 names.forEach((name,i)=>{const node=0x6100+i*64,desc=0x6400+i*128;bytes.write((c.flags&8?name[0].toLowerCase()+name.slice(1):name)+'\0',0x6800+i*32);ptr(node+32,R+BigInt(0x6800+i*32));ptr(node+40,R+BigInt(desc));ptr(desc+56,members[i]);});
 ptr(0x6008,R+0x6180n);ptr(0x6180,R+0x6100n);ptr(0x6188,R+0x61c0n);ptr(0x6108,R+0x6140n);ptr(0x61c8,R+0x6200n);
 if(c.flags&2)ptr(0x6008,0n);if(c.flags&64)ptr(0x6228,0n);
 const m: NativeObjectMemory={read32:p=>p===bodyAddress+8n?body.readUInt32LE(8):bytes.readUInt32LE(Number(p-R)),read64:p=>{
  if(p===bodyAddress)return body.readBigUInt64LE();const slots:Record<string,bigint>={'100cc6268':0x10043e2d0n,'100cc6270':0x10043e470n,'100cc6278':0x10043e4b0n};if(slots[p.toString(16)])return slots[p.toString(16)];return bytes.readBigUInt64LE(Number(p-R));
 },write64:(p,v)=>ptr(Number(p-R),v),string:p=>bytes.subarray(Number(p-R),bytes.indexOf(0,Number(p-R)))};
 const log=(op:number,meta=0n,arg=0)=>services.push([op,meta?Number(meta-R):0,arg]);
 const pointerCode=(p:bigint)=>!p?0xffffffff:p>=B&&p<B+0x15000n?0x10000+Number(p-B):Number(p-O);
 const wrappers: NativeMarkerMatrixWrapperServices={memory:(p,n)=>{if(p!==bodyAddress||n!==80)throw new Error('Unexpected receiver memory');return body;},matrixType:()=>R+0x5200n,voidType:()=>R+0x5400n,convertMatrix:(dst,src,target,source)=>{log(3,target,Number(source-R));dst.set(src.subarray(0,64));}};
 const s: NativeObjectTransformServices={registry:R,cacheEnabled:()=>false,asClass:type=>{log(1,type);return c.flags&16?0n:type;},fallbackClass:()=>{log(5);return R+0x5600n;},objectPointerType:()=>R+0x5100n,matrixType:()=>R+0x5200n,voidType:()=>R+0x5400n,
  receiverType:()=>R+0x5500n,castReceiver:(type,p)=>{log(2,type,pointerCode(p));return c.flags&1?0n:p-8n;},callParentGetter:()=>{log(4);return R+0x5600n;},cachedLookup:()=>{throw new Error('Unverified cache');},
  invokeMatrix:(method,receiver,dst,resultType,arg,argType)=>{const member=m.read64(method+56n);if(arg)applyNativeMarkerSetTransform(m,member,0n,receiver,[{bytes:arg,type:argType}],wrappers);else applyNativeMarkerGetMatrix(m,member,0n,receiver,dst!,resultType,0,wrappers);}
 };
 const enabled: NativeObjectEnabledServices={...s,boolType:()=>R+0x5300n,invoke:(method,receiver,resultType,arg)=>{
  if(receiver!==bodyAddress)throw new Error('Unexpected enabled receiver');
  if(arg!==null){log(3,R+0x5300n,0x5300);setNativeMarkerEnabled(body,arg?1:0);return false;}const v=getNativeMarkerEnabledByte(body);log(3,resultType,0x5300);return !!v;
 }};
 const object=c.flags&4?0n:bodyAddress+8n;
 try {
  if(c.op===1)setNativeMarkerTransform(body,matrix);
  if(c.op===3){setNativeObjectEnabled(m,object,false,enabled);log(10,0n,getNativeObjectEnabled(m,object,enabled)?1:0);}
  if(c.op===2||c.op===3)setNativeObjectTransform(m,object,matrix,s);
  if(c.op===4)applyNativeMarkerSetTransform(m,0x10043ccd0n,BigInt(c.alias),bodyAddress-BigInt(c.alias),Array.from({length:c.count},()=>({bytes:matrix,type:R+0x5200n})),wrappers);
  if(c.op===5)applyNativeMarkerGetMatrix(m,0x19n,BigInt(c.alias),bodyAddress-BigInt(c.alias),out[0],R+0x5200n,c.count,wrappers);
  if(c.op===6)setNativeMarkerTransform(body,body.subarray(c.alias,c.alias+64));
  if(c.op===7){getNativeMarkerTransform(body,body.subarray(c.alias,c.alias+64));out[0].set(body.subarray(c.alias,c.alias+64));}
  else if(c.op===8){const dst=c.alias===1?matrix:c.alias===2?local:out[0];transformNativeObb(matrix,local,dst);out[0].set(dst);}
  else {
   if(c.op===2||c.op===3){getNativeObjectTransform(m,object,out[0],s);getNativeObjectLocalObb(m,object,out[1],s);}else {getNativeMarkerTransform(body,out[0]);getNativeMarkerLocalObb(out[1]);}
   getNativeMarkerWorldObb(body,out[2]);getNativeObjectExtents(m,object,ext,s);
  }
  if(c.op===3){setNativeObjectEnabled(m,object,true,enabled);log(10,0n,getNativeObjectEnabled(m,object,enabled)?1:0);life.splice(0,4,1,0,2,0);reused.fill(0);constructNativeMarker(reused,12);reused.writeUInt32LE(1,68);}
 }catch(error){if(!(error instanceof NativeObjectFoundationFailure))throw error;line=error.line;severity=error.severity;}
 return {line,severity,life,services,marker:body.toString('hex'),transform:out[0].toString('hex'),local:out[1].toString('hex'),world:out[2].toString('hex'),extents:ext.toString('hex'),reused:reused.toString('hex')};
}
