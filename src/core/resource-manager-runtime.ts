/** Original ResourceManager lookup in the registered resource multimap.
 * Constructing/registering the tree and metadata conversion are independent
 * dependencies; serialized resource names do not establish registration. */
export interface ResourceLookupMemory {
  read32(address: bigint): number;
  read64(address: bigint): bigint;
  string(address: bigint): Uint8Array;
}
export interface ResourceLookupServices {
  typeById(id: number): bigint;
  voidType(): bigint;
  asClass(type: bigint): bigint;
  fallbackClass(): bigint;
}
const compare=(a:Uint8Array,b:Uint8Array)=>{for(let i=0;;i++){const x=a[i]??0,y=b[i]??0;if(x!==y||x===0)return x-y;}};
/** Whole case-sensitive libc++ equal_range 0x1007c5970. The two results are
 * iterator node pointers, including the original tree+8 end sentinel. */
export function findOriginalResourceNameRange(m:ResourceLookupMemory,tree:bigint,name:bigint):[bigint,bigint] {
  let upper=tree+8n,node=m.read64(upper);
  if(!node)return [upper,upper];
  const query=m.string(name);
  for(;;){
    const key=m.string(m.read64(node+32n));
    if(compare(query,key)<0){upper=node;node=m.read64(node);}
    else if(compare(key,query)<0)node=m.read64(node+8n);
    else{
      let lower=node,left=m.read64(node);
      while(left){const key=m.string(m.read64(left+32n)),before=compare(key,query)>=0;if(before)lower=left;left=m.read64(left+(before?0n:8n));}
      node=m.read64(node+8n);
      while(node){const before=compare(query,m.string(m.read64(node+32n)))<0;if(before)upper=node;node=m.read64(node+(before?0n:8n));}
      return [lower,upper];
    }
    if(!node)return [upper,upper];
  }
}
export class NativeResourceLookupDependencyBoundary extends Error {
  constructor(public readonly typeId:number){super(`Resource lookup requires registered metadata for class ID ${typeId}`);}
}
/** Whole 0x1007c4360. It tests exact class identity within an equal-name
 * range, retains iterator order, and reloads a selected resource after its
 * metadata callback. A matching null resource ends the search with null. */
export function findOriginalRegisteredResource(m:ResourceLookupMemory,manager:bigint,type:bigint,name:bigint,s:ResourceLookupServices):bigint {
  let [node,end]=findOriginalResourceNameRange(m,manager+0x428n,name);
  while(node!==end){
    const resource=m.read64(node+40n),id=resource?m.read32(resource+8n):0;
    const metadata=resource?s.typeById(id):s.voidType();
    if(!metadata)throw new NativeResourceLookupDependencyBoundary(id);
    const actual=s.asClass(metadata)||s.fallbackClass();
    if(actual===type)return m.read64(node+40n);
    const right=m.read64(node+8n);
    if(right){node=right;while(m.read64(node))node=m.read64(node);}
    else{let child=node,parent=m.read64(node+16n);while(m.read64(parent)!==child){child=parent;parent=m.read64(child+16n);}node=parent;}
  }
  return 0n;
}
