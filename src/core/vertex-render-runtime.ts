import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {originalRenderListServices,registerOriginalRenderList} from './render-list-runtime';
export interface VertexRenderServices {
 registerRenderList?(list:bigint,render:bigint):void;
 findRenderContext?(list:bigint,initialFormat:Uint8Array):{found:boolean;context:bigint;format:bigint};
 graphics():bigint;
 createProgram(graphics:bigint,shaderDefinition:bigint):number;
 initializeParameters(parameters:bigint,program:number):void;
 bindVertexData(parameters:bigint,data:bigint,count:number,offset:number):void;
 copyBytes(out:bigint,input:bigint,length:number):void;
}
const fail=(line:number,severity:number,expression:string):never=>{throw new NativeObjectFoundationFailure('Vertex.cpp',line,severity,expression);};
/** Whole normal shared VertexRender initializer 0x1007f5fb0. The original
 * 0x134-byte copy takes VertexData (RSI), not ShaderDef. Format/context input
 * snapshots, stores, graphics program creation, parameters and VertexData
 * binding retain native order. Heap/GPU services remain explicit. */
export function initializeOriginalVertexRenderFormat(m:ModelBakeMemory,render:bigint,data:bigint,shader:bigint,format:bigint,context:bigint,topology:number,s:VertexRenderServices){
 if(m.bytes(render+0x538n,1)[0]===1)fail(225,3,'!m_isInitialized');
 if(!m.bytes(data+0x3f8n,1)[0])fail(226,4,'data->m_complete');
 if(m.read64(render))fail(227,4,'!m_vertexData');
 if(!m.read32(format+8n))fail(228,4,'renderFormat->color[0] != TexelFormat_Undefined');
 m.write64(render,data);m.write64(render+0x4f8n,shader);m.bytes(render+0x529n,2).set([1,0]);m.write32(render+0x51cn,topology);
 m.write32(render+0x94n,m.read32(shader));s.copyBytes(render+0x98n,data,0x134);
 m.bytes(render+0x1ccn,32).set(m.bytes(format,32));
 const draw=Uint8Array.from(m.bytes(context,128));
 for(const offset of [32,64,96,0])m.bytes(render+0x1ecn+BigInt(offset),32).set(draw.subarray(offset,offset+32));
 const program=s.createProgram(s.graphics(),render+0x94n);m.write32(render+0x90n,program);
 const parameters=render+0x270n;s.initializeParameters(parameters,program);
 s.bindVertexData(parameters,m.read64(render)+0x148n,6,m.read32(render+0x514n));m.write8(render+0x538n,1);
}
/** Whole normal RenderList wrapper 0x1007f5e90. The list is registered before
 * context lookup, including its failure path. The context service sees the
 * original zeroed 32-byte format scratch. By default the recovered RenderList
 * registration/lookup bodies supply live format/context storage; callers may
 * still override them for independently verified ABI services. */
export function initializeOriginalVertexRender(m:ModelBakeMemory,render:bigint,data:bigint,shader:bigint,list:bigint,topology:number,s:VertexRenderServices){
 if(m.bytes(render+0x538n,1)[0]===1)fail(206,3,'!m_isInitialized');
 if(!list)fail(209,3,'renderList');
 m.write64(render+0x500n,list);
 if(s.registerRenderList)s.registerRenderList(list,render);else registerOriginalRenderList(m,list,render);
 const selected=(s.findRenderContext??originalRenderListServices(m).findRenderContext)(m.read64(render+0x500n),new Uint8Array(32));
 if(!selected.found)fail(218,4,'foundContext');
 initializeOriginalVertexRenderFormat(m,render,data,shader,selected.format,selected.context,topology,s);
}
