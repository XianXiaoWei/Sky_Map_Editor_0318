import {constructOriginalResourceRef,type ResourceRefMemory} from '../src/core/resource-ref-runtime';
export const REF_BASE=0x2b0000000n,REF_BYTES=4096,REF_VTABLE=REF_BASE+0x10000n;
export interface ResourceRefCase {name:string;memory:string;actions:number[][];slot:number;mutation:number;nullResources:number;}
export function resourceRefMemory(b:Buffer):ResourceRefMemory {
 const bytes=(p:bigint,n:number)=>{const at=Number(p-REF_BASE);if(at<0||at+n>b.length)throw new Error(`Unmapped ResourceRef ${p.toString(16)}`);return b.subarray(at,at+n);};
 return {bytes,read64:p=>bytes(p,8).readBigUInt64LE(),write64:(p,n)=>bytes(p,8).writeBigUInt64LE(n),write8:(p,n)=>{bytes(p,1)[0]=n;}};
}
export const refAddress=(i:number)=>REF_BASE+0x800n+BigInt(i)*32n,resourceAddress=(i:number)=>REF_BASE+0x200n+BigInt(i)*256n;
export function resourceRefCases():ResourceRefCase[]{
 const cases:ResourceRefCase[]=[],initial=()=>{const b=Buffer.alloc(REF_BYTES,0xa5);for(let i=0;i<4;i++){b.writeBigUInt64LE(REF_VTABLE,0x200+i*256);b.writeBigUInt64LE(0n,0x240+i*256);b.writeBigUInt64LE(0n,0x248+i*256);b.writeBigUInt64LE(resourceAddress(i),0x250+i*256);}return b.toString('hex');};
 const add=(name:string,actions:number[][],slot=0,mutation=0,nullResources=0)=>cases.push({name,memory:initial(),actions,slot,mutation,nullResources});
 const init=()=>Array.from({length:8},(_,i)=>[0,i,0]);
 add('constructor-padding',[[0,0,0]]);add('constructor-repeat',[[0,0,0],[0,0,0]]);
 for(const order of [[0,1,2,3,4,5,6,7],[7,6,5,4,3,2,1,0],[3,4,2,5,1,6,0,7]])for(const resources of [1,2,4])for(const nullResources of [0,1,3,15]){
  const actions=[...init(),...Array.from({length:8},(_,i)=>[1,i,i%resources]),...order.map(i=>[2,i,0])];add(`remove-${order[0]}-${resources}-${nullResources}`,actions,0,0,nullResources);
 }
 for(const count of [1,2,4,8])for(const target of [0,1,3])for(const nullResources of [0,1,3]){
  const actions=[...init(),...Array.from({length:count},(_,i)=>[1,i,0]),[1,0,target],[1,0,target],...Array.from({length:count},(_,i)=>[2,i,0])];add(`reobserve-${count}-${target}-${nullResources}`,actions,0,0,nullResources);
 }
 for(const slot of [0x30,0x38,0x40])for(const mutation of [1,2,3,4,5])for(const nullResources of [0,2]){
  const actions=[...init(),[1,1,0],[1,2,1],[1,0,0],slot===0x40?[1,0,1]:[2,0,0],[3,1,0],[2,2,0],[2,3,0],[2,0,0]];
  add(`callback-${slot}-${mutation}-${nullResources}`,actions,slot,mutation,nullResources);
 }
 for(const index of [0,1,3,7])add(`cleanup-${index}`,[...init(),...Array.from({length:8},(_,i)=>[1,i,0]),[3,index,0],...[0,1,2,3,4,5,6,7].filter(i=>i!==index).map(i=>[2,i,0])]);
 // A detached ref may retain fields not written by Observe. The original
 // constructor is deliberately skipped for ref0 in this prepared case.
 const retained:ResourceRefCase={name:'detached-retained-observed-byte',memory:initial(),actions:[[1,0,0],[2,0,0]],slot:0,mutation:0,nullResources:0};const b=Buffer.from(retained.memory,'hex'),m=resourceRefMemory(b);constructOriginalResourceRef(m,refAddress(0));b[0x818]=0xfe;retained.memory=b.toString('hex');cases.push(retained);
 return cases;
}
export function resourceRefInput(c:ResourceRefCase):Buffer {const h=Buffer.alloc(16);[c.actions.length,c.slot,c.mutation,c.nullResources].forEach((n,i)=>h.writeUInt32LE(n,i*4));const a=Buffer.alloc(c.actions.length*12);c.actions.forEach((r,i)=>r.forEach((n,j)=>a.writeUInt32LE(n,i*12+j*4)));return Buffer.concat([h,Buffer.from(c.memory,'hex'),a]);}
