import evidence from '../../docs/model-draw-native.json';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
export interface VertexStreamMemory {read32(address:bigint):number;write32(address:bigint,value:number):void;}
export interface VertexStreamInput {index:number;formats:bigint;semantics:bigint;attributeCount:number;bufferMode:number;divisor:number;data:bigint;}
export interface VertexBufferArguments {buffer:bigint;name:bigint;usage:number;mode:number;bytes:number;data:bigint;}
/** Whole original normal VertexData stream setter 0x1007f5430. Buffer creation
 * is an explicit dependency; this recovers descriptors, offset accumulation,
 * vertex/instance size selection and original mutation-before-assert order. */
export function setOriginalVertexStream(m:VertexStreamMemory,vertex:bigint,input:VertexStreamInput,createBuffer:(args:VertexBufferArguments)=>void){
  const fail=(line:number,expression:string):never=>{throw new NativeObjectFoundationFailure('Vertex.cpp',line,3,expression);};
  const index=input.index>>>0,count=input.attributeCount>>>0,divisor=input.divisor>>>0;
  if(index>=6)fail(60,'idx < kMaxVertexBuffers');
  const buffer=vertex+0x148n+BigInt(index)*40n;
  if(m.read32(buffer+8n)!==0)fail(61,'m_vertexBuffers[ idx ].GetUsage() == Bind_None');
  const initial=m.read32(vertex+0x130n);let offset=0,formats=input.formats,semantics=input.semantics;
  for(let i=0;i<count;i++){
    const attribute=vertex+BigInt((initial+i)>>>0)*16n;
    m.write32(attribute,m.read32(semantics));m.write32(attribute+4n,m.read32(formats));m.write32(attribute+12n,index);m.write32(attribute+8n,offset);
    const format=m.read32(formats),size=format>=1&&format<=35?evidence.formatByteSizes[format-1]:0;
    offset=(offset+size)>>>0;formats+=4n;semantics+=4n;
  }
  const total=(initial+count)>>>0;m.write32(vertex+0x130n,total);
  m.write32(vertex+0x100n+BigInt(index)*8n,offset);m.write32(vertex+0x104n+BigInt(index)*8n,divisor);
  if(total>=17)fail(78,'m_format.attributeCount <= kMaxShaderAttributes');
  const elements=m.read32(vertex+(divisor===0?0x13cn:0x140n));
  createBuffer({buffer,name:vertex+0x418n,usage:2,mode:input.bufferMode>>>0,bytes:Number(BigInt(offset)*BigInt(elements)&0xffffffffn),data:input.data});
}
