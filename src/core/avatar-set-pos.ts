import {startOriginalEvent} from './event-start-runtime';

const f=Math.fround;
export type AvatarVector=number[];
export interface AvatarState {storage:Uint8Array;}
export interface PositionedAvatar {state:AvatarState; canSetPosition:boolean; handhold:unknown; groundExtent:number;}
export interface AvatarMarker {position:AvatarVector; quaternion:AvatarVector;}
export interface AvatarSetPosFields {marker:AvatarMarker; relMarker:AvatarMarker|null; setLevelStartPosition:boolean; randomGroundInMarker:boolean; breakHandHold:boolean; killMomentum:boolean; onGround:boolean;}
export interface AvatarPositionServices {
 group:(handhold:unknown)=>unknown;
 member:(group:unknown,handhold:unknown)=>boolean;
 peers:(handhold:unknown)=>PositionedAvatar[];
 setState:(state:AvatarState,position:AvatarVector,immediate:boolean)=>void;
}
export interface AvatarSetPosServices {
 barn:()=>{avatars:(PositionedAvatar|null)[];moved:boolean}|null;
 override:(index:number)=>boolean;
 breakHandHold:(handhold:unknown)=>void;
 matrix:(marker:AvatarMarker,bounds:boolean)=>number[];
 inverse:(matrix:number[])=>number[];
 product:(a:number[],b:number[])=>number[];
 setPosition:(avatar:PositionedAvatar,position:AvatarVector,immediate:boolean)=>void;
 rand:()=>number;
 segment:(start:AvatarVector,end:AvatarVector,bounds:number[])=>AvatarVector|null;
 raycast:(start:AvatarVector,direction:AvatarVector,length:number,filtered:boolean)=>{position:AvatarVector;normal:AvatarVector;groundAttribute:number}|null;
 atan2:(y:number,x:number)=>number;
 asin:(value:number)=>number;
 acos:(value:number)=>number;
 logPosition:(position:AvatarVector)=>void;
 start:()=>void;
}
export function avatarRead(state:AvatarState,offset:number):number[]{const v=new DataView(state.storage.buffer,state.storage.byteOffset,state.storage.byteLength);return Array.from({length:4},(_,i)=>v.getFloat32(offset+i*4,true));}
export function avatarWrite(state:AvatarState,offset:number,value:number[]):void {const v=new DataView(state.storage.buffer,state.storage.byteOffset,state.storage.byteLength);value.forEach((n,i)=>v.setFloat32(offset+i*4,n,true));}
/** AvatarBarn::FindLocalAvatar 0x1000ff210: first of 16 active, local bodies.
 * The supplied slots have already had both original selection bytes checked. */
export function findLocalAvatar(slots:(PositionedAvatar|null)[]):PositionedAvatar|null {for(let i=0;i<16;i++)if(slots[i])return slots[i];return null;}
/** Whole AvatarBarn readiness gate 0x1000fe060. Leader lookup/availability
 * remain explicit handhold services, separate from position-group lookup. */
export function isOriginalAvatarReady(barn:{avatars:(PositionedAvatar|null)[];moved:boolean},s:{group:(handhold:unknown)=>unknown;leader:(group:unknown)=>unknown|null;leaderReady:(leader:unknown)=>boolean}):boolean {
 const local=findLocalAvatar(barn.avatars);if(!local||!barn.moved)return false;const leader=s.leader(s.group(local.handhold));return leader===null||s.leaderReady(leader);
}
/** Avatar::SetPosition 0x100100fb0. Group lookup, membership and peers remain
 * runtime services; recovered low-level setters are in avatar-physical-state. */
export function setOriginalAvatarPosition(avatar:PositionedAvatar,position:AvatarVector,immediate:boolean,s:AvatarPositionServices):void {
 const handhold=avatar.handhold;
 if(!s.member(s.group(handhold),handhold)&&!avatar.canSetPosition)return;
 const state=avatar.state,old=avatarRead(state,0x10),delta=position.map((n,i)=>f(n-old[i]));
 s.setState(state,position,immediate);
 const nextHandhold=avatar.handhold;
 if(s.member(s.group(nextHandhold),nextHandhold))for(const peer of s.peers(avatar.handhold)){
  const peerState=peer.state,p=avatarRead(peerState,0x10);s.setState(peerState,p.map((n,i)=>f(n+delta[i])),immediate);
 }
}
function norm(v:number[]):number[]{const squares=v.slice(0,3).map(n=>f(n*n)),length=f(Math.sqrt(f(f(squares[0]+squares[1])+squares[2])));return length>f(1e-5)?v.map((n,i)=>i<3?f(n/length):n):v;}
/** Marker direction 0x10043d900, XYZ lanes. The unused SIMD scratch W is
 * deliberately excluded; Euler consumes only XYZ. Quaternions are not normalized. */
export function avatarMarkerForward(q:number[]):number[]{const [x,y,z,w]=q.map(f),xx=f(x+x),yy=f(y+y),zz=f(z+z);return norm([-f(f(x*zz)+f(w*yy)),-f(f(y*zz)-f(w*xx)),-f(f(1-f(x*xx))-f(y*yy)),0]);}
/** Direction to Euler 0x100146d00, preserving destination W. Float libm
 * calls are supplied, so native captures can be replayed without claiming macOS libm parity. */
export function avatarEuler(forward:number[],right:number[],up:number[],w:number,s:Pick<AvatarSetPosServices,'atan2'|'asin'>):number[]{
 const lengths=right.slice(0,3).map(n=>f(n*n)),length=f(Math.sqrt(f(f(lengths[0]+lengths[1])+lengths[2])));
 const r=length===0?[f(f(forward[1]*up[2])-f(forward[2]*up[1])),f(f(forward[2]*up[0])-f(forward[0]*up[2])),f(f(forward[0]*up[1])-f(forward[1]*up[0]))]:right;
 return [f(s.atan2(forward[0],forward[2])),f(s.asin(Math.min(1,Math.max(-1,forward[1])))),f(s.atan2(-r[1],up[1])),w];
}
function transform(m:number[],p:number[],position:boolean):number[]{return Array.from({length:4},(_,i)=>{const xy=f(f(m[i]*p[0])+f(m[4+i]*p[1])),xyz=f(xy+f(m[8+i]*p[2]));return position?f(xyz+m[12+i]):xyz;});}
/** Whole AvatarSetPos::Update control/float chain 0x100149c40 with explicit
 * Marker matrices/inverse/product, collision, handhold, libm and logging services.
 * This does not choose startup events or construct a complete Avatar runtime. */
export function updateOriginalAvatarSetPos(fields:AvatarSetPosFields,s:AvatarSetPosServices):'no-avatar'|'overridden'|'positioned' {
 const barn=s.barn();if(!barn||!findLocalAvatar(barn.avatars))return 'no-avatar';
 if(fields.setLevelStartPosition)for(let i=0;i<4;i++)if(s.override(i)){s.start();return 'overridden';}
 const avatar=findLocalAvatar(s.barn()!.avatars);if(!avatar)throw new Error('AvatarBarn.cpp:1526: avatar');
 const state=avatar.state;
 if(fields.breakHandHold)s.breakHandHold(avatar.handhold);
 if(fields.killMomentum)avatarWrite(avatar.state,0x50,[0,0,0,0]);
 let euler:number[];
 if(fields.relMarker){
  const world=s.matrix(fields.marker,false),relative=s.matrix(fields.relMarker,false),matrix=s.product(world,s.inverse(relative));
  s.setPosition(avatar,transform(matrix,avatarRead(state,0x10),true),false);
  euler=avatarEuler(transform(matrix,avatarRead(state,0x60),false),[0,0,0,0],[0,1,0,0],relative[3],s);
 }else{
  let position=fields.marker.position.slice();const bounds=s.product(s.matrix(fields.marker,false),s.matrix(fields.marker,true));
  // The Euler destination aliases the local bounds matrix / ray hit buffer.
  let eulerW=bounds[3];
  if(fields.randomGroundInMarker){
   for(let attempt=0;attempt<1000;attempt++){
    const random=Array.from({length:3},()=>f(f(f(s.rand())*2**-31)*2-1)),start=transform(bounds,random,true),end=start.map((n,i)=>i===1?f(n-9999):n),segment=s.segment(start,end,bounds);
    if(!segment)continue;
    const hit=s.raycast(start,[-0,-1,-0,0],f(start[1]-segment[1]),true);if(!hit)continue;eulerW=hit.position[3];
    if(hit.groundAttribute>f(.99))continue;
    const normal=norm(hit.normal);const angle=f(s.acos(Math.min(1,Math.max(-1,normal[1]))));
    if(!(angle<f(.87266463)))continue;position=hit.position.slice();break;
   }
  }else if(fields.onGround){
   const hit=s.raycast(fields.marker.position,[-0,-1,-0,0],f(fields.marker.position[1]+avatar.groundExtent),false);
   if(hit){eulerW=hit.position[3];if(!(hit.groundAttribute>f(.99)))position=hit.position.slice();}
  }else position=fields.marker.position.slice();
  s.setPosition(avatar,position,false);
  euler=avatarEuler(avatarMarkerForward(fields.marker.quaternion),[0,0,0,0],[0,1,0,0],eulerW,s);
  avatarWrite(state,0x30,euler);avatarWrite(state,0x40,euler);state.storage[0x121]=1;s.logPosition(position);
 }
 if(fields.relMarker){avatarWrite(state,0x30,euler);avatarWrite(state,0x40,euler);state.storage[0x121]=1;}
 s.barn()!.moved=true;s.start();return 'positioned';
}
export function avatarSetPosStart(event:Uint8Array,barn:Uint8Array|null,log:(message:string)=>void):void {startOriginalEvent(event,barn,log);}
