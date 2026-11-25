/** Original timed camera controls. Scene dispatch, reflected type resolution
 * and the continuous Whisker/CameraGuide effect remain separate dependencies. */
const f=Math.fround;
const view=(b:Uint8Array)=>new DataView(b.buffer,b.byteOffset,b.byteLength);
export const cameraEventRead=(b:Uint8Array,at:number)=>view(b).getFloat32(at,true);
export const cameraEventWrite=(b:Uint8Array,at:number,value:number)=>{const d=view(b);if(Number.isNaN(value))d.setUint32(at,0xffc00000,true);else d.setFloat32(at,value,true);};
// SSE MIN/MAX choose their second operand for unordered/equal comparisons.
const max=(a:number,b:number)=>a>b?a:b,min=(a:number,b:number)=>a<b?a:b;
export interface CameraEventClock {delta:number;multiplier:number;debugScaleEnabled:boolean;debugScale:number;}
export function originalCameraEventStep(c:CameraEventClock):number {
 const scale=c.debugScaleEnabled?f(c.debugScale):1;
 return min(f(.266),max(f(.0001),f(f(scale*f(c.multiplier))*f(c.delta))));
}
export interface WhiskerShakeState {storage:Uint8Array;}
export interface CameraShakeServices {
 clock:()=>CameraEventClock;
 whisker:()=>WhiskerShakeState|null;
 start:()=>void;
}
/** Whole SetCameraShake::OnStart 0x1003a0ec0. */
export function startOriginalCameraShake(event:Uint8Array){cameraEventWrite(event,0x4c,0);}
/** Whole SetCameraShake::Update 0x1003a0ee0, with CameraSystem handle and
 * reflected Whisker cast represented by a supplied lookup. Native copies the
 * paired speed/force float bytes to Whisker+378/+37c, then writes weight+380. */
export function updateOriginalCameraShake(event:Uint8Array,s:CameraShakeServices):void {
 const read=(at:number)=>cameraEventRead(event,at),endOfHold=f(read(0x40)+read(0x48)),total=f(endOfHold+read(0x44)),camera=s.whisker();
 let elapsed=read(0x4c);
 if(camera){
  const fadeIn=read(0x40);let weight:number;
  if(fadeIn>elapsed){const ratio=f(elapsed/fadeIn),safe=fadeIn>f(1e-5)||fadeIn<f(-1e-5)?ratio:1;weight=min(1,max(0,safe));}
  else{const hold=f(fadeIn+read(0x48));if(elapsed>hold){const duration=f(total-hold),ratio=duration>f(1e-5)||duration<f(-1e-5)?f(f(elapsed-hold)/duration):1;weight=f(1-min(1,max(0,ratio)));}else weight=1;}
  cameraEventWrite(camera.storage,0x380,weight);camera.storage.set(event.subarray(0x38,0x40),0x378);
 }
 if(elapsed>total){s.start();elapsed=read(0x4c);}
 cameraEventWrite(event,0x4c,f(elapsed+originalCameraEventStep(s.clock())));
}
export interface CameraKeyFrameShakeServices {
 clock:()=>CameraEventClock;
 count:()=>number;
 keyFrame:(index:number)=>Uint8Array;
 start:()=>void;
}
/** Whole SetCameraKeyFrameShake::OnStart 0x100591d90. */
export function startOriginalKeyFrameShake(event:Uint8Array){cameraEventWrite(event,0x58,0);}
/** Whole SetCameraKeyFrameShake::Update 0x100591da0. Retains unclamped fade
 * weight, the original zero multiplication, reflected-member order and timer
 * rereads after nonempty iteration. */
export function updateOriginalKeyFrameShake(event:Uint8Array,s:CameraKeyFrameShakeServices):void {
 const read=(at:number)=>cameraEventRead(event,at);let elapsed=f(originalCameraEventStep(s.clock())+read(0x58));cameraEventWrite(event,0x58,elapsed);let fadeIn=read(0x4c),weight:number;
 if(fadeIn>elapsed)weight=f(elapsed/fadeIn);
 else{const hold=read(0x50);weight=elapsed>f(fadeIn+hold)?f(f(f(hold+f(fadeIn-elapsed))/read(0x54))+1):1;}
 if(s.count()!==0){const zero=f(f(1-weight)*0);let index=0;do{const key=s.keyFrame(index);for(const [src,dst] of [[0x40,0x78],[0x44,0x7c],[0x48,0x80]])cameraEventWrite(key,dst,f(zero+f(weight*read(src))));index++;}while(index<(s.count()>>>0));fadeIn=read(0x4c);elapsed=read(0x58);}
 const total=f(f(fadeIn+read(0x50))+read(0x54));if(elapsed>=total)s.start();
}
