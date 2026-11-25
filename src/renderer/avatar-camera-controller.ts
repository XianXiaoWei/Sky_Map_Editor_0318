import * as THREE from 'three';
import {initializeOriginalWhisker} from '../core/avatar-camera';
/** Separate Avatar camera and input state. Initial pose follows the recovered
 * Whisker reset; pointer look/zoom remain editor preview input, not TouchInput. */
export class AvatarCameraController {
 readonly camera=new THREE.PerspectiveCamera(60,1,.1,64000);readonly target=new THREE.Vector3();enabled=false;
 readonly shakeState={storage:new Uint8Array(1024)};
 private shakeOffset=new THREE.Vector3();
 private yaw=0;private pitch=.15;private distance=3;private drag?:{id:number;x:number;y:number};
 constructor(canvas:HTMLCanvasElement){
  canvas.addEventListener('pointerdown',e=>{if(!this.enabled||![1,2].includes(e.button))return;e.preventDefault();this.drag={id:e.pointerId,x:e.clientX,y:e.clientY};canvas.setPointerCapture(e.pointerId);});
  canvas.addEventListener('pointermove',e=>{if(!this.enabled||this.drag?.id!==e.pointerId)return;this.yaw-=(e.clientX-this.drag.x)*.004;this.pitch=THREE.MathUtils.clamp(this.pitch+(e.clientY-this.drag.y)*.004,-1.2,1.2);this.drag={id:e.pointerId,x:e.clientX,y:e.clientY};this.place();});
  const release=()=>{this.drag=undefined;};canvas.addEventListener('pointerup',release);canvas.addEventListener('pointercancel',release);window.addEventListener('blur',release);
  canvas.addEventListener('wheel',e=>{if(!this.enabled)return;e.preventDefault();this.distance=THREE.MathUtils.clamp(this.distance*Math.exp(e.deltaY*.001),.5,20);this.place();},{passive:false});
 }
 reset(position:number[],euler:number[]=[0,0,0,0]){
  this.shakeOffset.set(0,0,0);
  const bytes=this.shakeState.storage,f=Math.fround;
  // Explicit preview session services. The full native reset is recovered,
  // but the final CameraSystem basis/projection and TouchInput remain pending.
  initializeOriginalWhisker(bytes,{ready:()=>true,position:()=>[...position.slice(0,3).map(f),1],euler:()=>euler,tick:()=>0,runtimeWord:0,sincos:a=>[f(Math.sin(a)),f(Math.cos(a)),0,0],atan2:(y,x)=>f(Math.atan2(y,x)),asin:v=>f(Math.asin(v))});
  const d=new DataView(bytes.buffer),xyz=(at:number)=>Array.from({length:3},(_,i)=>d.getFloat32(at+i*4,true));this.target.fromArray(xyz(0x260));this.camera.position.fromArray(xyz(0x60));this.camera.lookAt(this.target);this.camera.updateMatrixWorld();
  const offset=this.camera.position.clone().sub(this.target);this.distance=offset.length();this.yaw=Math.atan2(offset.x,offset.z);this.pitch=Math.asin(offset.y/this.distance);this.drag=undefined;
 }
 /** Remove last frame's shake before movement/follow updates, then add the
  * recovered world-space position offset without accumulating camera drift. */
 clearShake(){this.camera.position.sub(this.shakeOffset);this.shakeOffset.set(0,0,0);this.camera.updateMatrixWorld();}
 applyShake(offset:number[]|null){this.clearShake();if(offset){this.shakeOffset.fromArray(offset);this.camera.position.add(this.shakeOffset);this.camera.updateMatrixWorld();}}
 lookTouch(x:number,y:number){if(!this.enabled)return;this.yaw-=x;this.pitch=THREE.MathUtils.clamp(this.pitch+y,-1.2,1.2);this.place();}
 zoomTouch(factor:number){if(!this.enabled)return;this.distance=THREE.MathUtils.clamp(this.distance*factor,.5,20);this.place();}
 private place(){this.shakeOffset.set(0,0,0);this.camera.position.set(Math.sin(this.yaw)*Math.cos(this.pitch),Math.sin(this.pitch),Math.cos(this.yaw)*Math.cos(this.pitch)).multiplyScalar(this.distance).add(this.target);this.camera.lookAt(this.target);this.camera.updateMatrixWorld();}
}
