import crypto from 'node:crypto';
import {balanceNativeTreeAfterInsert,findNativeUint32TreeInsertion,type NativeTreeMemory} from '../src/core/native-tree-runtime';
import {TREE_MEMORY,nativeTreeMemory,type NativeTreeCase} from './native-tree-cases';
export function evaluateNativeTree(c:NativeTreeCase){
 const bytes=nativeTreeMemory(),p=(off:number)=>TREE_MEMORY+BigInt(off),at=(a:bigint)=>Number(a-TREE_MEMORY),trace:number[][]=[],nodes=new Map<number,bigint>();let cursor=0x2000;
 const m:NativeTreeMemory={read8:a=>bytes[at(a)],write8:(a,v)=>{bytes[at(a)]=v;},read32:a=>bytes.readUInt32LE(at(a)),read64:a=>bytes.readBigUInt64LE(at(a)),write64:(a,v)=>{bytes.writeBigUInt64LE(v,at(a));},string:()=>new Uint8Array()};
 for(const action of c.actions){
  const hint=action.hintKey===null?p(0x1008):nodes.get(action.hintKey)??p(0x1008);bytes.writeUInt32LE(action.key>>>0,0x8000);
  const link=findNativeUint32TreeInsertion(m,p(0x1000),hint,p(0x8010),p(0x8018),p(0x8000)),parent=m.read64(p(0x8010));
  trace.push([at(link),at(parent)]);
  if(m.read64(link))continue;
  const node=p(cursor);cursor+=40;bytes.writeUInt32LE(action.key>>>0,at(node)+28);bytes[at(node)+32]=0;
  m.write64(node,0n);m.write64(node+8n,0n);m.write64(node+16n,parent);m.write64(link,node);
  const left=m.read64(m.read64(p(0x1000)));if(left)m.write64(p(0x1000),left);
  balanceNativeTreeAfterInsert(m,m.read64(p(0x1008)),node);m.write64(p(0x1010),m.read64(p(0x1010))+1n);nodes.set(action.key,node);
 }
 return {trace,memorySha256:crypto.createHash('sha256').update(bytes).digest('hex')};
}
