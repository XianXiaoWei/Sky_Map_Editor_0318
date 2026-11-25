import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
export interface CollisionGeoRemovalServices {
 removeBounds(index:bigint,entry:bigint):void;
 removeMembership(index:bigint,instance:bigint,slot:number):void;
}
/** Whole normal CollisionGeo.Remove 0x100779200. The original unsigned byte
 * range test intentionally precedes all services; it does not add alignment
 * validation. After three deregistrations, load the current count once, find
 * the instance, exchange it with the last live slot, then return it to the
 * live free-list. The inactive last slot retains the removed pointer. Lower
 * spatial-index removal kernels are explicit services, not collision physics. */
export function removeOriginalCollisionGeoInstance(m:ModelBakeMemory,owner:bigint,instance:bigint,s:CollisionGeoRemovalServices){
 const displacement=BigInt.asUintN(64,instance-owner-0x17e31n);
 if(displacement>=0x781dfn)throw new NativeObjectFoundationFailure('CollisionGeo.cpp',2495,3,'inst - m_geoInstPool >= 0 && inst - m_geoInstPool < kMaxGeoInsts');
 s.removeBounds(owner+0x92038n,instance+0x198n);
 const word=(address:bigint)=>{const b=m.bytes(address,2);return b[0]|b[1]<<8;};
 s.removeMembership(m.read64(owner+0x92020n),instance,word(instance+0x188n));
 s.removeMembership(m.read64(owner+0x92028n),instance,word(instance+0x18an));
 const count=m.read32(owner+0x90018n);let index=0;
 for(;index<count;index++)if(m.read64(owner+0x90020n+BigInt(index)*8n)===instance)break;
 if(index>=count)throw new NativeObjectFoundationFailure('CollisionGeo.cpp',2511,3,'idx < m_instCount');
 const last=(count-1)>>>0;m.write32(owner+0x90018n,last);
 const tail=owner+0x90020n+BigInt(last)*8n,target=owner+0x90020n+BigInt(index)*8n;
 m.write64(target,m.read64(tail));m.write64(tail,instance);
 if(instance){m.write64(instance,m.read64(owner+0x90010n));m.write64(owner+0x90010n,instance);}
}
