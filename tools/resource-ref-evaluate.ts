import * as runtime from '../src/core/resource-ref-runtime';
import {REF_BASE as O,REF_VTABLE,refAddress,resourceAddress,resourceRefMemory,type ResourceRefCase} from './resource-ref-cases';
export interface ResourceRefResult {services:number[][];snapshots:string[];}
export function evaluateResourceRef(c:ResourceRefCase):ResourceRefResult {
 const b=Buffer.from(c.memory,'hex'),m=resourceRefMemory(b),services:number[][]=[],snapshots:string[]=[];let mutated=false;
 for(let i=0;i<4;i++)if(c.nullResources&(1<<i))m.write64(resourceAddress(i)+80n,0n);
 const pointer=(p:bigint)=>p?Number(p-O):0xffffffff;
 const s:runtime.ResourceRefServices={callback:(slot,resource,ref)=>{
  if(m.read64(resource)!==REF_VTABLE)throw new Error('Unprepared ResourceRef callback vtable');
  services.push([slot,pointer(resource),pointer(ref),pointer(m.read64(ref)),pointer(m.read64(ref+8n)),pointer(m.read64(ref+16n)),m.bytes(ref+24n,1)[0]]);
  if(mutated||slot!==c.slot)return;mutated=true;
  const index=Number((ref-refAddress(0))/32n),other=refAddress((index+1)%8);
  if(c.mutation===1)runtime.unlinkOriginalResourceRef(m,ref);
  else if(c.mutation===2)runtime.unlinkOriginalResourceRef(m,other);
  else if(c.mutation===3)m.write64(resource+80n,0n);
  else if(c.mutation===4)runtime.observeOriginalResource(m,resourceAddress(3),refAddress(3),s);
  else if(c.mutation===5)m.write8(ref+24n,0xfe);
 }};
 for(const [op,i,resource] of c.actions){const ref=refAddress(i);if(op===0)runtime.constructOriginalResourceRef(m,ref);else if(op===1)runtime.observeOriginalResource(m,resourceAddress(resource),ref,s);else if(op===2)runtime.destroyOriginalResourceRef(m,ref,s);else if(op===3)runtime.unlinkOriginalResourceRef(m,ref);else throw new Error('Invalid ResourceRef action');snapshots.push(b.toString('hex'));}
 return {services,snapshots};
}
