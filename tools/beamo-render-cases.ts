import {prepareOriginalBeamoRenderables,findOriginalNamedRenderList,type BeamoRenderServices} from '../src/core/beamo-render-runtime';
import {initializeOriginalVertexRender,initializeOriginalVertexRenderFormat,type VertexRenderServices} from '../src/core/vertex-render-runtime';
import {observeOriginalResource,unlinkOriginalResourceRef} from '../src/core/resource-ref-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const BEAMO_RENDER_BASE=0x3a0000000n,BEAMO_RENDER_BYTES=0x300000;
export interface BeamoRenderMaterial {shader:string;longShader?:boolean;parameters:{name:string;type:number;vectorBits?:number[];texture?:string;longName?:boolean;longTexture?:boolean}[];}
export interface BeamoRenderCase {label:string;mode?:number;materials:BeamoRenderMaterial[];slots:number[];resources:{kind:number;name:string;group?:string;longGroup?:boolean}[];flags?:number;countAfter?:number;parameterCountAfter?:number;contextFound?:boolean;dataComplete?:number;formatColor?:number;initialized?:number;existingData?:boolean;listNull?:boolean;sceneName?:string|null;program?:number;topology?:number;}
export function prepareBeamoRender(c:BeamoRenderCase){
 const b=Buffer.alloc(BEAMO_RENDER_BYTES,0xa5),base=BEAMO_RENDER_BASE,at=(a:bigint)=>Number(a-base),m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:(a:bigint)=>{const start=at(a),end=b.indexOf(0,start);if(start<0||end<start)throw new Error('Invalid prepared C string');return b.toString('utf8',start,end);}};
 const u=(o:number,n:number)=>m.write32(base+BigInt(o),n),p=(o:number,n:number)=>m.write64(base+BigInt(o),n?base+BigInt(n):0n);
 let cursor=0x250000;const text=(s:string)=>{const o=cursor;const bytes=Buffer.from(s+'\0');bytes.copy(b,o);cursor=(o+bytes.length+15)&~15;if(cursor>=0x2d0000)throw new Error('String heap overflow');return o;};
 const str=(o:number,s:string,long?:boolean)=>{b.fill(0,o,o+24);if(long||Buffer.byteLength(s)>22){const ptr=text(s);u(o,0x401);u(o+8,Buffer.byteLength(s));p(o+16,ptr);}else{b[o]=Buffer.byteLength(s)*2;Buffer.from(s).copy(b,o+1);}};
 p(0xa2078,0x1f0000);p(0xa2080,0x1d0000);p(0xc0010,0);m.write64(base+0xc0010n,base);p(0xc0018,0xb0000);p(0xc0020,0x1c0000);p(0xc0068,0x6c838);u(0xb8f30,c.materials.length);
 c.materials.forEach((mat,i)=>{const root=0xb2030+i*0x6f0;str(root+0x28,mat.shader,mat.longShader);u(root+0xc0,mat.parameters.length);mat.parameters.forEach((param,j)=>{const out=root+0xf0+j*0x60;p(root+0x40+j*8,out);str(out+8,param.name,param.longName);b[out+0x20]=param.type;str(out+0x40,param.texture??'',param.longTexture);(param.vectorBits??[0,0,0,0]).forEach((n,k)=>u(out+0x30+k*4,n));});});
 b.copy(b,0x1b0000,0xb0000,0xb8f40);u(0x1b8f30,c.countAfter??c.materials.length);
 c.slots.forEach((n,i)=>u(0x1c0000+i*4,n));b.copy(b,0x1c2000,0x1c0000,0x1c0000+c.slots.length*4);
 const resources=c.resources.map((r,i)=>{const off=0xd0000+i*0x400,name=text(r.name);p(off,0x2e1000);p(off+0x40,0);p(off+0x48,0);p(off+0x50,off);str(off+0xe8,r.group??'Opaque',r.longGroup);u(off+0x100,0x4000+i);u(0x160000+i*24,r.kind);p(0x160008+i*24,off);p(0x160010+i*24,name);return{...r,offset:off};});u(0x1f0000,resources.length);
 for(let i=0;i<16;i++){const out=0x6cc70+i*0x3540;p(out,c.existingData?0x1f6000:0);b[out+0x538]=c.initialized??0;u(out+0x514,0x101+i);}
 b[0x6cc30]=c.dataComplete??1;u(0x1f3108,c.formatColor??3);p(0x1f0108,text('Shader'));p(0x1f0208,text('Image'));p(0x1f1000,0x2e2000);
 m.write64(base+0x2e1030n,0x100198510n);m.write64(base+0x2e1038n,0x100198690n);m.write64(base+0x2e1040n,0x100198730n);m.write64(base+0x2e20a8n,0x1001973a0n);
 u(0xc0600,c.mode??0);u(0xc0604,c.materials.length);u(0xc0608,c.flags??0);u(0xc060c,c.countAfter??0xffffffff);u(0xc0610,c.parameterCountAfter??0xffffffff);u(0xc0614,Number(c.contextFound??true));u(0xc0618,c.program??0x12345678);u(0xc061c,c.topology??2);
 m.write64(base+0xc0620n,c.listNull?0n:base+0x1d0010n);m.write64(base+0xc0628n,c.sceneName===null?0n:base+BigInt(text(c.sceneName??'Opaque')));
 return{b,m,base,resources};
}
export type BeamoRenderEvaluationServices=Omit<BeamoRenderServices,'initializeRenderable'> & VertexRenderServices;
export type BeamoRenderTrace=(kind:number,values:(bigint|number)[])=>bigint[];
export function evaluateBeamoRender(c:BeamoRenderCase,setup?:(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint)=>void,decorate?:(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint,s:BeamoRenderEvaluationServices,trace:BeamoRenderTrace)=>void,after?:(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint)=>void,materialLoop?:(m:ReturnType<typeof prepareBeamoRender>['m'],base:bigint,s:BeamoRenderEvaluationServices)=>void){
 const {b,m,base,resources}=prepareBeamoRender(c),calls:bigint[][]=[],flags=c.flags??0;let observed=0,vectors=0,textures=0,line=0,severity=0,result=0n;
 const call=(kind:number,values:(bigint|number)[])=>{const t=[BigInt(kind),...values.map(BigInt)];calls.push(t);return t;};
 const countMutation=()=>{if(c.parameterCountAfter!==undefined)m.write32(m.read64(base+0xc0008n)+0x98n,c.parameterCountAfter);};
 const s={
  copyCString:(out:bigint,input:bigint,capacity:number)=>{call(1,[out,input,capacity]);const bytes=Buffer.from(m.string(input));m.bytes(out,capacity).fill(0);m.bytes(out,Math.min(bytes.length,capacity)).set(bytes.subarray(0,capacity));},
  cStringLength:(input:bigint)=>{const n=Buffer.byteLength(m.string(input));call(2,[input,n]);return n;},
  shaderType:()=>{call(3,[]);return base+0x1f0100n;},imageType:()=>{call(4,[]);return base+0x1f0200n;},
  lookup:(manager:bigint,type:bigint,name:bigint)=>{const kind=type===base+0x1f0100n?0:1,r=resources.find(r=>r.kind===kind&&r.name===m.string(name)),found=r?base+BigInt(r.offset):0n;call(5,[manager,type,name,found]);return found;},
  callback:(slot:0x30|0x38|0x40,resource:bigint,ref:bigint)=>{call(6,[slot,resource,ref,m.read64(ref),m.read64(ref+8n),m.read64(ref+16n),m.bytes(ref+24n,1)[0]]);if(slot===0x38){if(observed++===0){if(flags&1&&c.countAfter!==undefined)m.write32(base+0xb8f30n,c.countAfter);if(flags&2)m.write64(base+0xc0018n,base+0x1b0000n);}if(flags&4&&ref===base+0xc0090n)unlinkOriginalResourceRef(m,ref);}},
  registerRenderList:(list:bigint,render:bigint)=>{call(7,[list,render]);if(flags&64)m.write64(render+0x500n,list+0xe8n);},
  findRenderContext:(list:bigint,initial:Uint8Array)=>{const t=call(8,[list]);for(let i=0;i<4;i++)t.push(new DataView(initial.buffer,initial.byteOffset).getBigUint64(i*8,true));return{found:c.contextFound??true,context:base+0x1f3000n,format:base+0x1f3100n};},
  graphics:()=>{call(9,[]);return base+0x1f1000n;},createProgram:(graphics:bigint,definition:bigint)=>{call(10,[graphics,definition,m.read32(definition),c.program??0x12345678]);return c.program??0x12345678;},
  initializeParameters:(out:bigint,program:number)=>{call(11,[out,program]);m.write32(out,program);},bindVertexData:(out:bigint,data:bigint,count:number,offset:number)=>{call(12,[out,data,count,offset]);m.write64(out+8n,data);},
  copyBytes:(out:bigint,input:bigint,length:number)=>{call(13,[out,input,length]);m.bytes(out,length).set(Uint8Array.from(m.bytes(input,length)));},
  setVector:(out:bigint,name:bigint,input:bigint)=>{call(14,[out,name,input,m.read64(input),m.read64(input+8n)]);m.bytes(out+0x20n,16).set(Uint8Array.from(m.bytes(input,16)));if(vectors++===0&&(flags&8))countMutation();},
  setTexture:(out:bigint,name:bigint,image:bigint,sampler:bigint)=>{call(15,[out,name,image,sampler]);m.write64(out+0x40n,image);if(textures++===0&&(flags&16))countMutation();},
  request:(manager:bigint,typeName:bigint,name:bigint)=>{call(16,[manager,typeName,name]);if(flags&128){const image=resources.find(r=>r.kind===1);if(image)observeOriginalResource(m,base+BigInt(image.offset),base+0xc0090n,s);}}
 };
 setup?.(m,base);decorate?.(m,base,s,call);
 try{if((c.mode??0)===0){if(materialLoop)materialLoop(m,base,s);else prepareOriginalBeamoRenderables(m,base+0xc0000n,base,c.materials.length,{...s,initializeRenderable:(out,data,shader,list,topology)=>initializeOriginalVertexRender(m,out,data,shader,list,topology,s)});}
 else if(c.mode===1)initializeOriginalVertexRender(m,base+0x6cc70n,base+0x6c838n,base+0xd0100n,m.read64(base+0xc0620n),c.topology??2,s);
 else if(c.mode===2)initializeOriginalVertexRenderFormat(m,base+0x6cc70n,base+0x6c838n,base+0xd0100n,base+0x1f3100n,base+0x1f3000n,c.topology??2,s);
 else if(c.mode===3)result=findOriginalNamedRenderList(m,base+0x1d0000n,m.read64(base+0xc0628n));
 else throw new Error('Unknown mode');after?.(m,base);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const h=Buffer.alloc(20+calls.length*256);h.writeUInt32LE(line);h.writeUInt32LE(severity,4);h.writeUInt32LE(calls.length,8);h.writeBigUInt64LE(result,12);calls.forEach((t,i)=>t.forEach((n,j)=>h.writeBigUInt64LE(BigInt.asUintN(64,n),20+i*256+j*8)));return Buffer.concat([h,b]);
}
