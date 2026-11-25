import {avatarRead,avatarWrite,type AvatarState} from './avatar-set-pos';

const f=Math.fround;
export const AVATAR_PHYSICAL_STATE_BYTES=0xd00;
/** Runtime global 0x1020041f0. Its construction and state+e4 owner are
 * not recovered defaults; callers must supply both in their state/context. */
export interface AvatarPhysicalContext {offsetAxis:number[];}
export type AvatarPositionInput=number[]|Uint8Array;
function readInput(p:AvatarPositionInput):number[]{
 if(p instanceof Uint8Array){const d=new DataView(p.buffer,p.byteOffset,p.byteLength);return Array.from({length:4},(_,i)=>d.getFloat32(i*4,true));}
 return p.slice(0,4).map(f);
}
function clear(s:AvatarState){s.storage[0xbc8]=0;s.storage.fill(0,0,8);s.storage[0xc60]=0;}
function offset(s:AvatarState,c:AvatarPhysicalContext):number[]{
 const scale=new DataView(s.storage.buffer,s.storage.byteOffset,s.storage.byteLength).getFloat32(0xe4,true),n=-f(scale*f(.07));
 // vpermilps 0xc0 broadcasts the scalar to XYZ but retains the -0 W lane.
 return c.offsetAxis.map((v,i)=>f((i===3?-0:n)*f(v)));
}
/** Whole regular physical position setter 0x100146de0. reset=true is the
 * original SetPosition regular path: lift desired Y by float32(.01), clear
 * overlapping bytes ba4..bb1 and write the corrected physical position. */
export function setOriginalPhysicalPosition(s:AvatarState,p:AvatarPositionInput,reset:boolean,c:AvatarPhysicalContext):void {
 if(s.storage.length<0xc90)throw new RangeError('Avatar physical state requires at least 0xc90 bytes');
 clear(s);const desired=readInput(p);avatarWrite(s,0x130,desired);const o=offset(s,c);
 let physical=desired.map((n,i)=>f(n-o[i]));avatarWrite(s,0x10,physical);avatarWrite(s,0x20,physical);avatarWrite(s,0x50,[0,0,0,0]);
 if(reset){const next=avatarRead(s,0x130);next[1]=f(desired[1]+f(.01));avatarWrite(s,0x130,next);physical=next.map((n,i)=>f(n-o[i]));avatarWrite(s,0x10,physical);avatarWrite(s,0x20,physical);s.storage.fill(0,0xba4,0xbb2);avatarWrite(s,0x50,[0,0,0,0]);}
 s.storage.fill(0,0xc70,0xc74);s.storage[0x120]=1;avatarWrite(s,0xc80,physical);
}
/** Whole immediate physical position setter 0x1001480d0. Input reads retain
 * native ordering, including an input view aliased into the state buffer. */
export function setOriginalPhysicalPositionImmediate(s:AvatarState,p:AvatarPositionInput,c:AvatarPhysicalContext):void {
 if(s.storage.length<0xc90)throw new RangeError('Avatar physical state requires at least 0xc90 bytes');
 clear(s);const first=readInput(p);avatarWrite(s,0x10,first);avatarWrite(s,0x20,readInput(p));const o=offset(s,c),next=readInput(p).map((n,i)=>f(n+o[i]));avatarWrite(s,0x130,next);avatarWrite(s,0x50,[0,0,0,0]);s.storage.fill(0,0xc70,0xc74);s.storage[0x120]=1;avatarWrite(s,0xc80,first);
}
