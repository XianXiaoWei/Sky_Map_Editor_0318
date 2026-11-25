import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {NativeLevelMeshDependencyBoundary,type LevelMeshMemory} from './level-mesh-runtime';
import {growNativeStringAndReplace,type NativeStringMemory,type NativeStringPoolServices} from './native-string-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

export interface ModelParameterMemory extends LevelMeshMemory,NativeStringMemory {}
const fail=(line:number,severity:number,expression:string):never=>{throw new NativeObjectFoundationFailure('LevelMesh.cpp',line,severity,expression);};
export function nativeParameterStringData(m:NativeStringMemory,address:bigint){return m.read8(address)&1?m.read64(address+16n):address+1n;}
function stringLength(m:NativeStringMemory,address:bigint){return m.read8(address)&1?m.read64(address+8n):BigInt(m.read8(address)>>>1);}
/** Sized libc++ assignment in both original parameter setters. Unlike the
 * TGCL C-string reader, embedded NUL does not shorten the stored length. */
function assign(m:NativeStringMemory,out:bigint,input:bigint,pool:NativeStringPoolServices){
  if(out===input)return;
  const length=stringLength(m,input),source=nativeParameterStringData(m,input),tag=m.read8(out),long=!!(tag&1),capacity=long?(m.read64(out)&~1n)-1n:22n;
  if(length>capacity){const old=long?m.read64(out+8n):BigInt(tag>>>1);growNativeStringAndReplace(m,out,capacity,length-capacity,old,0n,old,length,source,pool);return;}
  const data=nativeParameterStringData(m,out);if(length)m.move(data,source,Number(length));m.write8(data+length,0);
  if(m.read8(out)&1)m.write64(out+8n,length);else m.write8(out,Number(length)*2);
}
/** Whole original lookup/allocation 0x100400c80. Matching is strcmp by name,
 * independent of pass; an existing entry retains its original pass/index. */
export function findOriginalLevelMeshParameter(m:ModelParameterMemory,mesh:bigint,pass:number,name:bigint,type:number,pool:NativeStringPoolServices):bigint {
  if(stringLength(m,name)>=28n)fail(692,3,'uniform.length() < sizeof( ShaderUniformDef::name )');
  const count=m.read32(mesh+0x220n),wanted=m.string(nativeParameterStringData(m,name));
  for(let i=0;i<count;i++){
    const p=m.read64(mesh+0x1a0n+BigInt(i)*8n),stored=m.string(nativeParameterStringData(m,p+8n));
    if(wanted.length===stored.length&&wanted.every((v,j)=>v===stored[j])){
      if(m.read32(p+0x20n)!==(type>>>0))fail(697,4,'shaderParams[ i ]->valueType == valueType');return p;
    }
  }
  if(count>=16)fail(702,3,'numShaderParams < kMaxShaderParams');
  m.write32(mesh+0x220n,(count+1)>>>0);const p=m.read64(mesh+0x1a0n+BigInt(count)*8n);
  assign(m,p+8n,name,pool);m.write32(p+0x5cn,0xffffffff);m.write32(p+0x58n,pass);m.write32(p+0x20n,type);return p;
}
// Separate float32 operations reproduce the original VEX arithmetic order.
// MXCSR modes other than default round-to-nearest/gradual-underflow are open.
function arithmetic(a:number,b:number,op:(a:number,b:number)=>number){
  if((a&0x7fffffff)>0x7f800000)return (a|0x400000)>>>0;
  if((b&0x7fffffff)>0x7f800000)return (b|0x400000)>>>0;
  const n=op(value(a),value(b));return Number.isNaN(n)?0xffc00000:bits(n);
}
const add=(a:number,b:number)=>arithmetic(a,b,(x,y)=>x+y),sub=(a:number,b:number)=>arithmetic(a,b,(x,y)=>x-y),mul=(a:number,b:number)=>arithmetic(a,b,(x,y)=>x*y),div=(a:number,b:number)=>arithmetic(a,b,(x,y)=>x/y);
function blend(m:ModelParameterMemory,p:bigint){const duration=m.read32(p+0x74n);return value(duration)>0?div(m.read32(p+0x70n),duration):0x3f800000;}
function interpolated(m:ModelParameterMemory,p:bigint,t:number,lane:number,targetFirst=false){
  const previous=mul(sub(0x3f800000,t),m.read32(p+0x60n+BigInt(lane)*4n)),target=mul(t,m.read32(p+0x30n+BigInt(lane)*4n));return targetFirst?add(target,previous):add(previous,target);
}
export function setOriginalLevelMeshParameterFloat(m:ModelParameterMemory,mesh:bigint,pass:number,name:bigint,targetBits:number,durationBits:number,pool:NativeStringPoolServices){
  const p=findOriginalLevelMeshParameter(m,mesh,pass,name,0,pool),current=interpolated(m,p,blend(m,p),0);
  m.write32(p+0x60n,current);m.write32(p+0x30n,targetBits);m.write32(p+0x70n,0);m.write32(p+0x74n,durationBits);m.write8(p+0x78n,1);m.write8(mesh+0xa32n,1);
}
export function setOriginalLevelMeshParameterVector(m:ModelParameterMemory,mesh:bigint,pass:number,name:bigint,target:bigint|Uint8Array,durationBits:number,pool:NativeStringPoolServices){
  const p=findOriginalLevelMeshParameter(m,mesh,pass,name,1,pool),t=blend(m,p),current=Array.from({length:4},(_,i)=>interpolated(m,p,t,i,true));
  current.forEach((n,i)=>m.write32(p+0x60n+BigInt(i)*4n,n));
  // Source is read after the full previous-value write, preserving aliasing.
  m.bytes(p+0x30n,16).set(typeof target==='bigint'?m.bytes(target,16).slice():target.slice());m.write32(p+0x70n,0);m.write32(p+0x74n,durationBits);m.write8(p+0x78n,1);m.write8(mesh+0xa32n,1);
}
export function setOriginalLevelMeshParameterTexture(m:ModelParameterMemory,mesh:bigint,pass:number,name:bigint,texture:bigint,pool:NativeStringPoolServices){
  const p=findOriginalLevelMeshParameter(m,mesh,pass,name,2,pool);
  if(stringLength(m,texture)>=28n)fail(352,4,'value.length() < sizeof( ShaderUniformDef::name )');
  assign(m,p+0x40n,texture,pool);m.write64(p+0x70n,0n);m.write8(p+0x78n,1);m.write8(mesh+0xa32n,1);
}
export interface ModelParameterVertexServices {
  find(vertex:bigint,name:bigint):number;
  float(vertex:bigint,index:number,bits:number):void;
  vector(vertex:bigint,index:number,value:Uint8Array):void;
  texture(vertex:bigint,index:number,texture:bigint,sampler:bigint):void;
}
/** Original Model parameter lookup 0x1004666a0 and setters
 * 0x100466710 / 0x1004669b0 / 0x100466e30. Ready MeshInstance LODs only;
 * count is re-read after every actual Vertex setter callback. */
export function findOriginalModelUniform(m:ModelParameterMemory,model:bigint,pass:number,name:bigint,s:ModelParameterVertexServices){
  const table=m.read64(model+0x28n+BigInt(pass>>>0)*8n),render=table?m.read64(table):0n;
  if(!render)throw new NativeObjectFoundationFailure('Model.cpp',319,3,'m_renders[ pass ] && m_renders[ pass ][ 0 ]');
  if(!m.read8(render+0x538n))throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',168,3,'IsInitialized()');
  return s.find(render+0x270n,name)>>>0;
}
export function setOriginalModelParameter(m:ModelParameterMemory,model:bigint,pass:number,index:number,type:0|1|2,data:number|Uint8Array|bigint,s:ModelParameterVertexServices,sampler=0n){
  let count=m.read32(model+0x8cn);for(let i=0;i<count;i++){
    const instance=m.read64(m.read64(model+8n)+BigInt(i)*8n);if(!m.read8(instance+0x14n))continue;
    const render=m.read64(m.read64(model+0x28n+BigInt(pass>>>0)*8n)+BigInt(i)*8n);
    if(!m.read8(render+0x538n))throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',168,3,'IsInitialized()');
    const vertex=render+0x270n;
    if(type===0)s.float(vertex,index>>>0,data as number);else if(type===1)s.vector(vertex,index>>>0,data as Uint8Array);else s.texture(vertex,index>>>0,data as bigint,sampler);
    count=m.read32(model+0x8cn);
  }
}
export interface LevelMeshParameterUpdateServices {
  find(model:bigint,pass:number,name:bigint):number;
  float(model:bigint,pass:number,index:number,bits:number):void;
  vector(model:bigint,pass:number,index:number,bytes:Uint8Array):void;
  /** Original ResourceRef construct/find/Observe-or-diagnostic/bind/destruct
   * belongs to the resource owner. Empty C-string selects original Black. */
  texture(model:bigint,pass:number,index:number,name:Uint8Array):void;
}
/** Original LevelMesh update 0x100402060, normal valid-uniform path. Hot
 * reload, diagnostic stream/removal and exception unwinding stay boundaries. */
export function updateOriginalLevelMeshParameters(m:ModelParameterMemory,mesh:bigint,deltaBits:number,s:LevelMeshParameterUpdateServices){
  if(m.read8(mesh+0xa30n))throw new NativeLevelMeshDependencyBoundary('LevelMesh hot reload/rebind');
  if(!m.read8(mesh+0xa32n))return;m.write8(mesh+0xa32n,0);
  let count=m.read32(mesh+0x220n);for(let i=0;i<count;i++){
    const p=m.read64(mesh+0x1a0n+BigInt(i)*8n);if(!m.read8(p+0x78n))continue;
    let index=m.read32(p+0x5cn);if(index===0xffffffff){index=s.find(m.read64(mesh+0x228n),m.read32(p+0x58n),nativeParameterStringData(m,p+8n))>>>0;m.write32(p+0x5cn,index);if(index===0xffffffff)throw new NativeLevelMeshDependencyBoundary('LevelMesh invalid uniform diagnostic/removal');}
    let elapsed=add(deltaBits,m.read32(p+0x70n));if(0>value(elapsed))elapsed=0;
    const duration=m.read32(p+0x74n);if(value(duration)<value(elapsed))elapsed=duration;m.write32(p+0x70n,elapsed);
    const t=value(duration)>0?div(elapsed,duration):0x3f800000,type=m.read32(p+0x20n),model=m.read64(mesh+0x228n),pass=m.read32(p+0x58n);
    if(type===0)s.float(model,pass,index,interpolated(m,p,t,0));
    else if(type===1){const out=new Uint8Array(16),v=new DataView(out.buffer);for(let j=0;j<4;j++)v.setUint32(j*4,interpolated(m,p,t,j),true);s.vector(model,pass,index,out);}
    else if(type===2){const name=m.string(nativeParameterStringData(m,p+0x40n));s.texture(model,pass,index,name.length?name:new TextEncoder().encode('Black'));}
    else fail(671,4,'false');
    const active=value(m.read32(p+0x74n))>value(m.read32(p+0x70n));m.write8(p+0x78n,Number(active));m.write8(mesh+0xa32n,Number(!!m.read8(mesh+0xa32n)||active));count=m.read32(mesh+0x220n);
  }
}
/** Shares the real LevelMesh address and live Model pointer with transforms,
 * visibility and later logic classes. No Model allocation or shadow state. */
export class OriginalLevelMeshMaterialEndpoint {
  constructor(readonly objectId:number,readonly address:bigint,private memory:ModelParameterMemory,private pool:NativeStringPoolServices){}
  get modelAddress(){return this.memory.read64(this.address+0x228n);}
  setFloat(pass:number,name:bigint,targetBits:number,durationBits:number){setOriginalLevelMeshParameterFloat(this.memory,this.address,pass,name,targetBits,durationBits,this.pool);}
  setVector(pass:number,name:bigint,target:bigint,durationBits:number){setOriginalLevelMeshParameterVector(this.memory,this.address,pass,name,target,durationBits,this.pool);}
  setTexture(pass:number,name:bigint,texture:bigint){setOriginalLevelMeshParameterTexture(this.memory,this.address,pass,name,texture,this.pool);}
  update(deltaBits:number,services:LevelMeshParameterUpdateServices){updateOriginalLevelMeshParameters(this.memory,this.address,deltaBits,services);}
}
