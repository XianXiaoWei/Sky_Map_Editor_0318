import type {Field,ObjectNode} from './objects';
import {constructOriginalEvent,forwardOriginalEventTransition,startOriginalEvent} from './event-start-runtime';
import {cameraEventRead,originalCameraEventStep,startOriginalCameraShake,startOriginalKeyFrameShake,updateOriginalCameraShake,updateOriginalKeyFrameShake,type WhiskerShakeState} from './camera-events';
import {previewWhiskerShakeMath,updateOriginalWhiskerShake} from './avatar-camera-shake';
const definitions={SetCameraShake:{names:['speed','force','fadeInDuration','fadeOutDuration','duration'],offset:0x38},SetCameraKeyFrameShake:{names:['idleShakeForce','movingShakeForce','shakeSpeedMult','fadeInTime','duration','fadeOutTime'],offset:0x40}} as const;
export type CameraEventClass=keyof typeof definitions;
export interface CameraEventCandidate {id:number;name:string;className:CameraEventClass;available:boolean;reason:string;fields:Field[];targets:number[];}
/** Only complete serialized settings are usable; omitted constructor values
 * and invalid Clump members remain unresolved. Selection is explicit. */
export function cameraEventCandidates(nodes:ObjectNode[]):CameraEventCandidate[]{return nodes.filter(n=>Object.hasOwn(definitions,n.className)).map(n=>{
 const className=n.className as CameraEventClass,def=definitions[className],fields=def.names.map(name=>n.fields.find(f=>f.name===name));let reason=fields.some(f=>!f||f.raw.length!==8)?'存在待恢复的默认字段':'';const targets:number[]=[];
 if(className==='SetCameraKeyFrameShake'){
  const ref=n.fields.find(f=>f.name==='cameraKeyFrames'),clump=ref?.kind==='reference'?nodes[Number(ref.value)]:undefined,data=clump?.fields.find(f=>f.name==='data');
  if(clump?.className!=='Clump'||data?.kind!=='array'||!data.children||data.children.length!==Number(data.value))reason='关键帧 Clump 未解析';
  else for(const child of data.children){const id=Number(child.value);if(child.kind!=='reference'||nodes[id]?.className!=='CameraKeyFrame')reason='Clump 含未解析的相机关键帧';else targets.push(id);}
 }
 if(!reason&&fields.some(field=>!Number.isFinite(new DataView(Uint8Array.from(field!.raw.match(/../g)!.map(v=>parseInt(v,16))).buffer).getFloat32(0,true))))reason='参数不是有限数值';
 return {id:n.id,name:n.name,className,available:!reason,reason,fields:fields.filter((f):f is Field=>!!f),targets};
});}
export interface CameraEventPreviewSnapshot {id:number;className:CameraEventClass;running:boolean;elapsed:number;weight:number|null;parameters:{speed:number;force:number}|null;positionShake:number[]|null;targets:{id:number;idle:number;moving:number;speed:number}[];}
/** Explicit editor session coordinator around the verified update functions.
 * Allocations, lookup, clock and finish dispatch are preview inputs. It does
 * not schedule autoStart. Optional positional shake runs the original helper
 * with explicit neutral Wind/ray/sound and browser math preview services. */
export class CameraEventPreview {
 private candidates:CameraEventCandidate[]=[];private event?:Uint8Array;private candidate?:CameraEventCandidate;private keys=new Map<number,Uint8Array>();private barn=new Uint8Array(32);private running=false;private lastTime?:number;private positionShake:number[]|null=null;
 constructor(private whisker:WhiskerShakeState,private shakePhysical?:()=>Uint8Array){}
 configure(nodes:ObjectNode[]){this.clear();this.candidates=cameraEventCandidates(nodes);for(const c of this.candidates)for(const id of c.targets){if(this.keys.has(id))continue;const bytes=new Uint8Array(0x90);for(const field of nodes[id].fields){const offset=({transform:0x10,idleShakeForce:0x78,movingShakeForce:0x7c,shakeSpeedMult:0x80} as Record<string,number>)[field.name];if(offset!==undefined){const raw=Uint8Array.from(field.raw.match(/../g)!.map(v=>parseInt(v,16)));if(offset+raw.length<=bytes.length)bytes.set(raw,offset);}}this.keys.set(id,bytes);}}
 list(){return this.candidates;}
 start(id:number){const c=this.candidates.find(c=>c.id===id);if(!c?.available)throw new Error(c?.reason??'请选择相机事件');this.stop();this.candidate=c;this.event=new Uint8Array(96);constructOriginalEvent(this.event,0);const def=definitions[c.className];c.fields.forEach((field,i)=>this.event!.set(Uint8Array.from(field.raw.match(/../g)!.map(v=>parseInt(v,16))),def.offset+i*4));forwardOriginalEventTransition(this.event,0x30,event=>{if(c.className==='SetCameraShake')startOriginalCameraShake(event);else startOriginalKeyFrameShake(event);});this.running=true;this.lastTime=undefined;}
 update(now:number,paused:boolean){const previous=this.lastTime;this.lastTime=now;if(previous===undefined||paused||!this.running)return;this.step(Math.max(0,(now-previous)/1000));}
 step(delta:number){if(!this.running||!this.event||!this.candidate)return;const event=this.event,c=this.candidate,clock=()=>({delta,multiplier:1,debugScaleEnabled:false,debugScale:1}),start=()=>{startOriginalEvent(event,this.barn,()=>{});this.running=false;};if(c.className==='SetCameraShake')updateOriginalCameraShake(event,{clock,whisker:()=>this.whisker,start});else updateOriginalKeyFrameShake(event,{clock,count:()=>c.targets.length,keyFrame:i=>this.keys.get(c.targets[i])!,start});this.positionShake=this.running&&c.className==='SetCameraShake'&&this.shakePhysical?updateOriginalWhiskerShake(this.whisker.storage,this.shakePhysical(),originalCameraEventStep(clock()),{...previewWhiskerShakeMath,wind:()=>[0,0,0,0],ray:()=>null,sound:()=>{}}).offset:null;}
 snapshot():CameraEventPreviewSnapshot|null{if(!this.event||!this.candidate)return null;const c=this.candidate;return {id:c.id,className:c.className,running:this.running,elapsed:cameraEventRead(this.event,c.className==='SetCameraShake'?0x4c:0x58),weight:c.className==='SetCameraShake'?cameraEventRead(this.whisker.storage,0x380):null,parameters:c.className==='SetCameraShake'?{speed:cameraEventRead(this.whisker.storage,0x378),force:cameraEventRead(this.whisker.storage,0x37c)}:null,positionShake:this.positionShake?.slice()??null,targets:c.targets.map(id=>{const key=this.keys.get(id)!;return {id,idle:cameraEventRead(key,0x78),moving:cameraEventRead(key,0x7c),speed:cameraEventRead(key,0x80)};})};}
 stop(){this.running=false;this.lastTime=undefined;this.positionShake=null;this.whisker.storage.fill(0,0x378,0x384);}
 clear(){this.stop();this.event=undefined;this.candidate=undefined;this.candidates=[];this.keys.clear();this.barn.fill(0);}
}
