import info from '../../docs/environment-construction.json';
import type {ModelBakeMemory} from './model-baked-runtime';
import type {EnvironmentConstructionServices} from './environment-construction-runtime';
import {constructOriginalEvent} from './event-start-runtime';
/** Editor-owned metadata IDs and native globals. Parent constructor stores are
 * restored, while this context explicitly prepares metadata/default vectors;
 * it does not claim the original registry bootstrap or TGCL factory has run. */
export function prepareEnvironmentConstructionContext(source:ModelBakeMemory,namespace:bigint,child?:EnvironmentConstructionServices['constructChild'],manifest:{initialGlobalHex:Record<string,string>;metadataFunctions:string[]}=info){
 const ranges:{address:bigint;bytes:Uint8Array}[]=[],record=(id:number)=>{const bytes=new Uint8Array(64);new DataView(bytes.buffer).setUint32(56,id,true);const address=namespace+BigInt(ranges.length)*0x100n;ranges.push({address,bytes});return address;};
 let id=1;const nativeGlobals=Object.entries(manifest.initialGlobalHex).map(([address,hex])=>{const bytes=Uint8Array.from(hex.match(/../g)!,h=>Number.parseInt(h,16)),p=BigInt(address);if(p>0x101000000n&&bytes.length===8&&p!==0x101df0a68n)new DataView(bytes.buffer).setBigUint64(0,record(id++),true);return {address:p,bytes};});
 ranges.push(...nativeGlobals);
 const metadata=new Map(manifest.metadataFunctions.map(address=>[BigInt(address),record(id++)]));
 const bytes=(p:bigint,n:number)=>{const range=ranges.find(r=>p>=r.address&&p+BigInt(n)<=r.address+BigInt(r.bytes.length));return range?range.bytes.subarray(Number(p-range.address),Number(p-range.address)+n):source.bytes(p,n);};
 const d=(p:bigint,n:number)=>{const b=bytes(p,n);return new DataView(b.buffer,b.byteOffset,n);};
 const memory:ModelBakeMemory={...source,bytes,read32:p=>d(p,4).getUint32(0,true),read64:p=>d(p,8).getBigUint64(0,true),write32:(p,n)=>d(p,4).setUint32(0,n,true),write64:(p,n)=>d(p,8).setBigUint64(0,n,true),write8:(p,n)=>{bytes(p,1)[0]=n;}};
 const services:EnvironmentConstructionServices={metadata:a=>{const p=metadata.get(a);if(p===undefined)throw new Error('Environment metadata service missing');return p;},constructEvent:(m,p)=>{services.metadata(0x1007abc10n);constructOriginalEvent(m.bytes(p,48),m.read32(m.read64(0x101df4208n)+0x38n));},constructChild:child??(()=>{throw new Error('Environment child constructor service missing');})};
 return {memory,services};
}
