/** Event::Start 0x10032ef60. The Barn pointer has already been resolved by the
 * caller; all other event/barn bytes remain intact. This does not implement
 * Derived virtual methods and Barn allocation remain caller services.
 */
export const nullEventBarnMessage='Called Start() on an Event with a null m_eventBarn, will have 0 seq (undefined order).';
export function startOriginalEvent(event:Uint8Array,barn:Uint8Array|null,logNullBarn:(message:string)=>void):void {
 const state=new DataView(event.buffer,event.byteOffset,event.byteLength);
 if(state.getUint8(0x22)===0){
  if(barn){
   const counter=new DataView(barn.buffer,barn.byteOffset,barn.byteLength),sequence=counter.getUint32(0x10,true);
   counter.setUint32(0x10,(sequence+1)>>>0,true);state.setUint32(0x10,sequence,true);
  }else{state.setUint32(0x10,0,true);logNullBarn(nullEventBarnMessage);}
 }
 state.setUint16(0x21,0x100,true);
}
/** Event enable request 0x10032e2f0: opposite pending word to Start.
 * Both requests assign a sequence only when their own pending byte is zero. */
export function requestOriginalEventEnabled(event:Uint8Array,barn:Uint8Array|null,logNullBarn:(message:string)=>void):void {
 const state=new DataView(event.buffer,event.byteOffset,event.byteLength);
 if(state.getUint8(0x21)===0){
  if(barn){const counter=new DataView(barn.buffer,barn.byteOffset,barn.byteLength),sequence=counter.getUint32(0x10,true);counter.setUint32(0x10,(sequence+1)>>>0,true);state.setUint32(0x10,sequence,true);}
  else{state.setUint32(0x10,0,true);logNullBarn(nullEventBarnMessage);}
 }
 state.setUint16(0x21,1,true);
}
/** Full Event::SetEnabled 0x10032e2c0. false calls Start; the state machine
 * decides when to invoke the finish callback. */
export function setOriginalEventEnabled(event:Uint8Array,enabled:boolean,barn:Uint8Array|null,logNullBarn:(message:string)=>void):void {
 if(enabled)requestOriginalEventEnabled(event,barn,logNullBarn);else startOriginalEvent(event,barn,logNullBarn);
}
const view=(b:Uint8Array)=>new DataView(b.buffer,b.byteOffset,b.byteLength);
/** Full original base Event constructor body with explicit metadata class ID.
 * Undefined bytes, including sequence/autoStart, retain allocation contents. */
export function constructOriginalEvent(event:Uint8Array,classId:number):void {
 const v=view(event);v.setBigUint64(0,0x100c14ea0n,true);v.setUint32(8,classId,true);v.setUint8(0xc,0);
 v.setBigUint64(0x18,0n,true);v.setUint32(0x21,0x1000000,true);v.setUint8(0x25,0);v.setUint32(0x28,0,true);v.setUint16(0x2c,0xffff,true);v.setUint8(0x2e,0xff);
}
export function resumeOriginalEvent(event:Uint8Array,start:()=>void):void {start();view(event).setUint8(0x24,0);}
export function eventHasUniqueId(event:Uint8Array):boolean {const v=view(event);return v.getUint32(0x28,true)===1&&v.getUint16(0x2c,true)!==0xffff;}
export function eventUniqueId(event:Uint8Array):number {if(!eventHasUniqueId(event))throw new Error('Event.cpp:89: HasUniqueId()');return view(event).getUint16(0x2c,true);}
export function eventTypeIndex(event:Uint8Array):number {
 const v=view(event);if(v.getUint32(0x28,true)!==1)throw new Error('Event.cpp:95: m_persistence == Event::kTrigger');
 if(v.getUint8(0x2e)===255)throw new Error('Event.cpp:96: m_typeIdx != (EventTypeIdx)~0');return v.getUint8(0x2e);
}
/** Original transitions 0x10032f1e0/200/220 clear both active flags before
 * forwarding to virtual slots 0x30/38/40; only two alter byte +0x23. */
export function forwardOriginalEventTransition(event:Uint8Array,slot:0x30|0x38|0x40,callback:(event:Uint8Array)=>void):void {
 const v=view(event);v.setUint16(0x21,0,true);if(slot!==0x38)v.setUint8(0x23,slot===0x30?1:0);callback(event);
}
