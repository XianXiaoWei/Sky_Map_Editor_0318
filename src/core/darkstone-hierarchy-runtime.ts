import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {loadOriginalSoulTrap,type SoulTrapLoadServices} from './darkstone-runtime';
import {initializeOriginalDarkstone,type DarkstoneInitializeServices} from './darkstone-initialize-runtime';

export interface DarkstoneHierarchyServices {
 /** Original Darkstone virtual +0x18 and +0x28, backed by its actual mesh.
  * Transform/OBB results are snapshots, including their original W lanes. */
 transform(stone:bigint):Uint8Array;
 worldObb(stone:bigint):Uint8Array;
 /** Original 0x10078ce10 return bits. */
 distanceToObb(point:Uint8Array,obb:Uint8Array):number;
 arithmetic?:NatureArithmeticServices;
}

/** Whole normal Darkstone.BuildHierarchy 0x10027ae30. A shared caller-owned
 * pointer array and cursor are reordered recursively. Attachment uses the
 * smaller of the two center-to-OBB distances, requires overlap, and rejects
 * a candidate closer to an ancestor. Equal distances keep the first candidate.
 * Model construction and the mesh's virtual transforms remain dependencies. */
export function buildOriginalDarkstoneHierarchy(m:ModelBakeMemory,parent:bigint,current:bigint,list:bigint,cursor:bigint,count:number,barn:bigint,s:DarkstoneHierarchyServices):void {
 const a=natureArithmetic(s.arithmetic),limit=count>>>0;
 const distance=(first:bigint,second:bigint)=>{
  const point=s.transform(first).slice(48,64),obb=s.worldObb(second);
  const firstDistance=s.distanceToObb(point,obb);
  const otherPoint=s.transform(second).slice(48,64),otherObb=s.worldObb(first);
  return a.min(firstDistance,s.distanceToObb(otherPoint,otherObb));
 };
 let start=m.read32(cursor);
 if(start>=limit)return;
 do {
  let selected=0,best=0x7f7fffff;
  for(let i=start;i<limit;i++){
   const candidate=m.read64(list+BigInt(i)*8n),candidateDistance=distance(current,candidate);
   if(value(best)>value(candidateDistance))selected=i;
   best=a.min(candidateDistance,best);
  }
  if(value(best)>0)return;
  const candidate=m.read64(list+BigInt(selected)*8n);
  if(parent){
   let ancestor=parent,ancestorBest=0x7f7fffff;
   for(;;){
    ancestorBest=a.min(distance(ancestor,candidate),ancestorBest);
    const index=m.read32(ancestor+0xe0n);
    ancestor=barn+0x1220n+BigInt(index)*0x1a0n;
    if(m.read32(barn+0x1b220n)<=index)break;
   }
   if(value(best)>value(ancestorBest))return;
  }
  if(current)m.write32(candidate+0xe0n,m.read32(current+0x20n));
  const children=m.read32(current+0x104n);
  if(children>=8)throw new NativeObjectFoundationFailure('Darkstone.cpp',1271,4,'m_childCount < kMaxChildCount');
  const index=m.read32(candidate+0x20n);
  m.write32(current+0x104n,children+1);
  m.write32(current+0xe4n+BigInt(children)*4n,index);
  const at=m.read32(cursor),previous=m.read64(list+BigInt(at)*8n),chosen=m.read64(list+BigInt(selected)*8n);
  m.write64(list+BigInt(at)*8n,chosen);
  m.write64(list+BigInt(selected)*8n,previous);
  m.write32(cursor,(at+1)>>>0);
  buildOriginalDarkstoneHierarchy(m,current,candidate,list,cursor,limit,barn,s);
  start=m.read32(cursor);
 }while(start<limit);
}

/** Connect the recovered geometry hierarchy to the original SoulTrap loader.
 * Scratch is supplied by the caller, corresponding to its original stack
 * pointer array and cursor; the existing Model initializer is still required. */
export function loadOriginalSoulTrapWithGeometry(m:ModelBakeMemory,trap:bigint,barn:bigint,s:Omit<SoulTrapLoadServices,'buildHierarchy'>&{
 hierarchy:DarkstoneHierarchyServices;hierarchyList:bigint;hierarchyCursor:bigint;
}){
 loadOriginalSoulTrap(m,trap,barn,{...s,buildHierarchy:(first,stones,owner)=>{
  stones.forEach((stone,i)=>m.write64(s.hierarchyList+BigInt(i)*8n,stone));
  m.write32(s.hierarchyCursor,1);
  buildOriginalDarkstoneHierarchy(m,0n,first,s.hierarchyList,s.hierarchyCursor,stones.length,owner,s.hierarchy);
 }});
}

/** Compose both recovered bodies with the original loader; the caller still
 * owns actual LevelMesh/Model/material services and scratch storage. */
export function loadOriginalSoulTrapWithOriginalDarkstones(m:ModelBakeMemory,trap:bigint,barn:bigint,s:{
 castLevelMesh:SoulTrapLoadServices['castLevelMesh'];initialize:DarkstoneInitializeServices;
 hierarchy:DarkstoneHierarchyServices;hierarchyList:bigint;hierarchyCursor:bigint;
}){
 loadOriginalSoulTrapWithGeometry(m,trap,barn,{...s,initializeDarkstone:(stone,owner,soul,mesh,level,index)=>initializeOriginalDarkstone(m,stone,owner,soul,mesh,level,index,s.initialize)});
}
