import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {constructOriginalSceneFoundation} from './scene-foundation-runtime';
export interface ParentBarnServices {
 ensureObjectMeta():void;
 parentClassId():number;
 beginReset():void;
 stringAllocator():bigint;
 freeString(allocator:bigint,pointer:bigint):void;
 removeNode(owner:bigint,node:bigint):void;
}
/** Whole ParentBarn reset 0x100522290: clear activity in all 128 slots, then
 * release long names in descending order and rebuild the free-list. Enabled,
 * name descriptors, pointers and dirty remain unchanged. Reset bootstrap and
 * string allocator are explicit services; no map defaults are inferred. */
export function resetOriginalParentBarn(m:ModelBakeMemory,barn:bigint,s:ParentBarnServices){
 for(let i=0;i<128;i++)m.write8(barn+16n+BigInt(i)*144n+0x89n,0);
 s.beginReset();let next=0n;
 for(let i=127;i>=0;i--){const object=barn+16n+BigInt(i)*144n;if(m.bytes(object+0x20n,1)[0]&1){const pointer=m.read64(object+0x30n);s.freeString(s.stringAllocator(),pointer);}m.write64(object,next);next=object;}
 m.write64(barn+0x4810n,barn+16n);m.write32(barn+0x4c18n,0);
}
/** Whole pool Create 0x100522700. Free head advances before metadata services;
 * the cached slot is initialized even if those services change the live head.
 * Saved enabled/follow target are retained, and +0x58 is the live Barn node pool. */
export function createOriginalParent(m:ModelBakeMemory,barn:bigint,s:ParentBarnServices){
 const object=m.read64(barn+0x4810n);if(!object)throw new NativeObjectFoundationFailure('Parent.cpp',458,3,'p');
 m.write64(barn+0x4810n,m.read64(object));
 constructOriginalSceneFoundation(m,object,'Parent',{ensureObjectMeta:s.ensureObjectMeta,classId:()=>s.parentClassId(),allocate:()=>object});
 m.write8(object+0x89n,1);m.write64(object+0x58n,barn+0x4c20n);m.write8(barn+0x4c1cn,1);return object;
}
/** Whole node release helper 0x100523480. All five calls occur, including null
 * nodes, with owner/node fields reloaded after each service. */
export function releaseOriginalParentNodes(m:ModelBakeMemory,object:bigint,s:Pick<ParentBarnServices,'removeNode'>){
 for(let i=0;i<5;i++)s.removeNode(m.read64(object+0x58n),m.read64(object+0x60n+BigInt(i)*8n));
 m.bytes(object+0x60n,40).fill(0);
}
/** Whole Release 0x1005227a0 and ReleaseAll 0x100522390. An inactive or null
 * Parent does nothing. Release retains the name descriptor and follow target,
 * clears enabled/activity, and returns the slot to the current free-list. */
export function releaseOriginalParent(m:ModelBakeMemory,barn:bigint,object:bigint,s:ParentBarnServices){
 if(!object||!m.bytes(object+0x89n,1)[0])return;
 releaseOriginalParentNodes(m,object,s);m.write8(object+0x89n,0);m.write8(object+24n,0);
 if(m.bytes(object+0x20n,1)[0]&1){const pointer=m.read64(object+0x30n);s.freeString(s.stringAllocator(),pointer);}
 m.write64(object,m.read64(barn+0x4810n));m.write64(barn+0x4810n,object);
}
export function releaseAllOriginalParents(m:ModelBakeMemory,barn:bigint,s:ParentBarnServices){for(let i=0;i<128;i++)releaseOriginalParent(m,barn,barn+16n+BigInt(i)*144n,s);}
export function hotDateOriginalParentBarn(m:ModelBakeMemory,barn:bigint){m.write8(barn+0x4c1cn,1);}
/** Whole 0x100523c00: includes inactive pool slots and writes only matches.
 * The original function does not filter enabled/activity or bound output. */
export function findOriginalParentsByTarget(m:ModelBakeMemory,barn:bigint,target:bigint,out:bigint){
 let count=0;for(let i=0;i<128;i++){const object=barn+16n+BigInt(i)*144n;if(m.read64(object+8n)===target)m.write64(out+BigInt(count++)*8n,object);}return count;
}
