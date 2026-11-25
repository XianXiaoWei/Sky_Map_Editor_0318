import {setOriginalVertexStream} from '../src/core/vertex-stream-runtime';
export interface VertexStreamCase {name:string;args:number[];memory:string;}
export function evaluateVertexStream(input:VertexStreamCase){
  const bytes=Buffer.from(input.memory,'hex'),base=0x2f0000000n,d=new DataView(bytes.buffer,bytes.byteOffset,bytes.length),[out,index,formats,semantics,count,mode,divisor,data]=input.args;
  const memory={read32:(a:bigint)=>d.getUint32(Number(a-base),true),write32:(a:bigint,n:number)=>d.setUint32(Number(a-base),n,true)};
  let line=0,severity=0,calls=0,args=Array(6).fill(0);
  try{setOriginalVertexStream(memory,base+BigInt(out),{index,formats:base+BigInt(formats),semantics:base+BigInt(semantics),attributeCount:count,bufferMode:mode,divisor,data:data===0xffffffff?0n:base+BigInt(data)},a=>{calls++;args=[Number(a.buffer-base),Number(a.name-base),a.usage,a.mode,a.bytes,a.data?Number(a.data-base):0xffffffff];});}
  catch(e){if(!('line' in (e as object)))throw e;line=(e as any).line;severity=(e as any).severity;}
  return {line,severity,calls,args,memory:bytes.toString('hex')};
}
