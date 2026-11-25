import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic} from './nature-event-runtime';
import {numericFloatBits as bits} from './object-numeric-runtime';
export const DARKSTONE_POOL={first:0x1220,stride:0x1a0,capacity:256,count:0x1b220} as const;
export const SOUL_TRAP_POOL={first:16,stride:72,capacity:64,count:0x1210} as const;
const a=natureArithmetic();
const failure=(line:number,expression:string,severity=3):never=>{throw new NativeObjectFoundationFailure('Darkstone.cpp',line,severity,expression);};
export function createOriginalSoulTrap(m:ModelBakeMemory,barn:bigint){const index=m.read32(barn+0x1210n);if(index>=64)failure(1444,'m_soulTrapCount < kMaxSoulTraps');m.write32(barn+0x1210n,index+1);return barn+16n+BigInt(index)*72n;}
/** Whole CreateDarkstone 0x10027a760. Output index writes precede a fresh
 * pool-count read, preserving the native aliasing order. */
export function createOriginalDarkstone(m:ModelBakeMemory,barn:bigint,indexOutput:bigint){let index=m.read32(barn+0x1b220n);if(index>=256)failure(1451,'m_darkstoneCount < kMaxDarkstones');m.write32(indexOutput,index);index=m.read32(barn+0x1b220n);m.write32(barn+0x1b220n,index+1);return barn+0x1220n+BigInt(index)*0x1a0n;}
export function addOriginalDarkstoneChild(m:ModelBakeMemory,p:bigint,child:bigint){const count=m.read32(p+0x104n);if(count>=8)failure(1271,'m_childCount < kMaxChildCount',4);if(child){const index=m.read32(child+32n);m.write32(p+0x104n,count+1);m.write32(p+0xe4n+BigInt(count)*4n,index);}}
export interface SoulTrapLoadServices {
 castLevelMesh(object:bigint):bigint;
 /** Whole Darkstone.Initialize 0x10027a7c0: model/OBB, original texture,
  * material, state and per-record initialization remain this dependency. */
 initializeDarkstone(stone:bigint,barn:bigint,trap:bigint,mesh:bigint,level:number,index:number):void;
 /** Original OBB-nearest hierarchy builder 0x10027ae30. */
 buildHierarchy(first:bigint,stones:readonly bigint[],barn:bigint):void;
}
/** Whole ordinary SoulTrap.Load 0x10027a370. Clump members allocate
 * distinct, contiguous Darkstone records; saved hierarchy/collectible/GUID
 * inputs and native allocation/assertion order are retained. This is the
 * actual model-list owner, not a substitute Flame/Blaze record. */
export function loadOriginalSoulTrap(m:ModelBakeMemory,p:bigint,barn:bigint,s:SoulTrapLoadServices){
 const clump=m.read64(p+8n),count=m.read32(clump+16n);if(count>256)failure(304,'darkstoneCount <= kMaxDarkStones',4);m.write64(p+0x40n,0n);
 const stones:bigint[]=[];let previous=0n;
 for(let i=0;i<count;i++){
  const index=m.read32(barn+0x1b220n);if(index>=256)failure(1451,'m_darkstoneCount < kMaxDarkstones');m.write32(barn+0x1b220n,index+1);const stone=barn+0x1220n+BigInt(index)*0x1a0n;
  if(m.read64(p+0x40n)){if(stone!==previous+0x1a0n)failure(314,'d == prev + 1',4);}else m.write64(p+0x40n,stone);
  const list=m.read64(p+8n);if(i>=m.read32(list+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');
  const mesh=s.castLevelMesh(m.read64(m.read64(list+8n)+BigInt(i)*8n));if(!mesh)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  s.initializeDarkstone(stone,barn,p,mesh,m.read32(p+36n),index);
  if(i&&m.bytes(p+32n,1)[0]){m.write32(stone+0x18cn,m.read32(p+40n));m.write32(stone+0x188n,0);}
  stones.push(stone);const collectible=m.read64(p+48n);if(collectible)m.write64(stone+0x170n,collectible);previous=stone;
 }
 if(count&&m.bytes(p+32n,1)[0]){
  const first=stones[0];m.write8(first+0xdcn,m.bytes(p+33n,1)[0]);m.write32(first+0x188n,m.read32(m.read64(p+8n)+16n)*2);m.write32(first+0x18cn,m.read32(p+40n));s.buildHierarchy(first,stones,barn);
  let maximum=0;
  for(const stone of stones){const total=m.read32(barn+0x1b220n);let depth=-1,cursor=stone,parent:number;do{depth++;parent=m.read32(cursor+0xe0n);cursor=barn+0x1220n+BigInt(parent)*0x1a0n;}while(total>parent);maximum=Math.max(maximum,depth);m.write32(stone+0x108n,bits(depth));}
  const denominator=a.add(bits(maximum),0x3f800000);for(const stone of stones)m.write32(stone+0x108n,a.sub(0x3f800000,a.div(m.read32(stone+0x108n),denominator)));
 }
 m.write32(p+0x3cn,0);m.bytes(p+0x39n,2).fill(0);
}
