/** FloatMult / FloatSplit execution bodies from Sky 0.3.18. This byte API
 * preserves single-input NaN payloads, signed zero and aliased Float objects.
 * Arithmetic uses round-to-nearest-even with gradual underflow; callers with
 * another MXCSR mode require a separate arithmetic service before integration.
 * Object construction, scheduling and metadata registration are separate.
 */
export interface FloatCell {storage:Uint8Array;}
export interface FloatClump {
 count():number;
 member(index:number):unknown;
}
export interface FloatSplitServices {
 outputs():FloatClump;
 castFloat(member:unknown):FloatCell|null;
 startEvent():void;
}
const view=(bytes:Uint8Array)=>new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);
const scratch=new DataView(new ArrayBuffer(4));
export function numericFloatBits(value:number):number {scratch.setFloat32(0,value,true);return scratch.getUint32(0,true);}
export function numericFloatValue(bits:number):number {scratch.setUint32(0,bits,true);return scratch.getFloat32(0,true);}
export function readFloatCell(cell:FloatCell):number {return view(cell.storage).getUint32(0x10,true);}
export function writeFloatCell(cell:FloatCell,bits:number):void {view(cell.storage).setUint32(0x10,bits,true);}
const isNaNBits=(bits:number)=>(bits&0x7fffffff)>0x7f800000;
function arithmetic(a:number,b:number,operation:(a:number,b:number)=>number):number {
 if(isNaNBits(a))return (a|0x400000)>>>0;
 if(isNaNBits(b))return (b|0x400000)>>>0;
 const value=operation(numericFloatValue(a),numericFloatValue(b));
 return Number.isNaN(value)?0xffc00000:numericFloatBits(value);
}
export function divideNumericFloat(aBits:number,bBits:number):number {
 if(isNaNBits(aBits)&&isNaNBits(bBits))throw new Error('Two NaN inputs require a verified native propagation service');
 return arithmetic(aBits,bBits,(a,b)=>a/b);
}
export function addNumericFloat(aBits:number,bBits:number,resolveDualNaN?:(a:number,b:number)=>number):number {
 if(isNaNBits(aBits)&&isNaNBits(bBits)){
  if(!resolveDualNaN)throw new Error('Two NaN inputs require a verified native propagation service');
  return resolveDualNaN(aBits,bBits);
 }
 return arithmetic(aBits,bBits,(a,b)=>a+b);
}
export interface FloatAddState {target:FloatCell;amountFloat:FloatCell|null;output:FloatCell|null;amountBits:number;minimumBits:number;maximumBits:number;useMinimum:boolean;useMaximum:boolean;everyFrame:boolean;}
/** Original max bound precedes min bound. An absent output writes target. */
export function executeFloatAdd(state:FloatAddState,startEvent:()=>void,resolveDualNaN?:(a:number,b:number)=>number):void {
 let value=addNumericFloat(readFloatCell(state.target),state.amountFloat?readFloatCell(state.amountFloat):state.amountBits,resolveDualNaN);
 if(state.useMaximum&&numericFloatValue(value)>numericFloatValue(state.maximumBits))value=state.maximumBits;
 if(state.useMinimum&&numericFloatValue(state.minimumBits)>numericFloatValue(value))value=state.minimumBits;
 writeFloatCell(state.output??state.target,value);
 if(!state.everyFrame)startEvent();
}
export function truncateOriginalFloatToInt(bits:number):number {
 const value=Math.trunc(numericFloatValue(bits));
 return !Number.isFinite(value)||value< -2147483648||value>2147483647?-2147483648:value;
}
/** Original FloatEnable re-reads input before every cast, and count after
 * every SetEnabled call; it neither captures count nor starts the Event. */
export function executeFloatEnable(input:FloatCell,services:{objects():FloatClump;castObject(member:unknown):unknown|null;setEnabled(object:unknown,enabled:boolean):void;}):void {
 let clump=services.objects();if(countOf(clump)===0)return;
 for(let i=0;;i=(i+1)>>>0){
  const saved=readFloatCell(input),object=services.castObject(clump.member(i));
  if(object===null)throw new Error('Clump.h:71: ret');
  services.setEnabled(object,(i|0)<truncateOriginalFloatToInt(saved));
  clump=services.objects();if(((i+1)>>>0)>=countOf(clump))return;
 }
}
export function executeFloatMult(a:FloatCell,b:FloatCell,output:FloatCell,resolveDualNaN?:(aBits:number,bBits:number)=>number):void {
 const av=readFloatCell(a),bv=readFloatCell(b);
 if(isNaNBits(av)&&isNaNBits(bv)){
  // QEMU propagation differs from the unverified target CPU. Keep this
  // dependency explicit, rather than selecting a guessed native payload.
  if(!resolveDualNaN)throw new Error('Two NaN inputs require a verified native propagation service');
  writeFloatCell(output,resolveDualNaN(av,bv));
 }else writeFloatCell(output,arithmetic(av,bv,(x,y)=>x*y));
}
function countOf(clump:FloatClump):number {
 const n=clump.count();if(!Number.isInteger(n)||n<0||n>0xffffffff)throw new Error('Clump count must be uint32');return n;
}
/** Captures the original count and input once, but re-reads the Clump and its
 * count before each member lookup. Cast callbacks may change later members.
 * Nonempty output does not call Event::Start in the original execution body.
 */
export function executeFloatSplit(input:FloatCell,services:FloatSplitServices):void {
 const n=countOf(services.outputs());
 if(n===0){services.startEvent();return;}
 const inverse=numericFloatBits(1/Math.fround(n)),savedInput=readFloatCell(input);
 for(let i=0;i<n;i++){
  const clump=services.outputs();
  if(i>=countOf(clump))throw new Error('Clump.h:54: idx < size');
  const target=services.castFloat(clump.member(i));
  if(!target)throw new Error('Clump.h:71: ret');
  const lo=arithmetic(inverse,numericFloatBits(i),(a,b)=>a*b);
  const hi=arithmetic(inverse,numericFloatBits(i+1),(a,b)=>a*b);
  const width=arithmetic(hi,lo,(a,b)=>a-b),w=numericFloatValue(width);
  let value=0x3f800000;
  if(w>numericFloatValue(0x3727c5ac)||w<numericFloatValue(0xb727c5ac)){
   value=arithmetic(arithmetic(savedInput,lo,(a,b)=>a-b),width,(a,b)=>a/b);
  }
  // MAXSS(0, value), MINSS(1, result) select operand two for
  // equal/unordered comparisons. In particular retain negative zero/NaN.
  if(0>numericFloatValue(value))value=0;
  if(1<numericFloatValue(value))value=0x3f800000;
  writeFloatCell(target,value);
 }
}
