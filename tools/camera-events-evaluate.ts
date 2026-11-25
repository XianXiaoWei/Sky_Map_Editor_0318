import {cameraEventWrite,startOriginalCameraShake,startOriginalKeyFrameShake,updateOriginalCameraShake,updateOriginalKeyFrameShake} from '../src/core/camera-events';
import {startOriginalEvent} from '../src/core/event-start-runtime';
export interface CameraEventOracleCase {name:string;h:number[];eventHex:string;cameraHex:string;keysHex:string;barnHex:string;framesHex:string;}
export interface CameraEventOracleFrame {result:number[];eventHex:string;cameraHex:string;keysHex:string;barnHex:string;traceHex:string;}
export function evaluateCameraEventCase(c:CameraEventOracleCase):CameraEventOracleFrame[]{
 const event=Buffer.from(c.eventHex,'hex'),camera={storage:Buffer.from(c.cameraHex,'hex')},keys=Buffer.from(c.keysHex,'hex'),barn=Buffer.from(c.barnHex,'hex'),frames=Buffer.from(c.framesHex,'hex'),rows:CameraEventOracleFrame[]=[];let count=c.h[4];camera.storage.fill(0,0xe8,0xf8);camera.storage.fill(0,0x378,0x380);event.fill(0,0x18,0x20);if(c.h[0])event.fill(0,0x38,0x40);
 if(c.h[6]){if(c.h[0])startOriginalKeyFrameShake(event);else startOriginalCameraShake(event);}
 for(let frame=0;frame<c.h[1];frame++){
  const trace:Buffer[]=[],record=(code:number,arg:number)=>{const b=Buffer.alloc(24);b.writeUInt32LE(code);b.writeUInt32LE(arg,4);trace.push(b);},fail=(line:number)=>{record(9,line);throw new Error(`Original assertion ${line}`);};
  const clock=()=>({delta:frames.readFloatLE(frame*16),multiplier:frames.readFloatLE(frame*16+4),debugScale:frames.readFloatLE(frame*16+8),debugScaleEnabled:frames.readFloatLE(frame*16+12)!==0}),start=()=>startOriginalEvent(event,barn,()=>{throw new Error('Unexpected null EventBarn');});let failed=false;
  try{if(c.h[0])updateOriginalKeyFrameShake(event,{clock,count:()=>count,keyFrame:index=>{record(2,index);if(c.h[7]===1&&index===0){cameraEventWrite(event,0x40,-2.5);count=1;}if(c.h[5]&&index+1===c.h[5])return fail(0x47);return keys.subarray(index*144,(index+1)*144);},start});else updateOriginalCameraShake(event,{clock,whisker:()=>{if(!c.h[2])return fail(0x323);record(1,0);return c.h[3]?camera:null;},start});}catch{failed=true;}
  rows.push({result:[trace.length,+failed,+(!c.h[0]&&camera.storage.subarray(0x378,0x380).equals(event.subarray(0x38,0x40))),count],eventHex:event.toString('hex'),cameraHex:camera.storage.toString('hex'),keysHex:keys.toString('hex'),barnHex:barn.toString('hex'),traceHex:Buffer.concat(trace).toString('hex')});
 }
 return rows;
}
