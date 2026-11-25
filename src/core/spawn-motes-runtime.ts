/** Ordinary SpawnMotes SetTransform 0x10047b370 / GetTransform
 * 0x10047b3a0 copy all four columns verbatim. Construction lives in the
 * generated environment parent bodies. The event's ordinary enable/update
 * logic is restored below; Emitter/Mote services retain their own lifecycle. */
import type {ModelBakeMemory} from './model-baked-runtime';
import {resolveOriginalEmitterHandle,type OriginalEmitterHandle} from './emitter-runtime';
import {transformNativeObb,NativeMarkerArithmeticBoundary,type NativeMarkerArithmeticServices} from './marker-transform-runtime';
type Memory=Omit<ModelBakeMemory,'string'>;
const f=Math.fround;
const arithmetic=(operation:'add'|'subtract'|'multiply'|'divide'|'sqrt',a:number,b?:number)=>{
 const result=f(operation==='add'?a+b!:operation==='subtract'?a-b!:operation==='multiply'?a*b!:operation==='divide'?a/b!:Math.sqrt(a));
 if(!Number.isFinite(a)||(b!==undefined&&!Number.isFinite(b))||!Number.isFinite(result))throw new NativeMarkerArithmeticBoundary(operation,a,b);
 return result;
};
const add=(a:number,b:number)=>arithmetic('add',a,b),sub=(a:number,b:number)=>arithmetic('subtract',a,b),mul=(a:number,b:number)=>arithmetic('multiply',a,b),div=(a:number,b:number)=>arithmetic('divide',a,b);
const vector=(m:Memory,p:bigint)=>{const b=m.bytes(p,16),v=new DataView(b.buffer,b.byteOffset,16);return Array.from({length:4},(_,i)=>v.getFloat32(i*4,true));};
const packed=(values:number[])=>{const out=new Uint8Array(16),v=new DataView(out.buffer);values.forEach((x,i)=>v.setFloat32(i*4,x,true));return out;};
const scalar=(m:Memory,p:bigint)=>{const b=m.bytes(p,4);return new DataView(b.buffer,b.byteOffset,4).getFloat32(0,true);};
const double=(m:Memory,p:bigint)=>{const b=m.bytes(p,8);return new DataView(b.buffer,b.byteOffset,8);};
export interface OriginalSpawnMotesServices {
 arithmetic?:NativeMarkerArithmeticServices;
 defaultEmitterParams:bigint;
 createEmitter(barn:bigint,position:Uint8Array,direction:Uint8Array,params:bigint,extra:number,duration:number):OriginalEmitterHandle;
 /** Original GameTime clamp, including debug scale, supplied by the owner. */
 delta():number;
 randomInt():number;
 /** Float32 sin/cos return bits; native verification captures these separately. */
 sincos(inputBits:number):{sinBits:number;cosBits:number};
 spawnMote(game:bigint,position:Uint8Array,params:bigint,velocity:Uint8Array):void;
 start(event:bigint):void;
}
/** Whole ordinary OnEnabled 0x1004809a0. A stale generation suppresses
 * the speed write, and the event's velocity is re-read after creation. */
export function enableOriginalSpawnMotes(m:Memory,event:bigint,game:bigint,s:OriginalSpawnMotesServices){
 m.write64(event+152n,0n);m.write32(event+148n,0);
 const handle=s.createEmitter(m.read64(game+0x438n),new Uint8Array(m.bytes(event+112n,16)),packed([0,1,0,0]),s.defaultEmitterParams,0,scalar(m,event+140n));
 const emitter=resolveOriginalEmitterHandle(m,handle);if(emitter)m.write32(emitter+132n,m.read32(event+144n));
}
const halfBox=()=>{const b=new Uint8Array(64),v=new DataView(b.buffer);for(let i=0;i<3;i++)v.setFloat32(i*20,.5,true);v.setFloat32(60,1,true);return b;};
const bits=(n:number)=>{const b=new ArrayBuffer(4),v=new DataView(b);v.setFloat32(0,n,true);return v.getUint32(0,true);};
const value=(n:number)=>{const b=new ArrayBuffer(4),v=new DataView(b);v.setUint32(0,n,true);return v.getFloat32(0,true);};
/** CVTTSS2SI r64 followed by use of r12d. Invalid conversions produce the
 * original indefinite integer with a zero low word, rather than JS NaN. */
const budgetWord=(n:number)=>!Number.isFinite(n)||n<-(2**63)||n>=2**63?0:Number(BigInt(Math.trunc(n))&0xffffffffn);
/** Whole ordinary Update 0x100480a30. Each float32 multiply/add boundary,
 * float64 elapsed time, ceil scheduling and live callback field reload is
 * retained. Random and Mote creation are services, not invented particles. */
export function updateOriginalSpawnMotes(m:Memory,event:bigint,game:bigint,s:OriginalSpawnMotesServices){
 const op=(kind:'add'|'subtract'|'multiply'|'divide',a:number,b:number)=>s.arithmetic?s.arithmetic.calculate(kind,a,b):arithmetic(kind,a,b);
 const add=(a:number,b:number)=>op('add',a,b),sub=(a:number,b:number)=>op('subtract',a,b),mul=(a:number,b:number)=>op('multiply',a,b),div=(a:number,b:number)=>op('divide',a,b);
 const delta=s.delta(),timer=double(m,event+152n),previous=timer.getFloat64(0,true),elapsed=previous+f(delta);timer.setFloat64(0,elapsed,true);
 const duration=scalar(m,event+140n);let number=m.read32(event+136n),budget=1;
 if(number!==1){const steps=(number-1)>>>0;budget=budgetWord(subScheduling(f(Math.ceil(f(elapsed/duration*steps))),f(Math.ceil(f(previous/duration*steps)))));if(!number)budget=0;}
 let direction=vector(m,event+80n);const squares=direction.map(x=>mul(x,x)),length=arithmetic('sqrt',add(squares[2],add(squares[0],squares[1])));
 // VPERMILPS 0xc0 retains the y² SIMD padding lane used by native code.
 if(length>f(.00001))direction=direction.map((x,i)=>div(x,i===3?squares[1]:length));
 if(budget&&m.read32(event+148n)<number)for(let emitted=1;;emitted=(emitted+1)>>>0){
  const transformed=transformNativeObb(new Uint8Array(m.bytes(event+64n,64)),halfBox(),undefined,s.arithmetic),v=new DataView(transformed.buffer,transformed.byteOffset,64),axes=Array.from({length:3},(_,i)=>Array.from({length:4},(_,j)=>v.getFloat32(i*16+j*4,true)));
  let position=Array.from({length:4},(_,i)=>v.getFloat32(48+i*4,true));
  for(const axis of axes){const random=mul(f(s.randomInt()|0),2**-31),twice=add(random,random);position=position.map((x,i)=>add(sub(mul(axis[i],twice),axis[i]),x));}
  const center=vector(m,event+112n),projection=position.map((x,i)=>mul(direction[i],sub(x,center[i]))),dot=add(projection[2],add(projection[0],projection[1]));
  position=position.map((x,i)=>sub(x,mul(direction[i],dot)));
  const speed=scalar(m,event+144n),speedRandom=mul(f(s.randomInt()|0),2**-31),factor=add(mul(speedRandom,f(1.1)),mul(sub(1,speedRandom),f(.8))),magnitude=mul(factor,speed);
  const angleRandom=mul(f(s.randomInt()|0),2**-31),angle=add(mul(angleRandom,f(2*Math.PI)),mul(sub(1,angleRandom),0)),trig=s.sincos(bits(angle));
  const wobble=[value(trig.cosBits),0,value(trig.sinBits),0],velocity=wobble.map((x,i)=>mul(magnitude,add(mul(x,i===3?0:f(.2)),direction[i])));
  s.spawnMote(game,packed(position),m.read64(event+128n),packed(velocity));
  number=m.read32(event+136n);const count=(m.read32(event+148n)+1)>>>0;m.write32(event+148n,count);
  if(emitted>=budget||count>=number)break;
 }
 if(m.read32(event+148n)===number)s.start(event);
}
// Scheduling intermediates may be infinite for a saved zero duration. Native
// ceil/subtract and indefinite conversion still yield a defined zero budget.
const subScheduling=(a:number,b:number)=>f(a-b);
export function setOriginalSpawnMotesTransform(object:Uint8Array,matrix:Uint8Array):void {
 if(object.length<160||matrix.length!==64)throw new Error('SpawnMotes 原变换存储不完整');
 for(let column=0;column<4;column++)object.set(matrix.subarray(column*16,column*16+16),64+column*16);
}
export function getOriginalSpawnMotesTransform(object:Uint8Array):Uint8Array {
 if(object.length<160)throw new Error('SpawnMotes 原变换存储不完整');
 return new Uint8Array(object.subarray(64,128));
}
