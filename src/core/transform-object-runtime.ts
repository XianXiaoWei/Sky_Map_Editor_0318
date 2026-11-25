import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { setNativeMarkerTransform, transformNativeObb, nativeIdentityMatrix, NativeMarkerArithmeticBoundary } from './marker-transform-runtime';

export interface TransformObjectMemory {
 bytes(address: bigint, length: number): Uint8Array;
 read8(address: bigint): number; write8(address: bigint, value: number): void;
 read32(address: bigint): number; write32(address: bigint, value: number): void;
 read64(address: bigint): bigint; write64(address: bigint, value: bigint): void;
}
export interface TransformObjectServices {
 allocate(bytes: number, alignment: number): bigint;
 castObject(object: bigint): bigint;
 getTransform(object: bigint): Uint8Array;
 setTransform(object: bigint, matrix: Uint8Array): void;
 setEnabled(object: bigint, enabled: boolean): void;
 startEvent(): void;
 resumeEvent(): void;
 deltaTime(): number;
 math(operation: 'cos' | 'acos' | 'sin', input: number): number;
 stopSound(event: bigint): void;
}
const dataView = (b: Uint8Array) => new DataView(b.buffer,b.byteOffset,b.byteLength);
const f=Math.fround,eps=f(0.00001);
const op=(name:'add'|'subtract'|'multiply'|'divide'|'sqrt',a:number,b?:number)=>{const n=f(name==='add'?a+b!:name==='subtract'?a-b!:name==='multiply'?a*b!:name==='divide'?a/b!:Math.sqrt(a));if(!Number.isFinite(a)||(b!==undefined&&!Number.isFinite(b))||!Number.isFinite(n))throw new NativeMarkerArithmeticBoundary(name,a,b);return n;};
const add=(a:number,b:number)=>op('add',a,b),sub=(a:number,b:number)=>op('subtract',a,b),mul=(a:number,b:number)=>op('multiply',a,b),div=(a:number,b:number)=>op('divide',a,b);
const xyz=(a:number[],b:number[])=>add(mul(a[2],b[2]),add(mul(a[0],b[0]),mul(a[1],b[1])));
const dot4=(a:number[],b:number[])=>add(add(mul(a[0],b[0]),mul(a[2],b[2])),add(mul(a[1],b[1]),mul(a[3],b[3])));
const normalize=(q:number[])=>{const n=op('sqrt',dot4(q,q));return n>eps?q.map(x=>div(x,n)):q;};
const readMatrix=(b:Uint8Array)=>{const v=dataView(b);return Array.from({length:16},(_,i)=>v.getFloat32(i*4,true));};
const matrixBytes=(ns:number[])=>{const b=new Uint8Array(64),v=dataView(b);ns.forEach((x,i)=>v.setFloat32(i*4,x,true));return b;};
function decompose(matrix:Uint8Array){
 // The same column normalization/quaternion permutation as Marker.SetTransform.
 const b=new Uint8Array(80);setNativeMarkerTransform(b,matrix);const v=dataView(b);
 return {pos:[0,1,2,3].map(i=>v.getFloat32(16+i*4,true)),quat:[0,1,2,3].map(i=>v.getFloat32(32+i*4,true)),scale:[0,1,2].map(i=>v.getFloat32(48+i*4,true))};
}
/** Quaternion -> Matrix4 in TransformObject's update has no axis normalization. */
function rotation(q:number[]):Uint8Array{
 const [x,y,z,w]=q,xx=mul(x,add(x,x)),yy=mul(y,add(y,y)),zz=mul(z,add(z,z)),xy=mul(x,add(y,y)),xz=mul(x,add(z,z)),yz=mul(y,add(z,z)),wx=mul(w,add(x,x)),wy=mul(w,add(y,y)),wz=mul(w,add(z,z));
 return matrixBytes([sub(sub(1,yy),zz),add(xy,wz),sub(xz,wy),0,sub(xy,wz),sub(sub(1,xx),zz),add(yz,wx),0,add(xz,wy),sub(yz,wx),sub(sub(1,xx),yy),0,0,0,0,1]);
}
function productQuat(a:number[],b:number[]):number[]{
 const cross=[sub(mul(a[1],b[2]),mul(a[2],b[1])),sub(mul(a[2],b[0]),mul(a[0],b[2])),sub(mul(a[0],b[1]),mul(a[1],b[0]))];
 return [...[0,1,2].map(i=>add(add(mul(a[3],b[i]),mul(a[i],b[3])),cross[i])),sub(mul(a[3],b[3]),xyz(a,b))];
}
function inverseRotation(matrix:Uint8Array):number[]{
 const ns=readMatrix(matrix),columns=[ns.slice(0,3),ns.slice(4,7),ns.slice(8,11)],cross=(a:number[],b:number[])=>[sub(mul(a[1],b[2]),mul(a[2],b[1])),sub(mul(a[2],b[0]),mul(a[0],b[2])),sub(mul(a[0],b[1]),mul(a[1],b[0]))];
 const cofactors=[cross(columns[1],columns[2]),cross(columns[2],columns[0]),cross(columns[0],columns[1])],inv=div(1,xyz(columns[2],cofactors[2]));
 const b=nativeIdentityMatrix(),v=dataView(b);for(let i=0;i<3;i++)for(let j=0;j<3;j++)v.setFloat32(i*16+j*4,mul(cofactors[j][i],inv),true);return decompose(b).quat;
}
function interpolateQuat(from:number[],to:number[],t:number,s:TransformObjectServices,identityFrom=false):number[]{
 const dot=dot4(to,from);if(dot<0)from=from.map(x=>-x);const cosine=dot<0?-dot:dot;let left=sub(1,t),right=t;
 if(f(0.999)>cosine){const angle=s.math('acos',cosine),inverse=div(1,s.math('sin',angle));left=mul(s.math('sin',mul(sub(1,t),angle)),inverse);right=mul(s.math('sin',mul(angle,t)),inverse);}
 const q=to.map((n,i)=>add(mul(n,right),mul(from[i],left)));return identityFrom?q:normalize(q);
}
function smoothProgress(t:number):number {t=Math.min(1,Math.max(0,t));const cube=mul(t,mul(t,t)),inner=add(mul(t,add(mul(t,6),-15)),10);return mul(cube,inner);}
const failure=(line:number,expr:string,severity=3,file='TransformObject.cpp'):never=>{throw new NativeObjectFoundationFailure(file,line,severity,expr);};
const value=(m:TransformObjectMemory,p:bigint)=>dataView(m.bytes(p,4)).getFloat32(0,true);
const write=(m:TransformObjectMemory,p:bigint,n:number)=>dataView(m.bytes(p,4)).setFloat32(0,n,true);
const count=(m:TransformObjectMemory,p:bigint)=>m.read32(p+16n);
function member(m:TransformObjectMemory,p:bigint,i:number,s:TransformObjectServices,checked=true):bigint{
 if(checked&&i>=count(m,p))failure(54,'idx < size',3,'./Clump.h');const object=s.castObject(m.read64(m.read64(p+8n)+BigInt(i*8)));if(!object)failure(71,'ret',3,'./Clump.h');return object;
}
function copyMatrix(m:TransformObjectMemory,destination:bigint,matrix:Uint8Array):void{m.bytes(destination,64).set(matrix.subarray(0,64));}

export function constructOriginalTransformObject(storage:Uint8Array,classId:number,metadata:OriginalEventConstructionMetadata):void{
 if(storage.byteLength<216)throw new Error('Original TransformObject storage truncated');constructOriginalEvent(storage,metadata);const v=dataView(storage);
 v.setUint32(8,classId,true);v.setBigUint64(0,0x100c253f0n,true);for(const at of [56,72,144,168,192])v.setBigUint64(at,0n,true);storage[116]=0;storage.fill(0,128,144);v.setUint16(209,0,true);
}
/** Original 0x1006d5d80, with caller Heap allocation and Object casts explicit. */
export function loadOriginalTransformObject(m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void{
 const targets=()=>m.read64(event+64n),objects=()=>m.read64(event+72n);
 if(targets()){if(count(m,targets())!==count(m,objects()))failure(50,'targets == NULL || targets->Size() == objects->Size()');}
 else if(!m.read64(event+56n))failure(49,'targets != NULL || target != NULL',4);
 m.write64(event+168n,s.allocate(count(m,objects())*64,16));m.write64(event+176n,s.allocate(targets()?count(m,targets())*64:64,16));
 if(m.read8(event+122n))m.write64(event+184n,s.allocate(count(m,objects())*64,16));
 if(m.read8(event+120n)||m.read8(event+122n))for(let i=0;i<count(m,objects());i++){
  const matrix=s.getTransform(member(m,objects(),i,s,false));copyMatrix(m,m.read64(event+168n)+BigInt(i*64),matrix);
  if(m.read8(event+122n))copyMatrix(m,m.read64(event+184n)+BigInt(i*64),m.bytes(m.read64(event+168n)+BigInt(i*64),64));
 }
 write(m,event+164n,1);m.write8(event+208n,0);write(m,event+156n,0);
 if(!(value(m,event+108n)>=0))failure(74,'staggeredDelay >= 0');
}
/** Original 0x1006d6090. Captures ordinary starts afresh and each target once. */
export function startOriginalTransformObject(m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void{
 const objects=()=>m.read64(event+72n),targets=()=>m.read64(event+64n);
 if(!m.read8(event+120n)&&!m.read8(event+122n))for(let i=0;i<count(m,objects());i++)copyMatrix(m,m.read64(event+168n)+BigInt(i*64),s.getTransform(member(m,objects(),i,s,false)));
 if(targets()){for(let i=0;i<count(m,objects());i++)copyMatrix(m,m.read64(event+176n)+BigInt(i*64),s.getTransform(member(m,targets(),i,s)));}
 else copyMatrix(m,m.read64(event+176n),s.getTransform(m.read64(event+56n)));
 write(m,event+160n,0);m.write8(event+209n,1);
}
export function enableOriginalTransformObject(m:TransformObjectMemory,event:bigint):void{if(m.read8(event+125n))m.write8(event+125n,0);}
export function resumeOriginalTransformObject(m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void{
 if(m.read8(event+12n))m.write8(event+33n,0);s.resumeEvent();m.write32(event+156n,m.read32(event+104n));if(m.read8(event+12n)&&m.read8(event+125n))m.write8(event+125n,0);
}
export function getOriginalTransformResumeEnabled(m:TransformObjectMemory,event:bigint):number{return m.read8(event+209n);}
export function stopOriginalTransformObject(m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void{m.write8(event+210n,1);s.stopSound(event);}
export function destroyOriginalTransformObject(m:TransformObjectMemory,event:bigint,releaseString:(pointer:bigint)=>void):void{m.write64(event,0x100c253f0n);if(m.read8(event+128n)&1)releaseString(m.read64(event+144n));}

/** Original update's finite arithmetic normal/continuous paths. Audio and
 * stepped quaternion carry remain dependencies; no target class is fabricated. */
export function updateOriginalTransformObject(m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void{
 if(value(m,event+164n)!==0){write(m,event+164n,0);return;}
 const duration=value(m,event+104n),stagger=value(m,event+108n),objects=()=>m.read64(event+72n),n=count(m,objects()),total=add(duration,mul(stagger,f((n-1)>>>0))),timeline=m.read64(event+88n);let dt:number,elapsed:number;
 if(timeline){let node=0n;for(let i=0;i<count(m,timeline+0x470n);i++){const p=m.read64(timeline+0x80n+BigInt(i*8));if(m.read64(p+8n)===event+8n){node=p;break;}}if(!node)failure(153,'node');const old=value(m,event+156n);elapsed=Math.min(duration,Math.max(0,sub(value(m,timeline+0x108cn),value(m,node+16n))));write(m,event+156n,elapsed);dt=Math.max(0,sub(old,elapsed));}
 else{dt=Math.min(f(0.266),Math.max(f(0.0001),f(s.deltaTime())));elapsed=Math.min(total,Math.max(0,add(dt,value(m,event+156n))));write(m,event+156n,elapsed);}
 if(m.read8(event+125n)){elapsed=0;write(m,event+156n,0);}
 let progress=total>0?Math.min(1,Math.max(0,div(elapsed,total))):1;const control=m.read64(event+96n);if(control)progress=value(m,control+16n);
 if(m.read8(event+121n))progress=sub(0.5,mul(s.math('cos',mul(progress,f(Math.PI))),0.5));
 const reverse=!!m.read8(event+116n);if(reverse)progress=sub(1,progress);
 for(let i=0;i<count(m,objects());i++){
  const targets=m.read64(event+64n);let t=progress;
  if(stagger>0&&targets){if(duration>0)t=Math.min(1,Math.max(0,reverse?add(div(sub(mul(stagger,f(i)),mul(total,sub(1,progress))),duration),1):div(sub(mul(total,progress),mul(stagger,f(i))),duration)));else{t=m.read8(event+125n)?0:mul(f(i),stagger)<=value(m,event+156n)?1:0;if(reverse)t=sub(1,t);}}
  const capturedTarget=m.bytes(m.read64(event+176n)+BigInt((targets?i:0)*64),64);
  const target=targets?member(m,targets,i,s):m.read64(event+56n);
  const targetMatrix=m.read8(event+124n)?capturedTarget:s.getTransform(target),a=decompose(targetMatrix),initialMatrix=m.bytes(m.read64(event+168n)+BigInt(i*64),64),b=decompose(initialMatrix);
  const currentObject=member(m,objects(),i,s),currentMatrix=s.getTransform(currentObject),c=decompose(currentMatrix);
  let pos:number[],scale:number[],quat:number[];
  if(m.read8(event+120n)){
   const step=duration>0?mul(div(1,duration),dt):1;pos=c.pos.map((x,j)=>add(mul(mul(sub(a.pos[j],b.pos[j]),m.read8(event+117n)?1:0),step),x));scale=c.scale.map((x,j)=>add(mul(sub(a.scale[j],b.scale[j]),m.read8(event+119n)?1:0),x));quat=a.quat;
   if(m.read8(event+118n)){const delta=productQuat(a.quat,inverseRotation(initialMatrix)),increment=interpolateQuat([0,0,0,delta[3]<0?-1:1],delta,step,s,true);quat=normalize(productQuat(c.quat,increment));}
   else quat=c.quat;
  }else{
   const parameter=m.read8(event+121n)?smoothProgress(t):t;
   pos=m.read8(event+117n)?b.pos.map((x,j)=>add(mul(a.pos[j],parameter),mul(x,sub(1,parameter)))):c.pos;
   scale=m.read8(event+119n)?b.scale.map((x,j)=>add(mul(a.scale[j],parameter),mul(x,sub(1,parameter)))):c.scale;
   quat=m.read8(event+118n)?interpolateQuat(b.quat,a.quat,parameter,s):a.quat;
   // Original transformRot=false selects current quaternion, then normalizes.
   if(!m.read8(event+118n))quat=normalize(c.quat);
   if(m.read8(event+122n))throw new Error('TransformObject stepped carry requires a restored dependency');
  }
  const translation=nativeIdentityMatrix(),tv=dataView(translation);pos.slice(0,3).forEach((x,j)=>tv.setFloat32(48+j*4,x,true));
  const scaling=nativeIdentityMatrix(),sv=dataView(scaling);scale.forEach((x,j)=>sv.setFloat32(j*20,x,true));
  const result=transformNativeObb(transformNativeObb(translation,rotation(quat)),scaling);
  // Original obtains the Object again after constructing the full matrix.
  s.setTransform(member(m,objects(),i,s),result);
 }
 if(m.read8(event+152n))throw new Error('TransformObject drag sound requires a restored sound service');
 write(m,event+160n,progress);const completion=reverse?sub(1,progress):progress;
 if(Math.abs(sub(completion,1))>eps||m.read8(event+120n)||!m.read8(event+123n))return;
 const finish=()=>m.read64(event+80n);if(finish())for(let i=0;i<count(m,finish());i++)s.setEnabled(member(m,finish(),i,s,false),true);
 s.stopSound(event);write(m,event+156n,0);s.startEvent();
}

/** Derived virtual callbacks used by the original Event dispatch state machine.
 * The caller still owns EventBarn registration, Game/Timeline, target classes,
 * Heap, metadata reflection and audio. No full scene lifecycle is implied. */
export function dispatchOriginalTransformObjectVirtual(slot:0x10|0x30|0x38|0x40|0x48,m:TransformObjectMemory,event:bigint,s:TransformObjectServices):void {
 switch(slot){
  case 0x10:loadOriginalTransformObject(m,event,s);return;
  case 0x30:startOriginalTransformObject(m,event,s);return;
  case 0x38:enableOriginalTransformObject(m,event);return;
  case 0x40:stopOriginalTransformObject(m,event,s);return;
  case 0x48:updateOriginalTransformObject(m,event,s);return;
 }
}
