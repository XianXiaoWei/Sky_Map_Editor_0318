const f=Math.fround;
type V=number[];
const mul=(a:V,b:V)=>a.map((v,i)=>f(v*b[i])),add=(a:V,b:V)=>a.map((v,i)=>f(v+b[i])),sub=(a:V,b:V)=>a.map((v,i)=>f(v-b[i]));
const perm=(a:V,n:number)=>Array.from({length:4},(_,i)=>a[n>>i*2&3]);
const swap=(a:V)=>[a[2],a[3],a[0],a[1]],dup=(a:V)=>[a[1],a[1],a[3],a[3]];
const scalar=(a:V,b:V,op:(a:number,b:number)=>number)=>[f(op(a[0],b[0])),...a.slice(1)];
const sm=(a:V,b:V)=>scalar(a,b,(x,y)=>x*y),sa=(a:V,b:V)=>scalar(a,b,(x,y)=>x+y),ss=(a:V,b:V)=>scalar(a,b,(x,y)=>x-y);
function insert(a:V,b:V,n:number){const out=a.slice();out[n>>4&3]=b[n>>6&3];for(let i=0;i<4;i++)if(n>>i&1)out[i]=0;return out;}
export interface AvatarDirectionServices {
 /** Packed sin/cos plus explicit upper SIMD lanes from the ABI adapter.
  * Native oracle captures Linux libm; macOS libm is not asserted identical. */
 sincos:(angle:number)=>V;
}
/** Whole Euler->forward arithmetic 0x100147510, including original scalar
 * rounding, SIMD lane construction and normalization threshold. The helper
 * consumes Euler X/Y only; its fourth output is SIMD scratch, not direction. */
export function originalAvatarForward(euler:V,s:AvatarDirectionServices):V {
 const r:V[]=Array.from({length:15},()=>[0,0,0,0]),one=[1,0,0,0],e=euler.map(f);
 r[0]=s.sincos(e[0]).map(f);r[1]=r[0].map(v=>-v);r[2]=insert(r[0],r[0],0x4e);r[1]=insert(r[2],r[1],0x20);r[2]=[0,0,0,0];
 r[0]=[r[0][0],0,r[0][1],0];r[1]=mul(r[1],r[2]);r[1]=add(r[0],r[1]);const first=r[1].slice();
 r[0]=mul(r[1],one);r[0]=perm(r[0],0xd2);r[1]=mul(r[1],[0,0,1,0]);r[0]=sub(r[0],r[1]);const axis=r[0].slice();
 r[0]=s.sincos(e[1]).map(f);r[1]=dup(r[0]);r[5]=axis;r[2]=swap(r[5]);r[3]=dup(r[5]);
 r[4]=sm(r[2],r[5]);r[8]=sm(r[5],r[3]);r[14]=r[5].slice();r[9]=sm(r[3],r[2]);r[5]=one;
 r[7]=ss(r[5],r[1]);r[5]=sm(r[2],r[2]);r[5]=sm(r[7],r[5]);r[10]=sa(r[1],r[5]);r[4]=sm(r[7],r[4]);r[6]=sm(r[0],r[3]);r[11]=sa(r[6],r[4]);
 r[9]=sm(r[7],r[9]);r[13]=sm(r[0],r[14]);r[12]=ss(r[9],r[13]);r[5]=insert(r[10],r[11],0x10);r[10]=insert(r[5],r[12],0x20);
 r[4]=ss(r[4],r[6]);r[6]=sm(r[14],r[14]);r[6]=sm(r[7],r[6]);r[6]=sa(r[1],r[6]);r[5]=sm(r[7],r[8]);r[0]=sm(r[0],r[2]);r[2]=sa(r[0],r[5]);
 r[4]=insert(r[4],r[6],0x10);r[2]=insert(r[4],r[2],0x20);r[4]=sa(r[13],r[9]);r[0]=ss(r[5],r[0]);r[3]=sm(r[3],r[3]);r[3]=sm(r[7],r[3]);r[1]=sa(r[1],r[3]);
 r[0]=insert(r[4],r[0],0x10);r[0]=insert(r[0],r[1],0x20);r[4]=first;r[1]=mul(perm(r[4],0xc0),r[10]);r[3]=perm(r[4],0xd5);r[2]=mul(r[2],r[3]);r[1]=add(r[2],r[1]);
 r[2]=perm(r[4],0xea);r[0]=mul(r[0],r[2]);r[0]=add(r[0],r[1]);r[1]=mul(r[0],r[0]);r[2]=dup(r[1]);r[2]=sa(r[1],r[2]);r[1]=swap(r[1]);r[1]=sa(r[1],r[2]);r[1]=[f(Math.sqrt(r[1][0])),...r[1].slice(1)];
 if(r[1][0]>f(1e-5)){r[1]=perm(r[1],0xc0);r[0]=r[0].map((v,i)=>f(v/r[1][i]));}return r[0];
}
/** WhiskerCamera reset 0x10073ab80 XYZ pose subchain. Complete reset state is
 * implemented below; continuous camera Update is a separate pending chain. */
export function originalAvatarCameraPose(position:number[],offset:number[],forward:number[]){
 const target=position.slice(0,3).map((v,i)=>f(v+offset[i])),eye=target.map((v,i)=>f(v+f(forward[i]*-3)));
 return {target,eye,forward:forward.slice(0,3)};
}
/** Browser libm service for the recovered direction arithmetic. Float inputs
 * and outputs are rounded, but JavaScript libm is not macOS sincosf parity. */
export function avatarCameraDirection(euler:V){return originalAvatarForward(euler,{sincos:a=>[f(Math.sin(a)),f(Math.cos(a)),0,0]}).slice(0,3);}
export function originalAvatarForwardBytes(euler:V,s:AvatarDirectionServices):Uint8Array {const bytes=new Uint8Array(16);write(bytes,0,originalAvatarForward(euler,s));return bytes;}

export interface WhiskerResetServices extends AvatarDirectionServices {
 ready:()=>boolean;
 position:()=>V;
 euler:()=>V;
 tick:()=>number;
 runtimeWord:number;
 atan2:(y:number,x:number)=>number;
 asin:(v:number)=>number;
}
function view(bytes:Uint8Array){return new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);}
function read(bytes:Uint8Array,at:number):V {const d=view(bytes);return Array.from({length:4},(_,i)=>d.getFloat32(at+i*4,true));}
function write(bytes:Uint8Array,at:number,v:V){const d=view(bytes);v.forEach((n,i)=>{
 // For the supported finite inputs, NaN can only be the unused SIMD W
 // lane's 0/0 normalization. x86 produces the negative indefinite pattern;
 // JavaScript arrays may canonicalize its sign, so materialize it explicitly.
 if(Number.isNaN(n))d.setUint32(at+i*4,0xffc00000,true);else d.setFloat32(at+i*4,n,true);
});}
/** Whole Whisker initializer 0x10073aa90 and reset 0x10073ab80 for finite
 * positions/directions. Game tick, BSS word, local readiness and libm remain
 * explicit services. Does not include continuous Update or lens projection. */
export function initializeOriginalWhisker(bytes:Uint8Array,s:WhiskerResetServices):void {
 const d=view(bytes),zero=[0,0,0,0],axis=[0,1,0,1];bytes[0x350]=0;write(bytes,0x270,mul([f(.8),f(.8),f(.8),f(.8)],axis));write(bytes,0x280,zero);d.setFloat32(0x184,15,true);write(bytes,0x3d0,axis);d.setUint32(0x2bc,0,true);
 write(bytes,0x2ac,[0,f(.333),0,f(.333)]);d.setUint32(0x2a0,0x3e99999a,true);d.setUint32(0x2a4,0,true);bytes.fill(0,0x190,0x198);write(bytes,0x2c4,[1,2,2.5,0]);write(bytes,0x360,zero);bytes.fill(0,0x370,0x378);d.setUint32(0x384,0,true);write(bytes,0x1b0,zero);d.setUint32(0x1c0,0,true);d.setFloat32(0x1d0,1,true);
 if(s.ready())resetOriginalWhisker(bytes,s);
}
export function resetOriginalWhisker(bytes:Uint8Array,s:WhiskerResetServices):void {
 if(!s.ready())return;const d=view(bytes),zero=[0,0,0,0],pivot=add(s.position(),read(bytes,0x270));write(bytes,0x260,pivot);
 const tick=s.tick()>>>0;for(const at of [0x2a8,0x2c0,0x2e0])d.setUint32(at,tick,true);bytes.fill(0,0x2e4,0x2ec);bytes[0x350]=1;
 const forward=originalAvatarForward(s.euler(),s),negative=forward.map(v=>-v);
 let r0=sub(perm(mul(forward,[-1,-0,-0,0]),0xd2),mul(forward,[-0,-0,-1,0])),r1=perm(r0,0xd2);
 r0=mul(r0,negative);r0=perm(r0,0xd2);r0=add(r0,mul(perm(r1,0xd2),forward));r0=perm(r0,0xd2);
 const right=[...r0.slice(0,3),0],up=[...r1.slice(0,3),0],back=[...negative.slice(0,3),0],eye=add(pivot,mul(forward,[-3,-3,-3,0]));
 write(bytes,0x30,right);write(bytes,0x40,up);write(bytes,0x50,back);write(bytes,0x60,[...eye.slice(0,3),1]);d.setUint32(0x24,d.getUint32(0x2e0,true),true);write(bytes,0x2f0,eye);
 if(!eye.slice(0,3).every(Number.isFinite))throw new Error('WhiskerCamera.cpp:345: !isNan(m_eyePos) && !isInf(m_eyePos)');
 write(bytes,0x300,eye);write(bytes,0x310,right);write(bytes,0x320,up);write(bytes,0x330,back);write(bytes,0x340,[99999,0,0,0]);
 const yaw=f(f(Math.PI/2)-f(s.atan2(forward[2],forward[0]))),pitch=f(s.asin(forward[1]));d.setFloat32(0x298,yaw,true);d.setFloat32(0x290,pitch,true);d.setFloat32(0x2d4,yaw,true);d.setFloat32(0x2d8,pitch,true);d.setUint32(0x2dc,0,true);
 bytes[0x100]=0;bytes[0x11c]=0;d.setUint32(0x120,0,true);d.setUint32(0x130,s.runtimeWord>>>0,true);write(bytes,0x140,zero);bytes[0x102]=1;bytes.fill(0,0x104,0x10c);d.setUint32(0x10c,0xc2c80000,true);d.setUint32(0x110,0,true);bytes.fill(0,0x114,0x116);write(bytes,0x150,forward);write(bytes,0x170,zero);d.setFloat32(0x160,100,true);bytes.fill(0,0x3c0,0x3c8);d.setUint32(0x21c,0,true);bytes[0x220]=0;
 bytes.fill(0,0x1f4,0x1fe);bytes.fill(0,0x200,0x20a);bytes.fill(0,0x20c,0x219);write(bytes,0x224,[.5,0,0,2000]);d.setFloat32(0x234,2000,true);d.setFloat32(0x238,1,true);bytes[0x1f0]=0;bytes[0x23c]=0;write(bytes,0x390,zero);d.setUint32(0x3a0,0,true);bytes[0x23d]=0;
}
