import { NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';
import {balanceNativeTreeAfterInsert,locateNativeUint32TreeInsertion} from './native-tree-runtime';
import type {NativeStringPoolServices} from './native-string-runtime';
export interface NativeEventBarnMemory extends NativeObjectMemory {
  read8(address: bigint): number;
  write8(address: bigint, value: number): void;
  write32(address: bigint, value: number): void;
}
export interface NativeEventCreationServices {
  eventClass: bigint;
  allocationLabel: bigint;
  size(meta: bigint): bigint;
  alignment(meta: bigint): bigint;
  allocate(heap: bigint, size: bigint, label: bigint, alignment: bigint): bigint;
  constructInPlace(meta: bigint, storage: bigint): bigint;
  castEvent(type: bigint, value: bigint, source: bigint): bigint;
}
const fail=(line:number,expression:string,severity=3,file='./Event.h'):never=>{throw new NativeObjectFoundationFailure(file,line,severity,expression);};
/** Whole EventBarn Initialize 0x10032e4a0. Type-map destruction remains a
 * service; slots, links, unique-ID counter and unload flag use native memory. */
export function initializeNativeEventBarn(memory: NativeEventBarnMemory, barn: bigint, clearTypeMap:(tree:bigint,root:bigint)=>void):void {
  for(let i=0;i<0x5000;i++)memory.write8(barn+0x30n+BigInt(i),0);
  for(let i=0;i<1280;i++)memory.write64(barn+0x38n+BigInt(i*16),i===1279?0n:barn+0x40n+BigInt(i*16));
  memory.write64(barn+0x5030n,barn+0x30n);
  memory.write8(barn+0xcn,0);memory.write8(barn+0xdn,0);
  clearTypeMap(barn+0x18n,memory.read64(barn+0x20n));
  memory.write64(barn+0x18n,barn+0x20n);
  memory.write64(barn+0x20n,0n);memory.write64(barn+0x28n,0n);
  memory.write8(barn+0x5038n,0);
}
/** Whole EventBarn CreateEvent<Event> 0x100039f40. This creates/registers a
 * slot and persistence-independent Event state. Trigger unique/type indices
 * are assigned by the separate 0x10032ecf0 wrapper. Preserve the 0xcd fill
 * and the second size query before placement construction. */
export function createNativeBarnEvent(memory:NativeEventBarnMemory,barn:bigint,meta:bigint,s:NativeEventCreationServices):bigint {
  if(!meta)fail(173,'metaClass');
  const event=s.eventClass;
  if(event!==meta){
    if(memory.read32(event+0x3cn)===0xffffffff)fail(174,'metaClass->IsArgClassOrSuperclass( GetMetaClassByType< Event >() )',4);
    const mask=memory.read64(event+0x40n);
    if((memory.read64(meta+0x40n)&mask)!==mask)fail(174,'metaClass->IsArgClassOrSuperclass( GetMetaClassByType< Event >() )',4);
  }
  const slot=memory.read64(barn+0x5030n);
  if(!slot)fail(175,'m_freeListHead',4);
  memory.write64(barn+0x5030n,memory.read64(slot+8n));
  if(memory.read64(slot))fail(180,'!nextNode->event');
  const size=s.size(meta),label=s.allocationLabel,alignment=s.alignment(meta);
  const storage=s.allocate(barn+0x5040n,size,label,alignment);
  const fillSize=s.size(meta);
  for(let i=0n;i<fillSize;i++)memory.write8(storage+i,0xcd);
  const constructed=s.constructInPlace(meta,storage),value=s.castEvent(s.eventClass,constructed,meta);
  memory.write64(slot,value);
  if(!value)fail(189,'nextNode->event');
  memory.write8(value+0x20n,0);memory.write8(value+0x24n,1);
  memory.write64(value+0x18n,barn);
  return value;
}
export interface NativeEventReleaseServices {
  virtual(slot:0|0x18,event:bigint,game:bigint|undefined,loadHeap?:bigint):void;
  release(heap:bigint,event:bigint):void;
}
/** Whole single-node release 0x10032f350. Reload the stored Event after both
 * callbacks; the original dereferences a cleared slot rather than accepting
 * it as an extra null case. Slots return to the free-list head. */
export function releaseNativeBarnEventNode(memory:NativeEventBarnMemory,barn:bigint,node:bigint,game:bigint,s:NativeEventReleaseServices):void {
  if(!node)fail(415,'eventNode',3,'Event.cpp');
  let event=memory.read64(node);
  if(event){
    if(memory.read8(event+0x20n)){s.virtual(0x18,event,game,barn+0x85098n);event=memory.read64(node);}
    s.virtual(0,event,undefined);
    s.release(barn+0x5040n,memory.read64(node));
    memory.write64(node,0n);
  }
  memory.write64(node+8n,memory.read64(barn+0x5030n));memory.write64(barn+0x5030n,node);
}
export interface NativeTriggerEventServices extends NativeEventCreationServices {
  pool:NativeStringPoolServices;
  maxTypeIndex(event:bigint):number;
}
/** Whole trigger creation 0x10032ecf0, including CreateEvent<Event>, native
 * type-tree insertion and balancing. Unique/type counters are assigned in
 * creation order before field loading. Failure preserves prior slot/state
 * writes, and the type counter reloads after GetMaxTypeIdx. */
export function createNativeTriggerEvent(m:NativeEventBarnMemory,barn:bigint,meta:bigint,s:NativeTriggerEventServices):bigint {
  const event=createNativeBarnEvent(m,barn,meta,s);
  m.write32(event+0x28n,1);
  const unique=m.read8(barn+0xcn)|(m.read8(barn+0xdn)<<8);
  if(unique===0xffff)fail(437,'m_nextUniqueId < ( 1 << (sizeof( EventUniqueId ) * 8) ) - 1',4,'Event.cpp');
  m.write8(barn+0xcn,(unique+1)&255);m.write8(barn+0xdn,(unique+1)>>>8);
  m.write8(event+0x2cn,unique&255);m.write8(event+0x2dn,unique>>>8);
  const key=m.read32(meta+0x38n),end=barn+0x20n,tree=barn+0x18n;
  let node=m.read64(end),candidate=end;
  while(node){const lower=m.read32(node+0x1cn)>=key;if(lower)candidate=node;node=m.read64(node+(lower?0n:8n));}
  if(candidate===end||key<m.read32(candidate+0x1cn)){
    const position=locateNativeUint32TreeInsertion(m,tree,end,key);
    candidate=m.read64(position.link);
    if(!candidate){
      candidate=s.pool.allocate(s.pool.getPool(),40n);
      m.write32(candidate+0x1cn,key);m.write8(candidate+0x20n,0);
      m.write64(candidate,0n);m.write64(candidate+8n,0n);m.write64(candidate+0x10n,position.parent);
      m.write64(position.link,candidate);
      const left=m.read64(m.read64(tree));if(left)m.write64(tree,left);
      balanceNativeTreeAfterInsert(m,m.read64(end),candidate);
      m.write64(barn+0x28n,m.read64(barn+0x28n)+1n);
    }
  }
  const captured=m.read8(candidate+0x20n);
  if((s.maxTypeIndex(event)>>>0)<=captured){
    s.maxTypeIndex(event);
    fail(446,'it->second < event->GetMaxTypeIdx()',4,'Event.cpp');
  }
  const index=m.read8(candidate+0x20n);
  m.write8(candidate+0x20n,(index+1)&255);m.write8(event+0x2en,index);
  return event;
}
/** Whole recursive tree destruction 0x10032fa30. Left child, reloaded right
 * child, then pool release. Initialize resets its tree descriptor afterwards. */
export function clearNativeEventTypeMap(m:NativeEventBarnMemory,tree:bigint,root:bigint,s:NativeStringPoolServices):void {
  if(!root)return;
  clearNativeEventTypeMap(m,tree,m.read64(root),s);
  clearNativeEventTypeMap(m,tree,m.read64(root+8n),s);
  s.release(s.getPool(),root);
}
