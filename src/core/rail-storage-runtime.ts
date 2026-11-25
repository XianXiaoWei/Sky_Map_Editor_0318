import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
/** Normal Rail placement body 0x1005626b0. Class ID and global Color
 * initialization are supplied by the native metadata/global boundary. */
export function constructOriginalRail(storage:Uint8Array,classId:number,color:Uint8Array){
 if(storage.length<256||color.length!==16)throw new Error('Rail constructor storage incomplete');
 const v=new DataView(storage.buffer,storage.byteOffset,storage.byteLength);
 v.setUint32(0,classId,true);v.setBigUint64(8,0n,true);v.setBigUint64(16,16n,true);v.setUint32(24,0,true);
 v.setBigUint64(32,0n,true);v.setUint32(40,0,true);storage[44]=0;storage.set(color,48);storage[64]=0;
 storage.fill(0,144,192);storage[224]=1;v.setUint32(236,0,true);v.setBigUint64(240,0n,true);
}
/** Whole Rail.AllocateDataPoints 0x10055b4a0. The old allocation is released
 * before publishing the new count, and the replacement table is zeroed. */
export function allocateOriginalRailPoints(m:Omit<ModelBakeMemory,'string'>,rail:bigint,count:number,s:{release(heap:bigint,pointer:bigint):void;allocate(heap:bigint,size:number,alignment:number):bigint}){
 const n=count>>>0;if(n<=1)throw new NativeObjectFoundationFailure('Rail.cpp',1166,4,'numPoints >= 2');
 const old=m.read64(rail+32n);if(old)s.release(m.read64(rail+240n),old);
 m.write32(rail+40n,n);const size=n*8,pointer=s.allocate(m.read64(rail+240n),size,16);
 m.write64(rail+32n,pointer);m.bytes(pointer,size).fill(0);return pointer;
}
