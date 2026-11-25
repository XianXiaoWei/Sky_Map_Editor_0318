import {NativeObjectFoundationFailure,findNativeMetaClassById} from '../src/core/object-foundation-runtime';
import {initializeOriginalMeshInstance,loadOriginalModelMeshInstance,getOriginalModelMeshLodCount,loadOriginalUnbakedMeshInstance,type ModelBakeMemory,type ModelBakeServices,type ModelBakeArithmeticServices} from '../src/core/model-baked-runtime';
import {MODEL_BAKE_BASE as O,type ModelBakeCase} from './model-baked-cases';
import {constructOriginalResourceRef,observeOriginalResource,destroyOriginalResourceRef,unlinkOriginalResourceRef,type ResourceRefServices} from '../src/core/resource-ref-runtime';
import {findOriginalRegisteredResource} from '../src/core/resource-manager-runtime';
export interface ModelBakeResult {line:number;severity:number;services:number[][];diagnostics:string;memory:string;}
export function evaluateModelBake(c:ModelBakeCase,useOriginalRefs=false,useRegisteredLookup=false):ModelBakeResult {
 const b=Buffer.from(c.memory,'hex'),services:number[][]=[];let diagnostics='',refCount=0;
 const registry=Buffer.alloc(4096);registry.writeBigUInt64LE(O+0x240n,0x98+16*8);registry.writeBigUInt64LE(O+0x260n,0x98+17*8);
 const bytes=(p:bigint,n:number)=>{const registered=useRegisteredLookup&&p>=O+0x50000n&&p<O+0x51000n,source=registered?registry:b,base=registered?O+0x50000n:O,at=Number(p-base);if(at<0||at+n>source.length)throw new Error(`Unmapped MeshInstance ${p.toString(16)}`);return source.subarray(at,at+n);};
 const m:ModelBakeMemory={bytes,read32:p=>bytes(p,4).readUInt32LE(),read64:p=>bytes(p,8).readBigUInt64LE(),write32:(p,n)=>bytes(p,4).writeUInt32LE(n>>>0),write64:(p,n)=>bytes(p,8).writeBigUInt64LE(n),write8:(p,n)=>{bytes(p,1)[0]=n;},string:p=>{const at=Number(p-O);return b.subarray(at,b.indexOf(0,at)).toString();}};
 const ids=new Map<object,number>(),log=(op:number,a=0,d=0)=>services.push([op,a>>>0,d>>>0]);
 const table=new Map((c.arithmetic??[]).map(r=>[`${r[0]}:${r[1]}:${r[2]}`,r[3]]));
 const arithmetic:ModelBakeArithmeticServices={resolveDualNaN:(op,a,d)=>{const n=table.get(`${['add','sub','mul','div'].indexOf(op)}:${a}:${d}`);if(n===undefined)throw new Error('Missing independently probed dual-NaN operands');return n;}};
 const s:ModelBakeServices={arithmetic,createRef:()=>{const r={handle:0n};ids.set(r,refCount);log(1,refCount++);return r;},meshType:()=>{log(2);return O+0x240n;},levelType:()=>{log(3);return O+0x260n;},lookup:(manager,type,name)=>{if(manager!==O+0x220n)throw new Error('Unexpected manager');log(4,Number(type-O),Number(name-O));return c.flags&(type===O+0x240n?1:2)?O+(type===O+0x240n?0x400n:0x800n):0n;},request:(manager,type,name)=>{if(manager!==O+0x220n)throw new Error('Unexpected manager');log(6,Number(type-O),Number(name-O));},observe:(resource,ref)=>{log(5,Number(resource-O),ids.get(ref)!);ref.handle=c.flags&(resource===O+0x400n?4:16)?0n:O+(resource===O+0x400n?0xc00n:0xc40n);},destroyRef:r=>log(10,ids.get(r)!),failedBake:(mesh,guid)=>{log(7,1);log(8,guid);log(9);diagnostics+=`Failed to load baked lighting for Mesh "${mesh}" - GUID: ${guid}. Baking and reloading the level may fix this issue.\n`;}};
 if(useRegisteredLookup){
  const lookupMemory={...m,string:(p:bigint)=>{const at=Number(p-O);return b.subarray(at,b.indexOf(0,at));}},metadata={typeById:(id:number)=>findNativeMetaClassById(lookupMemory,O+0x50000n,id),voidType:()=>{log(15);return O+0x2c0n;},asClass:(type:bigint)=>{log(14,Number(type-O));return type;},fallbackClass:()=>{log(16);return O+0x2e0n;}};
  s.lookup=(manager,type,name)=>{if(manager!==O+0x220n)throw new Error('Unexpected manager');log(4,Number(type-O),Number(name-O));return findOriginalRegisteredResource(lookupMemory,manager,type,name,metadata);};
 }
 if(useOriginalRefs){
  const addresses=new Map<object,bigint>(),refId=(address:bigint)=>Number((address-O-0x1c00n)/32n);
  const callbacks:ResourceRefServices={callback:(slot,resource,ref)=>{if(m.read64(resource)!==O+0x30000n)throw new Error('Unprepared Model resource callback vtable');log(12,Number(resource-O),(slot<<16)|refId(ref));log(13,Number(m.read64(ref)-O),m.bytes(ref+24n,1)[0]);if(slot===0x38&&(c.flags&(resource===O+0x400n?4:16)))unlinkOriginalResourceRef(m,ref);}};
  s.createRef=()=>{const address=O+0x1c00n+BigInt(refCount)*32n,r={get handle(){return m.read64(address);},set handle(n:bigint){m.write64(address,n);}};addresses.set(r,address);ids.set(r,refCount);log(1,refCount++);constructOriginalResourceRef(m,address);return r;};
  s.observe=(resource,ref)=>{log(5,Number(resource-O),ids.get(ref)!);observeOriginalResource(m,resource,addresses.get(ref)!,callbacks);};s.destroyRef=ref=>{log(10,ids.get(ref)!);destroyOriginalResourceRef(m,addresses.get(ref)!,callbacks);};
  if(c.flags&8)m.write64(O+0x450n,0n);if(c.flags&32)m.write64(O+0x850n,0n);
 }else{if(c.flags&8)b.writeBigUInt64LE(0n,0xc10);if(c.flags&32)b.writeBigUInt64LE(0n,0xc50);}
 let line=0,severity=0;try{const out=O+BigInt(c.out);if(c.op===0)initializeOriginalMeshInstance(m,out,O+0x4a8n,c.bakePointer===0?0n:O+BigInt(c.bakePointer??0x1d00),c.index,arithmetic);else if(c.op===2)m.write32(out,getOriginalModelMeshLodCount(m,O+0x80n,O+0x220n,s));else if(c.op===3)loadOriginalUnbakedMeshInstance(m,out,O+0x220n,O+0x80n,c.index,s);else loadOriginalModelMeshInstance(m,out,O+0x220n,O+0x100n,O+0x80n,c.source?.guid??0x80000001,c.index,s);}catch(e){if(e instanceof NativeObjectFoundationFailure){line=e.line;severity=e.severity;}else throw e;}
 return {line,severity,services,diagnostics,memory:b.toString('hex')};
}
