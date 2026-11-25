/** Original ResourceRef observation/list state. Resource allocation, resource
 * virtual callbacks, concurrent mutation and exception unwinding are separate
 * dependencies. No load-complete state is fabricated by these methods. */
export interface ResourceRefMemory {
  bytes(address: bigint, length: number): Uint8Array;
  read64(address: bigint): bigint;
  write64(address: bigint, value: bigint): void;
  write8(address: bigint, value: number): void;
}
export interface ResourceRefServices {
  callback(slot: 0x30|0x38|0x40, resource: bigint, ref: bigint): void;
}
/** Whole 0x1007c2530, including the overlapping 16-byte stores. */
export function constructOriginalResourceRef(m: ResourceRefMemory, ref: bigint): void {
  m.bytes(ref+9n,16).fill(0);m.bytes(ref,16).fill(0);
}
/** Original link removals reload next/previous between stores. In particular,
 * a callback may have already removed the ref before its caller resumes. */
function unlink(m: ResourceRefMemory, ref: bigint, handle: bigint): void {
  const next=m.read64(ref+8n),previous=m.read64(ref+16n);
  m.write64(previous?previous+8n:handle,next);
  const newNext=m.read64(ref+8n),newPrevious=m.read64(ref+16n);
  m.write64(newNext?newNext+16n:handle+8n,newPrevious);
  m.bytes(ref,16).fill(0);m.write64(ref+16n,0n);
}
/** Whole cleanup 0x1007c2600; does not invoke a resource callback or clear the
 * observed byte at +24. Used by the original unwind path as well. */
export function unlinkOriginalResourceRef(m: ResourceRefMemory, ref: bigint): void {
  const handle=m.read64(ref);if(handle)unlink(m,ref,handle);
}
/** Whole ordinary 0x1007c2570. Callback +0x30 precedes list removal, and
 * handle is re-read afterward. Unwind/terminate behavior is not modeled. */
export function destroyOriginalResourceRef(m: ResourceRefMemory, ref: bigint, s: ResourceRefServices): void {
  let handle=m.read64(ref);
  if(handle){const resource=m.read64(handle+16n);if(resource){s.callback(0x30,resource,ref);handle=m.read64(ref);}}
  if(handle)unlink(m,ref,handle);
}
/** Whole ordinary Resource::Observe 0x1007c2310. The resource owns its handle
 * at +0x40 (head, tail, resource pointer), rather than a separately allocated
 * reference-counted handle. Re-observation retains original callback order. */
export function observeOriginalResource(m: ResourceRefMemory, resource: bigint, ref: bigint, s: ResourceRefServices): void {
  let handle=m.read64(ref);
  if(handle){
    const previousResource=m.read64(handle+16n);
    if(previousResource){s.callback(0x40,previousResource,ref);handle=m.read64(ref);}
    if(handle)unlink(m,ref,handle);
  }
  const target=resource+64n;
  // The original post-callback null-handle path also checks target identity.
  // Retain the final check, rather than forcing an extra insertion.
  if(m.read64(ref)!==target){
    if(m.read64(target)){
      const tail=m.read64(resource+72n);m.write64(tail+8n,ref);m.write64(ref+16n,tail);
    }else m.write64(target,ref);
    m.write64(resource+72n,ref);m.write64(ref,target);
  }
  s.callback(0x38,resource,ref);m.write8(ref+24n,1);
}
