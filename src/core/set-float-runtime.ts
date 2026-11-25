import {readFloatCell,writeFloatCell,numericFloatBits,type FloatCell} from './object-numeric-runtime';
const f=Math.fround;
const view=(b:Uint8Array)=>new DataView(b.buffer,b.byteOffset,b.byteLength);
/** Original two resume/suspend hooks both capture target and clear progress. */
export function resetSetFloat(state:Uint8Array,target:FloatCell):void {
 const v=view(state);v.setUint32(0x50,readFloatCell(target),true);v.setUint32(0x4c,0,true);
}
/** Shared original GameTime scalar order and min/max operand selection. */
export function setFloatFrame(delta:number,scale:number,speedOverride:number):number {
 let value=f(f(f(speedOverride)*f(scale))*f(delta));
 value=f(0.0001)>value?f(0.0001):value;
 return f(0.266)<value?f(0.266):value;
}
/** SetFloat 0x100717730. logf/expf are explicit native math dependencies;
 * original macOS libm is still required for production bit-exact playback.
 * Finite source state is verified; NaN payload arithmetic remains pending.
 */
export function updateSetFloat(state:Uint8Array,target:FloatCell,frame:number,math:{logf(value:number):number;expf(value:number):number;},startEvent:()=>void):void {
 const v=view(state),snappiness=v.getFloat32(0x48,true),duration=v.getFloat32(0x3c,true),destination=v.getFloat32(0x38,true),initial=v.getFloat32(0x50,true),old=v.getFloat32(0x4c,true);
 let ratio=f(snappiness/30);ratio=0>ratio?0:ratio;ratio=1<ratio?1:ratio;
 const log=f(math.logf(f(1-ratio))),rate=f(log/(1/30)),exponent=f(rate*f(frame)),decay=f(math.expf(exponent));
 const blend=f(1-decay),progress=f(f(f(1-blend)*old)+f(blend*duration));
 v.setFloat32(0x4c,progress,true);
 writeFloatCell(target,numericFloatBits(f(initial+f(progress*f(destination-initial)))));
 if(f(0.01)>=Math.abs(f(duration-progress))){writeFloatCell(target,v.getUint32(0x38,true));startEvent();}
}
