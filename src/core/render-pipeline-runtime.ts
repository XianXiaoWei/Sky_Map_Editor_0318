import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits,numericFloatValue} from './object-numeric-runtime';
import type {VertexRenderServices} from './vertex-render-runtime';
import {unregisterOriginalRenderList} from './render-list-runtime';

export interface OriginalPipelineServices {
 graphics():bigint;
 reflection(graphics:bigint,program:number):bigint;
 createParameterSet(graphics:bigint,program:number):number;
 destroyParameterSet(graphics:bigint,parameters:number):void;
 bindVertexBuffer(graphics:bigint,parameters:number,slot:number,buffer:number,offset:number):void;
 createBuffer(out:bigint,name:string,format:number,usage:number,size:number,extra:number):void;
 allocator():bigint;tag():bigint;
 allocate(allocator:bigint,size:bigint,tag:bigint,alignment:number):bigint;
 free(allocator:bigint,pointer:bigint):void;
 detachBuffer(graphics:bigint,buffer:number):void;
 destroyBuffer(graphics:bigint,buffer:number):void;
}
/** Supply the recovered CPU parameter and stream bodies to the shared Vertex
 * initializer. Reflection, GPU and allocation ownership remain caller services. */
export function connectOriginalVertexRenderPipeline(m:ModelBakeMemory,vertex:Omit<VertexRenderServices,'initializeParameters'|'bindVertexData'>,pipeline:OriginalPipelineServices):VertexRenderServices {
 return {...vertex,initializeParameters:(out,program)=>initializeOriginalRenderPipeline(m,out,program,pipeline),bindVertexData:(out,buffers,count,offset)=>bindOriginalPipelineVertexData(m,out,buffers,count,offset,pipeline)};
}
const signed=(n:number)=>n|0;
const fail=(file:string,line:number,severity:number,expression:string):never=>{throw new NativeObjectFoundationFailure(file,line,severity,expression);};
const compare=(m:ModelBakeMemory,a:bigint,b:bigint)=>{
 for(let i=0n;;i++){const x=m.bytes(a+i,1)[0],y=m.bytes(b+i,1)[0];if(x!==y||x===0)return x-y;}
};
/** Whole normal RenderPipeline initialization 0x1007bfd80. Shader reflection
 * and GPU/heap calls are supplied services; table sorting, allocation sizes,
 * count reloads, all stores and the original assertion execute here. Native
 * counts are signed for sorting/allocation and unsigned for the UBO loop.
 * This does not invent reflection from serialized material parameters. */
export function initializeOriginalRenderPipeline(m:ModelBakeMemory,out:bigint,program:number,s:OriginalPipelineServices){
 const reflection=s.reflection(s.graphics(),program>>>0),definition=m.read64(reflection+8n);
 const textures=m.read64(definition+0x30n),textureCount=signed(m.read32(definition+0x28n));
 const sorted=(table:bigint,count:number,stride:number)=>{
  // Malformed negative counts have no native safe bound; retain that boundary.
  if(count<0)throw new RangeError('Negative native shader reflection count');
  for(let i=1;i<count;i++)if(compare(m,table+BigInt(i)*BigInt(stride),table+BigInt(i-1)*BigInt(stride))<0)
   fail('RenderPipeline.cpp',372,4,'std::is_sorted( shaderRefl->textures, shaderRefl->textures + shaderRefl->textureCount, TextureCompare ) && std::is_sorted( shaderRefl->uniforms, shaderRefl->uniforms + shaderRefl->uniformCount, UniformCompare )');
 };
 sorted(textures,textureCount,32);
 const uniforms=m.read64(definition+0x40n);let uniformCount=signed(m.read32(definition+0x38n));sorted(uniforms,uniformCount,48);
 m.write32(out+0x164n,program);m.write64(out+0x158n,reflection);
 if(m.read32(definition+0x48n)){
  for(let i=0;;i++){
   const name=m.string(definition)+'Uniforms',sizes=m.read64(definition+0x50n),size=m.read32(sizes+BigInt(i)*12n);
   s.createBuffer(out+0x198n+BigInt(i)*40n,name,1,2,size,0);
   const currentSize=m.read32(m.read64(definition+0x50n)+BigInt(i)*12n);
   const pointer=s.allocate(s.allocator(),BigInt(currentSize),s.tag(),16);m.write64(out+0x168n+BigInt(i)*8n,pointer);
   if(((i+1)>>>0)>=m.read32(definition+0x48n))break;
  }
  uniformCount=signed(m.read32(definition+0x38n));
 }
 const table=s.allocate(s.allocator(),BigInt.asUintN(64,BigInt(uniformCount)*8n),s.tag(),16);m.write64(out+0x148n,table);
 const clearCount=signed(m.read32(definition+0x38n));if(clearCount<0)throw new RangeError('Negative native uniform backing count');m.bytes(table,clearCount*8).fill(0);
 for(const offset of [0x120,0x100,0xe0,0xc0,0xa0,0x80,0x60,0x40,0x20,0])m.bytes(out+BigInt(offset),32).fill(0);
 m.write64(out+0x140n,0n);m.write32(out+0x150n,0xffffffff);m.write32(out+0x160n,s.createParameterSet(s.graphics(),program>>>0));
}
/** Whole GpuBuffer read-ID accessor 0x1007950a0. */
export function getOriginalGpuBufferReadId(m:ModelBakeMemory,buffer:bigint){
 const readIndex=m.read32(buffer+0x14n);if(readIndex>=m.read32(buffer+0x18n))fail('GpuBuffer.cpp',90,3,'m_readIdx < m_idCount');return m.read32(buffer+0x1cn+BigInt(readIndex)*4n);
}
/** Whole normal vertex-buffer binding 0x1007bdfd0. Zero-sized slots are
 * skipped before the slot/layout assertion, so even count>6 can be valid when
 * its additional slots are empty. Parameters/layout/handle stay live. */
export function bindOriginalPipelineVertexData(m:ModelBakeMemory,out:bigint,buffers:bigint,count:number,offset:number,s:OriginalPipelineServices){
 for(let i=0;i<(count>>>0);i++){
  const buffer=buffers+BigInt(i)*40n;if(!m.read32(buffer+8n))continue;
  if(i>5||!m.read32(m.read64(m.read64(out+0x158n))+0x100n+BigInt(i)*8n))fail('RenderPipeline.cpp',79,4,'idx < kMaxShaderVertexBuffers && m_reflection->vertexLayout->buffers[ idx ].stride > 0');
  m.write64(out+0x100n+BigInt(i)*8n,buffer);m.write32(out+0x130n+BigInt(i)*4n,offset);
  const graphics=s.graphics(),parameters=m.read32(out+0x160n),id=getOriginalGpuBufferReadId(m,buffer);s.bindVertexBuffer(graphics,parameters,i,id,offset>>>0);
 }
}
/** Whole normal GpuBuffer reset 0x100794f80. The mapped write-ID is detached
 * first, ID count is re-read after every destroy callback, then all 40 bytes
 * are cleared. Buffer object storage and GPU resource ownership are separate. */
export function resetOriginalGpuBuffer(m:ModelBakeMemory,buffer:bigint,s:OriginalPipelineServices){
 if(m.read64(buffer)){const graphics=s.graphics(),index=m.read32(buffer+0x10n),id=m.read32(buffer+0x1cn+BigInt(index)*4n);s.detachBuffer(graphics,id);}
 for(let i=0;i<m.read32(buffer+0x18n);i++){const graphics=s.graphics();s.destroyBuffer(graphics,m.read32(buffer+0x1cn+BigInt(i)*4n));}
 m.bytes(buffer,32).fill(0);m.write64(buffer+32n,0n);
}
/** Whole normal RenderPipeline free 0x1007c0cc0. It marks pipeline=-1 before
 * any buffer callback, re-reads reflection/counts between callbacks, destroys
 * the GPU parameter set and frees the uniform pointer table. Other fields and
 * dangling pointers remain exactly as native; a second free asserts. */
export function freeOriginalRenderPipeline(m:ModelBakeMemory,out:bigint,s:OriginalPipelineServices){
 if(signed(m.read32(out+0x164n))<0)fail('RenderPipeline.cpp',495,4,'m_pipeline >= 0');m.write32(out+0x164n,0xffffffff);
 const definition=()=>m.read64(m.read64(out+0x158n)+8n);
 if(m.read32(definition()+0x48n)){
  for(let i=0;;i++){resetOriginalGpuBuffer(m,out+0x198n+BigInt(i)*40n,s);const count=m.read32(definition()+0x48n);if(((i+1)>>>0)>=count)break;}
  if(m.read32(definition()+0x48n))for(let i=0;;i++){s.free(s.allocator(),m.read64(out+0x168n+BigInt(i)*8n));if(((i+1)>>>0)>=m.read32(definition()+0x48n))break;}
 }
 const graphics=s.graphics();s.destroyParameterSet(graphics,m.read32(out+0x160n));s.free(s.allocator(),m.read64(out+0x148n));
}
/** Whole normal VertexData reset 0x1007f5250; all fourteen embedded GPU
 * buffers use the original reset above. AutoLister/name/owner bytes survive. */
export function resetOriginalVertexData(m:ModelBakeMemory,data:bigint,s:OriginalPipelineServices){
 for(const offset of [0x148,0x170,0x198,0x1c0,0x1e8,0x210,0x248,0x280,0x2b8,0x2f0,0x328,0x360,0x398,0x3d0])resetOriginalGpuBuffer(m,data+BigInt(offset),s);
 m.write32(data+0x140n,0);m.write8(data+0x3f8n,0);m.bytes(data+0x11cn,32).fill(0);
 for(const offset of [0x100,0xe0,0xc0,0xa0,0x80,0x60,0x40,0x20,0])m.bytes(data+BigInt(offset),32).fill(0);
}
export interface OriginalRenderableResetServices extends OriginalPipelineServices {
 unregisterRenderList?(list:bigint,render:bigint):void;
 destroyProgram(graphics:bigint,program:number):void;
 defaultMatrix():bigint;
}
/** Whole normal Renderable reset 0x1007f6b80. Initialized is any nonzero byte,
 * unlike Initialize's ==1 check. List pointer is retained, program ID is read
 * after parameter free callbacks, and original transform/default OBB/reset
 * fields are restored without calling the broader constructor. */
export function resetOriginalRenderable(m:ModelBakeMemory,out:bigint,s:OriginalRenderableResetServices){
 if(m.bytes(out+0x538n,1)[0]){
  const list=m.read64(out+0x500n);if(list){if(s.unregisterRenderList)s.unregisterRenderList(list,out);else unregisterOriginalRenderList(m,list,out);}
  freeOriginalRenderPipeline(m,out+0x270n,s);const graphics=s.graphics();s.destroyProgram(graphics,m.read32(out+0x90n));
 }
 const identity=[[0x3f800000,0,0,0],[0,0x3f800000,0,0],[0,0,0x3f800000,0],[0,0,0,0x3f800000]];
 const store=(at:number,v:number[])=>v.forEach((n,i)=>m.write32(out+BigInt(at+i*4),n));identity.forEach((axis,i)=>store(16+i*16,axis));
 const matrix=s.defaultMatrix(),axes=Array.from({length:3},(_,i)=>Array.from({length:4},(_,j)=>{
  if(j===3)return 0;const bits=m.read32(matrix+BigInt(i*16+j*4));return (bits&0x7fffffff)>0x7f800000?(bits|0x400000)>>>0:numericFloatBits(numericFloatValue(0x4e6e6b28)*numericFloatValue(bits));
 }));axes.forEach((axis,i)=>store(80+i*16,axis));store(128,identity[3]);
 m.write64(out+0x4f8n,0n);store(0x508,[0,0xffffffff,0xffffffff,0]);m.write32(out+0x518n,0);m.write32(out+0x524n,4);m.write8(out+0x529n,0);m.write64(out,0n);m.write8(out+0x538n,0);m.write32(out+0x53cn,0);
}
