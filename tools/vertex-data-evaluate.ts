import {constructOriginalVertexData,constructOriginalRenderData,registerOriginalVertexData,type VertexDataMemory,type VertexListServices} from '../src/core/vertex-data-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';import {VERTEX_DATA_BASE as O,type VertexDataCase} from './vertex-data-cases';
export function evaluateVertexData(c:VertexDataCase){
 const b=Buffer.from(c.memory,'hex'),bytes=(p:bigint,n:number)=>{const at=Number(p-O);if(at<0||at+n>b.length)throw new Error('Unprepared Vertex data memory');return b.subarray(at,at+n);};
 const m:VertexDataMemory={bytes,read32:p=>bytes(p,4).readUInt32LE(),read64:p=>bytes(p,8).readBigUInt64LE(),write32:(p,n)=>bytes(p,4).writeUInt32LE(n>>>0),write64:(p,n)=>bytes(p,8).writeBigUInt64LE(n)};
 let mutated=false;const rows:{line:number;severity:number;services:number[][];memory:string}[]=[];
 for(const [op,offset] of c.actions){const services:number[][]=[],s:VertexListServices={variables:()=>m.read64(O+0x1700n),lock:vars=>{services.push([1,vars?Number(vars-O):0xffffffff]);if(!mutated&&c.mutation){mutated=true;m.write64(O+0x1700n,c.mutation===1?0n:O+0x1500n);}},unlock:()=>services.push([2,0])};let line=0,severity=0;
  try{const out=O+BigInt(offset);if(op===0)constructOriginalVertexData(m,out,s);else if(op===1||op===2)constructOriginalRenderData(m,out,()=>m.read64(O+0x1710n));else if(op===3)registerOriginalVertexData(m,out,s);else throw new Error('Invalid Vertex data operation');}catch(e){if(e instanceof NativeObjectFoundationFailure){line=e.line;severity=e.severity;}else throw e;}
  rows.push({line,severity,services,memory:b.toString('hex')});if(line)break;
 }return rows;
}
