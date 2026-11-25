import {findOriginalResourceNameRange,findOriginalRegisteredResource} from '../src/core/resource-manager-runtime';import {findNativeMetaClassById,NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {LOOKUP_BASE as O,LOOKUP_MANAGER,LOOKUP_REGISTRY,LOOKUP_META,type ResourceLookupCase} from './resource-lookup-cases';
export interface ResourceLookupResult {results:number[][];services:number[][];memory:string;}
export function evaluateResourceLookup(c:ResourceLookupCase):ResourceLookupResult {
 const b=Buffer.from(c.memory,'hex'),services:number[][]=[],results:number[][]=[];let queryIndex=0,mutated=false;
 const bytes=(p:bigint,n:number)=>{const at=Number(p-O);if(at<0||at+n>b.length)throw new Error(`Unmapped resource lookup ${p.toString(16)}`);return b.subarray(at,at+n);};
 const m={read32:(p:bigint)=>bytes(p,4).readUInt32LE(),read64:(p:bigint)=>bytes(p,8).readBigUInt64LE(),write64:(p:bigint,n:bigint)=>bytes(p,8).writeBigUInt64LE(n),string:(p:bigint)=>{const at=Number(p-O);return b.subarray(at,b.indexOf(0,at));}};
 const s={typeById:(id:number)=>findNativeMetaClassById(m,O+BigInt(LOOKUP_REGISTRY),id),voidType:()=>{services.push([2,0]);return O+BigInt(LOOKUP_META);},fallbackClass:()=>{services.push([3,4]);return O+BigInt(LOOKUP_META+4*128);},asClass:(type:bigint)=>{const id=Number((type-O-BigInt(LOOKUP_META))/128n);services.push([1,id]);if(!mutated&&c.mutation?.query===queryIndex&&c.mutation.classId===id){mutated=true;m.write64(O+BigInt(c.nodeOffsets[c.mutation.node])+40n,O+BigInt(c.resourceOffsets[c.mutation.value]));}return c.nullClasses&(1<<id)?0n:type;}};
 const code=(p:bigint)=>p?Number(p-O):0xffffffff;
 c.queries.forEach((q,i)=>{queryIndex=i;let line=0,severity=0,found=0n;const name=O+BigInt(c.queryOffsets[i]),[first,last]=findOriginalResourceNameRange(m,O+BigInt(LOOKUP_MANAGER)+0x428n,name);try{found=findOriginalRegisteredResource(m,O+BigInt(LOOKUP_MANAGER),O+BigInt(LOOKUP_META)+BigInt(q.typeId)*128n,name,s);}catch(e){if(e instanceof NativeObjectFoundationFailure){line=e.line;severity=e.severity;}else throw e;}results.push([code(first),code(last),code(found),line,severity]);});
 return {results,services,memory:b.toString('hex')};
}
