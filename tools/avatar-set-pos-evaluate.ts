import {avatarRead,avatarWrite,setOriginalAvatarPosition,updateOriginalAvatarSetPos,avatarSetPosStart,isOriginalAvatarReady,type PositionedAvatar,type AvatarSetPosFields,type AvatarState} from '../src/core/avatar-set-pos';
import {setOriginalPhysicalPosition,setOriginalPhysicalPositionImmediate,AVATAR_PHYSICAL_STATE_BYTES} from '../src/core/avatar-physical-state';
import {initializeOriginalWhisker,resetOriginalWhisker,originalAvatarForwardBytes} from '../src/core/avatar-camera';
export interface AvatarOracleCase {name:string;h:number[];eventHex:string;statesHex:string;input:number[];hit:number[];inputHex?:string;hitHex?:string;physical?:number[];axisHex?:string;cameraHex?:string;}
export interface AvatarOracleExpected {result:number[];eventHex:string;statesHex:string;traceHex:string;cameraHex?:string;}
export function evaluateAvatarCase(c:AvatarOracleCase,expected:AvatarOracleExpected){
 const decode=(hex:string)=>{const bytes=Buffer.from(hex,'hex');return Array.from({length:bytes.length/4},(_,i)=>bytes.readFloatLE(i*4));};
 // JSON numbers erase the sign of zero; the fixture's input bytes are authoritative.
 c={...c,input:c.inputHex?decode(c.inputHex):c.input,hit:c.hitHex?decode(c.hitHex):c.hit};
 const stateBytes=c.physical?AVATAR_PHYSICAL_STATE_BYTES:320,event=Buffer.from(c.eventHex,'hex'),bytes=Buffer.from(c.statesHex,'hex'),states:AvatarState[]=[{storage:bytes.subarray(0,stateBytes)},{storage:bytes.subarray(stateBytes)}],camera=c.cameraHex?Buffer.from(c.cameraHex,'hex'):undefined,physicalContext={offsetAxis:c.axisHex?decode(c.axisHex):[]};
 const avatar:PositionedAvatar={state:states[0],canSetPosition:!!c.h[4],handhold:0,groundExtent:2.5},peer:PositionedAvatar={...avatar,state:states[1]},barn={avatars:Array.from({length:16},(_,i)=>i===c.h[1]&&c.h[4]?avatar:null),moved:!!c.physical?.[4]},eventBarn=Buffer.alloc(32);eventBarn.writeUInt32LE(0xfffffffe,0x10);
 const trace:Buffer[]=[],record=(code:number,arg=0,values:number[]=[])=>{const b=Buffer.alloc(136);b.writeUInt32LE(code);b.writeUInt32LE(arg,4);values.forEach((n,i)=>b.writeFloatLE(n,8+i*4));trace.push(b);};let randoms=0,attempts=0;
 const captures=Buffer.from(expected.traceHex,'hex');
 const libm=(code:number,args:number[])=>{const at=trace.length*136;if(captures.readUInt32LE(at)!==code)throw new Error(`${c.name}: unexpected math service at ${trace.length}`);const result=captures.readFloatLE(at+8+args.length*4);record(code,0,[...args,result]);return result;};
 const positionServices={group:()=>{record(1);return 0;},member:()=>{record(2);return !!c.h[5];},peers:()=>{record(17);return c.h[11]?[peer]:[];},setState:(state:AvatarState,p:number[],immediate:boolean)=>{if(c.physical){if(immediate)setOriginalPhysicalPositionImmediate(state,p,physicalContext);else setOriginalPhysicalPosition(state,p,true,physicalContext);}else{record(immediate?16:3,state===states[1]?1:0,p);avatarWrite(state,0x10,p);}}};
 const sincos=(angle:number)=>{const at=trace.length*136;if(captures.readUInt32LE(at)!==21)throw new Error(`${c.name}: unexpected sincos service`);const result=Array.from({length:4},(_,i)=>captures.readFloatLE(at+12+i*4));record(21,0,[angle,...result]);return result;};
 const marker={position:c.input.slice(0,4),quaternion:c.input.slice(4,8)},relative={position:[0,0,0,1],quaternion:[0,0,0,1]};
 const fields:AvatarSetPosFields={marker,relMarker:c.h[3]?relative:null,setLevelStartPosition:!!event[0x48],randomGroundInMarker:!!event[0x49],breakHandHold:!!event[0x4a],killMomentum:!!event[0x4b],onGround:!!event[0x4c]};
 if(c.h[0]===1)setOriginalAvatarPosition(avatar,c.input.slice(0,4),!!c.h[10],positionServices);
 else if(c.h[0]===2)setOriginalPhysicalPosition(states[0],c.h[9]?states[0].storage.subarray(c.h[9]-1,c.h[9]+15):c.input.slice(0,4),!!c.h[10],physicalContext);
 else if(c.h[0]===3)setOriginalPhysicalPositionImmediate(states[0],c.h[9]?states[0].storage.subarray(c.h[9]-1,c.h[9]+15):c.input.slice(0,4),physicalContext);
 else if(c.h[0]===4)camera!.set(originalAvatarForwardBytes(c.input.slice(0,4),{sincos}));
 else updateOriginalAvatarSetPos(fields,{
  barn:()=>c.h[1]===17?null:barn,override:i=>!!(c.h[2]>>i&1),breakHandHold:()=>{record(4);if(c.h[6])avatar.state=states[1];},
  matrix:(m,bounds)=>{const which=bounds?2:m===relative?1:0;record(5,which);return c.input.slice(which===1?40:which===2?24:8,which===1?56:which===2?40:24);},
  inverse:m=>{record(6,0,m);return c.input.slice(56,72);},product:(a,b)=>{record(7,0,[...a,...b]);return c.input.slice(72,88);},
  setPosition:(a,p,immediate)=>setOriginalAvatarPosition(a,p,immediate,positionServices),rand:()=>((randoms++*1234567+0x318)&0x7fffffff),
  segment:(start,end,m)=>{record(8,0,[...start,...end,...m]);attempts++;return c.h[8]===0||attempts<=c.h[7]?null:start.map((n,i)=>i===1?Math.fround(n-5):n);},
  raycast:(start,dir,length,filtered)=>{record(9,+filtered,[...start,...dir,length]);if(c.h[8]===1)return null;record(10,0x50);return {position:c.hit.slice(0,4),normal:c.hit.slice(4,8),groundAttribute:c.hit[8]};},
  atan2:(y,x)=>libm(11,[y,x]),asin:v=>libm(12,[v]),acos:v=>libm(13,[v]),
  logPosition:p=>{record(14);p.slice(0,3).forEach(v=>record(15,0,[v]));},start:()=>avatarSetPosStart(event,eventBarn,()=>{throw new Error('Unexpected null EventBarn');})
 });
 if(c.physical?.[1]&&c.h[1]!==17){const services={ready:()=>isOriginalAvatarReady(barn,{group:()=>{record(18);return 0;},leader:()=>{record(19);return c.physical![0]?0:null;},leaderReady:()=>{record(20);return c.physical![0]===1;}}),position:()=>avatarRead(avatar.state,0x10),euler:()=>avatarRead(avatar.state,0x40),tick:()=>c.physical![2],runtimeWord:c.physical[3],sincos,atan2:(y:number,x:number)=>libm(11,[y,x]),asin:(v:number)=>libm(12,[v])};if(c.physical[1]===1)initializeOriginalWhisker(camera!,services);else resetOriginalWhisker(camera!,services);}
 event.fill(0,0x18,0x20);event.fill(0,0x38,0x48);
 return {result:[trace.length,randoms,attempts,+barn.moved,eventBarn.readUInt32LE(0x10)],eventHex:event.toString('hex'),statesHex:bytes.toString('hex'),traceHex:Buffer.concat(trace).toString('hex'),...(camera?{cameraHex:camera.toString('hex')}:{})};
}
