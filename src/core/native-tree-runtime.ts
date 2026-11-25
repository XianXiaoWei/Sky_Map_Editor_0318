import type { NativeObjectMemory } from './object-foundation-runtime';
export interface NativeTreeMemory extends NativeObjectMemory {
  read8(address:bigint):number;
  write8(address:bigint,value:number):void;
}
export interface NativeTreeInsertion {parent:bigint;link:bigint;hintMatch:boolean;}
const keyAt=(m:NativeTreeMemory,node:bigint)=>m.read32(node+0x1cn);
function search(m:NativeTreeMemory,tree:bigint,key:number):NativeTreeInsertion {
  let link=tree+8n,node=m.read64(link);
  if(!node)return {parent:link,link,hintMatch:false};
  for(;;){
    const saved=keyAt(m,node);
    if(key<saved)link=node;
    else if(saved<key)link=node+8n;
    else return {parent:node,link,hintMatch:false};
    const child=m.read64(link);
    if(!child)return {parent:node,link,hintMatch:false};
    node=child;
  }
}
/** Original uint32-key hinted insertion search 0x1003320e0. Returns the
 * native child/root storage address, or indicates its auxiliary output slot
 * when the hint itself matches. This does not allocate or balance a node. */
export function locateNativeUint32TreeInsertion(m:NativeTreeMemory,tree:bigint,hint:bigint,key:number):NativeTreeInsertion {
  key>>>=0;const end=tree+8n;
  if(hint===end||key<keyAt(m,hint)){
    const left=m.read64(hint);
    if(m.read64(tree)===hint)return {parent:hint,link:hint,hintMatch:false};
    let previous:bigint;
    if(left){previous=left;while(m.read64(previous+8n))previous=m.read64(previous+8n);}
    else{
      let child=hint;previous=m.read64(child+16n);
      while(m.read64(previous)===child){child=previous;previous=m.read64(child+16n);}
    }
    if(keyAt(m,previous)<key)return left?{parent:previous,link:previous+8n,hintMatch:false}:{parent:hint,link:hint,hintMatch:false};
    return search(m,tree,key);
  }
  if(keyAt(m,hint)===key)return {parent:hint,link:0n,hintMatch:true};
  const right=m.read64(hint+8n);let next:bigint;
  if(right){next=right;while(m.read64(next))next=m.read64(next);}
  else{
    let child=hint;next=m.read64(child+16n);
    while(m.read64(next)!==child){child=next;next=m.read64(child+16n);}
  }
  if(next===end||key<keyAt(m,next))return right?{parent:next,link:next,hintMatch:false}:{parent:hint,link:hint+8n,hintMatch:false};
  return search(m,tree,key);
}
/** Original function ABI: write parent, write auxiliary only for an equal
 * hint, and return the address holding the matching/new node pointer. */
export function findNativeUint32TreeInsertion(m:NativeTreeMemory,tree:bigint,hint:bigint,parentOut:bigint,auxiliaryOut:bigint,keyAddress:bigint):bigint {
  const position=locateNativeUint32TreeInsertion(m,tree,hint,m.read32(keyAddress));
  m.write64(parentOut,position.parent);
  if(position.hintMatch){m.write64(auxiliaryOut,hint);return auxiliaryOut;}
  return position.link;
}
function rotateLeft(m:NativeTreeMemory,node:bigint):void {
  const right=m.read64(node+8n),child=m.read64(right);
  m.write64(node+8n,child);if(child)m.write64(child+16n,node);
  const parent=m.read64(node+16n);m.write64(right+16n,parent);
  m.write64(m.read64(parent)===node?parent:parent+8n,right);
  m.write64(right,node);m.write64(node+16n,right);
}
function rotateRight(m:NativeTreeMemory,node:bigint):void {
  const left=m.read64(node),child=m.read64(left+8n);
  m.write64(node,child);if(child)m.write64(child+16n,node);
  const parent=m.read64(node+16n);m.write64(left+16n,parent);
  m.write64(m.read64(parent)===node?parent:parent+8n,left);
  m.write64(left+8n,node);m.write64(node+16n,left);
}
/** Whole libc++ insertion balancing 0x1001a7bb0. Color byte +0x18 uses
 * 1=black, 0=red. Root is the pointer captured by the original caller before
 * balancing; rotations update the native sentinel's root link. */
export function balanceNativeTreeAfterInsert(m:NativeTreeMemory,root:bigint,node:bigint):void {
  m.write8(node+24n,node===root?1:0);if(node===root)return;
  for(;;){
    let parent=m.read64(node+16n);if(m.read8(parent+24n))return;
    const grand=m.read64(parent+16n),left=m.read64(grand)===parent;
    const uncle=m.read64(grand+(left?8n:0n));
    if(uncle&&!m.read8(uncle+24n)){
      m.write8(parent+24n,1);m.write8(grand+24n,grand===root?1:0);m.write8(uncle+24n,1);
      node=grand;if(node===root)return;continue;
    }
    if(left){
      if(m.read64(parent)!==node){node=parent;rotateLeft(m,node);parent=m.read64(node+16n);}
      m.write8(parent+24n,1);const gp=m.read64(parent+16n);m.write8(gp+24n,0);rotateRight(m,gp);
    }else{
      if(m.read64(parent)===node){node=parent;rotateRight(m,node);parent=m.read64(node+16n);}
      m.write8(parent+24n,1);const gp=m.read64(parent+16n);m.write8(gp+24n,0);rotateLeft(m,gp);
    }
    return;
  }
}
