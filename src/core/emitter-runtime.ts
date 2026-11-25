import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {NativeMarkerArithmeticBoundary} from './marker-transform-runtime';
type Memory=Omit<ModelBakeMemory,'string'>;
export interface OriginalEmitterHandle {pointer:bigint;generation:number;}
export const ORIGINAL_EMITTER_CAPACITY=2048,ORIGINAL_EMITTER_STRIDE=512;
/** Ordinary weak handle resolve 0x100316270; zero or stale handles are null. */
export function resolveOriginalEmitterHandle(m:Memory,handle:OriginalEmitterHandle):bigint {
 return handle.pointer&&m.read32(handle.pointer+496n)===(handle.generation>>>0)?handle.pointer:0n;
}
/** Whole normal pool constructor 0x1002de1b0. Untouched storage is retained;
 * this builds links, not metadata, resources or the full EmitterBarn module. */
export function constructOriginalEmitterPool(m:Memory,barn:bigint,first:bigint,second:bigint){
 m.write64(barn+0x100028n,first);m.write64(barn+0x100030n,second);m.write32(barn+0x100020n,1);
 const head=barn+0x100010n;
 for(let i=0;i<ORIGINAL_EMITTER_CAPACITY;i++){const p=barn+16n+BigInt(i*512);m.write64(p+8n,i===2047?0n:p+512n);m.write64(p+16n,0xffffffffffffffffn);m.write64(p+24n,head);}
 m.write64(head,barn+16n);m.write64(head+8n,0n);
}
/** Normal FreeListMixin pop and active-list insertion 0x1002de850, including
 * the original partial writes preceding each assertion. */
export function allocateOriginalEmitterSlot(m:Memory,head:bigint):bigint {
 const p=m.read64(head);if(!p)throw new NativeObjectFoundationFailure('../../../Code/Base/FreeListMixin.h',139,4,'freeHead');
 if(m.read64(p+16n)!==0xffffffffffffffffn)throw new NativeObjectFoundationFailure('../../../Code/Base/FreeListMixin.h',140,3,'freeHead->m_IsFree()');
 m.write64(head,m.read64(p+8n));
 if(m.read64(p+16n)!==0xffffffffffffffffn)throw new NativeObjectFoundationFailure('../../../Code/Base/FreeListMixin.h',116,3,'m_IsFree()');
 let owner=m.read64(p+24n);if(!owner)throw new NativeObjectFoundationFailure('../../../Code/Base/FreeListMixin.h',117,3,'head');
 m.write64(p+8n,m.read64(owner+8n));m.write64(p+16n,0n);
 const next=m.read64(owner+8n);if(next){m.write64(next+16n,p);owner=m.read64(p+24n);}m.write64(owner+8n,p);return p;
}
/** Whole state reset 0x1002da1e0. The dynamic default Color remains input. */
export function resetOriginalEmitter(m:Memory,p:bigint,color:Uint8Array){
 if(color.length!==16)throw new Error('Emitter default Color must contain four lanes');
 const zero=new Uint8Array(16),ones=new Uint8Array(32),d=new DataView(ones.buffer);for(let i=0;i<8;i++)d.setFloat32(i*4,1,true);
 m.bytes(p+208n,16).set(zero);m.write64(p+368n,0x3f8000003f800000n);m.bytes(p+128n,32).set(ones);
 m.bytes(p+392n,2).fill(0);m.bytes(p+352n,16).set(zero);m.write64(p+120n,0n);m.write64(p+400n,0n);m.write8(p+174n,0);
 m.write64(p+376n,0x3f8000003f800000n);m.bytes(p+224n,16).set(zero);m.bytes(p+240n,16).set(pack([0,1,0,0]));m.write8(p+256n,0);
 m.bytes(p+272n,16).set(color);m.bytes(p+288n,16).set(color);m.write64(p+384n,0x3f8000003f800000n);m.write64(p+164n,0x3f800000n);
 m.bytes(p+80n,16).set(zero);m.write64(p+468n,0n);m.write32(p+476n,0);m.write8(p+177n,0);m.write8(p+173n,0);
 m.bytes(p+408n,32).fill(0);m.bytes(p+192n,16).set(zero);m.bytes(p+64n,16).set(pack([1,1,1,0]));m.bytes(p+175n,2).fill(0);m.bytes(p+484n,16).set(zero);
}
const f=Math.fround,op=(kind:'add'|'subtract'|'multiply'|'divide'|'sqrt',a:number,b?:number)=>{const n=f(kind==='add'?a+b!:kind==='subtract'?a-b!:kind==='multiply'?a*b!:kind==='divide'?a/b!:Math.sqrt(a));if(!Number.isFinite(a)||(b!==undefined&&!Number.isFinite(b))||!Number.isFinite(n))throw new NativeMarkerArithmeticBoundary(kind,a,b);return n;};
const add=(a:number,b:number)=>op('add',a,b),sub=(a:number,b:number)=>op('subtract',a,b),mul=(a:number,b:number)=>op('multiply',a,b),div=(a:number,b:number)=>op('divide',a,b);
const pack=(ns:number[])=>{const b=new Uint8Array(16),v=new DataView(b.buffer);ns.forEach((n,i)=>v.setFloat32(i*4,n,true));return b;};
const read=(m:Memory,p:bigint)=>{const b=m.bytes(p,16),v=new DataView(b.buffer,b.byteOffset,16);return Array.from({length:4},(_,i)=>v.getFloat32(i*4,true));};
const length=(n:number[])=>op('sqrt',add(mul(n[2],n[2]),add(mul(n[0],n[0]),mul(n[1],n[1]))));
const normalize=(n:number[])=>{const size=length(n);return size>f(.00001)?n.map((x,i)=>i===3?x:div(x,size)):n;};
/** Ordinary Emitter.Initialize 0x1002d9f10: direction quaternion, original
 * downward-vector rotation and lifetime/owner state. Finite arithmetic only;
 * non-finite SIMD payloads require a separately verified service. */
export function initializeOriginalEmitter(m:Memory,p:bigint,barn:bigint,generation:number,position:Uint8Array,direction:Uint8Array,params:bigint,extra:number,duration:number){
 m.write64(p+408n,params);m.write8(p+178n,1);m.write32(p+496n,generation);
 const dt=duration<=0?0:f(duration),db=pack([dt,0,0,0]);m.bytes(p+168n,4).set(db.subarray(0,4));m.bytes(p+476n,4).set(db.subarray(0,4));
 m.bytes(p+32n,16).set(position);m.bytes(p+304n,16).set(position);m.bytes(p+320n,16).fill(0);
 const dv=new DataView(direction.buffer,direction.byteOffset,16),n=normalize(Array.from({length:4},(_,i)=>dv.getFloat32(i*4,true))),neg=normalize(n).map(x=>-x),negativeDot=add(mul(neg[2],-1),add(mul(neg[0],0),mul(neg[1],0))),distance=Math.abs(add(negativeDot,-1));
 let q:number[];
 if(f(.00001)>=distance)q=[0,-1,0,f(-4.371138828673793e-8)];
 else {const dot=add(mul(n[2],-1),add(mul(n[0],0),mul(n[1],0))),s=op('sqrt',add(add(dot,1),add(dot,1))),inverse=div(1,s);
  // Scalar -1 load clears upper lanes before the two original permutations.
  const intermediate=[sub(mul(n[0],-1),mul(n[2],0)),sub(mul(n[1],0),mul(n[0],0)),sub(mul(n[2],0),mul(n[1],-1)),sub(mul(n[3],0),mul(n[3],0))];
  q=[mul(intermediate[2],inverse),mul(intermediate[0],inverse),mul(intermediate[1],inverse),mul(s,.5)];
 }
 m.bytes(p+48n,16).set(pack(q));if(q.some(Number.isNaN))throw new NativeObjectFoundationFailure('./Emitter.h',38,3,'!isNan( quat )');
 const [x,y,z,w]=q,w0=mul(w,0),z0=mul(z,0),x0=mul(x,0),y0=mul(y,0),a=sub(sub(w0,y),z0),b=add(x,add(w0,z0)),c=sub(sub(x0,w),y0),d=sub(add(x0,y0),z);
 const rx=add(mul(y,c),sub(add(mul(x,d),mul(w,a)),mul(z,b))),ry=add(mul(z,a),sub(add(mul(y,d),mul(w,b)),mul(x,c))),rz=add(mul(x,b),sub(add(mul(z,d),mul(w,c)),mul(y,a)));
 m.bytes(p+336n,16).set(pack([rx,ry,rz,w]));m.write8(p+173n,extra);m.write32(p+492n,0);m.write8(p+176n,1);m.write8(p+172n,1);m.write8(p+395n,0);m.write64(p+416n,barn);
 const scale=read(m,p+64n),squared=add(mul(scale[2],scale[2]),add(mul(scale[0],scale[0]),mul(scale[1],scale[1])));if(squared===0)m.bytes(p+64n,16).set(pack([1,1,1,0]));
}
/** Whole ordinary timed creator 0x1002de9e0; snapshots follow pool/reset
 * writes and the counter advances even when the input generation is zero. */
export function createOriginalTimedEmitter(m:Memory,barn:bigint,position:bigint,direction:bigint,params:bigint,extra:number,duration:number,color:Uint8Array):OriginalEmitterHandle {
 const p=allocateOriginalEmitterSlot(m,barn+0x100010n);resetOriginalEmitter(m,p,color);
 const generation=m.read32(barn+0x100020n),next=(generation+1)>>>0;m.write32(barn+0x100020n,next===0?1:next);
 initializeOriginalEmitter(m,p,barn,generation,new Uint8Array(m.bytes(position,16)),new Uint8Array(m.bytes(direction,16)),params,extra&255,duration);
 if(duration>0)m.write8(p+177n,1);return {pointer:p,generation:p?m.read32(p+496n):0};
}
