import {eventUniqueId,requestOriginalEventEnabled,startOriginalEvent} from './event-start-runtime';
import {sortOriginalEventPointers} from './event-original-sort';
const view=(b:Uint8Array)=>new DataView(b.buffer,b.byteOffset,b.byteLength);
export const originalEventBarnCapacity=1280;
export type OriginalEventSlot=0|0x10|0x18|0x30|0x38|0x40|0x48|0x58;
export interface OriginalEventNode {event:Uint8Array|null;next:OriginalEventNode|null;}
/** References resolve native pointers. bytes preserves nonpointer Barn state;
 * freeHead/node.next represent +0x5030/+8, never fabricated pointer numbers. */
export interface OriginalEventBarn {bytes:Uint8Array;nodes:OriginalEventNode[];freeHead:OriginalEventNode|null;}
export interface OriginalEventBarnServices<Game> {
 barnFor(event:Uint8Array):Uint8Array|null;
 logNullBarn(message:string):void;
 virtual(slot:OriginalEventSlot,event:Uint8Array,game:Game|undefined,loadHeapOffset?:0x85098):void;
 scratchHeap():unknown;
 allocateScratch(heap:unknown,size:0x2800,alignment:8):OriginalEventNode[];
 free(heap:unknown,allocation:OriginalEventNode[]|Uint8Array|null):void;
 eventHeap(barn:OriginalEventBarn):unknown;
 loadHeapUsed(barn:OriginalEventBarn):number;
}
function check(barn:OriginalEventBarn):void {
 if(barn.nodes.length!==originalEventBarnCapacity||barn.bytes.byteLength<0x1050f4)throw new Error('Original EventBarn requires all 1280 nodes and its complete state allocation');
}
/** Original single-event state machine 0x10032f5b0. Callback state writes are
 * observed at the exact original reload points, including pending requests. */
export function dispatchOriginalEvent<Game>(barn:OriginalEventBarn,event:Uint8Array,game:Game,s:OriginalEventBarnServices<Game>):void {
 const v=view(event);
 if(event[0x20]===0){event[0x20]=1;s.virtual(0x10,event,game,0x85098);}
 if(event[0x21]!==0){const enabled=event[0x23]!==0;v.setUint16(0x21,0,true);if(!enabled)event[0x23]=1;s.virtual(enabled?0x38:0x30,event,game);}
 if(event[0x23]===0)return;
 const finish=()=>{v.setUint16(0x21,0,true);event[0x23]=0;s.virtual(0x40,event,game);if(event[0x25]!==0){startOriginalEvent(event,s.barnFor(event),s.logNullBarn);event[0x24]=0;}};
 if(event[0x22]!==0){finish();return;}
 v.setBigUint64(0x30,0n,true);s.virtual(0x48,event,game);
 if(event[0x23]!==0&&event[0x22]!==0)finish();
}
function releaseNode<Game>(barn:OriginalEventBarn,node:OriginalEventNode,game:Game,s:OriginalEventBarnServices<Game>):void {
 if(node.event){if(node.event[0x20]!==0)s.virtual(0x18,node.event,game,0x85098);
  // Native code reloads slot after unload and again after destruction.
  if(!node.event)throw new Error('Original unload callback cleared the node before native destructor dereference');
  s.virtual(0,node.event,undefined);s.free(s.eventHeap(barn),node.event);node.event=null;
 }
 node.next=barn.freeHead;barn.freeHead=node;
}
/** Whole Update normal path 0x10032ea90. Capture nodes once before sorting;
 * callbacks may replace their event references but cannot extend the capture. */
export function updateOriginalEventBarn<Game>(barn:OriginalEventBarn,game:Game,s:OriginalEventBarnServices<Game>):void {
 check(barn);const captured=s.allocateScratch(s.scratchHeap(),0x2800,8);
 if(captured.length!==0)throw new Error('Scratch service must return an empty capture allocation');
 for(const node of barn.nodes)if(node.event&&(node.event[0x24]!==0||view(node.event).getUint32(0x28,true)!==1))captured.push(node);
 sortOriginalEventPointers(captured,(a,b)=>{
  if(!a.event||!b.event)throw new Error('Null original event pointer in sort');
  return view(a.event).getUint32(0x10,true)<view(b.event).getUint32(0x10,true);
 });
 for(const node of captured){const event=node.event;if(!event)throw new Error('Captured native slot became null before dispatch');dispatchOriginalEvent(barn,event,game,s);
  if(event[0x24]===0&&view(event).getUint32(0x28,true)!==1)releaseNode(barn,node,game,s);
 }
 view(barn.bytes).setUint32(0x10,0,true);s.free(s.scratchHeap(),captured);
}
/** OnLevelLoad 0x10032e540. Event registration 0x100332290 identifies +0xc
 * as autoStart (bool, Tool_DefaultValue=false); Event's constructor writes 0.
 * This still requires the original registered trigger slots and ID ordering. */
export function loadOriginalEventBarn<Game>(barn:OriginalEventBarn,game:Game,s:OriginalEventBarnServices<Game>):void {
 check(barn);const v=view(barn.bytes);v.setUint32(0x10,0,true);v.setUint32(0x1050f0,s.loadHeapUsed(barn),true);barn.bytes[0x5038]=0;
 const captured=barn.nodes.flatMap(n=>n.event&&view(n.event).getUint32(0x28,true)===1?[n.event]:[]);
 sortOriginalEventPointers(captured,(a,b)=>eventUniqueId(a)<eventUniqueId(b));
 for(const event of captured){if(event[0xc]!==0)requestOriginalEventEnabled(event,s.barnFor(event),s.logNullBarn);
  if(event[0x20]===0){event[0x20]=1;s.virtual(0x10,event,game,0x85098);}
 }
}
/** ReleaseAll 0x10032e920 links even empty slots in ascending order, then
 * explicitly resets freeHead to null; reconstructing a usable pool is separate. */
export function releaseAllOriginalEvents<Game>(barn:OriginalEventBarn,game:Game,s:OriginalEventBarnServices<Game>):void {
 check(barn);for(const node of barn.nodes)releaseNode(barn,node,game,s);barn.bytes[0x5038]=1;barn.freeHead=null;
}
/** Virtual render forwarding 0x10032ec50, preserving ascending slot order. */
export function renderOriginalEvents<Game>(barn:OriginalEventBarn,game:Game,s:OriginalEventBarnServices<Game>):void {
 check(barn);for(const node of barn.nodes){const e=node.event;if(e&&e[0x24]!==0&&e[0x20]!==0&&e[0x23]!==0)s.virtual(0x58,e,game);}
}
/** FindUniqueId 0x10032f3e0 checks ID only, including nontrigger events. */
export function findOriginalEventByUniqueId(barn:OriginalEventBarn,id:number):Uint8Array|null {
 check(barn);for(const n of barn.nodes)if(n.event&&view(n.event).getUint16(0x2c,true)===(id&0xffff))return n.event;return null;
}
