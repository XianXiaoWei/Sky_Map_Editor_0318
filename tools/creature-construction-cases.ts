import info from '../docs/creature-construction.json';
import itemInfo from '../docs/object-item-construction.json';
import {constructOriginalObjectItem,type ObjectItemConstructionClass} from '../src/core/object-item-construction-runtime';
import {constructOriginalCreatureObject,type CreatureConstructionClass} from '../src/core/creature-construction-runtime';
import {constructOriginalEvent} from '../src/core/event-start-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';
export interface CreatureConstructionCase {className:CreatureConstructionClass|ObjectItemConstructionClass;family?:'item';fill:number;repeat:number;mutationAt:number;}
const manifest=(c:CreatureConstructionCase)=>c.family==='item'?itemInfo:info;
export const creatureConstructionCases=()=>Object.keys(info.classes).flatMap(className=>[0,0xa5,0xff].flatMap(fill=>[0,2].map(mutationAt=>({className:className as CreatureConstructionClass,fill,repeat:3,mutationAt}))));
export const objectItemConstructionCases=():CreatureConstructionCase[]=>Object.keys(itemInfo.classes).flatMap(className=>[0,0xa5,0xff].flatMap(fill=>[0,2].map(mutationAt=>({className:className as ObjectItemConstructionClass,family:'item' as const,fill,repeat:3,mutationAt}))));
export function prepareCreatureConstruction(c:CreatureConstructionCase){
 const info=manifest(c);
 const base=0x410000000n,b=Buffer.alloc(65536,c.fill),globals=new Map<bigint,Uint8Array>();let index=0;
 for(const [address,hex] of Object.entries(info.initialGlobalHex)){const p=BigInt(address),bytes=Buffer.from(hex,'hex');if(p>0x101000000n&&bytes.length===8)bytes.writeBigUInt64LE(base+0x8000n+BigInt(index++)*0x100n);globals.set(p,bytes);}
 for(let i=0;i<64;i++)b.writeUInt32LE(77+i,0x8000+i*0x100+56);
 for(let i=0;i<info.metadataFunctions.length;i++)b.writeUInt32LE(1000+i,0xc000+i*256+56);
 const bytes=(p:bigint,n:number)=>{if(p>=base&&p+BigInt(n)<=base+65536n)return b.subarray(Number(p-base),Number(p-base)+n);for(const [a,v] of globals)if(p>=a&&p+BigInt(n)<=a+BigInt(v.length))return v.subarray(Number(p-a),Number(p-a)+n);throw new Error('Unprepared creature address '+p.toString(16));};
 const view=(p:bigint,n:number)=>{const v=bytes(p,n);return new DataView(v.buffer,v.byteOffset,n);};
 const m:ModelBakeMemory={bytes,read32:p=>view(p,4).getUint32(0,true),read64:p=>view(p,8).getBigUint64(0,true),write32:(p,n)=>view(p,4).setUint32(0,n,true),write64:(p,n)=>view(p,8).setBigUint64(0,n,true),write8:(p,n)=>{bytes(p,1)[0]=n;},string:()=>''};
 return {b,m,base,packet:()=>Buffer.concat([b,...globals.values()])};
}
export function evaluateCreatureConstruction(c:CreatureConstructionCase){
 const info=manifest(c);
 const {b,m,base}=prepareCreatureConstruction(c),calls:bigint[][]=[];
 const metadata=(a:bigint)=>{const i=info.metadataFunctions.indexOf('0x'+a.toString(16));if(i<0)throw new Error('Unknown creature metadata');calls.push([a,0n]);if(calls.length===c.mutationAt)m.write32(base+0x8038n,0x12345678);return base+0xc000n+BigInt(i)*256n;};
 let result=0n;
 const services={metadata,constructEvent:(memory:ModelBakeMemory,p:bigint)=>{metadata(0x1007abc10n);constructOriginalEvent(memory.bytes(p,48),memory.read32(memory.read64(0x101df4208n)+56n));},constructChild:()=>{throw new Error('Unexpected parent child');}};
 for(let i=0;i<c.repeat;i++){const out=base+0x1000n+BigInt(i)*0x2000n;result=c.family==='item'?constructOriginalObjectItem(m,out,c.className as ObjectItemConstructionClass,services):constructOriginalCreatureObject(m,out,c.className as CreatureConstructionClass,services);}
 const header=Buffer.alloc(12+calls.length*16);header.writeBigUInt64LE(result);header.writeUInt32LE(calls.length,8);calls.forEach((row,i)=>row.forEach((v,j)=>header.writeBigUInt64LE(v,12+i*16+j*8)));
 return Buffer.concat([header,b]);
}
