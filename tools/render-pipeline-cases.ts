import {prepareBeamoRender,evaluateBeamoRender,type BeamoRenderCase,type BeamoRenderEvaluationServices,type BeamoRenderTrace} from './beamo-render-cases';
import {prepareOriginalBeamoRenderablesWithPipeline} from '../src/core/beamo-render-runtime';
import {connectOriginalVertexRenderPipeline,bindOriginalPipelineVertexData,resetOriginalRenderable,resetOriginalVertexData,freeOriginalRenderPipeline,type OriginalRenderableResetServices} from '../src/core/render-pipeline-runtime';
export interface RenderPipelineCase {label:string;input:BeamoRenderCase;uniformNames:string[];textureNames:string[];uboSizes:number[];bufferSizes?:number[];extraBufferSizes?:number[];defaultMatrixBits?:number[];strides?:number[];idCount?:number;readIndex?:number;writeIndex?:number;mapped?:boolean;flags?:number;uboCountAfter?:number;uniformCountAfter?:number;reset?:number;postBindCount?:number;}
function setup(c:RenderPipelineCase,m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint){
 const ptr=(o:number)=>base+BigInt(o),str=(o:number,s:string,max:number)=>{const encoded=Buffer.from(s+'\0');if(encoded.length>max)throw new Error('Prepared reflection name exceeds native name storage');m.bytes(ptr(o),max).fill(0);m.bytes(ptr(o),encoded.length).set(encoded);};
 for(const [offset,address] of [[0x2e20b8,0x100197b00n],[0x2e20d0,0x100197b20n],[0x2e20d8,0x100197b40n],[0x2e20e0,0x100197b60n],[0x2e2160,0x100197b80n],[0x2e2150,0x100197bc0n],[0x2e20c0,0x100197be0n]] as const)m.write64(ptr(offset),address);
 m.write64(ptr(0x220000),ptr(0x22a000));m.write64(ptr(0x220008),ptr(0x221000));str(0x221000,'PreparedShader',28);
 m.write32(ptr(0x221028),c.textureNames.length);m.write64(ptr(0x221030),ptr(0x222000));m.write32(ptr(0x221038),c.uniformNames.length);m.write64(ptr(0x221040),ptr(0x224000));m.write32(ptr(0x221048),c.uboSizes.length);m.write64(ptr(0x221050),ptr(0x228000));
 c.textureNames.forEach((s,i)=>str(0x222000+i*32,s,28));c.uniformNames.forEach((s,i)=>str(0x224000+i*48,s,28));c.uboSizes.forEach((n,i)=>m.write32(ptr(0x228000+i*12),n));
 for(let i=0;i<6;i++)m.write32(ptr(0x22a100+i*8),c.strides?.[i]??48);
 for(let i=0;i<4;i++)for(let j=0;j<4;j++)m.write32(ptr(0x22b000+i*16+j*4),c.defaultMatrixBits?.[i*4+j]??(i===j?0x3f800000:0));
 for(const o of [0x148,0x170,0x198,0x1c0,0x1e8,0x210,0x248,0x280,0x2b8,0x2f0,0x328,0x360,0x398,0x3d0])m.bytes(ptr(0x6c838+o),40).fill(0);
 for(let i=0;i<7;i++){const buffer=ptr(0x6c980+i*40);m.write32(buffer+8n,c.bufferSizes?.[i]??(i===0?48:0));if(i===6)continue;
  m.write64(buffer,c.mapped?ptr(0x22f000):0n);m.write32(buffer+0x10n,c.writeIndex??0);m.write32(buffer+0x14n,c.readIndex??0);m.write32(buffer+0x18n,c.idCount??2);for(let j=0;j<3;j++)m.write32(buffer+0x1cn+BigInt(j)*4n,0x5100+i*16+j);
 }
 for(const [i,o] of [0x248,0x280,0x2b8,0x2f0,0x328,0x360,0x398,0x3d0].entries()){if(c.extraBufferSizes?.[i]===undefined)continue;const b=ptr(0x6c838+o);m.write64(b,c.mapped?ptr(0x22f000):0n);m.write32(b+8n,c.extraBufferSizes[i]);m.write32(b+0x10n,c.writeIndex??0);m.write32(b+0x14n,c.readIndex??0);m.write32(b+0x18n,c.idCount??2);for(let j=0;j<3;j++)m.write32(b+0x1cn+BigInt(j)*4n,0x5100+(i+6)*16+j);}
 m.write32(ptr(0x220080),0x230000);
 const renderCount=(c.input.mode??0)===0?Math.max(0,...c.input.slots.filter(n=>n!==0xffffffff))+1:1;
 [c.flags??0,c.uboCountAfter??0,c.uniformCountAfter??0,c.postBindCount??0xffffffff,c.reset??3,renderCount,+!!c.mapped,c.idCount??2].forEach((n,i)=>m.write32(ptr(0x220100+i*4),n));
}
export function prepareRenderPipeline(c:RenderPipelineCase){const p=prepareBeamoRender(c.input);setup(c,p.m,p.base);return p;}
export function evaluateRenderPipeline(c:RenderPipelineCase,before?:(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint)=>void){
 let services:OriginalRenderableResetServices;let allocateCount=0,createCount=0,destroyCount=0,freeCount=0,bindCount=0;
 const extend=(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint,s:BeamoRenderEvaluationServices,trace:BeamoRenderTrace)=>{
  const ptr=(o:number)=>base+BigInt(o),flags=c.flags??0;
  services={graphics:s.graphics,reflection:(g,program)=>{trace(17,[g,program,ptr(0x220000)]);return ptr(0x220000);},createParameterSet:(g,program)=>{trace(18,[g,program,0x76543210]);return 0x76543210;},destroyParameterSet:(g,id)=>{trace(19,[g,id]);if(flags&64)for(let i=0;i<16;i++)m.write64(ptr(0x6cc70+i*0x3540+0x270+0x148),ptr(0x22e000));},bindVertexBuffer:(g,id,slot,buffer,offset)=>{trace(20,[g,id,slot,buffer,offset]);if(bindCount++===0&&(flags&16)){m.write32(ptr(0x6cc70+0x270+0x160),0x9999);m.write32(ptr(0x6c980+40+8),0);}},
   createBuffer:(out,name,format,usage,size,extra)=>{const row=trace(21,[out,format,usage,size,extra]),string=Buffer.alloc(128);Buffer.from(name+'\0').copy(string);for(let i=0;i<16;i++)row.push(string.readBigUInt64LE(i*8));const index=createCount++;m.bytes(out,40).fill(0);m.write64(out,c.mapped?ptr(0x22f000):0n);m.write32(out+8n,size);m.write32(out+0x10n,0);m.write32(out+0x14n,0);m.write32(out+0x18n,c.idCount??2);for(let j=0;j<3;j++)m.write32(out+0x1cn+BigInt(j)*4n,0x6100+index*16+j);if(index===0&&(flags&1))m.write32(ptr(0x221048),c.uboCountAfter??0);},
   allocator:()=>ptr(0x22c000),tag:()=>ptr(0x22c100),allocate:(allocator,size,tag,alignment)=>{const cursor=m.read32(ptr(0x220080)),offset=(cursor+alignment-1)&~(alignment-1),out=ptr(offset);if(size>0x10000n||offset+Number(size)>0x250000)throw new Error('Prepared native allocation exceeded scratch');m.write32(ptr(0x220080),offset+Math.max(Number(size),16));trace(22,[allocator,size,tag,alignment,out]);if(allocateCount++===0&&(flags&2))m.write32(ptr(0x221038),c.uniformCountAfter??0);return out;},free:(allocator,pointer)=>{trace(23,[allocator,pointer]);if(freeCount++===0&&(flags&8))m.write32(ptr(0x221048),c.uboCountAfter??0);},detachBuffer:(g,id)=>{trace(24,[g,id]);if(flags&128){const count=c.idCount??2;for(let i=0;i<14;i++){const o=[0x148,0x170,0x198,0x1c0,0x1e8,0x210,0x248,0x280,0x2b8,0x2f0,0x328,0x360,0x398,0x3d0][i],b=ptr(0x6c838+o);if(count&&m.read32(b+0x1cn)===id)m.write32(b+0x18n,0);}}
   },destroyBuffer:(g,id)=>{trace(25,[g,id]);if(destroyCount++===0&&(flags&4)){m.write32(ptr(0x6c980+0x18),0);for(let i=0;i<16;i++)m.write32(ptr(0x6cc70+i*0x3540+0x270+0x198+0x18),0);}},unregisterRenderList:(list,render)=>{trace(26,[list,render]);if(flags&32)m.write32(render+0x90n,0x87654321);},destroyProgram:(g,id)=>trace(27,[g,id]),defaultMatrix:()=>ptr(0x22b000)};
  Object.assign(s,connectOriginalVertexRenderPipeline(m,s,services));
 };
 return evaluateBeamoRender(c.input,(m,base)=>{setup(c,m,base);before?.(m,base);},extend,(m,base)=>{
  const ptr=(o:number)=>base+BigInt(o);if(c.postBindCount!==undefined)bindOriginalPipelineVertexData(m,ptr(0x6cc70+0x270),ptr(0x6c980),c.postBindCount,m.read32(ptr(0x6cc70+0x514)),services);
  const reset=c.reset??3;if(reset&2)resetOriginalVertexData(m,ptr(0x6c838),services);
  if(reset&1)for(let i=0;i<m.read32(ptr(0x220114));i++)resetOriginalRenderable(m,ptr(0x6cc70+i*0x3540),services);
  if(reset&8){freeOriginalRenderPipeline(m,ptr(0x6cc70+0x270),services);freeOriginalRenderPipeline(m,ptr(0x6cc70+0x270),services);}
 },(m,base,s)=>prepareOriginalBeamoRenderablesWithPipeline(m,base+0xc0000n,base,c.input.materials.length,s,s,services));
}
