import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {normalizeOriginalCreatureBasis,originalCreatureLength3} from './bird-load-runtime';

export const BUDDY_ACTION_SUFFIXES=['Idle','Walk','Run','EnterBored','ExitBored'] as const;
export interface BuddyParameterServices {
 findSequence(name:string,flags:0,meshName:string):number;
}
const nativeStringPointer=(m:ModelBakeMemory,p:bigint,fallback=0n)=>m.bytes(p,1)[0]&1?m.read64(p+16n)||fallback:p+1n;
/** Whole BuddyParams.Initialize 0x1001cf940. The shared prefix pointer is
 * captured once; each mesh name and its string layout is read after callbacks. */
export function initializeOriginalBuddyParams(m:ModelBakeMemory,p:bigint,s:BuddyParameterServices){
 if(m.bytes(p+60n,1)[0])return;
 const prefix=nativeStringPointer(m,p+16n);
 for(let i=0;i<BUDDY_ACTION_SUFFIXES.length;i++){
  const name=(prefix?m.string(prefix):'')+BUDDY_ACTION_SUFFIXES[i];
  const mesh=m.read64(p+8n),file=nativeStringPointer(m,mesh+88n);
  m.write32(p+64n+BigInt(i*4),s.findSequence(name,0,m.string(file)));
 }
 m.write8(p+60n,1);
}
/** Whole 0x1007331f0, including the four untouched bytes after the bzero. */
export function initializeOriginalBuddyMotionCache(m:ModelBakeMemory,p:bigint){
 m.bytes(p,0x824).fill(0);m.bytes(p+0x828n,32).fill(0);m.write64(p+0x848n,0n);m.write32(p+0x850n,0x7f7fffff);
}
export interface BuddyLoadServices extends BuddyParameterServices {
 arithmetic?:NatureArithmeticServices;
 /** Original player IDs must be nonempty and fit the original eight slots. */
 activePlayers(playerOwner:bigint):Uint32Array;
 createMarker(markerOwner:bigint,mode:0):bigint;
 markerIdBits:number;
 rand():number;
 atan2(yBits:number,xBits:number):number;
 asin(valueBits:number):number;
 cloneModel(modelOwner:bigint,source:bigint):bigint;
 localObb(mesh:bigint):Uint8Array;
}
/** Whole ordinary Buddy.Load 0x1001cfaf0. It owns its Model, motion cache,
 * authority slot and state. Barn registration precedes resource assertions. */
export function loadOriginalBuddy(m:ModelBakeMemory,p:bigint,game:bigint,s:BuddyLoadServices){
 const a=natureArithmetic(s.arithmetic),one=0x3f800000,threshold=0x3727c5ac;
 initializeOriginalBuddyParams(m,m.read64(p+128n),s);
 const barn=m.read64(game+0x388n),index=m.read32(barn+80n);
 if(index>=8)throw new NativeObjectFoundationFailure('Buddy.cpp',889,3,'m_numBuddies < kMaxBuddies');
 m.write8(p+0xb24n,index);m.write32(barn+80n,index+1);m.write64(barn+16n+BigInt(index*8),p);
 const players=s.activePlayers(m.read64(m.read64(game+0x178n)+32n));
 if(!players.length||players.length>8)throw new Error('Buddy.Load requires the original nonempty active-player list, at most eight IDs');
 m.write32(p+0xb28n,players[m.bytes(p+0xb24n,1)[0]%players.length]);
 m.write64(p+0xb58n,s.createMarker(m.read64(game+0x300n),0));m.write32(p+0xb60n,s.markerIdBits);m.write64(p+0xb68n,m.read64(m.read64(game+0x178n)+56n));m.write32(p+0xb20n,0x4e6e6b28);
 const random=()=>a.mul(bits(s.rand()|0),0x30000000),r=random();m.write32(p+0xd8n,a.add(r,a.mul(a.sub(one,r),0)));
 const saved=m.bytes(p+0x90n,64).slice();m.bytes(p+16n,16).set(saved.subarray(48));m.bytes(p+32n,48).set(saved.subarray(0,48));
 const lengths=normalizeOriginalCreatureBasis(m,p+32n,threshold),params=m.read64(p+128n);
 m.bytes(p+80n,16).fill(0);m.write32(p+96n,m.read32(params+48n));m.write32(p+100n,m.read32(params+56n));m.write32(p+104n,one);
 const z=new DataView(saved.buffer,saved.byteOffset+32,16),forward=Array.from({length:4},(_,i)=>(z.getUint32(i*4,true)^0x80000000)>>>0);
 if(value(lengths[2])>value(threshold)){const w=a.mul(z.getUint32(4,true),z.getUint32(4,true));forward.forEach((n,i)=>forward[i]=a.div(n,i===3?w:lengths[2]));}
 m.write32(p+0xd0n,s.atan2(forward[0],forward[2]));m.write32(p+0xd4n,s.asin(forward[1]));
 m.write64(p+0xb30n,s.cloneModel(m.read64(game+0x5a8n),m.read64(m.read64(params+8n)+0x228n)));
 if(!m.read64(p+0xb30n))throw new NativeObjectFoundationFailure('Buddy.cpp',182,3,'m_model');
 m.bytes(p+0xb40n,16).set(new Uint8Array(Float32Array.of(1,1,1,0).buffer));
 for(let i=0;i<3;i++){const obb=s.localObb(m.read64(m.read64(p+128n)+8n));m.write32(p+0xb40n+BigInt(i*4),originalCreatureLength3(obb.subarray(i*16,i*16+16)));}
 m.write32(p+0xb50n,0);initializeOriginalBuddyMotionCache(m,p+0x138n);
 for(const offset of [0xaacn,0x114n,0xe0n,0x100n])m.write32(p+offset,0);m.write64(p+0xe8n,0n);m.bytes(p+0xf0n,16).fill(0);m.bytes(p+0x990n,16).set(m.bytes(p+16n,16));m.write32(p+0x110n,Math.imul(m.bytes(p+0xb24n,1)[0],0xec4bab));m.write32(p+0x9a0n,0);m.bytes(p+0xb70n,16).fill(0);
 const clump=m.read64(m.read64(p+128n)+40n);
 if(clump){const count=m.read32(clump+16n);if(count>32)throw new NativeObjectFoundationFailure('Buddy.cpp',206,3,'params->discoverables->Size() <= 32');m.write32(p+0x9a0n,(((1<<(count&31))>>>0)-1)>>>0);}
 for(let i=0;i<8;i++)m.write32(p+0x118n+BigInt(i*4),random());
}
/** Original Buddy.Unload 0x1001d3790 is empty. Owners release separately. */
export function unloadOriginalBuddy():void {}
