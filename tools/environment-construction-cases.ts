import info from '../docs/environment-construction.json';
import {constructOriginalEnvironmentObject,type EnvironmentConstructionClass} from '../src/core/environment-construction-runtime';
import {constructOriginalEvent} from '../src/core/event-start-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';
export const CONSTRUCTION_BASE=0x410000000n;
export interface ConstructionCase {className:EnvironmentConstructionClass;fill:number;repeat:number;mutationAt:number;vectorValue:number;}
export const constructionCases=()=>Object.keys(info.classes).flatMap(className=>[0,0xa5,0xff].flatMap(fill=>[0,1,2].map(vectorValue=>({className:className as EnvironmentConstructionClass,fill,repeat:3,mutationAt:vectorValue===2?2:0,vectorValue}))));
export const constructionGlobalAddresses=Object.keys(info.globalReads).map(BigInt);
export function prepareConstruction(c:ConstructionCase){
 const b=Buffer.alloc(65536,c.fill),base=CONSTRUCTION_BASE,globals=new Map<bigint,number>();
 const global=(p:bigint,bytes:Uint8Array)=>bytes.forEach((v,i)=>globals.set(p+BigInt(i),v));
 let index=0;for(const [address,hex] of Object.entries(info.initialGlobalHex)){const p=BigInt(address),bytes=Buffer.from(hex,'hex');if(p>0x101000000n&&bytes.length===8&&p!==0x101df0a68n){bytes.writeBigUInt64LE(base+0x8000n+BigInt(index++)*0x100n);}if(bytes.length>=16&&p>0x101000000n)for(let j=0;j<bytes.length/4;j++)bytes.writeFloatLE(c.vectorValue===0?0:c.vectorValue*(j+1)/8,j*4);global(p,bytes);}
 for(let i=0;i<64;i++)b.writeUInt32LE(77+i,0x8000+i*0x100+0x38);
 global(0x101df0a68n,Buffer.alloc(8));b.writeUInt32LE(c.mutationAt,0xf000);b.writeUInt32LE(c.repeat,0xf004);
 const external=(p:bigint,n:number)=>Uint8Array.from({length:n},(_,i)=>{const v=globals.get(p+BigInt(i));if(v===undefined)throw new Error(`Unprepared native global ${p.toString(16)}`);return v;});
 const bytes=(p:bigint,n:number)=>{if(p>=base&&p+BigInt(n)<=base+BigInt(b.length))return b.subarray(Number(p-base),Number(p-base)+n);return external(p,n);};
 const write=(p:bigint,v:Uint8Array)=>{if(p>=base&&p+BigInt(v.length)<=base+BigInt(b.length))b.set(v,Number(p-base));else global(p,v);};
 const m:ModelBakeMemory={bytes,read32:p=>Buffer.from(bytes(p,4)).readUInt32LE(),read64:p=>Buffer.from(bytes(p,8)).readBigUInt64LE(),write32:(p,n)=>{const v=Buffer.alloc(4);v.writeUInt32LE(n>>>0);write(p,v);},write64:(p,n)=>{const v=Buffer.alloc(8);v.writeBigUInt64LE(n);write(p,v);},write8:(p,n)=>write(p,Uint8Array.of(n&255)),string:()=>{throw new Error('No string construction');}};
 const packet=()=>Buffer.concat([b,...constructionGlobalAddresses.map(p=>Buffer.from(bytes(p,info.globalReads['0x'+p.toString(16) as keyof typeof info.globalReads])))]);
 return {b,m,base,packet,global};
}
export function evaluateConstruction(c:ConstructionCase){
 const {b,m,base,global}=prepareConstruction(c),calls:bigint[][]=[];let result=0n;
 const mutate=()=>{if(calls.length!==c.mutationAt)return;const vector=Buffer.alloc(16);for(let j=0;j<4;j++)vector.writeFloatLE(-(j+1)*.125,j*4);global(0x10203f6e0n,vector);m.write32(base+0x8038n,0x12345678);};
 const metadata=(a:bigint)=>{const i=info.metadataFunctions.indexOf('0x'+a.toString(16));if(i<0)throw new Error('Unknown metadata');calls.push([a,0n]);mutate();return base+0xc000n+BigInt(i)*0x100n;};
 // Each explicit metadata getter result has a distinct class ID, including
 // base Object metadata; direct native global IDs are independently prepared.
 for(let i=0;i<info.metadataFunctions.length;i++)m.write32(base+0xc038n+BigInt(i)*0x100n,1000+i);
 for(let i=0;i<c.repeat;i++)result=constructOriginalEnvironmentObject(m,base+0x1000n+BigInt(i)*0x2000n,c.className,{metadata,constructEvent:(m,p)=>{metadata(0x1007abc10n);constructOriginalEvent(m.bytes(p,48),m.read32(m.read64(0x101df4208n)+0x38n));},constructChild:(m,a,p)=>{calls.push([a,p]);m.bytes(p,a===0x1007f5010n?0x438:0x560).fill(a===0x1007f5010n?0x31:0x47);mutate();}});
 const header=Buffer.alloc(12+calls.length*16);header.writeBigUInt64LE(result);header.writeUInt32LE(calls.length,8);calls.forEach((v,i)=>{header.writeBigUInt64LE(v[0],12+i*16);header.writeBigUInt64LE(v[1],20+i*16);});
 const footer=Buffer.alloc(8);footer.writeBigUInt64LE(m.read64(0x101df0a68n));return Buffer.concat([header,b,footer]);
}
