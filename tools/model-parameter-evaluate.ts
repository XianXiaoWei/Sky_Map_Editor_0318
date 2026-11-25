import {OriginalLevelMeshMaterialEndpoint,findOriginalLevelMeshParameter,findOriginalModelUniform,setOriginalModelParameter,setOriginalLevelMeshParameterFloat,setOriginalLevelMeshParameterVector,setOriginalLevelMeshParameterTexture,type ModelParameterMemory,type ModelParameterVertexServices} from '../src/core/model-parameter-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {updateOriginalSetMeshShaderParam} from '../src/core/set-mesh-shader-param-runtime';
import {setFloatFrame} from '../src/core/set-float-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from '../src/core/object-numeric-runtime';
export interface ModelParameterCase{name:string;memory:string;config:number[];actions:number[][];}
export const MODEL_PARAMETER_BASE=0x300000000n;
export function modelParameterMemory(b:Uint8Array):ModelParameterMemory{
 const base=MODEL_PARAMETER_BASE,d=new DataView(b.buffer,b.byteOffset,b.byteLength),off=(a:bigint)=>{const n=Number(a-base);if(n<0||n>=b.length)throw new Error(`Parameter memory outside capture: ${a.toString(16)}`);return n;};
 return {bytes:(a,n)=>b.subarray(off(a),off(a)+n),read8:a=>b[off(a)],write8:(a,n)=>{b[off(a)]=n;},read32:a=>d.getUint32(off(a),true),write32:(a,n)=>d.setUint32(off(a),n,true),read64:a=>d.getBigUint64(off(a),true),write64:(a,n)=>d.setBigUint64(off(a),n,true),
 string:a=>{const start=off(a);let end=start;while(end<b.length&&b[end])end++;return b.slice(start,end);},copy:(out,input,n)=>b.set(b.slice(off(input),off(input)+n),off(out)),move:(out,input,n)=>b.set(b.slice(off(input),off(input)+n),off(out))};
}
export function parameterNameHash(name:Uint8Array){let n=2166136261;for(const v of name)n=Math.imul(n^v,16777619)>>>0;return n;}
export function evaluateModelParameter(input:ModelParameterCase){
 const b=Buffer.from(input.memory,'hex'),base=MODEL_PARAMETER_BASE,m=modelParameterMemory(b);let events:number[][]=[],growth=0xf000;
 const record=(...row:number[])=>events.push([...row,...Array(8-row.length).fill(0)]),offset=(a:bigint)=>a?Number(a-base):0;
 const pool={getPool:()=>{record(20);return base+0xe000n;},allocate:(_:bigint,n:bigint)=>{record(21,Number(n),growth);const out=base+BigInt(growth);growth+=Number(n);return out;},release:(_:bigint,data:bigint)=>{record(22,offset(data));m.bytes(data,64).fill(0xdd);}};
 const endpoint=new OriginalLevelMeshMaterialEndpoint(339,base,m,pool);
 const mutate=()=>{if(input.config[2]===1)m.write32(base+0x208cn,1);if(input.config[2]===2)m.write32(base+0x220n,1);if(input.config[2]===3)m.write8(base+0xa32n,1);};
 const vertex:ModelParameterVertexServices={find:(a,name)=>{record(1,offset(a),parameterNameHash(m.string(name)));return input.config[0];},float:(a,i,n)=>{record(2,offset(a),i,n);mutate();},vector:(a,i,v)=>{const d=new DataView(v.buffer,v.byteOffset,v.byteLength);record(3,offset(a),i,...Array.from({length:4},(_,j)=>d.getUint32(j*4,true)));mutate();},texture:(a,i,t,s)=>{record(4,offset(a),i,offset(t),offset(s));mutate();}};
 const update={find:(model:bigint,pass:number,name:bigint)=>findOriginalModelUniform(m,model,pass,name,vertex),float:(model:bigint,pass:number,index:number,n:number)=>setOriginalModelParameter(m,model,pass,index,0,n,vertex),vector:(model:bigint,pass:number,index:number,n:Uint8Array)=>setOriginalModelParameter(m,model,pass,index,1,n,vertex),texture:(model:bigint,pass:number,index:number,name:Uint8Array)=>{
  record(10);record(11,0xb000,0xc000,parameterNameHash(name));let texture=0n;if(input.config[1]){record(12,0xc100);const data=m.read64(base+0xc310n);texture=data?data+0xb0n:0n;}else{record(10);record(13,0xb000,offset(m.read64(base+0xc008n)),parameterNameHash(name));}
  setOriginalModelParameter(m,model,pass,index,2,texture,vertex);record(14);
 }};
 return input.actions.map(([op,pass,name,target,n,duration])=>{events=[];let result=0,line=0,severity=0;try{
  if(op===0)endpoint.setFloat(pass,base+BigInt(name),n,duration);else if(op===1)endpoint.setVector(pass,base+BigInt(name),base+BigInt(target),duration);else if(op===2)endpoint.setTexture(pass,base+BigInt(name),base+BigInt(target));else if(op===3)endpoint.update(n,update);
  else if(op===4)result=offset(findOriginalLevelMeshParameter(m,base,pass,base+BigInt(name),n,pool));
  else if(op===5)setOriginalModelParameter(m,base+0x2000n,pass,name,0,n,vertex);
  else if(op===6)setOriginalModelParameter(m,base+0x2000n,pass,name,1,m.bytes(base+BigInt(target),16),vertex);
  else if(op===7)setOriginalModelParameter(m,base+0x2000n,pass,name,2,target?base+BigInt(target):0n,vertex,n?base+BigInt(n):0n);
  else if(op===8)result=findOriginalModelUniform(m,base+0x2000n,pass,base+BigInt(name),vertex);
  else if(op===9)updateOriginalSetMeshShaderParam(m,base+0x8000n,{frameBits:()=>bits(setFloatFrame(value(m.read32(base+0xd014n)),value(m.read32(base+0xd020n)),1)),castMesh:object=>{record(30);record(31);record(32,0xe300,offset(object),0xe200);return object;},float:(mesh,pass,name,n,duration)=>setOriginalLevelMeshParameterFloat(m,mesh,pass,name,n,duration,pool),vector:(mesh,pass,name,target,duration)=>setOriginalLevelMeshParameterVector(m,mesh,pass,name,target,duration,pool),texture:(mesh,pass,name,texture)=>setOriginalLevelMeshParameterTexture(m,mesh,pass,name,texture,pool),startEvent:event=>record(34,offset(event))});
  else throw new Error('Unknown operation');
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 return {line,severity,result,events,memory:b.toString('hex')};});
}
