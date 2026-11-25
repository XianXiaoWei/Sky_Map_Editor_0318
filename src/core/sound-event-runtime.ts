import {divideNumericFloat} from './object-numeric-runtime';
/** Explicit original SoundManager/handle virtual services. Their real FMOD
 * implementation and lifetime are not replaced by guessed HTML audio. */
export interface OriginalSoundHandle {
 id():bigint;
 playing():boolean;
 description():{playing():boolean};
 stop(immediate:boolean):void;
 parameters(packet:Uint8Array):void;
}
export interface PlaySound2DState {
 launched:boolean;
 handle:OriginalSoundHandle|null;
 handleId:bigint;
 sound:string;
 volumeBits:number;
 mixChannel:number;
 gameTime:Uint8Array|null;
}
export interface PlaySound2DServices {
 play(sound:string,options:Uint8Array,parameters:Uint8Array):{handle:OriginalSoundHandle|null;id:bigint};
 startEvent():void;
}
function validHandle(state:PlaySound2DState):boolean {
 const handle=state.handle,id=state.handleId;
 return handle!==null&&id!==0n&&handle.id()===id;
}
/** Original OnResumeEnabled 0x1005343d0: stop only a live matching handle,
 * then always start the Event; the launched flag and handle are retained. */
export function resumePlaySound2D(state:PlaySound2DState,startEvent:()=>void):void {
 if(validHandle(state))state.handle!.stop(false);
 startEvent();
}
/** Complete original 0x100534410 driver, with resource/handle/time services
 * supplied explicitly. Captures original packed request and parameter bytes.
 * No original constructor, actual GameTime or FMOD playback is implied.
 */
export function updatePlaySound2D(state:PlaySound2DState,services:PlaySound2DServices):void {
 if(!state.launched){
  const options=new Uint8Array(128),v=new DataView(options.buffer);
  v.setUint32(0,state.volumeBits,true);v.setUint32(0x6c,state.mixChannel,true);v.setUint32(0x70,0x40011,true);
  const created=services.play(state.sound,options,new Uint8Array(0x1b0));
  state.handle=created.handle;state.handleId=created.id;state.launched=true;
 }
 if(!state.gameTime||!validHandle(state)||!state.handle!.playing()||!validHandle(state)||!state.handle!.description().playing()){
  services.startEvent();return;
 }
 const time=state.gameTime,v=new DataView(time.buffer,time.byteOffset,time.byteLength);
 const absolute=v.getUint32(0x108c,true),scale=v.getUint32(0x18,true);
 const parameters=new Uint8Array(0x1b0),p=new DataView(parameters.buffer);
 p.setUint16(0,0x7475,true);p.setUint32(0x20,absolute,true);p.setUint32(0x24,divideNumericFloat(absolute,scale),true);
 p.setUint32(0x1a0,3,true);p.setUint32(0x1ac,2,true);
 // The original verifies the handle again after constructing parameters.
 if(validHandle(state))state.handle!.parameters(parameters);
}
