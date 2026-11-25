import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

const fail=(line:number,severity:number,expression:string):never=>{throw new NativeObjectFoundationFailure('BinaryStream.cpp',line,severity,expression);};
const byte=(m:ModelBakeMemory,p:bigint)=>m.bytes(p,1)[0];
const invalid=(m:ModelBakeMemory,p:bigint,line:number)=>{if(byte(m,p+0x24n)===1)fail(line,4,'!m_assert');m.write8(p,0);};
/** Original bit writer 0x1007692c0; p is the stream's bit-storage subobject.
 * Writes OR into caller-prepared bytes and retain partial writes on overflow. */
export function writeOriginalBinaryBits(m:ModelBakeMemory,p:bigint,n:number,count:number){
 if(!m.read64(p+8n))fail(47,3,'m_buffer');if(!byte(m,p))return;
 if(((count-1)>>>0)>=32){invalid(m,p,52);return;}
 if(count<32)n&=(2**count-1);n>>>=0;
 let remaining=count;
 while(remaining>0){
  const cursor=m.read64(p+0x18n),end=m.read64(p+8n)+BigInt(m.read32(p+0x10n));
  if(cursor>=end){invalid(m,p,67);return;}
  const offset=m.read32(p+0x20n),take=Math.min(8-offset,remaining);
  m.write8(cursor,byte(m,cursor)|(n<<offset));remaining-=take;
  const next=offset+take;m.write32(p+0x20n,next);
  if(next>=8){m.write32(p+0x20n,0);m.write64(p+0x18n,cursor+1n);n>>>=take;}
 }
}
/** Original bit reader 0x1007693f0. Overflow preserves cursor advancement,
 * marks the stream invalid and returns zero rather than a partial value. */
export function readOriginalBinaryBits(m:ModelBakeMemory,p:bigint,count:number):number {
 const buffer=m.read64(p+8n);if(!buffer)fail(89,3,'m_buffer');if(!byte(m,p))return 0;
 if(((count-1)>>>0)>=32){invalid(m,p,94);return 0;}
 const end=buffer+BigInt(m.read32(p+0x10n));let cursor=m.read64(p+0x18n),remaining=count,shift=0,result=0;
 while(remaining>0){
  if(cursor>=end){invalid(m,p,106);return 0;}
  const offset=m.read32(p+0x20n),take=Math.min(8-offset,remaining);
  result|=(byte(m,cursor)>>>offset)<<shift;remaining-=take;shift+=take;
  const next=offset+take;m.write32(p+0x20n,next);
  if(next>=8){m.write32(p+0x20n,0);cursor++;m.write64(p+0x18n,cursor);}
 }
 return (count<32?result&(2**count-1):result)>>>0;
}
/** Original 0x10076a0a0. Align to the next byte before testing capacity;
 * untouched alignment bits stay in the caller's buffer. */
export function serializeOriginalBinaryBytes(m:ModelBakeMemory,stream:bigint,cell:bigint,length:number){
 const write=m.read32(stream)===1,buffer=m.read64(stream+16n);
 if(!buffer)fail(write?135:170,3,'m_buffer');if(!byte(m,stream+8n))return;
 if(m.read32(stream+40n)){m.write32(stream+40n,0);m.write64(stream+32n,m.read64(stream+32n)+1n);}
 const cursor=m.read64(stream+32n),count=length>>>0;
 if(cursor+BigInt(count)>buffer+BigInt(m.read32(stream+24n))){
  if(byte(m,stream+44n)===1)fail(write?145:180,4,'!m_assert');m.write8(stream+8n,0);return;
 }
 if(write)m.bytes(cursor,count).set(m.bytes(cell,count).slice());else m.bytes(cell,count).set(m.bytes(cursor,count).slice());
 m.write64(stream+32n,m.read64(stream+32n)+BigInt(count));
}
export function serializeOriginalBinaryUInt(m:ModelBakeMemory,stream:bigint,cell:bigint,minimum:number,maximum:number){
 minimum>>>=0;maximum>>>=0;if(maximum<=minimum)fail(488,3,'min < max && max > 0');
 const count=32-Math.clz32((maximum-minimum)>>>0);let n=m.read32(cell);
 if(m.read32(stream)===1)writeOriginalBinaryBits(m,stream+8n,(n-minimum)>>>0,count);
 else n=readOriginalBinaryBits(m,stream+8n,count);
 if(m.read32(stream)===0){n=(n+minimum)>>>0;m.write32(cell,n);}else n=m.read32(cell);
 if(n<minimum||n>maximum){if(byte(m,stream+48n)===1)fail(497,4,'!m_assert');m.write8(stream+8n,0);}
}
/** Byte wrapper retains a private 32-bit cell across the range operation. */
export function serializeOriginalBinaryByte(m:ModelBakeMemory,stream:bigint,cell:bigint,minimum:number,maximum:number){
 const input=byte(m,cell),count=32-Math.clz32(((maximum>>>0)-(minimum>>>0))>>>0);
 if((maximum>>>0)<=(minimum>>>0))fail(488,3,'min < max && max > 0');
 let n=input;if(m.read32(stream)===1)writeOriginalBinaryBits(m,stream+8n,(n-minimum)>>>0,count);else n=readOriginalBinaryBits(m,stream+8n,count);
 if(m.read32(stream)===0)n=(n+minimum)>>>0;else n=input;
 if(n<(minimum>>>0)||n>(maximum>>>0)){if(byte(m,stream+48n)===1)fail(497,4,'!m_assert');m.write8(stream+8n,0);}
 m.write8(cell,n);
}
export function serializeOriginalBinaryBool(m:ModelBakeMemory,stream:bigint,cell:bigint){
 let n=byte(m,cell);if(m.read32(stream)===1)writeOriginalBinaryBits(m,stream+8n,n,1);else n=readOriginalBinaryBits(m,stream+8n,1);
 m.write8(cell,Number(n!==0));
}
/** Original pivot quantization 0x10076af70, retaining float32 operation order. */
export function serializeOriginalBinaryFloat(m:ModelBakeMemory,stream:bigint,cell:bigint,minimum:number,maximum:number,pivot:number,count:number,s?:NatureArithmeticServices){
 const a=natureArithmetic(s),one=0x3f800000,half=0x3f000000;
 if(!(value(maximum)>value(minimum)))fail(504,4,'min < max');
 if(!(value(maximum)>=value(pivot))||!(value(pivot)>=value(minimum)))fail(505,4,'pivot >= min && pivot <= max');
 if(((count-1)>>>0)>=31)fail(506,3,'bits > 0 && bits < 32');
 const maximumCode=2**count-1,lowRange=a.sub(pivot,minimum),cutoff=Math.trunc(value(a.mul(a.div(lowRange,a.sub(maximum,minimum)),bits(maximumCode))))>>>0;
 if(m.read32(stream)===1){
  const input=m.read32(cell);let code:number;
  if(value(pivot)>value(minimum)&&value(pivot)>value(input)){
   const ratio=a.min(one,a.max(0,a.div(a.sub(input,minimum),lowRange)));
   code=a.add(a.mul(ratio,bits(cutoff)),half);
  }else{
   const ratio=a.min(one,a.max(0,a.div(a.sub(input,pivot),a.sub(maximum,pivot))));
   code=a.add(a.add(a.mul(ratio,bits((maximumCode-cutoff)>>>0)),half),bits(cutoff));
  }
  const converted=Number.isFinite(value(code))?Math.trunc(value(code))>>>0:0;writeOriginalBinaryBits(m,stream+8n,converted,count);
 }else{
  const code=readOriginalBinaryBits(m,stream+8n,count);let decoded:number;
  if(code<=cutoff){if(!cutoff)decoded=minimum;else{const ratio=a.div(bits(code),bits(cutoff));decoded=a.add(a.mul(ratio,pivot),a.mul(a.sub(one,ratio),minimum));}}
  else{const span=(maximumCode-cutoff)>>>0;if(!span)decoded=maximum;else{const ratio=a.div(bits((code-cutoff)>>>0),bits(span));decoded=a.add(a.mul(ratio,maximum),a.mul(a.sub(one,ratio),pivot));}}
  m.write32(cell,decoded);
 }
 if(Number.isNaN(value(m.read32(cell)))){if(byte(m,stream+48n)===1)fail(539,4,'!m_assert');m.write8(stream+8n,0);}
}
export function serializeOriginalBinaryVector(m:ModelBakeMemory,stream:bigint,cell:bigint){
 for(let i=0;i<3;i++){
  const p=cell+BigInt(i*4);serializeOriginalBinaryBytes(m,stream,p,4);
  if(Number.isNaN(value(m.read32(p)))){if(byte(m,stream+48n)===1)fail(312,4,'!m_assert');m.write8(stream+8n,0);}
 }
}
/** Player-ID contexts 1/2/3 and actual NetPlayerBarn mapping bodies. */
export function serializeOriginalBinaryPlayerId(m:ModelBakeMemory,stream:bigint,cell:bigint,readScratchByte?:number){
 const context=m.read32(stream+56n);
 if(context===3){serializeOriginalBinaryBytes(m,stream,cell,4);return;}
 if(context!==1&&context!==2)throw new NativeObjectFoundationFailure('NetGameTypes.cpp',61,4,'false');
 const barn=context===2?m.read64(stream+64n):0n;if(context===2&&!barn)throw new NativeObjectFoundationFailure('NetGameTypes.cpp',41,3,'netPlayerBarn');
 // The original raw-byte operation uses private stack cells, not the ID field.
 const write=m.read32(stream)===1;let n=context===2&&!write?readScratchByte: m.read32(cell)&255;
 if(context===2&&write){const id=m.read32(cell);n=0;if(id){const count=m.read32(barn+0x7d10n);for(let i=0;i<count;i++){const p=barn+BigInt(i)*0xfa0n;if(m.read32(p+16n)===id){n=byte(m,p+20n);break;}}}}
 const buffer=m.read64(stream+16n);if(!buffer)fail(write?135:170,3,'m_buffer');
 if(byte(m,stream+8n)){
  if(m.read32(stream+40n)){m.write32(stream+40n,0);m.write64(stream+32n,m.read64(stream+32n)+1n);}
  const cursor=m.read64(stream+32n);
  if(cursor+1n>buffer+BigInt(m.read32(stream+24n))){if(byte(m,stream+44n)===1)fail(write?145:180,4,'!m_assert');m.write8(stream+8n,0);}
  else{if(write)m.write8(cursor,n!);else n=byte(m,cursor);m.write64(stream+32n,m.read64(stream+32n)+1n);}
 }
 if(n===undefined)throw new Error('Failed PlayerId read requires the original caller private scratch byte');
 if(context===1)m.write32(cell,n);
 else if(!write){let id=0;if(n){const count=m.read32(barn+0x7d10n);for(let i=0;i<count;i++){const p=barn+BigInt(i)*0xfa0n;if(byte(m,p+20n)===n){id=m.read32(p+16n);break;}}}m.write32(cell,id);}
}
