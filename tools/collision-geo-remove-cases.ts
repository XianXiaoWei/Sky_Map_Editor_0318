import {removeOriginalCollisionGeoInstance} from '../src/core/collision-geo-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const COLLISION_REMOVE_BASE=0x380000000n;
export interface CollisionGeoRemoveCase {label:string;instanceOffset:number;slots:number[];count?:number;flags?:number;countAfterServices?:number;membership?:number[];}
export function prepareCollisionGeoRemove(c:CollisionGeoRemoveCase){
 const b=Buffer.alloc(0x100000,0xa5),base=COLLISION_REMOVE_BASE,at=(a:bigint)=>Number(a-base),m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 const instance=base+BigInt(c.instanceOffset);m.write64(base+0xe0000n,instance);m.write32(base+0xe0008n,c.flags??0);m.write32(base+0xe000cn,c.countAfterServices??0xffffffff);m.write32(base+0x90018n,c.count??c.slots.length);m.write64(base+0x90010n,base+0xd0000n);m.write64(base+0x92020n,base+0xd0100n);m.write64(base+0x92028n,base+0xd0180n);
 c.slots.forEach((off,i)=>m.write64(base+0x90020n+BigInt(i*8),base+BigInt(off)));if(c.instanceOffset>=0&&c.instanceOffset+0x18c<0x100000){b.writeUInt16LE(c.membership?.[0]??0xffff,c.instanceOffset+0x188);b.writeUInt16LE(c.membership?.[1]??0x8001,c.instanceOffset+0x18a);}return{b,m,base,instance};
}
export function evaluateCollisionGeoRemove(c:CollisionGeoRemoveCase){
 const {b,m,base,instance}=prepareCollisionGeoRemove(c),calls:bigint[][]=[],flags=c.flags??0;let line=0,severity=0;
 const mutate=(call:number)=>{if(call===1){if(flags&1)m.write64(base+0x92020n,base+0xd0200n);if(flags&2)b.writeUInt16LE(0xfeff,c.instanceOffset+0x188);}if(call===2){if(flags&4)m.write64(base+0x92028n,base+0xd0300n);if(flags&8)b.writeUInt16LE(0xabcd,c.instanceOffset+0x18a);}if(call===3){if(c.countAfterServices!==undefined)m.write32(base+0x90018n,c.countAfterServices);if(flags&16)m.write64(base+0x90020n,instance);if(flags&32)m.write64(base+0x90010n,base+0xd0400n);}};
 try{removeOriginalCollisionGeoInstance(m,base,instance,{removeBounds:(index,entry)=>{calls.push([1n,index,entry]);mutate(1);},removeMembership:(index,inst,slot)=>{calls.push([2n,index,inst,BigInt(slot)]);mutate(calls.length);}});}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const h=Buffer.alloc(12+calls.length*64);h.writeUInt32LE(line);h.writeUInt32LE(severity,4);h.writeUInt32LE(calls.length,8);calls.forEach((t,i)=>t.forEach((n,j)=>h.writeBigUInt64LE(BigInt.asUintN(64,n),12+i*64+j*8)));return Buffer.concat([h,b]);
}
