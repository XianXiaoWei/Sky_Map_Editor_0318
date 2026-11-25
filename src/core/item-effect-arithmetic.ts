import {NativeMarkerArithmeticBoundary, type NativeMarkerArithmeticServices, type MarkerArithmeticOperation} from './marker-transform-runtime';

/** The item routines use scalar SSE rounding and the same finite arithmetic
 * boundary as the verified matrix runtime. Non-finite payloads need a service. */
export function itemEffectArithmetic(s?: NativeMarkerArithmeticServices) {
 const op=(operation:MarkerArithmeticOperation,a:number,b?:number)=>{
  const n=Math.fround(operation==='add'?a+b!:operation==='subtract'?a-b!:operation==='multiply'?a*b!:operation==='divide'?a/b!:Math.sqrt(a));
  if(Number.isFinite(a)&&(b===undefined||Number.isFinite(b))&&Number.isFinite(n))return n;
  if(s)return s.calculate(operation,a,b);
  throw new NativeMarkerArithmeticBoundary(operation,a,b);
 };
 const add=(a:number,b:number)=>op('add',a,b),sub=(a:number,b:number)=>op('subtract',a,b),mul=(a:number,b:number)=>op('multiply',a,b),div=(a:number,b:number)=>op('divide',a,b),sqrt=(a:number)=>op('sqrt',a);
 return {add,sub,mul,div,sqrt,
  length3:(v:number[])=>sqrt(add(mul(v[2],v[2]),add(mul(v[0],v[0]),mul(v[1],v[1])))),
  length4:(v:number[])=>sqrt(add(add(mul(v[0],v[0]),mul(v[2],v[2])),add(mul(v[1],v[1]),mul(v[3],v[3]))))};
}
export const itemView=(b:Uint8Array)=>new DataView(b.buffer,b.byteOffset,b.byteLength);
export const itemFloats=(b:Uint8Array)=>Array.from({length:b.length/4},(_,i)=>itemView(b).getFloat32(i*4,true));
export function itemFloatBytes(ns:number[]){const b=new Uint8Array(ns.length*4),v=itemView(b);ns.forEach((n,i)=>v.setFloat32(i*4,n,true));return b;}
// SSE MINSS/MAXSS return operand two for equal values and unordered comparisons.
export const itemMin=(a:number,b:number)=>a<b?a:b;
export const itemMax=(a:number,b:number)=>a>b?a:b;
